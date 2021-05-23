from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from rest_framework.permissions import IsAuthenticated 
from asgiref.sync import async_to_sync
from channels.layers import get_channel_layer
from background_task import background
import subprocess

from django.shortcuts import render,redirect
from django.contrib.auth.hashers import check_password
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.auth import authenticate, login,logout
from django.contrib.auth.models import User
from django.contrib.sessions.models import Session
from django.utils import timezone
from .models import *
from django.http import HttpResponse,JsonResponse
import json
import xlsxwriter
import datetime

############################SERVER########################################
def logout_server(request):
    logout(request)
    return redirect('login_server')

def login_server(request):
    if request.user.is_authenticated:
        return redirect('info')
    return render(request, "login.html", {})

def info(request):
    if not request.user.is_authenticated:
        username=request.POST['username']
        password=request.POST['password']
        print(username,password)
        user = authenticate(request, username=username, password=password)
        if user is None:
            return redirect('login_server')
        login(request, user)
    print(request.user.username)
    f=Forest_employee.objects.get(user=request.user)
    request.session['data']={'area':f.area,'empid':f.empid,'role':f.role}
    request.session['flag']=f.role
    print(f.role,"this is role")
    if f.role=="admin":
        return redirect('admin')
    else:
        return redirect('forest_employee')

def admin(request):
    animals=[]
    sdict={}
    slat={}
    slon={}
    x=Animal.objects.all()
    for y in x:
        animals.append(y.animal_info)
    animals=list(set(animals))
    for atype in animals:
        sdict[atype]=[]
        slat[atype]=[]
        slon[atype]=[]
        a=Animal.objects.filter(animal_info=atype)
        for i in a:
            sdict[atype].append(i.animal_id)
            slat[atype].append(i.latitude[-1])
            slon[atype].append(i.longitude[-1])
    print(sdict,slat,slon)
    return render(request,"admin.html",{"animals":animals,"sdict":sdict,"slat":slat,"slon":slon})
    # return render(request,"admin.html",{}) 

def forest_employee(request):
    data=request.session.get('data')
    print(data)
    animals=[]
    sdict={}
    slat={}
    slon={}
    x=Animal.objects.all()
    for y in x:
        animals.append(y.animal_info)
    animals=list(set(animals))
    for atype in animals:
        sdict[atype]=[]
        slat[atype]=[]
        slon[atype]=[]
        a=Animal.objects.filter(animal_info=atype)
        for i in a:
            sdict[atype].append(i.animal_id)
            slat[atype].append(i.latitude[-1])
            slon[atype].append(i.longitude[-1])
    print(sdict,slat,slon)
    return render(request,"forest_employee.html",{"animals":animals,"sdict":sdict,"slat":slat,"slon":slon})
    # return render(request,"forest_employee.html",{}) 

def addforest_employee(request):
    if request.method == 'POST':
        username=request.POST['username']
        password=request.POST['password']
        print(username,password)
        count=Forest_employee.objects.count()
        temp='id-'+(str(count+1))
        create = User.objects.create_user(username,username,password)
        user=Forest_employee.objects.create(user=create,empid=temp,area=request.POST['area'],name=request.POST['name'],role=request.POST['role'],latitude=[0.0],longitude=[0.0])
        return render(request,"done.html",{})  
    return render(request,"register.html",{})

def task(request):
    role=request.session.get('flag')
    info=request.session.get('data')
    area=info['area']
    if role =="admin":
        data=[]
        d=Division_tasks.objects.all()
        r=Range_tasks.objects.all()
        b=Beat_tasks.objects.all()
        for i in d:
            data.append(i)
        for i in r:
            data.append(i)
        for i in b:
            data.append(i)
        w=[]
    elif role == 'division_incharge':
        w=Division_range.objects.filter(division_id=area)
        data=Division_tasks.objects.filter(task_from=area)
    elif role == 'range_incharge':
        lb=Range_beat.objects.filter(range_id=area)
        w=[]
        d1=Range_tasks.objects.filter(task_to=area)## tasks from division to range and not assigned to beat
        d2=Range_tasks.objects.filter(task_from=area) ##tasks assigned to beat from range
        data=[]
        for i in d1:
            data.append(i)
        for i in d2:
            data.append(i)
        
        ##w=workers range officer will assign to this workers
        for i in lb:
            beat_id=i.beat_id
            w.append(beat_id)

    elif role == 'beat_incharge':
        # area=info['area']
        # data=Range_tasks.objects.filter(task_to=area)
        # w=[]
        lb=Beat_employee.objects.filter(beat_id=area)
        w=[]
        d1=Beat_tasks.objects.filter(task_to=area)
        d2=Beat_tasks.objects.filter(task_from=area)
        data=[]
        for i in d1:
            data.append(i)
        for i in d2:
            data.append(i)
        
        ##w=workers range officer will assign to this workers
        for i in lb:
            empid=i.empid
            w.append(Forest_employee.objects.get(empid=empid))

    flag=role
    # print(data,flag,w)
    return render(request,"task.html",{'data':data,'flag':flag,"workers":w})

