--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: core; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA core;


--
-- Name: crz; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA crz;


--
-- Name: datahub; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA datahub;


--
-- Name: fs; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA fs;


--
-- Name: map_datahub_fs; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA map_datahub_fs;


--
-- Name: map_datahub_rpo; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA map_datahub_rpo;


--
-- Name: map_datahub_ruz; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA map_datahub_ruz;


--
-- Name: ov; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA ov;


--
-- Name: ra; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA ra;


--
-- Name: rpo; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA rpo;


--
-- Name: ruz; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA ruz;


--
-- Name: socpoist; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA socpoist;


--
-- Name: vvo; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA vvo;


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET search_path = ra, pg_catalog;

--
-- Name: change_type; Type: TYPE; Schema: ra; Owner: -
--

CREATE TYPE change_type AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE'
);


--
-- Name: created_reason_type; Type: TYPE; Schema: ra; Owner: -
--

CREATE TYPE created_reason_type AS ENUM (
    'IMPORT',
    'CREATE',
    'UPDATE',
    'CANCEL',
    'CORRECT',
    'REVERT'
);


--
-- Name: municipality_status; Type: TYPE; Schema: ra; Owner: -
--

CREATE TYPE municipality_status AS ENUM (
    'MUNICIPALITY',
    'CITY_DISTRICT',
    'CITY',
    'CITY_MANAGED_BY_SPECIAL_LAW',
    'MILITARY_DISTRICT'
);


SET search_path = core, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: apps; Type: TABLE; Schema: core; Owner: -
--

