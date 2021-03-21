--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.6 (Ubuntu 12.6-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO ravi;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO ravi;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO ravi;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO ravi;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO ravi;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO ravi;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO ravi;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO ravi;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO ravi;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO ravi;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO ravi;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO ravi;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO ravi;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO ravi;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO ravi;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO ravi;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO ravi;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO ravi;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO ravi;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO ravi;

--
-- Name: main_animal; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.main_animal (
    id integer NOT NULL,
    animal_id character varying(200) NOT NULL,
    animal_name character varying(200) NOT NULL,
    animal_info character varying(500) NOT NULL,
    latitude double precision[] NOT NULL,
    longitude double precision[] NOT NULL
);


ALTER TABLE public.main_animal OWNER TO ravi;

--
-- Name: main_animal_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE public.main_animal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_animal_id_seq OWNER TO ravi;

--
-- Name: main_animal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE public.main_animal_id_seq OWNED BY public.main_animal.id;


--
-- Name: main_beat_employee; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.main_beat_employee (
    id integer NOT NULL,
    beat_id character varying(200) NOT NULL,
    empid character varying(200) NOT NULL
);


ALTER TABLE public.main_beat_employee OWNER TO ravi;

--
-- Name: main_beat_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE public.main_beat_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_beat_employee_id_seq OWNER TO ravi;

--
-- Name: main_beat_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE public.main_beat_employee_id_seq OWNED BY public.main_beat_employee.id;


--
-- Name: main_beat_tasks; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.main_beat_tasks (
    id integer NOT NULL,
    task_id character varying(200) NOT NULL,
    task_info character varying(200) NOT NULL,
    deadline date NOT NULL,
    task_from character varying(200) NOT NULL,
    task_to character varying(200) NOT NULL,
    status character varying(200) NOT NULL
);


ALTER TABLE public.main_beat_tasks OWNER TO ravi;

--
-- Name: main_beat_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE public.main_beat_tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_beat_tasks_id_seq OWNER TO ravi;

--
-- Name: main_beat_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE public.main_beat_tasks_id_seq OWNED BY public.main_beat_tasks.id;


--
-- Name: main_camera; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.main_camera (
    id integer NOT NULL,
    camera_id character varying(200) NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    status character varying(200) NOT NULL
);


ALTER TABLE public.main_camera OWNER TO ravi;

--
-- Name: main_camera_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE public.main_camera_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_camera_id_seq OWNER TO ravi;

--
-- Name: main_camera_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE public.main_camera_id_seq OWNED BY public.main_camera.id;


--
-- Name: main_division_range; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.main_division_range (
    id integer NOT NULL,
    division_id character varying(200) NOT NULL,
    range_id character varying(200) NOT NULL
);


ALTER TABLE public.main_division_range OWNER TO ravi;

--
-- Name: main_division_range_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE public.main_division_range_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_division_range_id_seq OWNER TO ravi;

--
-- Name: main_division_range_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE public.main_division_range_id_seq OWNED BY public.main_division_range.id;


--
-- Name: main_division_tasks; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.main_division_tasks (
    id integer NOT NULL,
    task_id character varying(200) NOT NULL,
    task_info character varying(200) NOT NULL,
    deadline date NOT NULL,
    task_from character varying(200) NOT NULL,
    task_to character varying(200) NOT NULL,
    status character varying(200) NOT NULL
);


ALTER TABLE public.main_division_tasks OWNER TO ravi;

--
-- Name: main_division_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE public.main_division_tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_division_tasks_id_seq OWNER TO ravi;

--
-- Name: main_division_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE public.main_division_tasks_id_seq OWNED BY public.main_division_tasks.id;


--
-- Name: main_email; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.main_email (
    id integer NOT NULL,
    email character varying(200) NOT NULL
);


ALTER TABLE public.main_email OWNER TO ravi;

--
-- Name: main_email_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE public.main_email_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_email_id_seq OWNER TO ravi;

--
-- Name: main_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE public.main_email_id_seq OWNED BY public.main_email.id;


--
-- Name: main_forest_employee; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.main_forest_employee (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    area character varying(200) NOT NULL,
    role character varying(200) NOT NULL,
    latitude double precision[] NOT NULL,
    longitude double precision[] NOT NULL,
    user_id integer NOT NULL,
    empid character varying(200) NOT NULL
);


ALTER TABLE public.main_forest_employee OWNER TO ravi;

--
-- Name: main_forest_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE public.main_forest_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_forest_employee_id_seq OWNER TO ravi;

--
-- Name: main_forest_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE public.main_forest_employee_id_seq OWNED BY public.main_forest_employee.id;


--
-- Name: main_local_report; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.main_local_report (
    id integer NOT NULL,
    description character varying(1000) NOT NULL,
    phone_no character varying(10) NOT NULL,
    image bytea NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    lrid character varying(200) NOT NULL,
    "timestamp" character varying(200) NOT NULL
);


ALTER TABLE public.main_local_report OWNER TO ravi;

--
-- Name: main_local_report_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE public.main_local_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_local_report_id_seq OWNER TO ravi;

--
-- Name: main_local_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE public.main_local_report_id_seq OWNED BY public.main_local_report.id;


--
-- Name: main_logs; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.main_logs (
    id integer NOT NULL,
    camera_id character varying(200) NOT NULL,
    "time" character varying(200) NOT NULL,
    action character varying(200) NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL
);


ALTER TABLE public.main_logs OWNER TO ravi;

--
-- Name: main_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE public.main_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_logs_id_seq OWNER TO ravi;

--
-- Name: main_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE public.main_logs_id_seq OWNED BY public.main_logs.id;


--
-- Name: main_range_beat; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.main_range_beat (
    id integer NOT NULL,
    range_id character varying(200) NOT NULL,
    beat_id character varying(200) NOT NULL
);


ALTER TABLE public.main_range_beat OWNER TO ravi;

--
-- Name: main_range_beat_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE public.main_range_beat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_range_beat_id_seq OWNER TO ravi;

--
-- Name: main_range_beat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE public.main_range_beat_id_seq OWNED BY public.main_range_beat.id;


--
-- Name: main_range_tasks; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.main_range_tasks (
    id integer NOT NULL,
    task_id character varying(200) NOT NULL,
    task_info character varying(200) NOT NULL,
    deadline date NOT NULL,
    task_from character varying(200) NOT NULL,
    task_to character varying(200) NOT NULL,
    status character varying(200) NOT NULL
);


ALTER TABLE public.main_range_tasks OWNER TO ravi;

--
-- Name: main_range_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE public.main_range_tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_range_tasks_id_seq OWNER TO ravi;

--
-- Name: main_range_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE public.main_range_tasks_id_seq OWNED BY public.main_range_tasks.id;


--
-- Name: main_report; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.main_report (
    id integer NOT NULL,
    empid character varying(200) NOT NULL,
    description character varying(1000) NOT NULL,
    image bytea NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    rid character varying(200) NOT NULL,
    "timestamp" character varying(200) NOT NULL
);


ALTER TABLE public.main_report OWNER TO ravi;

--
-- Name: main_report_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE public.main_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_report_id_seq OWNER TO ravi;

--
-- Name: main_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE public.main_report_id_seq OWNED BY public.main_report.id;


--
-- Name: main_status; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.main_status (
    id integer NOT NULL,
    camera_id character varying(200) NOT NULL,
    "time" character varying(200) NOT NULL,
    action character varying(200) NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL
);


ALTER TABLE public.main_status OWNER TO ravi;

--
-- Name: main_status_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE public.main_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_status_id_seq OWNER TO ravi;

--
-- Name: main_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE public.main_status_id_seq OWNED BY public.main_status.id;


--
-- Name: main_task_description; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.main_task_description (
    id integer NOT NULL,
    task_id character varying(200) NOT NULL,
    description character varying(1000) NOT NULL,
    image bytea NOT NULL
);


ALTER TABLE public.main_task_description OWNER TO ravi;

--
-- Name: main_task_description_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE public.main_task_description_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_task_description_id_seq OWNER TO ravi;

--
-- Name: main_task_description_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE public.main_task_description_id_seq OWNED BY public.main_task_description.id;


--
-- Name: main_tasks; Type: TABLE; Schema: public; Owner: ravi
--

CREATE TABLE public.main_tasks (
    id integer NOT NULL,
    task_id character varying(200) NOT NULL,
    task_info character varying(200) NOT NULL,
    deadline date NOT NULL,
    task_from character varying(200) NOT NULL,
    task_to character varying(200) NOT NULL,
    status character varying(200) NOT NULL
);


ALTER TABLE public.main_tasks OWNER TO ravi;

--
-- Name: main_tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: ravi
--

CREATE SEQUENCE public.main_tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.main_tasks_id_seq OWNER TO ravi;

--
-- Name: main_tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ravi
--

ALTER SEQUENCE public.main_tasks_id_seq OWNED BY public.main_tasks.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: main_animal id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_animal ALTER COLUMN id SET DEFAULT nextval('public.main_animal_id_seq'::regclass);


--
-- Name: main_beat_employee id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_beat_employee ALTER COLUMN id SET DEFAULT nextval('public.main_beat_employee_id_seq'::regclass);


--
-- Name: main_beat_tasks id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_beat_tasks ALTER COLUMN id SET DEFAULT nextval('public.main_beat_tasks_id_seq'::regclass);


--
-- Name: main_camera id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_camera ALTER COLUMN id SET DEFAULT nextval('public.main_camera_id_seq'::regclass);


--
-- Name: main_division_range id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_division_range ALTER COLUMN id SET DEFAULT nextval('public.main_division_range_id_seq'::regclass);


--
-- Name: main_division_tasks id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_division_tasks ALTER COLUMN id SET DEFAULT nextval('public.main_division_tasks_id_seq'::regclass);


--
-- Name: main_email id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_email ALTER COLUMN id SET DEFAULT nextval('public.main_email_id_seq'::regclass);


--
-- Name: main_forest_employee id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_forest_employee ALTER COLUMN id SET DEFAULT nextval('public.main_forest_employee_id_seq'::regclass);


--
-- Name: main_local_report id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_local_report ALTER COLUMN id SET DEFAULT nextval('public.main_local_report_id_seq'::regclass);


--
-- Name: main_logs id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_logs ALTER COLUMN id SET DEFAULT nextval('public.main_logs_id_seq'::regclass);


--
-- Name: main_range_beat id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_range_beat ALTER COLUMN id SET DEFAULT nextval('public.main_range_beat_id_seq'::regclass);


--
-- Name: main_range_tasks id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_range_tasks ALTER COLUMN id SET DEFAULT nextval('public.main_range_tasks_id_seq'::regclass);


--
-- Name: main_report id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_report ALTER COLUMN id SET DEFAULT nextval('public.main_report_id_seq'::regclass);


--
-- Name: main_status id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_status ALTER COLUMN id SET DEFAULT nextval('public.main_status_id_seq'::regclass);


--
-- Name: main_task_description id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_task_description ALTER COLUMN id SET DEFAULT nextval('public.main_task_description_id_seq'::regclass);


--
-- Name: main_tasks id; Type: DEFAULT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_tasks ALTER COLUMN id SET DEFAULT nextval('public.main_tasks_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add email	7	add_email
26	Can change email	7	change_email
27	Can delete email	7	delete_email
28	Can view email	7	view_email
29	Can add forest_employee	8	add_forest_employee
30	Can change forest_employee	8	change_forest_employee
31	Can delete forest_employee	8	delete_forest_employee
32	Can view forest_employee	8	view_forest_employee
33	Can add Token	9	add_token
34	Can change Token	9	change_token
35	Can delete Token	9	delete_token
36	Can view Token	9	view_token
37	Can add token	10	add_tokenproxy
38	Can change token	10	change_tokenproxy
39	Can delete token	10	delete_tokenproxy
40	Can view token	10	view_tokenproxy
41	Can add animal	11	add_animal
42	Can change animal	11	change_animal
43	Can delete animal	11	delete_animal
44	Can view animal	11	view_animal
45	Can add beat_employee	12	add_beat_employee
46	Can change beat_employee	12	change_beat_employee
47	Can delete beat_employee	12	delete_beat_employee
48	Can view beat_employee	12	view_beat_employee
49	Can add camera	13	add_camera
50	Can change camera	13	change_camera
51	Can delete camera	13	delete_camera
52	Can view camera	13	view_camera
53	Can add division_range	14	add_division_range
54	Can change division_range	14	change_division_range
55	Can delete division_range	14	delete_division_range
56	Can view division_range	14	view_division_range
57	Can add division_tasks	15	add_division_tasks
58	Can change division_tasks	15	change_division_tasks
59	Can delete division_tasks	15	delete_division_tasks
60	Can view division_tasks	15	view_division_tasks
61	Can add local_report	16	add_local_report
62	Can change local_report	16	change_local_report
63	Can delete local_report	16	delete_local_report
64	Can view local_report	16	view_local_report
65	Can add logs	17	add_logs
66	Can change logs	17	change_logs
67	Can delete logs	17	delete_logs
68	Can view logs	17	view_logs
69	Can add range_beat	18	add_range_beat
70	Can change range_beat	18	change_range_beat
71	Can delete range_beat	18	delete_range_beat
72	Can view range_beat	18	view_range_beat
73	Can add range_tasks	19	add_range_tasks
74	Can change range_tasks	19	change_range_tasks
75	Can delete range_tasks	19	delete_range_tasks
76	Can view range_tasks	19	view_range_tasks
77	Can add report	20	add_report
78	Can change report	20	change_report
79	Can delete report	20	delete_report
80	Can view report	20	view_report
81	Can add status	21	add_status
82	Can change status	21	change_status
83	Can delete status	21	delete_status
84	Can view status	21	view_status
85	Can add task_ description	22	add_task_description
86	Can change task_ description	22	change_task_description
87	Can delete task_ description	22	delete_task_description
88	Can view task_ description	22	view_task_description
89	Can add tasks	23	add_tasks
90	Can change tasks	23	change_tasks
91	Can delete tasks	23	delete_tasks
92	Can view tasks	23	view_tasks
93	Can add beat_tasks	24	add_beat_tasks
94	Can change beat_tasks	24	change_beat_tasks
95	Can delete beat_tasks	24	delete_beat_tasks
96	Can view beat_tasks	24	view_beat_tasks
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$216000$8lTv13LGBzJt$XSQiYgyfaSlEnuv7uogtMkqMg4z2dE+S0hggX2BdW9Q=	2021-03-20 18:31:31.841123+05:30	t	ravi			ravi@gmail.com	t	t	2021-02-24 16:17:25.567917+05:30
18	pbkdf2_sha256$216000$NPLHcI4hiqDQ$BxSTXxVKit8hWpmC6Tp89jkOi3yVGgoQwJoqqSC5BEo=	2021-03-08 17:16:21.632305+05:30	f	aditya@gmail.com			aditya@gmail.com	f	t	2021-03-05 14:00:04.700118+05:30
17	pbkdf2_sha256$216000$L8eLW8vOhPBJ$zbH7cPhTarnvdg7EYsOEYROwpKLXWrFGF62Qfpbmy2Y=	\N	f	omkar@gmail.com			omkar@gmail.com	f	t	2021-03-05 13:59:27.394677+05:30
19	pbkdf2_sha256$216000$8BJri9zLuGWR$/pKbxk0AODLzdbQt2RT1gdSLwcUpS9OWAdGa3QK1Ui4=	\N	f	jay@gmail.com			jay@gmail.com	f	t	2021-03-05 14:00:24.902404+05:30
22	pbkdf2_sha256$216000$jZr6kbZCRxHL$lRBgAj20R6SGD7jaJwZ2pRYSrY6rFTeAqifaX4ovGW4=	\N	f	nanche@gmail.com			nanche@gmail.com	f	t	2021-03-05 14:01:38.286747+05:30
23	pbkdf2_sha256$216000$94lnoYClQ2UI$K22OA/n/dCZeKsEKmGdjpfAXeWhXyoDafamqyfhaa3s=	\N	f	atharva@gmail.com			atharva@gmail.com	f	t	2021-03-05 14:02:01.479983+05:30
24	pbkdf2_sha256$216000$r6sZBg7MdyQH$MJ77zXZRptC29rvMEkCtypxhGc4cxx+iFwXhWF5IY+w=	\N	f	kaushik@gmail.com			kaushik@gmail.com	f	t	2021-03-05 14:02:29.782253+05:30
25	pbkdf2_sha256$216000$2yKH9xDr2kkT$Gs5VMjMbPQxEyMdjDt77Om8hi2EH5dI/5XXocHn87Us=	\N	f	jainam@gmail.com			jainam@gmail.com	f	t	2021-03-05 14:57:35.154527+05:30
20	pbkdf2_sha256$216000$k45mRNW5p7JQ$+O/t5s9jO+tKoTXC+5MBZytsmI3jvbS0t+YRYcyuXB4=	2021-03-06 11:24:21.439681+05:30	f	chetan@gmail.com			chetan@gmail.com	f	t	2021-03-05 14:00:47.758986+05:30
27	pbkdf2_sha256$216000$kzcdLaPQRIh7$IKz2CnyvchROBqSgGF7+VRBSzsQYxOXHKPaxqxn1EeA=	\N	f	adak@gmail.com			adak@gmail.com	f	t	2021-03-08 17:37:51.852354+05:30
26	pbkdf2_sha256$216000$4Gy7lVtu7BLy$d8nj+UmBmuVdpvLaah+umi9pleQxsclnDY5c4rjQ/IE=	2021-03-09 16:46:28.567927+05:30	f	aman@gmail.com			aman@gmail.com	f	t	2021-03-08 17:37:20.323398+05:30
21	pbkdf2_sha256$216000$KquzzNxuwNnQ$0OXE7NCuC/SRpbUJ5YJfi9/e0v1P8hw8hzxphxLqLr0=	2021-03-09 16:47:53.685197+05:30	f	das@gmail.com			das@gmail.com	f	t	2021-03-05 14:01:13.982735+05:30
16	pbkdf2_sha256$216000$5VXLZD6feLrN$onHKJONMCw7Ou2SMh3I2a98tMfdl6R97Npgb7CO9/vo=	2021-03-20 14:37:05.779744+05:30	f	pratik@gmail.com			pratik@gmail.com	f	t	2021-03-05 11:13:25.350787+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-02-24 16:21:45.356677+05:30	2	pratik@gmail.com	3		4	1
2	2021-03-01 15:33:51.316484+05:30	1	ravi	2	[{"changed": {"fields": ["Role", "Latitude", "Longitude"]}}]	8	1
3	2021-03-04 15:29:34.524122+05:30	1	id_1	1	[{"added": {}}]	23	1
4	2021-03-04 15:29:41.49956+05:30	1	id_1	3		23	1
5	2021-03-05 11:02:59.272881+05:30	4	omkar@gmail.com	2	[{"changed": {"fields": ["Username", "Email address"]}}]	4	1
6	2021-03-05 11:12:08.664707+05:30	5	aditya@gmail.com	3		4	1
7	2021-03-05 11:12:08.693901+05:30	13	atharva@gmail.com	3		4	1
8	2021-03-05 11:12:08.704839+05:30	7	chetan@gmail.com	3		4	1
9	2021-03-05 11:12:08.717021+05:30	11	das@gmail.com	3		4	1
10	2021-03-05 11:12:08.726986+05:30	15	jainam@gmail.com	3		4	1
11	2021-03-05 11:12:08.738077+05:30	6	jay@gmail.com	3		4	1
12	2021-03-05 11:12:08.749445+05:30	14	kaushik@gmail.com	3		4	1
13	2021-03-05 11:12:08.760238+05:30	12	nanche@gmail.com	3		4	1
14	2021-03-05 11:12:08.771416+05:30	8	nisha@gmail.com	3		4	1
15	2021-03-05 11:12:08.782472+05:30	10	nishant@gmail.com	3		4	1
16	2021-03-05 11:12:08.793631+05:30	4	omkar@gmail.com	3		4	1
17	2021-03-05 11:12:08.804741+05:30	3	pratik@gmail.com	3		4	1
18	2021-03-05 11:12:08.81577+05:30	9	suyasha@gmail.com	3		4	1
19	2021-03-05 14:52:52.076705+05:30	13	pratik@gmail.com	2	[{"changed": {"fields": ["Empid"]}}]	8	1
20	2021-03-05 14:53:04.504733+05:30	14	omkar@gmail.com	2	[{"changed": {"fields": ["Empid"]}}]	8	1
21	2021-03-05 14:53:14.415288+05:30	15	aditya@gmail.com	2	[{"changed": {"fields": ["Empid"]}}]	8	1
22	2021-03-05 14:53:23.464373+05:30	16	jay@gmail.com	2	[{"changed": {"fields": ["Empid"]}}]	8	1
23	2021-03-05 14:53:31.077454+05:30	17	chetan@gmail.com	2	[{"changed": {"fields": ["Empid"]}}]	8	1
24	2021-03-05 14:53:39.835716+05:30	18	das@gmail.com	2	[{"changed": {"fields": ["Empid"]}}]	8	1
25	2021-03-05 14:53:48.178848+05:30	19	nanche@gmail.com	2	[{"changed": {"fields": ["Empid"]}}]	8	1
26	2021-03-05 14:54:01.130929+05:30	20	atharva@gmail.com	2	[{"changed": {"fields": ["Empid"]}}]	8	1
27	2021-03-05 14:54:10.87733+05:30	21	kaushik@gmail.com	2	[{"changed": {"fields": ["Empid"]}}]	8	1
28	2021-03-05 14:58:09.809681+05:30	21	kaushik@gmail.com	2	[{"changed": {"fields": ["Empid"]}}]	8	1
29	2021-03-05 14:59:00.368244+05:30	1	d_1	1	[{"added": {}}]	14	1
30	2021-03-05 14:59:06.338952+05:30	2	d_1	1	[{"added": {}}]	14	1
31	2021-03-05 14:59:13.448045+05:30	3	d_1	1	[{"added": {}}]	14	1
32	2021-03-05 14:59:52.33188+05:30	1	r_1	1	[{"added": {}}]	18	1
33	2021-03-05 14:59:58.409175+05:30	2	r_1	1	[{"added": {}}]	18	1
34	2021-03-05 15:00:04.510952+05:30	3	r_1	1	[{"added": {}}]	18	1
35	2021-03-05 15:00:28.213506+05:30	4	r_2	1	[{"added": {}}]	18	1
36	2021-03-05 15:00:36.86449+05:30	5	r_2	1	[{"added": {}}]	18	1
37	2021-03-06 11:32:20.828411+05:30	1	id_1	2	[{"changed": {"fields": ["Task to"]}}]	15	1
38	2021-03-06 11:32:30.798318+05:30	1	id_1	2	[{"changed": {"fields": ["Task to"]}}]	19	1
39	2021-03-06 12:07:00.045384+05:30	1	id_1	2	[{"changed": {"fields": ["Status"]}}]	19	1
40	2021-03-06 12:12:16.173873+05:30	1	id_1	2	[{"changed": {"fields": ["Task from", "Task to", "Status"]}}]	19	1
41	2021-03-06 12:15:54.484919+05:30	1	id_1	2	[{"changed": {"fields": ["Task from", "Task to", "Status"]}}]	19	1
42	2021-03-08 17:10:37.908718+05:30	1	id_1	3		23	1
43	2021-03-08 17:10:57.822465+05:30	1	id_1	3		15	1
44	2021-03-08 17:11:08.988206+05:30	2	id_1	3		19	1
45	2021-03-08 17:11:09.001269+05:30	1	id_1	3		19	1
46	2021-03-08 17:26:13.759482+05:30	23	ravi	1	[{"added": {}}]	8	1
47	2021-03-08 17:39:58.201937+05:30	1	b_1	1	[{"added": {}}]	12	1
48	2021-03-08 17:40:10.444174+05:30	2	b_1	1	[{"added": {}}]	12	1
49	2021-03-19 15:34:19.431993+05:30	2	b_1	3		20	1
50	2021-03-19 15:34:23.540518+05:30	1	b_1	3		20	1
51	2021-03-19 15:44:34.999783+05:30	23	ravi	2	[{"changed": {"fields": ["Area"]}}]	8	1
52	2021-03-19 16:43:47.329363+05:30	3	id_13-Adak	3		20	1
53	2021-03-19 16:45:53.541887+05:30	4	id_13-Adak	3		20	1
54	2021-03-20 14:55:53.023079+05:30	5	id_13-Adak	3		20	1
55	2021-03-20 16:10:14.119158+05:30	3	tiger3	2	[{"changed": {"fields": ["Latitude"]}}]	11	1
56	2021-03-20 16:10:22.316824+05:30	2	tiger2	2	[{"changed": {"fields": ["Latitude"]}}]	11	1
57	2021-03-20 16:10:30.053907+05:30	1	tiger1	2	[{"changed": {"fields": ["Latitude"]}}]	11	1
58	2021-03-20 16:45:04.770233+05:30	4	d_2	1	[{"added": {}}]	14	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	main	email
8	main	forest_employee
9	authtoken	token
10	authtoken	tokenproxy
11	main	animal
12	main	beat_employee
13	main	camera
14	main	division_range
15	main	division_tasks
16	main	local_report
17	main	logs
18	main	range_beat
19	main	range_tasks
20	main	report
21	main	status
22	main	task_description
23	main	tasks
24	main	beat_tasks
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-02-24 16:16:53.454278+05:30
2	auth	0001_initial	2021-02-24 16:16:53.813696+05:30
3	admin	0001_initial	2021-02-24 16:16:54.553332+05:30
4	admin	0002_logentry_remove_auto_add	2021-02-24 16:16:54.666757+05:30
5	admin	0003_logentry_add_action_flag_choices	2021-02-24 16:16:54.685871+05:30
6	contenttypes	0002_remove_content_type_name	2021-02-24 16:16:54.721688+05:30
7	auth	0002_alter_permission_name_max_length	2021-02-24 16:16:54.741369+05:30
8	auth	0003_alter_user_email_max_length	2021-02-24 16:16:54.767764+05:30
9	auth	0004_alter_user_username_opts	2021-02-24 16:16:54.784901+05:30
10	auth	0005_alter_user_last_login_null	2021-02-24 16:16:54.810352+05:30
11	auth	0006_require_contenttypes_0002	2021-02-24 16:16:54.822564+05:30
12	auth	0007_alter_validators_add_error_messages	2021-02-24 16:16:54.84161+05:30
13	auth	0008_alter_user_username_max_length	2021-02-24 16:16:54.909009+05:30
14	auth	0009_alter_user_last_name_max_length	2021-02-24 16:16:54.948266+05:30
15	auth	0010_alter_group_name_max_length	2021-02-24 16:16:55.005478+05:30
16	auth	0011_update_proxy_permissions	2021-02-24 16:16:55.036278+05:30
17	auth	0012_alter_user_first_name_max_length	2021-02-24 16:16:55.065496+05:30
18	authtoken	0001_initial	2021-02-24 16:16:55.174413+05:30
19	authtoken	0002_auto_20160226_1747	2021-02-24 16:16:55.335198+05:30
20	authtoken	0003_tokenproxy	2021-02-24 16:16:55.35531+05:30
22	main	0002_forest_employee	2021-02-24 16:16:55.568296+05:30
23	main	0003_auto_20210223_1246	2021-02-24 16:16:55.629049+05:30
24	main	0004_auto_20210223_1253	2021-02-24 16:16:55.658081+05:30
25	main	0005_auto_20210223_1257	2021-02-24 16:16:55.68462+05:30
26	main	0006_auto_20210223_1259	2021-02-24 16:16:55.716421+05:30
27	sessions	0001_initial	2021-02-24 16:16:55.801285+05:30
28	main	0007_animal_beat_employee_camera_division_range_division_tasks_local_report_logs_range_beat_range_tasks_r	2021-03-01 13:03:47.093049+05:30
29	main	0001_initial	2021-03-04 17:30:32.527542+05:30
30	main	0002_forest_employee_empid	2021-03-05 14:33:36.367404+05:30
31	main	0003_beat_tasks	2021-03-08 17:10:22.170804+05:30
32	main	0004_auto_20210319_1113	2021-03-19 16:43:18.078139+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
j7azda2tehjkgdhka7smatdazvcxsiz4	.eJxVjDsOwjAQBe_iGln-rmxKes5grb1eHECOFCcV4u4QKQW0b2beSyTc1pa2UZc0kTgLLU6_W8byqH0HdMd-m2WZ-7pMWe6KPOiQ15nq83K4fwcNR_vWXEFbT1lrAzr44IANRWuYIWB1ARhidmQhKI4qe2t1pVIYAbxXDsX7A870N4E:1lErhl:Ym0tWFeLo0hjrpJZdr7UbaYSx6wUfdlAuaiPac2W978	2021-03-10 16:17:41.719448+05:30
4kc2t0vbjqjo2if4wpi7g4n2n0foqpqu	.eJxVjDsOwjAQBe_iGln-rmxKes5grb1eHECOFCcV4u4QKQW0b2beSyTc1pa2UZc0kTgLLU6_W8byqH0HdMd-m2WZ-7pMWe6KPOiQ15nq83K4fwcNR_vWXEFbT1lrAzr44IANRWuYIWB1ARhidmQhKI4qe2t1pVIYAbxXDsX7A870N4E:1lGfQ1:RjwmqSYMEtClIYk369dQmePj23DTmBYufemZnap-n6o	2021-03-15 15:34:49.140968+05:30
nhic730c3pv562mbr6x2bc8kars5fjtl	e30:1lI67y:NXwroUA_dwsgNbbLFZLi-AoZeN0Fo_e-lS162Rke6FA	2021-03-19 14:18:06.845618+05:30
h0avvy48nuu346wdlv6jk829zhdx7oiv	e30:1lI68f:dtrbj5SqLltJuJdxOYX0PLPmfyJEX4FmeLVnFUm2its	2021-03-19 14:18:49.179958+05:30
lc7b4m14q6m63ezjkzr9qym0w7uu7553	e30:1lI69s:aiBU5mQroJKtFdlJqZUd5y_Td6_zfa9DaT3496OnbeE	2021-03-19 14:20:04.024093+05:30
nzfhxgewtcw0p2im5v8en0hr1wazns8r	e30:1lI6BY:G2R-pb80HbmhKv6os5WDqJLW-4UCpGAGb3l1VFHYzcM	2021-03-19 14:21:48.391162+05:30
0lo7wuzzs1m8ei9t7f7fqv4ircexrvdz	.eJxVjDsOwjAQBe_iGln-rmxKes5grb1eHECOFCcV4u4QKQW0b2beSyTc1pa2UZc0kTgLLU6_W8byqH0HdMd-m2WZ-7pMWe6KPOiQ15nq83K4fwcNR_vWXEFbT1lrAzr44IANRWuYIWB1ARhidmQhKI4qe2t1pVIYAbxXDsX7A870N4E:1lI6E1:UFIACw75YOlzHFf56nDoL3IHTtOOOtSzWhyZrCWsF-Y	2021-03-19 14:24:21.267303+05:30
8zvn14nhp0bkx070ukixt76o4sw4fshp	.eJxVjjsOgzAQRO-yNbJsbK8MZfqcAa1ZG5wQiPhUiLvHRBRJNdKbj2aHhra1b7YlzE1iqEFB8cs8tc8wngY_aOwm0U7jOicvzoi43EXcJw7D7cr-DfS09LkdAypt2StVonLWGYwlV7qMER0F4zBi5Q1rdDJW0lutVeC2jYRorTSUR5lWgnoHmkNWyCS83t_PiRslpYSjgDhQlwnxK41wfACXP0aT:1lKaoy:odln6-23T7HWxBEszIf7zT5c4IkwpJxU2b-WdKfT1-E	2021-03-26 11:28:48.272301+05:30
auku5kfpvzjabks8tkyu8tgttbd3c3bt	e30:1lIQ1f:8bf2tKb6dROJLN4lMhGl63yXKXGncYxVD_rRIm_n7fI	2021-03-20 11:32:55.73342+05:30
v6tykc9idudgynrfd76oixow7ggjqyoj	e30:1lJEI1:0xuF7sPXLRU6D7LdByD08-zlZ6gitswvbZKPJA7zP_8	2021-03-22 17:13:09.576854+05:30
n2rssh905jqk0g58uro0drx6g5rhle4q	.eJxVjksOgzAQQ-8ya4QSkowCy-57BjRhEkjLp-KzQty9oUJVu7JkP1veoaZt7ept8XMdGSqQkP16jpqnH8-AHzS2U95M4zpHl59IfqVLfp_Y97eL_RvoaOlSO3iUyrCTskBpjdUYCi5VEQJa8tpiwNJpVmhFKIUzSknPTRMI0RihKY0yrQTVDjT7pEA8xDHZfnh9jkeupRACjgxCT-2XON4SiUic:1lNZ4H:t3on7DMFM_mjdBNApcKVHiXK4FBlpRx5BsXgh4nb-Ik	2021-04-03 16:12:53.4235+05:30
4op6ztj4g5639lbxo6axdfluvv7ij2na	e30:1lJETN:jR_eZWuw3Y_5VexPax8hmErk_KlDRWFxzK2T8VQkaT0	2021-03-22 17:24:53.699843+05:30
\.


--
-- Data for Name: main_animal; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.main_animal (id, animal_id, animal_name, animal_info, latitude, longitude) FROM stdin;
3	id_3	tiger3	tiger	{75}	{0}
2	id_2	tiger2	tiger	{76}	{0}
1	id_1	tiger1	tiger	{77}	{0}
\.


--
-- Data for Name: main_beat_employee; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.main_beat_employee (id, beat_id, empid) FROM stdin;
1	b_1	id_12
2	b_1	id_13
\.


--
-- Data for Name: main_beat_tasks; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.main_beat_tasks (id, task_id, task_info, deadline, task_from, task_to, status) FROM stdin;
1	id_1	count lions	2021-03-09	b_1	id_12-Aman	assigned
\.


--
-- Data for Name: main_camera; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.main_camera (id, camera_id, latitude, longitude, status) FROM stdin;
\.


--
-- Data for Name: main_division_range; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.main_division_range (id, division_id, range_id) FROM stdin;
1	d_1	r_1
2	d_1	r_2
3	d_1	r_3
4	d_2	r_1
\.


--
-- Data for Name: main_division_tasks; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.main_division_tasks (id, task_id, task_info, deadline, task_from, task_to, status) FROM stdin;
2	id_1	count lions	2021-03-09	d_1	r_1	assigned
\.


--
-- Data for Name: main_email; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.main_email (id, email) FROM stdin;
\.


--
-- Data for Name: main_forest_employee; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.main_forest_employee (id, name, area, role, latitude, longitude, user_id, empid) FROM stdin;
13	Pratik	d_1	division_incharge	{0}	{0}	16	id_1
14	Omkar	d_2	division_incharge	{0}	{0}	17	id_2
15	Aditya	r_1	range_incharge	{0}	{0}	18	id_3
16	Jay	r_2	range_incharge	{0}	{0}	19	id_4
17	Chetan	r_3	range_incharge	{0}	{0}	20	id_5
18	Das	b_1	beat_incharge	{0}	{0}	21	id_6
19	Nanche	b_2	beat_incharge	{0}	{0}	22	id_7
20	Atharva	b_3	beat_incharge	{0}	{0}	23	id_8
22	Jainam	b_5	beat_incharge	{0}	{0}	25	id_10
21	Kaushik	b_4	beat_incharge	{0}	{0}	24	id_9
24	Aman	b_1	employee	{0}	{0}	26	id_12
25	Adak	b_1	employee	{0}	{0}	27	id_13
23		admin	admin	{0}	{0}	1	id_1000
\.


--
-- Data for Name: main_local_report; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.main_local_report (id, description, phone_no, image, latitude, longitude, lrid, "timestamp") FROM stdin;
\.


--
-- Data for Name: main_logs; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.main_logs (id, camera_id, "time", action, latitude, longitude) FROM stdin;
\.


--
-- Data for Name: main_range_beat; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.main_range_beat (id, range_id, beat_id) FROM stdin;
1	r_1	b_1
2	r_1	b_2
3	r_1	b_3
4	r_2	b_4
5	r_2	b_5
\.


--
-- Data for Name: main_range_tasks; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.main_range_tasks (id, task_id, task_info, deadline, task_from, task_to, status) FROM stdin;
3	id_1	count lions	2021-03-09	r_1	b_1	assigned
\.


--
-- Data for Name: main_report; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.main_report (id, empid, description, image, latitude, longitude, rid, "timestamp") FROM stdin;
6	id_13-Adak	first report	\\x2f396a2f34414151536b5a4a5267414241514141415141424141442f3277434541416b4742784151447738514542495646513856465263564652555646525558466738564652635746786757466859594853676747526f6c47785556495445684a536f744c6934754678387a4f444d754e7967744c69734243676f4b4467304f477841514779306c486834774c5373744c5330724c5338344c5330744c5330744c7a63724c5338724b7973774d6930764c5330754c5373744c5373764c5330334c5330744b7930744c5330744c662f4141424549414b55424d514d4249674143455145444551482f784141634141414341674d424151414141414141414141414141414341774142424155474341662f784142474541414241774945417751484267514442516b4141414142414149524179454542524978496b465242684e6867525979565847526c4e494846434e436f624653597348524d2b4878465452796776416b4a554e5456474f446b724c2f7841415a415145424151454241514141414141414141414141414143415141444241582f78414173455141434167454441774d44425141444141414141414141415149524178495449544642595151695552534273544b526f63487749304a782f396f4144414d42414149524178454150774434677255566f6a6f6756674b414967464c4652514349425142454170596b696f566749674551434e69534241524149674659434e696f454258434d4e5242716c6c6f4346656c47476f744b4e696f574771394b594771394b6c6c6f5870553070756c5453705a614661564e4b64705530725761684f6c54536e6156576c617a554a3071744b6470566156624a516b745646716357716931585553684d4b69453074564671566b6f535168495469454a4374686f555168495453454a4356686f57516849544346524374686146716b5a436f68494e414b6b554b6c5130556f7255574d5772437457416f4a4967434942514245416a596b6941496746414551434c59306941496746414559434c596b69674551437342454169324a496f4245416941524149746a5341415242714d42574169324b675131587052674967314779304c3071615533537070557374433455684e30716156724c704651713070326c567057736d6b547056467163577169315779554a4c554a436351684953736c436946644a326c7764706136444d4f4574506752496b49793158536f46376d736275534263774250556e59645479535443304937736d346a6c7a412f66334b697873433770677a59525035597674744b665777786245366267477a6d7573345350564a35663233556141346b48636941626b3242672f746233644530774e436e74614778752b58427767467252777735726762382f4434724749576533445063514752556b68676769584f633277445351346a5954455757526c4f513173566968684757714278612b64714c576b683733654150784a4135704e3047672b79585a6d706d466675326e525362427131444555326e33377550494c724d7a2b79366d5845595046744c6f5042563033493542375070585a356c516f3466426a435941735a6f695879306d527535784967754f386e2b797776396c31673352565a72306b52556c73764a755969347630413572352b6231636f79755051397544306b5a783937706e795050657a574c77526a4555584e616242343471626a345046764933576e49586f657469364463494b574a59392b72384d30694f384e556e715a2f63677235423233374e76776a32564773634d4d2b7a41344e31556a64336476493959377762794263325870395036714f546a7565584e366157506e7363716849546d4274395249454859544a6977393078644c5873504b7756466169784167465955566851614c43494b6769434c456767455156424541697870424149674651434d494e6a534c4152414b4149774547784a454152414b4149774557787046414967465943494242735352514349425741694152735641674b3452414b77464c4651454971645055514a416b6753347742504d6e6b45554b51745a7141494d65452f717142693175664954635245395038414e4e4c4e31625877317a66346f386f4d2f774231557a554a30324a6e7769382f3666334341684e7553427564675036425a74504a73552b534b46534f726d6c6a662f732b472f7171476a566b4b45544f77694c6456312b413744596972647859313176773263627a79755a304e367a715075572f776632646874526f657a3849584c7466655648446c5a6f4452354e3831486b6975356c432b726f2b584e59586571435434436632575453797a454737616270754f683862457a7a2f41465832764f386c7775486f746479594a44644d475a734470676176664779314e4a39436f483136564d4e726741616a50346274496b675351543677384a366f623775714f6b4d555a4b2b5435396c48596e47596b7544577462704d4856724a42767961306a6c7a4b364768396c6a702f467854476a2f32365a66413935634a452f7375793750347575356f44326a544963306761432b4c783469357673747a6a38554b4c792b6f7872576d7a4f4b53343834417447323573672f55796643444c464654722b7a67384a396c324666552f774236714f5949483462474d4d67544a4d474f7337335438377953686c64476b79673077375633726e456171686b466865593248464173426464466a3857587461424441544d4348535431754a386c69646e716271315845554b394f6e554d42394d7541735259674459666c506b6f3873327173365177724739787268646a5435485844474f4f6a764e577776786778594744633946324666426730716665474861576b586a51514e704a33754e316d2f6357596568556378745056666861346a55372f69416b4c457a66456834464b71356763356850643667306b57466a34456765613837636e315270356432536134527875487a537052785a31535178376d6c704d7449314743504664483279797359374156574158637a557966797641314e2f5552356c594f6159656e56704637487462567076754e514a5936316e45474c6743313452594c4f4b6a365142744451655875673962677179794c44796438304e2b4b63567975476566454a57313753346275735a69716649565878376e485533394346717976765264713066426172674652576f7151744545495242526c5151524243455152593047455951424745574e42684545495268426a5151526841455951593045455951684545474a42424745495242466a4343494243455151596b454659564969346d4a35626543676941496d53444935583242486d445a5854716162676b4f42426134474e4d6536383758384673634a6b3161714775444844565a734e6353383276344179622b4730585574495559755470474151304d4d2b74494e7749496a66567549393935384676736c374b564b7a4256665a6832614c4f4d53623942462b71332b53646b7a54477574534d744f38775852505532484a644c6c3151595a704d746c307a53504551326278554273642f432b3645707472676568523876344e646c6e5a7675614a71742f445959315134747161514c61584e477339496b66716d6664734d3436745034646f4e56376e7663527553776e397975716f447677385664545379346b744c6e6938513043773657584a39734d4c536f76706a752b396551546f4c69476a2b5a3848394e7a43354b2b6a35516363334f656e6f2f427273586d586634696a536f7a4c54416530616243433762776956313248447854664d6d522b59774774387239624c52396e7355396f4f7644737030794464674c54653838572b77352b4b3356494d4e4d6872616b535341393048336b75356646636332705670486b584f6c726f5932496f6a46554e56494531474747687a51473242466a595266634c4379664947345a6a2b39714d44513658475976302b504c7757747a5447316d4f593738536d58457758475944584551363047596d34323831724f304e5771326f4358456c3751376e7741675462596553574f45705253624648484c394b66444f74786d4a464f6f79744a4e4e7a64444261645164497630636252745a4c7a4f6b2f464d6b574959484d41676c354a6c34334637432f6946706a6a6e50776e33656e544c36726d384c524a7661584f2f68454866625a644455594b5647694b31566a616e647461596a6a4c514a494150564c4e2f7872564535796a6f612b546d68577276644648694949426351514276594177536247334b504a6237737a6c7a3845583469713075653973617953644c57334d6e6c4a4974344a654a7a696868793474704f4d334c32746b754a75596e633953745032783751314d526769366d51796931766556422b625473414144467a5a58484c55302f32586b75536370716e784639576451375061645950633041303265746f744c397779666953655142367252596e4852564e522f473867367930616d30324153474e48506c4a39367838446c56536a686d6b3159706875736a547947393538566a3556573736734e4469356a6d616d38684771486350675a584c4a43535854673250516d31466d756f30333175397131576433686d44585565386b4e41462b57356b6d336974526a2b3264436d335251612b715259463073706a786964523930443372592f61706d527059656867576e2f4550665641442b5270696b306a2f4149745a2f7743554c3572694875636462747a7a41614e75485a7468742f314b2b6a67394c4363464b532b7835632f724a7554556545586d474d6658714f7131444c33524a694e6741415049425970527876662f414439794572364b56634867627346525252554a614a414551555a5545455951424546474a426847314c4252676f4d614742474573464545474e4d6145514b57436942525930786f52424c4252416f4e4354476845436c676f67555768706a4155514b55436942526f5359304645302f396632535a58575a446768683666336c7a64574950714e2f394b3069525649502f6948386f2f4b4f49336749756c797a70434c6d394d527552646c33756e5854632b7245686d7a4762657564793437616468655a4e6832574c7851774e4a6d48703067374646736c326b754443515a307a735166446b6d355055774c4b4c4831432f674d687252564976666967536636726359504d7146647072747130366a6e474b6478445864417754704d627a64656554626474436e4e52656d6d342f6c6e7a7a4a5335676558746348754737675a6362784a4e7a31577a773257564d585953316f4f35334e74327447773333577878325a756f755a557151346b6b55324e6c3365504a33764e723738764f455650463468784266515947584a4458754241364f4d53527a5846354d6b75556a3136357458464a65546f63756d6b786c4d754a304e30427a6e48572f54367a72544e2f65466a5a6c67366c54764b684770774175324358414147513178735a35625751355a69734d3451447171437a7735342f43426d4e4c5259416c6166744e694b6a7442596447486261494c7462684a346d7445527a414d3345725263756b333150446a6a4a5a4f4f766b7a714758763067316677364a466d6c774c366835414e364878577878326255574e4970744c366b41454e4a76716b4e6247304c353369635656635748443467764e4e7742707644694a7662315a35624c63594150476b55334d70593270414971544c47477a596276706b6b3876464f75663450546b777558756b2f73645068366453706f5939724776364348436b77515a635459632f656c6470714f447274645461477566755874507151535a424274756642594f4879703463396c57762b4d3463645347736134676949457934414777363676634559767334476a5455713161306b48534361626650514a3835556c506269313052356c483370702f747761536b2b69436156436f37764857644a61304562365a67456b366244775769666a68567a6e446c6c36564a326d5733453658462f46746377337958627579436a6763492b73326b4455644f6b76426357436f513033646544763477467965466378744f512f686b7a416b446d53594542584853755374327535364977656450552b457a704d397a436f7970544461416544543153487a466e616d674378634f4565477565533566732f5571756655772b4c6c754666524e53704c51413673357a58466a5341546255524856705738374e736458634b647a6877486e5541495958467272506a6d5737654d7263314f7937616a69326c496144367a6e446a36773052486d756d4e364653514a346361656d55716f3057477a51314d72645162714e616e51464e784d61716a334e6b36514f5771476a33536c2f5a7067362b47703161754d5957556162515753576b6748567141676d4a64703831313245374755365a6678686f4f3542655852477876452b55705862436e5470594e676d5761673041742f7853477530324f326e666e73724c4a4a74786134664a7857504735714d472b65443568326c775978754a71346e76645965434774306c6f707441686a51377773646a4e2b717744324178766364394e506e4464547454782f4c4c596d787359325863396c4d744e5a35633568377470345a324a47376f3849416b387a344c4a2b3048507868734d57302f58504177446b547a3876336a7175734d3254694d612b4265717759494f6c6648586b2b4a3171596134674f424135674562644134412f45424a4b59397749324d33764d2f4578644b4a583144354a5369696978436b514b435659565a45786756676f4155514b493078674b49464c4252416f74435447416f77556f46454369304e4d63436942535155594b44516b786f4b49464b4252416f304a4d61436942535155516369304b78776372446b6f4f544d5054645565786a505863344e6237334541543453517051724f6a374b5a5778376e596e45412f647152466944707231507930353269594a384c6331325279444634746a616e636b7471314e546e45745a77776549672f6c4a414e676467746f374a57736267734d3244526f414f494d5135356b61337a6150574e3979344c72663974393241797a72686e4364546966634238646c34386d5344667566435054484e4c464662617554366e4e56384a693644474d707441444332434342716277427a6e677954733677477757485479544330385439366f6a5138754e6d7568686d515842674e6a4148363257566d65634f5a5663576b5064426244525a6e68714d2f70384671714f635977456c7a47647a766f4c4144635275324e5233354c7a7435476e70344f75336b6b724e6e6d324261437971326b387659303644714d445536644973535a4d6d64703649586a4731677748545459363542494c774a4844704868433347467735723032744f75644d6d49615a35744947793076614c467659356d486f474b686153344e45755930626775354862346f59355a4a642b5039396759354e765233587a324e7a6c7558307350533030673050615353643331484864784579347a652f6773624d58467a394f6f476d3248564f4b3449357535327359413572697376794e3157754b786336785045385270496d513531376762725a747a476c71594b502b4645756535726e64374e33365045627a2b36367a686158794a344e4d72547637477a6f34366f317a6a5370735a6f5a4448755932547441416266692f3153387972436f344f634353387730634d6b7a63324777755a4b3265426251455653376844584453352b6f413965373652384a57613668524451344f59535a41496a684233677768706b6c792f73534f534d586152777a387172416d7253633976386f6474422f4e77324e2b584a646a32567a696a56614731503841476f6a53516657626367456a59326936304f62356b33565466517174376c784c5344414433626c7a544e2b6677576c7a5369587957303672616a6f4458306a7843626779313178742f6b6d6e564b58386e664a6a333463384830757577596c726d31576b7348497a4a472f4c6c2f6678556f304d4c53614774703849675142596551584d646e38626d46436b30316d767136505863476b476f3359416b626b6334365857797a334d48564b502f5a715a61317731766a5471764e694265655a52307a3471532f62384869325a4a71505a2b66795a2b633935706a41757073714e6878314e314e41744c593933526150426472536351334456714457596754784277444b686747576c3178597a43314f447a35314e774d32504d6251657142754d773953754b39523343775149456c3769324a353269622b4b37307170647a3066534b4b39334a31564c45414175454f4c79534e54693570747559614c65433566455965766d4f4c3773565361624c53316f61326d427670456e636a637a74376b6968694b4e647a6854474971765937384a7264644f6d435248453758346d5a67775461367a6e5a685479764345467737794a635231335768476c5343704c4663762b33627762504f4d646838767735597777414c6b6e6b50466643653065647678646331444f68746d413868315069592f5a4f3754646f616d4d667552546e596e633869566f6e4c364f444470397a362f672b626d7936755038794f64743449535643554d7231486c5a616971564669464b77554b6970417755514b574369556f5359774657436c676f6755524a6a4155514b564b49464768706a5155514b53436942556f5359344f52427953437242526f566a67555570494b4e6c794e764f415031526f746a4156317632615a6532746a54567158703047643537336b777a7939592b51584767723648396a2b4a62393478644957652b6d3137427649707564496e2f414f5276366f5a46375852564c6b3676733752645872317856717464564c3563794348576b777758476b416754344c7173307738556e30325264736c6863413436767a6175532b6159584e616c47705565796d445664637563584133676c6f6767627236426c6a365436633475723372717a476c786277745a6f75474d494d376e7a58676a42506e756652395442786b70766f637257797a4630495961514d414856777461415352494a4e34416b3946742b7a6d474436756d7541586573794842774a484c687446356e6b756a7a4c473061304d4c5241395856425053544d774434726e633178376348514c476c724b6a6a7034544a7663776555446b686b6b6c50537555574f655753476c72334d374a74616d576164515a49674152786372547574446d32474647653562544e5a31774a34717045533935336742636e694d33716d4874652b49473952786a6d62373763316c354e6a42693373705138566d6b754651475245515136534342426a6e315630796d75546e394d386675766750483643476d746f66567471634e556747304147305836636b4f4a4e4e7247746141393935616245366468496d2f6b742f6a6d345a6a6d416868714378633575715031694a68616a377330596c74566c49484567364433726e426762476f756147674359647a484d726867667561366e57475231776a5359484963777256475633694b556a5144777570746a386f48716a6c737569505a78326a534b6837726478416270664f2f453864414e68433275487a68703175653167664961534f4a724c57414d416e66795473646948614e62496335734533634c4533484475364e68376b354b33566e4f5762493563716a4377755259576d4272707344326a675a48716a2b497564596e62645a314848306d6c7a417943493469304550504f486b3369793462485a7339306b6c3853356f426b51577567694f52744375766d374b7247756b697333517872526356627445616570506a3136724c424a71327a704c303870667166552b694448746f30616a795157514e49764c6a7a6b6e3967754a785763766c3155743047524c69414a6d38414f39596269794474566a483061564f58456b45577430496b743543595076686354685469385934696e5a6b61433467414e6e782f6f727479644b2b4558302b434559756375356e3570696154334d4447774a3145413848464d6c6e687477387633724c4d6a64697a71713143796b545a674932484d6e6c623930474e374e596d677a5655665363324c683343626332324d6e78737562784f664f6f7465796b2f55386e655a453244576b74744e746830354c3172484e3852486b39526a6a6a6255714f307a66744268387670476c687a3446773363656748395638797a6a4d36324a64336c516b744267435a44535a493834422b42574855784c6a554c716e47524a6348467a5a48384a6767694479484e59315a346d47386842494a4965525046665a652f4636645135376e7738767158503841384d687a6d41466f456d5a4469534c52747032335343554865384d52655a6d54744730624964613730634e515a4b7042715653745248494e576c714b305455477256776941527353514943734247417241557353514943734247476f6731467361694141724154513145474936684b496f4e524271614749777848554a52456871734e54777845474936684b49674e566871794178574b616d73576778394b324f51356b2f42346d6c69616672553354702f38414d627335685051676b4a417072497034527a7739773067553267757542496c724a41356d5344385370724c6f507264584b364759755a694b4439464277424c6845754a7557782b56774a414d387a73736646396d71314b2b4865344d6965456b416546764666502b7a7565567345346c686d6d3643366d365971637046724f3866434f692b685a52323177745967612b377148386a37664137466547654e786648513965503147534e4a3870664a6a346a74412f7577335672724d3077484e75484e396269503768622f4139316971514e4e7a575067544245304847356364583568316a644852784f4463444e4f6e666577452b653652692b7a4e4278625577784448677a424a494d587364776772586337504a686e536163583839686d59646d634e5565585644556d426558635973645574366b623235725a34504455614e4e6f6f4e304d494934765864314d7a4e7865594f79306d4b786d4a423031714e5175416750707751577a79364733566158485a7869324f31647a55445249467049484c597a486975626c4b5571374657467466712f6b66326b786c51566d735965554667496949314e66666c7666774856426c6d4b7156446f6457612b6f3530764f726870746a31576b7859447075756178474c474a72733458694c436b774f4c69647a503572515a42575a6838585677754a594b64462b6b52594e4c6e4352424a484d326d35354c7647476c556a3061556f397568334e4854534f7541326d774731776172704770783162783731714d3437553039516c375378773075673342426e696273496e6156574d71596a464f696a683667426141367056486473706e636b416d35397978634e6b2b58595545346971326f37387a527854372b5a584e59353676637a7a3673535679355a7138787876336d714268773578635a4c5741764c7a416271674468454e486838566d355a32567872336835614b41467735356c34506778686e6c755346574b2b3066435955466d456f30326a6159445a2f3557416b2b5a4335544f50744c78646157734f6c76387644506e6433366865794f46766f6a6c5031314b6c532f6b377245396e384c534a71593346476f2b505662617735514353567a2b6366614268734b773063445461493249755235374e50784b2b6234374e71396164627a423543775076356e7a6c594c484670424669463368365a4c3952346333724a7a2f3339477a7a667446694d555847713931396744627a367241773741584673613345517a63635269392b6c37477954437146366f7052564938556d354f32796e464d71307747734f6f45756d5150795159452b4a7566683153314567304370435055716c59314177724156797242574e52554b496c464c4c516149495a56676f6e5242684545414b494646695177424541674252416f7359774247416c6879494f51596b4d4152674a596369446b474e44414559435748496735466f614741496745734f52423644516b78674349424c443051657054466144664a6938774948674c6d42345354385667596c685762725647437246744d6b6b6d594f477839656c2f6831587448514f4d66445a625844397373657949717a483851483949574455777a5373642b45504a6462684c716a6e556f3944726148326d593173616d736448695250377037507451784d7957446662554350384138686349366b34636b737137554832447261506f464c3753644e563959595a766650416158474a44522b5552346b6b2b5852497850326e34783036474d5a346743522b6934585571314a4c44483443386a4e396a65312b4e725472716b2b386b2f6f5448364c54346a4756616e72766352306d3377466b67755653756b594a64454355322b724c61776b674e456b32414679543041566172672f357a3856557170544f5a484e493345632f654f717057544b70596852516f3942364b2b354b746b70696c4534554372376b4c616b62537a4855307249306852625562514b464e45476f69554a4b6c6d70496b4b4b53715749444b7346657666516a4b665a2b452b587066537036455a543750776e79394c36553642715049676372446c363639434d70396e345435656c394b6e6f526c50732f43664c30767055306c316e6b634f56687939622b6847552b7a384a3876532b6c543049796e326668506c3658307161433768354b443051657657666f526c50732f43664c3076705539434d70396e345435656c394b6d325864504a3465694431367539434d70396e345435656c394b6e6f526c50732f43664c3076705532686233673870436f69465265712f516a4b665a2b452b587066537036455a543750776e79394c36564e6f322f77434479734b69735646366478665a6e4a615a633035666853384e446930595a684f6b6d4a4844666e62644c7135426b62574f663977777869624443746d57683769494c4e3470762b436d7958366a77655a2b385264347653745049736a4a445467634d317863356f44734b3045364846685071375330714f794c4a4142475834636d474750756a5a696f3572576d437a713457335732432f5565447a5833696e6572307854374f354934674e774f474a4d5150757262677a4468776572593857317431574837505a4b2b6932734d42687442306a2f646d45366e514e496870314754467075434f536d78354c395434504e50657175395870642f5a2f4a415344674d4e49744177674a4a314e6241415a636775614447303352304f7a6553507076716a425958753269584f4f475933534e496650453057306b4756746a7962366e77655a6538516c775870312f5a664a39464b6f334c384b2b6e554c41317a614647497152706474634752743157452f4a386d4541356268675352706d6852677350654857544668464a2b2b316c746a7962366a776562547036424357743642656c58354c6b3431663932596541364337754b4f6b4e6d714e5a494843326154726e714f715a69657a2b55736539687976447933544a2b37306f30753138524f6d7747677966454b37506b6d2b766738796147394171304e3642656d735a6b57543068564c7374773341304f4555614237795a686f36453653627861366268757a65545072476b4d75776f634158416d685234674e456e617734327831757274503544766544792f70623043683039417656336f526c50732f43664c3076705539434d70396e345435656c394b7533354e766544796649364b745339592b6847552b7a384a3876532b6c543049796e326668506c36583072625a4e377765545339415872317236455a543750776e79394c365650516a4b665a2b452b5870665372746d33547953584964533963656847552b7a384a3876532b6c543049796e326668506c365830713641376835474c6b4a637658666f526c50732f43664c3076705539434d70396e345435656c394b756b6d7338684571705872373049796e326668506c36583071656847552b7a384a3876532b6c5769616a79424b74657676516a4b665a2b452b5870665372576f326f33366969696f534b4b4b4c47496f6f6f73596969696978694b4b4b4c47496f6f6f73595256776c4e3767357a5a49326d62653462412b4b572f4c614a4a4a594c367033767131617264547266662b59714b4c474c62674b514d6874373833586d356d397754654f704a334b742b41704f4d6c7477413058504341576b52653132744d6a2b454b4b4c474b626c394945454d41494f6f4553434434486b4c6d3231315463756f68706147414e74595341493077514f52476c7439374b4b4c4743626761514f72514e566a4e3977515a2b49423859435a5277374743474e414668413841476a394142354b4b4c474b72595a6a77304f466d6b4f454569434e6a5a4b646c744567673078424d6e65354d672b58453632334565705555574d5232573053486a5149655a634c385872456733754f4a3174754939566238425364716c73367657346e584637622b72633232755646466a454758307678426f45503959475348576a593232736d30384d787269344469694a7659446b4f6738416f6f7359616f6f6f73596969696978694b4b4b4c47496f6f6f73596969696978694b4b4b4c47496f6f6f73592f2f396b3d	0	1	r_1	12.00
\.


--
-- Data for Name: main_status; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.main_status (id, camera_id, "time", action, latitude, longitude) FROM stdin;
\.


--
-- Data for Name: main_task_description; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.main_task_description (id, task_id, description, image) FROM stdin;
\.


--
-- Data for Name: main_tasks; Type: TABLE DATA; Schema: public; Owner: ravi
--

COPY public.main_tasks (id, task_id, task_info, deadline, task_from, task_to, status) FROM stdin;
2	id_1	count lions	2021-03-09	b_1	id_12-Aman	incomplete
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 96, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 27, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 58, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 24, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 32, true);


--
-- Name: main_animal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('public.main_animal_id_seq', 3, true);


--
-- Name: main_beat_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('public.main_beat_employee_id_seq', 2, true);


--
-- Name: main_beat_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('public.main_beat_tasks_id_seq', 1, true);


--
-- Name: main_camera_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('public.main_camera_id_seq', 1, false);


--
-- Name: main_division_range_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('public.main_division_range_id_seq', 4, true);


--
-- Name: main_division_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('public.main_division_tasks_id_seq', 2, true);


--
-- Name: main_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('public.main_email_id_seq', 1, false);


--
-- Name: main_forest_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('public.main_forest_employee_id_seq', 25, true);


--
-- Name: main_local_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('public.main_local_report_id_seq', 1, false);


--
-- Name: main_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('public.main_logs_id_seq', 1, false);


--
-- Name: main_range_beat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('public.main_range_beat_id_seq', 5, true);


--
-- Name: main_range_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('public.main_range_tasks_id_seq', 3, true);


--
-- Name: main_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('public.main_report_id_seq', 6, true);


--
-- Name: main_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('public.main_status_id_seq', 1, false);


--
-- Name: main_task_description_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('public.main_task_description_id_seq', 1, false);


--
-- Name: main_tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ravi
--

SELECT pg_catalog.setval('public.main_tasks_id_seq', 2, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: main_animal main_animal_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_animal
    ADD CONSTRAINT main_animal_pkey PRIMARY KEY (id);


--
-- Name: main_beat_employee main_beat_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_beat_employee
    ADD CONSTRAINT main_beat_employee_pkey PRIMARY KEY (id);


--
-- Name: main_beat_tasks main_beat_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_beat_tasks
    ADD CONSTRAINT main_beat_tasks_pkey PRIMARY KEY (id);


--
-- Name: main_camera main_camera_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_camera
    ADD CONSTRAINT main_camera_pkey PRIMARY KEY (id);


--
-- Name: main_division_range main_division_range_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_division_range
    ADD CONSTRAINT main_division_range_pkey PRIMARY KEY (id);


--
-- Name: main_division_tasks main_division_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_division_tasks
    ADD CONSTRAINT main_division_tasks_pkey PRIMARY KEY (id);


--
-- Name: main_email main_email_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_email
    ADD CONSTRAINT main_email_pkey PRIMARY KEY (id);


--
-- Name: main_forest_employee main_forest_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_forest_employee
    ADD CONSTRAINT main_forest_employee_pkey PRIMARY KEY (id);


--
-- Name: main_forest_employee main_forest_employee_user_id_key; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_forest_employee
    ADD CONSTRAINT main_forest_employee_user_id_key UNIQUE (user_id);


--
-- Name: main_local_report main_local_report_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_local_report
    ADD CONSTRAINT main_local_report_pkey PRIMARY KEY (id);


--
-- Name: main_logs main_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_logs
    ADD CONSTRAINT main_logs_pkey PRIMARY KEY (id);


--
-- Name: main_range_beat main_range_beat_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_range_beat
    ADD CONSTRAINT main_range_beat_pkey PRIMARY KEY (id);


--
-- Name: main_range_tasks main_range_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_range_tasks
    ADD CONSTRAINT main_range_tasks_pkey PRIMARY KEY (id);


--
-- Name: main_report main_report_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_report
    ADD CONSTRAINT main_report_pkey PRIMARY KEY (id);


--
-- Name: main_status main_status_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_status
    ADD CONSTRAINT main_status_pkey PRIMARY KEY (id);


--
-- Name: main_task_description main_task_description_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_task_description
    ADD CONSTRAINT main_task_description_pkey PRIMARY KEY (id);


--
-- Name: main_tasks main_tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_tasks
    ADD CONSTRAINT main_tasks_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: ravi
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: ravi
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: ravi
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: ravi
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: ravi
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: ravi
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: ravi
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: ravi
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: ravi
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: ravi
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: ravi
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: ravi
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: ravi
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: ravi
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: main_forest_employee main_forest_employee_user_id_e4929b6d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ravi
--

ALTER TABLE ONLY public.main_forest_employee
    ADD CONSTRAINT main_forest_employee_user_id_e4929b6d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