def addtask(request):
    for key, value in request.session.items():
        print('{} => {}'.format(key, value))
    if request.method == 'POST':
        print(request.POST)
        ## Creating new task
        t=Division_tasks()
        count=Division_tasks.objects.count()
        t.task_id='id_'+(str(count+1))
        t.task_from=request.session.get('data')['area']
        t.task_info=request.POST.get("task_info")
        t.task_name=request.POST.get("task_name")
        t.task_type=request.POST.get("task_type")
        t.task_to=request.POST.get("task_to")
        t.status='assigned'
        t.deadline=request.POST.get("deadline")
        print(t)
        t.save()

        ##Assigning task to range incharge
        t=Range_tasks()
        # count=Tasks.objects.count()
        t.task_id='id_'+(str(count+1))
        t.task_from=request.session.get('data')['area']
        t.task_info=request.POST.get("task_info")
        t.task_name=request.POST.get("task_name")
        t.task_type=request.POST.get("task_type")
        t.task_to=request.POST.get("task_to")
        t.status='incomplete'
        t.deadline=request.POST.get("deadline")
        print(t)
        t.save()
        # form = addtaskform(request.POST or None)
        # if form.is_valid():
        #     form.save()  
        return render(request,"done.html",{})
    
    data=Division_range.objects.filter(division_id=request.session.get('data')['area'])
    range=[]
    for i in data:
        range.append(i.range_id)
    return render(request,"addtask.html",{'range':range})

def assigntask(request):
    if request.method == 'POST':
        print(request.POST)
        x=request.POST['task_to'].split('-')
        ###RANGE OFFICER ASSIGNING TASK TO BEAT OFFICER
        # if x[0]!='r' and x[0]!='d':
        if x[0]=='b':
            print('RANGE OFFICER ASSIGNING TASK TO BEAT OFFICER')
            task=Range_tasks.objects.get(task_id=request.POST['task_id'])
            Range_tasks.objects.filter(task_id=request.POST["task_id"]).update(status="assigned")
            Range_tasks.objects.filter(task_id=request.POST["task_id"]).update(task_to=request.POST['task_to'])
            Range_tasks.objects.filter(task_id=request.POST["task_id"]).update(task_from=task.task_to)
            print(task)
            ta=Beat_tasks()
            ta.task_id=task.task_id
            ta.task_from=task.task_to
            ta.task_info=task.task_info
            ta.task_name=task.task_name
            ta.task_type=task.task_type
            ta.task_to=request.POST['task_to']
            ta.status='incomplete'
            ta.deadline=task.deadline.strftime('%Y-%m-%d')
            ta.save()
            print(ta)

            # t=Range_tasks()
            # t.task_id=task.task_id
            # t.task_from=task.task_to
            # t.task_info=task.task_info
            # t.task_to=request.POST['task_to']
            # t.status='assigned'
            # t.deadline=task.deadline.strftime('%Y-%m-%d')
            # t.save()
            # t.save()
            
        ##Beat incharge assign task to Forest Employee    
        else:
            print('Beat incharge assign task to Forest Employee')
            task=Beat_tasks.objects.get(task_id=request.POST['task_id'])
            Beat_tasks.objects.filter(task_id=request.POST["task_id"]).update(status="assigned")
            Beat_tasks.objects.filter(task_id=request.POST["task_id"]).update(task_to=request.POST['task_to'])
            Beat_tasks.objects.filter(task_id=request.POST["task_id"]).update(task_from=task.task_to)
            print(task)
            ta=Tasks()
            ta.task_id=task.task_id
            ta.task_from=task.task_to
            ta.task_info=task.task_info
            ta.task_name=task.task_name
            ta.task_type=task.task_type
            ta.task_to=request.POST['task_to']
            ta.status='incomplete'
            ta.deadline=task.deadline.strftime('%Y-%m-%d')
            ta.save()
            print(ta)
            
            se={}
            se["type"]="task"
            se["id"]=ta.task_id
            se["task_name"]=ta.task_name
            se["task_type"]=ta.task_type
            se["description"]=ta.task_info
            se["assigning_officer"]=ta.task_to
            se["deadline"]=ta.deadline
            async_to_sync(get_channel_layer().group_send)(
                request.POST['task_to'],
                {
                    'type': 'task_message',
                    'message': json.dumps(se)
                }
            )

            # t=Range_tasks()
            # t.task_id=task.task_id
            # t.task_from=task.task_to
            # t.task_info=task.task_info
            # t.task_to=request.POST['task_to']
            # t.status='assigned'
            # t.deadline=task.deadline.strftime('%Y-%m-%d')
            # t.save()
        # elif x[0]=='r':
        #     task=Range_tasks.objects.get(task_id=request.POST['task_id'])
        #     Range_tasks.objects.filter(task_id=request.POST["task_id"]).update(status="assigned")
        #     t=Tasks()
        #     t.task_id=task.task_id
        #     t.task_from=task.task_to
        #     t.task_info=task.task_info
        #     t.task_to=request.POST['task_to']
        #     t.status='assigned'
        #     t.deadline=task.deadline.strftime('%Y-%m-%d')
        #     t.save()
    return HttpResponse(status=200)

