--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE keycloak;




--
-- Drop roles
--

DROP ROLE keycloak;


--
-- Roles
--

CREATE ROLE keycloak;
ALTER ROLE keycloak WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:SE/3hRggv5Eas45+S4Lkig==$pqMhatQboj0oCB9AiOEXg3fBNOIZsA6B3J7A2UQxCgM=:ArWw0K3KV/starfXlIn3E+2+byfiO0FIDp96nw5cEyk=';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-1.pgdg110+1)
-- Dumped by pg_dump version 14.5 (Debian 14.5-1.pgdg110+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: keycloak
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO keycloak;

\connect template1

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

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: keycloak
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: keycloak
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: keycloak
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "keycloak" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-1.pgdg110+1)
-- Dumped by pg_dump version 14.5 (Debian 14.5-1.pgdg110+1)

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

--
-- Name: keycloak; Type: DATABASE; Schema: -; Owner: keycloak
--

CREATE DATABASE keycloak WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE keycloak OWNER TO keycloak;

\connect keycloak

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
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO keycloak;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO keycloak;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO keycloak;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO keycloak;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO keycloak;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO keycloak;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO keycloak;

--
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO keycloak;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_attributes OWNER TO keycloak;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO keycloak;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO keycloak;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO keycloak;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO keycloak;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO keycloak;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO keycloak;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO keycloak;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO keycloak;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO keycloak;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO keycloak;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO keycloak;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO keycloak;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO keycloak;