CREATE TABLE apps (
    id integer NOT NULL,
    name character varying NOT NULL,
    access_token character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: apps_id_seq; Type: SEQUENCE; Schema: core; Owner: -
--

CREATE SEQUENCE apps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: apps_id_seq; Type: SEQUENCE OWNED BY; Schema: core; Owner: -
--

ALTER SEQUENCE apps_id_seq OWNED BY apps.id;


SET search_path = crz, pg_catalog;

--
-- Name: attachments; Type: TABLE; Schema: crz; Owner: -
--

CREATE TABLE attachments (
    id integer NOT NULL,
    contract_id integer NOT NULL,
    title character varying,
    file_name character varying,
    file_size integer,
    changed_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    scan_file_name character varying,
    scan_file_size integer
);


--
-- Name: attachments_id_seq; Type: SEQUENCE; Schema: crz; Owner: -
--

CREATE SEQUENCE attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: crz; Owner: -
--

ALTER SEQUENCE attachments_id_seq OWNED BY attachments.id;


--
-- Name: contracts; Type: TABLE; Schema: crz; Owner: -
--

CREATE TABLE contracts (
    id integer NOT NULL,
    contract_identifier character varying,
    contracting_authority_name character varying,
    contracting_authority_formatted_address character varying,
    contracting_authority_cin character varying,
    supplier_name character varying,
    supplier_formatted_address character varying,
    supplier_cin character varying,
    subject character varying,
    subject_description character varying,
    signed_on date,
    effective_from date,
    effective_to date,
    effective_note character varying,
    contract_price_amount numeric NOT NULL,
    contract_price_total_amount numeric NOT NULL,
    note character varying,
    department_id integer NOT NULL,
    published_at timestamp without time zone NOT NULL,
    changed_at timestamp without time zone NOT NULL,
    change_note character varying,
    status_id integer NOT NULL,
    type_id integer NOT NULL,
    kind_id integer NOT NULL,
    internal_id integer NOT NULL,
    internal_note character varying,
    confirmation_status_id integer NOT NULL,
    confirmation_file_name character varying,
    confirmed_on date,
    source_id integer NOT NULL,
    description character varying,
    reference character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: contracts_id_seq; Type: SEQUENCE; Schema: crz; Owner: -
--

CREATE SEQUENCE contracts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contracts_id_seq; Type: SEQUENCE OWNED BY; Schema: crz; Owner: -
--

ALTER SEQUENCE contracts_id_seq OWNED BY contracts.id;


--
-- Name: departments; Type: TABLE; Schema: crz; Owner: -
--

CREATE TABLE departments (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: departments_id_seq; Type: SEQUENCE; Schema: crz; Owner: -
--

CREATE SEQUENCE departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: crz; Owner: -
--

ALTER SEQUENCE departments_id_seq OWNED BY departments.id;


SET search_path = datahub, pg_catalog;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: datahub; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: corporate_bodies; Type: TABLE; Schema: datahub; Owner: -
--

CREATE TABLE corporate_bodies (
    id integer NOT NULL,
    cin bigint NOT NULL,
    tin bigint,
    vatin character varying,
    name character varying NOT NULL,
    formatted_address character varying,
    street character varying,
    reg_number integer,
    building_number character varying,
    postal_code character varying,
    municipality character varying,
    country character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    established_on date,
    terminated_on date,
    vatin_paragraph character varying,
    registration_office character varying,
    registration_number character varying
);


--
-- Name: corporate_bodies_id_seq; Type: SEQUENCE; Schema: datahub; Owner: -
--

CREATE SEQUENCE corporate_bodies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: corporate_bodies_id_seq; Type: SEQUENCE OWNED BY; Schema: datahub; Owner: -
--

ALTER SEQUENCE corporate_bodies_id_seq OWNED BY corporate_bodies.id;


SET search_path = fs, pg_catalog;

--
-- Name: vat_subjects; Type: TABLE; Schema: fs; Owner: -
--

CREATE TABLE vat_subjects (
    id integer NOT NULL,
    vat_number character varying NOT NULL,
    name character varying NOT NULL,
    municipality character varying,
    postal_code character varying NOT NULL,
    address character varying,
    paragraph character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: financna_sprava_vat_subjects_id_seq; Type: SEQUENCE; Schema: fs; Owner: -
--

CREATE SEQUENCE financna_sprava_vat_subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: financna_sprava_vat_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: fs; Owner: -
--

ALTER SEQUENCE financna_sprava_vat_subjects_id_seq OWNED BY vat_subjects.id;


--
-- Name: vat_subject_entries; Type: TABLE; Schema: fs; Owner: -
--

CREATE TABLE vat_subject_entries (
    id integer NOT NULL,
    list_id integer NOT NULL,
    subject_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vat_subject_entries_id_seq; Type: SEQUENCE; Schema: fs; Owner: -
--

CREATE SEQUENCE vat_subject_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_subject_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: fs; Owner: -
--

ALTER SEQUENCE vat_subject_entries_id_seq OWNED BY vat_subject_entries.id;


--
-- Name: vat_subject_ranges; Type: TABLE; Schema: fs; Owner: -
--

CREATE TABLE vat_subject_ranges (
    id integer NOT NULL,
    subject_id integer NOT NULL,
    effective_from date NOT NULL,
    effective_to date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vat_subject_ranges_id_seq; Type: SEQUENCE; Schema: fs; Owner: -
--

CREATE SEQUENCE vat_subject_ranges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_subject_ranges_id_seq; Type: SEQUENCE OWNED BY; Schema: fs; Owner: -
--

ALTER SEQUENCE vat_subject_ranges_id_seq OWNED BY vat_subject_ranges.id;


--
-- Name: vat_subjects_lists; Type: TABLE; Schema: fs; Owner: -
--

CREATE TABLE vat_subjects_lists (
    id integer NOT NULL,
    date date NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vat_subjects_lists_id_seq; Type: SEQUENCE; Schema: fs; Owner: -
--

CREATE SEQUENCE vat_subjects_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_subjects_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: fs; Owner: -
--

ALTER SEQUENCE vat_subjects_lists_id_seq OWNED BY vat_subjects_lists.id;


SET search_path = map_datahub_fs, pg_catalog;

--
-- Name: vat_subject_mappings; Type: TABLE; Schema: map_datahub_fs; Owner: -
--

CREATE TABLE vat_subject_mappings (
    id integer NOT NULL,
    corporate_body_id integer,
    vat_subject_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vat_subject_mappings_id_seq; Type: SEQUENCE; Schema: map_datahub_fs; Owner: -
--

CREATE SEQUENCE vat_subject_mappings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_subject_mappings_id_seq; Type: SEQUENCE OWNED BY; Schema: map_datahub_fs; Owner: -
--

ALTER SEQUENCE vat_subject_mappings_id_seq OWNED BY vat_subject_mappings.id;


SET search_path = map_datahub_rpo, pg_catalog;

--
-- Name: corporate_body_mappings; Type: TABLE; Schema: map_datahub_rpo; Owner: -
--

CREATE TABLE corporate_body_mappings (
    id integer NOT NULL,
    corporate_body_id integer,
    organization_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    done boolean DEFAULT false NOT NULL
);


--
-- Name: corporate_body_mappings_id_seq; Type: SEQUENCE; Schema: map_datahub_rpo; Owner: -
--

CREATE SEQUENCE corporate_body_mappings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: corporate_body_mappings_id_seq; Type: SEQUENCE OWNED BY; Schema: map_datahub_rpo; Owner: -
--

ALTER SEQUENCE corporate_body_mappings_id_seq OWNED BY corporate_body_mappings.id;


SET search_path = map_datahub_ruz, pg_catalog;

--
-- Name: corporate_body_mappings; Type: TABLE; Schema: map_datahub_ruz; Owner: -
--

CREATE TABLE corporate_body_mappings (
    id integer NOT NULL,
    corporate_body_id integer,
    accounting_entity_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    done boolean DEFAULT false NOT NULL
);


--
-- Name: corporate_body_mappings_id_seq; Type: SEQUENCE; Schema: map_datahub_ruz; Owner: -
--

CREATE SEQUENCE corporate_body_mappings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: corporate_body_mappings_id_seq; Type: SEQUENCE OWNED BY; Schema: map_datahub_ruz; Owner: -
--

ALTER SEQUENCE corporate_body_mappings_id_seq OWNED BY corporate_body_mappings.id;


SET search_path = ov, pg_catalog;

--
-- Name: bulletin_issues; Type: TABLE; Schema: ov; Owner: -
--

CREATE TABLE bulletin_issues (
    id integer NOT NULL,
    year integer NOT NULL,
    number integer NOT NULL,
    published_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: bulletin_issues_id_seq; Type: SEQUENCE; Schema: ov; Owner: -
--

CREATE SEQUENCE bulletin_issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bulletin_issues_id_seq; Type: SEQUENCE OWNED BY; Schema: ov; Owner: -
--

ALTER SEQUENCE bulletin_issues_id_seq OWNED BY bulletin_issues.id;


--
-- Name: konkurz_restrukturalizacia_actors; Type: TABLE; Schema: ov; Owner: -
--

CREATE TABLE konkurz_restrukturalizacia_actors (
    id integer NOT NULL,
    corporate_body_name character varying,
    cin bigint,
    street character varying,
    building_number character varying,
    city character varying,
    postal_code character varying,
    country character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: konkurz_restrukturalizacia_actors_id_seq; Type: SEQUENCE; Schema: ov; Owner: -
--

CREATE SEQUENCE konkurz_restrukturalizacia_actors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: konkurz_restrukturalizacia_actors_id_seq; Type: SEQUENCE OWNED BY; Schema: ov; Owner: -
--

ALTER SEQUENCE konkurz_restrukturalizacia_actors_id_seq OWNED BY konkurz_restrukturalizacia_actors.id;


--
-- Name: konkurz_restrukturalizacia_issues; Type: TABLE; Schema: ov; Owner: -
--

CREATE TABLE konkurz_restrukturalizacia_issues (
    id integer NOT NULL,
    bulletin_issue_id integer NOT NULL,
    raw_issue_id integer NOT NULL,
    court_name character varying NOT NULL,
    file_reference character varying NOT NULL,
    ics character varying NOT NULL,
    released_by character varying NOT NULL,
    releaser_position character varying,
    sent_by character varying NOT NULL,
    released_date date NOT NULL,
    debtor_id integer,
    kind character varying NOT NULL,
    heading text,
    decision text,
    announcement text,
    advice text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: konkurz_restrukturalizacia_issues_id_seq; Type: SEQUENCE; Schema: ov; Owner: -
--

CREATE SEQUENCE konkurz_restrukturalizacia_issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: konkurz_restrukturalizacia_issues_id_seq; Type: SEQUENCE OWNED BY; Schema: ov; Owner: -
--

ALTER SEQUENCE konkurz_restrukturalizacia_issues_id_seq OWNED BY konkurz_restrukturalizacia_issues.id;


--
-- Name: konkurz_restrukturalizacia_proposings; Type: TABLE; Schema: ov; Owner: -
--

CREATE TABLE konkurz_restrukturalizacia_proposings (
    id integer NOT NULL,
    issue_id integer NOT NULL,
    actor_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: konkurz_restrukturalizacia_proposings_id_seq; Type: SEQUENCE; Schema: ov; Owner: -
--

CREATE SEQUENCE konkurz_restrukturalizacia_proposings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: konkurz_restrukturalizacia_proposings_id_seq; Type: SEQUENCE OWNED BY; Schema: ov; Owner: -
--

ALTER SEQUENCE konkurz_restrukturalizacia_proposings_id_seq OWNED BY konkurz_restrukturalizacia_proposings.id;


--
-- Name: konkurz_vyrovnanie_issues; Type: TABLE; Schema: ov; Owner: -
--

CREATE TABLE konkurz_vyrovnanie_issues (
    id integer NOT NULL,
    bulletin_issue_id integer NOT NULL,
    raw_issue_id integer NOT NULL,
    court_code character varying NOT NULL,
    court_name character varying NOT NULL,
    file_reference character varying NOT NULL,
    corporate_body_name character varying NOT NULL,
    cin integer,
    street character varying,
    building_number character varying,
    city character varying,
    postal_code character varying,
    country character varying,
    kind_code character varying NOT NULL,
    kind_name character varying NOT NULL,
    announcement text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: konkurz_vyrovnanie_issues_id_seq; Type: SEQUENCE; Schema: ov; Owner: -
--

CREATE SEQUENCE konkurz_vyrovnanie_issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: konkurz_vyrovnanie_issues_id_seq; Type: SEQUENCE OWNED BY; Schema: ov; Owner: -
--

ALTER SEQUENCE konkurz_vyrovnanie_issues_id_seq OWNED BY konkurz_vyrovnanie_issues.id;


--
-- Name: likvidator_issues; Type: TABLE; Schema: ov; Owner: -
--

CREATE TABLE likvidator_issues (
    id integer NOT NULL,
    bulletin_issue_id integer NOT NULL,
    raw_issue_id integer NOT NULL,
    legal_form_code character varying NOT NULL,
    legal_form_name character varying NOT NULL,
    corporate_body_name character varying NOT NULL,
    cin integer NOT NULL,
    sid character varying,
    street character varying NOT NULL,
    building_number character varying NOT NULL,
    city character varying NOT NULL,
    postal_code character varying NOT NULL,
    country character varying NOT NULL,
    in_business_register boolean DEFAULT false NOT NULL,
    br_insertion character varying,
    br_court_code character varying,
    br_court_name character varying,
    br_section character varying,
    other_registrar_name character varying,
    other_registration_number character varying,
    decision_based_on character varying NOT NULL,
    decision_date date NOT NULL,
    claim_term character varying NOT NULL,
    liquidation_start_date date NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    debtee_legal_form_code character varying,
    debtee_legal_form_name character varying
);


--
-- Name: likvidator_issues_id_seq; Type: SEQUENCE; Schema: ov; Owner: -
--

CREATE SEQUENCE likvidator_issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: likvidator_issues_id_seq; Type: SEQUENCE OWNED BY; Schema: ov; Owner: -
--

ALTER SEQUENCE likvidator_issues_id_seq OWNED BY likvidator_issues.id;


--
-- Name: or_podanie_issue_documents; Type: TABLE; Schema: ov; Owner: -
--

CREATE TABLE or_podanie_issue_documents (
    id integer NOT NULL,
    or_podanie_issue_id integer NOT NULL,
    name character varying NOT NULL,
    delivery_date date NOT NULL,
    ruz_deposit_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: or_podanie_issue_documents_id_seq; Type: SEQUENCE; Schema: ov; Owner: -
--

CREATE SEQUENCE or_podanie_issue_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: or_podanie_issue_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: ov; Owner: -
--

ALTER SEQUENCE or_podanie_issue_documents_id_seq OWNED BY or_podanie_issue_documents.id;


--
-- Name: or_podanie_issues; Type: TABLE; Schema: ov; Owner: -
--

CREATE TABLE or_podanie_issues (
    id integer NOT NULL,
    bulletin_issue_id integer NOT NULL,
    raw_issue_id integer NOT NULL,
    br_mark character varying NOT NULL,
    br_court_code character varying NOT NULL,
    br_court_name character varying NOT NULL,
    kind_code character varying NOT NULL,
    kind_name character varying NOT NULL,
    cin integer,
    registration_date date,
    corporate_body_name character varying,
    br_section character varying NOT NULL,
    br_insertion character varying NOT NULL,
    text text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    address_line character varying,
    street character varying,
    postal_code character varying,
    city character varying
);


--
-- Name: or_podanie_issues_id_seq; Type: SEQUENCE; Schema: ov; Owner: -
--

CREATE SEQUENCE or_podanie_issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: or_podanie_issues_id_seq; Type: SEQUENCE OWNED BY; Schema: ov; Owner: -
--

ALTER SEQUENCE or_podanie_issues_id_seq OWNED BY or_podanie_issues.id;


--
-- Name: raw_issues; Type: TABLE; Schema: ov; Owner: -
--

CREATE TABLE raw_issues (
    id integer NOT NULL,
    bulletin_issue_id integer NOT NULL,
    file_name character varying NOT NULL,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: raw_issues_id_seq; Type: SEQUENCE; Schema: ov; Owner: -
--

CREATE SEQUENCE raw_issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: raw_issues_id_seq; Type: SEQUENCE OWNED BY; Schema: ov; Owner: -
--

ALTER SEQUENCE raw_issues_id_seq OWNED BY raw_issues.id;


--
-- Name: znizenie_imania_ceos; Type: TABLE; Schema: ov; Owner: -
--

CREATE TABLE znizenie_imania_ceos (
    id integer NOT NULL,
    znizenie_imania_issue_id integer NOT NULL,
    prefixes character varying,
    postfixes character varying,
    given_name character varying,
    family_name character varying,
    street character varying,
    building_number character varying,
    postal_code character varying,
    city character varying,
    country character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: znizenie_imania_ceos_id_seq; Type: SEQUENCE; Schema: ov; Owner: -
--

CREATE SEQUENCE znizenie_imania_ceos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: znizenie_imania_ceos_id_seq; Type: SEQUENCE OWNED BY; Schema: ov; Owner: -
--

ALTER SEQUENCE znizenie_imania_ceos_id_seq OWNED BY znizenie_imania_ceos.id;


--
-- Name: znizenie_imania_issues; Type: TABLE; Schema: ov; Owner: -
--

CREATE TABLE znizenie_imania_issues (
    id integer NOT NULL,
    bulletin_issue_id integer NOT NULL,
    raw_issue_id integer NOT NULL,
    corporate_body_name character varying NOT NULL,
    street character varying,
    building_number character varying,
    postal_code character varying,
    city character varying,
    country character varying,
    br_court_code character varying NOT NULL,
    br_court_name character varying NOT NULL,
    br_section character varying NOT NULL,
    br_insertion character varying NOT NULL,
    cin integer NOT NULL,
    decision_text text,
    decision_date date,
    equity_currency_code character varying NOT NULL,
    old_equity_value numeric(12,2) NOT NULL,
    new_equity_value numeric(12,2) NOT NULL,
    resolution_store_date date,
    first_ov_released_date date,
    first_ov_released_number character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: znizenie_imania_issues_id_seq; Type: SEQUENCE; Schema: ov; Owner: -
--

CREATE SEQUENCE znizenie_imania_issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: znizenie_imania_issues_id_seq; Type: SEQUENCE OWNED BY; Schema: ov; Owner: -
--

ALTER SEQUENCE znizenie_imania_issues_id_seq OWNED BY znizenie_imania_issues.id;


SET search_path = public, pg_catalog;

--
-- Name: building_number_changes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE building_number_changes (
    id integer NOT NULL,
    property_registration_number_id integer NOT NULL,
    street_name_id integer,
    changed_at timestamp without time zone NOT NULL,
    database_operation ra.change_type,
    building_number_id integer NOT NULL,
    version_id integer NOT NULL,
    created_reason ra.created_reason_type,
    valid_from timestamp without time zone,
    valid_to timestamp without time zone,
    effective_on date NOT NULL,
    verified_at timestamp without time zone,
    building_number character varying,
    building_index character varying NOT NULL,
    postal_code integer,
    address_point geography(Point,4326),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


SET search_path = ra, pg_catalog;

--
-- Name: building_number_changes; Type: TABLE; Schema: ra; Owner: -
--

CREATE TABLE building_number_changes (
    id integer NOT NULL,
    property_registration_number_id integer NOT NULL,
    street_name_id integer,
    changed_at timestamp without time zone NOT NULL,
    database_operation change_type,
    building_number_id integer NOT NULL,
    version_id integer NOT NULL,
    created_reason created_reason_type,
    valid_from timestamp without time zone,
    valid_to timestamp without time zone,
    effective_on date NOT NULL,
    verified_at timestamp without time zone,
    building_number character varying,
    building_index character varying NOT NULL,
    postal_code integer,
    address_point public.geography(Point,4326),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: building_number_changes_id_seq; Type: SEQUENCE; Schema: ra; Owner: -
--

CREATE SEQUENCE building_number_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: building_purposes; Type: TABLE; Schema: ra; Owner: -
--

CREATE TABLE building_purposes (
    id integer NOT NULL,
    code character varying NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: building_purposes_id_seq; Type: SEQUENCE; Schema: ra; Owner: -
--

CREATE SEQUENCE building_purposes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: building_purposes_id_seq; Type: SEQUENCE OWNED BY; Schema: ra; Owner: -
--

ALTER SEQUENCE building_purposes_id_seq OWNED BY building_purposes.id;


--
-- Name: building_types; Type: TABLE; Schema: ra; Owner: -
--

CREATE TABLE building_types (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: building_types_id_seq; Type: SEQUENCE; Schema: ra; Owner: -
--

CREATE SEQUENCE building_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: building_types_id_seq; Type: SEQUENCE OWNED BY; Schema: ra; Owner: -
--

ALTER SEQUENCE building_types_id_seq OWNED BY building_types.id;


--
-- Name: building_unit_changes; Type: TABLE; Schema: ra; Owner: -
--

CREATE TABLE building_unit_changes (
    id integer NOT NULL,
    building_unit_id integer NOT NULL,
    building_number_id integer NOT NULL,
    changed_at timestamp without time zone NOT NULL,
    database_operation change_type,
    version_id integer NOT NULL,
    created_reason created_reason_type,
    valid_from timestamp without time zone NOT NULL,
    valid_to timestamp without time zone NOT NULL,
    effective_on date NOT NULL,
    building_unit_floor character varying NOT NULL,
    building_unit_number character varying NOT NULL,
    building_unit_label character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: building_unit_changes_id_seq; Type: SEQUENCE; Schema: ra; Owner: -
--

CREATE SEQUENCE building_unit_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: building_unit_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: ra; Owner: -
--

ALTER SEQUENCE building_unit_changes_id_seq OWNED BY building_unit_changes.id;


--
-- Name: changes_batches; Type: TABLE; Schema: ra; Owner: -
--

CREATE TABLE changes_batches (
    id integer NOT NULL,
    generated_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: changes_batches_id_seq; Type: SEQUENCE; Schema: ra; Owner: -
--

CREATE SEQUENCE changes_batches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: changes_batches_id_seq; Type: SEQUENCE OWNED BY; Schema: ra; Owner: -
--

ALTER SEQUENCE changes_batches_id_seq OWNED BY changes_batches.id;


--
-- Name: county_changes; Type: TABLE; Schema: ra; Owner: -
--

CREATE TABLE county_changes (
    id integer NOT NULL,
    county_id integer NOT NULL,
    region_id integer NOT NULL,
    database_operation change_type,
    version_id integer NOT NULL,
    created_reason created_reason_type,
    changed_at timestamp without time zone,
    valid_from timestamp without time zone,
    valid_to timestamp without time zone,
    effective_on date NOT NULL,
    county_code_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: county_changes_id_seq; Type: SEQUENCE; Schema: ra; Owner: -
--

CREATE SEQUENCE county_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: county_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: ra; Owner: -
--

ALTER SEQUENCE county_changes_id_seq OWNED BY county_changes.id;


--
-- Name: county_codes; Type: TABLE; Schema: ra; Owner: -
--

CREATE TABLE county_codes (
    id integer NOT NULL,
    code character varying,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: county_codes_id_seq; Type: SEQUENCE; Schema: ra; Owner: -
--

CREATE SEQUENCE county_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: county_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: ra; Owner: -
--

ALTER SEQUENCE county_codes_id_seq OWNED BY county_codes.id;


--
-- Name: district_changes; Type: TABLE; Schema: ra; Owner: -
--

CREATE TABLE district_changes (
    id integer NOT NULL,
    district_id integer NOT NULL,
    municipality_id integer NOT NULL,
    database_operation change_type,
    version_id integer NOT NULL,
    created_reason created_reason_type,
    changed_at timestamp without time zone,
    valid_from timestamp without time zone,
    valid_to timestamp without time zone,
    effective_on date,
    district_code_id integer NOT NULL,
    unique_numbering boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: district_changes_id_seq; Type: SEQUENCE; Schema: ra; Owner: -
--

CREATE SEQUENCE district_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: district_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: ra; Owner: -
--

ALTER SEQUENCE district_changes_id_seq OWNED BY district_changes.id;


--
-- Name: district_codes; Type: TABLE; Schema: ra; Owner: -
--

CREATE TABLE district_codes (
    id integer NOT NULL,
    code character varying,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: district_codes_id_seq; Type: SEQUENCE; Schema: ra; Owner: -
--

CREATE SEQUENCE district_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: district_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: ra; Owner: -
--

ALTER SEQUENCE district_codes_id_seq OWNED BY district_codes.id;


--
-- Name: municipality_changes; Type: TABLE; Schema: ra; Owner: -
--

CREATE TABLE municipality_changes (
    id integer NOT NULL,
    municipality_id integer NOT NULL,
    county_id integer NOT NULL,
    database_operation change_type,
    version_id integer NOT NULL,
    created_reason created_reason_type,
    changed_at timestamp without time zone,
    valid_from timestamp without time zone,
    valid_to timestamp without time zone,
    municipality_code_id integer NOT NULL,
    municipality_status municipality_status,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: municipality_changes_id_seq; Type: SEQUENCE; Schema: ra; Owner: -
--

CREATE SEQUENCE municipality_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: municipality_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: ra; Owner: -
--

ALTER SEQUENCE municipality_changes_id_seq OWNED BY municipality_changes.id;


--
-- Name: municipality_codes; Type: TABLE; Schema: ra; Owner: -
--

CREATE TABLE municipality_codes (
    id integer NOT NULL,
    code character varying,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: municipality_codes_id_seq; Type: SEQUENCE; Schema: ra; Owner: -
--

CREATE SEQUENCE municipality_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: municipality_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: ra; Owner: -
--

ALTER SEQUENCE municipality_codes_id_seq OWNED BY municipality_codes.id;


--
-- Name: property_registration_number_changes; Type: TABLE; Schema: ra; Owner: -
--

CREATE TABLE property_registration_number_changes (
    id integer NOT NULL,
    changed_at timestamp without time zone,
    database_operation change_type,
    property_registration_number_id integer NOT NULL,
    version_id integer NOT NULL,
    created_reason created_reason_type,
    valid_from timestamp without time zone,
    valid_to timestamp without time zone,
    effective_on date,
    property_registration_number integer,
    building_contains_flats boolean NOT NULL,
    building_purpose_id integer,
    building_type_id integer,
    municipality_id integer NOT NULL,
    district_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: property_registration_number_changes_id_seq; Type: SEQUENCE; Schema: ra; Owner: -
--

CREATE SEQUENCE property_registration_number_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: property_registration_number_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: ra; Owner: -
--

ALTER SEQUENCE property_registration_number_changes_id_seq OWNED BY property_registration_number_changes.id;


--
-- Name: region_changes; Type: TABLE; Schema: ra; Owner: -
--

CREATE TABLE region_changes (
    id integer NOT NULL,
    region_id integer NOT NULL,
    database_operation change_type,
    version_id integer NOT NULL,
    created_reason created_reason_type,
    changed_at timestamp without time zone,
    valid_from timestamp without time zone,
    valid_to timestamp without time zone,
    effective_on date NOT NULL,
    region_code_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: region_changes_id_seq; Type: SEQUENCE; Schema: ra; Owner: -
--

CREATE SEQUENCE region_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: region_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: ra; Owner: -
--

ALTER SEQUENCE region_changes_id_seq OWNED BY region_changes.id;


--
-- Name: region_codes; Type: TABLE; Schema: ra; Owner: -
--

CREATE TABLE region_codes (
    id integer NOT NULL,
    code character varying,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: region_codes_id_seq; Type: SEQUENCE; Schema: ra; Owner: -
--

CREATE SEQUENCE region_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: region_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: ra; Owner: -
--

ALTER SEQUENCE region_codes_id_seq OWNED BY region_codes.id;


--
-- Name: street_name_changes; Type: TABLE; Schema: ra; Owner: -
--

CREATE TABLE street_name_changes (
    id integer NOT NULL,
    street_name_id integer NOT NULL,
    municipality_id integer NOT NULL,
    district_id integer,
    changed_at timestamp without time zone NOT NULL,
    database_operation change_type,
    version_id integer NOT NULL,
    created_reason created_reason_type,
    valid_from timestamp without time zone NOT NULL,
    valid_to timestamp without time zone NOT NULL,
    effective_on date NOT NULL,
    street_name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: street_name_changes_id_seq; Type: SEQUENCE; Schema: ra; Owner: -
--

CREATE SEQUENCE street_name_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: street_name_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: ra; Owner: -
--

ALTER SEQUENCE street_name_changes_id_seq OWNED BY street_name_changes.id;


SET search_path = rpo, pg_catalog;

--
-- Name: esa2010_codes; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE esa2010_codes (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: esu2010_codes_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE esu2010_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: esu2010_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE esu2010_codes_id_seq OWNED BY esa2010_codes.id;


--
-- Name: legal_forms; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE legal_forms (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: legal_forms_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE legal_forms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: legal_forms_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE legal_forms_id_seq OWNED BY legal_forms.id;


--
-- Name: main_activity_codes; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE main_activity_codes (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: main_activity_codes_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE main_activity_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: main_activity_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE main_activity_codes_id_seq OWNED BY main_activity_codes.id;


--
-- Name: organization_address_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE organization_address_entries (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    formatted_address character varying,
    street character varying,
    reg_number integer,
    building_number character varying,
    postal_code character varying,
    municipality character varying,
    country character varying,
    effective_from date NOT NULL,
    effective_to date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: organization_address_entries_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE organization_address_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_address_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE organization_address_entries_id_seq OWNED BY organization_address_entries.id;


--
-- Name: organization_alternate_name_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE organization_alternate_name_entries (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    name character varying NOT NULL,
    effective_from date NOT NULL,
    effective_to date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: organization_alternate_name_entries_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE organization_alternate_name_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_alternate_name_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE organization_alternate_name_entries_id_seq OWNED BY organization_alternate_name_entries.id;


--
-- Name: organization_authorization_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE organization_authorization_entries (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    body character varying NOT NULL,
    effective_from date NOT NULL,
    effective_to date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: organization_authorization_entries_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE organization_authorization_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_authorization_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE organization_authorization_entries_id_seq OWNED BY organization_authorization_entries.id;


--
-- Name: organization_deposit_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE organization_deposit_entries (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    full_name character varying,
    person_formatted_name character varying,
    person_given_name character varying,
    person_family_name character varying,
    person_given_family_name character varying,
    person_prefixes character varying,
    person_postfixes character varying,
    deposit_amount numeric NOT NULL,
    deposit_currency character varying NOT NULL,
    deposit_type character varying,
    effective_from date NOT NULL,
    effective_to date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: organization_deposit_entries_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE organization_deposit_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_deposit_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE organization_deposit_entries_id_seq OWNED BY organization_deposit_entries.id;


--
-- Name: organization_economic_activity_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE organization_economic_activity_entries (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    description character varying NOT NULL,
    effective_from date NOT NULL,
    effective_to date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    suspended_from date,
    suspended_to date
);


--
-- Name: organization_economic_activity_entries_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE organization_economic_activity_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_economic_activity_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE organization_economic_activity_entries_id_seq OWNED BY organization_economic_activity_entries.id;


--
-- Name: organization_equity_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE organization_equity_entries (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    investment_amount numeric(14,2),
    investment_currency character varying NOT NULL,
    paid_amount numeric(14,2),
    paid_currency character varying NOT NULL,
    approved_amount numeric(14,2),
    approved_currency character varying NOT NULL,
    effective_from date NOT NULL,
    effective_to date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: organization_equity_entries_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE organization_equity_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_equity_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE organization_equity_entries_id_seq OWNED BY organization_equity_entries.id;


--
-- Name: organization_identifier_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE organization_identifier_entries (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    ipo integer,
    effective_from date NOT NULL,
    effective_to date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: organization_identifier_entries_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE organization_identifier_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_identifier_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE organization_identifier_entries_id_seq OWNED BY organization_identifier_entries.id;


--
-- Name: organization_legal_form_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE organization_legal_form_entries (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    legal_form_id integer,
    effective_from date NOT NULL,
    effective_to date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: organization_legal_form_entries_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE organization_legal_form_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_legal_form_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE organization_legal_form_entries_id_seq OWNED BY organization_legal_form_entries.id;


--
-- Name: organization_legal_status_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE organization_legal_status_entries (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    body character varying NOT NULL,
    effective_from date NOT NULL,
    effective_to date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: organization_legal_status_entries_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE organization_legal_status_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_legal_status_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE organization_legal_status_entries_id_seq OWNED BY organization_legal_status_entries.id;


--
-- Name: organization_name_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE organization_name_entries (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    name character varying NOT NULL,
    effective_from date NOT NULL,
    effective_to date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: organization_name_entries_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE organization_name_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_name_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE organization_name_entries_id_seq OWNED BY organization_name_entries.id;


--
-- Name: organization_other_legal_fact_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE organization_other_legal_fact_entries (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    body character varying NOT NULL,
    effective_from date NOT NULL,
    effective_to date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: organization_other_legal_fact_entries_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE organization_other_legal_fact_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_other_legal_fact_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE organization_other_legal_fact_entries_id_seq OWNED BY organization_other_legal_fact_entries.id;


--
-- Name: organization_predecessor_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE organization_predecessor_entries (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    ico integer,
    full_name character varying NOT NULL,
    address_formatted character varying,
    address_street character varying,
    address_reg_number integer,
    address_building_number character varying,
    address_postal_code character varying,
    address_municipality character varying,
    address_country character varying,
    established_on date NOT NULL,
    terminated_on date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: organization_predecessor_entries_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE organization_predecessor_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_predecessor_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE organization_predecessor_entries_id_seq OWNED BY organization_predecessor_entries.id;


--
-- Name: organization_share_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE organization_share_entries (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    share_type_id integer NOT NULL,
    share_form_id integer,
    share_price numeric NOT NULL,
    share_currency character varying NOT NULL,
    share_amount bigint NOT NULL,
    share_transfer character varying,
    effective_from date NOT NULL,
    effective_to date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: organization_share_entries_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE organization_share_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_share_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE organization_share_entries_id_seq OWNED BY organization_share_entries.id;


--
-- Name: organization_stakeholder_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE organization_stakeholder_entries (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    stakeholder_type_id integer,
    full_name character varying,
    person_formatted_name character varying,
    person_given_name character varying,
    person_family_name character varying,
    person_given_family_name character varying,
    person_prefixes character varying,
    person_postfixes character varying,
    address_formatted character varying,
    address_street character varying,
    address_reg_number integer,
    address_building_number character varying,
    address_postal_code character varying,
    address_municipality character varying,
    address_country character varying,
    address_effective_from date,
    address_effective_to date,
    effective_from date NOT NULL,
    effective_to date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    stakeholder_organization_id integer,
    ico integer
);


--
-- Name: organization_stakeholder_entries_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE organization_stakeholder_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_stakeholder_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE organization_stakeholder_entries_id_seq OWNED BY organization_stakeholder_entries.id;


--
-- Name: organization_statutory_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE organization_statutory_entries (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    stakeholder_type_id integer,
    full_name character varying,
    person_formatted_name character varying,
    person_given_name character varying,
    person_family_name character varying,
    person_given_family_name character varying,
    person_prefixes character varying,
    person_postfixes character varying,
    address_formatted character varying,
    address_street character varying,
    address_reg_number integer,
    address_building_number character varying,
    address_postal_code character varying,
    address_municipality character varying,
    address_country character varying,
    effective_from date NOT NULL,
    effective_to date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    ico integer
);


--
-- Name: organization_statutory_entries_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE organization_statutory_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_statutory_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE organization_statutory_entries_id_seq OWNED BY organization_statutory_entries.id;


--
-- Name: organization_successor_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE organization_successor_entries (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    ico integer,
    full_name character varying NOT NULL,
    address_formatted character varying,
    address_street character varying,
    address_reg_number integer,
    address_building_number character varying,
    address_postal_code character varying,
    address_municipality character varying,
    address_country character varying,
    established_on date NOT NULL,
    terminated_on date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: organization_successor_entries_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE organization_successor_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_successor_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE organization_successor_entries_id_seq OWNED BY organization_successor_entries.id;


--
-- Name: organizations; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE organizations (
    id integer NOT NULL,
    established_on date NOT NULL,
    terminated_on date,
    actualized_at timestamp without time zone,
    has_organization_unit boolean NOT NULL,
    has_operations boolean NOT NULL,
    statistical_codes_actualized_on date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    main_activity_code_id integer,
    esa2010_code_id integer,
    source_register character varying,
    registration_office character varying,
    registration_number character varying,
    main_organization_id integer,
    deleted_at timestamp without time zone
);


--
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE organizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE organizations_id_seq OWNED BY organizations.id;


--
-- Name: share_forms; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE share_forms (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- Name: share_forms_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE share_forms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: share_forms_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE share_forms_id_seq OWNED BY share_forms.id;


--
-- Name: share_types; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE share_types (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- Name: share_types_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE share_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: share_types_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE share_types_id_seq OWNED BY share_types.id;


--
-- Name: stakeholder_types; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE stakeholder_types (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: stakeholder_types_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE stakeholder_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stakeholder_types_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE stakeholder_types_id_seq OWNED BY stakeholder_types.id;


SET search_path = ruz, pg_catalog;

--
-- Name: accounting_entities; Type: TABLE; Schema: ruz; Owner: -
--

CREATE TABLE accounting_entities (
    id integer NOT NULL,
    cin integer,
    tin bigint,
    corporate_body_name character varying,
    city character varying,
    street character varying,
    postal_code character varying,
    region_id integer,
    district_id integer,
    municipality_id integer,
    last_updated_on date,
    established_on date,
    legal_form_id integer,
    sk_nace_category_id integer,
    organization_size_id integer,
    ownership_type_id integer,
    consolidated boolean,
    data_source character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    terminated_on date,
    sid character varying
);


--
-- Name: districts; Type: TABLE; Schema: ruz; Owner: -
--

CREATE TABLE districts (
    id integer NOT NULL,
    region_id integer NOT NULL,
    name_sk character varying NOT NULL,
    name_en character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: legal_forms; Type: TABLE; Schema: ruz; Owner: -
--

CREATE TABLE legal_forms (
    id integer NOT NULL,
    name_sk character varying NOT NULL,
    name_en character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: municipalities; Type: TABLE; Schema: ruz; Owner: -
--

CREATE TABLE municipalities (
    id integer NOT NULL,
    parent_id integer,
    name_sk character varying NOT NULL,
    name_en character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: organization_sizes; Type: TABLE; Schema: ruz; Owner: -
--

CREATE TABLE organization_sizes (
    id integer NOT NULL,
    name_sk character varying NOT NULL,
    name_en character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: ownership_types; Type: TABLE; Schema: ruz; Owner: -
--

CREATE TABLE ownership_types (
    id integer NOT NULL,
    name_sk character varying NOT NULL,
    name_en character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: regions; Type: TABLE; Schema: ruz; Owner: -
--

CREATE TABLE regions (
    id integer NOT NULL,
    name_sk character varying NOT NULL,
    name_en character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: ruz_accounting_entities_id_seq; Type: SEQUENCE; Schema: ruz; Owner: -
--

CREATE SEQUENCE ruz_accounting_entities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ruz_accounting_entities_id_seq; Type: SEQUENCE OWNED BY; Schema: ruz; Owner: -
--

ALTER SEQUENCE ruz_accounting_entities_id_seq OWNED BY accounting_entities.id;


--
-- Name: ruz_districts_id_seq; Type: SEQUENCE; Schema: ruz; Owner: -
--

CREATE SEQUENCE ruz_districts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ruz_districts_id_seq; Type: SEQUENCE OWNED BY; Schema: ruz; Owner: -
--

ALTER SEQUENCE ruz_districts_id_seq OWNED BY districts.id;


--
-- Name: ruz_legal_forms_id_seq; Type: SEQUENCE; Schema: ruz; Owner: -
--

CREATE SEQUENCE ruz_legal_forms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ruz_legal_forms_id_seq; Type: SEQUENCE OWNED BY; Schema: ruz; Owner: -
--

ALTER SEQUENCE ruz_legal_forms_id_seq OWNED BY legal_forms.id;


--
-- Name: ruz_municipalities_id_seq; Type: SEQUENCE; Schema: ruz; Owner: -
--

CREATE SEQUENCE ruz_municipalities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ruz_municipalities_id_seq; Type: SEQUENCE OWNED BY; Schema: ruz; Owner: -
--

ALTER SEQUENCE ruz_municipalities_id_seq OWNED BY municipalities.id;


--
-- Name: ruz_organization_sizes_id_seq; Type: SEQUENCE; Schema: ruz; Owner: -
--

CREATE SEQUENCE ruz_organization_sizes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ruz_organization_sizes_id_seq; Type: SEQUENCE OWNED BY; Schema: ruz; Owner: -
--

ALTER SEQUENCE ruz_organization_sizes_id_seq OWNED BY organization_sizes.id;


--
-- Name: ruz_ownership_types_id_seq; Type: SEQUENCE; Schema: ruz; Owner: -
--

CREATE SEQUENCE ruz_ownership_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ruz_ownership_types_id_seq; Type: SEQUENCE OWNED BY; Schema: ruz; Owner: -
--

ALTER SEQUENCE ruz_ownership_types_id_seq OWNED BY ownership_types.id;


--
-- Name: ruz_regions_id_seq; Type: SEQUENCE; Schema: ruz; Owner: -
--

CREATE SEQUENCE ruz_regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ruz_regions_id_seq; Type: SEQUENCE OWNED BY; Schema: ruz; Owner: -
--

ALTER SEQUENCE ruz_regions_id_seq OWNED BY regions.id;


--
-- Name: sk_nace_categories; Type: TABLE; Schema: ruz; Owner: -
--

CREATE TABLE sk_nace_categories (
    id integer NOT NULL,
    name_sk character varying NOT NULL,
    name_en character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: ruz_sk_nace_categories_id_seq; Type: SEQUENCE; Schema: ruz; Owner: -
--

CREATE SEQUENCE ruz_sk_nace_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ruz_sk_nace_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: ruz; Owner: -
--

ALTER SEQUENCE ruz_sk_nace_categories_id_seq OWNED BY sk_nace_categories.id;


SET search_path = socpoist, pg_catalog;

--
-- Name: debt_entries; Type: TABLE; Schema: socpoist; Owner: -
--

CREATE TABLE debt_entries (
    id integer NOT NULL,
    debtor_id integer NOT NULL,
    list_id integer NOT NULL,
    amount numeric NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: debt_entries_id_seq; Type: SEQUENCE; Schema: socpoist; Owner: -
--

CREATE SEQUENCE debt_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: debt_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: socpoist; Owner: -
--

ALTER SEQUENCE debt_entries_id_seq OWNED BY debt_entries.id;


--
-- Name: debt_ranges; Type: TABLE; Schema: socpoist; Owner: -
--

CREATE TABLE debt_ranges (
    id integer NOT NULL,
    debtor_id integer,
    effective_from date NOT NULL,
    effective_to date,
    amount numeric NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: debt_ranges_id_seq; Type: SEQUENCE; Schema: socpoist; Owner: -
--

CREATE SEQUENCE debt_ranges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: debt_ranges_id_seq; Type: SEQUENCE OWNED BY; Schema: socpoist; Owner: -
--

ALTER SEQUENCE debt_ranges_id_seq OWNED BY debt_ranges.id;


--
-- Name: debtors; Type: TABLE; Schema: socpoist; Owner: -
--

CREATE TABLE debtors (
    id integer NOT NULL,
    name character varying NOT NULL,
    address character varying,
    city character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: debtors_id_seq; Type: SEQUENCE; Schema: socpoist; Owner: -
--

CREATE SEQUENCE debtors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: debtors_id_seq; Type: SEQUENCE OWNED BY; Schema: socpoist; Owner: -
--

ALTER SEQUENCE debtors_id_seq OWNED BY debtors.id;


--
-- Name: debts_lists; Type: TABLE; Schema: socpoist; Owner: -
--

CREATE TABLE debts_lists (
    id integer NOT NULL,
    published_on date NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: debts_lists_id_seq; Type: SEQUENCE; Schema: socpoist; Owner: -
--

CREATE SEQUENCE debts_lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: debts_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: socpoist; Owner: -
--

ALTER SEQUENCE debts_lists_id_seq OWNED BY debts_lists.id;


SET search_path = vvo, pg_catalog;

--
-- Name: notice_types; Type: TABLE; Schema: vvo; Owner: -
--

CREATE TABLE notice_types (
    id integer NOT NULL,
    code character varying NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: announcement_types_id_seq; Type: SEQUENCE; Schema: vvo; Owner: -
--

CREATE SEQUENCE announcement_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: announcement_types_id_seq; Type: SEQUENCE OWNED BY; Schema: vvo; Owner: -
--

ALTER SEQUENCE announcement_types_id_seq OWNED BY notice_types.id;


--
-- Name: bulletin_issues; Type: TABLE; Schema: vvo; Owner: -
--

CREATE TABLE bulletin_issues (
    id integer NOT NULL,
    year integer NOT NULL,
    number integer NOT NULL,
    published_on date NOT NULL,
    source_url character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: bulletins_id_seq; Type: SEQUENCE; Schema: vvo; Owner: -
--

CREATE SEQUENCE bulletins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bulletins_id_seq; Type: SEQUENCE OWNED BY; Schema: vvo; Owner: -
--

ALTER SEQUENCE bulletins_id_seq OWNED BY bulletin_issues.id;


--
-- Name: contracting_authorities; Type: TABLE; Schema: vvo; Owner: -
--

CREATE TABLE contracting_authorities (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: contracting_authorities_id_seq; Type: SEQUENCE; Schema: vvo; Owner: -
--

CREATE SEQUENCE contracting_authorities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contracting_authorities_id_seq; Type: SEQUENCE OWNED BY; Schema: vvo; Owner: -
--

ALTER SEQUENCE contracting_authorities_id_seq OWNED BY contracting_authorities.id;


--
-- Name: contracts; Type: TABLE; Schema: vvo; Owner: -
--

CREATE TABLE contracts (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: contracts_id_seq; Type: SEQUENCE; Schema: vvo; Owner: -
--

CREATE SEQUENCE contracts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contracts_id_seq; Type: SEQUENCE OWNED BY; Schema: vvo; Owner: -
--

ALTER SEQUENCE contracts_id_seq OWNED BY contracts.id;


--
-- Name: notice_suppliers; Type: TABLE; Schema: vvo; Owner: -
--

CREATE TABLE notice_suppliers (
    id integer NOT NULL,
    notice_id integer NOT NULL,
    name character varying NOT NULL,
    cin integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: notice_suppliers_id_seq; Type: SEQUENCE; Schema: vvo; Owner: -
--

CREATE SEQUENCE notice_suppliers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notice_suppliers_id_seq; Type: SEQUENCE OWNED BY; Schema: vvo; Owner: -
--

ALTER SEQUENCE notice_suppliers_id_seq OWNED BY notice_suppliers.id;


--
-- Name: notices; Type: TABLE; Schema: vvo; Owner: -
--

CREATE TABLE notices (
    id integer NOT NULL,
    title character varying NOT NULL,
    contracting_authority_name character varying NOT NULL,
    contracting_authority_cin integer NOT NULL,
    estimated_value_amount numeric,
    estimated_value_currency character varying,
    contracting_authority_id integer NOT NULL,
    procedure_type_id integer,
    contract_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    e_auction boolean,
    raw_notice_id integer NOT NULL,
    bulletin_issue_id integer NOT NULL,
    notice_type_id integer NOT NULL
);


--
-- Name: notices_id_seq; Type: SEQUENCE; Schema: vvo; Owner: -
--

CREATE SEQUENCE notices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notices_id_seq; Type: SEQUENCE OWNED BY; Schema: vvo; Owner: -
--

ALTER SEQUENCE notices_id_seq OWNED BY notices.id;


--
-- Name: procedure_types; Type: TABLE; Schema: vvo; Owner: -
--

CREATE TABLE procedure_types (
    id integer NOT NULL,
    title character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    code integer NOT NULL,
    category character varying NOT NULL
);


--
-- Name: procedure_types_id_seq; Type: SEQUENCE; Schema: vvo; Owner: -
--

CREATE SEQUENCE procedure_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: procedure_types_id_seq; Type: SEQUENCE OWNED BY; Schema: vvo; Owner: -
--

ALTER SEQUENCE procedure_types_id_seq OWNED BY procedure_types.id;


--
-- Name: raw_notices; Type: TABLE; Schema: vvo; Owner: -
--

CREATE TABLE raw_notices (
    id integer NOT NULL,
    bulletin_issue_id integer NOT NULL,
    number integer NOT NULL,
    notice_type_id integer,
    body xml NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: raw_notices_id_seq; Type: SEQUENCE; Schema: vvo; Owner: -
--

CREATE SEQUENCE raw_notices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: raw_notices_id_seq; Type: SEQUENCE OWNED BY; Schema: vvo; Owner: -
--

ALTER SEQUENCE raw_notices_id_seq OWNED BY raw_notices.id;


SET search_path = core, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: core; Owner: -
--

ALTER TABLE ONLY apps ALTER COLUMN id SET DEFAULT nextval('apps_id_seq'::regclass);


SET search_path = crz, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: crz; Owner: -
--

ALTER TABLE ONLY attachments ALTER COLUMN id SET DEFAULT nextval('attachments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: crz; Owner: -
--

ALTER TABLE ONLY contracts ALTER COLUMN id SET DEFAULT nextval('contracts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: crz; Owner: -
--

ALTER TABLE ONLY departments ALTER COLUMN id SET DEFAULT nextval('departments_id_seq'::regclass);


SET search_path = datahub, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: datahub; Owner: -
--

ALTER TABLE ONLY corporate_bodies ALTER COLUMN id SET DEFAULT nextval('corporate_bodies_id_seq'::regclass);


SET search_path = fs, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: fs; Owner: -
--

ALTER TABLE ONLY vat_subject_entries ALTER COLUMN id SET DEFAULT nextval('vat_subject_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: fs; Owner: -
--

ALTER TABLE ONLY vat_subject_ranges ALTER COLUMN id SET DEFAULT nextval('vat_subject_ranges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: fs; Owner: -
--

ALTER TABLE ONLY vat_subjects ALTER COLUMN id SET DEFAULT nextval('financna_sprava_vat_subjects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: fs; Owner: -
--

ALTER TABLE ONLY vat_subjects_lists ALTER COLUMN id SET DEFAULT nextval('vat_subjects_lists_id_seq'::regclass);


SET search_path = map_datahub_fs, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: map_datahub_fs; Owner: -
--

ALTER TABLE ONLY vat_subject_mappings ALTER COLUMN id SET DEFAULT nextval('vat_subject_mappings_id_seq'::regclass);


SET search_path = map_datahub_rpo, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: map_datahub_rpo; Owner: -
--

ALTER TABLE ONLY corporate_body_mappings ALTER COLUMN id SET DEFAULT nextval('corporate_body_mappings_id_seq'::regclass);


SET search_path = map_datahub_ruz, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: map_datahub_ruz; Owner: -
--

ALTER TABLE ONLY corporate_body_mappings ALTER COLUMN id SET DEFAULT nextval('corporate_body_mappings_id_seq'::regclass);


SET search_path = ov, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: ov; Owner: -
--

ALTER TABLE ONLY bulletin_issues ALTER COLUMN id SET DEFAULT nextval('bulletin_issues_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ov; Owner: -
--

ALTER TABLE ONLY konkurz_restrukturalizacia_actors ALTER COLUMN id SET DEFAULT nextval('konkurz_restrukturalizacia_actors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ov; Owner: -
--

ALTER TABLE ONLY konkurz_restrukturalizacia_issues ALTER COLUMN id SET DEFAULT nextval('konkurz_restrukturalizacia_issues_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ov; Owner: -
--

ALTER TABLE ONLY konkurz_restrukturalizacia_proposings ALTER COLUMN id SET DEFAULT nextval('konkurz_restrukturalizacia_proposings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ov; Owner: -
--

ALTER TABLE ONLY konkurz_vyrovnanie_issues ALTER COLUMN id SET DEFAULT nextval('konkurz_vyrovnanie_issues_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ov; Owner: -
--

ALTER TABLE ONLY likvidator_issues ALTER COLUMN id SET DEFAULT nextval('likvidator_issues_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ov; Owner: -
--

ALTER TABLE ONLY or_podanie_issue_documents ALTER COLUMN id SET DEFAULT nextval('or_podanie_issue_documents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ov; Owner: -
--

ALTER TABLE ONLY or_podanie_issues ALTER COLUMN id SET DEFAULT nextval('or_podanie_issues_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ov; Owner: -
--

ALTER TABLE ONLY raw_issues ALTER COLUMN id SET DEFAULT nextval('raw_issues_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ov; Owner: -
--

ALTER TABLE ONLY znizenie_imania_ceos ALTER COLUMN id SET DEFAULT nextval('znizenie_imania_ceos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ov; Owner: -
--

ALTER TABLE ONLY znizenie_imania_issues ALTER COLUMN id SET DEFAULT nextval('znizenie_imania_issues_id_seq'::regclass);


SET search_path = ra, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: ra; Owner: -
--

ALTER TABLE ONLY building_purposes ALTER COLUMN id SET DEFAULT nextval('building_purposes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ra; Owner: -
--

ALTER TABLE ONLY building_types ALTER COLUMN id SET DEFAULT nextval('building_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ra; Owner: -
--

ALTER TABLE ONLY building_unit_changes ALTER COLUMN id SET DEFAULT nextval('building_unit_changes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ra; Owner: -
--

ALTER TABLE ONLY changes_batches ALTER COLUMN id SET DEFAULT nextval('changes_batches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ra; Owner: -
--

ALTER TABLE ONLY county_changes ALTER COLUMN id SET DEFAULT nextval('county_changes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ra; Owner: -
--

ALTER TABLE ONLY county_codes ALTER COLUMN id SET DEFAULT nextval('county_codes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ra; Owner: -
--

ALTER TABLE ONLY district_changes ALTER COLUMN id SET DEFAULT nextval('district_changes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ra; Owner: -
--

ALTER TABLE ONLY district_codes ALTER COLUMN id SET DEFAULT nextval('district_codes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ra; Owner: -
--

ALTER TABLE ONLY municipality_changes ALTER COLUMN id SET DEFAULT nextval('municipality_changes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ra; Owner: -
--

ALTER TABLE ONLY municipality_codes ALTER COLUMN id SET DEFAULT nextval('municipality_codes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ra; Owner: -
--

ALTER TABLE ONLY property_registration_number_changes ALTER COLUMN id SET DEFAULT nextval('property_registration_number_changes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ra; Owner: -
--

ALTER TABLE ONLY region_changes ALTER COLUMN id SET DEFAULT nextval('region_changes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ra; Owner: -
--

ALTER TABLE ONLY region_codes ALTER COLUMN id SET DEFAULT nextval('region_codes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ra; Owner: -
--

ALTER TABLE ONLY street_name_changes ALTER COLUMN id SET DEFAULT nextval('street_name_changes_id_seq'::regclass);


SET search_path = rpo, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY esa2010_codes ALTER COLUMN id SET DEFAULT nextval('esu2010_codes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY legal_forms ALTER COLUMN id SET DEFAULT nextval('legal_forms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY main_activity_codes ALTER COLUMN id SET DEFAULT nextval('main_activity_codes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_address_entries ALTER COLUMN id SET DEFAULT nextval('organization_address_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_alternate_name_entries ALTER COLUMN id SET DEFAULT nextval('organization_alternate_name_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_authorization_entries ALTER COLUMN id SET DEFAULT nextval('organization_authorization_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_deposit_entries ALTER COLUMN id SET DEFAULT nextval('organization_deposit_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_economic_activity_entries ALTER COLUMN id SET DEFAULT nextval('organization_economic_activity_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_equity_entries ALTER COLUMN id SET DEFAULT nextval('organization_equity_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_identifier_entries ALTER COLUMN id SET DEFAULT nextval('organization_identifier_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_legal_form_entries ALTER COLUMN id SET DEFAULT nextval('organization_legal_form_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_legal_status_entries ALTER COLUMN id SET DEFAULT nextval('organization_legal_status_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_name_entries ALTER COLUMN id SET DEFAULT nextval('organization_name_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_other_legal_fact_entries ALTER COLUMN id SET DEFAULT nextval('organization_other_legal_fact_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_predecessor_entries ALTER COLUMN id SET DEFAULT nextval('organization_predecessor_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_share_entries ALTER COLUMN id SET DEFAULT nextval('organization_share_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_stakeholder_entries ALTER COLUMN id SET DEFAULT nextval('organization_stakeholder_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_statutory_entries ALTER COLUMN id SET DEFAULT nextval('organization_statutory_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_successor_entries ALTER COLUMN id SET DEFAULT nextval('organization_successor_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organizations ALTER COLUMN id SET DEFAULT nextval('organizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY share_forms ALTER COLUMN id SET DEFAULT nextval('share_forms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY share_types ALTER COLUMN id SET DEFAULT nextval('share_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY stakeholder_types ALTER COLUMN id SET DEFAULT nextval('stakeholder_types_id_seq'::regclass);


SET search_path = ruz, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY accounting_entities ALTER COLUMN id SET DEFAULT nextval('ruz_accounting_entities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY districts ALTER COLUMN id SET DEFAULT nextval('ruz_districts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY legal_forms ALTER COLUMN id SET DEFAULT nextval('ruz_legal_forms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY municipalities ALTER COLUMN id SET DEFAULT nextval('ruz_municipalities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY organization_sizes ALTER COLUMN id SET DEFAULT nextval('ruz_organization_sizes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ownership_types ALTER COLUMN id SET DEFAULT nextval('ruz_ownership_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY regions ALTER COLUMN id SET DEFAULT nextval('ruz_regions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY sk_nace_categories ALTER COLUMN id SET DEFAULT nextval('ruz_sk_nace_categories_id_seq'::regclass);


SET search_path = socpoist, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: socpoist; Owner: -
--

ALTER TABLE ONLY debt_entries ALTER COLUMN id SET DEFAULT nextval('debt_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: socpoist; Owner: -
--

ALTER TABLE ONLY debt_ranges ALTER COLUMN id SET DEFAULT nextval('debt_ranges_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: socpoist; Owner: -
--

ALTER TABLE ONLY debtors ALTER COLUMN id SET DEFAULT nextval('debtors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: socpoist; Owner: -
--

ALTER TABLE ONLY debts_lists ALTER COLUMN id SET DEFAULT nextval('debts_lists_id_seq'::regclass);


SET search_path = vvo, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY bulletin_issues ALTER COLUMN id SET DEFAULT nextval('bulletins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY contracting_authorities ALTER COLUMN id SET DEFAULT nextval('contracting_authorities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY contracts ALTER COLUMN id SET DEFAULT nextval('contracts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY notice_suppliers ALTER COLUMN id SET DEFAULT nextval('notice_suppliers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY notice_types ALTER COLUMN id SET DEFAULT nextval('announcement_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY notices ALTER COLUMN id SET DEFAULT nextval('notices_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY procedure_types ALTER COLUMN id SET DEFAULT nextval('procedure_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY raw_notices ALTER COLUMN id SET DEFAULT nextval('raw_notices_id_seq'::regclass);


SET search_path = core, pg_catalog;

--
-- Name: apps_pkey; Type: CONSTRAINT; Schema: core; Owner: -
--

ALTER TABLE ONLY apps
    ADD CONSTRAINT apps_pkey PRIMARY KEY (id);


SET search_path = crz, pg_catalog;

--
-- Name: attachments_pkey; Type: CONSTRAINT; Schema: crz; Owner: -
--

ALTER TABLE ONLY attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: contracts_pkey; Type: CONSTRAINT; Schema: crz; Owner: -
--

ALTER TABLE ONLY contracts
    ADD CONSTRAINT contracts_pkey PRIMARY KEY (id);


--
-- Name: departments_pkey; Type: CONSTRAINT; Schema: crz; Owner: -
--

ALTER TABLE ONLY departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


SET search_path = datahub, pg_catalog;

--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: datahub; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: corporate_bodies_pkey; Type: CONSTRAINT; Schema: datahub; Owner: -
--

ALTER TABLE ONLY corporate_bodies
    ADD CONSTRAINT corporate_bodies_pkey PRIMARY KEY (id);


SET search_path = fs, pg_catalog;

--
-- Name: financna_sprava_vat_subjects_pkey; Type: CONSTRAINT; Schema: fs; Owner: -
--

ALTER TABLE ONLY vat_subjects
    ADD CONSTRAINT financna_sprava_vat_subjects_pkey PRIMARY KEY (id);


--
-- Name: vat_subject_entries_pkey; Type: CONSTRAINT; Schema: fs; Owner: -
--

ALTER TABLE ONLY vat_subject_entries
    ADD CONSTRAINT vat_subject_entries_pkey PRIMARY KEY (id);


--
-- Name: vat_subject_ranges_pkey; Type: CONSTRAINT; Schema: fs; Owner: -
--

ALTER TABLE ONLY vat_subject_ranges
    ADD CONSTRAINT vat_subject_ranges_pkey PRIMARY KEY (id);


--
-- Name: vat_subjects_lists_pkey; Type: CONSTRAINT; Schema: fs; Owner: -
--

ALTER TABLE ONLY vat_subjects_lists
    ADD CONSTRAINT vat_subjects_lists_pkey PRIMARY KEY (id);


SET search_path = map_datahub_fs, pg_catalog;

--
-- Name: vat_subject_mappings_pkey; Type: CONSTRAINT; Schema: map_datahub_fs; Owner: -
--

ALTER TABLE ONLY vat_subject_mappings
    ADD CONSTRAINT vat_subject_mappings_pkey PRIMARY KEY (id);


SET search_path = map_datahub_rpo, pg_catalog;

--
-- Name: corporate_body_mappings_pkey; Type: CONSTRAINT; Schema: map_datahub_rpo; Owner: -
--

ALTER TABLE ONLY corporate_body_mappings
    ADD CONSTRAINT corporate_body_mappings_pkey PRIMARY KEY (id);


--
-- Name: map_datahub_rpo_unique; Type: CONSTRAINT; Schema: map_datahub_rpo; Owner: -
--

ALTER TABLE ONLY corporate_body_mappings
    ADD CONSTRAINT map_datahub_rpo_unique UNIQUE (corporate_body_id, organization_id);


SET search_path = map_datahub_ruz, pg_catalog;

--
-- Name: corporate_body_mappings_pkey; Type: CONSTRAINT; Schema: map_datahub_ruz; Owner: -
--

ALTER TABLE ONLY corporate_body_mappings
    ADD CONSTRAINT corporate_body_mappings_pkey PRIMARY KEY (id);


SET search_path = ov, pg_catalog;

--
-- Name: bulletin_issues_pkey; Type: CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY bulletin_issues
    ADD CONSTRAINT bulletin_issues_pkey PRIMARY KEY (id);


--
-- Name: konkurz_restrukturalizacia_actors_pkey; Type: CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY konkurz_restrukturalizacia_actors
    ADD CONSTRAINT konkurz_restrukturalizacia_actors_pkey PRIMARY KEY (id);


--
-- Name: konkurz_restrukturalizacia_issues_pkey; Type: CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY konkurz_restrukturalizacia_issues
    ADD CONSTRAINT konkurz_restrukturalizacia_issues_pkey PRIMARY KEY (id);


--
-- Name: konkurz_restrukturalizacia_proposings_pkey; Type: CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY konkurz_restrukturalizacia_proposings
    ADD CONSTRAINT konkurz_restrukturalizacia_proposings_pkey PRIMARY KEY (id);


--
-- Name: konkurz_vyrovnanie_issues_pkey; Type: CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY konkurz_vyrovnanie_issues
    ADD CONSTRAINT konkurz_vyrovnanie_issues_pkey PRIMARY KEY (id);


--
-- Name: likvidator_issues_pkey; Type: CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY likvidator_issues
    ADD CONSTRAINT likvidator_issues_pkey PRIMARY KEY (id);


--
-- Name: or_podanie_issue_documents_pkey; Type: CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY or_podanie_issue_documents
    ADD CONSTRAINT or_podanie_issue_documents_pkey PRIMARY KEY (id);


--
-- Name: or_podanie_issues_pkey; Type: CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY or_podanie_issues
    ADD CONSTRAINT or_podanie_issues_pkey PRIMARY KEY (id);


--
-- Name: raw_issues_pkey; Type: CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY raw_issues
    ADD CONSTRAINT raw_issues_pkey PRIMARY KEY (id);


--
-- Name: znizenie_imania_ceos_pkey; Type: CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY znizenie_imania_ceos
    ADD CONSTRAINT znizenie_imania_ceos_pkey PRIMARY KEY (id);


--
-- Name: znizenie_imania_issues_pkey; Type: CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY znizenie_imania_issues
    ADD CONSTRAINT znizenie_imania_issues_pkey PRIMARY KEY (id);


SET search_path = ra, pg_catalog;

--
-- Name: building_purposes_pkey; Type: CONSTRAINT; Schema: ra; Owner: -
--

ALTER TABLE ONLY building_purposes
    ADD CONSTRAINT building_purposes_pkey PRIMARY KEY (id);


--
-- Name: building_types_pkey; Type: CONSTRAINT; Schema: ra; Owner: -
--

ALTER TABLE ONLY building_types
    ADD CONSTRAINT building_types_pkey PRIMARY KEY (id);


--
-- Name: building_unit_changes_pkey; Type: CONSTRAINT; Schema: ra; Owner: -
--

ALTER TABLE ONLY building_unit_changes
    ADD CONSTRAINT building_unit_changes_pkey PRIMARY KEY (id);


--
-- Name: changes_batches_pkey; Type: CONSTRAINT; Schema: ra; Owner: -
--

ALTER TABLE ONLY changes_batches
    ADD CONSTRAINT changes_batches_pkey PRIMARY KEY (id);


--
-- Name: county_changes_pkey; Type: CONSTRAINT; Schema: ra; Owner: -
--

ALTER TABLE ONLY county_changes
    ADD CONSTRAINT county_changes_pkey PRIMARY KEY (id);


--
-- Name: county_codes_pkey; Type: CONSTRAINT; Schema: ra; Owner: -
--

ALTER TABLE ONLY county_codes
    ADD CONSTRAINT county_codes_pkey PRIMARY KEY (id);


--
-- Name: district_changes_pkey; Type: CONSTRAINT; Schema: ra; Owner: -
--

ALTER TABLE ONLY district_changes
    ADD CONSTRAINT district_changes_pkey PRIMARY KEY (id);


--
-- Name: district_codes_pkey; Type: CONSTRAINT; Schema: ra; Owner: -
--

ALTER TABLE ONLY district_codes
    ADD CONSTRAINT district_codes_pkey PRIMARY KEY (id);


--
-- Name: municipality_changes_pkey; Type: CONSTRAINT; Schema: ra; Owner: -
--

ALTER TABLE ONLY municipality_changes
    ADD CONSTRAINT municipality_changes_pkey PRIMARY KEY (id);


--
-- Name: municipality_codes_pkey; Type: CONSTRAINT; Schema: ra; Owner: -
--

ALTER TABLE ONLY municipality_codes
    ADD CONSTRAINT municipality_codes_pkey PRIMARY KEY (id);


--
-- Name: property_registration_number_changes_pkey; Type: CONSTRAINT; Schema: ra; Owner: -
--

ALTER TABLE ONLY property_registration_number_changes
    ADD CONSTRAINT property_registration_number_changes_pkey PRIMARY KEY (id);


--
-- Name: region_changes_pkey; Type: CONSTRAINT; Schema: ra; Owner: -
--

ALTER TABLE ONLY region_changes
    ADD CONSTRAINT region_changes_pkey PRIMARY KEY (id);


--
-- Name: region_codes_pkey; Type: CONSTRAINT; Schema: ra; Owner: -
--

ALTER TABLE ONLY region_codes
    ADD CONSTRAINT region_codes_pkey PRIMARY KEY (id);


--
-- Name: street_name_changes_pkey; Type: CONSTRAINT; Schema: ra; Owner: -
--

ALTER TABLE ONLY street_name_changes
    ADD CONSTRAINT street_name_changes_pkey PRIMARY KEY (id);


SET search_path = rpo, pg_catalog;

--
-- Name: esu2010_codes_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY esa2010_codes
    ADD CONSTRAINT esu2010_codes_pkey PRIMARY KEY (id);


--
-- Name: legal_forms_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY legal_forms
    ADD CONSTRAINT legal_forms_pkey PRIMARY KEY (id);


--
-- Name: main_activity_codes_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY main_activity_codes
    ADD CONSTRAINT main_activity_codes_pkey PRIMARY KEY (id);


--
-- Name: organization_address_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_address_entries
    ADD CONSTRAINT organization_address_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_alternate_name_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_alternate_name_entries
    ADD CONSTRAINT organization_alternate_name_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_authorization_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_authorization_entries
    ADD CONSTRAINT organization_authorization_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_deposit_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_deposit_entries
    ADD CONSTRAINT organization_deposit_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_economic_activity_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_economic_activity_entries
    ADD CONSTRAINT organization_economic_activity_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_equity_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_equity_entries
    ADD CONSTRAINT organization_equity_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_identifier_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_identifier_entries
    ADD CONSTRAINT organization_identifier_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_legal_form_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_legal_form_entries
    ADD CONSTRAINT organization_legal_form_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_legal_status_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_legal_status_entries
    ADD CONSTRAINT organization_legal_status_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_name_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_name_entries
    ADD CONSTRAINT organization_name_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_other_legal_fact_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_other_legal_fact_entries
    ADD CONSTRAINT organization_other_legal_fact_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_predecessor_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_predecessor_entries
    ADD CONSTRAINT organization_predecessor_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_share_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_share_entries
    ADD CONSTRAINT organization_share_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_stakeholder_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_stakeholder_entries
    ADD CONSTRAINT organization_stakeholder_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_statutory_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_statutory_entries
    ADD CONSTRAINT organization_statutory_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_successor_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_successor_entries
    ADD CONSTRAINT organization_successor_entries_pkey PRIMARY KEY (id);


--
-- Name: organizations_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: share_forms_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY share_forms
    ADD CONSTRAINT share_forms_pkey PRIMARY KEY (id);


--
-- Name: share_types_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY share_types
    ADD CONSTRAINT share_types_pkey PRIMARY KEY (id);


--
-- Name: stakeholder_types_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY stakeholder_types
    ADD CONSTRAINT stakeholder_types_pkey PRIMARY KEY (id);


SET search_path = ruz, pg_catalog;

--
-- Name: ruz_accounting_entities_pkey; Type: CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY accounting_entities
    ADD CONSTRAINT ruz_accounting_entities_pkey PRIMARY KEY (id);


--
-- Name: ruz_districts_pkey; Type: CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY districts
    ADD CONSTRAINT ruz_districts_pkey PRIMARY KEY (id);


--
-- Name: ruz_legal_forms_pkey; Type: CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY legal_forms
    ADD CONSTRAINT ruz_legal_forms_pkey PRIMARY KEY (id);


--
-- Name: ruz_municipalities_pkey; Type: CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY municipalities
    ADD CONSTRAINT ruz_municipalities_pkey PRIMARY KEY (id);


--
-- Name: ruz_organization_sizes_pkey; Type: CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY organization_sizes
    ADD CONSTRAINT ruz_organization_sizes_pkey PRIMARY KEY (id);


--
-- Name: ruz_ownership_types_pkey; Type: CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ownership_types
    ADD CONSTRAINT ruz_ownership_types_pkey PRIMARY KEY (id);


--
-- Name: ruz_regions_pkey; Type: CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT ruz_regions_pkey PRIMARY KEY (id);


--
-- Name: ruz_sk_nace_categories_pkey; Type: CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY sk_nace_categories
    ADD CONSTRAINT ruz_sk_nace_categories_pkey PRIMARY KEY (id);


SET search_path = socpoist, pg_catalog;

--
-- Name: debt_entries_pkey; Type: CONSTRAINT; Schema: socpoist; Owner: -
--

ALTER TABLE ONLY debt_entries
    ADD CONSTRAINT debt_entries_pkey PRIMARY KEY (id);


--
-- Name: debt_ranges_pkey; Type: CONSTRAINT; Schema: socpoist; Owner: -
--

ALTER TABLE ONLY debt_ranges
    ADD CONSTRAINT debt_ranges_pkey PRIMARY KEY (id);


--
-- Name: debtors_pkey; Type: CONSTRAINT; Schema: socpoist; Owner: -
--

ALTER TABLE ONLY debtors
    ADD CONSTRAINT debtors_pkey PRIMARY KEY (id);


--
-- Name: debts_lists_pkey; Type: CONSTRAINT; Schema: socpoist; Owner: -
--

ALTER TABLE ONLY debts_lists
    ADD CONSTRAINT debts_lists_pkey PRIMARY KEY (id);


--
-- Name: socpoist_debtor_name; Type: CONSTRAINT; Schema: socpoist; Owner: -
--

ALTER TABLE ONLY debtors
    ADD CONSTRAINT socpoist_debtor_name UNIQUE (name, address, city);


SET search_path = vvo, pg_catalog;

--
-- Name: announcement_types_pkey; Type: CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY notice_types
    ADD CONSTRAINT announcement_types_pkey PRIMARY KEY (id);


--
-- Name: bulletins_pkey; Type: CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY bulletin_issues
    ADD CONSTRAINT bulletins_pkey PRIMARY KEY (id);


--
-- Name: contracting_authorities_pkey; Type: CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY contracting_authorities
    ADD CONSTRAINT contracting_authorities_pkey PRIMARY KEY (id);


--
-- Name: contracts_pkey; Type: CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY contracts
    ADD CONSTRAINT contracts_pkey PRIMARY KEY (id);


--
-- Name: notice_suppliers_pkey; Type: CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY notice_suppliers
    ADD CONSTRAINT notice_suppliers_pkey PRIMARY KEY (id);


--
-- Name: notices_pkey; Type: CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY notices
    ADD CONSTRAINT notices_pkey PRIMARY KEY (id);


--
-- Name: procedure_types_pkey; Type: CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY procedure_types
    ADD CONSTRAINT procedure_types_pkey PRIMARY KEY (id);


--
-- Name: raw_notices_pkey; Type: CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY raw_notices
    ADD CONSTRAINT raw_notices_pkey PRIMARY KEY (id);


--
-- Name: vvo_unique_code; Type: CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY procedure_types
    ADD CONSTRAINT vvo_unique_code UNIQUE (code, category);


SET search_path = core, pg_catalog;

--
-- Name: index_core.apps_on_access_token; Type: INDEX; Schema: core; Owner: -
--

CREATE UNIQUE INDEX "index_core.apps_on_access_token" ON apps USING btree (access_token);


--
-- Name: index_core.apps_on_name; Type: INDEX; Schema: core; Owner: -
--

CREATE UNIQUE INDEX "index_core.apps_on_name" ON apps USING btree (name);


SET search_path = crz, pg_catalog;

--
-- Name: index_crz.attachments_on_contract_id; Type: INDEX; Schema: crz; Owner: -
--

CREATE INDEX "index_crz.attachments_on_contract_id" ON attachments USING btree (contract_id);


--
-- Name: index_crz.contracts_on_updated_at_and_id; Type: INDEX; Schema: crz; Owner: -
--

CREATE UNIQUE INDEX "index_crz.contracts_on_updated_at_and_id" ON contracts USING btree (updated_at, id);


SET search_path = datahub, pg_catalog;

--
-- Name: index_datahub.corporate_bodies_on_cin; Type: INDEX; Schema: datahub; Owner: -
--

CREATE UNIQUE INDEX "index_datahub.corporate_bodies_on_cin" ON corporate_bodies USING btree (cin);


--
-- Name: index_datahub.corporate_bodies_on_name; Type: INDEX; Schema: datahub; Owner: -
--

CREATE INDEX "index_datahub.corporate_bodies_on_name" ON corporate_bodies USING btree (name);


--
-- Name: index_datahub.corporate_bodies_on_tin; Type: INDEX; Schema: datahub; Owner: -
--

CREATE INDEX "index_datahub.corporate_bodies_on_tin" ON corporate_bodies USING btree (tin);


--
-- Name: index_datahub.corporate_bodies_on_updated_at_and_id; Type: INDEX; Schema: datahub; Owner: -
--

CREATE UNIQUE INDEX "index_datahub.corporate_bodies_on_updated_at_and_id" ON corporate_bodies USING btree (updated_at, id);


SET search_path = fs, pg_catalog;

--
-- Name: index_fs.vat_subject_entries_on_subject_id_and_list_id; Type: INDEX; Schema: fs; Owner: -
--

CREATE UNIQUE INDEX "index_fs.vat_subject_entries_on_subject_id_and_list_id" ON vat_subject_entries USING btree (subject_id, list_id);


--
-- Name: index_fs.vat_subject_ranges_on_subject_id_and_effective_from; Type: INDEX; Schema: fs; Owner: -
--

CREATE INDEX "index_fs.vat_subject_ranges_on_subject_id_and_effective_from" ON vat_subject_ranges USING btree (subject_id, effective_from);


--
-- Name: index_fs.vat_subjects_lists_on_date; Type: INDEX; Schema: fs; Owner: -
--

CREATE UNIQUE INDEX "index_fs.vat_subjects_lists_on_date" ON vat_subjects_lists USING btree (date);


SET search_path = map_datahub_fs, pg_catalog;

--
-- Name: index_map_datahub_fs.vat_subject_mappings_on_corporate_body_id; Type: INDEX; Schema: map_datahub_fs; Owner: -
--

CREATE INDEX "index_map_datahub_fs.vat_subject_mappings_on_corporate_body_id" ON vat_subject_mappings USING btree (corporate_body_id);


--
-- Name: index_map_datahub_fs.vat_subject_mappings_on_vat_subject_id; Type: INDEX; Schema: map_datahub_fs; Owner: -
--

CREATE UNIQUE INDEX "index_map_datahub_fs.vat_subject_mappings_on_vat_subject_id" ON vat_subject_mappings USING btree (vat_subject_id);


SET search_path = map_datahub_rpo, pg_catalog;

--
-- Name: index_map_datahub_rpo.cbm_on_corporate_body_id; Type: INDEX; Schema: map_datahub_rpo; Owner: -
--

CREATE UNIQUE INDEX "index_map_datahub_rpo.cbm_on_corporate_body_id" ON corporate_body_mappings USING btree (corporate_body_id);


--
-- Name: index_map_datahub_rpo.cbm_on_org_id; Type: INDEX; Schema: map_datahub_rpo; Owner: -
--

CREATE UNIQUE INDEX "index_map_datahub_rpo.cbm_on_org_id" ON corporate_body_mappings USING btree (organization_id);


SET search_path = map_datahub_ruz, pg_catalog;

--
-- Name: index.corporate_body_mappings_on_corporate_body_id; Type: INDEX; Schema: map_datahub_ruz; Owner: -
--

CREATE UNIQUE INDEX "index.corporate_body_mappings_on_corporate_body_id" ON corporate_body_mappings USING btree (corporate_body_id);


SET search_path = ov, pg_catalog;

--
-- Name: index_ov.bulletin_issues_on_updated_at_and_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE UNIQUE INDEX "index_ov.bulletin_issues_on_updated_at_and_id" ON bulletin_issues USING btree (updated_at, id);


--
-- Name: index_ov.bulletin_issues_on_year_and_number; Type: INDEX; Schema: ov; Owner: -
--

CREATE UNIQUE INDEX "index_ov.bulletin_issues_on_year_and_number" ON bulletin_issues USING btree (year, number);


--
-- Name: index_ov.konkurz_restrukturalizacia_issues_on_bulletin_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE INDEX "index_ov.konkurz_restrukturalizacia_issues_on_bulletin_issue_id" ON konkurz_restrukturalizacia_issues USING btree (bulletin_issue_id);


--
-- Name: index_ov.konkurz_restrukturalizacia_issues_on_raw_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE UNIQUE INDEX "index_ov.konkurz_restrukturalizacia_issues_on_raw_issue_id" ON konkurz_restrukturalizacia_issues USING btree (raw_issue_id);


--
-- Name: index_ov.konkurz_restrukturalizacia_issues_on_updated_at_and_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE UNIQUE INDEX "index_ov.konkurz_restrukturalizacia_issues_on_updated_at_and_id" ON konkurz_restrukturalizacia_issues USING btree (updated_at, id);


--
-- Name: index_ov.konkurz_restrukturalizacia_proposings_on_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE INDEX "index_ov.konkurz_restrukturalizacia_proposings_on_issue_id" ON konkurz_restrukturalizacia_proposings USING btree (issue_id);


--
-- Name: index_ov.konkurz_vyrovnanie_issues_on_bulletin_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE INDEX "index_ov.konkurz_vyrovnanie_issues_on_bulletin_issue_id" ON konkurz_vyrovnanie_issues USING btree (bulletin_issue_id);


--
-- Name: index_ov.konkurz_vyrovnanie_issues_on_raw_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE UNIQUE INDEX "index_ov.konkurz_vyrovnanie_issues_on_raw_issue_id" ON konkurz_vyrovnanie_issues USING btree (raw_issue_id);


--
-- Name: index_ov.konkurz_vyrovnanie_issues_on_updated_at_and_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE UNIQUE INDEX "index_ov.konkurz_vyrovnanie_issues_on_updated_at_and_id" ON konkurz_vyrovnanie_issues USING btree (updated_at, id);


--
-- Name: index_ov.likvidator_issues_on_bulletin_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE INDEX "index_ov.likvidator_issues_on_bulletin_issue_id" ON likvidator_issues USING btree (bulletin_issue_id);


--
-- Name: index_ov.likvidator_issues_on_raw_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE UNIQUE INDEX "index_ov.likvidator_issues_on_raw_issue_id" ON likvidator_issues USING btree (raw_issue_id);


--
-- Name: index_ov.likvidator_issues_on_updated_at_and_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE UNIQUE INDEX "index_ov.likvidator_issues_on_updated_at_and_id" ON likvidator_issues USING btree (updated_at, id);


--
-- Name: index_ov.or_podanie_issue_documents_on_or_podanie_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE INDEX "index_ov.or_podanie_issue_documents_on_or_podanie_issue_id" ON or_podanie_issue_documents USING btree (or_podanie_issue_id);


--
-- Name: index_ov.or_podanie_issues_on_bulletin_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE INDEX "index_ov.or_podanie_issues_on_bulletin_issue_id" ON or_podanie_issues USING btree (bulletin_issue_id);


--
-- Name: index_ov.or_podanie_issues_on_raw_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE INDEX "index_ov.or_podanie_issues_on_raw_issue_id" ON or_podanie_issues USING btree (raw_issue_id);


--
-- Name: index_ov.or_podanie_issues_on_updated_at_and_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE UNIQUE INDEX "index_ov.or_podanie_issues_on_updated_at_and_id" ON or_podanie_issues USING btree (updated_at, id);


--
-- Name: index_ov.raw_issues_on_bulletin_issue_id_and_file_name; Type: INDEX; Schema: ov; Owner: -
--

CREATE INDEX "index_ov.raw_issues_on_bulletin_issue_id_and_file_name" ON raw_issues USING btree (bulletin_issue_id, file_name);


--
-- Name: index_ov.raw_issues_on_updated_at_and_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE UNIQUE INDEX "index_ov.raw_issues_on_updated_at_and_id" ON raw_issues USING btree (updated_at, id);


--
-- Name: index_ov.znizenie_imania_ceos_on_znizenie_imania_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE INDEX "index_ov.znizenie_imania_ceos_on_znizenie_imania_issue_id" ON znizenie_imania_ceos USING btree (znizenie_imania_issue_id);


--
-- Name: index_ov.znizenie_imania_issues_on_bulletin_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE INDEX "index_ov.znizenie_imania_issues_on_bulletin_issue_id" ON znizenie_imania_issues USING btree (bulletin_issue_id);


--
-- Name: index_ov.znizenie_imania_issues_on_raw_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE UNIQUE INDEX "index_ov.znizenie_imania_issues_on_raw_issue_id" ON znizenie_imania_issues USING btree (raw_issue_id);


--
-- Name: index_ov.znizenie_imania_issues_on_updated_at_and_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE UNIQUE INDEX "index_ov.znizenie_imania_issues_on_updated_at_and_id" ON znizenie_imania_issues USING btree (updated_at, id);


SET search_path = public, pg_catalog;

--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


SET search_path = ra, pg_catalog;

--
-- Name: index_ra.building_purposes_on_code; Type: INDEX; Schema: ra; Owner: -
--

CREATE UNIQUE INDEX "index_ra.building_purposes_on_code" ON building_purposes USING btree (code);


--
-- Name: index_ra.county_codes_on_code; Type: INDEX; Schema: ra; Owner: -
--

CREATE UNIQUE INDEX "index_ra.county_codes_on_code" ON county_codes USING btree (code);


--
-- Name: index_ra.district_codes_on_code_and_name; Type: INDEX; Schema: ra; Owner: -
--

CREATE UNIQUE INDEX "index_ra.district_codes_on_code_and_name" ON district_codes USING btree (code, name);


--
-- Name: index_ra.municipality_codes_on_code_and_name; Type: INDEX; Schema: ra; Owner: -
--

CREATE UNIQUE INDEX "index_ra.municipality_codes_on_code_and_name" ON municipality_codes USING btree (code, name);


--
-- Name: index_ra.region_codes_on_code; Type: INDEX; Schema: ra; Owner: -
--

CREATE UNIQUE INDEX "index_ra.region_codes_on_code" ON region_codes USING btree (code);


SET search_path = rpo, pg_catalog;

--
-- Name: index_rpo.organization_address_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_address_entries_on_organization_id" ON organization_address_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_alternames_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_alternames_on_organization_id" ON organization_alternate_name_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_authorization_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_authorization_entries_on_organization_id" ON organization_authorization_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_deposit_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_deposit_entries_on_organization_id" ON organization_deposit_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_economic_activity_entries_on_org_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_economic_activity_entries_on_org_id" ON organization_economic_activity_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_equity_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_equity_entries_on_organization_id" ON organization_equity_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_identifier_entries_on_ipo_and_org_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_identifier_entries_on_ipo_and_org_id" ON organization_identifier_entries USING btree (ipo, organization_id);


--
-- Name: index_rpo.organization_identifier_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_identifier_entries_on_organization_id" ON organization_identifier_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_legal_form_entries_on_legal_form_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_legal_form_entries_on_legal_form_id" ON organization_legal_form_entries USING btree (legal_form_id);


--
-- Name: index_rpo.organization_legal_form_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_legal_form_entries_on_organization_id" ON organization_legal_form_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_legal_status_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_legal_status_entries_on_organization_id" ON organization_legal_status_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_name_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_name_entries_on_organization_id" ON organization_name_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_olfe_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_olfe_on_organization_id" ON organization_other_legal_fact_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_predecessor_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_predecessor_entries_on_organization_id" ON organization_predecessor_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_share_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_share_entries_on_organization_id" ON organization_share_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_share_entries_on_share_form_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_share_entries_on_share_form_id" ON organization_share_entries USING btree (share_form_id);


--
-- Name: index_rpo.organization_share_entries_on_share_type_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_share_entries_on_share_type_id" ON organization_share_entries USING btree (share_type_id);


--
-- Name: index_rpo.organization_stakeholder_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_stakeholder_entries_on_organization_id" ON organization_stakeholder_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_statutory_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_statutory_entries_on_organization_id" ON organization_statutory_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_statutory_entries_on_stakeholder_type_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_statutory_entries_on_stakeholder_type_id" ON organization_statutory_entries USING btree (stakeholder_type_id);


--
-- Name: index_rpo.organization_successor_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_successor_entries_on_organization_id" ON organization_successor_entries USING btree (organization_id);


--
-- Name: index_rpo.organizations_on_updated_at_and_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE UNIQUE INDEX "index_rpo.organizations_on_updated_at_and_id" ON organizations USING btree (updated_at, id);


--
-- Name: index_rpo.share_forms_on_name; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.share_forms_on_name" ON share_forms USING btree (name);


--
-- Name: index_rpo.share_types_on_name; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.share_types_on_name" ON share_types USING btree (name);


SET search_path = ruz, pg_catalog;

--
-- Name: index_ruz.accounting_entities_on_ico; Type: INDEX; Schema: ruz; Owner: -
--

CREATE INDEX "index_ruz.accounting_entities_on_ico" ON accounting_entities USING btree (cin);


--
-- Name: index_ruz.accounting_entities_on_updated_at_and_id; Type: INDEX; Schema: ruz; Owner: -
--

CREATE UNIQUE INDEX "index_ruz.accounting_entities_on_updated_at_and_id" ON accounting_entities USING btree (updated_at, id);


--
-- Name: index_ruz_accounting_entities_on_district_id; Type: INDEX; Schema: ruz; Owner: -
--

CREATE INDEX index_ruz_accounting_entities_on_district_id ON accounting_entities USING btree (district_id);


--
-- Name: index_ruz_accounting_entities_on_legal_form_id; Type: INDEX; Schema: ruz; Owner: -
--

CREATE INDEX index_ruz_accounting_entities_on_legal_form_id ON accounting_entities USING btree (legal_form_id);


--
-- Name: index_ruz_accounting_entities_on_municipality_id; Type: INDEX; Schema: ruz; Owner: -
--

CREATE INDEX index_ruz_accounting_entities_on_municipality_id ON accounting_entities USING btree (municipality_id);


--
-- Name: index_ruz_accounting_entities_on_organization_size_id; Type: INDEX; Schema: ruz; Owner: -
--

CREATE INDEX index_ruz_accounting_entities_on_organization_size_id ON accounting_entities USING btree (organization_size_id);


--
-- Name: index_ruz_accounting_entities_on_ownership_type_id; Type: INDEX; Schema: ruz; Owner: -
--

CREATE INDEX index_ruz_accounting_entities_on_ownership_type_id ON accounting_entities USING btree (ownership_type_id);


--
-- Name: index_ruz_accounting_entities_on_region_id; Type: INDEX; Schema: ruz; Owner: -
--

CREATE INDEX index_ruz_accounting_entities_on_region_id ON accounting_entities USING btree (region_id);


--
-- Name: index_ruz_accounting_entities_on_sk_nace_category_id; Type: INDEX; Schema: ruz; Owner: -
--

CREATE INDEX index_ruz_accounting_entities_on_sk_nace_category_id ON accounting_entities USING btree (sk_nace_category_id);


--
-- Name: index_ruz_districts_on_region_id; Type: INDEX; Schema: ruz; Owner: -
--

CREATE INDEX index_ruz_districts_on_region_id ON districts USING btree (region_id);


--
-- Name: index_ruz_municipalities_on_parent_id; Type: INDEX; Schema: ruz; Owner: -
--

CREATE INDEX index_ruz_municipalities_on_parent_id ON municipalities USING btree (parent_id);


SET search_path = socpoist, pg_catalog;

--
-- Name: index_socpoist.debt_entries_on_debtor_id; Type: INDEX; Schema: socpoist; Owner: -
--

CREATE INDEX "index_socpoist.debt_entries_on_debtor_id" ON debt_entries USING btree (debtor_id);


--
-- Name: index_socpoist.debt_entries_on_list_id; Type: INDEX; Schema: socpoist; Owner: -
--

CREATE INDEX "index_socpoist.debt_entries_on_list_id" ON debt_entries USING btree (list_id);


--
-- Name: index_socpoist.debt_ranges_on_debtor_id; Type: INDEX; Schema: socpoist; Owner: -
--

CREATE INDEX "index_socpoist.debt_ranges_on_debtor_id" ON debt_ranges USING btree (debtor_id);


--
-- Name: index_socpoist.debtors_on_name; Type: INDEX; Schema: socpoist; Owner: -
--

CREATE INDEX "index_socpoist.debtors_on_name" ON debtors USING btree (name);


--
-- Name: index_socpoist.debts_lists_on_published_on; Type: INDEX; Schema: socpoist; Owner: -
--

CREATE UNIQUE INDEX "index_socpoist.debts_lists_on_published_on" ON debts_lists USING btree (published_on);


SET search_path = vvo, pg_catalog;

--
-- Name: index_vvo.announcement_types_on_code; Type: INDEX; Schema: vvo; Owner: -
--

CREATE UNIQUE INDEX "index_vvo.announcement_types_on_code" ON notice_types USING btree (code);


--
-- Name: index_vvo.notice_suppliers_on_notice_id; Type: INDEX; Schema: vvo; Owner: -
--

CREATE INDEX "index_vvo.notice_suppliers_on_notice_id" ON notice_suppliers USING btree (notice_id);


--
-- Name: index_vvo.notices_on_contract_id; Type: INDEX; Schema: vvo; Owner: -
--

CREATE INDEX "index_vvo.notices_on_contract_id" ON notices USING btree (contract_id);


--
-- Name: index_vvo.notices_on_contracting_authority_id; Type: INDEX; Schema: vvo; Owner: -
--

CREATE INDEX "index_vvo.notices_on_contracting_authority_id" ON notices USING btree (contracting_authority_id);


--
-- Name: index_vvo.notices_on_procedure_type_id; Type: INDEX; Schema: vvo; Owner: -
--

CREATE INDEX "index_vvo.notices_on_procedure_type_id" ON notices USING btree (procedure_type_id);


--
-- Name: index_vvo.raw_notices_on_bulletin_id; Type: INDEX; Schema: vvo; Owner: -
--

CREATE INDEX "index_vvo.raw_notices_on_bulletin_id" ON raw_notices USING btree (bulletin_issue_id);


--
-- Name: index_vvo.raw_notices_on_bulletin_id_and_number; Type: INDEX; Schema: vvo; Owner: -
--

CREATE UNIQUE INDEX "index_vvo.raw_notices_on_bulletin_id_and_number" ON raw_notices USING btree (bulletin_issue_id, number);


SET search_path = crz, pg_catalog;

--
-- Name: fk_rails_43c7c1b4e3; Type: FK CONSTRAINT; Schema: crz; Owner: -
--

ALTER TABLE ONLY contracts
    ADD CONSTRAINT fk_rails_43c7c1b4e3 FOREIGN KEY (department_id) REFERENCES departments(id);


--
-- Name: fk_rails_741b6026e6; Type: FK CONSTRAINT; Schema: crz; Owner: -
--

ALTER TABLE ONLY attachments
    ADD CONSTRAINT fk_rails_741b6026e6 FOREIGN KEY (contract_id) REFERENCES contracts(id) ON DELETE CASCADE;


SET search_path = fs, pg_catalog;

--
-- Name: fk_rails_866e5686f1; Type: FK CONSTRAINT; Schema: fs; Owner: -
--

ALTER TABLE ONLY vat_subject_entries
    ADD CONSTRAINT fk_rails_866e5686f1 FOREIGN KEY (list_id) REFERENCES vat_subjects_lists(id) ON DELETE CASCADE;


--
-- Name: fk_rails_add234478f; Type: FK CONSTRAINT; Schema: fs; Owner: -
--

ALTER TABLE ONLY vat_subject_ranges
    ADD CONSTRAINT fk_rails_add234478f FOREIGN KEY (subject_id) REFERENCES vat_subjects(id) ON DELETE CASCADE;


--
-- Name: fk_rails_ba0ea23187; Type: FK CONSTRAINT; Schema: fs; Owner: -
--

ALTER TABLE ONLY vat_subject_entries
    ADD CONSTRAINT fk_rails_ba0ea23187 FOREIGN KEY (subject_id) REFERENCES vat_subjects(id) ON DELETE CASCADE;


SET search_path = map_datahub_fs, pg_catalog;

--
-- Name: fk_rails_6e200c775e; Type: FK CONSTRAINT; Schema: map_datahub_fs; Owner: -
--

ALTER TABLE ONLY vat_subject_mappings
    ADD CONSTRAINT fk_rails_6e200c775e FOREIGN KEY (corporate_body_id) REFERENCES datahub.corporate_bodies(id) ON DELETE CASCADE;


--
-- Name: fk_rails_f4ff7f16d4; Type: FK CONSTRAINT; Schema: map_datahub_fs; Owner: -
--

ALTER TABLE ONLY vat_subject_mappings
    ADD CONSTRAINT fk_rails_f4ff7f16d4 FOREIGN KEY (vat_subject_id) REFERENCES fs.vat_subjects(id) ON DELETE CASCADE;


SET search_path = map_datahub_rpo, pg_catalog;

--
-- Name: fk_rails_c3b7d4a7cd; Type: FK CONSTRAINT; Schema: map_datahub_rpo; Owner: -
--

ALTER TABLE ONLY corporate_body_mappings
    ADD CONSTRAINT fk_rails_c3b7d4a7cd FOREIGN KEY (organization_id) REFERENCES rpo.organizations(id) ON DELETE CASCADE;


--
-- Name: fk_rails_fac45fa0c7; Type: FK CONSTRAINT; Schema: map_datahub_rpo; Owner: -
--

ALTER TABLE ONLY corporate_body_mappings
    ADD CONSTRAINT fk_rails_fac45fa0c7 FOREIGN KEY (corporate_body_id) REFERENCES datahub.corporate_bodies(id) ON DELETE SET NULL;


SET search_path = ov, pg_catalog;

--
-- Name: fk_rails_01f2555605; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY konkurz_restrukturalizacia_issues
    ADD CONSTRAINT fk_rails_01f2555605 FOREIGN KEY (debtor_id) REFERENCES konkurz_restrukturalizacia_actors(id) ON DELETE CASCADE;


--
-- Name: fk_rails_06649ad96d; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY or_podanie_issue_documents
    ADD CONSTRAINT fk_rails_06649ad96d FOREIGN KEY (or_podanie_issue_id) REFERENCES or_podanie_issues(id) ON DELETE CASCADE;


--
-- Name: fk_rails_10be52a24f; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY znizenie_imania_issues
    ADD CONSTRAINT fk_rails_10be52a24f FOREIGN KEY (raw_issue_id) REFERENCES raw_issues(id) ON DELETE CASCADE;


--
-- Name: fk_rails_296053f2e5; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY or_podanie_issues
    ADD CONSTRAINT fk_rails_296053f2e5 FOREIGN KEY (raw_issue_id) REFERENCES raw_issues(id) ON DELETE CASCADE;


--
-- Name: fk_rails_478427253d; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY konkurz_restrukturalizacia_proposings
    ADD CONSTRAINT fk_rails_478427253d FOREIGN KEY (issue_id) REFERENCES konkurz_restrukturalizacia_issues(id) ON DELETE CASCADE;


--
-- Name: fk_rails_4c291d9773; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY likvidator_issues
    ADD CONSTRAINT fk_rails_4c291d9773 FOREIGN KEY (raw_issue_id) REFERENCES raw_issues(id) ON DELETE CASCADE;


--
-- Name: fk_rails_4ce66fa0cc; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY likvidator_issues
    ADD CONSTRAINT fk_rails_4ce66fa0cc FOREIGN KEY (bulletin_issue_id) REFERENCES bulletin_issues(id) ON DELETE CASCADE;


--
-- Name: fk_rails_5bf005ec9f; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY konkurz_restrukturalizacia_issues
    ADD CONSTRAINT fk_rails_5bf005ec9f FOREIGN KEY (raw_issue_id) REFERENCES raw_issues(id) ON DELETE CASCADE;


--
-- Name: fk_rails_605d9df774; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY konkurz_vyrovnanie_issues
    ADD CONSTRAINT fk_rails_605d9df774 FOREIGN KEY (bulletin_issue_id) REFERENCES bulletin_issues(id) ON DELETE CASCADE;


--
-- Name: fk_rails_6726036788; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY or_podanie_issues
    ADD CONSTRAINT fk_rails_6726036788 FOREIGN KEY (bulletin_issue_id) REFERENCES bulletin_issues(id) ON DELETE CASCADE;


--
-- Name: fk_rails_7aee147bb0; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY znizenie_imania_issues
    ADD CONSTRAINT fk_rails_7aee147bb0 FOREIGN KEY (bulletin_issue_id) REFERENCES bulletin_issues(id) ON DELETE CASCADE;


--
-- Name: fk_rails_7d80f1d1cd; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY konkurz_restrukturalizacia_proposings
    ADD CONSTRAINT fk_rails_7d80f1d1cd FOREIGN KEY (actor_id) REFERENCES konkurz_restrukturalizacia_actors(id) ON DELETE CASCADE;


--
-- Name: fk_rails_8bb6f430bf; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY znizenie_imania_ceos
    ADD CONSTRAINT fk_rails_8bb6f430bf FOREIGN KEY (znizenie_imania_issue_id) REFERENCES znizenie_imania_issues(id) ON DELETE CASCADE;


--
-- Name: fk_rails_c2450a59ca; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY konkurz_vyrovnanie_issues
    ADD CONSTRAINT fk_rails_c2450a59ca FOREIGN KEY (raw_issue_id) REFERENCES raw_issues(id) ON DELETE CASCADE;


--
-- Name: fk_rails_ebe06fe061; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY raw_issues
    ADD CONSTRAINT fk_rails_ebe06fe061 FOREIGN KEY (bulletin_issue_id) REFERENCES bulletin_issues(id) ON DELETE CASCADE;


--
-- Name: fk_rails_fccf2c79e3; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY konkurz_restrukturalizacia_issues
    ADD CONSTRAINT fk_rails_fccf2c79e3 FOREIGN KEY (bulletin_issue_id) REFERENCES bulletin_issues(id) ON DELETE CASCADE;


SET search_path = rpo, pg_catalog;

--
-- Name: fk_rails_215d851542; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_other_legal_fact_entries
    ADD CONSTRAINT fk_rails_215d851542 FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE;


--
-- Name: fk_rails_23fe270425; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT fk_rails_23fe270425 FOREIGN KEY (main_organization_id) REFERENCES organizations(id);


--
-- Name: fk_rails_28212d8658; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_name_entries
    ADD CONSTRAINT fk_rails_28212d8658 FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE;


--
-- Name: fk_rails_390f731901; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_economic_activity_entries
    ADD CONSTRAINT fk_rails_390f731901 FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE;


--
-- Name: fk_rails_4005e2af52; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_alternate_name_entries
    ADD CONSTRAINT fk_rails_4005e2af52 FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE;


--
-- Name: fk_rails_48a2a0edd8; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_equity_entries
    ADD CONSTRAINT fk_rails_48a2a0edd8 FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE;


--
-- Name: fk_rails_4b0656a8ad; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_share_entries
    ADD CONSTRAINT fk_rails_4b0656a8ad FOREIGN KEY (share_type_id) REFERENCES share_types(id);


--
-- Name: fk_rails_508997d9f2; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_share_entries
    ADD CONSTRAINT fk_rails_508997d9f2 FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE;


--
-- Name: fk_rails_6cef665c99; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_legal_status_entries
    ADD CONSTRAINT fk_rails_6cef665c99 FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE;


--
-- Name: fk_rails_72a67bd06f; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_statutory_entries
    ADD CONSTRAINT fk_rails_72a67bd06f FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE;


--
-- Name: fk_rails_7868457a85; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT fk_rails_7868457a85 FOREIGN KEY (esa2010_code_id) REFERENCES esa2010_codes(id);


--
-- Name: fk_rails_789033779b; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_address_entries
    ADD CONSTRAINT fk_rails_789033779b FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE;


--
-- Name: fk_rails_78ea181ad6; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_authorization_entries
    ADD CONSTRAINT fk_rails_78ea181ad6 FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE;


--
-- Name: fk_rails_8229555cd0; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_deposit_entries
    ADD CONSTRAINT fk_rails_8229555cd0 FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE;


--
-- Name: fk_rails_94f387014a; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_statutory_entries
    ADD CONSTRAINT fk_rails_94f387014a FOREIGN KEY (stakeholder_type_id) REFERENCES stakeholder_types(id);


--
-- Name: fk_rails_9bb9d00968; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_predecessor_entries
    ADD CONSTRAINT fk_rails_9bb9d00968 FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE;


--
-- Name: fk_rails_b9d1486d04; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_stakeholder_entries
    ADD CONSTRAINT fk_rails_b9d1486d04 FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE;


--
-- Name: fk_rails_c704e079d2; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_share_entries
    ADD CONSTRAINT fk_rails_c704e079d2 FOREIGN KEY (share_form_id) REFERENCES share_forms(id);


--
-- Name: fk_rails_d0211d6167; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_legal_form_entries
    ADD CONSTRAINT fk_rails_d0211d6167 FOREIGN KEY (legal_form_id) REFERENCES legal_forms(id);


--
-- Name: fk_rails_d4e3e4bde0; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_successor_entries
    ADD CONSTRAINT fk_rails_d4e3e4bde0 FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE;


--
-- Name: fk_rails_d551f8828e; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_identifier_entries
    ADD CONSTRAINT fk_rails_d551f8828e FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE;


--
-- Name: fk_rails_d575a47b40; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT fk_rails_d575a47b40 FOREIGN KEY (main_activity_code_id) REFERENCES main_activity_codes(id);


--
-- Name: fk_rails_df1f7464af; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_stakeholder_entries
    ADD CONSTRAINT fk_rails_df1f7464af FOREIGN KEY (stakeholder_type_id) REFERENCES stakeholder_types(id);


--
-- Name: fk_rails_fbdd6d9c68; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY organization_legal_form_entries
    ADD CONSTRAINT fk_rails_fbdd6d9c68 FOREIGN KEY (organization_id) REFERENCES organizations(id) ON DELETE CASCADE;


SET search_path = ruz, pg_catalog;

--
-- Name: fk_rails_07ed14320c; Type: FK CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY accounting_entities
    ADD CONSTRAINT fk_rails_07ed14320c FOREIGN KEY (municipality_id) REFERENCES municipalities(id);


--
-- Name: fk_rails_38ebf8d996; Type: FK CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY accounting_entities
    ADD CONSTRAINT fk_rails_38ebf8d996 FOREIGN KEY (region_id) REFERENCES regions(id);


--
-- Name: fk_rails_6a4ade2d22; Type: FK CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY accounting_entities
    ADD CONSTRAINT fk_rails_6a4ade2d22 FOREIGN KEY (legal_form_id) REFERENCES legal_forms(id);


--
-- Name: fk_rails_97883ca5ad; Type: FK CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY accounting_entities
    ADD CONSTRAINT fk_rails_97883ca5ad FOREIGN KEY (organization_size_id) REFERENCES organization_sizes(id);


--
-- Name: fk_rails_ad69be1cc0; Type: FK CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY accounting_entities
    ADD CONSTRAINT fk_rails_ad69be1cc0 FOREIGN KEY (ownership_type_id) REFERENCES ownership_types(id);


--
-- Name: fk_rails_b859c65541; Type: FK CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY districts
    ADD CONSTRAINT fk_rails_b859c65541 FOREIGN KEY (region_id) REFERENCES regions(id) ON DELETE CASCADE;


--
-- Name: fk_rails_e8d3e563e0; Type: FK CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY accounting_entities
    ADD CONSTRAINT fk_rails_e8d3e563e0 FOREIGN KEY (district_id) REFERENCES districts(id);


--
-- Name: fk_rails_f37ffa746c; Type: FK CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY accounting_entities
    ADD CONSTRAINT fk_rails_f37ffa746c FOREIGN KEY (sk_nace_category_id) REFERENCES sk_nace_categories(id);


SET search_path = socpoist, pg_catalog;

--
-- Name: fk_rails_48ebd9b66f; Type: FK CONSTRAINT; Schema: socpoist; Owner: -
--

ALTER TABLE ONLY debt_entries
    ADD CONSTRAINT fk_rails_48ebd9b66f FOREIGN KEY (debtor_id) REFERENCES debtors(id);


--
-- Name: fk_rails_b9c185bd49; Type: FK CONSTRAINT; Schema: socpoist; Owner: -
--

ALTER TABLE ONLY debt_entries
    ADD CONSTRAINT fk_rails_b9c185bd49 FOREIGN KEY (list_id) REFERENCES debts_lists(id);


--
-- Name: fk_rails_c7f63375a4; Type: FK CONSTRAINT; Schema: socpoist; Owner: -
--

ALTER TABLE ONLY debt_ranges
    ADD CONSTRAINT fk_rails_c7f63375a4 FOREIGN KEY (debtor_id) REFERENCES debtors(id);


SET search_path = vvo, pg_catalog;

--
-- Name: fk_rails_189dae0237; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY notices
    ADD CONSTRAINT fk_rails_189dae0237 FOREIGN KEY (raw_notice_id) REFERENCES raw_notices(id);


--
-- Name: fk_rails_2965d55cab; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY raw_notices
    ADD CONSTRAINT fk_rails_2965d55cab FOREIGN KEY (notice_type_id) REFERENCES notice_types(id);


--
-- Name: fk_rails_56618ccf4f; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY notice_suppliers
    ADD CONSTRAINT fk_rails_56618ccf4f FOREIGN KEY (notice_id) REFERENCES notices(id) ON DELETE CASCADE;


--
-- Name: fk_rails_6154057566; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY notices
    ADD CONSTRAINT fk_rails_6154057566 FOREIGN KEY (notice_type_id) REFERENCES notice_types(id);


--
-- Name: fk_rails_7044e59199; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY notices
    ADD CONSTRAINT fk_rails_7044e59199 FOREIGN KEY (contracting_authority_id) REFERENCES contracting_authorities(id);


--
-- Name: fk_rails_86b5e17ff4; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY notices
    ADD CONSTRAINT fk_rails_86b5e17ff4 FOREIGN KEY (bulletin_issue_id) REFERENCES bulletin_issues(id);


--
-- Name: fk_rails_b442791ca1; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY notices
    ADD CONSTRAINT fk_rails_b442791ca1 FOREIGN KEY (contract_id) REFERENCES contracts(id);


--
-- Name: fk_rails_b5b2f1b1b2; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY notices
    ADD CONSTRAINT fk_rails_b5b2f1b1b2 FOREIGN KEY (procedure_type_id) REFERENCES procedure_types(id);


--
-- Name: fk_rails_c0eda68529; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY raw_notices
    ADD CONSTRAINT fk_rails_c0eda68529 FOREIGN KEY (bulletin_issue_id) REFERENCES bulletin_issues(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES ('20160228204654'), ('20160304144454'), ('20160304151009'), ('20160304210816'), ('20160304211624'), ('20160304213306'), ('20160305001135'), ('20160305084653'), ('20160307215611'), ('20160308210325'), ('20160309115526'), ('20160309120612'), ('20160429141807'), ('20160506091443'), ('20160506115555'), ('20160506135302'), ('20160506141328'), ('20160506145648'), ('20160506201551'), ('20160506201735'), ('20160506204302'), ('20160509085025'), ('20160509091003'), ('20160509123118'), ('20160509133921'), ('20160509142808'), ('20160509144034'), ('20160509202636'), ('20160509210342'), ('20160509211550'), ('20160509213609'), ('20160510141343'), ('20160511143847'), ('20160511174234'), ('20160512140751'), ('20160512141004'), ('20160512142220'), ('20160512163333'), ('20160512205002'), ('20160512222238'), ('20160512223007'), ('20160513090321'), ('20160513093332'), ('20160513100718'), ('20160513102554'), ('20160513111743'), ('20160513115940'), ('20160513123028'), ('20160513144927'), ('20160515073133'), ('20160515073826'), ('20160515074954'), ('20160516152548'), ('20160516153747'), ('20160516194853'), ('20160517092857'), ('20160517101512'), ('20160517102123'), ('20160517103922'), ('20160517110722'), ('20160517111053'), ('20160517113734'), ('20160517115800'), ('20160517125158'), ('20160517211611'), ('20160519200530'), ('20160520141455'), ('20160520142114'), ('20160520151100'), ('20160523062919'), ('20160523111212'), ('20160523134144'), ('20160523144401'), ('20160523150519'), ('20160524145856'), ('20160524155401'), ('20160524192650'), ('20160524192805'), ('20160524192859'), ('20160524195216'), ('20160524210510'), ('20160524210952'), ('20160524213930'), ('20160524221026'), ('20160524223055'), ('20160525105622'), ('20160525122831'), ('20160525202154'), ('20160525202912'), ('20160525203905'), ('20160603134420'), ('20160603134547'), ('20160603134923'), ('20160603201156'), ('20160603201256'), ('20160603202143'), ('20160604214151'), ('20160604222116'), ('20160605101834'), ('20160605192328'), ('20160605192524'), ('20160605193318'), ('20160605211444'), ('20160605211612'), ('20160607183913'), ('20160609161856'), ('20160609175034'), ('20160609183417'), ('20160610124301'), ('20160613145120'), ('20160613161922'), ('20160614082527'), ('20160615165505'), ('20160622105806'), ('20160622112911'), ('20160622113449'), ('20160622113649'), ('20160622114653'), ('20160622115927'), ('20160622142531'), ('20160622143425'), ('20160622144845'), ('20160622202723'), ('20160622231145'), ('20160623135959'), ('20160623150755'), ('20160624113525'), ('20160629144830'), ('20160629151520'), ('20160629201243'), ('20160629221305'), ('20160629221424'), ('20160629221800'), ('20160706111638'), ('20160707212141'), ('20160708105151'), ('20160708121934'), ('20160708140307'), ('20160708155010'), ('20160708172910'), ('20160708173417'), ('20160711125108'), ('20160711151815'), ('20160718092226'), ('20160718092417'), ('20160718094712'), ('20160719123714'), ('20160720085630'), ('20160721091930'), ('20160721134515'), ('20160721144047'), ('20160721151057'), ('20160721153228'), ('20160721153817'), ('20160721160533'), ('20160721160901'), ('20160721162155'), ('20160722151335'), ('20160722151503'), ('20160727150803'), ('20160803124909'), ('20160803142910'), ('20160803205746'), ('20160808125148'), ('20160809092452'), ('20160809095256'), ('20160809115742'), ('20160809120030'), ('20160811100934'), ('20160811102028'), ('20160811103149'), ('20160811104830'), ('20160811111706'), ('20160811112312'), ('20160811121506'), ('20160811124755'), ('20160812133817'), ('20160812135204'), ('20160812135415'), ('20160812140655'), ('20160812142245'), ('20160812142416'), ('20160812202908'), ('20160812215714'), ('20160815130928'), ('20160818110211'), ('20160818110621'), ('20160818135739'), ('20160825110839'), ('20160825120623'), ('20160830120608'), ('20160830121920'), ('20160928120044'), ('20160928123138'), ('20160928213723'), ('20160929120951'), ('20160929121253'), ('20160929121400'), ('20160929124430'), ('20160929124817'), ('20160929125059'), ('20160929125508'), ('20160930085831'), ('20160930102048'), ('20161010145325'), ('20161010145425'), ('20161010205914'), ('20161010220918'), ('20161010221017'), ('20161010224003'), ('20161010224400'), ('20161010225250'), ('20161011210352'), ('20161011214757'), ('20161012110655'), ('20161012135758'), ('20161012150803'), ('20161012150927'), ('20161012195055'), ('20161012195151'), ('20161012210141'), ('20161012210225'), ('20161012212459'), ('20161012212552');