def addanimal(request):
    if request.method == 'POST':
        # print((request.POST['animal_id']))
        a=Animal()
        count=Animal.objects.count()
        # print(count)
        a.animal_id='id_'+(str(count+1))
        a.animal_name=request.POST['animal_name']
        a.animal_info=request.POST['animal_info']
        a.latitude=[0]
        a.longitude=[0]
        a.save()
        return render(request,"done.html",{})  
    return render(request,"addanimal.html",{})

def addcamera(request):
    if request.method == 'POST': 
        c=Camera()
        count=Camera.objects.count()
        c.camera_id='id_'+(str(count+1))
        c.beat_id=request.POST['beat_id']
        c.range_id=request.POST['range_id']
        c.division_id=request.POST['division_id']
        c.latitude=request.POST['latitude']
        c.longitude=request.POST['longitude']
        c.status=request.POST['status']
        c.save()
        return render(request,"done.html",{})
    return render(request,"addcamera.html",{})

def location(request):
    print(request.POST['animals'])
    animals=request.POST['animals'].split("-")
    print("animals id",animals)
    sdict={}
    slat={}
    slon={}
    for a in range(len(animals)-1):
        x=Animal.objects.get(animal_id=animals[a])
        if x.animal_name not in sdict.keys():
            sdict[x.animal_name]=[x.animal_id]
        else:
            sdict[x.animal_name].append(x.animal_id)
        if x.animal_name not in slat.keys():
            slat[x.animal_name]=[x.latitude[-1]]
        else:
            slat[x.animal_name].append(x.latitude[-1])
        if x.animal_name not in slon.keys():
            slon[x.animal_name]=[x.longitude[-1]]
        else:
            slon[x.animal_name].append(x.longitude[-1])

    print(sdict,slat,slon)
    return JsonResponse({"sdict":sdict,"slat":slat,"slon":slon})

def task_description(request):
    tid=request.POST['task_id']
    print(tid)
    ts=Task_Description.objects.get(task_id=tid)
    data={ "task_id":ts.task_id,
            "image":"img",
            "description":ts.description}
    # print(bytes(ts.image))
    
    data['image']=bytes(ts.image).decode("utf-8") 
    
    return HttpResponse(status=200,content=str(json.dumps(data)))

def test(request):
    return render(request,"done.html",{})

def alertmap(request):
    return render(request,"alertmap.html",{})