--
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO keycloak;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO keycloak;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO keycloak;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO keycloak;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO keycloak;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO keycloak;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO keycloak;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO keycloak;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO keycloak;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO keycloak;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO keycloak;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO keycloak;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO keycloak;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO keycloak;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO keycloak;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO keycloak;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO keycloak;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO keycloak;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO keycloak;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO keycloak;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO keycloak;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO keycloak;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO keycloak;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO keycloak;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO keycloak;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO keycloak;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO keycloak;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO keycloak;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO keycloak;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO keycloak;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO keycloak;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO keycloak;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO keycloak;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO keycloak;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO keycloak;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO keycloak;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO keycloak;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO keycloak;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO keycloak;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO keycloak;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO keycloak;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO keycloak;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO keycloak;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO keycloak;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO keycloak;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO keycloak;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO keycloak;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO keycloak;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO keycloak;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO keycloak;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO keycloak;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO keycloak;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO keycloak;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO keycloak;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO keycloak;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO keycloak;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO keycloak;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO keycloak;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO keycloak;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO keycloak;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO keycloak;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO keycloak;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO keycloak;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO keycloak;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO keycloak;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO keycloak;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO keycloak;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO keycloak;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO keycloak;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO keycloak;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
87700a0d-3cd0-468c-b821-cfd8de49bd84	\N	auth-cookie	5486cd06-0bdd-43e9-bdf8-d68e838140cd	355f958c-20cc-4b84-8ca6-1265e8996881	2	10	f	\N	\N
54291dba-9ea2-4e0f-aa5c-3f3b642c9041	\N	auth-spnego	5486cd06-0bdd-43e9-bdf8-d68e838140cd	355f958c-20cc-4b84-8ca6-1265e8996881	3	20	f	\N	\N
978c84ba-90f0-473d-912a-7bebc34c94ba	\N	identity-provider-redirector	5486cd06-0bdd-43e9-bdf8-d68e838140cd	355f958c-20cc-4b84-8ca6-1265e8996881	2	25	f	\N	\N
49e653b5-4681-41da-aeef-afa4b1ec7753	\N	\N	5486cd06-0bdd-43e9-bdf8-d68e838140cd	355f958c-20cc-4b84-8ca6-1265e8996881	2	30	t	587427d6-277a-41cf-90c0-955d5fc3116b	\N
8158ff00-58e1-4839-825b-8d2a655c771a	\N	auth-username-password-form	5486cd06-0bdd-43e9-bdf8-d68e838140cd	587427d6-277a-41cf-90c0-955d5fc3116b	0	10	f	\N	\N
f659c34e-8612-444e-9f62-c4359228150a	\N	\N	5486cd06-0bdd-43e9-bdf8-d68e838140cd	587427d6-277a-41cf-90c0-955d5fc3116b	1	20	t	a7d3889a-ef59-4dbd-8fda-973fdff3a8a6	\N
d97c96cc-50b7-4f82-82fd-08a28dab082c	\N	conditional-user-configured	5486cd06-0bdd-43e9-bdf8-d68e838140cd	a7d3889a-ef59-4dbd-8fda-973fdff3a8a6	0	10	f	\N	\N
b162f85a-2140-475a-9f88-32a6d47a3cc9	\N	auth-otp-form	5486cd06-0bdd-43e9-bdf8-d68e838140cd	a7d3889a-ef59-4dbd-8fda-973fdff3a8a6	0	20	f	\N	\N
5e66a6d3-2735-41ec-bb0c-0e12e6b8965d	\N	direct-grant-validate-username	5486cd06-0bdd-43e9-bdf8-d68e838140cd	6e740995-f31a-4181-9a58-37f0b1a84955	0	10	f	\N	\N
b5297e8b-611e-4b27-b679-606e98d31e4c	\N	direct-grant-validate-password	5486cd06-0bdd-43e9-bdf8-d68e838140cd	6e740995-f31a-4181-9a58-37f0b1a84955	0	20	f	\N	\N
352b773a-88a6-4e32-880b-41eae709262f	\N	\N	5486cd06-0bdd-43e9-bdf8-d68e838140cd	6e740995-f31a-4181-9a58-37f0b1a84955	1	30	t	bf6682f0-6c5e-4545-8db6-c06cbf3e78ff	\N
0ea92ab7-0391-4d7a-92a1-5bf11f87019f	\N	conditional-user-configured	5486cd06-0bdd-43e9-bdf8-d68e838140cd	bf6682f0-6c5e-4545-8db6-c06cbf3e78ff	0	10	f	\N	\N
69162204-3f4d-43ab-86d6-2e771bccad5e	\N	direct-grant-validate-otp	5486cd06-0bdd-43e9-bdf8-d68e838140cd	bf6682f0-6c5e-4545-8db6-c06cbf3e78ff	0	20	f	\N	\N
bf9c4ce4-0df9-4cb2-b97d-f7b103821450	\N	registration-page-form	5486cd06-0bdd-43e9-bdf8-d68e838140cd	6c69f3e6-ce0f-4b75-9577-89957af3d8d4	0	10	t	ce6c9cf1-de9b-4c35-9f85-864f402278d0	\N
382d8bfb-0118-43bd-8bbe-f6a5105af2fa	\N	registration-user-creation	5486cd06-0bdd-43e9-bdf8-d68e838140cd	ce6c9cf1-de9b-4c35-9f85-864f402278d0	0	20	f	\N	\N
0aa43667-3dbe-4c62-bf0f-0f8e3a5def3b	\N	registration-profile-action	5486cd06-0bdd-43e9-bdf8-d68e838140cd	ce6c9cf1-de9b-4c35-9f85-864f402278d0	0	40	f	\N	\N
d1ed2477-be8e-40fe-b304-fb46741dff39	\N	registration-password-action	5486cd06-0bdd-43e9-bdf8-d68e838140cd	ce6c9cf1-de9b-4c35-9f85-864f402278d0	0	50	f	\N	\N
347c96e7-4ac8-4be6-bc31-84a431c2d99a	\N	registration-recaptcha-action	5486cd06-0bdd-43e9-bdf8-d68e838140cd	ce6c9cf1-de9b-4c35-9f85-864f402278d0	3	60	f	\N	\N
8b3800a6-50c2-4117-8b74-9a0ae6c10e76	\N	reset-credentials-choose-user	5486cd06-0bdd-43e9-bdf8-d68e838140cd	8449573d-682d-40df-af73-b31427a10486	0	10	f	\N	\N
b3513d2b-d756-4eb8-bd62-3249e85d030f	\N	reset-credential-email	5486cd06-0bdd-43e9-bdf8-d68e838140cd	8449573d-682d-40df-af73-b31427a10486	0	20	f	\N	\N
d425f451-cd98-48d5-8eb5-cff6a42ca238	\N	reset-password	5486cd06-0bdd-43e9-bdf8-d68e838140cd	8449573d-682d-40df-af73-b31427a10486	0	30	f	\N	\N
8647adbe-557b-4ede-8f1e-3122af5be0eb	\N	\N	5486cd06-0bdd-43e9-bdf8-d68e838140cd	8449573d-682d-40df-af73-b31427a10486	1	40	t	1bd6fd0b-a410-40d5-bca8-6c1ad26e39f7	\N
3a419b34-9686-4faa-9581-179c99a8a5b3	\N	conditional-user-configured	5486cd06-0bdd-43e9-bdf8-d68e838140cd	1bd6fd0b-a410-40d5-bca8-6c1ad26e39f7	0	10	f	\N	\N
18159cd4-26dd-4193-9ce8-01470f30e54d	\N	reset-otp	5486cd06-0bdd-43e9-bdf8-d68e838140cd	1bd6fd0b-a410-40d5-bca8-6c1ad26e39f7	0	20	f	\N	\N
a4b622a9-b908-47cb-ad15-5fd186b518cf	\N	client-secret	5486cd06-0bdd-43e9-bdf8-d68e838140cd	38eb683e-2db8-4fef-9131-c9977c770896	2	10	f	\N	\N
94cb7aa4-97d6-40ef-89f2-6ea017217ec0	\N	client-jwt	5486cd06-0bdd-43e9-bdf8-d68e838140cd	38eb683e-2db8-4fef-9131-c9977c770896	2	20	f	\N	\N
e7b6b7d7-0dac-457e-83b7-e42e4684f484	\N	client-secret-jwt	5486cd06-0bdd-43e9-bdf8-d68e838140cd	38eb683e-2db8-4fef-9131-c9977c770896	2	30	f	\N	\N
43250410-188b-43b6-945f-089ac309bfd6	\N	client-x509	5486cd06-0bdd-43e9-bdf8-d68e838140cd	38eb683e-2db8-4fef-9131-c9977c770896	2	40	f	\N	\N
9da9fb04-7375-4cc8-a139-8b952360d1bd	\N	idp-review-profile	5486cd06-0bdd-43e9-bdf8-d68e838140cd	8a1f5bae-21fa-42e6-894c-d0d052554d31	0	10	f	\N	b491c035-4f81-4366-a6a6-9e5f1569441a
1be0c6f3-b548-4f83-bac4-b6d6ad3cb753	\N	\N	5486cd06-0bdd-43e9-bdf8-d68e838140cd	8a1f5bae-21fa-42e6-894c-d0d052554d31	0	20	t	42a10457-0c7e-4dda-8c2e-85d41b00d6ee	\N
0a4e94f9-d006-4ba7-a613-3c244bc10a27	\N	idp-create-user-if-unique	5486cd06-0bdd-43e9-bdf8-d68e838140cd	42a10457-0c7e-4dda-8c2e-85d41b00d6ee	2	10	f	\N	5d7390b5-1df9-4f1a-a871-1761a496a145
3d9011fe-6a40-4250-b703-8424d52d41de	\N	\N	5486cd06-0bdd-43e9-bdf8-d68e838140cd	42a10457-0c7e-4dda-8c2e-85d41b00d6ee	2	20	t	b71e5ede-a341-4f82-a76a-ed2194046575	\N
f770c1a4-d6ee-4c32-bb04-21c9b4979c3d	\N	idp-confirm-link	5486cd06-0bdd-43e9-bdf8-d68e838140cd	b71e5ede-a341-4f82-a76a-ed2194046575	0	10	f	\N	\N
8e233bc3-3cf9-484d-9936-47af86fd57df	\N	\N	5486cd06-0bdd-43e9-bdf8-d68e838140cd	b71e5ede-a341-4f82-a76a-ed2194046575	0	20	t	780ef911-b3b3-4dd8-bc0e-28dca05d7d79	\N
94d09a04-0708-4a0f-9069-632f9cd4bcb9	\N	idp-email-verification	5486cd06-0bdd-43e9-bdf8-d68e838140cd	780ef911-b3b3-4dd8-bc0e-28dca05d7d79	2	10	f	\N	\N
73b8e490-e1af-42d4-98d9-831dcd3c7dfb	\N	\N	5486cd06-0bdd-43e9-bdf8-d68e838140cd	780ef911-b3b3-4dd8-bc0e-28dca05d7d79	2	20	t	af6e94ba-ffbb-4052-837e-8431f25aaef3	\N
dc943f7c-66d8-4023-8c93-45f47300f207	\N	idp-username-password-form	5486cd06-0bdd-43e9-bdf8-d68e838140cd	af6e94ba-ffbb-4052-837e-8431f25aaef3	0	10	f	\N	\N
979faa4a-d3f7-47b0-978b-d4f073e4070b	\N	\N	5486cd06-0bdd-43e9-bdf8-d68e838140cd	af6e94ba-ffbb-4052-837e-8431f25aaef3	1	20	t	6036571e-3965-4f18-8178-926c1ba46b72	\N
96de7af7-df90-4873-b8e4-9153ac47bdbe	\N	conditional-user-configured	5486cd06-0bdd-43e9-bdf8-d68e838140cd	6036571e-3965-4f18-8178-926c1ba46b72	0	10	f	\N	\N
3bc3429d-b0e9-418e-838d-f7ae2f966938	\N	auth-otp-form	5486cd06-0bdd-43e9-bdf8-d68e838140cd	6036571e-3965-4f18-8178-926c1ba46b72	0	20	f	\N	\N
8b56b3b2-5b2b-4986-b72e-7962585ddb85	\N	http-basic-authenticator	5486cd06-0bdd-43e9-bdf8-d68e838140cd	1463b854-020f-45b7-acd6-320e2bf1e034	0	10	f	\N	\N
0a71e397-140b-4313-af4e-25685a997b82	\N	docker-http-basic-authenticator	5486cd06-0bdd-43e9-bdf8-d68e838140cd	888752e6-da5e-4e70-9956-71bc6c774341	0	10	f	\N	\N
cc67c53a-4653-4afc-bb9f-d317b8184430	\N	no-cookie-redirect	5486cd06-0bdd-43e9-bdf8-d68e838140cd	94ccc24d-096c-4958-8866-a401107b1d4c	0	10	f	\N	\N
47b05d95-05a1-4f5a-881c-ff41da92d5f7	\N	\N	5486cd06-0bdd-43e9-bdf8-d68e838140cd	94ccc24d-096c-4958-8866-a401107b1d4c	0	20	t	a6b5c379-f51f-40ff-8165-f44bba03ff79	\N
d1d01f3b-cf6f-4437-b143-fc2a2220eb2d	\N	basic-auth	5486cd06-0bdd-43e9-bdf8-d68e838140cd	a6b5c379-f51f-40ff-8165-f44bba03ff79	0	10	f	\N	\N
7a515d07-ae5b-4003-a74f-9c4845454792	\N	basic-auth-otp	5486cd06-0bdd-43e9-bdf8-d68e838140cd	a6b5c379-f51f-40ff-8165-f44bba03ff79	3	20	f	\N	\N
7d888cf0-1872-49ab-84fe-5390226f0a6f	\N	auth-spnego	5486cd06-0bdd-43e9-bdf8-d68e838140cd	a6b5c379-f51f-40ff-8165-f44bba03ff79	3	30	f	\N	\N
5b71f608-7ba5-4293-8308-69c54fdf869e	\N	auth-cookie	52972857-3a02-44f3-8c45-983c95924d7f	64adb84c-86a0-428d-8eac-5d88f68f0faa	2	10	f	\N	\N
0ceb2a9d-3d72-45eb-8149-fa8c0344212f	\N	auth-spnego	52972857-3a02-44f3-8c45-983c95924d7f	64adb84c-86a0-428d-8eac-5d88f68f0faa	3	20	f	\N	\N
8cbad0b7-4fba-473a-a8bd-145dbb919547	\N	identity-provider-redirector	52972857-3a02-44f3-8c45-983c95924d7f	64adb84c-86a0-428d-8eac-5d88f68f0faa	2	25	f	\N	\N
c984a064-3a43-4673-859b-dd962bfb5a37	\N	\N	52972857-3a02-44f3-8c45-983c95924d7f	64adb84c-86a0-428d-8eac-5d88f68f0faa	2	30	t	3ef31154-477d-457d-a924-c7fbfd1f5353	\N
24e7e9ad-91a5-4542-ad5f-1ac970c9ce02	\N	auth-username-password-form	52972857-3a02-44f3-8c45-983c95924d7f	3ef31154-477d-457d-a924-c7fbfd1f5353	0	10	f	\N	\N
daa4ba77-9d43-4d63-8d1e-6cb105f11961	\N	\N	52972857-3a02-44f3-8c45-983c95924d7f	3ef31154-477d-457d-a924-c7fbfd1f5353	1	20	t	f4a14dd7-7aa8-40f3-91ee-ef27a03b75cb	\N
40eea9c9-dc0b-461c-82aa-cff0e6b55b3f	\N	conditional-user-configured	52972857-3a02-44f3-8c45-983c95924d7f	f4a14dd7-7aa8-40f3-91ee-ef27a03b75cb	0	10	f	\N	\N
c4172db4-597f-4e09-a1b5-7c933118f808	\N	auth-otp-form	52972857-3a02-44f3-8c45-983c95924d7f	f4a14dd7-7aa8-40f3-91ee-ef27a03b75cb	0	20	f	\N	\N
5c4df5e9-e821-43b4-8e09-d8b1901742ad	\N	direct-grant-validate-username	52972857-3a02-44f3-8c45-983c95924d7f	c9e97079-5558-41a0-b21d-c0f6c6095e54	0	10	f	\N	\N
c1089c0f-9f76-4b0f-8d4b-cd7b6397bf2f	\N	direct-grant-validate-password	52972857-3a02-44f3-8c45-983c95924d7f	c9e97079-5558-41a0-b21d-c0f6c6095e54	0	20	f	\N	\N
e2c8b508-0d73-4893-88e2-8a834af0fa15	\N	\N	52972857-3a02-44f3-8c45-983c95924d7f	c9e97079-5558-41a0-b21d-c0f6c6095e54	1	30	t	23e98a0d-bf4f-4442-ae4c-7aaaf2d9a8ea	\N
efc4417c-24aa-471c-93eb-dada617162cd	\N	conditional-user-configured	52972857-3a02-44f3-8c45-983c95924d7f	23e98a0d-bf4f-4442-ae4c-7aaaf2d9a8ea	0	10	f	\N	\N
6a3bf728-632e-4946-be60-ccc811b715d6	\N	direct-grant-validate-otp	52972857-3a02-44f3-8c45-983c95924d7f	23e98a0d-bf4f-4442-ae4c-7aaaf2d9a8ea	0	20	f	\N	\N
114a7048-7bc4-4bad-9469-83e686ccba74	\N	registration-page-form	52972857-3a02-44f3-8c45-983c95924d7f	6ebfe602-d06c-4040-b84a-92f8fcebe494	0	10	t	0c07f6ac-8786-48b4-a39a-c79bba227a55	\N
cb13c0b8-156d-4c1c-b7b5-81730aefb8a0	\N	registration-user-creation	52972857-3a02-44f3-8c45-983c95924d7f	0c07f6ac-8786-48b4-a39a-c79bba227a55	0	20	f	\N	\N
c991c048-bd23-439e-ae2c-ed2f597da138	\N	registration-profile-action	52972857-3a02-44f3-8c45-983c95924d7f	0c07f6ac-8786-48b4-a39a-c79bba227a55	0	40	f	\N	\N
e14cfeea-af1f-4381-b1d1-16d8ba479733	\N	registration-password-action	52972857-3a02-44f3-8c45-983c95924d7f	0c07f6ac-8786-48b4-a39a-c79bba227a55	0	50	f	\N	\N
b5bf32b9-b77b-4f9f-96a3-60ef15ddd1ec	\N	registration-recaptcha-action	52972857-3a02-44f3-8c45-983c95924d7f	0c07f6ac-8786-48b4-a39a-c79bba227a55	3	60	f	\N	\N
0825515c-e11a-4d39-9792-5284784c5fa4	\N	reset-credentials-choose-user	52972857-3a02-44f3-8c45-983c95924d7f	4e1b00c6-2f45-403e-9fc6-6f35b95baa22	0	10	f	\N	\N
cebbb376-f328-4050-818b-92a95d2847c4	\N	reset-credential-email	52972857-3a02-44f3-8c45-983c95924d7f	4e1b00c6-2f45-403e-9fc6-6f35b95baa22	0	20	f	\N	\N
342b7f80-159e-4556-8ba1-e50072d00dc4	\N	reset-password	52972857-3a02-44f3-8c45-983c95924d7f	4e1b00c6-2f45-403e-9fc6-6f35b95baa22	0	30	f	\N	\N
8f858955-e5ee-427d-b127-e402dcce56c1	\N	\N	52972857-3a02-44f3-8c45-983c95924d7f	4e1b00c6-2f45-403e-9fc6-6f35b95baa22	1	40	t	fd3f61bb-b1ce-4404-a12e-ece3eca45761	\N
6c317894-f565-4de9-9812-eae3cccc9675	\N	conditional-user-configured	52972857-3a02-44f3-8c45-983c95924d7f	fd3f61bb-b1ce-4404-a12e-ece3eca45761	0	10	f	\N	\N
c7dc5a07-957f-4c20-9a9d-2e120b58bd42	\N	reset-otp	52972857-3a02-44f3-8c45-983c95924d7f	fd3f61bb-b1ce-4404-a12e-ece3eca45761	0	20	f	\N	\N
49ecd4c0-49aa-414b-b8e4-6d36c8839517	\N	client-secret	52972857-3a02-44f3-8c45-983c95924d7f	7e54b685-b025-461b-ace0-e5edc61ff781	2	10	f	\N	\N
af6ccd1c-4c7a-4180-9e19-4980e987671b	\N	client-jwt	52972857-3a02-44f3-8c45-983c95924d7f	7e54b685-b025-461b-ace0-e5edc61ff781	2	20	f	\N	\N
7d3d04aa-6cfb-42a0-b555-a66361a15032	\N	client-secret-jwt	52972857-3a02-44f3-8c45-983c95924d7f	7e54b685-b025-461b-ace0-e5edc61ff781	2	30	f	\N	\N
222c68f0-5b3b-470e-8598-0f6c47540833	\N	client-x509	52972857-3a02-44f3-8c45-983c95924d7f	7e54b685-b025-461b-ace0-e5edc61ff781	2	40	f	\N	\N
2fc4bedf-2db3-4de4-92a5-095e769cd03e	\N	idp-review-profile	52972857-3a02-44f3-8c45-983c95924d7f	13e45c87-a953-4df9-b095-6f08bec7ba80	0	10	f	\N	214fccf2-097e-4ccf-ba06-549db37b536a
20b9e62d-9bbd-4c93-b5ab-89e21d5685ad	\N	\N	52972857-3a02-44f3-8c45-983c95924d7f	13e45c87-a953-4df9-b095-6f08bec7ba80	0	20	t	3056206d-c1ac-46c6-8699-80327e8efeed	\N
5c348245-a357-4aeb-829d-3dd7d7de0d5e	\N	idp-create-user-if-unique	52972857-3a02-44f3-8c45-983c95924d7f	3056206d-c1ac-46c6-8699-80327e8efeed	2	10	f	\N	302c338b-8fea-4939-8f39-ed076d18ca54
b8894c7b-666d-4864-8d43-d3abb4242ea0	\N	\N	52972857-3a02-44f3-8c45-983c95924d7f	3056206d-c1ac-46c6-8699-80327e8efeed	2	20	t	3cdca546-f36c-4994-b1da-11ac269579d0	\N
5524195c-5cae-4a1e-aaaf-c0416db571ff	\N	idp-confirm-link	52972857-3a02-44f3-8c45-983c95924d7f	3cdca546-f36c-4994-b1da-11ac269579d0	0	10	f	\N	\N
06037dfd-a8e6-4549-a581-604a86d6463a	\N	\N	52972857-3a02-44f3-8c45-983c95924d7f	3cdca546-f36c-4994-b1da-11ac269579d0	0	20	t	84e95b4a-36b4-400f-8a7d-8e2ea9528358	\N
e31308ac-a17b-4d55-80f2-127752fb05f0	\N	idp-email-verification	52972857-3a02-44f3-8c45-983c95924d7f	84e95b4a-36b4-400f-8a7d-8e2ea9528358	2	10	f	\N	\N
0fcfd65b-5656-47e3-bc5e-967745159e10	\N	\N	52972857-3a02-44f3-8c45-983c95924d7f	84e95b4a-36b4-400f-8a7d-8e2ea9528358	2	20	t	4a9d4626-c460-464b-bf42-97daf04d2e9f	\N
39a86c57-ab7d-4284-9ac0-da2b468f988d	\N	idp-username-password-form	52972857-3a02-44f3-8c45-983c95924d7f	4a9d4626-c460-464b-bf42-97daf04d2e9f	0	10	f	\N	\N
d1697b2d-c5fc-45c6-bcea-e48fe067c037	\N	\N	52972857-3a02-44f3-8c45-983c95924d7f	4a9d4626-c460-464b-bf42-97daf04d2e9f	1	20	t	d633e8e6-4cd1-47ce-8a24-89d51119769c	\N
adf58df0-9c0d-4058-8d4b-2ac7c37245a7	\N	conditional-user-configured	52972857-3a02-44f3-8c45-983c95924d7f	d633e8e6-4cd1-47ce-8a24-89d51119769c	0	10	f	\N	\N
ac82d2eb-fa10-4be5-87b4-64d77b94223d	\N	auth-otp-form	52972857-3a02-44f3-8c45-983c95924d7f	d633e8e6-4cd1-47ce-8a24-89d51119769c	0	20	f	\N	\N
e6462df5-2f63-4e9a-9514-916937a47cd4	\N	http-basic-authenticator	52972857-3a02-44f3-8c45-983c95924d7f	36aab231-1d15-4bd6-a650-f18a7e5e453f	0	10	f	\N	\N
331d82a1-392e-4b3d-b6db-039a6a7118af	\N	docker-http-basic-authenticator	52972857-3a02-44f3-8c45-983c95924d7f	38b22865-9a8e-4823-bbe2-90eaa5cd1ba8	0	10	f	\N	\N
1a2e6b10-7e8c-4abf-890f-817f34415b89	\N	no-cookie-redirect	52972857-3a02-44f3-8c45-983c95924d7f	73e6fbf0-543c-4856-bc16-af7525d6a3ef	0	10	f	\N	\N
cb44a16e-e9f9-4508-b658-f28ea0d593e0	\N	\N	52972857-3a02-44f3-8c45-983c95924d7f	73e6fbf0-543c-4856-bc16-af7525d6a3ef	0	20	t	d6756da0-bb7e-433a-83b4-4fdc94bae4b6	\N
58857f9c-f904-4eca-a40c-6952d889921e	\N	basic-auth	52972857-3a02-44f3-8c45-983c95924d7f	d6756da0-bb7e-433a-83b4-4fdc94bae4b6	0	10	f	\N	\N
97e6bfbf-b65b-440a-997b-10f22f24c7b7	\N	basic-auth-otp	52972857-3a02-44f3-8c45-983c95924d7f	d6756da0-bb7e-433a-83b4-4fdc94bae4b6	3	20	f	\N	\N
48b20d90-8efc-40f6-b30a-3aef286135b4	\N	auth-spnego	52972857-3a02-44f3-8c45-983c95924d7f	d6756da0-bb7e-433a-83b4-4fdc94bae4b6	3	30	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
355f958c-20cc-4b84-8ca6-1265e8996881	browser	browser based authentication	5486cd06-0bdd-43e9-bdf8-d68e838140cd	basic-flow	t	t
587427d6-277a-41cf-90c0-955d5fc3116b	forms	Username, password, otp and other auth forms.	5486cd06-0bdd-43e9-bdf8-d68e838140cd	basic-flow	f	t
a7d3889a-ef59-4dbd-8fda-973fdff3a8a6	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	5486cd06-0bdd-43e9-bdf8-d68e838140cd	basic-flow	f	t
6e740995-f31a-4181-9a58-37f0b1a84955	direct grant	OpenID Connect Resource Owner Grant	5486cd06-0bdd-43e9-bdf8-d68e838140cd	basic-flow	t	t
bf6682f0-6c5e-4545-8db6-c06cbf3e78ff	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	5486cd06-0bdd-43e9-bdf8-d68e838140cd	basic-flow	f	t
6c69f3e6-ce0f-4b75-9577-89957af3d8d4	registration	registration flow	5486cd06-0bdd-43e9-bdf8-d68e838140cd	basic-flow	t	t
ce6c9cf1-de9b-4c35-9f85-864f402278d0	registration form	registration form	5486cd06-0bdd-43e9-bdf8-d68e838140cd	form-flow	f	t
8449573d-682d-40df-af73-b31427a10486	reset credentials	Reset credentials for a user if they forgot their password or something	5486cd06-0bdd-43e9-bdf8-d68e838140cd	basic-flow	t	t
1bd6fd0b-a410-40d5-bca8-6c1ad26e39f7	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	5486cd06-0bdd-43e9-bdf8-d68e838140cd	basic-flow	f	t
38eb683e-2db8-4fef-9131-c9977c770896	clients	Base authentication for clients	5486cd06-0bdd-43e9-bdf8-d68e838140cd	client-flow	t	t
8a1f5bae-21fa-42e6-894c-d0d052554d31	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	5486cd06-0bdd-43e9-bdf8-d68e838140cd	basic-flow	t	t
42a10457-0c7e-4dda-8c2e-85d41b00d6ee	User creation or linking	Flow for the existing/non-existing user alternatives	5486cd06-0bdd-43e9-bdf8-d68e838140cd	basic-flow	f	t
b71e5ede-a341-4f82-a76a-ed2194046575	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	5486cd06-0bdd-43e9-bdf8-d68e838140cd	basic-flow	f	t
780ef911-b3b3-4dd8-bc0e-28dca05d7d79	Account verification options	Method with which to verity the existing account	5486cd06-0bdd-43e9-bdf8-d68e838140cd	basic-flow	f	t
af6e94ba-ffbb-4052-837e-8431f25aaef3	Verify Existing Account by Re-authentication	Reauthentication of existing account	5486cd06-0bdd-43e9-bdf8-d68e838140cd	basic-flow	f	t
6036571e-3965-4f18-8178-926c1ba46b72	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	5486cd06-0bdd-43e9-bdf8-d68e838140cd	basic-flow	f	t
1463b854-020f-45b7-acd6-320e2bf1e034	saml ecp	SAML ECP Profile Authentication Flow	5486cd06-0bdd-43e9-bdf8-d68e838140cd	basic-flow	t	t
888752e6-da5e-4e70-9956-71bc6c774341	docker auth	Used by Docker clients to authenticate against the IDP	5486cd06-0bdd-43e9-bdf8-d68e838140cd	basic-flow	t	t
94ccc24d-096c-4958-8866-a401107b1d4c	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	5486cd06-0bdd-43e9-bdf8-d68e838140cd	basic-flow	t	t
a6b5c379-f51f-40ff-8165-f44bba03ff79	Authentication Options	Authentication options.	5486cd06-0bdd-43e9-bdf8-d68e838140cd	basic-flow	f	t
64adb84c-86a0-428d-8eac-5d88f68f0faa	browser	browser based authentication	52972857-3a02-44f3-8c45-983c95924d7f	basic-flow	t	t
3ef31154-477d-457d-a924-c7fbfd1f5353	forms	Username, password, otp and other auth forms.	52972857-3a02-44f3-8c45-983c95924d7f	basic-flow	f	t
f4a14dd7-7aa8-40f3-91ee-ef27a03b75cb	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	52972857-3a02-44f3-8c45-983c95924d7f	basic-flow	f	t
c9e97079-5558-41a0-b21d-c0f6c6095e54	direct grant	OpenID Connect Resource Owner Grant	52972857-3a02-44f3-8c45-983c95924d7f	basic-flow	t	t
23e98a0d-bf4f-4442-ae4c-7aaaf2d9a8ea	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	52972857-3a02-44f3-8c45-983c95924d7f	basic-flow	f	t
6ebfe602-d06c-4040-b84a-92f8fcebe494	registration	registration flow	52972857-3a02-44f3-8c45-983c95924d7f	basic-flow	t	t
0c07f6ac-8786-48b4-a39a-c79bba227a55	registration form	registration form	52972857-3a02-44f3-8c45-983c95924d7f	form-flow	f	t
4e1b00c6-2f45-403e-9fc6-6f35b95baa22	reset credentials	Reset credentials for a user if they forgot their password or something	52972857-3a02-44f3-8c45-983c95924d7f	basic-flow	t	t
fd3f61bb-b1ce-4404-a12e-ece3eca45761	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	52972857-3a02-44f3-8c45-983c95924d7f	basic-flow	f	t
7e54b685-b025-461b-ace0-e5edc61ff781	clients	Base authentication for clients	52972857-3a02-44f3-8c45-983c95924d7f	client-flow	t	t
13e45c87-a953-4df9-b095-6f08bec7ba80	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	52972857-3a02-44f3-8c45-983c95924d7f	basic-flow	t	t
3056206d-c1ac-46c6-8699-80327e8efeed	User creation or linking	Flow for the existing/non-existing user alternatives	52972857-3a02-44f3-8c45-983c95924d7f	basic-flow	f	t
3cdca546-f36c-4994-b1da-11ac269579d0	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	52972857-3a02-44f3-8c45-983c95924d7f	basic-flow	f	t
84e95b4a-36b4-400f-8a7d-8e2ea9528358	Account verification options	Method with which to verity the existing account	52972857-3a02-44f3-8c45-983c95924d7f	basic-flow	f	t
4a9d4626-c460-464b-bf42-97daf04d2e9f	Verify Existing Account by Re-authentication	Reauthentication of existing account	52972857-3a02-44f3-8c45-983c95924d7f	basic-flow	f	t
d633e8e6-4cd1-47ce-8a24-89d51119769c	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	52972857-3a02-44f3-8c45-983c95924d7f	basic-flow	f	t
36aab231-1d15-4bd6-a650-f18a7e5e453f	saml ecp	SAML ECP Profile Authentication Flow	52972857-3a02-44f3-8c45-983c95924d7f	basic-flow	t	t
38b22865-9a8e-4823-bbe2-90eaa5cd1ba8	docker auth	Used by Docker clients to authenticate against the IDP	52972857-3a02-44f3-8c45-983c95924d7f	basic-flow	t	t
73e6fbf0-543c-4856-bc16-af7525d6a3ef	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	52972857-3a02-44f3-8c45-983c95924d7f	basic-flow	t	t
d6756da0-bb7e-433a-83b4-4fdc94bae4b6	Authentication Options	Authentication options.	52972857-3a02-44f3-8c45-983c95924d7f	basic-flow	f	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
b491c035-4f81-4366-a6a6-9e5f1569441a	review profile config	5486cd06-0bdd-43e9-bdf8-d68e838140cd
5d7390b5-1df9-4f1a-a871-1761a496a145	create unique user config	5486cd06-0bdd-43e9-bdf8-d68e838140cd
214fccf2-097e-4ccf-ba06-549db37b536a	review profile config	52972857-3a02-44f3-8c45-983c95924d7f
302c338b-8fea-4939-8f39-ed076d18ca54	create unique user config	52972857-3a02-44f3-8c45-983c95924d7f
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
b491c035-4f81-4366-a6a6-9e5f1569441a	missing	update.profile.on.first.login
5d7390b5-1df9-4f1a-a871-1761a496a145	false	require.password.update.after.registration
214fccf2-097e-4ccf-ba06-549db37b536a	missing	update.profile.on.first.login
302c338b-8fea-4939-8f39-ed076d18ca54	false	require.password.update.after.registration
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
22250aec-2f60-4c70-be7d-84efdf67cd02	t	f	master-realm	0	f	\N	\N	t	\N	f	5486cd06-0bdd-43e9-bdf8-d68e838140cd	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
01af5524-6897-4b8b-b803-50dd0c94351d	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	5486cd06-0bdd-43e9-bdf8-d68e838140cd	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
9157837e-b1a2-4e9b-bfdd-bae1db5cbfb8	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	5486cd06-0bdd-43e9-bdf8-d68e838140cd	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
921c5cbb-1554-4506-a676-f9a82f5a43e0	t	f	broker	0	f	\N	\N	t	\N	f	5486cd06-0bdd-43e9-bdf8-d68e838140cd	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
782c9a9c-5265-489d-93b8-f643d3a65485	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	5486cd06-0bdd-43e9-bdf8-d68e838140cd	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
cffc5219-17ab-4975-9cb6-6fea795df321	t	f	admin-cli	0	t	\N	\N	f	\N	f	5486cd06-0bdd-43e9-bdf8-d68e838140cd	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
e6f29d7b-c832-4474-8ce3-14f7912ef6c0	t	f	my_realm-realm	0	f	\N	\N	t	\N	f	5486cd06-0bdd-43e9-bdf8-d68e838140cd	\N	0	f	f	my_realm Realm	f	client-secret	\N	\N	\N	t	f	f	f
445fa568-9548-4edc-af03-64b0e774af28	t	f	realm-management	0	f	\N	\N	t	\N	f	52972857-3a02-44f3-8c45-983c95924d7f	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
24d3129e-77a1-433d-8aca-5ca60358e1f2	t	f	account	0	t	\N	/realms/my_realm/account/	f	\N	f	52972857-3a02-44f3-8c45-983c95924d7f	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
db49f247-6905-4342-8db8-a3dcaad2a856	t	f	account-console	0	t	\N	/realms/my_realm/account/	f	\N	f	52972857-3a02-44f3-8c45-983c95924d7f	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
395b2613-f89c-4d8f-9b47-51c829e39096	t	f	broker	0	f	\N	\N	t	\N	f	52972857-3a02-44f3-8c45-983c95924d7f	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
d83c087a-02f9-4790-b1f6-fb0e345b08f1	t	f	security-admin-console	0	t	\N	/admin/my_realm/console/	f	\N	f	52972857-3a02-44f3-8c45-983c95924d7f	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
a9c10427-a7e7-4c7e-a32f-05853b2460d8	t	f	admin-cli	0	t	\N	\N	f	\N	f	52972857-3a02-44f3-8c45-983c95924d7f	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
5b8cf74f-3eec-46a4-9d3c-c52ef7bbc818	t	t	my_client	0	t	\N		f		f	52972857-3a02-44f3-8c45-983c95924d7f	openid-connect	-1	t	f		f	client-secret			\N	t	f	t	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_attributes (client_id, value, name) FROM stdin;
01af5524-6897-4b8b-b803-50dd0c94351d	+	post.logout.redirect.uris
9157837e-b1a2-4e9b-bfdd-bae1db5cbfb8	+	post.logout.redirect.uris
9157837e-b1a2-4e9b-bfdd-bae1db5cbfb8	S256	pkce.code.challenge.method
782c9a9c-5265-489d-93b8-f643d3a65485	+	post.logout.redirect.uris
782c9a9c-5265-489d-93b8-f643d3a65485	S256	pkce.code.challenge.method
24d3129e-77a1-433d-8aca-5ca60358e1f2	+	post.logout.redirect.uris
db49f247-6905-4342-8db8-a3dcaad2a856	+	post.logout.redirect.uris
db49f247-6905-4342-8db8-a3dcaad2a856	S256	pkce.code.challenge.method
d83c087a-02f9-4790-b1f6-fb0e345b08f1	+	post.logout.redirect.uris
d83c087a-02f9-4790-b1f6-fb0e345b08f1	S256	pkce.code.challenge.method
5b8cf74f-3eec-46a4-9d3c-c52ef7bbc818	false	oauth2.device.authorization.grant.enabled
5b8cf74f-3eec-46a4-9d3c-c52ef7bbc818	false	oidc.ciba.grant.enabled
5b8cf74f-3eec-46a4-9d3c-c52ef7bbc818	true	backchannel.logout.session.required
5b8cf74f-3eec-46a4-9d3c-c52ef7bbc818	false	backchannel.logout.revoke.offline.tokens
5b8cf74f-3eec-46a4-9d3c-c52ef7bbc818	false	display.on.consent.screen
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
01e81168-7b2e-4b1c-bcb0-60b6adb8790b	offline_access	5486cd06-0bdd-43e9-bdf8-d68e838140cd	OpenID Connect built-in scope: offline_access	openid-connect
2da4e6f1-92fe-45a0-8abc-cf9ebd8f59c3	role_list	5486cd06-0bdd-43e9-bdf8-d68e838140cd	SAML role list	saml
da011c93-b2d6-4cb9-b86f-fbdaf1417589	profile	5486cd06-0bdd-43e9-bdf8-d68e838140cd	OpenID Connect built-in scope: profile	openid-connect
fa50c35c-246a-4e68-9485-aee1af65973c	email	5486cd06-0bdd-43e9-bdf8-d68e838140cd	OpenID Connect built-in scope: email	openid-connect
b24fdd04-b181-4b39-9b3a-29be3c97f23b	address	5486cd06-0bdd-43e9-bdf8-d68e838140cd	OpenID Connect built-in scope: address	openid-connect
50438cea-d3d2-4899-906c-e4ddb2d5af4c	phone	5486cd06-0bdd-43e9-bdf8-d68e838140cd	OpenID Connect built-in scope: phone	openid-connect
54700f07-9d14-4643-9995-ac2edc1e1a43	roles	5486cd06-0bdd-43e9-bdf8-d68e838140cd	OpenID Connect scope for add user roles to the access token	openid-connect
f9677c86-e23f-4bab-93fa-f7783c5c1c5e	web-origins	5486cd06-0bdd-43e9-bdf8-d68e838140cd	OpenID Connect scope for add allowed web origins to the access token	openid-connect
6baeb1e4-5a67-44fc-9269-c93cf783e8b6	microprofile-jwt	5486cd06-0bdd-43e9-bdf8-d68e838140cd	Microprofile - JWT built-in scope	openid-connect
720899a6-d63d-4051-b101-85b00cbfafa2	acr	5486cd06-0bdd-43e9-bdf8-d68e838140cd	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
1c1dee26-9bd9-4bd0-8e7d-877e4c6c8909	offline_access	52972857-3a02-44f3-8c45-983c95924d7f	OpenID Connect built-in scope: offline_access	openid-connect
d4b3a65d-6586-419e-ace1-f1d75abb81e2	role_list	52972857-3a02-44f3-8c45-983c95924d7f	SAML role list	saml
a30791eb-00c8-473d-874b-1be1e1de3eb4	profile	52972857-3a02-44f3-8c45-983c95924d7f	OpenID Connect built-in scope: profile	openid-connect
51491e9a-c869-4d38-b846-be8a1c0b6dda	email	52972857-3a02-44f3-8c45-983c95924d7f	OpenID Connect built-in scope: email	openid-connect
f9dc6d51-8a3c-4425-ad2d-7ce1670d2d07	address	52972857-3a02-44f3-8c45-983c95924d7f	OpenID Connect built-in scope: address	openid-connect
bf3b318a-197c-486b-8637-3ae06c7d6323	phone	52972857-3a02-44f3-8c45-983c95924d7f	OpenID Connect built-in scope: phone	openid-connect
0073ce65-ec67-4986-ac1c-adcc813add33	roles	52972857-3a02-44f3-8c45-983c95924d7f	OpenID Connect scope for add user roles to the access token	openid-connect
9e1f9b70-0657-426e-9f0b-1dac5186b21a	web-origins	52972857-3a02-44f3-8c45-983c95924d7f	OpenID Connect scope for add allowed web origins to the access token	openid-connect
d0252463-f536-4cdf-9942-17a52a1c040d	microprofile-jwt	52972857-3a02-44f3-8c45-983c95924d7f	Microprofile - JWT built-in scope	openid-connect
f82da954-d81d-4b3a-aa29-da7b79776d11	acr	52972857-3a02-44f3-8c45-983c95924d7f	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
01e81168-7b2e-4b1c-bcb0-60b6adb8790b	true	display.on.consent.screen
01e81168-7b2e-4b1c-bcb0-60b6adb8790b	${offlineAccessScopeConsentText}	consent.screen.text
2da4e6f1-92fe-45a0-8abc-cf9ebd8f59c3	true	display.on.consent.screen
2da4e6f1-92fe-45a0-8abc-cf9ebd8f59c3	${samlRoleListScopeConsentText}	consent.screen.text
da011c93-b2d6-4cb9-b86f-fbdaf1417589	true	display.on.consent.screen
da011c93-b2d6-4cb9-b86f-fbdaf1417589	${profileScopeConsentText}	consent.screen.text
da011c93-b2d6-4cb9-b86f-fbdaf1417589	true	include.in.token.scope
fa50c35c-246a-4e68-9485-aee1af65973c	true	display.on.consent.screen
fa50c35c-246a-4e68-9485-aee1af65973c	${emailScopeConsentText}	consent.screen.text
fa50c35c-246a-4e68-9485-aee1af65973c	true	include.in.token.scope
b24fdd04-b181-4b39-9b3a-29be3c97f23b	true	display.on.consent.screen
b24fdd04-b181-4b39-9b3a-29be3c97f23b	${addressScopeConsentText}	consent.screen.text
b24fdd04-b181-4b39-9b3a-29be3c97f23b	true	include.in.token.scope
50438cea-d3d2-4899-906c-e4ddb2d5af4c	true	display.on.consent.screen
50438cea-d3d2-4899-906c-e4ddb2d5af4c	${phoneScopeConsentText}	consent.screen.text
50438cea-d3d2-4899-906c-e4ddb2d5af4c	true	include.in.token.scope
54700f07-9d14-4643-9995-ac2edc1e1a43	true	display.on.consent.screen
54700f07-9d14-4643-9995-ac2edc1e1a43	${rolesScopeConsentText}	consent.screen.text
54700f07-9d14-4643-9995-ac2edc1e1a43	false	include.in.token.scope
f9677c86-e23f-4bab-93fa-f7783c5c1c5e	false	display.on.consent.screen
f9677c86-e23f-4bab-93fa-f7783c5c1c5e		consent.screen.text
f9677c86-e23f-4bab-93fa-f7783c5c1c5e	false	include.in.token.scope
6baeb1e4-5a67-44fc-9269-c93cf783e8b6	false	display.on.consent.screen
6baeb1e4-5a67-44fc-9269-c93cf783e8b6	true	include.in.token.scope
720899a6-d63d-4051-b101-85b00cbfafa2	false	display.on.consent.screen
720899a6-d63d-4051-b101-85b00cbfafa2	false	include.in.token.scope
1c1dee26-9bd9-4bd0-8e7d-877e4c6c8909	true	display.on.consent.screen
1c1dee26-9bd9-4bd0-8e7d-877e4c6c8909	${offlineAccessScopeConsentText}	consent.screen.text
d4b3a65d-6586-419e-ace1-f1d75abb81e2	true	display.on.consent.screen
d4b3a65d-6586-419e-ace1-f1d75abb81e2	${samlRoleListScopeConsentText}	consent.screen.text
a30791eb-00c8-473d-874b-1be1e1de3eb4	true	display.on.consent.screen
a30791eb-00c8-473d-874b-1be1e1de3eb4	${profileScopeConsentText}	consent.screen.text
a30791eb-00c8-473d-874b-1be1e1de3eb4	true	include.in.token.scope
51491e9a-c869-4d38-b846-be8a1c0b6dda	true	display.on.consent.screen
51491e9a-c869-4d38-b846-be8a1c0b6dda	${emailScopeConsentText}	consent.screen.text
51491e9a-c869-4d38-b846-be8a1c0b6dda	true	include.in.token.scope
f9dc6d51-8a3c-4425-ad2d-7ce1670d2d07	true	display.on.consent.screen
f9dc6d51-8a3c-4425-ad2d-7ce1670d2d07	${addressScopeConsentText}	consent.screen.text
f9dc6d51-8a3c-4425-ad2d-7ce1670d2d07	true	include.in.token.scope
bf3b318a-197c-486b-8637-3ae06c7d6323	true	display.on.consent.screen
bf3b318a-197c-486b-8637-3ae06c7d6323	${phoneScopeConsentText}	consent.screen.text
bf3b318a-197c-486b-8637-3ae06c7d6323	true	include.in.token.scope
0073ce65-ec67-4986-ac1c-adcc813add33	true	display.on.consent.screen
0073ce65-ec67-4986-ac1c-adcc813add33	${rolesScopeConsentText}	consent.screen.text
0073ce65-ec67-4986-ac1c-adcc813add33	false	include.in.token.scope
9e1f9b70-0657-426e-9f0b-1dac5186b21a	false	display.on.consent.screen
9e1f9b70-0657-426e-9f0b-1dac5186b21a		consent.screen.text
9e1f9b70-0657-426e-9f0b-1dac5186b21a	false	include.in.token.scope
d0252463-f536-4cdf-9942-17a52a1c040d	false	display.on.consent.screen
d0252463-f536-4cdf-9942-17a52a1c040d	true	include.in.token.scope
f82da954-d81d-4b3a-aa29-da7b79776d11	false	display.on.consent.screen
f82da954-d81d-4b3a-aa29-da7b79776d11	false	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
01af5524-6897-4b8b-b803-50dd0c94351d	da011c93-b2d6-4cb9-b86f-fbdaf1417589	t
01af5524-6897-4b8b-b803-50dd0c94351d	54700f07-9d14-4643-9995-ac2edc1e1a43	t
01af5524-6897-4b8b-b803-50dd0c94351d	fa50c35c-246a-4e68-9485-aee1af65973c	t
01af5524-6897-4b8b-b803-50dd0c94351d	720899a6-d63d-4051-b101-85b00cbfafa2	t
01af5524-6897-4b8b-b803-50dd0c94351d	f9677c86-e23f-4bab-93fa-f7783c5c1c5e	t
01af5524-6897-4b8b-b803-50dd0c94351d	b24fdd04-b181-4b39-9b3a-29be3c97f23b	f
01af5524-6897-4b8b-b803-50dd0c94351d	6baeb1e4-5a67-44fc-9269-c93cf783e8b6	f
01af5524-6897-4b8b-b803-50dd0c94351d	01e81168-7b2e-4b1c-bcb0-60b6adb8790b	f
01af5524-6897-4b8b-b803-50dd0c94351d	50438cea-d3d2-4899-906c-e4ddb2d5af4c	f
9157837e-b1a2-4e9b-bfdd-bae1db5cbfb8	da011c93-b2d6-4cb9-b86f-fbdaf1417589	t
9157837e-b1a2-4e9b-bfdd-bae1db5cbfb8	54700f07-9d14-4643-9995-ac2edc1e1a43	t
9157837e-b1a2-4e9b-bfdd-bae1db5cbfb8	fa50c35c-246a-4e68-9485-aee1af65973c	t
9157837e-b1a2-4e9b-bfdd-bae1db5cbfb8	720899a6-d63d-4051-b101-85b00cbfafa2	t
9157837e-b1a2-4e9b-bfdd-bae1db5cbfb8	f9677c86-e23f-4bab-93fa-f7783c5c1c5e	t
9157837e-b1a2-4e9b-bfdd-bae1db5cbfb8	b24fdd04-b181-4b39-9b3a-29be3c97f23b	f
9157837e-b1a2-4e9b-bfdd-bae1db5cbfb8	6baeb1e4-5a67-44fc-9269-c93cf783e8b6	f
9157837e-b1a2-4e9b-bfdd-bae1db5cbfb8	01e81168-7b2e-4b1c-bcb0-60b6adb8790b	f
9157837e-b1a2-4e9b-bfdd-bae1db5cbfb8	50438cea-d3d2-4899-906c-e4ddb2d5af4c	f
cffc5219-17ab-4975-9cb6-6fea795df321	da011c93-b2d6-4cb9-b86f-fbdaf1417589	t
cffc5219-17ab-4975-9cb6-6fea795df321	54700f07-9d14-4643-9995-ac2edc1e1a43	t
cffc5219-17ab-4975-9cb6-6fea795df321	fa50c35c-246a-4e68-9485-aee1af65973c	t
cffc5219-17ab-4975-9cb6-6fea795df321	720899a6-d63d-4051-b101-85b00cbfafa2	t
cffc5219-17ab-4975-9cb6-6fea795df321	f9677c86-e23f-4bab-93fa-f7783c5c1c5e	t
cffc5219-17ab-4975-9cb6-6fea795df321	b24fdd04-b181-4b39-9b3a-29be3c97f23b	f
cffc5219-17ab-4975-9cb6-6fea795df321	6baeb1e4-5a67-44fc-9269-c93cf783e8b6	f
cffc5219-17ab-4975-9cb6-6fea795df321	01e81168-7b2e-4b1c-bcb0-60b6adb8790b	f
cffc5219-17ab-4975-9cb6-6fea795df321	50438cea-d3d2-4899-906c-e4ddb2d5af4c	f
921c5cbb-1554-4506-a676-f9a82f5a43e0	da011c93-b2d6-4cb9-b86f-fbdaf1417589	t
921c5cbb-1554-4506-a676-f9a82f5a43e0	54700f07-9d14-4643-9995-ac2edc1e1a43	t
921c5cbb-1554-4506-a676-f9a82f5a43e0	fa50c35c-246a-4e68-9485-aee1af65973c	t
921c5cbb-1554-4506-a676-f9a82f5a43e0	720899a6-d63d-4051-b101-85b00cbfafa2	t
921c5cbb-1554-4506-a676-f9a82f5a43e0	f9677c86-e23f-4bab-93fa-f7783c5c1c5e	t
921c5cbb-1554-4506-a676-f9a82f5a43e0	b24fdd04-b181-4b39-9b3a-29be3c97f23b	f
921c5cbb-1554-4506-a676-f9a82f5a43e0	6baeb1e4-5a67-44fc-9269-c93cf783e8b6	f
921c5cbb-1554-4506-a676-f9a82f5a43e0	01e81168-7b2e-4b1c-bcb0-60b6adb8790b	f
921c5cbb-1554-4506-a676-f9a82f5a43e0	50438cea-d3d2-4899-906c-e4ddb2d5af4c	f
22250aec-2f60-4c70-be7d-84efdf67cd02	da011c93-b2d6-4cb9-b86f-fbdaf1417589	t
22250aec-2f60-4c70-be7d-84efdf67cd02	54700f07-9d14-4643-9995-ac2edc1e1a43	t
22250aec-2f60-4c70-be7d-84efdf67cd02	fa50c35c-246a-4e68-9485-aee1af65973c	t
22250aec-2f60-4c70-be7d-84efdf67cd02	720899a6-d63d-4051-b101-85b00cbfafa2	t
22250aec-2f60-4c70-be7d-84efdf67cd02	f9677c86-e23f-4bab-93fa-f7783c5c1c5e	t
22250aec-2f60-4c70-be7d-84efdf67cd02	b24fdd04-b181-4b39-9b3a-29be3c97f23b	f
22250aec-2f60-4c70-be7d-84efdf67cd02	6baeb1e4-5a67-44fc-9269-c93cf783e8b6	f
22250aec-2f60-4c70-be7d-84efdf67cd02	01e81168-7b2e-4b1c-bcb0-60b6adb8790b	f
22250aec-2f60-4c70-be7d-84efdf67cd02	50438cea-d3d2-4899-906c-e4ddb2d5af4c	f
782c9a9c-5265-489d-93b8-f643d3a65485	da011c93-b2d6-4cb9-b86f-fbdaf1417589	t
782c9a9c-5265-489d-93b8-f643d3a65485	54700f07-9d14-4643-9995-ac2edc1e1a43	t
782c9a9c-5265-489d-93b8-f643d3a65485	fa50c35c-246a-4e68-9485-aee1af65973c	t
782c9a9c-5265-489d-93b8-f643d3a65485	720899a6-d63d-4051-b101-85b00cbfafa2	t
782c9a9c-5265-489d-93b8-f643d3a65485	f9677c86-e23f-4bab-93fa-f7783c5c1c5e	t
782c9a9c-5265-489d-93b8-f643d3a65485	b24fdd04-b181-4b39-9b3a-29be3c97f23b	f
782c9a9c-5265-489d-93b8-f643d3a65485	6baeb1e4-5a67-44fc-9269-c93cf783e8b6	f
782c9a9c-5265-489d-93b8-f643d3a65485	01e81168-7b2e-4b1c-bcb0-60b6adb8790b	f
782c9a9c-5265-489d-93b8-f643d3a65485	50438cea-d3d2-4899-906c-e4ddb2d5af4c	f
24d3129e-77a1-433d-8aca-5ca60358e1f2	a30791eb-00c8-473d-874b-1be1e1de3eb4	t
24d3129e-77a1-433d-8aca-5ca60358e1f2	9e1f9b70-0657-426e-9f0b-1dac5186b21a	t
24d3129e-77a1-433d-8aca-5ca60358e1f2	f82da954-d81d-4b3a-aa29-da7b79776d11	t
24d3129e-77a1-433d-8aca-5ca60358e1f2	0073ce65-ec67-4986-ac1c-adcc813add33	t
24d3129e-77a1-433d-8aca-5ca60358e1f2	51491e9a-c869-4d38-b846-be8a1c0b6dda	t
24d3129e-77a1-433d-8aca-5ca60358e1f2	1c1dee26-9bd9-4bd0-8e7d-877e4c6c8909	f
24d3129e-77a1-433d-8aca-5ca60358e1f2	bf3b318a-197c-486b-8637-3ae06c7d6323	f
24d3129e-77a1-433d-8aca-5ca60358e1f2	f9dc6d51-8a3c-4425-ad2d-7ce1670d2d07	f
24d3129e-77a1-433d-8aca-5ca60358e1f2	d0252463-f536-4cdf-9942-17a52a1c040d	f
db49f247-6905-4342-8db8-a3dcaad2a856	a30791eb-00c8-473d-874b-1be1e1de3eb4	t
db49f247-6905-4342-8db8-a3dcaad2a856	9e1f9b70-0657-426e-9f0b-1dac5186b21a	t
db49f247-6905-4342-8db8-a3dcaad2a856	f82da954-d81d-4b3a-aa29-da7b79776d11	t
db49f247-6905-4342-8db8-a3dcaad2a856	0073ce65-ec67-4986-ac1c-adcc813add33	t
db49f247-6905-4342-8db8-a3dcaad2a856	51491e9a-c869-4d38-b846-be8a1c0b6dda	t
db49f247-6905-4342-8db8-a3dcaad2a856	1c1dee26-9bd9-4bd0-8e7d-877e4c6c8909	f
db49f247-6905-4342-8db8-a3dcaad2a856	bf3b318a-197c-486b-8637-3ae06c7d6323	f
db49f247-6905-4342-8db8-a3dcaad2a856	f9dc6d51-8a3c-4425-ad2d-7ce1670d2d07	f
db49f247-6905-4342-8db8-a3dcaad2a856	d0252463-f536-4cdf-9942-17a52a1c040d	f
a9c10427-a7e7-4c7e-a32f-05853b2460d8	a30791eb-00c8-473d-874b-1be1e1de3eb4	t
a9c10427-a7e7-4c7e-a32f-05853b2460d8	9e1f9b70-0657-426e-9f0b-1dac5186b21a	t
a9c10427-a7e7-4c7e-a32f-05853b2460d8	f82da954-d81d-4b3a-aa29-da7b79776d11	t
a9c10427-a7e7-4c7e-a32f-05853b2460d8	0073ce65-ec67-4986-ac1c-adcc813add33	t
a9c10427-a7e7-4c7e-a32f-05853b2460d8	51491e9a-c869-4d38-b846-be8a1c0b6dda	t
a9c10427-a7e7-4c7e-a32f-05853b2460d8	1c1dee26-9bd9-4bd0-8e7d-877e4c6c8909	f
a9c10427-a7e7-4c7e-a32f-05853b2460d8	bf3b318a-197c-486b-8637-3ae06c7d6323	f
a9c10427-a7e7-4c7e-a32f-05853b2460d8	f9dc6d51-8a3c-4425-ad2d-7ce1670d2d07	f
a9c10427-a7e7-4c7e-a32f-05853b2460d8	d0252463-f536-4cdf-9942-17a52a1c040d	f
395b2613-f89c-4d8f-9b47-51c829e39096	a30791eb-00c8-473d-874b-1be1e1de3eb4	t
395b2613-f89c-4d8f-9b47-51c829e39096	9e1f9b70-0657-426e-9f0b-1dac5186b21a	t
395b2613-f89c-4d8f-9b47-51c829e39096	f82da954-d81d-4b3a-aa29-da7b79776d11	t
395b2613-f89c-4d8f-9b47-51c829e39096	0073ce65-ec67-4986-ac1c-adcc813add33	t
395b2613-f89c-4d8f-9b47-51c829e39096	51491e9a-c869-4d38-b846-be8a1c0b6dda	t
395b2613-f89c-4d8f-9b47-51c829e39096	1c1dee26-9bd9-4bd0-8e7d-877e4c6c8909	f
395b2613-f89c-4d8f-9b47-51c829e39096	bf3b318a-197c-486b-8637-3ae06c7d6323	f
395b2613-f89c-4d8f-9b47-51c829e39096	f9dc6d51-8a3c-4425-ad2d-7ce1670d2d07	f
395b2613-f89c-4d8f-9b47-51c829e39096	d0252463-f536-4cdf-9942-17a52a1c040d	f
445fa568-9548-4edc-af03-64b0e774af28	a30791eb-00c8-473d-874b-1be1e1de3eb4	t
445fa568-9548-4edc-af03-64b0e774af28	9e1f9b70-0657-426e-9f0b-1dac5186b21a	t
445fa568-9548-4edc-af03-64b0e774af28	f82da954-d81d-4b3a-aa29-da7b79776d11	t
445fa568-9548-4edc-af03-64b0e774af28	0073ce65-ec67-4986-ac1c-adcc813add33	t
445fa568-9548-4edc-af03-64b0e774af28	51491e9a-c869-4d38-b846-be8a1c0b6dda	t
445fa568-9548-4edc-af03-64b0e774af28	1c1dee26-9bd9-4bd0-8e7d-877e4c6c8909	f
445fa568-9548-4edc-af03-64b0e774af28	bf3b318a-197c-486b-8637-3ae06c7d6323	f
445fa568-9548-4edc-af03-64b0e774af28	f9dc6d51-8a3c-4425-ad2d-7ce1670d2d07	f
445fa568-9548-4edc-af03-64b0e774af28	d0252463-f536-4cdf-9942-17a52a1c040d	f
d83c087a-02f9-4790-b1f6-fb0e345b08f1	a30791eb-00c8-473d-874b-1be1e1de3eb4	t
d83c087a-02f9-4790-b1f6-fb0e345b08f1	9e1f9b70-0657-426e-9f0b-1dac5186b21a	t
d83c087a-02f9-4790-b1f6-fb0e345b08f1	f82da954-d81d-4b3a-aa29-da7b79776d11	t
d83c087a-02f9-4790-b1f6-fb0e345b08f1	0073ce65-ec67-4986-ac1c-adcc813add33	t
d83c087a-02f9-4790-b1f6-fb0e345b08f1	51491e9a-c869-4d38-b846-be8a1c0b6dda	t
d83c087a-02f9-4790-b1f6-fb0e345b08f1	1c1dee26-9bd9-4bd0-8e7d-877e4c6c8909	f
d83c087a-02f9-4790-b1f6-fb0e345b08f1	bf3b318a-197c-486b-8637-3ae06c7d6323	f
d83c087a-02f9-4790-b1f6-fb0e345b08f1	f9dc6d51-8a3c-4425-ad2d-7ce1670d2d07	f
d83c087a-02f9-4790-b1f6-fb0e345b08f1	d0252463-f536-4cdf-9942-17a52a1c040d	f
5b8cf74f-3eec-46a4-9d3c-c52ef7bbc818	a30791eb-00c8-473d-874b-1be1e1de3eb4	t
5b8cf74f-3eec-46a4-9d3c-c52ef7bbc818	9e1f9b70-0657-426e-9f0b-1dac5186b21a	t
5b8cf74f-3eec-46a4-9d3c-c52ef7bbc818	f82da954-d81d-4b3a-aa29-da7b79776d11	t
5b8cf74f-3eec-46a4-9d3c-c52ef7bbc818	0073ce65-ec67-4986-ac1c-adcc813add33	t
5b8cf74f-3eec-46a4-9d3c-c52ef7bbc818	51491e9a-c869-4d38-b846-be8a1c0b6dda	t
5b8cf74f-3eec-46a4-9d3c-c52ef7bbc818	1c1dee26-9bd9-4bd0-8e7d-877e4c6c8909	f
5b8cf74f-3eec-46a4-9d3c-c52ef7bbc818	bf3b318a-197c-486b-8637-3ae06c7d6323	f
5b8cf74f-3eec-46a4-9d3c-c52ef7bbc818	f9dc6d51-8a3c-4425-ad2d-7ce1670d2d07	f
5b8cf74f-3eec-46a4-9d3c-c52ef7bbc818	d0252463-f536-4cdf-9942-17a52a1c040d	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
01e81168-7b2e-4b1c-bcb0-60b6adb8790b	2660b200-13f3-4249-affa-6831e931f272
1c1dee26-9bd9-4bd0-8e7d-877e4c6c8909	579e3338-0fab-4462-9411-7b3d1a8efc20
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
bfd4d68b-fe2d-4007-a112-8529c35858c1	Trusted Hosts	5486cd06-0bdd-43e9-bdf8-d68e838140cd	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	5486cd06-0bdd-43e9-bdf8-d68e838140cd	anonymous
8e6491d9-c39b-4581-b16f-0f9ff38e9291	Consent Required	5486cd06-0bdd-43e9-bdf8-d68e838140cd	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	5486cd06-0bdd-43e9-bdf8-d68e838140cd	anonymous
4e4f9840-73ea-44e1-89ad-91ba04f0cdff	Full Scope Disabled	5486cd06-0bdd-43e9-bdf8-d68e838140cd	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	5486cd06-0bdd-43e9-bdf8-d68e838140cd	anonymous
506632f7-8eec-4c02-a7b5-125a2db0923f	Max Clients Limit	5486cd06-0bdd-43e9-bdf8-d68e838140cd	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	5486cd06-0bdd-43e9-bdf8-d68e838140cd	anonymous
a5e0380f-e0e0-4eaa-96c1-9da8f3d798b8	Allowed Protocol Mapper Types	5486cd06-0bdd-43e9-bdf8-d68e838140cd	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	5486cd06-0bdd-43e9-bdf8-d68e838140cd	anonymous
091e36f0-569a-4cae-bdf8-236d252aa0c7	Allowed Client Scopes	5486cd06-0bdd-43e9-bdf8-d68e838140cd	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	5486cd06-0bdd-43e9-bdf8-d68e838140cd	anonymous
a24380a5-243e-4bd6-aa68-ad61a1f0f1c1	Allowed Protocol Mapper Types	5486cd06-0bdd-43e9-bdf8-d68e838140cd	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	5486cd06-0bdd-43e9-bdf8-d68e838140cd	authenticated
7b6f4ced-a632-4dcb-8adb-de3fd94d43cc	Allowed Client Scopes	5486cd06-0bdd-43e9-bdf8-d68e838140cd	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	5486cd06-0bdd-43e9-bdf8-d68e838140cd	authenticated
62ac9fe2-f432-418a-b597-0bc49771f775	rsa-generated	5486cd06-0bdd-43e9-bdf8-d68e838140cd	rsa-generated	org.keycloak.keys.KeyProvider	5486cd06-0bdd-43e9-bdf8-d68e838140cd	\N
22c55891-32b1-4688-becf-26b21243fcbf	rsa-enc-generated	5486cd06-0bdd-43e9-bdf8-d68e838140cd	rsa-enc-generated	org.keycloak.keys.KeyProvider	5486cd06-0bdd-43e9-bdf8-d68e838140cd	\N
7af60fba-9b64-4bbc-a1d7-37e3d6b7bb42	hmac-generated	5486cd06-0bdd-43e9-bdf8-d68e838140cd	hmac-generated	org.keycloak.keys.KeyProvider	5486cd06-0bdd-43e9-bdf8-d68e838140cd	\N
d33f22a5-fbce-4a0d-8f59-31982e2ecd64	aes-generated	5486cd06-0bdd-43e9-bdf8-d68e838140cd	aes-generated	org.keycloak.keys.KeyProvider	5486cd06-0bdd-43e9-bdf8-d68e838140cd	\N
1d946a2c-eebb-4b2f-98e5-be1307f066a4	rsa-generated	52972857-3a02-44f3-8c45-983c95924d7f	rsa-generated	org.keycloak.keys.KeyProvider	52972857-3a02-44f3-8c45-983c95924d7f	\N
6c15e5f3-fbb0-47cd-95a5-f03bd25d1486	rsa-enc-generated	52972857-3a02-44f3-8c45-983c95924d7f	rsa-enc-generated	org.keycloak.keys.KeyProvider	52972857-3a02-44f3-8c45-983c95924d7f	\N
e1be3e74-59cc-489b-9b69-743f4801e315	hmac-generated	52972857-3a02-44f3-8c45-983c95924d7f	hmac-generated	org.keycloak.keys.KeyProvider	52972857-3a02-44f3-8c45-983c95924d7f	\N
7a0d2701-4e4d-4448-af1d-32cf236e28b4	aes-generated	52972857-3a02-44f3-8c45-983c95924d7f	aes-generated	org.keycloak.keys.KeyProvider	52972857-3a02-44f3-8c45-983c95924d7f	\N
7a5e6892-ebcc-4d08-98fc-e3932e1b05d7	Trusted Hosts	52972857-3a02-44f3-8c45-983c95924d7f	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	52972857-3a02-44f3-8c45-983c95924d7f	anonymous
44bd1f70-fb52-46ae-917c-5dee85406024	Consent Required	52972857-3a02-44f3-8c45-983c95924d7f	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	52972857-3a02-44f3-8c45-983c95924d7f	anonymous
83d46f89-7c17-4dbf-96af-a1e5be0bbe9f	Full Scope Disabled	52972857-3a02-44f3-8c45-983c95924d7f	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	52972857-3a02-44f3-8c45-983c95924d7f	anonymous
3e082339-22b5-44d2-9d0b-3e4b1b03dcaa	Max Clients Limit	52972857-3a02-44f3-8c45-983c95924d7f	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	52972857-3a02-44f3-8c45-983c95924d7f	anonymous
39834209-8a96-4d5b-a471-0668bdf3dcec	Allowed Protocol Mapper Types	52972857-3a02-44f3-8c45-983c95924d7f	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	52972857-3a02-44f3-8c45-983c95924d7f	anonymous
6f1dbc44-575b-47e6-a555-6f2971869d7a	Allowed Client Scopes	52972857-3a02-44f3-8c45-983c95924d7f	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	52972857-3a02-44f3-8c45-983c95924d7f	anonymous
01bc281c-51ee-44f5-9d05-f7cc2487c670	Allowed Protocol Mapper Types	52972857-3a02-44f3-8c45-983c95924d7f	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	52972857-3a02-44f3-8c45-983c95924d7f	authenticated
96510488-ae41-4ef7-8810-3c13dc420915	Allowed Client Scopes	52972857-3a02-44f3-8c45-983c95924d7f	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	52972857-3a02-44f3-8c45-983c95924d7f	authenticated
e521aae7-f469-4662-88fe-efd92be6d204	\N	52972857-3a02-44f3-8c45-983c95924d7f	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	52972857-3a02-44f3-8c45-983c95924d7f	\N
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
57a135d3-930a-4c5d-af80-68ebafbae6bf	7b6f4ced-a632-4dcb-8adb-de3fd94d43cc	allow-default-scopes	true
600abd30-41dd-4fdf-9766-0626d16d2e1c	a5e0380f-e0e0-4eaa-96c1-9da8f3d798b8	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
aa9f0028-25ba-4d85-94c0-80a3f7a27550	a5e0380f-e0e0-4eaa-96c1-9da8f3d798b8	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
c9326bf3-380b-4e11-9855-bf74e443f1ab	a5e0380f-e0e0-4eaa-96c1-9da8f3d798b8	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
78a40bb0-ff31-4fdf-9c18-4026d1bcfcf9	a5e0380f-e0e0-4eaa-96c1-9da8f3d798b8	allowed-protocol-mapper-types	saml-user-property-mapper
758c030e-6652-4d26-8c45-7e1c30537d7c	a5e0380f-e0e0-4eaa-96c1-9da8f3d798b8	allowed-protocol-mapper-types	oidc-address-mapper
4b2d9d2e-3cae-488b-9be5-99bce0cd1e9a	a5e0380f-e0e0-4eaa-96c1-9da8f3d798b8	allowed-protocol-mapper-types	oidc-full-name-mapper
5ec3e507-dd9d-4ca0-a7cc-5469e2a6b4b9	a5e0380f-e0e0-4eaa-96c1-9da8f3d798b8	allowed-protocol-mapper-types	saml-role-list-mapper
b12bdb7c-79a4-468e-9260-e3efa27da3c7	a5e0380f-e0e0-4eaa-96c1-9da8f3d798b8	allowed-protocol-mapper-types	saml-user-attribute-mapper
5fd29423-bcb8-470f-9aea-925db3fca6e9	091e36f0-569a-4cae-bdf8-236d252aa0c7	allow-default-scopes	true
3f56ced9-59a7-468f-a244-fc83a02b8fdb	bfd4d68b-fe2d-4007-a112-8529c35858c1	host-sending-registration-request-must-match	true
e8cdd1f0-aabc-4498-b1da-a47355457a2c	bfd4d68b-fe2d-4007-a112-8529c35858c1	client-uris-must-match	true
ea2f5e9e-8e24-4760-8221-6ce68bb1cd6d	a24380a5-243e-4bd6-aa68-ad61a1f0f1c1	allowed-protocol-mapper-types	oidc-address-mapper
8d48eca5-3d2e-47b7-bf9c-2f777c1478df	a24380a5-243e-4bd6-aa68-ad61a1f0f1c1	allowed-protocol-mapper-types	saml-user-property-mapper
170035ac-1a28-46bf-b207-64fbca992395	a24380a5-243e-4bd6-aa68-ad61a1f0f1c1	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
ab241798-12ae-4cf4-b929-0735636c5b5a	a24380a5-243e-4bd6-aa68-ad61a1f0f1c1	allowed-protocol-mapper-types	saml-user-attribute-mapper
d75aeb8d-f72e-43e6-84a1-b1984198f282	a24380a5-243e-4bd6-aa68-ad61a1f0f1c1	allowed-protocol-mapper-types	oidc-full-name-mapper
1c0851c6-f219-4e4a-be8a-972aeb01d7da	a24380a5-243e-4bd6-aa68-ad61a1f0f1c1	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
717b7a5b-8945-4975-af54-9a29e21501cd	a24380a5-243e-4bd6-aa68-ad61a1f0f1c1	allowed-protocol-mapper-types	saml-role-list-mapper
b10792af-25ed-46f6-ae0e-4b34263f00ed	a24380a5-243e-4bd6-aa68-ad61a1f0f1c1	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
49015aac-4654-4ba8-8762-9db92008815d	506632f7-8eec-4c02-a7b5-125a2db0923f	max-clients	200
36ff4fa2-056a-427d-bfc3-529de69d96e0	d33f22a5-fbce-4a0d-8f59-31982e2ecd64	secret	cUNN74Vzr51Zj4YnOLWXDQ
864b17c9-240f-488b-8628-1a7b9d162a0d	d33f22a5-fbce-4a0d-8f59-31982e2ecd64	kid	6d865c49-566f-4a51-bf56-a0a82962c170
090cb314-3237-4784-ae3d-57b8f912432f	d33f22a5-fbce-4a0d-8f59-31982e2ecd64	priority	100
06c1bf87-a15c-4b25-b3f0-794d69eb3376	7af60fba-9b64-4bbc-a1d7-37e3d6b7bb42	secret	2i9Dxzk2ZeM8BZKteYnkay4QAK-bzztOe0BWdSj7VtPZ1U1vS8B_swOUYdpiY1mH6uDWHfoj41qCwvEsiNxYkw
60741cc9-e9f2-4c58-b78a-ed9140881e95	7af60fba-9b64-4bbc-a1d7-37e3d6b7bb42	algorithm	HS256
48b7aeeb-d7e3-49ea-bfab-6fc4e21b0425	7af60fba-9b64-4bbc-a1d7-37e3d6b7bb42	kid	9f98fe91-e4b4-4025-afde-b7967b5cf6ad
73162508-7a04-4a8c-90ea-c39c76241530	7af60fba-9b64-4bbc-a1d7-37e3d6b7bb42	priority	100
cad07672-0a6b-443f-8203-1f979937a22b	62ac9fe2-f432-418a-b597-0bc49771f775	priority	100
08976c75-82ef-4ba0-9953-07a5af1f68ec	62ac9fe2-f432-418a-b597-0bc49771f775	certificate	MIICmzCCAYMCBgGDRSJaXjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIwOTE2MDcwODQyWhcNMzIwOTE2MDcxMDIyWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCimptlqVAX/AQaFfMekQvFvfvMzTHtD/Bf9lq7LiK7iDjnUHF7E4uGYXER40Hc0lgsgrw7xR9i0dan6OxWs8X2yGtU8hGkxtpCzDkL3Tmb8BRppArGgaiHjXFuGAxoly+7kaSEg+y8QHT0Jvj9ulmEExKcST2aX7+SXJG9nfRBaamRNbwXJUy4Yh5ThsCRpcCRpC1P4zSnSH4g5JhG/OyPMtsFdGC7g3wVLsxRcAvS0x5iHw+DQzTGm45GGTpuFkIm3Gy6K9Z9I4XkpDMtGVG01MKdRdR+WzKeFAWdWnLfh431wq0/6S7UalH3PiG+1p7I163d2vvPQPWxkQaZlcDtAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAG9C/GMLrR+QO0T4qmI6a52TXUw8A3dbthkQVf6Jqnjl/x6cG+qoc/7/CrXZoaV/LzCNluPoVGlrFVg942AzuQYInbNvJ7i0DG0qzV2uC/GT9yBv4H12lpukDh+g1QQ6qNlxdf+3UzOnWUtFpZikBZbvhxznG9ptMp/W3karvz6vRWT6aojUYo9k9E6DBuW4iSNVhC5LEQ+zOAGQ4ndTKIIjTghsIGqlvosd4MpB1mJPvdvcrNVv48NFkGqYHnR65N8tLqzI5fS0qhCSEK7MLEuW5GQJ+rb8+F/7bzoBbEYaTPRUoig/7Jy5nJJ0UG9Adur0TqQ1cqk4L9PhsvhixSA=
bf088144-1c36-48c1-ba0f-77a6e1550a64	62ac9fe2-f432-418a-b597-0bc49771f775	privateKey	MIIEpAIBAAKCAQEAopqbZalQF/wEGhXzHpELxb37zM0x7Q/wX/Zauy4iu4g451BxexOLhmFxEeNB3NJYLIK8O8UfYtHWp+jsVrPF9shrVPIRpMbaQsw5C905m/AUaaQKxoGoh41xbhgMaJcvu5GkhIPsvEB09Cb4/bpZhBMSnEk9ml+/klyRvZ30QWmpkTW8FyVMuGIeU4bAkaXAkaQtT+M0p0h+IOSYRvzsjzLbBXRgu4N8FS7MUXAL0tMeYh8Pg0M0xpuORhk6bhZCJtxsuivWfSOF5KQzLRlRtNTCnUXUflsynhQFnVpy34eN9cKtP+ku1GpR9z4hvtaeyNet3dr7z0D1sZEGmZXA7QIDAQABAoIBAFBuXJa1YQZ0JQ1INTm18pZOKvr7twn12+eD4w56vDh6IfedjXydRuNiWL1J5f7WV0IxKu3/zE4j0OO+rgUXKMGxEpJyqPKSYE0xWrh5JfFyGI7G04OsiBIBD44vPBgSTMyhtrjLzvKxiYhprLlJD9VqX8bJ3bx6RzcdLgQW2UbvNEtEvEskaGcwGX0czg+SrhGo6BULd5N5S9MlR3sGDU5I4TJcTLRS285oefxU+AhXyduV20caDJemnIFKUv2JClxqNE0pRBAG0T8CrQ8fTFI0/r1rfGBFR0Ix89QUrxsb+9XvB+8mTO5UybpCBKrVmN4bkDYvVW1NJNWyINeonUsCgYEA25Qn6rjTPb/6qX+wTPifn2J/32J7AJ69wp5QuZeIVY1vXUNHfO9Qxri2ZrALhERL1YnlLf/q2yg9zZsZnfK3rPKzA0EQv6qfHYGwm56JcjbnKwSSjdDUQhkiuGltE9w5mulIrB+HppyjYEbIl1DdpClENtxhEqSglhqJS4If7JMCgYEAvZMpzN498MqS9JZBO6YQWuaBdIQr8MZ9HaBdOc1aZJ0ZeT1SGpHvCc0oZsr1cKIiU/8DqlRR7aVOWSzNZGgZwfLGO3VfvFkwatoL3ODJT+Oxn318TY3X3xM6f5bVLWPWGftAGdWtgRb+vVsQNhxhBh+oU327EFmnAHfhglqFjH8CgYEArSbH03CsI6WgJMlsXUYxmZ4y+BTQqkyDl1UAk1nLSKufhgvn871EFXDTZWatrj+tDVcQQpXsvaWeFuSX7tXXwaohQA+vBXWmw73hZtY9zLM+181jRDHJL9Ziasm4GlEvm9kaVaEHd3tN2j33MFu0bB+eiyR96BWqDLQgUErsocECgYA1w/YX93QDxcA2BCNOIoQC89sFS7MWn4S+kUu/aAFaBcBCxWRyyq7LzdbGiIthvWoU/n9woGd4CekVm4JJFskvW4ZjOJ/FUFpOA7dXlp0hvkcTH8jQSglOaCqwIvwk2mrPhZWhfhuuP/JRi/EmF5hg3zujKkaSlYqqtFVN3hSASwKBgQCShiNtp90gZ4moG2OFfim4tNaTOED+DbunYnTzzgKZHXJ6VPDWaWZsS+Ea5q3gDJHqGa1+3Aj82IuTevaCB8q9/+eRZ8/gL88zAw6ZJEu4veQMHcFLY7F4Nyx5XTSxtSsNl53zR4Y0CCQFD7RgYI9ZMRouH1SRKq207oAIMffBVQ==
8a3f297a-8b10-4ea8-b986-b09141803d97	62ac9fe2-f432-418a-b597-0bc49771f775	keyUse	SIG
29ce7928-e0c3-47bd-b33f-09074ac064b6	22c55891-32b1-4688-becf-26b21243fcbf	algorithm	RSA-OAEP
1f95c433-9b2a-4534-8ec7-285cf14fb32e	22c55891-32b1-4688-becf-26b21243fcbf	keyUse	ENC
3fc4fca7-a85b-402a-afa4-e651caae2334	22c55891-32b1-4688-becf-26b21243fcbf	priority	100
5149db7f-e29e-4840-be32-b51ccd7cbdd4	22c55891-32b1-4688-becf-26b21243fcbf	privateKey	MIIEogIBAAKCAQEAy1fbJVYLcs6xJmWVj26a6jE0w3Mjy3Dw4vhvbUZmkuX3taDgk/EmO2XYDWfIWx/rBh/VelTUaYopxkfDcTmBX7CzPb+BoQ6fD5XnXXXRBknCJ4gwAIT9LTIDTf/Tsv1mkvem3jO3Pp0WiuI6l4iePeHkCLORJxotmhDg3mGLSVcMScv0RGhYzphIqr3Xp+1wk6gMgHZok4ebuCyQ5SrZ8jnpHJmqkhY/4OrmdIA0+EflC/E+SCL6O7XZLR98c0rMWLBxeNG3/96ytWutSfyvCjhTjQ8jWEGQHGSqEyIuipHmhwQa2OFRPs+ETGNTkOl8CREKupJGP9u5IlExo4zIsQIDAQABAoIBADFcrD8Bxokx+kiZJ+eYAMTBua6JpKKWEe/zQa9sA+n8p/egLGxVgcOxCzPj4fwXATltIGhQL/lH2DDBSoVRoaGeVkCy3M/BaiUBLZdfSqTlYluw4IA7yG8AgVNdu2EryQr70fcGZGEvhqGj3ffbqxhYHgBrwNyWawQHvWLWmJauewUwQpJqbzBcBAD/9rAoV6UQd+9qvw7WuMXVZwnkKqG2jbxEjjRO5blurRzfP8RYjfksgyL/ext9iZTVva6PKYkwOftdRnoEe+ju8jDUWtB1MNZKSF71yj8mNGeswZwak0OI8kKICJQkZbF4VWzdqVfYgZUGKHRJeWA4p9oNlu0CgYEA+NaLTYscnI8FPfuWN3J7uJum62jiepbwUJjCyZFjYgYNnBLX24RlGPDHfpt0/wzXIIkbrJyY4jiufZH7CttJPL9C1X04Ab0abOWqCjTaxmKtLI3GWXXEF5a1XnhJWQ1SpR4laSoTZ7x+bQEy7FMsPlDZKcDLVAYygoSVxXNeacUCgYEA0TIaP9E8S0l0hNAJrlOv8E5Isfe33rDI2D8KsodR+kmzV/ywt1+ULeNgIR0l9cpaB5BQoEK7KIzS8Hr/txM3Jbif+ewThoFYpLYMhAi2mhRt12PWNEGUMT4uEct/EXjBMMssDl93NOPJNf97tkxiiQfYJR0aBZBVb4DwuECWTf0CgYANEqBg44UOSIk692Ot6ArN6Qd86Ja1YAaiBVR+aG/zL2Q5pdfHRY5WIBgq85nS6GbI48sbZ2K0x8uK90dcC6cuVNH7C0gM91VTEUG8pYg00exNIemgu4ogvx8qJmGcFxIXcJ0AiGBam9F8goqdVcVGRNMT2XgVIvo2VybTJ7t3DQKBgHETA90627xWGAUx7gmsco0Rw3luzJQyOl2otb+KJWWEMMx+aYa0wwOKw4silkIk/kTYXLxDVaa1d89ErLPoTwa0pMQSNvudLqzZOiqkCw99u2GRNVdJmzCCy6QSurxW6RXWvBmIwIZ2GWx2jAgdgaVP+CUXddlMCuIacAMn5haBAoGAeGARa1sIsWfTBmQzqcK9u1JLIks2Yo2rBNRXb5HYJZOGNQsRKXXAuypZsOMDjyoTp8+uMdYkCXET7VnvUDyrmkU8RgjwMQgJQmq9DICU5q9E9tVQ0jNATUg74cKKAizJgl2jspVIwUXGtXNdOs6SDW/tTGb0j91re9+2X0NHZeM=
10b93037-6313-4385-8f64-f929eb6dc5c6	22c55891-32b1-4688-becf-26b21243fcbf	certificate	MIICmzCCAYMCBgGDRSJa3TANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIwOTE2MDcwODQyWhcNMzIwOTE2MDcxMDIyWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDLV9slVgtyzrEmZZWPbprqMTTDcyPLcPDi+G9tRmaS5fe1oOCT8SY7ZdgNZ8hbH+sGH9V6VNRpiinGR8NxOYFfsLM9v4GhDp8PleddddEGScIniDAAhP0tMgNN/9Oy/WaS96beM7c+nRaK4jqXiJ494eQIs5EnGi2aEODeYYtJVwxJy/REaFjOmEiqvden7XCTqAyAdmiTh5u4LJDlKtnyOekcmaqSFj/g6uZ0gDT4R+UL8T5IIvo7tdktH3xzSsxYsHF40bf/3rK1a61J/K8KOFONDyNYQZAcZKoTIi6KkeaHBBrY4VE+z4RMY1OQ6XwJEQq6kkY/27kiUTGjjMixAgMBAAEwDQYJKoZIhvcNAQELBQADggEBABEGOCZTj1vjdFT+Mlqdsy0LhoBdghbmivzM6LJhrCGvl5HV5qjN3y4d/C0PmJCKNWeEZ6uDe8wQyqf+AIAxk6SONH+ehdKzYa1S4EV9EdMjsRdxazprwZaNh5UDlaUri4Yu7pUrIgie/BxX61TzBrl+sJ6oPGWdBaW3B0kYDu0n0Ko18AySiBocy1EVw1r2Q7cywfBU0bt+VgCrqAsbYZNmZK+NRiTDDll6Y3QFomKVmEiA5gi7ExrUagKD6S9FTEIHNDQuR+xDOaCssx8fhGvkGNY/Htp/4VOSiboKBoo55UzwyQiNf5/tbf86Z4rqJ8eEbEBrOXEizjMU+dNLgcQ=
dd932f42-ea16-4903-9d26-855209dd91c4	e1be3e74-59cc-489b-9b69-743f4801e315	kid	6d867736-ab11-4feb-a05d-5a758e25df1b
da2cec2f-553e-4963-9e6c-0753d79154e8	e1be3e74-59cc-489b-9b69-743f4801e315	secret	oi_yHJSMP1UyN64U0uYanbGmfuOVxLNhOdTMjvnN-OdA_XI82IKXEf-M1nvP99FWtyJW-3kIqe8ebpCgjewtDQ
f33ebe23-9ffd-45bd-8b8f-9793689f70d1	e1be3e74-59cc-489b-9b69-743f4801e315	priority	100
d564638b-1065-4ed3-aeee-1d4f9ed9ff43	e1be3e74-59cc-489b-9b69-743f4801e315	algorithm	HS256
fbf6a329-6798-401b-acaa-86b6a1e13a72	7a0d2701-4e4d-4448-af1d-32cf236e28b4	secret	A-t3kUaLmZkO-ilwjb4WYg
b0b30d33-3b7e-4f1d-9c5a-89889d7e5b2f	7a0d2701-4e4d-4448-af1d-32cf236e28b4	kid	78d7a4de-5c28-4c4d-905d-d333c6243a7b
5532f534-022f-4409-98a4-c751a1f8db63	7a0d2701-4e4d-4448-af1d-32cf236e28b4	priority	100
2673056c-a58b-4d49-a6df-8895f478f06b	1d946a2c-eebb-4b2f-98e5-be1307f066a4	certificate	MIICnzCCAYcCBgGDRTGFeTANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDDAhteV9yZWFsbTAeFw0yMjA5MTYwNzI1MTZaFw0zMjA5MTYwNzI2NTZaMBMxETAPBgNVBAMMCG15X3JlYWxtMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAt4JlrbdUgc0rAl+C67wO7/W/PF3ccapWYtaziBJbZ7/q3/ekgJmignGslx0VNBrmwQKBC3yobINYL0uuNeF06lxzZYdtSOyOHRJSLn39XHhPZYVHs4L/Ucd9qydm5IlU6MO3uc10tkVGuYQj2gtZwC0BhHC8tZMMkORZQEP9B1dHifMeFwjg9ORAgxVHy3+Bm46Rq1H+rwL4w/R8JwtCdgPuF6oDwGoGamGT94ybTf2hlddnasS4wVF/PC+hPSBtHyjMW7nRrFHC5buHCjXyMkEsWZ4FMAbhn3v8Ka0j2dGG90mtcQwW/Mj3sEf0lScOUOm0FSF/YagpIMrwu9XBTQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQBlVMsXSah1x47Ny96z9cEWcuhO478L9OjtFYbXsZsDkflhqM/vsz/n7TZGG8V4vyoVl7NlJxygpbH9OUsPA0/dbUOhmvQJH7WKL5h7rzT3I1VAK6zqb9m2ogqF3Zvnk31pqHAyxgR+nzmwi04VLOogune3/1h1e+shW6y82AR+TRIt3cEXRYdF9pcN/L/R37aiJRMF9Zbdd55Bb9RCkUjLeOnh8SHoTYVUdsARtk7DS3Phe5xpW2t9T/CfEXYeo1/Do0g0QBdbPKXqnd/FuW0QqHnTlyAf3O75ZoOsZegmWoS4DEdgyfA1Z6bSo9IiM/UY8qQjMz9RPHG8TyK0U8Zu
0c5a1434-4b56-45c8-86c7-af4440c31afd	1d946a2c-eebb-4b2f-98e5-be1307f066a4	privateKey	MIIEpAIBAAKCAQEAt4JlrbdUgc0rAl+C67wO7/W/PF3ccapWYtaziBJbZ7/q3/ekgJmignGslx0VNBrmwQKBC3yobINYL0uuNeF06lxzZYdtSOyOHRJSLn39XHhPZYVHs4L/Ucd9qydm5IlU6MO3uc10tkVGuYQj2gtZwC0BhHC8tZMMkORZQEP9B1dHifMeFwjg9ORAgxVHy3+Bm46Rq1H+rwL4w/R8JwtCdgPuF6oDwGoGamGT94ybTf2hlddnasS4wVF/PC+hPSBtHyjMW7nRrFHC5buHCjXyMkEsWZ4FMAbhn3v8Ka0j2dGG90mtcQwW/Mj3sEf0lScOUOm0FSF/YagpIMrwu9XBTQIDAQABAoIBAALtYNICU7taqpC4CtEtV7SoCs6mSvsCMKy/ctoyZsRd0/E81KIw294w/Nk6lMkXE8QTljuOF8FcCqxTIfqIjTz5errCzAa8L/En8WkonSxxhodeoVFBqfEj7u3Wa/uscs8KuN53zUs6CYHck9Ypf7CYgdwbEJuPNrBaACV4YCvS3O4qYzS00hw8DtM5GZwmlkVPAnasl8RYOzuQgpyZ8JwoFlFmjv0ftRNUVqg3kPLi8ufPmp5wnkg5OzTqBD6da0srW/nBRqzy8wDKp+SHGfHjeg7aRpg8R4aurffJFODd1M1e6uH45XsHw3cy4VZkCjQ6i5a/0rqwCr0BfXuzvXECgYEA23PeWbkuqBU81/rztn4RD8SXRm0urE+b5feOU9Gl2HdeMPOy2SOXsNus7FHRHLj9EMhxVXO7YDKjdYoaDIF+CxZluar1AUI7lYguEzo1AwxcAV2wmsbhzKzjPqX6KScpg/oybyENuZcz2RNy/dD0uc4cZ2rsriKyU/T84SNavjECgYEA1hIgRFqUs4Ddfc7mH5jYuINAPem+PgB4yaurMMZlGNWvHJW4qvx68gaYQJSt17q32MtQnqML3N8JmULF76xPSh3TLdgSRiAaT6FYTzguM9v7QsdxEjX/ABn9+yvRBLW07bIqV9PFmvs0ZMJWBsKNpYU1yOjLV1rkQqkwHfSfYd0CgYEAkv9DMoCboxVOwzGjLFu3nANIfXFHMT7GI722RakJ2TzkCBBFfbOcuWf8pfOMChxTz3kkiWPTYHWrDmGqXzQiNNUU4NCF+wjdlqU4j8KOnfMacgPK93I+7/Xi5iURs5067t+aBtxyMB37Ke4gOapNM2S/m/qAfYhaQWi6NyiScRECgYB4rXU1M18api22q3k9HLwnoA4KGQffCgMNpVH3SBBb5LI3ygt1kKl6YM9ZsLcjoyXa+Bq1ozKfy7gshuDwkNGN9axD7se2coiClXEkD4a0Q3GsnqQWYQwksYJlIrlND2Y0jTijlEWUbcKGfqtiWjDhu2urm9htoVaGYbw3Vty2nQKBgQC9AyOrkCvHqoDbhRSGt80DCf5MYqWukKpF6gPlkmdXDiJLg8GJaIYKQVkVpJJ+1SlBOjhkUgkCpOkiEZBOwszE1t3FYViKPX9Sx4I8DiGErSww2w8PpAJqw6AFtQIkluWUpIFXGLOkbuio1gcinACkwh1H82LkcXa8nMir78EpNA==
31a86a61-8199-4b75-a73f-e2759f4bc84a	1d946a2c-eebb-4b2f-98e5-be1307f066a4	priority	100
6ec4bcca-609f-4deb-beba-d03428ba08df	1d946a2c-eebb-4b2f-98e5-be1307f066a4	keyUse	SIG
3c7544d9-2e3b-4efa-957c-6f870edd3874	6c15e5f3-fbb0-47cd-95a5-f03bd25d1486	algorithm	RSA-OAEP
49ee6c69-28ea-460b-966e-e637ea64765f	6c15e5f3-fbb0-47cd-95a5-f03bd25d1486	privateKey	MIIEoAIBAAKCAQEAmmHe6YPVmp07YT+HC2vN0MIUaSTgXz5ykE+0xcWI0ZHu3nOapvG9YLuT2S42ESbOuH5x+I/KegtREKUlhq4CV+t2IY6rE/9gKHUAcNhNBVu7hF+jGLCoaG5nuzZDBw5JMYX6NXA+ml3t/kiliOSpBsUPIiHoyujdC7bpyFYycHHSJGuGhV+pBmE71vl64EoXrA5LS85sQOB9j6TIudafGzGvRJB981kTM9TtZ5oSWt0G45WxhCO1lH2CkkX0FRyKnVttpVr9yYbjbtyEVMJmT0mdyYWx9R3gmTwVJKWIX4/ckro1itUWCbTNJQCsFC4TV0WNnj3twIugO+47DdogXQIDAQABAoIBAEq7WslGSKXWO/LY6jnUnyZRdMjrEXP5ikKiWtsrwo3UK0HiyzfKKIbFdo34yTJnS0VS7D/K91Q52y2IDBDUdgzyTdZztgvxoK4k6Sg3BJ216KFtHEns5jDbVPpyi2LEfxjqhpLMuXlHQ9hGeV85dTryNF+s84AZ1jr/+c5BL5xvNDEm2QBSXKKr8+xC6Vl6lSCKYixhXvmlxthtxC8PT5/ccYq+e3mQcibf2dFH50L2YK1I1zn0Wwc7tQuOCJSRGnUXjfC8fhDHZSwkgqnak29HirOp7TDnddHVFSzZNve5q8Tla3e7CZ0vwo08yiVoatbwJGZI6Srtu9BtSvRSAb8CgYEAycPav+NdT7/DWaFFv+6I6fpc3zNY2EX9Lp+rzYQy/kFQVeGZI9CD+2Gne7Gojkugj5kdGXJzdDCBb7m8fp3mPiIHXz1CoavKg0biWoWU0S7jD4Dw0PDDsluxIGzdJfrel4gSflD5g+Lr67Ysnzll4Af8GcesXQdZ7Cm8pWgng7sCgYEAw+FyYYmA15Q3Uusc/ND8Kl1Na2la+3NhF2CeE+hVauGNxTeqTIja+l1mbeOFpZbZw1o6AMjFptr7uGi96MosQY/q4e3reqDxFv99vd574eBhsrg1pvybv1Cn+DuTA6uZCYAe9Z0qJQWtOX6/I5zrwranKiLe/P8yl9a2diSjjscCfyRBDQ1tzVaHHpL8Z4wVUIS6d/WjRFOYP+Ygyr4jAwastcK4xsuorA5/fZi8U40+CZvD53arGhPGo3tv5G7b8IM5mhmC6HYkaD8ufX3GgvcTdblTcfIZURC7aRhqd1JbwaN4z9nisvL/02SHV31E0wluZd48Ary0lXPaDAusq20CgYAZnhNydCQ4jXbKzlrlKYPBGqC0anvupMFO6GDkI5+AMe1znHsWNVPGKI7r0jS5Wkgyh0tMrPVEhCEllfU4S7CMBoFmeNIyIHhHVLSiL0WuXcUJNZQ2uZS46Zh+G3R3p2qFVo81+g739o0YFt5yjuQ6e97S4Oqe1dVNDFSikNofIwKBgGPZ2glE/IP5DJZ6dxiQVRcW++Ug4rESuravyWS61CGvgmezxm6eFz6ur+mY/ptSnObkenoOVBV0CfYngIU+bZmyne1oBo5FGcs4UgMtzYw1ifb2PLJmneQvjxL8ht8NUsc8vs2Rdvy7NxSeKUNw8THCyqXJ2TDPlBJ4BhlST61r
5e5129b3-2a65-4df7-ad01-79a409cf551a	6c15e5f3-fbb0-47cd-95a5-f03bd25d1486	keyUse	ENC
fb487c26-0c88-487d-9a1b-b589a76f723c	6c15e5f3-fbb0-47cd-95a5-f03bd25d1486	priority	100
fbccbb5f-a39e-435f-8ddb-fc5299c038e3	6c15e5f3-fbb0-47cd-95a5-f03bd25d1486	certificate	MIICnzCCAYcCBgGDRTGHFDANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDDAhteV9yZWFsbTAeFw0yMjA5MTYwNzI1MTdaFw0zMjA5MTYwNzI2NTdaMBMxETAPBgNVBAMMCG15X3JlYWxtMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmmHe6YPVmp07YT+HC2vN0MIUaSTgXz5ykE+0xcWI0ZHu3nOapvG9YLuT2S42ESbOuH5x+I/KegtREKUlhq4CV+t2IY6rE/9gKHUAcNhNBVu7hF+jGLCoaG5nuzZDBw5JMYX6NXA+ml3t/kiliOSpBsUPIiHoyujdC7bpyFYycHHSJGuGhV+pBmE71vl64EoXrA5LS85sQOB9j6TIudafGzGvRJB981kTM9TtZ5oSWt0G45WxhCO1lH2CkkX0FRyKnVttpVr9yYbjbtyEVMJmT0mdyYWx9R3gmTwVJKWIX4/ckro1itUWCbTNJQCsFC4TV0WNnj3twIugO+47DdogXQIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQAT0O+WKuNdeTxg7NTXQVDWmdaMMDqFkybNpDUzN2ANZBMOIkloHFH733eAV+mG0SXLGikuUtndg7spnd2rvzttTuYbRilVwdg6HNE8tz4OlSAcZcrQ+Vn5rWayBH6myg91imNUSnyx4HUCBRaxo2psIY8mC3krenB3n/77YcFfRQpoYoIh8bZSFmKatuc9cjQSGNKHgTH1UxY9mBdHI/r2VCl5lj1Hf5JSKl/Lr/kaJc5APabiQ1qweSFKt38Gkv25hKyGMA5mVuoitII65i6js57cNoVZSvbWRPLI0zqOywXqXZo3JN5ojMmYpQKPw8t1NKm4SZAg9yTr/MzmfDyf
a8793181-c051-4ad0-851f-e1c5a1b1f42f	96510488-ae41-4ef7-8810-3c13dc420915	allow-default-scopes	true
49281091-14d6-4c69-928d-d8012d8d0c64	01bc281c-51ee-44f5-9d05-f7cc2487c670	allowed-protocol-mapper-types	oidc-full-name-mapper
af750ec0-0154-4ef7-879b-e13481067626	01bc281c-51ee-44f5-9d05-f7cc2487c670	allowed-protocol-mapper-types	saml-user-property-mapper
4f72ca00-838e-4f41-9b2b-8f1f224d2b04	01bc281c-51ee-44f5-9d05-f7cc2487c670	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
ec45e43a-d599-4be3-b3bf-cfdc25486c83	01bc281c-51ee-44f5-9d05-f7cc2487c670	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
eea27063-2771-4d6b-95dc-67bc89c13775	01bc281c-51ee-44f5-9d05-f7cc2487c670	allowed-protocol-mapper-types	saml-user-attribute-mapper
cb0d9299-bc3f-4566-a54a-357f8d823c81	01bc281c-51ee-44f5-9d05-f7cc2487c670	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
8a96260e-6734-4c1f-bebb-e45a66902d2b	01bc281c-51ee-44f5-9d05-f7cc2487c670	allowed-protocol-mapper-types	saml-role-list-mapper
7551b649-bc75-4ff0-b08a-a3efa89fc439	01bc281c-51ee-44f5-9d05-f7cc2487c670	allowed-protocol-mapper-types	oidc-address-mapper
140da8ef-a8d3-44ff-b31a-0316ba71c532	3e082339-22b5-44d2-9d0b-3e4b1b03dcaa	max-clients	200
fc5c4df2-9875-4987-baf6-4d2beab5b074	39834209-8a96-4d5b-a471-0668bdf3dcec	allowed-protocol-mapper-types	saml-user-attribute-mapper
4614e002-9233-4e77-a877-2aa4aee4bcb9	39834209-8a96-4d5b-a471-0668bdf3dcec	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
17ea8fee-7221-438b-8375-2d7298d72700	39834209-8a96-4d5b-a471-0668bdf3dcec	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
bae35325-6346-4d2a-902d-07b64aa9cfd1	39834209-8a96-4d5b-a471-0668bdf3dcec	allowed-protocol-mapper-types	oidc-address-mapper
d069013f-6748-4d08-8290-a697a42dfb96	39834209-8a96-4d5b-a471-0668bdf3dcec	allowed-protocol-mapper-types	saml-role-list-mapper
34a2ace8-eb3b-4166-99bd-279562ce5186	39834209-8a96-4d5b-a471-0668bdf3dcec	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
c6304528-e6f6-4855-b278-97ba43c6c28e	39834209-8a96-4d5b-a471-0668bdf3dcec	allowed-protocol-mapper-types	oidc-full-name-mapper
c9320914-cb36-49ad-9c66-b26632fecaf7	39834209-8a96-4d5b-a471-0668bdf3dcec	allowed-protocol-mapper-types	saml-user-property-mapper
4b2af3ec-fceb-4aef-9c43-edb088025d3e	7a5e6892-ebcc-4d08-98fc-e3932e1b05d7	host-sending-registration-request-must-match	true
0f78f3f1-c12b-41e9-a93f-7e796b3f61bf	7a5e6892-ebcc-4d08-98fc-e3932e1b05d7	client-uris-must-match	true
bcb77179-76b8-4e31-a427-84c31e600b27	6f1dbc44-575b-47e6-a555-6f2971869d7a	allow-default-scopes	true
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	d11bf827-2aa9-4362-b287-21892785d5c7
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	fa83350f-7be2-4056-ae0e-15408becac1d
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	d6400727-111e-436e-9a70-8f8dfbaf959e
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	50575f1c-2a3e-442f-a1dc-442438e420ab
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	dde7f70b-a3b2-49f0-b798-db4acfeb8bce
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	d923097c-6616-47db-8665-13ea000706a8
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	8c35956a-1f3d-44db-929c-e482d1702d25
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	641522d9-4198-440b-ab89-2bf9e7444faa
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	95208b18-bb3a-4083-a831-ce024a2b78c4
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	69c19d61-18c2-4bdf-872e-1de1769c9f81
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	bcf5be20-4737-46bc-a80d-e767969f9316
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	38e26450-1db2-42fd-a707-96a283df78e2
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	d4bd9f45-d8c9-4bf5-993d-c237dc2be5f6
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	caea8abd-5567-4708-83cc-cf19b060e3cb
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	15750073-3254-4472-b275-ad586317c542
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	39201832-977e-4503-9f1d-b92cefb23672
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	cb80bca4-c575-47e5-b535-77810cf69949
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	6e2d4260-e93f-4e36-be8b-df95fcf82c66
dde7f70b-a3b2-49f0-b798-db4acfeb8bce	39201832-977e-4503-9f1d-b92cefb23672
50575f1c-2a3e-442f-a1dc-442438e420ab	15750073-3254-4472-b275-ad586317c542
50575f1c-2a3e-442f-a1dc-442438e420ab	6e2d4260-e93f-4e36-be8b-df95fcf82c66
c51a3ec3-bf19-4fff-b41c-61967d1207c4	b576c715-5321-466d-a1b9-e2d710dfa19e
c51a3ec3-bf19-4fff-b41c-61967d1207c4	34765a68-b912-4fa2-a2d7-43697b3fa78f
34765a68-b912-4fa2-a2d7-43697b3fa78f	0b9d7e0e-023e-4c50-bca2-7ac2e4bade29
56ccdbb7-b7f2-4fa1-af0d-5e7c78efa3d0	d6f076b7-81a0-4e1e-bc0c-0fd86118e14b
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	1ea075ed-aa49-4cdd-84b9-d08c45e54845
c51a3ec3-bf19-4fff-b41c-61967d1207c4	2660b200-13f3-4249-affa-6831e931f272
c51a3ec3-bf19-4fff-b41c-61967d1207c4	b5995502-f26d-4ae0-8f91-1e67c440c433
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	c3896910-bb50-4863-8c2e-39fef1c4ba59
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	d638ac98-8699-48e4-9ba4-58062889b896
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	08e7d595-37b7-45c9-9f7a-749063248cdd
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	3dda8984-da96-49b9-a97b-1df36cdb5848
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	0a06d78d-38e5-4db2-958a-7f55f59c5760
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	f0ac2b35-78fd-4d9b-b356-0a66715fc285
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	9e448fe5-cf09-4879-afa4-89eef0a77c4d
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	a8b71440-3ed2-42ae-a119-216b7a4c4e2e
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	b1aa6541-de1e-4364-9f05-65d879d1e7cc
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	396ea043-1607-4c24-961a-231d018a52a7
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	f817bfa1-f26e-4eeb-9b32-64f39a5e729e
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	a6598f37-283b-44e0-b469-459fb628f1a9
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	f0aaffd8-4fc8-4fb5-a93f-1def5db1d2b6
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	8fc93845-4ed9-46d3-bf96-20973a4878e7
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	3c0cb1e1-c39f-4b1f-b5dd-acb2b12d533d
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	79dc3a1e-901b-464f-a874-d1d0e31807a0
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	ef71b866-5407-4664-9c10-267920e43466
3dda8984-da96-49b9-a97b-1df36cdb5848	3c0cb1e1-c39f-4b1f-b5dd-acb2b12d533d
08e7d595-37b7-45c9-9f7a-749063248cdd	ef71b866-5407-4664-9c10-267920e43466
08e7d595-37b7-45c9-9f7a-749063248cdd	8fc93845-4ed9-46d3-bf96-20973a4878e7
fbbbfff7-c845-4a45-8348-b704de71aec4	0322a1da-3bf2-4d5f-ab0a-fee87f5af560
fbbbfff7-c845-4a45-8348-b704de71aec4	88a02aed-8365-4560-a969-f4895bac0840
fbbbfff7-c845-4a45-8348-b704de71aec4	3a288c00-625c-4899-9eed-af9a9a5dea01
fbbbfff7-c845-4a45-8348-b704de71aec4	dd126840-474c-44ad-96b3-234b6a2768a2
fbbbfff7-c845-4a45-8348-b704de71aec4	0a7189dc-7ed5-4377-a2df-5953bb59966a
fbbbfff7-c845-4a45-8348-b704de71aec4	75575664-9192-44d9-bb2d-6a64479efca8
fbbbfff7-c845-4a45-8348-b704de71aec4	8918d60b-327e-4281-ab47-c06bd7c69089
fbbbfff7-c845-4a45-8348-b704de71aec4	a1d7e7a4-46f3-46cb-a8f8-3591fb5348fd
fbbbfff7-c845-4a45-8348-b704de71aec4	909109b5-23b9-41aa-840f-3dae4b772f44
fbbbfff7-c845-4a45-8348-b704de71aec4	b36c51ef-aa9f-4e9b-9b85-c4c02208fe27
fbbbfff7-c845-4a45-8348-b704de71aec4	db1b6bde-7abb-45bc-84da-38f922c2e391
fbbbfff7-c845-4a45-8348-b704de71aec4	7270aaad-cfbc-4755-8262-8c8e7ca49347
fbbbfff7-c845-4a45-8348-b704de71aec4	0e9eaa2c-a9f2-47e4-8177-0e3eefa62a3d
fbbbfff7-c845-4a45-8348-b704de71aec4	77852eef-dd9b-4207-a3a1-60a7b333b7aa
fbbbfff7-c845-4a45-8348-b704de71aec4	4030b02a-d090-4b51-b80c-3ddce37c785f
fbbbfff7-c845-4a45-8348-b704de71aec4	53af2d65-83da-4f5b-8ef0-b580bf7b993e
fbbbfff7-c845-4a45-8348-b704de71aec4	bbb117e4-402c-4c27-8935-4e18af199cbb
dd126840-474c-44ad-96b3-234b6a2768a2	4030b02a-d090-4b51-b80c-3ddce37c785f
3a288c00-625c-4899-9eed-af9a9a5dea01	77852eef-dd9b-4207-a3a1-60a7b333b7aa
3a288c00-625c-4899-9eed-af9a9a5dea01	bbb117e4-402c-4c27-8935-4e18af199cbb
f00ede1b-4a10-4c89-b707-5f01bb4a5e1c	1ca7e57e-38b5-4749-a3a0-4186f3dad8be
f00ede1b-4a10-4c89-b707-5f01bb4a5e1c	3a368900-3933-457c-a67c-30918509b4d9
3a368900-3933-457c-a67c-30918509b4d9	acf71e12-ef7e-4fdb-9062-f04472d2e442
ef157896-99d4-442f-bfba-0ad6b039cab7	06691bce-2fb5-40ba-9adf-675539eb3bbd
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	2b58ce62-e5c9-4505-9dd1-005162f35206
fbbbfff7-c845-4a45-8348-b704de71aec4	e4fde482-1a03-485c-909c-c5e62c1ef17a
f00ede1b-4a10-4c89-b707-5f01bb4a5e1c	579e3338-0fab-4462-9411-7b3d1a8efc20
f00ede1b-4a10-4c89-b707-5f01bb4a5e1c	bcef8538-8e59-4234-b383-2ca08ae4767f
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
e49335eb-0f28-4d46-bd43-2b2ab2335e3f	\N	password	c99df027-0ee1-44ee-81a2-af8f6d858eab	1663312223136	\N	{"value":"yXOiMuZcJdD8/Jf90PSjfKXhianYC5vHaSRVbwx1HDEZW2kVwebBr+bFovgacuUqRtuQAG3aHS9wTMIUlLqsVw==","salt":"p598rFwuZ6UA7XItlLPrPQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
43f1adda-65b9-46ab-92af-02fe5821b037	\N	password	0096bdcd-4ce7-423e-892f-3fa581dd0904	1669055562038	\N	{"value":"NzXtAg5WNfnZhUyqu4BDi4UdUd9QAh1MiqjVH0xGVcHywIPk1gLCYqsB+ma4ltFQpx18ER38zMnUysPn80ogzQ==","salt":"qGWLJ+8am3hAgYyRC5r1Gw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
080ecb6b-4b63-4758-88c8-307d12458115	\N	password	e48aa998-b03a-4fc9-9f54-de419d2a868e	1666261133116	\N	{"value":"kc9qlvogiUXq3FMQtFPLoqvFQ+Ev4iSObbh1BOxaNpK7BntLJS5TOESOSxxdcLttlJ0Vq45YwbXm+/XjSzt+5g==","salt":"pZlcOnse3/C7SX/KzUcKYQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
ac8ab967-e242-4ea3-b484-c5d39c9a83ab	\N	password	35272e19-35dc-4055-9889-c35002adf153	1666373542023	My password	{"value":"t0+3TkD5pKSg+Yh+Yi4Ph0qVDQ8Ofh2LFLYhn6VaIV7ePG1TK06FA9FOpOLyxh+Ja7CaH93mRbVt+Wd9g7n/eg==","salt":"+P5ojfApKzGmqIC0Z7VYQw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
f76619c0-4cd5-4cbe-aea3-9169f258790b	\N	password	405e98f2-785e-45b7-b8ec-722b12116205	1667984641778	My password	{"value":"3twwEdZ/DOS9hWHXap8kkVIqQjUB3ZEI480M+XBN25QTxiH3OMQPeSqk9DpA/CpIgjqGKdp00WZAyR7slqwJYw==","salt":"R6XAoFXm1QwTk1V3rHdXVQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2022-09-16 07:10:19.470969	1	EXECUTED	8:bda77d94bf90182a1e30c24f1c155ec7	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	3312219322
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2022-09-16 07:10:19.480378	2	MARK_RAN	8:1ecb330f30986693d1cba9ab579fa219	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	3312219322
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2022-09-16 07:10:19.502596	3	EXECUTED	8:cb7ace19bc6d959f305605d255d4c843	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.8.0	\N	\N	3312219322
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2022-09-16 07:10:19.50446	4	EXECUTED	8:80230013e961310e6872e871be424a63	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	3312219322
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2022-09-16 07:10:19.548211	5	EXECUTED	8:67f4c20929126adc0c8e9bf48279d244	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	3312219322
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2022-09-16 07:10:19.549706	6	MARK_RAN	8:7311018b0b8179ce14628ab412bb6783	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	3312219322
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2022-09-16 07:10:19.589414	7	EXECUTED	8:037ba1216c3640f8785ee6b8e7c8e3c1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	3312219322
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2022-09-16 07:10:19.590783	8	MARK_RAN	8:7fe6ffe4af4df289b3157de32c624263	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	3312219322
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2022-09-16 07:10:19.592904	9	EXECUTED	8:9c136bc3187083a98745c7d03bc8a303	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.8.0	\N	\N	3312219322
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2022-09-16 07:10:19.632201	10	EXECUTED	8:b5f09474dca81fb56a97cf5b6553d331	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.8.0	\N	\N	3312219322
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2022-09-16 07:10:19.654823	11	EXECUTED	8:ca924f31bd2a3b219fdcfe78c82dacf4	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	3312219322
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2022-09-16 07:10:19.655939	12	MARK_RAN	8:8acad7483e106416bcfa6f3b824a16cd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	3312219322
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2022-09-16 07:10:19.664362	13	EXECUTED	8:9b1266d17f4f87c78226f5055408fd5e	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	3312219322
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-09-16 07:10:19.673321	14	EXECUTED	8:d80ec4ab6dbfe573550ff72396c7e910	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.8.0	\N	\N	3312219322
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-09-16 07:10:19.678156	15	MARK_RAN	8:d86eb172171e7c20b9c849b584d147b2	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	3312219322
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-09-16 07:10:19.679458	16	MARK_RAN	8:5735f46f0fa60689deb0ecdc2a0dea22	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.8.0	\N	\N	3312219322
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-09-16 07:10:19.680589	17	EXECUTED	8:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.8.0	\N	\N	3312219322
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2022-09-16 07:10:19.72043	18	EXECUTED	8:5c1a8fd2014ac7fc43b90a700f117b23	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.8.0	\N	\N	3312219322
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2022-09-16 07:10:19.755843	19	EXECUTED	8:1f6c2c2dfc362aff4ed75b3f0ef6b331	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	3312219322
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2022-09-16 07:10:19.759563	20	EXECUTED	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	3312219322
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-09-16 07:10:20.282316	45	EXECUTED	8:a164ae073c56ffdbc98a615493609a52	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	3312219322
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2022-09-16 07:10:19.760945	21	MARK_RAN	8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	3312219322
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2022-09-16 07:10:19.762811	22	MARK_RAN	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	3312219322
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2022-09-16 07:10:19.789311	23	EXECUTED	8:d9fa18ffa355320395b86270680dd4fe	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.8.0	\N	\N	3312219322
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2022-09-16 07:10:19.792462	24	EXECUTED	8:90cff506fedb06141ffc1c71c4a1214c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	3312219322
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2022-09-16 07:10:19.794209	25	MARK_RAN	8:11a788aed4961d6d29c427c063af828c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	3312219322
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2022-09-16 07:10:19.878775	26	EXECUTED	8:a4218e51e1faf380518cce2af5d39b43	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.8.0	\N	\N	3312219322
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2022-09-16 07:10:19.912174	27	EXECUTED	8:d9e9a1bfaa644da9952456050f07bbdc	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.8.0	\N	\N	3312219322
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2022-09-16 07:10:19.913761	28	EXECUTED	8:d1bf991a6163c0acbfe664b615314505	update tableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	3312219322
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2022-09-16 07:10:19.941682	29	EXECUTED	8:88a743a1e87ec5e30bf603da68058a8c	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.8.0	\N	\N	3312219322
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2022-09-16 07:10:19.949527	30	EXECUTED	8:c5517863c875d325dea463d00ec26d7a	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.8.0	\N	\N	3312219322
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2022-09-16 07:10:19.957592	31	EXECUTED	8:ada8b4833b74a498f376d7136bc7d327	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.8.0	\N	\N	3312219322
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2022-09-16 07:10:19.959295	32	EXECUTED	8:b9b73c8ea7299457f99fcbb825c263ba	customChange		\N	4.8.0	\N	\N	3312219322
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-09-16 07:10:19.961403	33	EXECUTED	8:07724333e625ccfcfc5adc63d57314f3	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	3312219322
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-09-16 07:10:19.962324	34	MARK_RAN	8:8b6fd445958882efe55deb26fc541a7b	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	3312219322
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-09-16 07:10:19.973969	35	EXECUTED	8:29b29cfebfd12600897680147277a9d7	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	3312219322
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2022-09-16 07:10:19.975704	36	EXECUTED	8:73ad77ca8fd0410c7f9f15a471fa52bc	addColumn tableName=REALM		\N	4.8.0	\N	\N	3312219322
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-09-16 07:10:19.978107	37	EXECUTED	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	3312219322
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2022-09-16 07:10:19.97943	38	EXECUTED	8:27180251182e6c31846c2ddab4bc5781	addColumn tableName=FED_USER_CONSENT		\N	4.8.0	\N	\N	3312219322
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2022-09-16 07:10:19.980586	39	EXECUTED	8:d56f201bfcfa7a1413eb3e9bc02978f9	addColumn tableName=IDENTITY_PROVIDER		\N	4.8.0	\N	\N	3312219322
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2022-09-16 07:10:19.981385	40	MARK_RAN	8:91f5522bf6afdc2077dfab57fbd3455c	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	3312219322
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2022-09-16 07:10:19.98204	41	MARK_RAN	8:0f01b554f256c22caeb7d8aee3a1cdc8	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	3312219322
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2022-09-16 07:10:19.983659	42	EXECUTED	8:ab91cf9cee415867ade0e2df9651a947	customChange		\N	4.8.0	\N	\N	3312219322
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2022-09-16 07:10:20.27861	43	EXECUTED	8:ceac9b1889e97d602caf373eadb0d4b7	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.8.0	\N	\N	3312219322
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2022-09-16 07:10:20.280536	44	EXECUTED	8:84b986e628fe8f7fd8fd3c275c5259f2	addColumn tableName=USER_ENTITY		\N	4.8.0	\N	\N	3312219322
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-09-16 07:10:20.284202	46	EXECUTED	8:70a2b4f1f4bd4dbf487114bdb1810e64	customChange		\N	4.8.0	\N	\N	3312219322
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-09-16 07:10:20.284926	47	MARK_RAN	8:7be68b71d2f5b94b8df2e824f2860fa2	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	3312219322
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-09-16 07:10:20.312272	48	EXECUTED	8:bab7c631093c3861d6cf6144cd944982	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.8.0	\N	\N	3312219322
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-09-16 07:10:20.316647	49	EXECUTED	8:fa809ac11877d74d76fe40869916daad	addColumn tableName=REALM		\N	4.8.0	\N	\N	3312219322
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2022-09-16 07:10:20.337719	50	EXECUTED	8:fac23540a40208f5f5e326f6ceb4d291	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.8.0	\N	\N	3312219322
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2022-09-16 07:10:20.39334	51	EXECUTED	8:2612d1b8a97e2b5588c346e817307593	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.8.0	\N	\N	3312219322
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2022-09-16 07:10:20.394879	52	EXECUTED	8:9842f155c5db2206c88bcb5d1046e941	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3312219322
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2022-09-16 07:10:20.396166	53	EXECUTED	8:2e12e06e45498406db72d5b3da5bbc76	update tableName=REALM		\N	4.8.0	\N	\N	3312219322
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2022-09-16 07:10:20.397569	54	EXECUTED	8:33560e7c7989250c40da3abdabdc75a4	update tableName=CLIENT		\N	4.8.0	\N	\N	3312219322
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-09-16 07:10:20.401508	55	EXECUTED	8:87a8d8542046817a9107c7eb9cbad1cd	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.8.0	\N	\N	3312219322
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-09-16 07:10:20.403983	56	EXECUTED	8:3ea08490a70215ed0088c273d776311e	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.8.0	\N	\N	3312219322
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-09-16 07:10:20.419771	57	EXECUTED	8:2d56697c8723d4592ab608ce14b6ed68	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.8.0	\N	\N	3312219322
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-09-16 07:10:20.507459	58	EXECUTED	8:3e423e249f6068ea2bbe48bf907f9d86	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.8.0	\N	\N	3312219322
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2022-09-16 07:10:20.520611	59	EXECUTED	8:15cabee5e5df0ff099510a0fc03e4103	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.8.0	\N	\N	3312219322
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2022-09-16 07:10:20.523025	60	EXECUTED	8:4b80200af916ac54d2ffbfc47918ab0e	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	3312219322
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2022-09-16 07:10:20.535915	61	EXECUTED	8:66564cd5e168045d52252c5027485bbb	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.8.0	\N	\N	3312219322
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2022-09-16 07:10:20.538881	62	EXECUTED	8:1c7064fafb030222be2bd16ccf690f6f	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.8.0	\N	\N	3312219322
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2022-09-16 07:10:20.54032	63	EXECUTED	8:2de18a0dce10cdda5c7e65c9b719b6e5	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	3312219322
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2022-09-16 07:10:20.541396	64	EXECUTED	8:03e413dd182dcbd5c57e41c34d0ef682	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	3312219322
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2022-09-16 07:10:20.542375	65	EXECUTED	8:d27b42bb2571c18fbe3fe4e4fb7582a7	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.8.0	\N	\N	3312219322
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2022-09-16 07:10:20.55131	66	EXECUTED	8:698baf84d9fd0027e9192717c2154fb8	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.8.0	\N	\N	3312219322
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2022-09-16 07:10:20.557732	67	EXECUTED	8:ced8822edf0f75ef26eb51582f9a821a	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.8.0	\N	\N	3312219322
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2022-09-16 07:10:20.559659	68	EXECUTED	8:f0abba004cf429e8afc43056df06487d	addColumn tableName=REALM		\N	4.8.0	\N	\N	3312219322
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2022-09-16 07:10:20.56729	69	EXECUTED	8:6662f8b0b611caa359fcf13bf63b4e24	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.8.0	\N	\N	3312219322
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2022-09-16 07:10:20.570465	70	EXECUTED	8:9e6b8009560f684250bdbdf97670d39e	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.8.0	\N	\N	3312219322
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2022-09-16 07:10:20.572285	71	EXECUTED	8:4223f561f3b8dc655846562b57bb502e	addColumn tableName=RESOURCE_SERVER		\N	4.8.0	\N	\N	3312219322
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-09-16 07:10:20.574877	72	EXECUTED	8:215a31c398b363ce383a2b301202f29e	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	3312219322
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-09-16 07:10:20.577418	73	EXECUTED	8:83f7a671792ca98b3cbd3a1a34862d3d	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	3312219322
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-09-16 07:10:20.578257	74	MARK_RAN	8:f58ad148698cf30707a6efbdf8061aa7	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	3312219322
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-09-16 07:10:20.585683	75	EXECUTED	8:79e4fd6c6442980e58d52ffc3ee7b19c	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.8.0	\N	\N	3312219322
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-09-16 07:10:20.592213	76	EXECUTED	8:87af6a1e6d241ca4b15801d1f86a297d	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.8.0	\N	\N	3312219322
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-09-16 07:10:20.593629	77	EXECUTED	8:b44f8d9b7b6ea455305a6d72a200ed15	addColumn tableName=CLIENT		\N	4.8.0	\N	\N	3312219322
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-09-16 07:10:20.59441	78	MARK_RAN	8:2d8ed5aaaeffd0cb004c046b4a903ac5	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.8.0	\N	\N	3312219322
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-09-16 07:10:20.601489	79	EXECUTED	8:e290c01fcbc275326c511633f6e2acde	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.8.0	\N	\N	3312219322
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-09-16 07:10:20.602655	80	MARK_RAN	8:c9db8784c33cea210872ac2d805439f8	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.8.0	\N	\N	3312219322
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-09-16 07:10:20.608754	81	EXECUTED	8:95b676ce8fc546a1fcfb4c92fae4add5	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.8.0	\N	\N	3312219322
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-09-16 07:10:20.609602	82	MARK_RAN	8:38a6b2a41f5651018b1aca93a41401e5	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	3312219322
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-09-16 07:10:20.61137	83	EXECUTED	8:3fb99bcad86a0229783123ac52f7609c	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	3312219322
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-09-16 07:10:20.61223	84	MARK_RAN	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	3312219322
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-09-16 07:10:20.62143	85	EXECUTED	8:ab4f863f39adafd4c862f7ec01890abc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	3312219322
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2022-09-16 07:10:20.62378	86	EXECUTED	8:13c419a0eb336e91ee3a3bf8fda6e2a7	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.8.0	\N	\N	3312219322
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2022-09-16 07:10:20.626954	87	EXECUTED	8:e3fb1e698e0471487f51af1ed80fe3ac	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.8.0	\N	\N	3312219322
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2022-09-16 07:10:20.63148	88	EXECUTED	8:babadb686aab7b56562817e60bf0abd0	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.8.0	\N	\N	3312219322
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-09-16 07:10:20.633982	89	EXECUTED	8:72d03345fda8e2f17093d08801947773	addColumn tableName=REALM; customChange		\N	4.8.0	\N	\N	3312219322
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-09-16 07:10:20.637025	90	EXECUTED	8:61c9233951bd96ffecd9ba75f7d978a4	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.8.0	\N	\N	3312219322
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-09-16 07:10:20.642781	91	EXECUTED	8:ea82e6ad945cec250af6372767b25525	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	3312219322
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-09-16 07:10:20.646012	92	EXECUTED	8:d3f4a33f41d960ddacd7e2ef30d126b3	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.8.0	\N	\N	3312219322
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-09-16 07:10:20.646748	93	MARK_RAN	8:1284a27fbd049d65831cb6fc07c8a783	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	3312219322
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-09-16 07:10:20.6504	94	EXECUTED	8:9d11b619db2ae27c25853b8a37cd0dea	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	3312219322
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-09-16 07:10:20.651302	95	MARK_RAN	8:3002bb3997451bb9e8bac5c5cd8d6327	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.8.0	\N	\N	3312219322
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-09-16 07:10:20.653556	96	EXECUTED	8:dfbee0d6237a23ef4ccbb7a4e063c163	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.8.0	\N	\N	3312219322
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-09-16 07:10:20.66938	97	EXECUTED	8:75f3e372df18d38c62734eebb986b960	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	3312219322
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-09-16 07:10:20.670452	98	MARK_RAN	8:7fee73eddf84a6035691512c85637eef	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3312219322
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-09-16 07:10:20.677802	99	MARK_RAN	8:7a11134ab12820f999fbf3bb13c3adc8	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3312219322
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-09-16 07:10:20.685013	100	EXECUTED	8:c0f6eaac1f3be773ffe54cb5b8482b70	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3312219322
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-09-16 07:10:20.685895	101	MARK_RAN	8:18186f0008b86e0f0f49b0c4d0e842ac	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	3312219322
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-09-16 07:10:20.692244	102	EXECUTED	8:09c2780bcb23b310a7019d217dc7b433	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.8.0	\N	\N	3312219322
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-09-16 07:10:20.69414	103	EXECUTED	8:276a44955eab693c970a42880197fff2	customChange		\N	4.8.0	\N	\N	3312219322
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2022-09-16 07:10:20.696732	104	EXECUTED	8:ba8ee3b694d043f2bfc1a1079d0760d7	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.8.0	\N	\N	3312219322
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2022-09-16 07:10:20.703003	105	EXECUTED	8:5e06b1d75f5d17685485e610c2851b17	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.8.0	\N	\N	3312219322
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2022-09-16 07:10:20.708497	106	EXECUTED	8:4b80546c1dc550ac552ee7b24a4ab7c0	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.8.0	\N	\N	3312219322
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2022-09-16 07:10:20.710314	107	EXECUTED	8:af510cd1bb2ab6339c45372f3e491696	customChange		\N	4.8.0	\N	\N	3312219322
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
5486cd06-0bdd-43e9-bdf8-d68e838140cd	01e81168-7b2e-4b1c-bcb0-60b6adb8790b	f
5486cd06-0bdd-43e9-bdf8-d68e838140cd	2da4e6f1-92fe-45a0-8abc-cf9ebd8f59c3	t
5486cd06-0bdd-43e9-bdf8-d68e838140cd	da011c93-b2d6-4cb9-b86f-fbdaf1417589	t
5486cd06-0bdd-43e9-bdf8-d68e838140cd	fa50c35c-246a-4e68-9485-aee1af65973c	t
5486cd06-0bdd-43e9-bdf8-d68e838140cd	b24fdd04-b181-4b39-9b3a-29be3c97f23b	f
5486cd06-0bdd-43e9-bdf8-d68e838140cd	50438cea-d3d2-4899-906c-e4ddb2d5af4c	f
5486cd06-0bdd-43e9-bdf8-d68e838140cd	54700f07-9d14-4643-9995-ac2edc1e1a43	t
5486cd06-0bdd-43e9-bdf8-d68e838140cd	f9677c86-e23f-4bab-93fa-f7783c5c1c5e	t
5486cd06-0bdd-43e9-bdf8-d68e838140cd	6baeb1e4-5a67-44fc-9269-c93cf783e8b6	f
5486cd06-0bdd-43e9-bdf8-d68e838140cd	720899a6-d63d-4051-b101-85b00cbfafa2	t
52972857-3a02-44f3-8c45-983c95924d7f	1c1dee26-9bd9-4bd0-8e7d-877e4c6c8909	f
52972857-3a02-44f3-8c45-983c95924d7f	d4b3a65d-6586-419e-ace1-f1d75abb81e2	t
52972857-3a02-44f3-8c45-983c95924d7f	a30791eb-00c8-473d-874b-1be1e1de3eb4	t
52972857-3a02-44f3-8c45-983c95924d7f	51491e9a-c869-4d38-b846-be8a1c0b6dda	t
52972857-3a02-44f3-8c45-983c95924d7f	f9dc6d51-8a3c-4425-ad2d-7ce1670d2d07	f
52972857-3a02-44f3-8c45-983c95924d7f	bf3b318a-197c-486b-8637-3ae06c7d6323	f
52972857-3a02-44f3-8c45-983c95924d7f	0073ce65-ec67-4986-ac1c-adcc813add33	t
52972857-3a02-44f3-8c45-983c95924d7f	9e1f9b70-0657-426e-9f0b-1dac5186b21a	t
52972857-3a02-44f3-8c45-983c95924d7f	d0252463-f536-4cdf-9942-17a52a1c040d	f
52972857-3a02-44f3-8c45-983c95924d7f	f82da954-d81d-4b3a-aa29-da7b79776d11	t
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
c51a3ec3-bf19-4fff-b41c-61967d1207c4	5486cd06-0bdd-43e9-bdf8-d68e838140cd	f	${role_default-roles}	default-roles-master	5486cd06-0bdd-43e9-bdf8-d68e838140cd	\N	\N
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	5486cd06-0bdd-43e9-bdf8-d68e838140cd	f	${role_admin}	admin	5486cd06-0bdd-43e9-bdf8-d68e838140cd	\N	\N
d11bf827-2aa9-4362-b287-21892785d5c7	5486cd06-0bdd-43e9-bdf8-d68e838140cd	f	${role_create-realm}	create-realm	5486cd06-0bdd-43e9-bdf8-d68e838140cd	\N	\N
fa83350f-7be2-4056-ae0e-15408becac1d	22250aec-2f60-4c70-be7d-84efdf67cd02	t	${role_create-client}	create-client	5486cd06-0bdd-43e9-bdf8-d68e838140cd	22250aec-2f60-4c70-be7d-84efdf67cd02	\N
d6400727-111e-436e-9a70-8f8dfbaf959e	22250aec-2f60-4c70-be7d-84efdf67cd02	t	${role_view-realm}	view-realm	5486cd06-0bdd-43e9-bdf8-d68e838140cd	22250aec-2f60-4c70-be7d-84efdf67cd02	\N
50575f1c-2a3e-442f-a1dc-442438e420ab	22250aec-2f60-4c70-be7d-84efdf67cd02	t	${role_view-users}	view-users	5486cd06-0bdd-43e9-bdf8-d68e838140cd	22250aec-2f60-4c70-be7d-84efdf67cd02	\N
dde7f70b-a3b2-49f0-b798-db4acfeb8bce	22250aec-2f60-4c70-be7d-84efdf67cd02	t	${role_view-clients}	view-clients	5486cd06-0bdd-43e9-bdf8-d68e838140cd	22250aec-2f60-4c70-be7d-84efdf67cd02	\N
d923097c-6616-47db-8665-13ea000706a8	22250aec-2f60-4c70-be7d-84efdf67cd02	t	${role_view-events}	view-events	5486cd06-0bdd-43e9-bdf8-d68e838140cd	22250aec-2f60-4c70-be7d-84efdf67cd02	\N
8c35956a-1f3d-44db-929c-e482d1702d25	22250aec-2f60-4c70-be7d-84efdf67cd02	t	${role_view-identity-providers}	view-identity-providers	5486cd06-0bdd-43e9-bdf8-d68e838140cd	22250aec-2f60-4c70-be7d-84efdf67cd02	\N
641522d9-4198-440b-ab89-2bf9e7444faa	22250aec-2f60-4c70-be7d-84efdf67cd02	t	${role_view-authorization}	view-authorization	5486cd06-0bdd-43e9-bdf8-d68e838140cd	22250aec-2f60-4c70-be7d-84efdf67cd02	\N
95208b18-bb3a-4083-a831-ce024a2b78c4	22250aec-2f60-4c70-be7d-84efdf67cd02	t	${role_manage-realm}	manage-realm	5486cd06-0bdd-43e9-bdf8-d68e838140cd	22250aec-2f60-4c70-be7d-84efdf67cd02	\N
69c19d61-18c2-4bdf-872e-1de1769c9f81	22250aec-2f60-4c70-be7d-84efdf67cd02	t	${role_manage-users}	manage-users	5486cd06-0bdd-43e9-bdf8-d68e838140cd	22250aec-2f60-4c70-be7d-84efdf67cd02	\N
bcf5be20-4737-46bc-a80d-e767969f9316	22250aec-2f60-4c70-be7d-84efdf67cd02	t	${role_manage-clients}	manage-clients	5486cd06-0bdd-43e9-bdf8-d68e838140cd	22250aec-2f60-4c70-be7d-84efdf67cd02	\N
38e26450-1db2-42fd-a707-96a283df78e2	22250aec-2f60-4c70-be7d-84efdf67cd02	t	${role_manage-events}	manage-events	5486cd06-0bdd-43e9-bdf8-d68e838140cd	22250aec-2f60-4c70-be7d-84efdf67cd02	\N
d4bd9f45-d8c9-4bf5-993d-c237dc2be5f6	22250aec-2f60-4c70-be7d-84efdf67cd02	t	${role_manage-identity-providers}	manage-identity-providers	5486cd06-0bdd-43e9-bdf8-d68e838140cd	22250aec-2f60-4c70-be7d-84efdf67cd02	\N
caea8abd-5567-4708-83cc-cf19b060e3cb	22250aec-2f60-4c70-be7d-84efdf67cd02	t	${role_manage-authorization}	manage-authorization	5486cd06-0bdd-43e9-bdf8-d68e838140cd	22250aec-2f60-4c70-be7d-84efdf67cd02	\N
15750073-3254-4472-b275-ad586317c542	22250aec-2f60-4c70-be7d-84efdf67cd02	t	${role_query-users}	query-users	5486cd06-0bdd-43e9-bdf8-d68e838140cd	22250aec-2f60-4c70-be7d-84efdf67cd02	\N
39201832-977e-4503-9f1d-b92cefb23672	22250aec-2f60-4c70-be7d-84efdf67cd02	t	${role_query-clients}	query-clients	5486cd06-0bdd-43e9-bdf8-d68e838140cd	22250aec-2f60-4c70-be7d-84efdf67cd02	\N
cb80bca4-c575-47e5-b535-77810cf69949	22250aec-2f60-4c70-be7d-84efdf67cd02	t	${role_query-realms}	query-realms	5486cd06-0bdd-43e9-bdf8-d68e838140cd	22250aec-2f60-4c70-be7d-84efdf67cd02	\N
6e2d4260-e93f-4e36-be8b-df95fcf82c66	22250aec-2f60-4c70-be7d-84efdf67cd02	t	${role_query-groups}	query-groups	5486cd06-0bdd-43e9-bdf8-d68e838140cd	22250aec-2f60-4c70-be7d-84efdf67cd02	\N
b576c715-5321-466d-a1b9-e2d710dfa19e	01af5524-6897-4b8b-b803-50dd0c94351d	t	${role_view-profile}	view-profile	5486cd06-0bdd-43e9-bdf8-d68e838140cd	01af5524-6897-4b8b-b803-50dd0c94351d	\N
34765a68-b912-4fa2-a2d7-43697b3fa78f	01af5524-6897-4b8b-b803-50dd0c94351d	t	${role_manage-account}	manage-account	5486cd06-0bdd-43e9-bdf8-d68e838140cd	01af5524-6897-4b8b-b803-50dd0c94351d	\N
0b9d7e0e-023e-4c50-bca2-7ac2e4bade29	01af5524-6897-4b8b-b803-50dd0c94351d	t	${role_manage-account-links}	manage-account-links	5486cd06-0bdd-43e9-bdf8-d68e838140cd	01af5524-6897-4b8b-b803-50dd0c94351d	\N
fccd0062-ee9e-46b2-bc8c-23d2fc4a2513	01af5524-6897-4b8b-b803-50dd0c94351d	t	${role_view-applications}	view-applications	5486cd06-0bdd-43e9-bdf8-d68e838140cd	01af5524-6897-4b8b-b803-50dd0c94351d	\N
d6f076b7-81a0-4e1e-bc0c-0fd86118e14b	01af5524-6897-4b8b-b803-50dd0c94351d	t	${role_view-consent}	view-consent	5486cd06-0bdd-43e9-bdf8-d68e838140cd	01af5524-6897-4b8b-b803-50dd0c94351d	\N
56ccdbb7-b7f2-4fa1-af0d-5e7c78efa3d0	01af5524-6897-4b8b-b803-50dd0c94351d	t	${role_manage-consent}	manage-consent	5486cd06-0bdd-43e9-bdf8-d68e838140cd	01af5524-6897-4b8b-b803-50dd0c94351d	\N
8c444e42-554b-4c3b-818f-376f46a72b61	01af5524-6897-4b8b-b803-50dd0c94351d	t	${role_delete-account}	delete-account	5486cd06-0bdd-43e9-bdf8-d68e838140cd	01af5524-6897-4b8b-b803-50dd0c94351d	\N
530a6112-ac14-4462-8650-712052260047	921c5cbb-1554-4506-a676-f9a82f5a43e0	t	${role_read-token}	read-token	5486cd06-0bdd-43e9-bdf8-d68e838140cd	921c5cbb-1554-4506-a676-f9a82f5a43e0	\N
1ea075ed-aa49-4cdd-84b9-d08c45e54845	22250aec-2f60-4c70-be7d-84efdf67cd02	t	${role_impersonation}	impersonation	5486cd06-0bdd-43e9-bdf8-d68e838140cd	22250aec-2f60-4c70-be7d-84efdf67cd02	\N
2660b200-13f3-4249-affa-6831e931f272	5486cd06-0bdd-43e9-bdf8-d68e838140cd	f	${role_offline-access}	offline_access	5486cd06-0bdd-43e9-bdf8-d68e838140cd	\N	\N
b5995502-f26d-4ae0-8f91-1e67c440c433	5486cd06-0bdd-43e9-bdf8-d68e838140cd	f	${role_uma_authorization}	uma_authorization	5486cd06-0bdd-43e9-bdf8-d68e838140cd	\N	\N
f00ede1b-4a10-4c89-b707-5f01bb4a5e1c	52972857-3a02-44f3-8c45-983c95924d7f	f	${role_default-roles}	default-roles-my_realm	52972857-3a02-44f3-8c45-983c95924d7f	\N	\N
c3896910-bb50-4863-8c2e-39fef1c4ba59	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	t	${role_create-client}	create-client	5486cd06-0bdd-43e9-bdf8-d68e838140cd	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	\N
d638ac98-8699-48e4-9ba4-58062889b896	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	t	${role_view-realm}	view-realm	5486cd06-0bdd-43e9-bdf8-d68e838140cd	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	\N
08e7d595-37b7-45c9-9f7a-749063248cdd	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	t	${role_view-users}	view-users	5486cd06-0bdd-43e9-bdf8-d68e838140cd	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	\N
3dda8984-da96-49b9-a97b-1df36cdb5848	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	t	${role_view-clients}	view-clients	5486cd06-0bdd-43e9-bdf8-d68e838140cd	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	\N
0a06d78d-38e5-4db2-958a-7f55f59c5760	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	t	${role_view-events}	view-events	5486cd06-0bdd-43e9-bdf8-d68e838140cd	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	\N
f0ac2b35-78fd-4d9b-b356-0a66715fc285	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	t	${role_view-identity-providers}	view-identity-providers	5486cd06-0bdd-43e9-bdf8-d68e838140cd	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	\N
9e448fe5-cf09-4879-afa4-89eef0a77c4d	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	t	${role_view-authorization}	view-authorization	5486cd06-0bdd-43e9-bdf8-d68e838140cd	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	\N
a8b71440-3ed2-42ae-a119-216b7a4c4e2e	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	t	${role_manage-realm}	manage-realm	5486cd06-0bdd-43e9-bdf8-d68e838140cd	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	\N
b1aa6541-de1e-4364-9f05-65d879d1e7cc	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	t	${role_manage-users}	manage-users	5486cd06-0bdd-43e9-bdf8-d68e838140cd	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	\N
396ea043-1607-4c24-961a-231d018a52a7	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	t	${role_manage-clients}	manage-clients	5486cd06-0bdd-43e9-bdf8-d68e838140cd	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	\N
f817bfa1-f26e-4eeb-9b32-64f39a5e729e	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	t	${role_manage-events}	manage-events	5486cd06-0bdd-43e9-bdf8-d68e838140cd	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	\N
a6598f37-283b-44e0-b469-459fb628f1a9	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	t	${role_manage-identity-providers}	manage-identity-providers	5486cd06-0bdd-43e9-bdf8-d68e838140cd	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	\N
f0aaffd8-4fc8-4fb5-a93f-1def5db1d2b6	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	t	${role_manage-authorization}	manage-authorization	5486cd06-0bdd-43e9-bdf8-d68e838140cd	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	\N
8fc93845-4ed9-46d3-bf96-20973a4878e7	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	t	${role_query-users}	query-users	5486cd06-0bdd-43e9-bdf8-d68e838140cd	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	\N
3c0cb1e1-c39f-4b1f-b5dd-acb2b12d533d	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	t	${role_query-clients}	query-clients	5486cd06-0bdd-43e9-bdf8-d68e838140cd	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	\N
79dc3a1e-901b-464f-a874-d1d0e31807a0	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	t	${role_query-realms}	query-realms	5486cd06-0bdd-43e9-bdf8-d68e838140cd	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	\N
ef71b866-5407-4664-9c10-267920e43466	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	t	${role_query-groups}	query-groups	5486cd06-0bdd-43e9-bdf8-d68e838140cd	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	\N
fbbbfff7-c845-4a45-8348-b704de71aec4	445fa568-9548-4edc-af03-64b0e774af28	t	${role_realm-admin}	realm-admin	52972857-3a02-44f3-8c45-983c95924d7f	445fa568-9548-4edc-af03-64b0e774af28	\N
0322a1da-3bf2-4d5f-ab0a-fee87f5af560	445fa568-9548-4edc-af03-64b0e774af28	t	${role_create-client}	create-client	52972857-3a02-44f3-8c45-983c95924d7f	445fa568-9548-4edc-af03-64b0e774af28	\N
88a02aed-8365-4560-a969-f4895bac0840	445fa568-9548-4edc-af03-64b0e774af28	t	${role_view-realm}	view-realm	52972857-3a02-44f3-8c45-983c95924d7f	445fa568-9548-4edc-af03-64b0e774af28	\N
3a288c00-625c-4899-9eed-af9a9a5dea01	445fa568-9548-4edc-af03-64b0e774af28	t	${role_view-users}	view-users	52972857-3a02-44f3-8c45-983c95924d7f	445fa568-9548-4edc-af03-64b0e774af28	\N
dd126840-474c-44ad-96b3-234b6a2768a2	445fa568-9548-4edc-af03-64b0e774af28	t	${role_view-clients}	view-clients	52972857-3a02-44f3-8c45-983c95924d7f	445fa568-9548-4edc-af03-64b0e774af28	\N
0a7189dc-7ed5-4377-a2df-5953bb59966a	445fa568-9548-4edc-af03-64b0e774af28	t	${role_view-events}	view-events	52972857-3a02-44f3-8c45-983c95924d7f	445fa568-9548-4edc-af03-64b0e774af28	\N
75575664-9192-44d9-bb2d-6a64479efca8	445fa568-9548-4edc-af03-64b0e774af28	t	${role_view-identity-providers}	view-identity-providers	52972857-3a02-44f3-8c45-983c95924d7f	445fa568-9548-4edc-af03-64b0e774af28	\N
8918d60b-327e-4281-ab47-c06bd7c69089	445fa568-9548-4edc-af03-64b0e774af28	t	${role_view-authorization}	view-authorization	52972857-3a02-44f3-8c45-983c95924d7f	445fa568-9548-4edc-af03-64b0e774af28	\N
a1d7e7a4-46f3-46cb-a8f8-3591fb5348fd	445fa568-9548-4edc-af03-64b0e774af28	t	${role_manage-realm}	manage-realm	52972857-3a02-44f3-8c45-983c95924d7f	445fa568-9548-4edc-af03-64b0e774af28	\N
909109b5-23b9-41aa-840f-3dae4b772f44	445fa568-9548-4edc-af03-64b0e774af28	t	${role_manage-users}	manage-users	52972857-3a02-44f3-8c45-983c95924d7f	445fa568-9548-4edc-af03-64b0e774af28	\N
b36c51ef-aa9f-4e9b-9b85-c4c02208fe27	445fa568-9548-4edc-af03-64b0e774af28	t	${role_manage-clients}	manage-clients	52972857-3a02-44f3-8c45-983c95924d7f	445fa568-9548-4edc-af03-64b0e774af28	\N
db1b6bde-7abb-45bc-84da-38f922c2e391	445fa568-9548-4edc-af03-64b0e774af28	t	${role_manage-events}	manage-events	52972857-3a02-44f3-8c45-983c95924d7f	445fa568-9548-4edc-af03-64b0e774af28	\N
7270aaad-cfbc-4755-8262-8c8e7ca49347	445fa568-9548-4edc-af03-64b0e774af28	t	${role_manage-identity-providers}	manage-identity-providers	52972857-3a02-44f3-8c45-983c95924d7f	445fa568-9548-4edc-af03-64b0e774af28	\N
0e9eaa2c-a9f2-47e4-8177-0e3eefa62a3d	445fa568-9548-4edc-af03-64b0e774af28	t	${role_manage-authorization}	manage-authorization	52972857-3a02-44f3-8c45-983c95924d7f	445fa568-9548-4edc-af03-64b0e774af28	\N
77852eef-dd9b-4207-a3a1-60a7b333b7aa	445fa568-9548-4edc-af03-64b0e774af28	t	${role_query-users}	query-users	52972857-3a02-44f3-8c45-983c95924d7f	445fa568-9548-4edc-af03-64b0e774af28	\N
4030b02a-d090-4b51-b80c-3ddce37c785f	445fa568-9548-4edc-af03-64b0e774af28	t	${role_query-clients}	query-clients	52972857-3a02-44f3-8c45-983c95924d7f	445fa568-9548-4edc-af03-64b0e774af28	\N
53af2d65-83da-4f5b-8ef0-b580bf7b993e	445fa568-9548-4edc-af03-64b0e774af28	t	${role_query-realms}	query-realms	52972857-3a02-44f3-8c45-983c95924d7f	445fa568-9548-4edc-af03-64b0e774af28	\N
bbb117e4-402c-4c27-8935-4e18af199cbb	445fa568-9548-4edc-af03-64b0e774af28	t	${role_query-groups}	query-groups	52972857-3a02-44f3-8c45-983c95924d7f	445fa568-9548-4edc-af03-64b0e774af28	\N
1ca7e57e-38b5-4749-a3a0-4186f3dad8be	24d3129e-77a1-433d-8aca-5ca60358e1f2	t	${role_view-profile}	view-profile	52972857-3a02-44f3-8c45-983c95924d7f	24d3129e-77a1-433d-8aca-5ca60358e1f2	\N
3a368900-3933-457c-a67c-30918509b4d9	24d3129e-77a1-433d-8aca-5ca60358e1f2	t	${role_manage-account}	manage-account	52972857-3a02-44f3-8c45-983c95924d7f	24d3129e-77a1-433d-8aca-5ca60358e1f2	\N
acf71e12-ef7e-4fdb-9062-f04472d2e442	24d3129e-77a1-433d-8aca-5ca60358e1f2	t	${role_manage-account-links}	manage-account-links	52972857-3a02-44f3-8c45-983c95924d7f	24d3129e-77a1-433d-8aca-5ca60358e1f2	\N
e68e2121-81d7-44a4-b879-667eb56f189b	24d3129e-77a1-433d-8aca-5ca60358e1f2	t	${role_view-applications}	view-applications	52972857-3a02-44f3-8c45-983c95924d7f	24d3129e-77a1-433d-8aca-5ca60358e1f2	\N
06691bce-2fb5-40ba-9adf-675539eb3bbd	24d3129e-77a1-433d-8aca-5ca60358e1f2	t	${role_view-consent}	view-consent	52972857-3a02-44f3-8c45-983c95924d7f	24d3129e-77a1-433d-8aca-5ca60358e1f2	\N
ef157896-99d4-442f-bfba-0ad6b039cab7	24d3129e-77a1-433d-8aca-5ca60358e1f2	t	${role_manage-consent}	manage-consent	52972857-3a02-44f3-8c45-983c95924d7f	24d3129e-77a1-433d-8aca-5ca60358e1f2	\N
e8cfa062-fcb7-4b2a-9fe8-c4f246ff0e41	24d3129e-77a1-433d-8aca-5ca60358e1f2	t	${role_delete-account}	delete-account	52972857-3a02-44f3-8c45-983c95924d7f	24d3129e-77a1-433d-8aca-5ca60358e1f2	\N
2b58ce62-e5c9-4505-9dd1-005162f35206	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	t	${role_impersonation}	impersonation	5486cd06-0bdd-43e9-bdf8-d68e838140cd	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	\N
e4fde482-1a03-485c-909c-c5e62c1ef17a	445fa568-9548-4edc-af03-64b0e774af28	t	${role_impersonation}	impersonation	52972857-3a02-44f3-8c45-983c95924d7f	445fa568-9548-4edc-af03-64b0e774af28	\N
b270690a-cc6b-409a-b618-42f714df5d7a	395b2613-f89c-4d8f-9b47-51c829e39096	t	${role_read-token}	read-token	52972857-3a02-44f3-8c45-983c95924d7f	395b2613-f89c-4d8f-9b47-51c829e39096	\N
579e3338-0fab-4462-9411-7b3d1a8efc20	52972857-3a02-44f3-8c45-983c95924d7f	f	${role_offline-access}	offline_access	52972857-3a02-44f3-8c45-983c95924d7f	\N	\N
bcef8538-8e59-4234-b383-2ca08ae4767f	52972857-3a02-44f3-8c45-983c95924d7f	f	${role_uma_authorization}	uma_authorization	52972857-3a02-44f3-8c45-983c95924d7f	\N	\N
cd03b4b2-ec87-44ce-920e-5314da215cac	52972857-3a02-44f3-8c45-983c95924d7f	f		ADMIN	52972857-3a02-44f3-8c45-983c95924d7f	\N	\N
c81e0075-f872-486c-b61d-e251c558bc18	52972857-3a02-44f3-8c45-983c95924d7f	f		USER	52972857-3a02-44f3-8c45-983c95924d7f	\N	\N
ff9bfa0f-118f-4f54-9e4c-63c29b7c8647	52972857-3a02-44f3-8c45-983c95924d7f	f		CREATOR	52972857-3a02-44f3-8c45-983c95924d7f	\N	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.migration_model (id, version, update_time) FROM stdin;
97rb6	19.0.2	1663312222
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
1058258d-db59-47f3-8915-1b4ed8374f58	audience resolve	openid-connect	oidc-audience-resolve-mapper	9157837e-b1a2-4e9b-bfdd-bae1db5cbfb8	\N
367e76aa-bdad-4fe5-9c03-6a808b3689c1	locale	openid-connect	oidc-usermodel-attribute-mapper	782c9a9c-5265-489d-93b8-f643d3a65485	\N
9e329453-b14d-4acf-8987-cb17c752ea63	role list	saml	saml-role-list-mapper	\N	2da4e6f1-92fe-45a0-8abc-cf9ebd8f59c3
56520541-684a-4b05-a6f5-c970798f8ac7	full name	openid-connect	oidc-full-name-mapper	\N	da011c93-b2d6-4cb9-b86f-fbdaf1417589
fc7014c8-d018-42ae-81c6-933e7c158668	family name	openid-connect	oidc-usermodel-property-mapper	\N	da011c93-b2d6-4cb9-b86f-fbdaf1417589
4def9b46-7ae5-4ea5-8d8f-c0f71a72f54d	given name	openid-connect	oidc-usermodel-property-mapper	\N	da011c93-b2d6-4cb9-b86f-fbdaf1417589
2f13f40b-c289-4997-9db4-47ced570714c	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	da011c93-b2d6-4cb9-b86f-fbdaf1417589
542e6676-e1f5-4773-841a-e702545d08ca	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	da011c93-b2d6-4cb9-b86f-fbdaf1417589
04cec014-188f-4408-8292-0e18d9fbaa13	username	openid-connect	oidc-usermodel-property-mapper	\N	da011c93-b2d6-4cb9-b86f-fbdaf1417589
3f101ad4-b129-4c2f-acc1-7ad826cf167b	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	da011c93-b2d6-4cb9-b86f-fbdaf1417589
48e033ce-5d4e-498a-b1f5-6b27da53299d	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	da011c93-b2d6-4cb9-b86f-fbdaf1417589
fab689fa-1d3e-4cca-940d-1a324a5d2650	website	openid-connect	oidc-usermodel-attribute-mapper	\N	da011c93-b2d6-4cb9-b86f-fbdaf1417589
58e6f09f-6dcc-4ac4-939b-672436f239c4	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	da011c93-b2d6-4cb9-b86f-fbdaf1417589
a981a42b-b38d-43a9-8b32-870ac8168d6c	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	da011c93-b2d6-4cb9-b86f-fbdaf1417589
b084ad30-e796-45f5-ba43-ae47927f02a2	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	da011c93-b2d6-4cb9-b86f-fbdaf1417589
8761a047-71ab-49dc-b652-2543124b4362	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	da011c93-b2d6-4cb9-b86f-fbdaf1417589
63f4bbc2-933a-43ed-a119-5d3f45d48ab5	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	da011c93-b2d6-4cb9-b86f-fbdaf1417589
268d027e-e9d2-4e59-a681-ca68081f7504	email	openid-connect	oidc-usermodel-property-mapper	\N	fa50c35c-246a-4e68-9485-aee1af65973c
c664fa48-4276-4342-ba60-4e36ddec8314	email verified	openid-connect	oidc-usermodel-property-mapper	\N	fa50c35c-246a-4e68-9485-aee1af65973c
47c38732-dd52-4f1f-89cc-ad4f062e8ffc	address	openid-connect	oidc-address-mapper	\N	b24fdd04-b181-4b39-9b3a-29be3c97f23b
aee5e9df-d5ad-4110-8508-595ad1634726	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	50438cea-d3d2-4899-906c-e4ddb2d5af4c
41dab842-b4a7-4453-87c6-5e6e1aa27362	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	50438cea-d3d2-4899-906c-e4ddb2d5af4c
6013eaea-24c2-4614-a8e8-fd3739900269	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	54700f07-9d14-4643-9995-ac2edc1e1a43
8ce18fc7-8a53-4e59-be6d-2d630cb7c3fb	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	54700f07-9d14-4643-9995-ac2edc1e1a43
77fef343-af99-409f-8d45-207b50b1c0af	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	54700f07-9d14-4643-9995-ac2edc1e1a43
bf6dc31e-e347-455c-a222-5537ac2b7e73	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	f9677c86-e23f-4bab-93fa-f7783c5c1c5e
4eb3d064-2002-4524-9be9-4030330b8558	upn	openid-connect	oidc-usermodel-property-mapper	\N	6baeb1e4-5a67-44fc-9269-c93cf783e8b6
a4ec9437-ed31-4a9e-9eb0-569ccea848eb	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	6baeb1e4-5a67-44fc-9269-c93cf783e8b6
61c6acb2-0704-473d-9318-93c5d829f61c	acr loa level	openid-connect	oidc-acr-mapper	\N	720899a6-d63d-4051-b101-85b00cbfafa2
7acb62d9-0a8f-4829-a4fa-6fb880d85890	audience resolve	openid-connect	oidc-audience-resolve-mapper	db49f247-6905-4342-8db8-a3dcaad2a856	\N
01e7cc48-a159-42bc-aeb5-f20b4184eb05	role list	saml	saml-role-list-mapper	\N	d4b3a65d-6586-419e-ace1-f1d75abb81e2
6bb1706c-92f2-4373-a9ab-a827188d5487	full name	openid-connect	oidc-full-name-mapper	\N	a30791eb-00c8-473d-874b-1be1e1de3eb4
c367222a-18b5-4cc7-94e5-e9a3f35cdc42	family name	openid-connect	oidc-usermodel-property-mapper	\N	a30791eb-00c8-473d-874b-1be1e1de3eb4
0815ec8b-e04d-45dd-9dea-b6233d419446	given name	openid-connect	oidc-usermodel-property-mapper	\N	a30791eb-00c8-473d-874b-1be1e1de3eb4
43b4b785-bb35-43f9-966a-f18c1e9ec5f2	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	a30791eb-00c8-473d-874b-1be1e1de3eb4
5e57c03b-1cbc-4039-a6f8-f1b0ad1716ff	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	a30791eb-00c8-473d-874b-1be1e1de3eb4
d475b4d9-e3c3-4579-8938-26651a458ed9	username	openid-connect	oidc-usermodel-property-mapper	\N	a30791eb-00c8-473d-874b-1be1e1de3eb4
f95b25f7-9bc2-4fec-b4d2-9077285db7fd	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	a30791eb-00c8-473d-874b-1be1e1de3eb4
cd1e56e2-effe-458c-9c0c-0f67f2f2d4de	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	a30791eb-00c8-473d-874b-1be1e1de3eb4
7b99ebfe-2710-419c-b91d-df65459a28d3	website	openid-connect	oidc-usermodel-attribute-mapper	\N	a30791eb-00c8-473d-874b-1be1e1de3eb4
9f89d35b-d197-412e-9f29-b49c04bad0ab	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	a30791eb-00c8-473d-874b-1be1e1de3eb4
38791c83-2662-4486-a168-2cc6512ab7bf	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	a30791eb-00c8-473d-874b-1be1e1de3eb4
6c98909a-e0bc-4d51-a60a-c8af0565c32e	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	a30791eb-00c8-473d-874b-1be1e1de3eb4
17a13184-9c0b-4071-b41a-ffd437e7e67a	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	a30791eb-00c8-473d-874b-1be1e1de3eb4
4cf929a6-5cdf-4d32-8a8f-a6d25d0fbe81	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	a30791eb-00c8-473d-874b-1be1e1de3eb4
debc175b-4d22-4fef-b1d8-1266f9c900fe	email	openid-connect	oidc-usermodel-property-mapper	\N	51491e9a-c869-4d38-b846-be8a1c0b6dda
838b4ebc-4c1a-44ab-8935-6d5273657c43	email verified	openid-connect	oidc-usermodel-property-mapper	\N	51491e9a-c869-4d38-b846-be8a1c0b6dda
7c36173b-23c0-4cc5-8366-f96a17dbd596	address	openid-connect	oidc-address-mapper	\N	f9dc6d51-8a3c-4425-ad2d-7ce1670d2d07
21da3026-db6a-4260-b0d8-76e559652dab	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	bf3b318a-197c-486b-8637-3ae06c7d6323
5c0d8c33-9015-47db-9f16-0c2de433aa15	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	bf3b318a-197c-486b-8637-3ae06c7d6323
704fe1d0-8141-4990-81b8-3b5876d48a18	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	0073ce65-ec67-4986-ac1c-adcc813add33
6353431a-b5f2-4c5d-98ac-89904a0969c2	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	0073ce65-ec67-4986-ac1c-adcc813add33
9d8d55ef-d243-4cf0-9f27-628b22e2de27	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	0073ce65-ec67-4986-ac1c-adcc813add33
18d06fce-ceba-4c50-84dd-0ac67d1f0489	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	9e1f9b70-0657-426e-9f0b-1dac5186b21a
229696b3-4bb8-4bb9-b366-2313db52be00	upn	openid-connect	oidc-usermodel-property-mapper	\N	d0252463-f536-4cdf-9942-17a52a1c040d
81b7b8d3-ed24-404a-914a-c1a377a22ff8	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	d0252463-f536-4cdf-9942-17a52a1c040d
ba7af464-0b18-4995-b68c-ab404b3793f1	acr loa level	openid-connect	oidc-acr-mapper	\N	f82da954-d81d-4b3a-aa29-da7b79776d11
dc129b04-87d4-4396-b8de-a9c34b47f4db	locale	openid-connect	oidc-usermodel-attribute-mapper	d83c087a-02f9-4790-b1f6-fb0e345b08f1	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
367e76aa-bdad-4fe5-9c03-6a808b3689c1	true	userinfo.token.claim
367e76aa-bdad-4fe5-9c03-6a808b3689c1	locale	user.attribute
367e76aa-bdad-4fe5-9c03-6a808b3689c1	true	id.token.claim
367e76aa-bdad-4fe5-9c03-6a808b3689c1	true	access.token.claim
367e76aa-bdad-4fe5-9c03-6a808b3689c1	locale	claim.name
367e76aa-bdad-4fe5-9c03-6a808b3689c1	String	jsonType.label
9e329453-b14d-4acf-8987-cb17c752ea63	false	single
9e329453-b14d-4acf-8987-cb17c752ea63	Basic	attribute.nameformat
9e329453-b14d-4acf-8987-cb17c752ea63	Role	attribute.name
56520541-684a-4b05-a6f5-c970798f8ac7	true	userinfo.token.claim
56520541-684a-4b05-a6f5-c970798f8ac7	true	id.token.claim
56520541-684a-4b05-a6f5-c970798f8ac7	true	access.token.claim
fc7014c8-d018-42ae-81c6-933e7c158668	true	userinfo.token.claim
fc7014c8-d018-42ae-81c6-933e7c158668	lastName	user.attribute
fc7014c8-d018-42ae-81c6-933e7c158668	true	id.token.claim
fc7014c8-d018-42ae-81c6-933e7c158668	true	access.token.claim
fc7014c8-d018-42ae-81c6-933e7c158668	family_name	claim.name
fc7014c8-d018-42ae-81c6-933e7c158668	String	jsonType.label
4def9b46-7ae5-4ea5-8d8f-c0f71a72f54d	true	userinfo.token.claim
4def9b46-7ae5-4ea5-8d8f-c0f71a72f54d	firstName	user.attribute
4def9b46-7ae5-4ea5-8d8f-c0f71a72f54d	true	id.token.claim
4def9b46-7ae5-4ea5-8d8f-c0f71a72f54d	true	access.token.claim
4def9b46-7ae5-4ea5-8d8f-c0f71a72f54d	given_name	claim.name
4def9b46-7ae5-4ea5-8d8f-c0f71a72f54d	String	jsonType.label
2f13f40b-c289-4997-9db4-47ced570714c	true	userinfo.token.claim
2f13f40b-c289-4997-9db4-47ced570714c	middleName	user.attribute
2f13f40b-c289-4997-9db4-47ced570714c	true	id.token.claim
2f13f40b-c289-4997-9db4-47ced570714c	true	access.token.claim
2f13f40b-c289-4997-9db4-47ced570714c	middle_name	claim.name
2f13f40b-c289-4997-9db4-47ced570714c	String	jsonType.label
542e6676-e1f5-4773-841a-e702545d08ca	true	userinfo.token.claim
542e6676-e1f5-4773-841a-e702545d08ca	nickname	user.attribute
542e6676-e1f5-4773-841a-e702545d08ca	true	id.token.claim
542e6676-e1f5-4773-841a-e702545d08ca	true	access.token.claim
542e6676-e1f5-4773-841a-e702545d08ca	nickname	claim.name
542e6676-e1f5-4773-841a-e702545d08ca	String	jsonType.label
04cec014-188f-4408-8292-0e18d9fbaa13	true	userinfo.token.claim
04cec014-188f-4408-8292-0e18d9fbaa13	username	user.attribute
04cec014-188f-4408-8292-0e18d9fbaa13	true	id.token.claim
04cec014-188f-4408-8292-0e18d9fbaa13	true	access.token.claim
04cec014-188f-4408-8292-0e18d9fbaa13	preferred_username	claim.name
04cec014-188f-4408-8292-0e18d9fbaa13	String	jsonType.label
3f101ad4-b129-4c2f-acc1-7ad826cf167b	true	userinfo.token.claim
3f101ad4-b129-4c2f-acc1-7ad826cf167b	profile	user.attribute
3f101ad4-b129-4c2f-acc1-7ad826cf167b	true	id.token.claim
3f101ad4-b129-4c2f-acc1-7ad826cf167b	true	access.token.claim
3f101ad4-b129-4c2f-acc1-7ad826cf167b	profile	claim.name
3f101ad4-b129-4c2f-acc1-7ad826cf167b	String	jsonType.label
48e033ce-5d4e-498a-b1f5-6b27da53299d	true	userinfo.token.claim
48e033ce-5d4e-498a-b1f5-6b27da53299d	picture	user.attribute
48e033ce-5d4e-498a-b1f5-6b27da53299d	true	id.token.claim
48e033ce-5d4e-498a-b1f5-6b27da53299d	true	access.token.claim
48e033ce-5d4e-498a-b1f5-6b27da53299d	picture	claim.name
48e033ce-5d4e-498a-b1f5-6b27da53299d	String	jsonType.label
fab689fa-1d3e-4cca-940d-1a324a5d2650	true	userinfo.token.claim
fab689fa-1d3e-4cca-940d-1a324a5d2650	website	user.attribute
fab689fa-1d3e-4cca-940d-1a324a5d2650	true	id.token.claim
fab689fa-1d3e-4cca-940d-1a324a5d2650	true	access.token.claim
fab689fa-1d3e-4cca-940d-1a324a5d2650	website	claim.name
fab689fa-1d3e-4cca-940d-1a324a5d2650	String	jsonType.label
58e6f09f-6dcc-4ac4-939b-672436f239c4	true	userinfo.token.claim
58e6f09f-6dcc-4ac4-939b-672436f239c4	gender	user.attribute
58e6f09f-6dcc-4ac4-939b-672436f239c4	true	id.token.claim
58e6f09f-6dcc-4ac4-939b-672436f239c4	true	access.token.claim
58e6f09f-6dcc-4ac4-939b-672436f239c4	gender	claim.name
58e6f09f-6dcc-4ac4-939b-672436f239c4	String	jsonType.label
a981a42b-b38d-43a9-8b32-870ac8168d6c	true	userinfo.token.claim
a981a42b-b38d-43a9-8b32-870ac8168d6c	birthdate	user.attribute
a981a42b-b38d-43a9-8b32-870ac8168d6c	true	id.token.claim
a981a42b-b38d-43a9-8b32-870ac8168d6c	true	access.token.claim
a981a42b-b38d-43a9-8b32-870ac8168d6c	birthdate	claim.name
a981a42b-b38d-43a9-8b32-870ac8168d6c	String	jsonType.label
b084ad30-e796-45f5-ba43-ae47927f02a2	true	userinfo.token.claim
b084ad30-e796-45f5-ba43-ae47927f02a2	zoneinfo	user.attribute
b084ad30-e796-45f5-ba43-ae47927f02a2	true	id.token.claim
b084ad30-e796-45f5-ba43-ae47927f02a2	true	access.token.claim
b084ad30-e796-45f5-ba43-ae47927f02a2	zoneinfo	claim.name
b084ad30-e796-45f5-ba43-ae47927f02a2	String	jsonType.label
8761a047-71ab-49dc-b652-2543124b4362	true	userinfo.token.claim
8761a047-71ab-49dc-b652-2543124b4362	locale	user.attribute
8761a047-71ab-49dc-b652-2543124b4362	true	id.token.claim
8761a047-71ab-49dc-b652-2543124b4362	true	access.token.claim
8761a047-71ab-49dc-b652-2543124b4362	locale	claim.name
8761a047-71ab-49dc-b652-2543124b4362	String	jsonType.label
63f4bbc2-933a-43ed-a119-5d3f45d48ab5	true	userinfo.token.claim
63f4bbc2-933a-43ed-a119-5d3f45d48ab5	updatedAt	user.attribute
63f4bbc2-933a-43ed-a119-5d3f45d48ab5	true	id.token.claim
63f4bbc2-933a-43ed-a119-5d3f45d48ab5	true	access.token.claim
63f4bbc2-933a-43ed-a119-5d3f45d48ab5	updated_at	claim.name
63f4bbc2-933a-43ed-a119-5d3f45d48ab5	long	jsonType.label
268d027e-e9d2-4e59-a681-ca68081f7504	true	userinfo.token.claim
268d027e-e9d2-4e59-a681-ca68081f7504	email	user.attribute
268d027e-e9d2-4e59-a681-ca68081f7504	true	id.token.claim
268d027e-e9d2-4e59-a681-ca68081f7504	true	access.token.claim
268d027e-e9d2-4e59-a681-ca68081f7504	email	claim.name
268d027e-e9d2-4e59-a681-ca68081f7504	String	jsonType.label
c664fa48-4276-4342-ba60-4e36ddec8314	true	userinfo.token.claim
c664fa48-4276-4342-ba60-4e36ddec8314	emailVerified	user.attribute
c664fa48-4276-4342-ba60-4e36ddec8314	true	id.token.claim
c664fa48-4276-4342-ba60-4e36ddec8314	true	access.token.claim
c664fa48-4276-4342-ba60-4e36ddec8314	email_verified	claim.name
c664fa48-4276-4342-ba60-4e36ddec8314	boolean	jsonType.label
47c38732-dd52-4f1f-89cc-ad4f062e8ffc	formatted	user.attribute.formatted
47c38732-dd52-4f1f-89cc-ad4f062e8ffc	country	user.attribute.country
47c38732-dd52-4f1f-89cc-ad4f062e8ffc	postal_code	user.attribute.postal_code
47c38732-dd52-4f1f-89cc-ad4f062e8ffc	true	userinfo.token.claim
47c38732-dd52-4f1f-89cc-ad4f062e8ffc	street	user.attribute.street
47c38732-dd52-4f1f-89cc-ad4f062e8ffc	true	id.token.claim
47c38732-dd52-4f1f-89cc-ad4f062e8ffc	region	user.attribute.region
47c38732-dd52-4f1f-89cc-ad4f062e8ffc	true	access.token.claim
47c38732-dd52-4f1f-89cc-ad4f062e8ffc	locality	user.attribute.locality
aee5e9df-d5ad-4110-8508-595ad1634726	true	userinfo.token.claim
aee5e9df-d5ad-4110-8508-595ad1634726	phoneNumber	user.attribute
aee5e9df-d5ad-4110-8508-595ad1634726	true	id.token.claim
aee5e9df-d5ad-4110-8508-595ad1634726	true	access.token.claim
aee5e9df-d5ad-4110-8508-595ad1634726	phone_number	claim.name
aee5e9df-d5ad-4110-8508-595ad1634726	String	jsonType.label
41dab842-b4a7-4453-87c6-5e6e1aa27362	true	userinfo.token.claim
41dab842-b4a7-4453-87c6-5e6e1aa27362	phoneNumberVerified	user.attribute
41dab842-b4a7-4453-87c6-5e6e1aa27362	true	id.token.claim
41dab842-b4a7-4453-87c6-5e6e1aa27362	true	access.token.claim
41dab842-b4a7-4453-87c6-5e6e1aa27362	phone_number_verified	claim.name
41dab842-b4a7-4453-87c6-5e6e1aa27362	boolean	jsonType.label
6013eaea-24c2-4614-a8e8-fd3739900269	true	multivalued
6013eaea-24c2-4614-a8e8-fd3739900269	foo	user.attribute
6013eaea-24c2-4614-a8e8-fd3739900269	true	access.token.claim
6013eaea-24c2-4614-a8e8-fd3739900269	realm_access.roles	claim.name
6013eaea-24c2-4614-a8e8-fd3739900269	String	jsonType.label
8ce18fc7-8a53-4e59-be6d-2d630cb7c3fb	true	multivalued
8ce18fc7-8a53-4e59-be6d-2d630cb7c3fb	foo	user.attribute
8ce18fc7-8a53-4e59-be6d-2d630cb7c3fb	true	access.token.claim
8ce18fc7-8a53-4e59-be6d-2d630cb7c3fb	resource_access.${client_id}.roles	claim.name
8ce18fc7-8a53-4e59-be6d-2d630cb7c3fb	String	jsonType.label
4eb3d064-2002-4524-9be9-4030330b8558	true	userinfo.token.claim
4eb3d064-2002-4524-9be9-4030330b8558	username	user.attribute
4eb3d064-2002-4524-9be9-4030330b8558	true	id.token.claim
4eb3d064-2002-4524-9be9-4030330b8558	true	access.token.claim
4eb3d064-2002-4524-9be9-4030330b8558	upn	claim.name
4eb3d064-2002-4524-9be9-4030330b8558	String	jsonType.label
a4ec9437-ed31-4a9e-9eb0-569ccea848eb	true	multivalued
a4ec9437-ed31-4a9e-9eb0-569ccea848eb	foo	user.attribute
a4ec9437-ed31-4a9e-9eb0-569ccea848eb	true	id.token.claim
a4ec9437-ed31-4a9e-9eb0-569ccea848eb	true	access.token.claim
a4ec9437-ed31-4a9e-9eb0-569ccea848eb	groups	claim.name
a4ec9437-ed31-4a9e-9eb0-569ccea848eb	String	jsonType.label
61c6acb2-0704-473d-9318-93c5d829f61c	true	id.token.claim
61c6acb2-0704-473d-9318-93c5d829f61c	true	access.token.claim
01e7cc48-a159-42bc-aeb5-f20b4184eb05	false	single
01e7cc48-a159-42bc-aeb5-f20b4184eb05	Basic	attribute.nameformat
01e7cc48-a159-42bc-aeb5-f20b4184eb05	Role	attribute.name
6bb1706c-92f2-4373-a9ab-a827188d5487	true	userinfo.token.claim
6bb1706c-92f2-4373-a9ab-a827188d5487	true	id.token.claim
6bb1706c-92f2-4373-a9ab-a827188d5487	true	access.token.claim
c367222a-18b5-4cc7-94e5-e9a3f35cdc42	true	userinfo.token.claim
c367222a-18b5-4cc7-94e5-e9a3f35cdc42	lastName	user.attribute
c367222a-18b5-4cc7-94e5-e9a3f35cdc42	true	id.token.claim
c367222a-18b5-4cc7-94e5-e9a3f35cdc42	true	access.token.claim
c367222a-18b5-4cc7-94e5-e9a3f35cdc42	family_name	claim.name
c367222a-18b5-4cc7-94e5-e9a3f35cdc42	String	jsonType.label
0815ec8b-e04d-45dd-9dea-b6233d419446	true	userinfo.token.claim
0815ec8b-e04d-45dd-9dea-b6233d419446	firstName	user.attribute
0815ec8b-e04d-45dd-9dea-b6233d419446	true	id.token.claim
0815ec8b-e04d-45dd-9dea-b6233d419446	true	access.token.claim
0815ec8b-e04d-45dd-9dea-b6233d419446	given_name	claim.name
0815ec8b-e04d-45dd-9dea-b6233d419446	String	jsonType.label
43b4b785-bb35-43f9-966a-f18c1e9ec5f2	true	userinfo.token.claim
43b4b785-bb35-43f9-966a-f18c1e9ec5f2	middleName	user.attribute
43b4b785-bb35-43f9-966a-f18c1e9ec5f2	true	id.token.claim
43b4b785-bb35-43f9-966a-f18c1e9ec5f2	true	access.token.claim
43b4b785-bb35-43f9-966a-f18c1e9ec5f2	middle_name	claim.name
43b4b785-bb35-43f9-966a-f18c1e9ec5f2	String	jsonType.label
5e57c03b-1cbc-4039-a6f8-f1b0ad1716ff	true	userinfo.token.claim
5e57c03b-1cbc-4039-a6f8-f1b0ad1716ff	nickname	user.attribute
5e57c03b-1cbc-4039-a6f8-f1b0ad1716ff	true	id.token.claim
5e57c03b-1cbc-4039-a6f8-f1b0ad1716ff	true	access.token.claim
5e57c03b-1cbc-4039-a6f8-f1b0ad1716ff	nickname	claim.name
5e57c03b-1cbc-4039-a6f8-f1b0ad1716ff	String	jsonType.label
d475b4d9-e3c3-4579-8938-26651a458ed9	true	userinfo.token.claim
d475b4d9-e3c3-4579-8938-26651a458ed9	username	user.attribute
d475b4d9-e3c3-4579-8938-26651a458ed9	true	id.token.claim
d475b4d9-e3c3-4579-8938-26651a458ed9	true	access.token.claim
d475b4d9-e3c3-4579-8938-26651a458ed9	preferred_username	claim.name
d475b4d9-e3c3-4579-8938-26651a458ed9	String	jsonType.label
f95b25f7-9bc2-4fec-b4d2-9077285db7fd	true	userinfo.token.claim
f95b25f7-9bc2-4fec-b4d2-9077285db7fd	profile	user.attribute
f95b25f7-9bc2-4fec-b4d2-9077285db7fd	true	id.token.claim
f95b25f7-9bc2-4fec-b4d2-9077285db7fd	true	access.token.claim
f95b25f7-9bc2-4fec-b4d2-9077285db7fd	profile	claim.name
f95b25f7-9bc2-4fec-b4d2-9077285db7fd	String	jsonType.label
cd1e56e2-effe-458c-9c0c-0f67f2f2d4de	true	userinfo.token.claim
cd1e56e2-effe-458c-9c0c-0f67f2f2d4de	picture	user.attribute
cd1e56e2-effe-458c-9c0c-0f67f2f2d4de	true	id.token.claim
cd1e56e2-effe-458c-9c0c-0f67f2f2d4de	true	access.token.claim
cd1e56e2-effe-458c-9c0c-0f67f2f2d4de	picture	claim.name
cd1e56e2-effe-458c-9c0c-0f67f2f2d4de	String	jsonType.label
7b99ebfe-2710-419c-b91d-df65459a28d3	true	userinfo.token.claim
7b99ebfe-2710-419c-b91d-df65459a28d3	website	user.attribute
7b99ebfe-2710-419c-b91d-df65459a28d3	true	id.token.claim
7b99ebfe-2710-419c-b91d-df65459a28d3	true	access.token.claim
7b99ebfe-2710-419c-b91d-df65459a28d3	website	claim.name
7b99ebfe-2710-419c-b91d-df65459a28d3	String	jsonType.label
9f89d35b-d197-412e-9f29-b49c04bad0ab	true	userinfo.token.claim
9f89d35b-d197-412e-9f29-b49c04bad0ab	gender	user.attribute
9f89d35b-d197-412e-9f29-b49c04bad0ab	true	id.token.claim
9f89d35b-d197-412e-9f29-b49c04bad0ab	true	access.token.claim
9f89d35b-d197-412e-9f29-b49c04bad0ab	gender	claim.name
9f89d35b-d197-412e-9f29-b49c04bad0ab	String	jsonType.label
38791c83-2662-4486-a168-2cc6512ab7bf	true	userinfo.token.claim
38791c83-2662-4486-a168-2cc6512ab7bf	birthdate	user.attribute
38791c83-2662-4486-a168-2cc6512ab7bf	true	id.token.claim
38791c83-2662-4486-a168-2cc6512ab7bf	true	access.token.claim
38791c83-2662-4486-a168-2cc6512ab7bf	birthdate	claim.name
38791c83-2662-4486-a168-2cc6512ab7bf	String	jsonType.label
6c98909a-e0bc-4d51-a60a-c8af0565c32e	true	userinfo.token.claim
6c98909a-e0bc-4d51-a60a-c8af0565c32e	zoneinfo	user.attribute
6c98909a-e0bc-4d51-a60a-c8af0565c32e	true	id.token.claim
6c98909a-e0bc-4d51-a60a-c8af0565c32e	true	access.token.claim
6c98909a-e0bc-4d51-a60a-c8af0565c32e	zoneinfo	claim.name
6c98909a-e0bc-4d51-a60a-c8af0565c32e	String	jsonType.label
17a13184-9c0b-4071-b41a-ffd437e7e67a	true	userinfo.token.claim
17a13184-9c0b-4071-b41a-ffd437e7e67a	locale	user.attribute
17a13184-9c0b-4071-b41a-ffd437e7e67a	true	id.token.claim
17a13184-9c0b-4071-b41a-ffd437e7e67a	true	access.token.claim
17a13184-9c0b-4071-b41a-ffd437e7e67a	locale	claim.name
17a13184-9c0b-4071-b41a-ffd437e7e67a	String	jsonType.label
4cf929a6-5cdf-4d32-8a8f-a6d25d0fbe81	true	userinfo.token.claim
4cf929a6-5cdf-4d32-8a8f-a6d25d0fbe81	updatedAt	user.attribute
4cf929a6-5cdf-4d32-8a8f-a6d25d0fbe81	true	id.token.claim
4cf929a6-5cdf-4d32-8a8f-a6d25d0fbe81	true	access.token.claim
4cf929a6-5cdf-4d32-8a8f-a6d25d0fbe81	updated_at	claim.name
4cf929a6-5cdf-4d32-8a8f-a6d25d0fbe81	long	jsonType.label
debc175b-4d22-4fef-b1d8-1266f9c900fe	true	userinfo.token.claim
debc175b-4d22-4fef-b1d8-1266f9c900fe	email	user.attribute
debc175b-4d22-4fef-b1d8-1266f9c900fe	true	id.token.claim
debc175b-4d22-4fef-b1d8-1266f9c900fe	true	access.token.claim
debc175b-4d22-4fef-b1d8-1266f9c900fe	email	claim.name
debc175b-4d22-4fef-b1d8-1266f9c900fe	String	jsonType.label
838b4ebc-4c1a-44ab-8935-6d5273657c43	true	userinfo.token.claim
838b4ebc-4c1a-44ab-8935-6d5273657c43	emailVerified	user.attribute
838b4ebc-4c1a-44ab-8935-6d5273657c43	true	id.token.claim
838b4ebc-4c1a-44ab-8935-6d5273657c43	true	access.token.claim
838b4ebc-4c1a-44ab-8935-6d5273657c43	email_verified	claim.name
838b4ebc-4c1a-44ab-8935-6d5273657c43	boolean	jsonType.label
7c36173b-23c0-4cc5-8366-f96a17dbd596	formatted	user.attribute.formatted
7c36173b-23c0-4cc5-8366-f96a17dbd596	country	user.attribute.country
7c36173b-23c0-4cc5-8366-f96a17dbd596	postal_code	user.attribute.postal_code
7c36173b-23c0-4cc5-8366-f96a17dbd596	true	userinfo.token.claim
7c36173b-23c0-4cc5-8366-f96a17dbd596	street	user.attribute.street
7c36173b-23c0-4cc5-8366-f96a17dbd596	true	id.token.claim
7c36173b-23c0-4cc5-8366-f96a17dbd596	region	user.attribute.region
7c36173b-23c0-4cc5-8366-f96a17dbd596	true	access.token.claim
7c36173b-23c0-4cc5-8366-f96a17dbd596	locality	user.attribute.locality
21da3026-db6a-4260-b0d8-76e559652dab	true	userinfo.token.claim
21da3026-db6a-4260-b0d8-76e559652dab	phoneNumber	user.attribute
21da3026-db6a-4260-b0d8-76e559652dab	true	id.token.claim
21da3026-db6a-4260-b0d8-76e559652dab	true	access.token.claim
21da3026-db6a-4260-b0d8-76e559652dab	phone_number	claim.name
21da3026-db6a-4260-b0d8-76e559652dab	String	jsonType.label
5c0d8c33-9015-47db-9f16-0c2de433aa15	true	userinfo.token.claim
5c0d8c33-9015-47db-9f16-0c2de433aa15	phoneNumberVerified	user.attribute
5c0d8c33-9015-47db-9f16-0c2de433aa15	true	id.token.claim
5c0d8c33-9015-47db-9f16-0c2de433aa15	true	access.token.claim
5c0d8c33-9015-47db-9f16-0c2de433aa15	phone_number_verified	claim.name
5c0d8c33-9015-47db-9f16-0c2de433aa15	boolean	jsonType.label
704fe1d0-8141-4990-81b8-3b5876d48a18	true	multivalued
704fe1d0-8141-4990-81b8-3b5876d48a18	foo	user.attribute
704fe1d0-8141-4990-81b8-3b5876d48a18	true	access.token.claim
704fe1d0-8141-4990-81b8-3b5876d48a18	realm_access.roles	claim.name
704fe1d0-8141-4990-81b8-3b5876d48a18	String	jsonType.label
6353431a-b5f2-4c5d-98ac-89904a0969c2	true	multivalued
6353431a-b5f2-4c5d-98ac-89904a0969c2	foo	user.attribute
6353431a-b5f2-4c5d-98ac-89904a0969c2	true	access.token.claim
6353431a-b5f2-4c5d-98ac-89904a0969c2	resource_access.${client_id}.roles	claim.name
6353431a-b5f2-4c5d-98ac-89904a0969c2	String	jsonType.label
229696b3-4bb8-4bb9-b366-2313db52be00	true	userinfo.token.claim
229696b3-4bb8-4bb9-b366-2313db52be00	username	user.attribute
229696b3-4bb8-4bb9-b366-2313db52be00	true	id.token.claim
229696b3-4bb8-4bb9-b366-2313db52be00	true	access.token.claim
229696b3-4bb8-4bb9-b366-2313db52be00	upn	claim.name
229696b3-4bb8-4bb9-b366-2313db52be00	String	jsonType.label
81b7b8d3-ed24-404a-914a-c1a377a22ff8	true	multivalued
81b7b8d3-ed24-404a-914a-c1a377a22ff8	foo	user.attribute
81b7b8d3-ed24-404a-914a-c1a377a22ff8	true	id.token.claim
81b7b8d3-ed24-404a-914a-c1a377a22ff8	true	access.token.claim
81b7b8d3-ed24-404a-914a-c1a377a22ff8	groups	claim.name
81b7b8d3-ed24-404a-914a-c1a377a22ff8	String	jsonType.label
ba7af464-0b18-4995-b68c-ab404b3793f1	true	id.token.claim
ba7af464-0b18-4995-b68c-ab404b3793f1	true	access.token.claim
dc129b04-87d4-4396-b8de-a9c34b47f4db	true	userinfo.token.claim
dc129b04-87d4-4396-b8de-a9c34b47f4db	locale	user.attribute
dc129b04-87d4-4396-b8de-a9c34b47f4db	true	id.token.claim
dc129b04-87d4-4396-b8de-a9c34b47f4db	true	access.token.claim
dc129b04-87d4-4396-b8de-a9c34b47f4db	locale	claim.name
dc129b04-87d4-4396-b8de-a9c34b47f4db	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
52972857-3a02-44f3-8c45-983c95924d7f	60	300	300	\N	\N	\N	t	f	0	\N	my_realm	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	e6f29d7b-c832-4474-8ce3-14f7912ef6c0	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	64adb84c-86a0-428d-8eac-5d88f68f0faa	6ebfe602-d06c-4040-b84a-92f8fcebe494	c9e97079-5558-41a0-b21d-c0f6c6095e54	4e1b00c6-2f45-403e-9fc6-6f35b95baa22	7e54b685-b025-461b-ace0-e5edc61ff781	2592000	f	900	t	f	38b22865-9a8e-4823-bbe2-90eaa5cd1ba8	0	f	0	0	f00ede1b-4a10-4c89-b707-5f01bb4a5e1c
5486cd06-0bdd-43e9-bdf8-d68e838140cd	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	22250aec-2f60-4c70-be7d-84efdf67cd02	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	355f958c-20cc-4b84-8ca6-1265e8996881	6c69f3e6-ce0f-4b75-9577-89957af3d8d4	6e740995-f31a-4181-9a58-37f0b1a84955	8449573d-682d-40df-af73-b31427a10486	38eb683e-2db8-4fef-9131-c9977c770896	2592000	f	900	t	f	888752e6-da5e-4e70-9956-71bc6c774341	0	f	0	0	c51a3ec3-bf19-4fff-b41c-61967d1207c4
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	5486cd06-0bdd-43e9-bdf8-d68e838140cd	
_browser_header.xContentTypeOptions	5486cd06-0bdd-43e9-bdf8-d68e838140cd	nosniff
_browser_header.xRobotsTag	5486cd06-0bdd-43e9-bdf8-d68e838140cd	none
_browser_header.xFrameOptions	5486cd06-0bdd-43e9-bdf8-d68e838140cd	SAMEORIGIN
_browser_header.contentSecurityPolicy	5486cd06-0bdd-43e9-bdf8-d68e838140cd	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	5486cd06-0bdd-43e9-bdf8-d68e838140cd	1; mode=block
_browser_header.strictTransportSecurity	5486cd06-0bdd-43e9-bdf8-d68e838140cd	max-age=31536000; includeSubDomains
bruteForceProtected	5486cd06-0bdd-43e9-bdf8-d68e838140cd	false
permanentLockout	5486cd06-0bdd-43e9-bdf8-d68e838140cd	false
maxFailureWaitSeconds	5486cd06-0bdd-43e9-bdf8-d68e838140cd	900
minimumQuickLoginWaitSeconds	5486cd06-0bdd-43e9-bdf8-d68e838140cd	60
waitIncrementSeconds	5486cd06-0bdd-43e9-bdf8-d68e838140cd	60
quickLoginCheckMilliSeconds	5486cd06-0bdd-43e9-bdf8-d68e838140cd	1000
maxDeltaTimeSeconds	5486cd06-0bdd-43e9-bdf8-d68e838140cd	43200
failureFactor	5486cd06-0bdd-43e9-bdf8-d68e838140cd	30
displayName	5486cd06-0bdd-43e9-bdf8-d68e838140cd	Keycloak
displayNameHtml	5486cd06-0bdd-43e9-bdf8-d68e838140cd	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	5486cd06-0bdd-43e9-bdf8-d68e838140cd	RS256
offlineSessionMaxLifespanEnabled	5486cd06-0bdd-43e9-bdf8-d68e838140cd	false
offlineSessionMaxLifespan	5486cd06-0bdd-43e9-bdf8-d68e838140cd	5184000
bruteForceProtected	52972857-3a02-44f3-8c45-983c95924d7f	false
permanentLockout	52972857-3a02-44f3-8c45-983c95924d7f	false
maxFailureWaitSeconds	52972857-3a02-44f3-8c45-983c95924d7f	900
minimumQuickLoginWaitSeconds	52972857-3a02-44f3-8c45-983c95924d7f	60
waitIncrementSeconds	52972857-3a02-44f3-8c45-983c95924d7f	60
quickLoginCheckMilliSeconds	52972857-3a02-44f3-8c45-983c95924d7f	1000
maxDeltaTimeSeconds	52972857-3a02-44f3-8c45-983c95924d7f	43200
failureFactor	52972857-3a02-44f3-8c45-983c95924d7f	30
actionTokenGeneratedByAdminLifespan	52972857-3a02-44f3-8c45-983c95924d7f	43200
actionTokenGeneratedByUserLifespan	52972857-3a02-44f3-8c45-983c95924d7f	300
defaultSignatureAlgorithm	52972857-3a02-44f3-8c45-983c95924d7f	RS256
offlineSessionMaxLifespanEnabled	52972857-3a02-44f3-8c45-983c95924d7f	false
offlineSessionMaxLifespan	52972857-3a02-44f3-8c45-983c95924d7f	5184000
webAuthnPolicyRpEntityName	52972857-3a02-44f3-8c45-983c95924d7f	keycloak
webAuthnPolicySignatureAlgorithms	52972857-3a02-44f3-8c45-983c95924d7f	ES256
webAuthnPolicyRpId	52972857-3a02-44f3-8c45-983c95924d7f	
webAuthnPolicyAttestationConveyancePreference	52972857-3a02-44f3-8c45-983c95924d7f	not specified
webAuthnPolicyAuthenticatorAttachment	52972857-3a02-44f3-8c45-983c95924d7f	not specified
webAuthnPolicyRequireResidentKey	52972857-3a02-44f3-8c45-983c95924d7f	not specified
webAuthnPolicyUserVerificationRequirement	52972857-3a02-44f3-8c45-983c95924d7f	not specified
oauth2DeviceCodeLifespan	52972857-3a02-44f3-8c45-983c95924d7f	600
oauth2DevicePollingInterval	52972857-3a02-44f3-8c45-983c95924d7f	5
webAuthnPolicyCreateTimeout	52972857-3a02-44f3-8c45-983c95924d7f	0
webAuthnPolicyAvoidSameAuthenticatorRegister	52972857-3a02-44f3-8c45-983c95924d7f	false
webAuthnPolicyRpEntityNamePasswordless	52972857-3a02-44f3-8c45-983c95924d7f	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	52972857-3a02-44f3-8c45-983c95924d7f	ES256
webAuthnPolicyRpIdPasswordless	52972857-3a02-44f3-8c45-983c95924d7f	
webAuthnPolicyAttestationConveyancePreferencePasswordless	52972857-3a02-44f3-8c45-983c95924d7f	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	52972857-3a02-44f3-8c45-983c95924d7f	not specified
webAuthnPolicyRequireResidentKeyPasswordless	52972857-3a02-44f3-8c45-983c95924d7f	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	52972857-3a02-44f3-8c45-983c95924d7f	not specified
webAuthnPolicyCreateTimeoutPasswordless	52972857-3a02-44f3-8c45-983c95924d7f	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	52972857-3a02-44f3-8c45-983c95924d7f	false
client-policies.profiles	52972857-3a02-44f3-8c45-983c95924d7f	{"profiles":[]}
client-policies.policies	52972857-3a02-44f3-8c45-983c95924d7f	{"policies":[]}
_browser_header.contentSecurityPolicyReportOnly	52972857-3a02-44f3-8c45-983c95924d7f	
_browser_header.xContentTypeOptions	52972857-3a02-44f3-8c45-983c95924d7f	nosniff
_browser_header.xRobotsTag	52972857-3a02-44f3-8c45-983c95924d7f	none
_browser_header.xFrameOptions	52972857-3a02-44f3-8c45-983c95924d7f	SAMEORIGIN
_browser_header.contentSecurityPolicy	52972857-3a02-44f3-8c45-983c95924d7f	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
cibaBackchannelTokenDeliveryMode	52972857-3a02-44f3-8c45-983c95924d7f	poll
cibaExpiresIn	52972857-3a02-44f3-8c45-983c95924d7f	120
cibaInterval	52972857-3a02-44f3-8c45-983c95924d7f	5
cibaAuthRequestedUserHint	52972857-3a02-44f3-8c45-983c95924d7f	login_hint
parRequestUriLifespan	52972857-3a02-44f3-8c45-983c95924d7f	60
actionTokenGeneratedByUserLifespan-verify-email	52972857-3a02-44f3-8c45-983c95924d7f	
actionTokenGeneratedByUserLifespan-idp-verify-account-via-email	52972857-3a02-44f3-8c45-983c95924d7f	
actionTokenGeneratedByUserLifespan-reset-credentials	52972857-3a02-44f3-8c45-983c95924d7f	
actionTokenGeneratedByUserLifespan-execute-actions	52972857-3a02-44f3-8c45-983c95924d7f	
_browser_header.xXSSProtection	52972857-3a02-44f3-8c45-983c95924d7f	1; mode=block
_browser_header.strictTransportSecurity	52972857-3a02-44f3-8c45-983c95924d7f	max-age=31536000; includeSubDomains
clientSessionIdleTimeout	52972857-3a02-44f3-8c45-983c95924d7f	0
clientSessionMaxLifespan	52972857-3a02-44f3-8c45-983c95924d7f	0
clientOfflineSessionIdleTimeout	52972857-3a02-44f3-8c45-983c95924d7f	0
clientOfflineSessionMaxLifespan	52972857-3a02-44f3-8c45-983c95924d7f	0
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
5486cd06-0bdd-43e9-bdf8-d68e838140cd	jboss-logging
52972857-3a02-44f3-8c45-983c95924d7f	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	5486cd06-0bdd-43e9-bdf8-d68e838140cd
password	password	t	t	52972857-3a02-44f3-8c45-983c95924d7f
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
01af5524-6897-4b8b-b803-50dd0c94351d	/realms/master/account/*
9157837e-b1a2-4e9b-bfdd-bae1db5cbfb8	/realms/master/account/*
782c9a9c-5265-489d-93b8-f643d3a65485	/admin/master/console/*
24d3129e-77a1-433d-8aca-5ca60358e1f2	/realms/my_realm/account/*
db49f247-6905-4342-8db8-a3dcaad2a856	/realms/my_realm/account/*
d83c087a-02f9-4790-b1f6-fb0e345b08f1	/admin/my_realm/console/*
5b8cf74f-3eec-46a4-9d3c-c52ef7bbc818	*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
7877e180-7fea-4827-b558-c9803f62ea4e	VERIFY_EMAIL	Verify Email	5486cd06-0bdd-43e9-bdf8-d68e838140cd	t	f	VERIFY_EMAIL	50
c63a9637-1226-4dc2-a3a5-552b296c17f3	UPDATE_PROFILE	Update Profile	5486cd06-0bdd-43e9-bdf8-d68e838140cd	t	f	UPDATE_PROFILE	40
c07ec586-311e-47d2-a587-544786ce1156	CONFIGURE_TOTP	Configure OTP	5486cd06-0bdd-43e9-bdf8-d68e838140cd	t	f	CONFIGURE_TOTP	10
15a66db1-85dc-4b0d-9f25-4ad5e9659ffd	UPDATE_PASSWORD	Update Password	5486cd06-0bdd-43e9-bdf8-d68e838140cd	t	f	UPDATE_PASSWORD	30
1356557a-c2c1-4e08-8e39-0bae34643ac8	terms_and_conditions	Terms and Conditions	5486cd06-0bdd-43e9-bdf8-d68e838140cd	f	f	terms_and_conditions	20
9296040e-dcdb-47a0-9f12-babf4161d47c	update_user_locale	Update User Locale	5486cd06-0bdd-43e9-bdf8-d68e838140cd	t	f	update_user_locale	1000
6df39254-0a3a-43a6-b419-7fa1e59bc1ea	delete_account	Delete Account	5486cd06-0bdd-43e9-bdf8-d68e838140cd	f	f	delete_account	60
e06b0dd5-a4f8-42b9-8837-b629ee0352d8	webauthn-register	Webauthn Register	5486cd06-0bdd-43e9-bdf8-d68e838140cd	t	f	webauthn-register	70
fa393e80-bb4e-4de1-9c85-82e2d74ab880	webauthn-register-passwordless	Webauthn Register Passwordless	5486cd06-0bdd-43e9-bdf8-d68e838140cd	t	f	webauthn-register-passwordless	80
f8354b38-2a99-4895-86a6-5a3273190e0f	VERIFY_EMAIL	Verify Email	52972857-3a02-44f3-8c45-983c95924d7f	t	f	VERIFY_EMAIL	50
5f685524-94ff-44e0-9455-7817456b6446	UPDATE_PROFILE	Update Profile	52972857-3a02-44f3-8c45-983c95924d7f	t	f	UPDATE_PROFILE	40
d856f89a-bd3a-4daa-addd-84d8b34b026f	CONFIGURE_TOTP	Configure OTP	52972857-3a02-44f3-8c45-983c95924d7f	t	f	CONFIGURE_TOTP	10
27454015-b327-46b1-a3a4-38c56213f511	UPDATE_PASSWORD	Update Password	52972857-3a02-44f3-8c45-983c95924d7f	t	f	UPDATE_PASSWORD	30
2f666a2f-4362-4faf-ac86-f409db521577	terms_and_conditions	Terms and Conditions	52972857-3a02-44f3-8c45-983c95924d7f	f	f	terms_and_conditions	20
173d7a33-85f8-4749-a788-d27426649dea	update_user_locale	Update User Locale	52972857-3a02-44f3-8c45-983c95924d7f	t	f	update_user_locale	1000
3ca8be30-b58b-493f-942d-7750ccd7291d	delete_account	Delete Account	52972857-3a02-44f3-8c45-983c95924d7f	f	f	delete_account	60
37aeb2a6-cd4a-4c2a-b180-b347318beb03	webauthn-register	Webauthn Register	52972857-3a02-44f3-8c45-983c95924d7f	t	f	webauthn-register	70
32c4b3b8-eb30-4854-be91-98dda02020c3	webauthn-register-passwordless	Webauthn Register Passwordless	52972857-3a02-44f3-8c45-983c95924d7f	t	f	webauthn-register-passwordless	80
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
9157837e-b1a2-4e9b-bfdd-bae1db5cbfb8	34765a68-b912-4fa2-a2d7-43697b3fa78f
db49f247-6905-4342-8db8-a3dcaad2a856	3a368900-3933-457c-a67c-30918509b4d9
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
profile-image	http://localhost:8081/files-uploader/file/image/a9b1ffe0-142a-4ff6-8564-c206bea8630c	405e98f2-785e-45b7-b8ec-722b12116205	53361569-e66d-48b3-869b-f99e767ff857
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
c99df027-0ee1-44ee-81a2-af8f6d858eab	\N	ebe002d9-bcd9-41ff-940c-9af527abff54	f	t	\N	\N	\N	5486cd06-0bdd-43e9-bdf8-d68e838140cd	admin	1663312223123	\N	0
e48aa998-b03a-4fc9-9f54-de419d2a868e	\N	bd40cf75-b303-4716-a805-d7a894cb2e64	f	t	\N			52972857-3a02-44f3-8c45-983c95924d7f	mike	1663314462232	\N	0
0096bdcd-4ce7-423e-892f-3fa581dd0904	\N	b6f3dfe1-8806-4c1d-8aa6-00848a8eebb0	f	t	\N			52972857-3a02-44f3-8c45-983c95924d7f	alex	1663314525552	\N	0
35272e19-35dc-4055-9889-c35002adf153	\N	a736b113-bd9d-4cb0-b61c-95edc3cf3a8f	f	t	\N			52972857-3a02-44f3-8c45-983c95924d7f	admin	1666373511737	\N	0
405e98f2-785e-45b7-b8ec-722b12116205	test@test	test@test	f	t	\N	Mike	Koth	52972857-3a02-44f3-8c45-983c95924d7f	test	1666640557728	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
c51a3ec3-bf19-4fff-b41c-61967d1207c4	c99df027-0ee1-44ee-81a2-af8f6d858eab
f3e0cac8-ff90-4493-b80b-8693de9a8bd9	c99df027-0ee1-44ee-81a2-af8f6d858eab
c3896910-bb50-4863-8c2e-39fef1c4ba59	c99df027-0ee1-44ee-81a2-af8f6d858eab
d638ac98-8699-48e4-9ba4-58062889b896	c99df027-0ee1-44ee-81a2-af8f6d858eab
08e7d595-37b7-45c9-9f7a-749063248cdd	c99df027-0ee1-44ee-81a2-af8f6d858eab
3dda8984-da96-49b9-a97b-1df36cdb5848	c99df027-0ee1-44ee-81a2-af8f6d858eab
0a06d78d-38e5-4db2-958a-7f55f59c5760	c99df027-0ee1-44ee-81a2-af8f6d858eab
f0ac2b35-78fd-4d9b-b356-0a66715fc285	c99df027-0ee1-44ee-81a2-af8f6d858eab
9e448fe5-cf09-4879-afa4-89eef0a77c4d	c99df027-0ee1-44ee-81a2-af8f6d858eab
a8b71440-3ed2-42ae-a119-216b7a4c4e2e	c99df027-0ee1-44ee-81a2-af8f6d858eab
b1aa6541-de1e-4364-9f05-65d879d1e7cc	c99df027-0ee1-44ee-81a2-af8f6d858eab
396ea043-1607-4c24-961a-231d018a52a7	c99df027-0ee1-44ee-81a2-af8f6d858eab
f817bfa1-f26e-4eeb-9b32-64f39a5e729e	c99df027-0ee1-44ee-81a2-af8f6d858eab
a6598f37-283b-44e0-b469-459fb628f1a9	c99df027-0ee1-44ee-81a2-af8f6d858eab
f0aaffd8-4fc8-4fb5-a93f-1def5db1d2b6	c99df027-0ee1-44ee-81a2-af8f6d858eab
8fc93845-4ed9-46d3-bf96-20973a4878e7	c99df027-0ee1-44ee-81a2-af8f6d858eab
3c0cb1e1-c39f-4b1f-b5dd-acb2b12d533d	c99df027-0ee1-44ee-81a2-af8f6d858eab
79dc3a1e-901b-464f-a874-d1d0e31807a0	c99df027-0ee1-44ee-81a2-af8f6d858eab
ef71b866-5407-4664-9c10-267920e43466	c99df027-0ee1-44ee-81a2-af8f6d858eab
f00ede1b-4a10-4c89-b707-5f01bb4a5e1c	e48aa998-b03a-4fc9-9f54-de419d2a868e
cd03b4b2-ec87-44ce-920e-5314da215cac	e48aa998-b03a-4fc9-9f54-de419d2a868e
f00ede1b-4a10-4c89-b707-5f01bb4a5e1c	0096bdcd-4ce7-423e-892f-3fa581dd0904
c81e0075-f872-486c-b61d-e251c558bc18	0096bdcd-4ce7-423e-892f-3fa581dd0904
f00ede1b-4a10-4c89-b707-5f01bb4a5e1c	35272e19-35dc-4055-9889-c35002adf153
0e9eaa2c-a9f2-47e4-8177-0e3eefa62a3d	35272e19-35dc-4055-9889-c35002adf153
fbbbfff7-c845-4a45-8348-b704de71aec4	35272e19-35dc-4055-9889-c35002adf153
dd126840-474c-44ad-96b3-234b6a2768a2	35272e19-35dc-4055-9889-c35002adf153
3a288c00-625c-4899-9eed-af9a9a5dea01	35272e19-35dc-4055-9889-c35002adf153
88a02aed-8365-4560-a969-f4895bac0840	35272e19-35dc-4055-9889-c35002adf153
8918d60b-327e-4281-ab47-c06bd7c69089	35272e19-35dc-4055-9889-c35002adf153
75575664-9192-44d9-bb2d-6a64479efca8	35272e19-35dc-4055-9889-c35002adf153
0a7189dc-7ed5-4377-a2df-5953bb59966a	35272e19-35dc-4055-9889-c35002adf153
4030b02a-d090-4b51-b80c-3ddce37c785f	35272e19-35dc-4055-9889-c35002adf153
e4fde482-1a03-485c-909c-c5e62c1ef17a	35272e19-35dc-4055-9889-c35002adf153
0322a1da-3bf2-4d5f-ab0a-fee87f5af560	35272e19-35dc-4055-9889-c35002adf153
db1b6bde-7abb-45bc-84da-38f922c2e391	35272e19-35dc-4055-9889-c35002adf153
909109b5-23b9-41aa-840f-3dae4b772f44	35272e19-35dc-4055-9889-c35002adf153
7270aaad-cfbc-4755-8262-8c8e7ca49347	35272e19-35dc-4055-9889-c35002adf153
a1d7e7a4-46f3-46cb-a8f8-3591fb5348fd	35272e19-35dc-4055-9889-c35002adf153
b36c51ef-aa9f-4e9b-9b85-c4c02208fe27	35272e19-35dc-4055-9889-c35002adf153
77852eef-dd9b-4207-a3a1-60a7b333b7aa	35272e19-35dc-4055-9889-c35002adf153
53af2d65-83da-4f5b-8ef0-b580bf7b993e	35272e19-35dc-4055-9889-c35002adf153
bbb117e4-402c-4c27-8935-4e18af199cbb	35272e19-35dc-4055-9889-c35002adf153
f00ede1b-4a10-4c89-b707-5f01bb4a5e1c	405e98f2-785e-45b7-b8ec-722b12116205
ff9bfa0f-118f-4f54-9e4c-63c29b7c8647	405e98f2-785e-45b7-b8ec-722b12116205
ff9bfa0f-118f-4f54-9e4c-63c29b7c8647	0096bdcd-4ce7-423e-892f-3fa581dd0904
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
782c9a9c-5265-489d-93b8-f643d3a65485	+
d83c087a-02f9-4790-b1f6-fb0e345b08f1	+
5b8cf74f-3eec-46a4-9d3c-c52ef7bbc818	*
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-1.pgdg110+1)
-- Dumped by pg_dump version 14.5 (Debian 14.5-1.pgdg110+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: keycloak
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO keycloak;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: keycloak
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