def stats(request):
    a={}
    a["hunter"]=Logs.objects.filter(action="hunter").count()
    a["sos"]=Sos.objects.filter(action="sos").count()
    a["camera"]=Logs.objects.filter(action="camera").count()

    h={}
    hun=Logs.objects.filter(action="hunter")
    c={}
    for i in hun:
        cam=Camera.objects.get(camera_id=i.camera_id)
        if cam.beat_id in c.keys():
            c[cam.beat_id]+=1
        else:
            c[cam.beat_id]=1
    so=dict(sorted(c.items(), key=lambda item: item[1] ,reverse=True))
    # for i in so.keys():
    #     print(i,so[i])
    h=so

    elephant={}
    ani=Logs.objects.filter(action="elephant")
    c={}
    for i in ani:
        cam=Camera.objects.get(camera_id=i.camera_id)
        if cam.beat_id in c.keys():
            c[cam.beat_id]+=1
        else:
            c[cam.beat_id]=1
    so=dict(sorted(c.items(), key=lambda item: item[1] ,reverse=True))
    # for i in so.keys():
    #     print(i,so[i])
    elephant=so

    macaque={}
    ani=Logs.objects.filter(action="macaque")
    c={}
    for i in ani:
        cam=Camera.objects.get(camera_id=i.camera_id)
        if cam.beat_id in c.keys():
            c[cam.beat_id]+=1
        else:
            c[cam.beat_id]=1
    so=dict(sorted(c.items(), key=lambda item: item[1] ,reverse=True))
    # for i in so.keys():
    #     print(i,so[i])
    macaque=so
    lion={}
    ani=Logs.objects.filter(action="lion")
    c={}
    for i in ani:
        cam=Camera.objects.get(camera_id=i.camera_id)
        if cam.beat_id in c.keys():
            c[cam.beat_id]+=1
        else:
            c[cam.beat_id]=1
    so=dict(sorted(c.items(), key=lambda item: item[1] ,reverse=True))
    # for i in so.keys():
    #     print(i,so[i])
    lion=so
    tiger={}
    ani=Logs.objects.filter(action="tiger")
    c={}
    for i in ani:
        cam=Camera.objects.get(camera_id=i.camera_id)
        if cam.beat_id in c.keys():
            c[cam.beat_id]+=1
        else:
            c[cam.beat_id]=1
    so=dict(sorted(c.items(), key=lambda item: item[1] ,reverse=True))
    # for i in so.keys():
    #     print(i,so[i])
    tiger=so
    civet={}
    ani=Logs.objects.filter(action="civet")
    c={}
    for i in ani:
        cam=Camera.objects.get(camera_id=i.camera_id)
        if cam.beat_id in c.keys():
            c[cam.beat_id]+=1
        else:
            c[cam.beat_id]=1
    so=dict(sorted(c.items(), key=lambda item: item[1] ,reverse=True))
    # for i in so.keys():
    #     print(i,so[i])
    civet=so

    animal={"elephant":elephant,"lion":lion,"tiger":tiger,"macaque":macaque,"civet":civet}

    report={}
    report["animal incident"]=Report.objects.filter(rtype="animal incident").count()
    report["tree fall"]=Report.objects.filter(rtype="tree fall").count()
    report["settlement incident"]=Report.objects.filter(rtype="settlement incident").count()
    report["lost object"]=Report.objects.filter(rtype="lost object").count()
    report["alert report"]=Report.objects.filter(rtype="alert report").count()
    report["other"]=Report.objects.filter(rtype="other").count()

    return render(request,"dashboard.html",{"alert":a,"hunter":h,"animal":animal,"report":report})

def track(request):
    for key, value in request.session.items():
        print('{} => {}'.format(key, value))
    data={}
    arr=[]
    a=Animal.objects.all()
    for i in a:
        arr.append(i.animal_id+"-"+i.animal_name)
        data[i.animal_id+"-"+i.animal_name]=[]
        for j in range(len(i.latitude)):
            temp=[i.longitude[j],i.latitude[j]]
            data[i.animal_id+"-"+i.animal_name].append(temp)
            
    print(data,arr)
    return render(request,"track.html",{'data':data,'arr':arr})

def allotrange(request):
    div_ran=[]
    ar=[]
    d=Division_range.objects.all()
    for i in d:
        ar.append(i.range_id)
        div_ran.append(i.division_id+"#"+i.range_id)
    emp=Forest_employee.objects.all()
    div=[]
    ran=[]
    for i in emp:
        x=i.area.split("-")
        if x[0]=="d":
            div.append(i.area)
        elif x[0]=="r":
            ran.append(i.area)
    ran=list(set(ran)-set(ar))
    print(div_ran)
    return render(request,'allotrange.html',{'div_ran':div_ran,'division':div,'range':ran})

def allotbeat(request):
    ran_beat={}
    d=Range_beat.objects.all()
    for i in d:
        ran_beat[i.range_id]=i.range_id
    beat={}
    r=Range_beat.objects.all()
    for i in r:
        beat[i.range_id]=i.beat_id
    print(ran_beat,beat)
    return render(request,'allotbeat.html',{'ran_beat':ran_beat,'beat':beat})

def reportlist(request):
    main_dict={}
    # rep=Report.objects.all()
    data=request.session.get('data')
    print(data)
    work_id=data['role']
    print(work_id)
    
    if work_id=='admin':
        div={}
        ldivision=Division_range.objects.all()
        #list of all divisions
        for x in ldivision:
            div[x.division_id]={}
            ran={}
            #code for particular division
            lrange=Division_range.objects.filter(division_id=x.division_id)
            #list of ranges in a particular division
            for i in lrange:
                range_id=i.range_id
                #code for particular range
                lbeat=Range_beat.objects.filter(range_id=i.range_id)
                #list of beats in a particular range
                ran[i.range_id]={}
                be={}
                for j in lbeat:
                    beat_id=j.beat_id
                    #code for particular beat
                    employee=Beat_employee.objects.filter(beat_id=beat_id)
                    #list of employees in a particular beat
                    be[beat_id]={}
                    e={}
                    for k in employee:
                        emp=Forest_employee.objects.get(empid=k.empid)
                        reports=Report.objects.filter(empid=(emp.empid+'-'+emp.name))
                        e[k.empid]=[]
                        for l in reports:
                            rep_dic={}
                            rep_dic['rep_id']=l.rid
                            rep_dic['timestamp']=l.timestamp
                            rep_dic['emp_id']=l.empid
                            rep_dic['description']=l.description
                            rep_dic['image']="image"
                            rep_dic['latitude']=l.latitude
                            rep_dic['longitude']=l.longitude
                            e[k.empid].append(rep_dic)
                            # if k.empid in tem_dict[range_id]:
                            #     tem_dict[range_id][k.empid].append(rep_dic)
                            # else:
                            #     tem_dict[range_id][k.empid]=[]
                            #     tem_dict[range_id][k.empid].append(rep_dic)
                    be[j.beat_id]=e
                ran[i.range_id]=be
            div[x.division_id]=ran
        main_dict=div
        
    
    elif work_id=='division_incharge':
        ran={}
        #code for particular division
        lrange=Division_range.objects.filter(division_id=data['area'])
        #list of ranges in a particular division
        for i in lrange:
            range_id=i.range_id
            #code for particular range
            lbeat=Range_beat.objects.filter(range_id=i.range_id)
            #list of beats in a particular range
            ran[i.range_id]={}
            be={}
            for j in lbeat:
                beat_id=j.beat_id
                #code for particular beat
                employee=Beat_employee.objects.filter(beat_id=beat_id)
                #list of employees in a particular beat
                be[beat_id]={}
                e={}
                for k in employee:
                    print(k.empid)
                    emp=Forest_employee.objects.get(empid=k.empid)
                    reports=Report.objects.filter(empid=(emp.empid+'-'+emp.name))
                    e[k.empid]=[]
                    for l in reports:
                        rep_dic={}
                        rep_dic['rep_id']=l.rid
                        rep_dic['timestamp']=l.timestamp
                        rep_dic['emp_id']=l.empid
                        rep_dic['description']=l.description
                        rep_dic['image']="image"
                        rep_dic['latitude']=l.latitude
                        rep_dic['longitude']=l.longitude
                        e[k.empid].append(rep_dic)
                        # if k.empid in tem_dict[range_id]:
                        #     tem_dict[range_id][k.empid].append(rep_dic)
                        # else:
                        #     tem_dict[range_id][k.empid]=[]
                        #     tem_dict[range_id][k.empid].append(rep_dic)
                be[j.beat_id]=e
            ran[i.range_id]=be
        main_dict=ran
    
    
    elif work_id=='range_incharge':
        range_id=data['area']
        lbeat=Range_beat.objects.filter(range_id=i.range_id)
        # list of beats in a particular range
        be={}
        for j in lbeat:
            beat_id=j.beat_id
            #code for particular beat
            employee=Beat_employee.objects.filter(beat_id=beat_id)
            #list of employees in a particular beat
            be[beat_id]={}
            e={}
            for k in employee:
                emp=Forest_employee.objects.get(empid=k.empid)
                reports=Report.objects.filter(empid=(emp.empid+'-'+emp.name))
                e[k.empid]=[]
                for l in reports:
                    rep_dic={}
                    rep_dic['rep_id']=l.rid
                    rep_dic['timestamp']=l.timestamp
                    rep_dic['emp_id']=l.empid
                    rep_dic['description']=l.description
                    rep_dic['image']="image"
                    rep_dic['latitude']=l.latitude
                    rep_dic['longitude']=l.longitude
                    e[k.empid].append(rep_dic)
                    # if k.empid in tem_dict[range_id]:
                    #     tem_dict[range_id][k.empid].append(rep_dic)
                    # else:
                    #     tem_dict[range_id][k.empid]=[]
                    #     tem_dict[range_id][k.empid].append(rep_dic)
            be[j.beat_id]=e
        main_dict=be
    
    
    elif work_id=='beat_incharge':
        beat_id=data['area']
        employee=Beat_employee.objects.filter(beat_id=beat_id)
        #list of employees in a particular beat
        e={}
        for k in employee:
            emp=Forest_employee.objects.get(empid=k.empid)
            reports=Report.objects.filter(empid=(emp.empid+'-'+emp.name))
            e[k.empid]=[]
            for l in reports:
                rep_dic={}
                rep_dic['rep_id']=l.rid
                rep_dic['timestamp']=l.timestamp
                rep_dic['emp_id']=l.empid
                rep_dic['description']=l.description
                rep_dic['image']="image"
                rep_dic['latitude']=l.latitude
                rep_dic['longitude']=l.longitude
                e[k.empid].append(rep_dic)
        main_dict=e
    
            #sort the array
    # print(main_dict,work_id)
    return render(request,"reportlist.html",{"main_dict":main_dict,"flag":{'flag':work_id}})

def reportimage(request):
    rid=request.POST["rid"]
    report=Report.objects.get(rid=rid)
    return JsonResponse({"image":bytes(report.image).decode("utf-8")})
def localreportlist(request):
    r=Local_report.objects.all()
    main_dict=[]
    for lr in r:
        rep_dic={}
        rep_dic['phone']=lr.phone_no
        rep_dic['description']=lr.description
        rep_dic['image']=bytes(lr.image).decode("utf-8") 
        rep_dic['latitude']=lr.latitude
        rep_dic['longitude']=lr.longitude
        main_dict.append(rep_dic)
    return render(request,"localreportlist.html",{"main_dict":main_dict})


def geojson(request):
    data = open('main/static/animal.geojson').read() #opens the json file and saves the raw contents
    data = json.loads(data)
    # data['features']=sorted(data['features'], key=lambda k: k['properties'].get("AREA_SHORT_CODE",0))
    return JsonResponse(data, safe=False)

def getexcelanimal(request):
    workbook = xlsxwriter.Workbook('main/static/data.xlsx')
    worksheet = workbook.add_worksheet()  
    row = 0
    column = 0
    a=Animal.objects.all()
    aid=[]
    atype=[]
    lat=[]
    lon=[]
    for i in a:
        item=i.animal_id
        worksheet.write(row, column, item)
        column+=1
        item=i.animal_info
        worksheet.write(row, column, item)
        column+=1
        for j in range(len(i.latitude)):
            item=i.latitude[j]
            worksheet.write(row, column, item)
            column+=1
            item=i.longitude[j]
            worksheet.write(row, column, item)
            column-=1
            row+=1
        column-=2
    # content = ["ankit", "rahul", "priya", "harshita", 
    #                     "sumit", "neeraj", "shivam"] 

    # for item in content : 
    #     worksheet.write(row, column, item) 
    #     row += 1
        
    workbook.close() 
    
    path = 'main/static/data.xlsx' # this should live elsewhere, definitely
    with open(path, "rb") as excel:
        data = excel.read()

    response = HttpResponse(data,content_type='application/vnd.openxmlformats-officedocument.spreadsheetml.sheet')
    response['Content-Disposition'] = 'attachment; filename=data.xlsx'
    return response


######BACK GROUND TASK########
@background(schedule=2)
def back():
    a=0
    print("in back new","ravi")
    # while(a<10):
    a+=1
    print(a)
    l=[]
    lon={}
    lat={}
    time={}
    c=Camera.objects.all()
    l=set(l)
    
    for i in c:
        l.add(str(i.camera_id))
        lon[str(i.camera_id)]=i.longitude
        lat[str(i.camera_id)]=i.latitude
    s=[]
    temp=Status.objects.all()
    s=set(s)
    now = datetime.datetime.now()
    for i in temp:
        # time[str(i.camera_id)]=i.time
        s.add(str(i.camera_id))
    ans=l-s
    if (len(ans)!=0):
        xyz=list(ans)
        print(time)
        for i in xyz:
            c=Camera.objects.get(camera_id=i)
            l=Logs()
            l.camera_id=c.camera_id
            l.action="camera"
            l.latitude=c.latitude
            l.longitude=c.longitude
            l.time=str(datetime.datetime.now())
            l.save()
            d={}
            d["camera_id"]=c.camera_id
            d["latitude"]=c.latitude
            d["longitude"]=c.longitude
            d["timestamp"]=str(datetime.datetime.now())
            d["type"]="working"
            async_to_sync(get_channel_layer().group_send)(
                'alert',
                {
                    'type': 'alert_message',
                    'message': json.dumps(d)
                }
            )
            
    d=Status.objects.all().delete()

#############################API##########################################

class Login_api(APIView):
    # permission_classes = (IsAuthenticated,) No token required 

    def post(self, request):
        print(request.data)
        username = request.data['email']
        password = request.data['password']
        
        user = authenticate(request, username=username, password=password)
        token, created  = Token.objects.get_or_create(user=user)
        if user is not None:
            login(request, user)
            request.session['data']="Hello "+username
            f=Forest_employee.objects.get(user=user)
            dic={}
            dic['name']=f.name
            dic['designation']=f.role
            dic['beat']=f.area
            dic['empid']=f.empid
            request.session['empid']=f.empid+"-"+f.name
            r=Range_beat.objects.get(beat_id=f.area)
            dic['range']=r.range_id
            d=Division_range.objects.get(range_id=r.range_id)
            dic['division']=d.division_id
            content = {'message': 'Logged in ','token':token.key,'email':True,'password':True,'password_registration':True,'user':dic}
        else:
            # Return an 'invalid login' error message.
            u=User.objects.get(username=username)
            if check_password('forestweb', u.password):
                content = {'message': 'Please register','email':True,'password':False,'password_registration':False,'user':None}
            else:
                content = {'message': 'Not register','email':False,'password':False,'password_registration':False,'user':None}
            # content = {'message': 'Hello, World!'}
        print(content)
        return Response(content)

class Logout_api(APIView):
    def post(self,request):
        
        content = {'message': 'Logged out'}
        
        active_sessions = Session.objects.filter(expire_date__gte=timezone.now())
        user_id_list = []
        for session in active_sessions:
            data = session.get_decoded()
            user_id_list.append(data.get('_auth_user_id', None))
        print(User.objects.filter(id__in=user_id_list))
        #

        print(request.user)
        request.user.auth_token.delete()
        logout(request)
        active_sessions = Session.objects.filter(expire_date__gte=timezone.now())
        user_id_list = []
        for session in active_sessions:
            data = session.get_decoded()
            user_id_list.append(data.get('_auth_user_id', None))
        print(User.objects.filter(id__in=user_id_list))
        return Response("Logged out")

class Register_api(APIView):
    def post(self,request):
        username = request.data['email']
        password = request.data['password']
        # create = User.objects.create_user(username,username,password)
        u=User.objects.get(username=username)
        u.set_password(password)
        u.save()
        print("password changed")
        user = authenticate(request, username=username, password=password)
        if user is not None:
            token, created  = Token.objects.get_or_create(user=user)
            login(request, user)
            content = {'message': 'Registered and Logged in ','token':token.key,'status':True}
        return Response(content)

class Report_api(APIView):
    def post(self,request):
        permission_classes = (IsAuthenticated,)
        r=Report()
        #employee email
        r.rid='id-'+str(Report.objects.count())
        r.timestamp=str(datetime.datetime.now())
        r.empid=request.data['empid']+"-"+request.data['name']
        res = bytes(request.data['image'], 'utf-8')
        r.image=res
        r.rtype=request.data['type']
        r.description=request.data['description']
        r.latitude=request.data['latitude']
        r.longitude=request.data['longitude']
        r.save()
        return Response({"status":True})

class Local_report_api(APIView):
    def post(self,request):
        r=Local_report()
        r.lrid='id-'+str(Local_report.objects.count())
        res = bytes(request.data['image'], 'utf-8')
        r.image=res
        r.rtype=request.data['type']
        r.description=request.data['description']
        r.latitude=request.data['latitude']
        r.longitude=request.data['longitude']
        r.report_name=request.data['report_name']
        r.address=request.data['address']
        r.user_name=request.data['user_name']
        r.phone_no=request.data['phone_number']
        r.timestamp=str(datetime.datetime.now())
        r.save()
        return Response({"status":True})

class Taskreport(APIView):
    def post(self,request):
        t=Task_Description()
        t.task_id=request.data["taskID"]
        Tasks.objects.filter(task_id=request.data["taskID"]).update(status="complete")
        Beat_tasks.objects.filter(task_id=request.data["taskID"]).update(status="complete")
        Range_tasks.objects.filter(task_id=request.data["taskID"]).update(status="complete")
        Division_tasks.objects.filter(task_id=request.data["taskID"]).update(status="complete")
        t.empid=request.data["empid"]
        t.description=request.data["report"]
        t.latitude=request.data["latitude"]
        t.longitude=request.data["longitude"]
        t.image=bytes(request.data['image'], 'utf-8')
        t.save()
        return Response({"status":True})

class Task_api(APIView):
    def post(self,request):
        empid=request.data["empid"]+"-"+request.data["name"]
        d=Tasks.objects.filter(task_to=empid , status="incomplete")
        arr=[]
        for ta in d:
            se={}
            se["type"]="task"
            se["id"]=ta.task_id
            se["task_name"]=ta.task_type
            se["task_type"]=ta.task_type
            se["description"]=ta.task_info
            se["assigning_officer"]=ta.task_from
            se["deadline"]=ta.deadline
            arr.append(se)
        return Response({"tasks":arr})


class Check(APIView):
    def post(self,request):
        print("checking email id",request.data['email'])
        try:
            u=User.objects.get(username=request.data['email'])
            print(u.password)
            if check_password('forestweb', u.password):
                flag=3
            else:
                flag=2
        except ObjectDoesNotExist:
            flag=1
       
        print(flag)
        rep={"email":flag}
        return Response(rep)

class Session_test(APIView):
    def post(self,request):
        permission_classes = (IsAuthenticated,)
        print(request.session['data'])
        return Response("Hello World")

class Animal_api(APIView):
    def post(self,request):
        data=[]
        ani=Animal.objects.all()
        al=set()
        for i in ani:
            al.add(i.animal_name)
        al=list(al)
        for i in al:
            temp={}
            temp["animal"]=i
            temp["id"]=[]
            id=Animal.objects.filter(animal_name=i)
            for j in id:
                temp["id"].append(j.animal_id)
            data.append(temp)
        se={"animals":data}
        print(se)
        return Response(se)

class Alertapi(APIView):
    def post(self,request):
        # async_to_sync(get_channel_layer().group_send)(
        #         'alert',
        #         {
        #             'type': 'alert_message',
        #             'message': "Alert message"
        #         }
        #     )
        # return Response({"data":"Ravi"})

        now = datetime.datetime.now()
        if(request.data['type']=="local-alert"):
            print(request.data['type'])
            # c = db.collection(u'camera').document('local-alert')
            # c.set({
            #     u'latitude': request.data['latitude'],
            #     u'longitude': request.data['longitude'],
            #     u'time' : request.data['timestamp']
            # })
            # time.sleep(5)
            # c.set({
                
            # })
            async_to_sync(get_channel_layer().group_send)(
                'alert',
                {
                    'type': 'alert_message',
                    'message': "Alert message from Local alert"
                }
            )
        else:
            if(request.data['type']=="working"):
                x=Status()
                x.latitude=float(request.data['latitude'])
                x.longitude=float(request.data['longitude'])
                x.camera_id=request.data['camera_id']
                x.action=request.data['type']
                x.time=str(request.data['timestamp'])
                x.save()
                ###Status table will have working cameras info for 5 min within 5 min it should check that which camera dosent send the request

            elif (request.data['type']=="hunter"):
                x=Logs()
                x.latitude=float(request.data['latitude'])
                x.longitude=float(request.data['longitude'])
                x.camera_id=request.data['camera_id']
                x.action=request.data['type']
                x.time=str(request.data['timestamp'])
                x.save()
                s={}
                s["latitude"]=x.latitude
                s["longitude"]=x.longitude
                s["camera_id"]=x.camera_id
                s["type"]=x.action
                s["timestamp"]=x.time
                async_to_sync(get_channel_layer().group_send)(
                    'alert',
                    {
                        'type': 'alert_message',
                        'message': json.dumps(s)
                    }
                )
                # c = db.collection(u'camera').document('hunter')
                # c.set({
                #     u'camera_id': request.data['value'],
                #     u'latitude': request.data['latitude'],
                #     u'longitude': request.data['longitude'],
                #     u'time' : request.data['timestamp']
                # })
                # time.sleep(5)
                # c.set({
                    
                # })
            elif request.data['type']=="sos":
                x=Sos()
                x.latitude=request.data['latitude']
                x.longitude=request.data['longitude']
                x.camera_id=request.data['camera_id']
                x.action=request.data['type']
                x.time=str(request.data['timestamp'])
                x.sos_type=request.data['sos_type']
                x.name=request.data['name']
                x.phone_number=request.data['phone_number']
                x.address=request.data['address']
                x.save()
                s={}
                s["latitude"]=x.latitude
                s["longitude"]=x.longitude
                s["camera_id"]=x.camera_id
                s["type"]=x.action
                s["timestamp"]=x.time
                s["name"]=x.name
                s["phone_number"]=x.phone_number
                s["address"]=x.address
                s["sos_type"]=x.sos_type
                async_to_sync(get_channel_layer().group_send)(
                    'alert',
                    {
                        'type': 'alert_message',
                        'message': json.dumps(s)
                    }
                )

            else:
                x=Logs()
                x.latitude=float(request.data['latitude'])
                x.longitude=float(request.data['longitude'])
                x.camera_id=request.data['camera_id']
                x.action=request.data['type']
                x.time=str(request.data['timestamp'])
                x.save()
                # async_to_sync(get_channel_layer().group_send)(
                # 'alert',
                #     {
                #         'type': 'alert_message',
                #         'message': "Alert message Something is detected"
                #     }
                # )
            
        return Response({"status":True})

class backtask(APIView):
    def post(self,request,format=None):
        back(repeat=5,repeat_until=datetime.datetime.now()+datetime.timedelta(0,600))
        process = subprocess.Popen(['python', 'manage.py','process_tasks'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        return Response("done")