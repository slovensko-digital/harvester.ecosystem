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
-- Name: fs_to_datahub; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA fs_to_datahub;


--
-- Name: itms; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA itms;


--
-- Name: metais; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA metais;


--
-- Name: ov; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA ov;


--
-- Name: rpo; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA rpo;


--
-- Name: rpo_to_datahub; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA rpo_to_datahub;


--
-- Name: ruz; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA ruz;


--
-- Name: ruz_to_datahub; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA ruz_to_datahub;


--
-- Name: socpoist; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA socpoist;


--
-- Name: upvs; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA upvs;


--
-- Name: vszp; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA vszp;


--
-- Name: vvo; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA vvo;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: attachments; Type: TABLE; Schema: crz; Owner: -
--

CREATE TABLE crz.attachments (
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

CREATE SEQUENCE crz.attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: crz; Owner: -
--

ALTER SEQUENCE crz.attachments_id_seq OWNED BY crz.attachments.id;


--
-- Name: contracts; Type: TABLE; Schema: crz; Owner: -
--

CREATE TABLE crz.contracts (
    id integer NOT NULL,
    contract_identifier character varying,
    contracting_authority_name character varying,
    contracting_authority_formatted_address character varying,
    contracting_authority_cin_raw character varying,
    supplier_name character varying,
    supplier_formatted_address character varying,
    supplier_cin_raw character varying,
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
    updated_at timestamp without time zone NOT NULL,
    contracting_authority_cin bigint,
    supplier_cin bigint,
    procurement_url character varying
);


--
-- Name: contracts_id_seq; Type: SEQUENCE; Schema: crz; Owner: -
--

CREATE SEQUENCE crz.contracts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contracts_id_seq; Type: SEQUENCE OWNED BY; Schema: crz; Owner: -
--

ALTER SEQUENCE crz.contracts_id_seq OWNED BY crz.contracts.id;


--
-- Name: departments; Type: TABLE; Schema: crz; Owner: -
--

CREATE TABLE crz.departments (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: departments_id_seq; Type: SEQUENCE; Schema: crz; Owner: -
--

CREATE SEQUENCE crz.departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: crz; Owner: -
--

ALTER SEQUENCE crz.departments_id_seq OWNED BY crz.departments.id;


--
-- Name: corporate_bodies; Type: TABLE; Schema: datahub; Owner: -
--

CREATE TABLE datahub.corporate_bodies (
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
    registration_number character varying,
    formatted_street character varying,
    street_number character varying,
    main_corporate_body_id integer
);


--
-- Name: corporate_bodies_id_seq; Type: SEQUENCE; Schema: datahub; Owner: -
--

CREATE SEQUENCE datahub.corporate_bodies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: corporate_bodies_id_seq; Type: SEQUENCE OWNED BY; Schema: datahub; Owner: -
--

ALTER SEQUENCE datahub.corporate_bodies_id_seq OWNED BY datahub.corporate_bodies.id;


--
-- Name: income_tax_subjects; Type: TABLE; Schema: fs; Owner: -
--

CREATE TABLE fs.income_tax_subjects (
    id integer NOT NULL,
    cin bigint,
    tin bigint,
    name character varying NOT NULL,
    municipality character varying,
    postal_code character varying,
    street character varying,
    country character varying,
    effective_to date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: income_tax_subjects_id_seq; Type: SEQUENCE; Schema: fs; Owner: -
--

CREATE SEQUENCE fs.income_tax_subjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: income_tax_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: fs; Owner: -
--

ALTER SEQUENCE fs.income_tax_subjects_id_seq OWNED BY fs.income_tax_subjects.id;


--
-- Name: tax_liabilities; Type: TABLE; Schema: fs; Owner: -
--

CREATE TABLE fs.tax_liabilities (
    id integer NOT NULL,
    cin bigint,
    tin bigint NOT NULL,
    vatin character varying,
    name character varying NOT NULL,
    street character varying,
    municipality character varying,
    postal_code character varying,
    country character varying,
    taxable_period character varying NOT NULL,
    excessive_deduction numeric NOT NULL,
    own_tax_liability numeric NOT NULL,
    effective_to date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: tax_liabilities_id_seq; Type: SEQUENCE; Schema: fs; Owner: -
--

CREATE SEQUENCE fs.tax_liabilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tax_liabilities_id_seq; Type: SEQUENCE OWNED BY; Schema: fs; Owner: -
--

ALTER SEQUENCE fs.tax_liabilities_id_seq OWNED BY fs.tax_liabilities.id;


--
-- Name: vat_subjects; Type: TABLE; Schema: fs; Owner: -
--

CREATE TABLE fs.vat_subjects (
    id integer NOT NULL,
    vatin character varying NOT NULL,
    name character varying NOT NULL,
    municipality character varying,
    postal_code character varying,
    street character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    registration_kind character varying,
    effective_to date,
    cin bigint,
    country character varying,
    registration_kind_updated_on date,
    registered_on date
);


--
-- Name: vat_subjects_id_seq; Type: SEQUENCE; Schema: fs; Owner: -
--

CREATE SEQUENCE fs.vat_subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: fs; Owner: -
--

ALTER SEQUENCE fs.vat_subjects_id_seq OWNED BY fs.vat_subjects.id;


--
-- Name: income_tax_subject_to_corporate_bodies; Type: TABLE; Schema: fs_to_datahub; Owner: -
--

CREATE TABLE fs_to_datahub.income_tax_subject_to_corporate_bodies (
    id integer NOT NULL,
    corporate_body_id integer,
    income_tax_subject_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    done boolean DEFAULT false NOT NULL
);


--
-- Name: income_tax_subject_to_corporate_bodies_id_seq; Type: SEQUENCE; Schema: fs_to_datahub; Owner: -
--

CREATE SEQUENCE fs_to_datahub.income_tax_subject_to_corporate_bodies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: income_tax_subject_to_corporate_bodies_id_seq; Type: SEQUENCE OWNED BY; Schema: fs_to_datahub; Owner: -
--

ALTER SEQUENCE fs_to_datahub.income_tax_subject_to_corporate_bodies_id_seq OWNED BY fs_to_datahub.income_tax_subject_to_corporate_bodies.id;


--
-- Name: tax_liability_to_corporate_bodies; Type: TABLE; Schema: fs_to_datahub; Owner: -
--

CREATE TABLE fs_to_datahub.tax_liability_to_corporate_bodies (
    id integer NOT NULL,
    corporate_body_id integer,
    tax_liability_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    done boolean DEFAULT false NOT NULL
);


--
-- Name: tax_liability_to_corporate_bodies_id_seq; Type: SEQUENCE; Schema: fs_to_datahub; Owner: -
--

CREATE SEQUENCE fs_to_datahub.tax_liability_to_corporate_bodies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tax_liability_to_corporate_bodies_id_seq; Type: SEQUENCE OWNED BY; Schema: fs_to_datahub; Owner: -
--

ALTER SEQUENCE fs_to_datahub.tax_liability_to_corporate_bodies_id_seq OWNED BY fs_to_datahub.tax_liability_to_corporate_bodies.id;


--
-- Name: vat_subject_to_corporate_bodies; Type: TABLE; Schema: fs_to_datahub; Owner: -
--

CREATE TABLE fs_to_datahub.vat_subject_to_corporate_bodies (
    id integer NOT NULL,
    corporate_body_id integer,
    vat_subject_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    done boolean DEFAULT false NOT NULL
);


--
-- Name: vat_subject_to_corporate_bodies_id_seq; Type: SEQUENCE; Schema: fs_to_datahub; Owner: -
--

CREATE SEQUENCE fs_to_datahub.vat_subject_to_corporate_bodies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vat_subject_to_corporate_bodies_id_seq; Type: SEQUENCE OWNED BY; Schema: fs_to_datahub; Owner: -
--

ALTER SEQUENCE fs_to_datahub.vat_subject_to_corporate_bodies_id_seq OWNED BY fs_to_datahub.vat_subject_to_corporate_bodies.id;


--
-- Name: aktivity; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.aktivity (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    datum_konca_planovany timestamp without time zone,
    datum_konca_skutocny timestamp without time zone,
    datum_zaciatku_planovany timestamp without time zone,
    datum_zaciatku_skutocny timestamp without time zone,
    kod character varying,
    nazov character varying,
    subjekt_id integer,
    typ_aktivity_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: aktivity_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.aktivity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: aktivity_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.aktivity_id_seq OWNED BY itms.aktivity.id;


--
-- Name: ciselniky; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.ciselniky (
    id integer NOT NULL,
    ciselnik_kod integer NOT NULL,
    nazov character varying,
    popis character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: ciselniky_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.ciselniky_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ciselniky_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.ciselniky_id_seq OWNED BY itms.ciselniky.id;


--
-- Name: deklarovane_vydavky; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.deklarovane_vydavky (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    zop_id integer NOT NULL,
    datum_uhrady timestamp without time zone,
    dph numeric,
    druh_vydavku character varying,
    ekonomicka_klasifikacia character varying,
    funkcna_klasifikacia character varying,
    id_polozky_dokladu integer,
    investicna_akcia_pj character varying,
    investicna_akcia_prijimatela character varying,
    nazov character varying,
    polozka_rozpoctu_id integer,
    poradove_cislo integer,
    suma_ziadana_na_preplatenie numeric,
    suma_schvalena_na_preplatenie numeric,
    typ_vydavku character varying,
    uctovny_doklad_id integer,
    verejne_obstaravanie_id integer,
    vyska_bez_dph numeric,
    zmluva_verejne_obstaravanie_id integer
);


--
-- Name: deklarovane_vydavky_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.deklarovane_vydavky_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: deklarovane_vydavky_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.deklarovane_vydavky_id_seq OWNED BY itms.deklarovane_vydavky.id;


--
-- Name: deklarovane_vydavky_sumy_neschvalene_na_preplatenie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.deklarovane_vydavky_sumy_neschvalene_na_preplatenie (
    id integer NOT NULL,
    deklarovany_vydavok_id integer NOT NULL,
    druh_neschvalenej_sumy character varying,
    suma_neschvalena numeric
);


--
-- Name: deklarovane_vydavky_sumy_neschvalene_na_preplatenie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.deklarovane_vydavky_sumy_neschvalene_na_preplatenie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: deklarovane_vydavky_sumy_neschvalene_na_preplatenie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.deklarovane_vydavky_sumy_neschvalene_na_preplatenie_id_seq OWNED BY itms.deklarovane_vydavky_sumy_neschvalene_na_preplatenie.id;


--
-- Name: deklarovane_vydavky_sumy_neziadane_na_preplatenie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.deklarovane_vydavky_sumy_neziadane_na_preplatenie (
    id integer NOT NULL,
    deklarovany_vydavok_id integer NOT NULL,
    druh_neziadanej_sumy character varying,
    suma_neziadana numeric
);


--
-- Name: deklarovane_vydavky_sumy_neziadane_na_preplatenie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.deklarovane_vydavky_sumy_neziadane_na_preplatenie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: deklarovane_vydavky_sumy_neziadane_na_preplatenie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.deklarovane_vydavky_sumy_neziadane_na_preplatenie_id_seq OWNED BY itms.deklarovane_vydavky_sumy_neziadane_na_preplatenie.id;


--
-- Name: dodavatelia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.dodavatelia (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    itms_created_at timestamp without time zone,
    itms_updated_at timestamp without time zone,
    dic character varying,
    ico character varying,
    ine_identifikacne_cislo character varying,
    nazov character varying,
    obec_id integer,
    psc character varying,
    stat_id integer,
    typ_ineho_identifikacneho_cisla_id integer,
    ulica character varying,
    ulica_cislo character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: dodavatelia_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.dodavatelia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dodavatelia_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.dodavatelia_id_seq OWNED BY itms.dodavatelia.id;


--
-- Name: hodnoty_ciselnikov; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.hodnoty_ciselnikov (
    id integer NOT NULL,
    ciselnik_id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    kod character varying,
    kod_zdroj character varying,
    nazov character varying,
    platnost_do timestamp without time zone,
    platnost_od timestamp without time zone,
    popis character varying
);


--
-- Name: hodnoty_ciselnikov_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.hodnoty_ciselnikov_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hodnoty_ciselnikov_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.hodnoty_ciselnikov_id_seq OWNED BY itms.hodnoty_ciselnikov.id;


--
-- Name: intenzity; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.intenzity (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    nazov character varying,
    subjekt_id integer,
    zdroj_eu_id integer,
    zdroj_pr_id integer,
    zdroj_sr_id integer,
    zdroj_vz_id integer,
    zdroj_yei_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: intenzity_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.intenzity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: intenzity_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.intenzity_id_seq OWNED BY itms.intenzity.id;


--
-- Name: intenzity_zdroje; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.intenzity_zdroje (
    id integer NOT NULL,
    cerpanie_eu numeric,
    cerpanie_ro numeric,
    percento numeric,
    suma_zazmluvnena numeric,
    zdroj_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: intenzity_zdroje_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.intenzity_zdroje_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: intenzity_zdroje_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.intenzity_zdroje_id_seq OWNED BY itms.intenzity_zdroje.id;


--
-- Name: konkretne_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.konkretne_ciele (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    itms_created_at timestamp without time zone,
    itms_updated_at timestamp without time zone,
    fond_id integer,
    kategoria_regionov_id integer,
    kod character varying,
    nazov character varying,
    prioritna_os_id integer,
    technicka_asistencia boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: konkretne_ciele_hodnoty_ciselnikov; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.konkretne_ciele_hodnoty_ciselnikov (
    id integer NOT NULL,
    konkretny_ciel_id integer NOT NULL,
    hodnota_ciselnika_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: konkretne_ciele_hodnoty_ciselnikov_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.konkretne_ciele_hodnoty_ciselnikov_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: konkretne_ciele_hodnoty_ciselnikov_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.konkretne_ciele_hodnoty_ciselnikov_id_seq OWNED BY itms.konkretne_ciele_hodnoty_ciselnikov.id;


--
-- Name: konkretne_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.konkretne_ciele_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: konkretne_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.konkretne_ciele_id_seq OWNED BY itms.konkretne_ciele.id;


--
-- Name: konkretne_ciele_typy_aktivit; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.konkretne_ciele_typy_aktivit (
    id integer NOT NULL,
    konkretny_ciel_id integer NOT NULL,
    typ_aktivity_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: konkretne_ciele_typy_aktivit_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.konkretne_ciele_typy_aktivit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: konkretne_ciele_typy_aktivit_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.konkretne_ciele_typy_aktivit_id_seq OWNED BY itms.konkretne_ciele_typy_aktivit.id;


--
-- Name: miesta_realizacie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.miesta_realizacie (
    id integer NOT NULL,
    nuts_3_id integer,
    nuts_4_id integer,
    nuts_5_id integer,
    stat_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: miesta_realizacie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.miesta_realizacie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: miesta_realizacie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.miesta_realizacie_id_seq OWNED BY itms.miesta_realizacie.id;


--
-- Name: monitorovacie_terminy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.monitorovacie_terminy (
    id integer NOT NULL,
    projekt_id integer NOT NULL,
    datum_predlozenia_najneskorsi timestamp without time zone,
    poradove_cislo integer,
    termin_monitorovania timestamp without time zone,
    typ_monitorovacej_spravy character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: monitorovacie_terminy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.monitorovacie_terminy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: monitorovacie_terminy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.monitorovacie_terminy_id_seq OWNED BY itms.monitorovacie_terminy.id;


--
-- Name: nezrovnalosti; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.nezrovnalosti (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    itms_created_at timestamp without time zone,
    itms_updated_at timestamp without time zone,
    administrativny_stav_id integer,
    celkova_suma_nezrovnalosti numeric,
    celkova_suma_nezrovnalosti_zdroj_eu numeric,
    celkova_suma_nezrovnalosti_zdroj_pr numeric,
    celkova_suma_nezrovnalosti_zdroj_sr numeric,
    datum_prvej_informacie timestamp without time zone,
    datum_zistenia timestamp without time zone,
    dlznik_id integer,
    dopad_na_rozpocet_eu character varying,
    druh_nezrovnalosti character varying,
    financny_stav_id integer,
    hlavny_typ_nezrovnalosti_id integer,
    je_systemova boolean,
    kod character varying,
    konkretny_ciel_id integer,
    operacny_program_id integer,
    penale numeric,
    pokuty numeric,
    popis character varying,
    pouzite_praktiky character varying,
    prioritna_os_id integer,
    projekt_id integer,
    projekt_v_priprave_alebo_nerealizovany character varying,
    stanovisko_dlznika character varying,
    stanovisko_organu character varying,
    stav character varying,
    suma_na_vymahanie numeric,
    suma_na_vymahanie_zdroj_eu numeric,
    suma_na_vymahanie_zdroj_pr numeric,
    suma_na_vymahanie_zdroj_sr numeric,
    vratena_suma numeric,
    vratena_suma_zdroj_eu numeric,
    vratena_suma_zdroj_pr numeric,
    vratena_suma_zdroj_sr numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nezrovnalosti_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.nezrovnalosti_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nezrovnalosti_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.nezrovnalosti_id_seq OWNED BY itms.nezrovnalosti.id;


--
-- Name: nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost (
    id integer NOT NULL,
    nezrovnalost_id integer,
    subjekt_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost_id_seq OWNED BY itms.nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost.id;


--
-- Name: nezrovnalosti_subjekty_ktore_zistili_nezrovnalost; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.nezrovnalosti_subjekty_ktore_zistili_nezrovnalost (
    id integer NOT NULL,
    nezrovnalost_id integer,
    subjekt_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nezrovnalosti_subjekty_ktore_zistili_nezrovnalost_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.nezrovnalosti_subjekty_ktore_zistili_nezrovnalost_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nezrovnalosti_subjekty_ktore_zistili_nezrovnalost_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.nezrovnalosti_subjekty_ktore_zistili_nezrovnalost_id_seq OWNED BY itms.nezrovnalosti_subjekty_ktore_zistili_nezrovnalost.id;


--
-- Name: nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie (
    id integer NOT NULL,
    nezrovnalost_id integer,
    subjekt_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie_id_seq OWNED BY itms.nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie.id;


--
-- Name: nezrovnalosti_suvisiace_nezrovnalosti; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.nezrovnalosti_suvisiace_nezrovnalosti (
    id integer NOT NULL,
    nezrovnalost_id integer,
    suvisiaca_nezrovnalost_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nezrovnalosti_suvisiace_nezrovnalosti_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.nezrovnalosti_suvisiace_nezrovnalosti_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nezrovnalosti_suvisiace_nezrovnalosti_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.nezrovnalosti_suvisiace_nezrovnalosti_id_seq OWNED BY itms.nezrovnalosti_suvisiace_nezrovnalosti.id;


--
-- Name: nezrovnalosti_suvisiace_pohladavkove_doklady; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.nezrovnalosti_suvisiace_pohladavkove_doklady (
    id integer NOT NULL,
    nezrovnalost_id integer,
    pohladavkovy_doklad_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nezrovnalosti_suvisiace_pohladavkove_doklady_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.nezrovnalosti_suvisiace_pohladavkove_doklady_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nezrovnalosti_suvisiace_pohladavkove_doklady_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.nezrovnalosti_suvisiace_pohladavkove_doklady_id_seq OWNED BY itms.nezrovnalosti_suvisiace_pohladavkove_doklady.id;


--
-- Name: nezrovnalosti_suvisiace_verejne_obstaravania; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.nezrovnalosti_suvisiace_verejne_obstaravania (
    id integer NOT NULL,
    nezrovnalost_id integer NOT NULL,
    verejne_obstaravanie_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nezrovnalosti_suvisiace_verejne_obstaravania_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.nezrovnalosti_suvisiace_verejne_obstaravania_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nezrovnalosti_suvisiace_verejne_obstaravania_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.nezrovnalosti_suvisiace_verejne_obstaravania_id_seq OWNED BY itms.nezrovnalosti_suvisiace_verejne_obstaravania.id;


--
-- Name: nezrovnalosti_suvisiace_zop; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.nezrovnalosti_suvisiace_zop (
    id integer NOT NULL,
    nezrovnalost_id integer NOT NULL,
    zop_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nezrovnalosti_suvisiace_zop_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.nezrovnalosti_suvisiace_zop_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nezrovnalosti_suvisiace_zop_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.nezrovnalosti_suvisiace_zop_id_seq OWNED BY itms.nezrovnalosti_suvisiace_zop.id;


--
-- Name: nezrovnalosti_typy_nezrovnalosti; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.nezrovnalosti_typy_nezrovnalosti (
    id integer NOT NULL,
    nezrovnalost_id integer,
    kod_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nezrovnalosti_typy_nezrovnalosti_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.nezrovnalosti_typy_nezrovnalosti_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nezrovnalosti_typy_nezrovnalosti_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.nezrovnalosti_typy_nezrovnalosti_id_seq OWNED BY itms.nezrovnalosti_typy_nezrovnalosti.id;


--
-- Name: nuts_kody; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.nuts_kody (
    id integer NOT NULL,
    gps_lat numeric,
    gps_lon numeric,
    hodnota_nuts_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nuts_kody_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.nuts_kody_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nuts_kody_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.nuts_kody_id_seq OWNED BY itms.nuts_kody.id;


--
-- Name: operacne_programy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.operacne_programy (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    itms_created_at timestamp without time zone,
    itms_updated_at timestamp without time zone,
    celkova_financna_alokacia numeric,
    hlavna_alokacia numeric,
    kod character varying,
    kod_cci character varying,
    nazov character varying,
    skratka character varying,
    subjekt_id integer,
    vykonnostna_rezerva numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: operacne_programy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.operacne_programy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: operacne_programy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.operacne_programy_id_seq OWNED BY itms.operacne_programy.id;


--
-- Name: organizacne_zlozky; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.organizacne_zlozky (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    adresa character varying,
    nazov character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: organizacne_zlozky_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.organizacne_zlozky_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizacne_zlozky_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.organizacne_zlozky_id_seq OWNED BY itms.organizacne_zlozky.id;


--
-- Name: osoby; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.osoby (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    email character varying,
    meno character varying,
    meno_uplne character varying,
    priezvisko character varying,
    telefon character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: osoby_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.osoby_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: osoby_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.osoby_id_seq OWNED BY itms.osoby.id;


--
-- Name: pohladavkove_doklady; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.pohladavkove_doklady (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    itms_created_at timestamp without time zone,
    itms_updated_at timestamp without time zone,
    datum_splatnosti timestamp without time zone,
    datum_vzniku timestamp without time zone,
    dlznik_id integer,
    dopad_na_rozpocet_eu character varying,
    dovod_vratenia_id integer,
    druh character varying,
    kod character varying,
    konkretny_ciel_id integer,
    nezrovnalost_id integer,
    prioritna_os_id integer,
    projekt_id integer,
    stav character varying,
    subjekt_zodpovedny_za_vymahanie_id integer,
    suma_na_vratenie numeric,
    suma_na_vratenie_zdroj_eu numeric,
    suma_na_vratenie_zdroj_pr numeric,
    suma_na_vratenie_zdroj_sr numeric,
    typ character varying,
    vracia_sa_do_rozpoctu_projektu boolean,
    vratena_suma numeric,
    vratena_suma_zdroj_eu numeric,
    vratena_suma_zdroj_pr numeric,
    vratena_suma_zdroj_sr numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pohladavkove_doklady_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.pohladavkove_doklady_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pohladavkove_doklady_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.pohladavkove_doklady_id_seq OWNED BY itms.pohladavkove_doklady.id;


--
-- Name: pohladavkove_doklady_suvisiace_verejne_obstaravania; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.pohladavkove_doklady_suvisiace_verejne_obstaravania (
    id integer NOT NULL,
    pohladavkovy_doklad_id integer NOT NULL,
    verejne_obstaravanie_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pohladavkove_doklady_suvisiace_verejne_obstaravania_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.pohladavkove_doklady_suvisiace_verejne_obstaravania_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pohladavkove_doklady_suvisiace_verejne_obstaravania_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.pohladavkove_doklady_suvisiace_verejne_obstaravania_id_seq OWNED BY itms.pohladavkove_doklady_suvisiace_verejne_obstaravania.id;


--
-- Name: pohladavkove_doklady_suvisiace_zop; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.pohladavkove_doklady_suvisiace_zop (
    id integer NOT NULL,
    pohladavkovy_doklad_id integer NOT NULL,
    zop_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pohladavkove_doklady_suvisiace_zop_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.pohladavkove_doklady_suvisiace_zop_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pohladavkove_doklady_suvisiace_zop_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.pohladavkove_doklady_suvisiace_zop_id_seq OWNED BY itms.pohladavkove_doklady_suvisiace_zop.id;


--
-- Name: polozky_rozpoctu; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.polozky_rozpoctu (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    aktivita_id integer,
    intenzita_id integer,
    skupina_vydavkov_id integer,
    subjekt_id integer,
    viazana_suma numeric,
    volne_prostriedky numeric,
    vratena_suma numeric,
    zazmluvnena_suma numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: polozky_rozpoctu_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.polozky_rozpoctu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: polozky_rozpoctu_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.polozky_rozpoctu_id_seq OWNED BY itms.polozky_rozpoctu.id;


--
-- Name: prioritne_osi; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.prioritne_osi (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    itms_created_at timestamp without time zone,
    itms_updated_at timestamp without time zone,
    celkova_financna_alokacia numeric,
    hlavna_alokacia numeric,
    kod character varying,
    nazov character varying,
    operacny_program_id integer,
    vykonnostna_rezerva numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: prioritne_osi_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.prioritne_osi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: prioritne_osi_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.prioritne_osi_id_seq OWNED BY itms.prioritne_osi.id;


--
-- Name: projektove_ukazovatele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.projektove_ukazovatele (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    itms_created_at timestamp without time zone,
    itms_updated_at timestamp without time zone,
    definicia character varying,
    evidencia_podla_pohlavia boolean,
    kod character varying,
    merna_jednotka character varying,
    nazov character varying,
    platnost boolean,
    typ_vypoctu character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projektove_ukazovatele_casy_plnenia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.projektove_ukazovatele_casy_plnenia (
    id integer NOT NULL,
    projektovy_ukazovatel_id integer,
    kod_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projektove_ukazovatele_casy_plnenia_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.projektove_ukazovatele_casy_plnenia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projektove_ukazovatele_casy_plnenia_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.projektove_ukazovatele_casy_plnenia_id_seq OWNED BY itms.projektove_ukazovatele_casy_plnenia.id;


--
-- Name: projektove_ukazovatele_fondy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.projektove_ukazovatele_fondy (
    id integer NOT NULL,
    projektovy_ukazovatel_id integer,
    kod_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projektove_ukazovatele_fondy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.projektove_ukazovatele_fondy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projektove_ukazovatele_fondy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.projektove_ukazovatele_fondy_id_seq OWNED BY itms.projektove_ukazovatele_fondy.id;


--
-- Name: projektove_ukazovatele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.projektove_ukazovatele_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projektove_ukazovatele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.projektove_ukazovatele_id_seq OWNED BY itms.projektove_ukazovatele.id;


--
-- Name: projekty; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.projekty (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    itms_created_at timestamp without time zone,
    itms_updated_at timestamp without time zone,
    ekosystem_stav character varying,
    akronym character varying,
    cislo_zmluvy character varying,
    datum_konca_hlavnych_aktivit timestamp without time zone,
    datum_konca_realizacie timestamp without time zone,
    datum_platnosti_zmluvy timestamp without time zone,
    datum_ucinnosti_zmluvy timestamp without time zone,
    datum_zaciatku_hlavnych_aktivit timestamp without time zone,
    datum_zaciatku_realizacie timestamp without time zone,
    dlzka_celkova_hlavnych_aktivit integer,
    dlzka_celkova_projektu integer,
    kod character varying,
    nazov character varying,
    otvorena_zmena boolean,
    otvoreny_dodatok boolean,
    popis_projektu character varying,
    popis_situacie_po_realizacii character varying,
    popis_sposobu_realizacie character varying,
    popis_vychodiskovej_situacie character varying,
    popis_kapacity_prijimatela character varying,
    prijimatel_id integer,
    schvalena_zonfp_id integer,
    stav character varying,
    suma_celkova_projektov_generujucich_prijem numeric,
    suma_zazmluvnena numeric,
    suma_zazmluvnena_povodna numeric,
    url_adresa_zmluva character varying,
    vyzva_id integer,
    zameranie_projektu character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projekty_aktivity; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.projekty_aktivity (
    id integer NOT NULL,
    projekt_id integer NOT NULL,
    aktivita_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projekty_aktivity_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.projekty_aktivity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_aktivity_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.projekty_aktivity_id_seq OWNED BY itms.projekty_aktivity.id;


--
-- Name: projekty_formy_financovania; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.projekty_formy_financovania (
    id integer NOT NULL,
    projekt_id integer NOT NULL,
    forma_financovania_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projekty_formy_financovania_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.projekty_formy_financovania_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_formy_financovania_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.projekty_formy_financovania_id_seq OWNED BY itms.projekty_formy_financovania.id;


--
-- Name: projekty_hospodarske_cinnosti; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.projekty_hospodarske_cinnosti (
    id integer NOT NULL,
    projekt_id integer NOT NULL,
    hospodarska_cinnost_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projekty_hospodarske_cinnosti_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.projekty_hospodarske_cinnosti_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_hospodarske_cinnosti_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.projekty_hospodarske_cinnosti_id_seq OWNED BY itms.projekty_hospodarske_cinnosti.id;


--
-- Name: projekty_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.projekty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.projekty_id_seq OWNED BY itms.projekty.id;


--
-- Name: projekty_intenzity; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.projekty_intenzity (
    id integer NOT NULL,
    projekt_id integer NOT NULL,
    intenzita_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projekty_intenzity_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.projekty_intenzity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_intenzity_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.projekty_intenzity_id_seq OWNED BY itms.projekty_intenzity.id;


--
-- Name: projekty_meratelne_ukazovatele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.projekty_meratelne_ukazovatele (
    id integer NOT NULL,
    projekt_id integer NOT NULL,
    aktualny_skutocny_stav numeric,
    datum_posledneho_merania date,
    hodnota_cielova_celkova numeric,
    priznak_rizika boolean,
    projektovy_ukazovatel_id integer
);


--
-- Name: projekty_meratelne_ukazovatele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.projekty_meratelne_ukazovatele_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_meratelne_ukazovatele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.projekty_meratelne_ukazovatele_id_seq OWNED BY itms.projekty_meratelne_ukazovatele.id;


--
-- Name: projekty_miesta_realizacie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.projekty_miesta_realizacie (
    id integer NOT NULL,
    projekt_id integer NOT NULL,
    miesto_realizacie_id integer NOT NULL
);


--
-- Name: projekty_miesta_realizacie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.projekty_miesta_realizacie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_miesta_realizacie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.projekty_miesta_realizacie_id_seq OWNED BY itms.projekty_miesta_realizacie.id;


--
-- Name: projekty_miesta_realizacie_mimo_uzemia_op; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.projekty_miesta_realizacie_mimo_uzemia_op (
    id integer NOT NULL,
    projekt_id integer NOT NULL,
    miesto_realizacie_id integer NOT NULL
);


--
-- Name: projekty_miesta_realizacie_mimo_uzemia_op_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.projekty_miesta_realizacie_mimo_uzemia_op_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_miesta_realizacie_mimo_uzemia_op_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.projekty_miesta_realizacie_mimo_uzemia_op_id_seq OWNED BY itms.projekty_miesta_realizacie_mimo_uzemia_op.id;


--
-- Name: projekty_oblasti_intervencie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.projekty_oblasti_intervencie (
    id integer NOT NULL,
    projekt_id integer NOT NULL,
    oblast_intervencie_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projekty_oblasti_intervencie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.projekty_oblasti_intervencie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_oblasti_intervencie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.projekty_oblasti_intervencie_id_seq OWNED BY itms.projekty_oblasti_intervencie.id;


--
-- Name: projekty_organizacne_zlozky; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.projekty_organizacne_zlozky (
    id integer NOT NULL,
    projekt_id integer NOT NULL,
    organizacna_zlozka_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projekty_organizacne_zlozky_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.projekty_organizacne_zlozky_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_organizacne_zlozky_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.projekty_organizacne_zlozky_id_seq OWNED BY itms.projekty_organizacne_zlozky.id;


--
-- Name: projekty_partneri; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.projekty_partneri (
    id integer NOT NULL,
    projekt_id integer NOT NULL,
    partner_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projekty_partneri_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.projekty_partneri_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_partneri_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.projekty_partneri_id_seq OWNED BY itms.projekty_partneri.id;


--
-- Name: projekty_polozky_rozpoctu; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.projekty_polozky_rozpoctu (
    id integer NOT NULL,
    projekt_id integer NOT NULL,
    polozka_rozpoctu_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projekty_polozky_rozpoctu_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.projekty_polozky_rozpoctu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_polozky_rozpoctu_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.projekty_polozky_rozpoctu_id_seq OWNED BY itms.projekty_polozky_rozpoctu.id;


--
-- Name: projekty_sekundarne_tematicke_okruhy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.projekty_sekundarne_tematicke_okruhy (
    id integer NOT NULL,
    projekt_id integer NOT NULL,
    sekundarny_tematicky_okruh_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projekty_sekundarne_tematicke_okruhy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.projekty_sekundarne_tematicke_okruhy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_sekundarne_tematicke_okruhy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.projekty_sekundarne_tematicke_okruhy_id_seq OWNED BY itms.projekty_sekundarne_tematicke_okruhy.id;


--
-- Name: projekty_typy_uzemia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.projekty_typy_uzemia (
    id integer NOT NULL,
    projekt_id integer NOT NULL,
    typ_uzemia_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projekty_typy_uzemia_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.projekty_typy_uzemia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_typy_uzemia_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.projekty_typy_uzemia_id_seq OWNED BY itms.projekty_typy_uzemia.id;


--
-- Name: projekty_uzemne_mechanizmy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.projekty_uzemne_mechanizmy (
    id integer NOT NULL,
    projekt_id integer NOT NULL,
    uzemny_mechanizmus_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projekty_uzemne_mechanizmy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.projekty_uzemne_mechanizmy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_uzemne_mechanizmy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.projekty_uzemne_mechanizmy_id_seq OWNED BY itms.projekty_uzemne_mechanizmy.id;


--
-- Name: subjekty; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.subjekty (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    itms_created_at timestamp without time zone,
    itms_updated_at timestamp without time zone,
    dic character varying,
    ico character varying,
    ine_identifikacne_cislo character varying,
    nazov character varying,
    obec_id integer,
    psc character varying,
    stat_id integer,
    typ_ineho_identifikacneho_cisla_id integer,
    ulica character varying,
    ulica_cislo character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: subjekty_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.subjekty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subjekty_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.subjekty_id_seq OWNED BY itms.subjekty.id;


--
-- Name: typy_aktivit; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.typy_aktivit (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    itms_created_at timestamp without time zone,
    itms_updated_at timestamp without time zone,
    kod character varying,
    nazov character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: typy_aktivit_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.typy_aktivit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: typy_aktivit_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.typy_aktivit_id_seq OWNED BY itms.typy_aktivit.id;


--
-- Name: uctovne_doklady; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.uctovne_doklady (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    itms_created_at timestamp without time zone,
    itms_updated_at timestamp without time zone,
    datum_uhrady timestamp without time zone,
    datum_vyhotovenia timestamp without time zone,
    dodavatel_dodavatel_obstaravatel_id integer,
    dodavatel_subjekt_id integer,
    nazov character varying,
    typ character varying,
    vlastnik_dokladu_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    celkova_vyska_dokladu numeric
);


--
-- Name: uctovne_doklady_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.uctovne_doklady_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: uctovne_doklady_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.uctovne_doklady_id_seq OWNED BY itms.uctovne_doklady.id;


--
-- Name: uctovne_doklady_polozky_dokladu; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.uctovne_doklady_polozky_dokladu (
    id integer NOT NULL,
    uctovny_doklad_id integer,
    itms_id integer NOT NULL,
    dph numeric,
    jednotkova_cena numeric,
    mnozstvo numeric,
    nazov character varying,
    poradove_cislo integer,
    sadzba_dph numeric,
    suma_bez_dph numeric,
    suma_opravnena numeric,
    suma_spolu numeric,
    suma_ziadana numeric,
    suma_zrealizovanych_vydavkov numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: uctovne_doklady_polozky_dokladu_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.uctovne_doklady_polozky_dokladu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: uctovne_doklady_polozky_dokladu_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.uctovne_doklady_polozky_dokladu_id_seq OWNED BY itms.uctovne_doklady_polozky_dokladu.id;


--
-- Name: uctovne_doklady_projekty; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.uctovne_doklady_projekty (
    id integer NOT NULL,
    uctovny_doklad_id integer NOT NULL,
    projekt_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: uctovne_doklady_projekty_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.uctovne_doklady_projekty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: uctovne_doklady_projekty_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.uctovne_doklady_projekty_id_seq OWNED BY itms.uctovne_doklady_projekty.id;


--
-- Name: verejne_obstaravania; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.verejne_obstaravania (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    itms_created_at timestamp without time zone,
    itms_updated_at timestamp without time zone,
    centralne_obstaravanie boolean,
    cislo_vestnika character varying,
    cislo_zverejnenia_vo_vestniku character varying,
    datum_zverejnenia_vo_vestniku timestamp without time zone,
    druh_zakazky_id integer,
    hlavny_predmet_hlavny_slovnik_id integer,
    kod character varying,
    kriterium_na_vyhodnotenie_ponuk character varying,
    lehota_na_predkladanie_ponuk timestamp without time zone,
    lehota_na_predkladanie_ziadosti_o_ucast timestamp without time zone,
    metoda_vo_id integer,
    nazov character varying,
    obmedzenie_poctu_uchadzacov boolean,
    obstaravatel_dodavatel_obstaravatel_id integer,
    obstaravatel_subjekt_id integer,
    pocet_prijatych_ponuk integer,
    pocet_vylucenych_ponuk integer,
    postup_obstaravania_id integer,
    predchadzajuce_oznamenie boolean,
    predpokladana_hodnota_zakazky numeric,
    stav character varying,
    trvanie_zakazky_hodnota numeric,
    trvanie_zakazky_merna_jednotka character varying,
    url_odkaz_oznamenie character varying,
    zadavanie_zakazky_v_mene_inych_obstaravatelov boolean,
    zadavatel_id integer,
    zakazka_rozdelena_na_viac_casti boolean,
    zverejnene_vo_vestniku_eu boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik (
    id integer NOT NULL,
    verejne_obstaravanie_id integer NOT NULL,
    predmet_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovn_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovn_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovn_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovn_id_seq OWNED BY itms.verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik.id;


--
-- Name: verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik (
    id integer NOT NULL,
    verejne_obstaravanie_id integer NOT NULL,
    predmet_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik_id_seq OWNED BY itms.verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik.id;


--
-- Name: verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik (
    id integer NOT NULL,
    verejne_obstaravanie_id integer NOT NULL,
    predmet_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik_id_seq OWNED BY itms.verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik.id;


--
-- Name: verejne_obstaravania_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.verejne_obstaravania_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: verejne_obstaravania_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.verejne_obstaravania_id_seq OWNED BY itms.verejne_obstaravania.id;


--
-- Name: verejne_obstaravania_operacne_programy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.verejne_obstaravania_operacne_programy (
    id integer NOT NULL,
    verejne_obstaravanie_id integer NOT NULL,
    operacny_program_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: verejne_obstaravania_operacne_programy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.verejne_obstaravania_operacne_programy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: verejne_obstaravania_operacne_programy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.verejne_obstaravania_operacne_programy_id_seq OWNED BY itms.verejne_obstaravania_operacne_programy.id;


--
-- Name: verejne_obstaravania_projekty; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.verejne_obstaravania_projekty (
    id integer NOT NULL,
    verejne_obstaravanie_id integer NOT NULL,
    projekt_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: verejne_obstaravania_projekty_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.verejne_obstaravania_projekty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: verejne_obstaravania_projekty_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.verejne_obstaravania_projekty_id_seq OWNED BY itms.verejne_obstaravania_projekty.id;


--
-- Name: verejne_obstaravania_uctovne_doklady; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.verejne_obstaravania_uctovne_doklady (
    id integer NOT NULL,
    verejne_obstaravanie_id integer NOT NULL,
    uctovny_doklad_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: verejne_obstaravania_uctovne_doklady_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.verejne_obstaravania_uctovne_doklady_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: verejne_obstaravania_uctovne_doklady_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.verejne_obstaravania_uctovne_doklady_id_seq OWNED BY itms.verejne_obstaravania_uctovne_doklady.id;


--
-- Name: vyzvy_planovane; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.vyzvy_planovane (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    itms_created_at timestamp without time zone,
    itms_updated_at timestamp without time zone,
    alokacia_eu numeric,
    alokacia_sr numeric,
    datum_uzavretia_1_kolo timestamp without time zone,
    datum_uzavretia_2_kolo timestamp without time zone,
    datum_vyhlasenia_1_kolo timestamp without time zone,
    datum_vyhlasenia_2_kolo timestamp without time zone,
    druh character varying,
    kod character varying,
    nazov character varying,
    stav character varying,
    typ_1_kolo character varying,
    typ_2_kolo character varying,
    vyhlasovatel_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vyzvy_planovane_doplnujuce_info; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.vyzvy_planovane_doplnujuce_info (
    id integer NOT NULL,
    vyzva_id integer NOT NULL,
    nazov character varying,
    url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vyzvy_planovane_doplnujuce_info_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.vyzvy_planovane_doplnujuce_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_planovane_doplnujuce_info_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.vyzvy_planovane_doplnujuce_info_id_seq OWNED BY itms.vyzvy_planovane_doplnujuce_info.id;


--
-- Name: vyzvy_planovane_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.vyzvy_planovane_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_planovane_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.vyzvy_planovane_id_seq OWNED BY itms.vyzvy_planovane.id;


--
-- Name: vyzvy_planovane_konkretne_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.vyzvy_planovane_konkretne_ciele (
    id integer NOT NULL,
    vyzva_id integer NOT NULL,
    konkretny_ciel_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vyzvy_planovane_konkretne_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.vyzvy_planovane_konkretne_ciele_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_planovane_konkretne_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.vyzvy_planovane_konkretne_ciele_id_seq OWNED BY itms.vyzvy_planovane_konkretne_ciele.id;


--
-- Name: vyzvy_planovane_poskytovatelia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.vyzvy_planovane_poskytovatelia (
    id integer NOT NULL,
    vyzva_id integer NOT NULL,
    poskytovatel_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vyzvy_planovane_poskytovatelia_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.vyzvy_planovane_poskytovatelia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_planovane_poskytovatelia_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.vyzvy_planovane_poskytovatelia_id_seq OWNED BY itms.vyzvy_planovane_poskytovatelia.id;


--
-- Name: vyzvy_vyhlasene; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.vyzvy_vyhlasene (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    itms_created_at timestamp without time zone,
    itms_updated_at timestamp without time zone,
    alokacia_eu numeric,
    alokacia_sr numeric,
    datum_uzavretia timestamp without time zone,
    datum_vyhlasenia timestamp without time zone,
    druh character varying,
    kod character varying,
    nazov character varying,
    stav character varying,
    technicka_asistencia boolean,
    typ character varying,
    vyhlasovatel_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vyzvy_vyhlasene_doplnujuce_info; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.vyzvy_vyhlasene_doplnujuce_info (
    id integer NOT NULL,
    vyzva_id integer NOT NULL,
    nazov character varying,
    url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vyzvy_vyhlasene_doplnujuce_info_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.vyzvy_vyhlasene_doplnujuce_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_vyhlasene_doplnujuce_info_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.vyzvy_vyhlasene_doplnujuce_info_id_seq OWNED BY itms.vyzvy_vyhlasene_doplnujuce_info.id;


--
-- Name: vyzvy_vyhlasene_fondy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.vyzvy_vyhlasene_fondy (
    id integer NOT NULL,
    vyzva_id integer NOT NULL,
    fond_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vyzvy_vyhlasene_fondy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.vyzvy_vyhlasene_fondy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_vyhlasene_fondy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.vyzvy_vyhlasene_fondy_id_seq OWNED BY itms.vyzvy_vyhlasene_fondy.id;


--
-- Name: vyzvy_vyhlasene_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.vyzvy_vyhlasene_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_vyhlasene_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.vyzvy_vyhlasene_id_seq OWNED BY itms.vyzvy_vyhlasene.id;


--
-- Name: vyzvy_vyhlasene_konkretne_ciele_typy_aktivit; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit (
    id integer NOT NULL,
    vyzva_id integer NOT NULL,
    konkretny_ciel_id integer NOT NULL,
    typ_aktivity_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_id_seq OWNED BY itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit.id;


--
-- Name: vyzvy_vyhlasene_kontaktne_osoby; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.vyzvy_vyhlasene_kontaktne_osoby (
    id integer NOT NULL,
    vyzva_id integer NOT NULL,
    osoba_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vyzvy_vyhlasene_kontaktne_osoby_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.vyzvy_vyhlasene_kontaktne_osoby_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_vyhlasene_kontaktne_osoby_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.vyzvy_vyhlasene_kontaktne_osoby_id_seq OWNED BY itms.vyzvy_vyhlasene_kontaktne_osoby.id;


--
-- Name: vyzvy_vyhlasene_poskytovatelia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.vyzvy_vyhlasene_poskytovatelia (
    id integer NOT NULL,
    vyzva_id integer NOT NULL,
    poskytovatel_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vyzvy_vyhlasene_poskytovatelia_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.vyzvy_vyhlasene_poskytovatelia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_vyhlasene_poskytovatelia_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.vyzvy_vyhlasene_poskytovatelia_id_seq OWNED BY itms.vyzvy_vyhlasene_poskytovatelia.id;


--
-- Name: vyzvy_vyhlasene_posudzovane_obdobia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.vyzvy_vyhlasene_posudzovane_obdobia (
    id integer NOT NULL,
    vyzva_id integer NOT NULL,
    datum_uzavierky timestamp without time zone,
    poradove_cislo integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vyzvy_vyhlasene_posudzovane_obdobia_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.vyzvy_vyhlasene_posudzovane_obdobia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_vyhlasene_posudzovane_obdobia_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.vyzvy_vyhlasene_posudzovane_obdobia_id_seq OWNED BY itms.vyzvy_vyhlasene_posudzovane_obdobia.id;


--
-- Name: vyzvy_vyhlasene_vyzvy_planovane; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.vyzvy_vyhlasene_vyzvy_planovane (
    id integer NOT NULL,
    vyhlasena_vyzva_id integer NOT NULL,
    planovana_vyzva_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vyzvy_vyhlasene_vyzvy_planovane_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.vyzvy_vyhlasene_vyzvy_planovane_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_vyhlasene_vyzvy_planovane_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.vyzvy_vyhlasene_vyzvy_planovane_id_seq OWNED BY itms.vyzvy_vyhlasene_vyzvy_planovane.id;


--
-- Name: zmluvy_verejne_obstaravania; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zmluvy_verejne_obstaravania (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    itms_created_at timestamp without time zone,
    itms_updated_at timestamp without time zone,
    celkova_suma_zmluvy numeric,
    cislo_zmluvy character varying,
    datum_platnosti timestamp without time zone,
    datum_ucinnosti timestamp without time zone,
    hlavny_dodavatel_dodavatel_obstaravatel_id integer,
    hlavny_dodavatel_subjekt_id integer,
    kod character varying,
    nazov character varying,
    predmet_zmluvy character varying,
    suma_bez_dph numeric,
    url_odkaz_na_zmluvu character varying,
    verejne_obstaravanie_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zmluvy_verejne_obstaravania_dalsie_url; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zmluvy_verejne_obstaravania_dalsie_url (
    id integer NOT NULL,
    zmluva_verejne_obstaravanie_id integer NOT NULL,
    nazov character varying,
    url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zmluvy_verejne_obstaravania_dalsie_url_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zmluvy_verejne_obstaravania_dalsie_url_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zmluvy_verejne_obstaravania_dalsie_url_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zmluvy_verejne_obstaravania_dalsie_url_id_seq OWNED BY itms.zmluvy_verejne_obstaravania_dalsie_url.id;


--
-- Name: zmluvy_verejne_obstaravania_dodavatelia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zmluvy_verejne_obstaravania_dodavatelia (
    id integer NOT NULL,
    zmluva_verejne_obstaravanie_id integer NOT NULL,
    dodavatel_dodavatel_obstaravatel_id integer,
    dodavatel_subjekt_id integer,
    je_hlavny_dodavatel boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zmluvy_verejne_obstaravania_dodavatelia_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zmluvy_verejne_obstaravania_dodavatelia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zmluvy_verejne_obstaravania_dodavatelia_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zmluvy_verejne_obstaravania_dodavatelia_id_seq OWNED BY itms.zmluvy_verejne_obstaravania_dodavatelia.id;


--
-- Name: zmluvy_verejne_obstaravania_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zmluvy_verejne_obstaravania_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zmluvy_verejne_obstaravania_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zmluvy_verejne_obstaravania_id_seq OWNED BY itms.zmluvy_verejne_obstaravania.id;


--
-- Name: zonfp_spracovane_aktivity_projekt; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_spracovane_aktivity_projekt (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    datum_konca_planovany timestamp without time zone,
    datum_konca_schvaleny timestamp without time zone,
    datum_zaciatku_planovany timestamp without time zone,
    datum_zaciatku_schvaleny timestamp without time zone,
    kod character varying,
    nazov character varying,
    subjekt_id integer,
    typ_aktivity_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_aktivity_projekt_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_aktivity_projekt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_aktivity_projekt_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_aktivity_projekt_id_seq OWNED BY itms.zonfp_spracovane_aktivity_projekt.id;


--
-- Name: zonfp_spracovane_formy_financovania; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_spracovane_formy_financovania (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    forma_financovania_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_formy_financovania_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_formy_financovania_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_formy_financovania_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_formy_financovania_id_seq OWNED BY itms.zonfp_spracovane_formy_financovania.id;


--
-- Name: zonfp_spracovane_hodnotitelia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_spracovane_hodnotitelia (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    hodnotitel_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_hodnotitelia_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_hodnotitelia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_hodnotitelia_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_hodnotitelia_id_seq OWNED BY itms.zonfp_spracovane_hodnotitelia.id;


--
-- Name: zonfp_spracovane_hospodarske_cinnosti; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_spracovane_hospodarske_cinnosti (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    hospodarska_cinnost_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_hospodarske_cinnosti_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_hospodarske_cinnosti_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_hospodarske_cinnosti_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_hospodarske_cinnosti_id_seq OWNED BY itms.zonfp_spracovane_hospodarske_cinnosti.id;


--
-- Name: zonfp_spracovane; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_spracovane (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    itms_created_at timestamp without time zone,
    itms_updated_at timestamp without time zone,
    ekosystem_stav character varying,
    akronym character varying,
    datum_predlozenia timestamp without time zone,
    datum_schvalenia timestamp without time zone,
    datum_schvaleny_konca_hlavnych_aktivit timestamp without time zone,
    datum_schvaleny_konca_realizacie timestamp without time zone,
    datum_schvaleny_zaciatku_hlavnych_aktivit timestamp without time zone,
    datum_schvaleny_zaciatku_realizacie timestamp without time zone,
    datum_zamietnutia timestamp without time zone,
    datum_ziadany_konca_hlavnych_aktivit timestamp without time zone,
    datum_ziadany_konca_realizacie timestamp without time zone,
    datum_ziadany_zaciatku_hlavnych_aktivit timestamp without time zone,
    datum_ziadany_zaciatku_realizacie timestamp without time zone,
    kod character varying,
    nazov character varying,
    percento_schvalene_spolufinancovania numeric,
    percento_ziadane_spolufinancovania numeric,
    pocet_bodov_hodnotenia_celkovy numeric,
    popis_kapacity_ziadatela character varying,
    popis_projektu character varying,
    popis_situacie_po_realizacii character varying,
    popis_sposobu_realizacie character varying,
    popis_vychodiskovej_situacie character varying,
    suma_schvalena_celkova numeric,
    suma_schvalena_celkova_projektov_generujucich_prijem numeric,
    suma_schvalena_nfp numeric,
    suma_schvalena_vlastnych_zdrojov numeric,
    suma_ziadana_celkova numeric,
    suma_ziadana_celkova_projektov_generujucich_prijem numeric,
    suma_ziadana_nfp numeric,
    suma_ziadana_vlastnych_zdrojov numeric,
    vysledok_konania_id integer,
    vyzva_id integer,
    zameranie_projektu character varying,
    ziadatel_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_id_seq OWNED BY itms.zonfp_spracovane.id;


--
-- Name: zonfp_spracovane_meratelne_ukazovatele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_spracovane_meratelne_ukazovatele (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    aktualny_skutocny_stav numeric,
    datum_posledneho_merania date,
    hodnota_cielova_celkova numeric,
    priznak_rizika boolean,
    projektovy_ukazovatel_id integer NOT NULL
);


--
-- Name: zonfp_meratelne_ukazovatele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_meratelne_ukazovatele_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_meratelne_ukazovatele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_meratelne_ukazovatele_id_seq OWNED BY itms.zonfp_spracovane_meratelne_ukazovatele.id;


--
-- Name: zonfp_spracovane_miesta_realizacie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_spracovane_miesta_realizacie (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    miesto_realizacie_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_miesta_realizacie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_miesta_realizacie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_miesta_realizacie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_miesta_realizacie_id_seq OWNED BY itms.zonfp_spracovane_miesta_realizacie.id;


--
-- Name: zonfp_spracovane_miesta_realizacie_mimo_uzemia_op; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_spracovane_miesta_realizacie_mimo_uzemia_op (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    miesto_realizacie_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_miesta_realizacie_mimo_uzemia_op_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_miesta_realizacie_mimo_uzemia_op_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_miesta_realizacie_mimo_uzemia_op_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_miesta_realizacie_mimo_uzemia_op_id_seq OWNED BY itms.zonfp_spracovane_miesta_realizacie_mimo_uzemia_op.id;


--
-- Name: zonfp_spracovane_oblasti_intervencie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_spracovane_oblasti_intervencie (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    oblast_intervencie_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_oblasti_intervencie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_oblasti_intervencie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_oblasti_intervencie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_oblasti_intervencie_id_seq OWNED BY itms.zonfp_spracovane_oblasti_intervencie.id;


--
-- Name: zonfp_spracovane_organizacne_zlozky; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_spracovane_organizacne_zlozky (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    organizacna_zlozka_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_organizacne_zlozky_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_organizacne_zlozky_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_organizacne_zlozky_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_organizacne_zlozky_id_seq OWNED BY itms.zonfp_spracovane_organizacne_zlozky.id;


--
-- Name: zonfp_spracovane_partneri; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_spracovane_partneri (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    partner_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_partneri_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_partneri_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_partneri_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_partneri_id_seq OWNED BY itms.zonfp_spracovane_partneri.id;


--
-- Name: zonfp_spracovane_polozky_rozpoctu; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_spracovane_polozky_rozpoctu (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    itms_id integer NOT NULL,
    aktivita_zonfp_kod character varying,
    skupina_vydavkov_id integer,
    suma_opravneneho_vydavku numeric
);


--
-- Name: zonfp_polozky_rozpoctu_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_polozky_rozpoctu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_polozky_rozpoctu_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_polozky_rozpoctu_id_seq OWNED BY itms.zonfp_spracovane_polozky_rozpoctu.id;


--
-- Name: zonfp_prijate; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_prijate (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    itms_created_at timestamp without time zone,
    itms_updated_at timestamp without time zone,
    akronym character varying,
    datum_predlozenia timestamp without time zone,
    datum_ziadany_konca_hlavnych_aktivit timestamp without time zone,
    datum_ziadany_konca_realizacie timestamp without time zone,
    datum_ziadany_zaciatku_hlavnych_aktivit timestamp without time zone,
    datum_ziadany_zaciatku_realizacie timestamp without time zone,
    kod character varying,
    nazov character varying,
    percento_ziadane_spolufinancovania numeric,
    popis_projektu character varying,
    suma_ziadana_celkova numeric,
    suma_ziadana_celkova_projektov_generujucich_prijem numeric,
    suma_ziadana_nfp numeric,
    suma_ziadana_vlastnych_zdrojov numeric,
    vyzva_id integer,
    zameranie_projektu character varying,
    ziadatel_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_prijate_aktivity_projekt; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_prijate_aktivity_projekt (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    datum_konca_planovany timestamp without time zone,
    datum_konca_schvaleny timestamp without time zone,
    datum_zaciatku_planovany timestamp without time zone,
    datum_zaciatku_schvaleny timestamp without time zone,
    kod character varying,
    nazov character varying,
    subjekt_id integer,
    typ_aktivity_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_prijate_aktivity_projekt_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_prijate_aktivity_projekt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_aktivity_projekt_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_prijate_aktivity_projekt_id_seq OWNED BY itms.zonfp_prijate_aktivity_projekt.id;


--
-- Name: zonfp_prijate_formy_financovania; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_prijate_formy_financovania (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    forma_financovania_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_prijate_formy_financovania_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_prijate_formy_financovania_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_formy_financovania_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_prijate_formy_financovania_id_seq OWNED BY itms.zonfp_prijate_formy_financovania.id;


--
-- Name: zonfp_prijate_hospodarske_cinnosti; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_prijate_hospodarske_cinnosti (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    hospodarska_cinnost_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_prijate_hospodarske_cinnosti_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_prijate_hospodarske_cinnosti_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_hospodarske_cinnosti_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_prijate_hospodarske_cinnosti_id_seq OWNED BY itms.zonfp_prijate_hospodarske_cinnosti.id;


--
-- Name: zonfp_prijate_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_prijate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_prijate_id_seq OWNED BY itms.zonfp_prijate.id;


--
-- Name: zonfp_prijate_meratelne_ukazovatele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_prijate_meratelne_ukazovatele (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    aktualny_skutocny_stav numeric,
    datum_posledneho_merania date,
    hodnota_cielova_celkova numeric,
    priznak_rizika boolean,
    projektovy_ukazovatel_id integer NOT NULL
);


--
-- Name: zonfp_prijate_meratelne_ukazovatele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_prijate_meratelne_ukazovatele_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_meratelne_ukazovatele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_prijate_meratelne_ukazovatele_id_seq OWNED BY itms.zonfp_prijate_meratelne_ukazovatele.id;


--
-- Name: zonfp_prijate_miesta_realizacie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_prijate_miesta_realizacie (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    miesto_realizacie_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_prijate_miesta_realizacie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_prijate_miesta_realizacie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_miesta_realizacie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_prijate_miesta_realizacie_id_seq OWNED BY itms.zonfp_prijate_miesta_realizacie.id;


--
-- Name: zonfp_prijate_miesta_realizacie_mimo_uzemia_op; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_prijate_miesta_realizacie_mimo_uzemia_op (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    miesto_realizacie_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_prijate_miesta_realizacie_mimo_uzemia_op_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_prijate_miesta_realizacie_mimo_uzemia_op_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_miesta_realizacie_mimo_uzemia_op_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_prijate_miesta_realizacie_mimo_uzemia_op_id_seq OWNED BY itms.zonfp_prijate_miesta_realizacie_mimo_uzemia_op.id;


--
-- Name: zonfp_prijate_oblasti_intervencie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_prijate_oblasti_intervencie (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    oblast_intervencie_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_prijate_oblasti_intervencie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_prijate_oblasti_intervencie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_oblasti_intervencie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_prijate_oblasti_intervencie_id_seq OWNED BY itms.zonfp_prijate_oblasti_intervencie.id;


--
-- Name: zonfp_prijate_organizacne_zlozky; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_prijate_organizacne_zlozky (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    organizacna_zlozka_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_prijate_organizacne_zlozky_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_prijate_organizacne_zlozky_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_organizacne_zlozky_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_prijate_organizacne_zlozky_id_seq OWNED BY itms.zonfp_prijate_organizacne_zlozky.id;


--
-- Name: zonfp_prijate_partneri; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_prijate_partneri (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    partner_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_prijate_partneri_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_prijate_partneri_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_partneri_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_prijate_partneri_id_seq OWNED BY itms.zonfp_prijate_partneri.id;


--
-- Name: zonfp_prijate_polozky_rozpoctu; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_prijate_polozky_rozpoctu (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    itms_id integer NOT NULL,
    aktivita_zonfp_kod character varying,
    skupina_vydavkov_id integer,
    suma_opravneneho_vydavku numeric
);


--
-- Name: zonfp_prijate_polozky_rozpoctu_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_prijate_polozky_rozpoctu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_polozky_rozpoctu_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_prijate_polozky_rozpoctu_id_seq OWNED BY itms.zonfp_prijate_polozky_rozpoctu.id;


--
-- Name: zonfp_prijate_sekundarne_tematicke_okruhy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_prijate_sekundarne_tematicke_okruhy (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    sekundarny_tematicky_okruh_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_prijate_sekundarne_tematicke_okruhy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_prijate_sekundarne_tematicke_okruhy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_sekundarne_tematicke_okruhy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_prijate_sekundarne_tematicke_okruhy_id_seq OWNED BY itms.zonfp_prijate_sekundarne_tematicke_okruhy.id;


--
-- Name: zonfp_prijate_typy_uzemia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_prijate_typy_uzemia (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    typ_uzemia_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_prijate_typy_uzemia_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_prijate_typy_uzemia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_typy_uzemia_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_prijate_typy_uzemia_id_seq OWNED BY itms.zonfp_prijate_typy_uzemia.id;


--
-- Name: zonfp_prijate_uzemne_mechanizmy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_prijate_uzemne_mechanizmy (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    uzemny_mechanizmus_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_prijate_uzemne_mechanizmy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_prijate_uzemne_mechanizmy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_uzemne_mechanizmy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_prijate_uzemne_mechanizmy_id_seq OWNED BY itms.zonfp_prijate_uzemne_mechanizmy.id;


--
-- Name: zonfp_spracovane_sekundarne_tematicke_okruhy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_spracovane_sekundarne_tematicke_okruhy (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    sekundarny_tematicky_okruh_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_sekundarne_tematicke_okruhy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_sekundarne_tematicke_okruhy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_sekundarne_tematicke_okruhy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_sekundarne_tematicke_okruhy_id_seq OWNED BY itms.zonfp_spracovane_sekundarne_tematicke_okruhy.id;


--
-- Name: zonfp_spracovane_typy_uzemia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_spracovane_typy_uzemia (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    typ_uzemia_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_spracovane_uzemne_mechanizmy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zonfp_spracovane_uzemne_mechanizmy (
    id integer NOT NULL,
    zonfp_id integer NOT NULL,
    uzemny_mechanizmus_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_typy_uzemia_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_typy_uzemia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_typy_uzemia_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_typy_uzemia_id_seq OWNED BY itms.zonfp_spracovane_typy_uzemia.id;


--
-- Name: zonfp_uzemne_mechanizmy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zonfp_uzemne_mechanizmy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_uzemne_mechanizmy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zonfp_uzemne_mechanizmy_id_seq OWNED BY itms.zonfp_spracovane_uzemne_mechanizmy.id;


--
-- Name: zop; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zop (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    itms_created_at timestamp without time zone,
    itms_updated_at timestamp without time zone,
    ekosystem_stav character varying,
    datum_prijatia timestamp without time zone,
    datum_uhrady timestamp without time zone,
    datum_zamietnutia timestamp without time zone,
    hlavny_cehranicny_partner_id integer,
    kod character varying,
    narokovana_suma numeric,
    predfinancovanie_id integer,
    predkladana_za_id integer,
    prijimatel_id integer,
    projekt_id integer,
    schvalena_suma numeric,
    stav_zamietnutej_zop character varying,
    typ character varying,
    vyplaca_sa_partnerovi boolean,
    zop_je_zaverecna boolean,
    zop_predlozena_za_viac_subjektov boolean
);


--
-- Name: zop_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zop_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zop_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zop_id_seq OWNED BY itms.zop.id;


--
-- Name: zop_predkladane_za_subjekty; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE itms.zop_predkladane_za_subjekty (
    id integer NOT NULL,
    zop_id integer NOT NULL,
    plati_sa_priamo_subjektu boolean,
    subjekt_id integer,
    typ_subjektu_na_projekte character varying
);


--
-- Name: zop_predkladane_za_subjekty_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE itms.zop_predkladane_za_subjekty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zop_predkladane_za_subjekty_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE itms.zop_predkladane_za_subjekty_id_seq OWNED BY itms.zop_predkladane_za_subjekty.id;


--
-- Name: dokumenty; Type: TABLE; Schema: metais; Owner: -
--

CREATE TABLE metais.dokumenty (
    id bigint NOT NULL,
    uuid character varying NOT NULL,
    nazov character varying,
    poznamka text,
    typ character varying,
    kod_metais character varying,
    ref_id character varying,
    filename character varying,
    mimetype character varying,
    size character varying,
    stav_evidencie character varying,
    metais_created_at timestamp without time zone,
    metais_updated_at timestamp without time zone,
    attachable_type character varying,
    attachable_id bigint,
    raw_data text,
    raw_meta text,
    parsed boolean DEFAULT false,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: dokumenty_id_seq; Type: SEQUENCE; Schema: metais; Owner: -
--

CREATE SEQUENCE metais.dokumenty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dokumenty_id_seq; Type: SEQUENCE OWNED BY; Schema: metais; Owner: -
--

ALTER SEQUENCE metais.dokumenty_id_seq OWNED BY metais.dokumenty.id;


--
-- Name: isvs; Type: TABLE; Schema: metais; Owner: -
--

CREATE TABLE metais.isvs (
    id bigint NOT NULL,
    uuid character varying NOT NULL,
    projekt_id bigint,
    raw_data text,
    parsed boolean DEFAULT false,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: isvs_id_seq; Type: SEQUENCE; Schema: metais; Owner: -
--

CREATE SEQUENCE metais.isvs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: isvs_id_seq; Type: SEQUENCE OWNED BY; Schema: metais; Owner: -
--

ALTER SEQUENCE metais.isvs_id_seq OWNED BY metais.isvs.id;


--
-- Name: projekty; Type: TABLE; Schema: metais; Owner: -
--

CREATE TABLE metais.projekty (
    id bigint NOT NULL,
    uuid character varying NOT NULL,
    nazov character varying,
    popis text,
    datum_zaciatku timestamp without time zone,
    datum_ukoncenia timestamp without time zone,
    schvalovaci_proces character varying,
    kod_metais character varying,
    typ_investicie character varying,
    zdroj character varying,
    financna_skupina character varying,
    prijimatel character varying,
    faza character varying,
    naklady_spolu numeric,
    prevadzka_rocne numeric,
    ref_id character varying,
    program character varying,
    status character varying,
    datum_zmeny_stavu_projektu timestamp without time zone,
    schvalena_prevadzka_rocne numeric,
    schvalene_naklady_spolu numeric,
    datum_ucinnosti_zmluvy_nfp timestamp without time zone,
    link_nfp_v_crz character varying,
    datum_zverejnenia_vo timestamp without time zone,
    link_vvo character varying,
    datum_ucinnosti_zmluvy_dielo timestamp without time zone,
    link_dielo_v_crz character varying,
    raw_data text,
    parsed boolean DEFAULT false,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: projekty_id_seq; Type: SEQUENCE; Schema: metais; Owner: -
--

CREATE SEQUENCE metais.projekty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_id_seq; Type: SEQUENCE OWNED BY; Schema: metais; Owner: -
--

ALTER SEQUENCE metais.projekty_id_seq OWNED BY metais.projekty.id;


--
-- Name: bulletin_issues; Type: TABLE; Schema: ov; Owner: -
--

CREATE TABLE ov.bulletin_issues (
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

CREATE SEQUENCE ov.bulletin_issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bulletin_issues_id_seq; Type: SEQUENCE OWNED BY; Schema: ov; Owner: -
--

ALTER SEQUENCE ov.bulletin_issues_id_seq OWNED BY ov.bulletin_issues.id;


--
-- Name: konkurz_restrukturalizacia_actors; Type: TABLE; Schema: ov; Owner: -
--

CREATE TABLE ov.konkurz_restrukturalizacia_actors (
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

CREATE SEQUENCE ov.konkurz_restrukturalizacia_actors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: konkurz_restrukturalizacia_actors_id_seq; Type: SEQUENCE OWNED BY; Schema: ov; Owner: -
--

ALTER SEQUENCE ov.konkurz_restrukturalizacia_actors_id_seq OWNED BY ov.konkurz_restrukturalizacia_actors.id;


--
-- Name: konkurz_restrukturalizacia_issues; Type: TABLE; Schema: ov; Owner: -
--

CREATE TABLE ov.konkurz_restrukturalizacia_issues (
    id integer NOT NULL,
    bulletin_issue_id integer NOT NULL,
    raw_issue_id integer NOT NULL,
    court_name character varying NOT NULL,
    file_reference character varying NOT NULL,
    ics character varying NOT NULL,
    released_by character varying NOT NULL,
    releaser_position character varying,
    sent_by character varying,
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

CREATE SEQUENCE ov.konkurz_restrukturalizacia_issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: konkurz_restrukturalizacia_issues_id_seq; Type: SEQUENCE OWNED BY; Schema: ov; Owner: -
--

ALTER SEQUENCE ov.konkurz_restrukturalizacia_issues_id_seq OWNED BY ov.konkurz_restrukturalizacia_issues.id;


--
-- Name: konkurz_restrukturalizacia_proposings; Type: TABLE; Schema: ov; Owner: -
--

CREATE TABLE ov.konkurz_restrukturalizacia_proposings (
    id integer NOT NULL,
    issue_id integer NOT NULL,
    actor_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: konkurz_restrukturalizacia_proposings_id_seq; Type: SEQUENCE; Schema: ov; Owner: -
--

CREATE SEQUENCE ov.konkurz_restrukturalizacia_proposings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: konkurz_restrukturalizacia_proposings_id_seq; Type: SEQUENCE OWNED BY; Schema: ov; Owner: -
--

ALTER SEQUENCE ov.konkurz_restrukturalizacia_proposings_id_seq OWNED BY ov.konkurz_restrukturalizacia_proposings.id;


--
-- Name: konkurz_vyrovnanie_issues; Type: TABLE; Schema: ov; Owner: -
--

CREATE TABLE ov.konkurz_vyrovnanie_issues (
    id integer NOT NULL,
    bulletin_issue_id integer NOT NULL,
    raw_issue_id integer NOT NULL,
    court_code character varying NOT NULL,
    court_name character varying NOT NULL,
    file_reference character varying NOT NULL,
    corporate_body_name character varying NOT NULL,
    cin bigint,
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

CREATE SEQUENCE ov.konkurz_vyrovnanie_issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: konkurz_vyrovnanie_issues_id_seq; Type: SEQUENCE OWNED BY; Schema: ov; Owner: -
--

ALTER SEQUENCE ov.konkurz_vyrovnanie_issues_id_seq OWNED BY ov.konkurz_vyrovnanie_issues.id;


--
-- Name: likvidator_issues; Type: TABLE; Schema: ov; Owner: -
--

CREATE TABLE ov.likvidator_issues (
    id integer NOT NULL,
    bulletin_issue_id integer NOT NULL,
    raw_issue_id integer NOT NULL,
    legal_form_code character varying NOT NULL,
    legal_form_name character varying NOT NULL,
    corporate_body_name character varying NOT NULL,
    cin bigint NOT NULL,
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

CREATE SEQUENCE ov.likvidator_issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: likvidator_issues_id_seq; Type: SEQUENCE OWNED BY; Schema: ov; Owner: -
--

ALTER SEQUENCE ov.likvidator_issues_id_seq OWNED BY ov.likvidator_issues.id;


--
-- Name: or_podanie_issue_documents; Type: TABLE; Schema: ov; Owner: -
--

CREATE TABLE ov.or_podanie_issue_documents (
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

CREATE SEQUENCE ov.or_podanie_issue_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: or_podanie_issue_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: ov; Owner: -
--

ALTER SEQUENCE ov.or_podanie_issue_documents_id_seq OWNED BY ov.or_podanie_issue_documents.id;


--
-- Name: or_podanie_issues; Type: TABLE; Schema: ov; Owner: -
--

CREATE TABLE ov.or_podanie_issues (
    id integer NOT NULL,
    bulletin_issue_id integer NOT NULL,
    raw_issue_id integer NOT NULL,
    br_mark character varying NOT NULL,
    br_court_code character varying NOT NULL,
    br_court_name character varying NOT NULL,
    kind_code character varying NOT NULL,
    kind_name character varying NOT NULL,
    cin bigint,
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

CREATE SEQUENCE ov.or_podanie_issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: or_podanie_issues_id_seq; Type: SEQUENCE OWNED BY; Schema: ov; Owner: -
--

ALTER SEQUENCE ov.or_podanie_issues_id_seq OWNED BY ov.or_podanie_issues.id;


--
-- Name: raw_issues; Type: TABLE; Schema: ov; Owner: -
--

CREATE TABLE ov.raw_issues (
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

CREATE SEQUENCE ov.raw_issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: raw_issues_id_seq; Type: SEQUENCE OWNED BY; Schema: ov; Owner: -
--

ALTER SEQUENCE ov.raw_issues_id_seq OWNED BY ov.raw_issues.id;


--
-- Name: znizenie_imania_ceos; Type: TABLE; Schema: ov; Owner: -
--

CREATE TABLE ov.znizenie_imania_ceos (
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

CREATE SEQUENCE ov.znizenie_imania_ceos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: znizenie_imania_ceos_id_seq; Type: SEQUENCE OWNED BY; Schema: ov; Owner: -
--

ALTER SEQUENCE ov.znizenie_imania_ceos_id_seq OWNED BY ov.znizenie_imania_ceos.id;


--
-- Name: znizenie_imania_issues; Type: TABLE; Schema: ov; Owner: -
--

CREATE TABLE ov.znizenie_imania_issues (
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
    cin bigint NOT NULL,
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

CREATE SEQUENCE ov.znizenie_imania_issues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: znizenie_imania_issues_id_seq; Type: SEQUENCE OWNED BY; Schema: ov; Owner: -
--

ALTER SEQUENCE ov.znizenie_imania_issues_id_seq OWNED BY ov.znizenie_imania_issues.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: versions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.versions (
    id bigint NOT NULL,
    item_type character varying NOT NULL,
    item_id bigint NOT NULL,
    event character varying NOT NULL,
    whodunnit character varying,
    object text,
    created_at timestamp without time zone,
    object_changes text
);


--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.versions_id_seq OWNED BY public.versions.id;


--
-- Name: esa2010_codes; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.esa2010_codes (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: esu2010_codes_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE rpo.esu2010_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: esu2010_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.esu2010_codes_id_seq OWNED BY rpo.esa2010_codes.id;


--
-- Name: legal_forms; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.legal_forms (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: legal_forms_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE rpo.legal_forms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: legal_forms_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.legal_forms_id_seq OWNED BY rpo.legal_forms.id;


--
-- Name: main_activity_codes; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.main_activity_codes (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: main_activity_codes_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE rpo.main_activity_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: main_activity_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.main_activity_codes_id_seq OWNED BY rpo.main_activity_codes.id;


--
-- Name: organization_address_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.organization_address_entries (
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
    updated_at timestamp without time zone NOT NULL,
    district character varying
);


--
-- Name: organization_address_entries_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE rpo.organization_address_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_address_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.organization_address_entries_id_seq OWNED BY rpo.organization_address_entries.id;


--
-- Name: organization_alternate_name_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.organization_alternate_name_entries (
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

CREATE SEQUENCE rpo.organization_alternate_name_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_alternate_name_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.organization_alternate_name_entries_id_seq OWNED BY rpo.organization_alternate_name_entries.id;


--
-- Name: organization_authorization_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.organization_authorization_entries (
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

CREATE SEQUENCE rpo.organization_authorization_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_authorization_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.organization_authorization_entries_id_seq OWNED BY rpo.organization_authorization_entries.id;


--
-- Name: organization_deposit_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.organization_deposit_entries (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    full_name character varying,
    person_formatted_name character varying,
    deposit_amount numeric NOT NULL,
    deposit_currency character varying NOT NULL,
    deposit_type character varying,
    effective_from date NOT NULL,
    effective_to date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    person_given_names character varying[] DEFAULT '{}'::character varying[] NOT NULL,
    person_family_names character varying[] DEFAULT '{}'::character varying[] NOT NULL,
    person_given_family_names character varying[] DEFAULT '{}'::character varying[] NOT NULL,
    person_prefixes character varying[] DEFAULT '{}'::character varying[] NOT NULL,
    person_postfixes character varying[] DEFAULT '{}'::character varying[] NOT NULL
);


--
-- Name: organization_deposit_entries_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE rpo.organization_deposit_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_deposit_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.organization_deposit_entries_id_seq OWNED BY rpo.organization_deposit_entries.id;


--
-- Name: organization_economic_activity_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.organization_economic_activity_entries (
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

CREATE SEQUENCE rpo.organization_economic_activity_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_economic_activity_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.organization_economic_activity_entries_id_seq OWNED BY rpo.organization_economic_activity_entries.id;


--
-- Name: organization_equity_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.organization_equity_entries (
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

CREATE SEQUENCE rpo.organization_equity_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_equity_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.organization_equity_entries_id_seq OWNED BY rpo.organization_equity_entries.id;


--
-- Name: organization_identifier_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.organization_identifier_entries (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    ipo bigint,
    effective_from date,
    effective_to date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: organization_identifier_entries_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE rpo.organization_identifier_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_identifier_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.organization_identifier_entries_id_seq OWNED BY rpo.organization_identifier_entries.id;


--
-- Name: organization_legal_form_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.organization_legal_form_entries (
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

CREATE SEQUENCE rpo.organization_legal_form_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_legal_form_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.organization_legal_form_entries_id_seq OWNED BY rpo.organization_legal_form_entries.id;


--
-- Name: organization_legal_status_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.organization_legal_status_entries (
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

CREATE SEQUENCE rpo.organization_legal_status_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_legal_status_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.organization_legal_status_entries_id_seq OWNED BY rpo.organization_legal_status_entries.id;


--
-- Name: organization_name_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.organization_name_entries (
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

CREATE SEQUENCE rpo.organization_name_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_name_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.organization_name_entries_id_seq OWNED BY rpo.organization_name_entries.id;


--
-- Name: organization_other_legal_fact_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.organization_other_legal_fact_entries (
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

CREATE SEQUENCE rpo.organization_other_legal_fact_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_other_legal_fact_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.organization_other_legal_fact_entries_id_seq OWNED BY rpo.organization_other_legal_fact_entries.id;


--
-- Name: organization_predecessor_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.organization_predecessor_entries (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    cin integer,
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

CREATE SEQUENCE rpo.organization_predecessor_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_predecessor_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.organization_predecessor_entries_id_seq OWNED BY rpo.organization_predecessor_entries.id;


--
-- Name: organization_registration_number_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.organization_registration_number_entries (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    registration_number character varying NOT NULL,
    effective_from date NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    effective_to date
);


--
-- Name: organization_registration_number_entries_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE rpo.organization_registration_number_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_registration_number_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.organization_registration_number_entries_id_seq OWNED BY rpo.organization_registration_number_entries.id;


--
-- Name: organization_registration_office_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.organization_registration_office_entries (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    registration_office character varying NOT NULL,
    effective_from date NOT NULL,
    effective_to date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: organization_registration_office_entries_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE rpo.organization_registration_office_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_registration_office_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.organization_registration_office_entries_id_seq OWNED BY rpo.organization_registration_office_entries.id;


--
-- Name: organization_share_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.organization_share_entries (
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

CREATE SEQUENCE rpo.organization_share_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_share_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.organization_share_entries_id_seq OWNED BY rpo.organization_share_entries.id;


--
-- Name: organization_stakeholder_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.organization_stakeholder_entries (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    stakeholder_type_id integer,
    full_name character varying,
    person_formatted_name character varying,
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
    cin integer,
    address_district character varying,
    person_given_names character varying[] DEFAULT '{}'::character varying[] NOT NULL,
    person_family_names character varying[] DEFAULT '{}'::character varying[] NOT NULL,
    person_given_family_names character varying[] DEFAULT '{}'::character varying[] NOT NULL,
    person_prefixes character varying[] DEFAULT '{}'::character varying[] NOT NULL,
    person_postfixes character varying[] DEFAULT '{}'::character varying[] NOT NULL
);


--
-- Name: organization_stakeholder_entries_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE rpo.organization_stakeholder_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_stakeholder_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.organization_stakeholder_entries_id_seq OWNED BY rpo.organization_stakeholder_entries.id;


--
-- Name: organization_statutory_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.organization_statutory_entries (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    full_name character varying,
    person_formatted_name character varying,
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
    cin integer,
    address_district character varying,
    person_given_names character varying[] DEFAULT '{}'::character varying[] NOT NULL,
    person_family_names character varying[] DEFAULT '{}'::character varying[] NOT NULL,
    person_given_family_names character varying[] DEFAULT '{}'::character varying[] NOT NULL,
    person_prefixes character varying[] DEFAULT '{}'::character varying[] NOT NULL,
    person_postfixes character varying[] DEFAULT '{}'::character varying[] NOT NULL,
    statutory_type_id integer,
    statutory_body_member character varying
);


--
-- Name: organization_statutory_entries_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE rpo.organization_statutory_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_statutory_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.organization_statutory_entries_id_seq OWNED BY rpo.organization_statutory_entries.id;


--
-- Name: organization_successor_entries; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.organization_successor_entries (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    cin integer,
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

CREATE SEQUENCE rpo.organization_successor_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_successor_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.organization_successor_entries_id_seq OWNED BY rpo.organization_successor_entries.id;


--
-- Name: organizations; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.organizations (
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
    main_organization_id integer,
    deleted_at timestamp without time zone,
    extract_in_progress boolean
);


--
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE rpo.organizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.organizations_id_seq OWNED BY rpo.organizations.id;


--
-- Name: share_forms; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.share_forms (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- Name: share_forms_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE rpo.share_forms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: share_forms_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.share_forms_id_seq OWNED BY rpo.share_forms.id;


--
-- Name: share_types; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.share_types (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- Name: share_types_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE rpo.share_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: share_types_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.share_types_id_seq OWNED BY rpo.share_types.id;


--
-- Name: stakeholder_types; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.stakeholder_types (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: stakeholder_types_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE rpo.stakeholder_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stakeholder_types_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.stakeholder_types_id_seq OWNED BY rpo.stakeholder_types.id;


--
-- Name: statutory_types; Type: TABLE; Schema: rpo; Owner: -
--

CREATE TABLE rpo.statutory_types (
    id integer NOT NULL,
    name text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: statutory_types_id_seq; Type: SEQUENCE; Schema: rpo; Owner: -
--

CREATE SEQUENCE rpo.statutory_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: statutory_types_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo; Owner: -
--

ALTER SEQUENCE rpo.statutory_types_id_seq OWNED BY rpo.statutory_types.id;


--
-- Name: organization_to_corporate_bodies; Type: TABLE; Schema: rpo_to_datahub; Owner: -
--

CREATE TABLE rpo_to_datahub.organization_to_corporate_bodies (
    id integer NOT NULL,
    corporate_body_id integer,
    organization_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    done boolean DEFAULT false NOT NULL
);


--
-- Name: organization_to_corporate_bodies_id_seq; Type: SEQUENCE; Schema: rpo_to_datahub; Owner: -
--

CREATE SEQUENCE rpo_to_datahub.organization_to_corporate_bodies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_to_corporate_bodies_id_seq; Type: SEQUENCE OWNED BY; Schema: rpo_to_datahub; Owner: -
--

ALTER SEQUENCE rpo_to_datahub.organization_to_corporate_bodies_id_seq OWNED BY rpo_to_datahub.organization_to_corporate_bodies.id;


--
-- Name: accounting_entities; Type: TABLE; Schema: ruz; Owner: -
--

CREATE TABLE ruz.accounting_entities (
    id integer NOT NULL,
    cin bigint,
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

CREATE TABLE ruz.districts (
    id integer NOT NULL,
    region_id integer NOT NULL,
    name_sk character varying NOT NULL,
    name_en character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    code character varying NOT NULL
);


--
-- Name: legal_forms; Type: TABLE; Schema: ruz; Owner: -
--

CREATE TABLE ruz.legal_forms (
    id integer NOT NULL,
    name_sk character varying NOT NULL,
    name_en character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    code character varying NOT NULL
);


--
-- Name: municipalities; Type: TABLE; Schema: ruz; Owner: -
--

CREATE TABLE ruz.municipalities (
    id integer NOT NULL,
    district_id integer NOT NULL,
    name_sk character varying NOT NULL,
    name_en character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    code character varying NOT NULL
);


--
-- Name: organization_sizes; Type: TABLE; Schema: ruz; Owner: -
--

CREATE TABLE ruz.organization_sizes (
    id integer NOT NULL,
    name_sk character varying NOT NULL,
    name_en character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    code character varying NOT NULL
);


--
-- Name: ownership_types; Type: TABLE; Schema: ruz; Owner: -
--

CREATE TABLE ruz.ownership_types (
    id integer NOT NULL,
    name_sk character varying NOT NULL,
    name_en character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    code character varying NOT NULL
);


--
-- Name: regions; Type: TABLE; Schema: ruz; Owner: -
--

CREATE TABLE ruz.regions (
    id integer NOT NULL,
    name_sk character varying NOT NULL,
    name_en character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    code character varying NOT NULL
);


--
-- Name: ruz_accounting_entities_id_seq; Type: SEQUENCE; Schema: ruz; Owner: -
--

CREATE SEQUENCE ruz.ruz_accounting_entities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ruz_accounting_entities_id_seq; Type: SEQUENCE OWNED BY; Schema: ruz; Owner: -
--

ALTER SEQUENCE ruz.ruz_accounting_entities_id_seq OWNED BY ruz.accounting_entities.id;


--
-- Name: ruz_districts_id_seq; Type: SEQUENCE; Schema: ruz; Owner: -
--

CREATE SEQUENCE ruz.ruz_districts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ruz_districts_id_seq; Type: SEQUENCE OWNED BY; Schema: ruz; Owner: -
--

ALTER SEQUENCE ruz.ruz_districts_id_seq OWNED BY ruz.districts.id;


--
-- Name: ruz_legal_forms_id_seq; Type: SEQUENCE; Schema: ruz; Owner: -
--

CREATE SEQUENCE ruz.ruz_legal_forms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ruz_legal_forms_id_seq; Type: SEQUENCE OWNED BY; Schema: ruz; Owner: -
--

ALTER SEQUENCE ruz.ruz_legal_forms_id_seq OWNED BY ruz.legal_forms.id;


--
-- Name: ruz_municipalities_id_seq; Type: SEQUENCE; Schema: ruz; Owner: -
--

CREATE SEQUENCE ruz.ruz_municipalities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ruz_municipalities_id_seq; Type: SEQUENCE OWNED BY; Schema: ruz; Owner: -
--

ALTER SEQUENCE ruz.ruz_municipalities_id_seq OWNED BY ruz.municipalities.id;


--
-- Name: ruz_organization_sizes_id_seq; Type: SEQUENCE; Schema: ruz; Owner: -
--

CREATE SEQUENCE ruz.ruz_organization_sizes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ruz_organization_sizes_id_seq; Type: SEQUENCE OWNED BY; Schema: ruz; Owner: -
--

ALTER SEQUENCE ruz.ruz_organization_sizes_id_seq OWNED BY ruz.organization_sizes.id;


--
-- Name: ruz_ownership_types_id_seq; Type: SEQUENCE; Schema: ruz; Owner: -
--

CREATE SEQUENCE ruz.ruz_ownership_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ruz_ownership_types_id_seq; Type: SEQUENCE OWNED BY; Schema: ruz; Owner: -
--

ALTER SEQUENCE ruz.ruz_ownership_types_id_seq OWNED BY ruz.ownership_types.id;


--
-- Name: ruz_regions_id_seq; Type: SEQUENCE; Schema: ruz; Owner: -
--

CREATE SEQUENCE ruz.ruz_regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ruz_regions_id_seq; Type: SEQUENCE OWNED BY; Schema: ruz; Owner: -
--

ALTER SEQUENCE ruz.ruz_regions_id_seq OWNED BY ruz.regions.id;


--
-- Name: sk_nace_categories; Type: TABLE; Schema: ruz; Owner: -
--

CREATE TABLE ruz.sk_nace_categories (
    id integer NOT NULL,
    name_sk character varying NOT NULL,
    name_en character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    code character varying NOT NULL
);


--
-- Name: ruz_sk_nace_categories_id_seq; Type: SEQUENCE; Schema: ruz; Owner: -
--

CREATE SEQUENCE ruz.ruz_sk_nace_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ruz_sk_nace_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: ruz; Owner: -
--

ALTER SEQUENCE ruz.ruz_sk_nace_categories_id_seq OWNED BY ruz.sk_nace_categories.id;


--
-- Name: accounting_entity_to_corporate_bodies; Type: TABLE; Schema: ruz_to_datahub; Owner: -
--

CREATE TABLE ruz_to_datahub.accounting_entity_to_corporate_bodies (
    id integer NOT NULL,
    corporate_body_id integer,
    accounting_entity_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    done boolean DEFAULT false NOT NULL
);


--
-- Name: accounting_entity_to_corporate_bodies_id_seq; Type: SEQUENCE; Schema: ruz_to_datahub; Owner: -
--

CREATE SEQUENCE ruz_to_datahub.accounting_entity_to_corporate_bodies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accounting_entity_to_corporate_bodies_id_seq; Type: SEQUENCE OWNED BY; Schema: ruz_to_datahub; Owner: -
--

ALTER SEQUENCE ruz_to_datahub.accounting_entity_to_corporate_bodies_id_seq OWNED BY ruz_to_datahub.accounting_entity_to_corporate_bodies.id;


--
-- Name: debtors; Type: TABLE; Schema: socpoist; Owner: -
--

CREATE TABLE socpoist.debtors (
    id integer NOT NULL,
    name character varying NOT NULL,
    address character varying,
    city character varying,
    amount numeric NOT NULL,
    published_on date NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: debtors_id_seq; Type: SEQUENCE; Schema: socpoist; Owner: -
--

CREATE SEQUENCE socpoist.debtors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: debtors_id_seq; Type: SEQUENCE OWNED BY; Schema: socpoist; Owner: -
--

ALTER SEQUENCE socpoist.debtors_id_seq OWNED BY socpoist.debtors.id;


--
-- Name: public_authority_edesks; Type: TABLE; Schema: upvs; Owner: -
--

CREATE TABLE upvs.public_authority_edesks (
    id integer NOT NULL,
    cin bigint NOT NULL,
    uri character varying NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: public_authority_edesks_id_seq; Type: SEQUENCE; Schema: upvs; Owner: -
--

CREATE SEQUENCE upvs.public_authority_edesks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: public_authority_edesks_id_seq; Type: SEQUENCE OWNED BY; Schema: upvs; Owner: -
--

ALTER SEQUENCE upvs.public_authority_edesks_id_seq OWNED BY upvs.public_authority_edesks.id;


--
-- Name: services_with_forms; Type: TABLE; Schema: upvs; Owner: -
--

CREATE TABLE upvs.services_with_forms (
    id integer NOT NULL,
    instance_id integer NOT NULL,
    external_code character varying,
    meta_is_code character varying,
    name character varying,
    type character varying,
    institution_uri character varying NOT NULL,
    institution_name character varying,
    valid_from timestamp without time zone,
    valid_to timestamp without time zone,
    url character varying,
    info_url character varying,
    schema_url character varying,
    changed_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: services_with_forms_id_seq; Type: SEQUENCE; Schema: upvs; Owner: -
--

CREATE SEQUENCE upvs.services_with_forms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: services_with_forms_id_seq; Type: SEQUENCE OWNED BY; Schema: upvs; Owner: -
--

ALTER SEQUENCE upvs.services_with_forms_id_seq OWNED BY upvs.services_with_forms.id;


--
-- Name: debtors; Type: TABLE; Schema: vszp; Owner: -
--

CREATE TABLE vszp.debtors (
    id integer NOT NULL,
    name character varying NOT NULL,
    address character varying,
    city character varying,
    postal_code character varying,
    amount numeric NOT NULL,
    payer_type character varying,
    full_health_care_claim boolean,
    published_on date NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    cin bigint
);


--
-- Name: debtors_id_seq; Type: SEQUENCE; Schema: vszp; Owner: -
--

CREATE SEQUENCE vszp.debtors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: debtors_id_seq; Type: SEQUENCE OWNED BY; Schema: vszp; Owner: -
--

ALTER SEQUENCE vszp.debtors_id_seq OWNED BY vszp.debtors.id;


--
-- Name: contractors; Type: TABLE; Schema: vvo; Owner: -
--

CREATE TABLE vvo.contractors (
    id integer NOT NULL,
    contract_award_id integer NOT NULL,
    corporate_body_name character varying,
    corporate_body_cin_raw character varying,
    corporate_body_cin bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    sme boolean,
    country character varying
);


--
-- Name: agreement_suppliers_id_seq; Type: SEQUENCE; Schema: vvo; Owner: -
--

CREATE SEQUENCE vvo.agreement_suppliers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: agreement_suppliers_id_seq; Type: SEQUENCE OWNED BY; Schema: vvo; Owner: -
--

ALTER SEQUENCE vvo.agreement_suppliers_id_seq OWNED BY vvo.contractors.id;


--
-- Name: contract_awards; Type: TABLE; Schema: vvo; Owner: -
--

CREATE TABLE vvo.contract_awards (
    id integer NOT NULL,
    result_notice_id integer NOT NULL,
    lot_number character varying,
    title character varying,
    concluded_on date,
    awarded boolean,
    number_of_tenders integer,
    number_of_electronic_tenders integer,
    estimated_value_amount numeric,
    estimated_value_currency character varying,
    estimated_value_vat_included boolean,
    estimated_value_vat_rate integer,
    final_value_type character varying,
    final_value_amount numeric,
    final_value_currency character varying,
    final_value_vat_included boolean,
    final_value_vat_rate integer,
    value_per_period_type character varying,
    value_per_period_value integer,
    subcontracts_assumption boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    awarded_to_group boolean,
    group_count integer,
    final_value_lowest_offer numeric,
    final_value_highest_offer numeric,
    number_of_sme_tenders integer,
    number_of_other_eu_tenders integer,
    number_of_non_eu_tenders integer
);


--
-- Name: agreements_id_seq; Type: SEQUENCE; Schema: vvo; Owner: -
--

CREATE SEQUENCE vvo.agreements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: agreements_id_seq; Type: SEQUENCE OWNED BY; Schema: vvo; Owner: -
--

ALTER SEQUENCE vvo.agreements_id_seq OWNED BY vvo.contract_awards.id;


--
-- Name: notice_types; Type: TABLE; Schema: vvo; Owner: -
--

CREATE TABLE vvo.notice_types (
    id integer NOT NULL,
    code character varying NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: announcement_types_id_seq; Type: SEQUENCE; Schema: vvo; Owner: -
--

CREATE SEQUENCE vvo.announcement_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: announcement_types_id_seq; Type: SEQUENCE OWNED BY; Schema: vvo; Owner: -
--

ALTER SEQUENCE vvo.announcement_types_id_seq OWNED BY vvo.notice_types.id;


--
-- Name: bulletin_issues; Type: TABLE; Schema: vvo; Owner: -
--

CREATE TABLE vvo.bulletin_issues (
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

CREATE SEQUENCE vvo.bulletins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bulletins_id_seq; Type: SEQUENCE OWNED BY; Schema: vvo; Owner: -
--

ALTER SEQUENCE vvo.bulletins_id_seq OWNED BY vvo.bulletin_issues.id;


--
-- Name: contracting_authorities; Type: TABLE; Schema: vvo; Owner: -
--

CREATE TABLE vvo.contracting_authorities (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: contracting_authorities_id_seq; Type: SEQUENCE; Schema: vvo; Owner: -
--

CREATE SEQUENCE vvo.contracting_authorities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contracting_authorities_id_seq; Type: SEQUENCE OWNED BY; Schema: vvo; Owner: -
--

ALTER SEQUENCE vvo.contracting_authorities_id_seq OWNED BY vvo.contracting_authorities.id;


--
-- Name: contracts; Type: TABLE; Schema: vvo; Owner: -
--

CREATE TABLE vvo.contracts (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying
);


--
-- Name: contracts_id_seq; Type: SEQUENCE; Schema: vvo; Owner: -
--

CREATE SEQUENCE vvo.contracts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contracts_id_seq; Type: SEQUENCE OWNED BY; Schema: vvo; Owner: -
--

ALTER SEQUENCE vvo.contracts_id_seq OWNED BY vvo.contracts.id;


--
-- Name: notice_suppliers; Type: TABLE; Schema: vvo; Owner: -
--

CREATE TABLE vvo.notice_suppliers (
    id integer NOT NULL,
    notice_id integer NOT NULL,
    name character varying NOT NULL,
    cin bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    cin_raw character varying
);


--
-- Name: notice_suppliers_id_seq; Type: SEQUENCE; Schema: vvo; Owner: -
--

CREATE SEQUENCE vvo.notice_suppliers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notice_suppliers_id_seq; Type: SEQUENCE OWNED BY; Schema: vvo; Owner: -
--

ALTER SEQUENCE vvo.notice_suppliers_id_seq OWNED BY vvo.notice_suppliers.id;


--
-- Name: notices; Type: TABLE; Schema: vvo; Owner: -
--

CREATE TABLE vvo.notices (
    id integer NOT NULL,
    title character varying NOT NULL,
    contracting_authority_name character varying NOT NULL,
    contracting_authority_cin bigint NOT NULL,
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

CREATE SEQUENCE vvo.notices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notices_id_seq; Type: SEQUENCE OWNED BY; Schema: vvo; Owner: -
--

ALTER SEQUENCE vvo.notices_id_seq OWNED BY vvo.notices.id;


--
-- Name: procedure_types; Type: TABLE; Schema: vvo; Owner: -
--

CREATE TABLE vvo.procedure_types (
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

CREATE SEQUENCE vvo.procedure_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: procedure_types_id_seq; Type: SEQUENCE OWNED BY; Schema: vvo; Owner: -
--

ALTER SEQUENCE vvo.procedure_types_id_seq OWNED BY vvo.procedure_types.id;


--
-- Name: raw_notices; Type: TABLE; Schema: vvo; Owner: -
--

CREATE TABLE vvo.raw_notices (
    id integer NOT NULL,
    bulletin_issue_id integer NOT NULL,
    number integer NOT NULL,
    notice_type_id integer,
    body xml NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    zovo_type character varying,
    zovo_version integer,
    zovo_category integer,
    contract_id integer,
    contracting_authority_id integer
);


--
-- Name: raw_notices_id_seq; Type: SEQUENCE; Schema: vvo; Owner: -
--

CREATE SEQUENCE vvo.raw_notices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: raw_notices_id_seq; Type: SEQUENCE OWNED BY; Schema: vvo; Owner: -
--

ALTER SEQUENCE vvo.raw_notices_id_seq OWNED BY vvo.raw_notices.id;


--
-- Name: result_notice_main_cpvs; Type: TABLE; Schema: vvo; Owner: -
--

CREATE TABLE vvo.result_notice_main_cpvs (
    id integer NOT NULL,
    result_notice_id integer NOT NULL,
    code character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: result_notice_cpvs_id_seq; Type: SEQUENCE; Schema: vvo; Owner: -
--

CREATE SEQUENCE vvo.result_notice_cpvs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: result_notice_cpvs_id_seq; Type: SEQUENCE OWNED BY; Schema: vvo; Owner: -
--

ALTER SEQUENCE vvo.result_notice_cpvs_id_seq OWNED BY vvo.result_notice_main_cpvs.id;


--
-- Name: result_notice_lot_main_cpvs; Type: TABLE; Schema: vvo; Owner: -
--

CREATE TABLE vvo.result_notice_lot_main_cpvs (
    id integer NOT NULL,
    result_notice_lot_id integer NOT NULL,
    code character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: result_notice_item_cpvs_id_seq; Type: SEQUENCE; Schema: vvo; Owner: -
--

CREATE SEQUENCE vvo.result_notice_item_cpvs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: result_notice_item_cpvs_id_seq; Type: SEQUENCE OWNED BY; Schema: vvo; Owner: -
--

ALTER SEQUENCE vvo.result_notice_item_cpvs_id_seq OWNED BY vvo.result_notice_lot_main_cpvs.id;


--
-- Name: result_notice_lots; Type: TABLE; Schema: vvo; Owner: -
--

CREATE TABLE vvo.result_notice_lots (
    id integer NOT NULL,
    result_notice_id integer NOT NULL,
    number character varying,
    title character varying,
    nuts character varying NOT NULL,
    description character varying,
    eu_funds boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: result_notice_items_id_seq; Type: SEQUENCE; Schema: vvo; Owner: -
--

CREATE SEQUENCE vvo.result_notice_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: result_notice_items_id_seq; Type: SEQUENCE OWNED BY; Schema: vvo; Owner: -
--

ALTER SEQUENCE vvo.result_notice_items_id_seq OWNED BY vvo.result_notice_lots.id;


--
-- Name: result_notices; Type: TABLE; Schema: vvo; Owner: -
--

CREATE TABLE vvo.result_notices (
    id integer NOT NULL,
    bulletin_issue_id integer NOT NULL,
    raw_notice_id integer NOT NULL,
    notice_type_id integer NOT NULL,
    contracting_authority_id integer NOT NULL,
    contract_id integer NOT NULL,
    title character varying NOT NULL,
    short_description character varying NOT NULL,
    reference_number character varying NOT NULL,
    contract_type character varying NOT NULL,
    contract_sub_type character varying,
    nuts character varying,
    main_cpv character varying,
    gpa boolean,
    e_auction boolean,
    eu_funds boolean,
    total_final_value_type character varying,
    total_final_value_amount numeric,
    total_final_value_currency character varying,
    total_final_value_vat_included boolean,
    total_final_value_vat_rate integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    total_final_value_lowest_offer numeric,
    total_final_value_highest_offer numeric,
    procedure_type character varying,
    total_estimated_value_type character varying,
    total_estimated_value_amount numeric,
    total_estimated_value_lowest_offer numeric,
    total_estimated_value_highest_offer numeric,
    total_estimated_value_currency character varying,
    total_estimated_value_vat_included boolean,
    direct_negotiate_procedure_reason character varying
);


--
-- Name: result_notices_id_seq; Type: SEQUENCE; Schema: vvo; Owner: -
--

CREATE SEQUENCE vvo.result_notices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: result_notices_id_seq; Type: SEQUENCE OWNED BY; Schema: vvo; Owner: -
--

ALTER SEQUENCE vvo.result_notices_id_seq OWNED BY vvo.result_notices.id;


--
-- Name: attachments id; Type: DEFAULT; Schema: crz; Owner: -
--

ALTER TABLE ONLY crz.attachments ALTER COLUMN id SET DEFAULT nextval('crz.attachments_id_seq'::regclass);


--
-- Name: contracts id; Type: DEFAULT; Schema: crz; Owner: -
--

ALTER TABLE ONLY crz.contracts ALTER COLUMN id SET DEFAULT nextval('crz.contracts_id_seq'::regclass);


--
-- Name: departments id; Type: DEFAULT; Schema: crz; Owner: -
--

ALTER TABLE ONLY crz.departments ALTER COLUMN id SET DEFAULT nextval('crz.departments_id_seq'::regclass);


--
-- Name: corporate_bodies id; Type: DEFAULT; Schema: datahub; Owner: -
--

ALTER TABLE ONLY datahub.corporate_bodies ALTER COLUMN id SET DEFAULT nextval('datahub.corporate_bodies_id_seq'::regclass);


--
-- Name: income_tax_subjects id; Type: DEFAULT; Schema: fs; Owner: -
--

ALTER TABLE ONLY fs.income_tax_subjects ALTER COLUMN id SET DEFAULT nextval('fs.income_tax_subjects_id_seq'::regclass);


--
-- Name: tax_liabilities id; Type: DEFAULT; Schema: fs; Owner: -
--

ALTER TABLE ONLY fs.tax_liabilities ALTER COLUMN id SET DEFAULT nextval('fs.tax_liabilities_id_seq'::regclass);


--
-- Name: vat_subjects id; Type: DEFAULT; Schema: fs; Owner: -
--

ALTER TABLE ONLY fs.vat_subjects ALTER COLUMN id SET DEFAULT nextval('fs.vat_subjects_id_seq'::regclass);


--
-- Name: income_tax_subject_to_corporate_bodies id; Type: DEFAULT; Schema: fs_to_datahub; Owner: -
--

ALTER TABLE ONLY fs_to_datahub.income_tax_subject_to_corporate_bodies ALTER COLUMN id SET DEFAULT nextval('fs_to_datahub.income_tax_subject_to_corporate_bodies_id_seq'::regclass);


--
-- Name: tax_liability_to_corporate_bodies id; Type: DEFAULT; Schema: fs_to_datahub; Owner: -
--

ALTER TABLE ONLY fs_to_datahub.tax_liability_to_corporate_bodies ALTER COLUMN id SET DEFAULT nextval('fs_to_datahub.tax_liability_to_corporate_bodies_id_seq'::regclass);


--
-- Name: vat_subject_to_corporate_bodies id; Type: DEFAULT; Schema: fs_to_datahub; Owner: -
--

ALTER TABLE ONLY fs_to_datahub.vat_subject_to_corporate_bodies ALTER COLUMN id SET DEFAULT nextval('fs_to_datahub.vat_subject_to_corporate_bodies_id_seq'::regclass);


--
-- Name: aktivity id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.aktivity ALTER COLUMN id SET DEFAULT nextval('itms.aktivity_id_seq'::regclass);


--
-- Name: ciselniky id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.ciselniky ALTER COLUMN id SET DEFAULT nextval('itms.ciselniky_id_seq'::regclass);


--
-- Name: deklarovane_vydavky id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.deklarovane_vydavky ALTER COLUMN id SET DEFAULT nextval('itms.deklarovane_vydavky_id_seq'::regclass);


--
-- Name: deklarovane_vydavky_sumy_neschvalene_na_preplatenie id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.deklarovane_vydavky_sumy_neschvalene_na_preplatenie ALTER COLUMN id SET DEFAULT nextval('itms.deklarovane_vydavky_sumy_neschvalene_na_preplatenie_id_seq'::regclass);


--
-- Name: deklarovane_vydavky_sumy_neziadane_na_preplatenie id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.deklarovane_vydavky_sumy_neziadane_na_preplatenie ALTER COLUMN id SET DEFAULT nextval('itms.deklarovane_vydavky_sumy_neziadane_na_preplatenie_id_seq'::regclass);


--
-- Name: dodavatelia id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.dodavatelia ALTER COLUMN id SET DEFAULT nextval('itms.dodavatelia_id_seq'::regclass);


--
-- Name: hodnoty_ciselnikov id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.hodnoty_ciselnikov ALTER COLUMN id SET DEFAULT nextval('itms.hodnoty_ciselnikov_id_seq'::regclass);


--
-- Name: intenzity id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.intenzity ALTER COLUMN id SET DEFAULT nextval('itms.intenzity_id_seq'::regclass);


--
-- Name: intenzity_zdroje id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.intenzity_zdroje ALTER COLUMN id SET DEFAULT nextval('itms.intenzity_zdroje_id_seq'::regclass);


--
-- Name: konkretne_ciele id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.konkretne_ciele ALTER COLUMN id SET DEFAULT nextval('itms.konkretne_ciele_id_seq'::regclass);


--
-- Name: konkretne_ciele_hodnoty_ciselnikov id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.konkretne_ciele_hodnoty_ciselnikov ALTER COLUMN id SET DEFAULT nextval('itms.konkretne_ciele_hodnoty_ciselnikov_id_seq'::regclass);


--
-- Name: konkretne_ciele_typy_aktivit id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.konkretne_ciele_typy_aktivit ALTER COLUMN id SET DEFAULT nextval('itms.konkretne_ciele_typy_aktivit_id_seq'::regclass);


--
-- Name: miesta_realizacie id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.miesta_realizacie ALTER COLUMN id SET DEFAULT nextval('itms.miesta_realizacie_id_seq'::regclass);


--
-- Name: monitorovacie_terminy id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.monitorovacie_terminy ALTER COLUMN id SET DEFAULT nextval('itms.monitorovacie_terminy_id_seq'::regclass);


--
-- Name: nezrovnalosti id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti ALTER COLUMN id SET DEFAULT nextval('itms.nezrovnalosti_id_seq'::regclass);


--
-- Name: nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost ALTER COLUMN id SET DEFAULT nextval('itms.nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost_id_seq'::regclass);


--
-- Name: nezrovnalosti_subjekty_ktore_zistili_nezrovnalost id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_subjekty_ktore_zistili_nezrovnalost ALTER COLUMN id SET DEFAULT nextval('itms.nezrovnalosti_subjekty_ktore_zistili_nezrovnalost_id_seq'::regclass);


--
-- Name: nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie ALTER COLUMN id SET DEFAULT nextval('itms.nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie_id_seq'::regclass);


--
-- Name: nezrovnalosti_suvisiace_nezrovnalosti id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_suvisiace_nezrovnalosti ALTER COLUMN id SET DEFAULT nextval('itms.nezrovnalosti_suvisiace_nezrovnalosti_id_seq'::regclass);


--
-- Name: nezrovnalosti_suvisiace_pohladavkove_doklady id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_suvisiace_pohladavkove_doklady ALTER COLUMN id SET DEFAULT nextval('itms.nezrovnalosti_suvisiace_pohladavkove_doklady_id_seq'::regclass);


--
-- Name: nezrovnalosti_suvisiace_verejne_obstaravania id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_suvisiace_verejne_obstaravania ALTER COLUMN id SET DEFAULT nextval('itms.nezrovnalosti_suvisiace_verejne_obstaravania_id_seq'::regclass);


--
-- Name: nezrovnalosti_suvisiace_zop id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_suvisiace_zop ALTER COLUMN id SET DEFAULT nextval('itms.nezrovnalosti_suvisiace_zop_id_seq'::regclass);


--
-- Name: nezrovnalosti_typy_nezrovnalosti id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_typy_nezrovnalosti ALTER COLUMN id SET DEFAULT nextval('itms.nezrovnalosti_typy_nezrovnalosti_id_seq'::regclass);


--
-- Name: nuts_kody id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nuts_kody ALTER COLUMN id SET DEFAULT nextval('itms.nuts_kody_id_seq'::regclass);


--
-- Name: operacne_programy id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.operacne_programy ALTER COLUMN id SET DEFAULT nextval('itms.operacne_programy_id_seq'::regclass);


--
-- Name: organizacne_zlozky id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.organizacne_zlozky ALTER COLUMN id SET DEFAULT nextval('itms.organizacne_zlozky_id_seq'::regclass);


--
-- Name: osoby id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.osoby ALTER COLUMN id SET DEFAULT nextval('itms.osoby_id_seq'::regclass);


--
-- Name: pohladavkove_doklady id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.pohladavkove_doklady ALTER COLUMN id SET DEFAULT nextval('itms.pohladavkove_doklady_id_seq'::regclass);


--
-- Name: pohladavkove_doklady_suvisiace_verejne_obstaravania id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.pohladavkove_doklady_suvisiace_verejne_obstaravania ALTER COLUMN id SET DEFAULT nextval('itms.pohladavkove_doklady_suvisiace_verejne_obstaravania_id_seq'::regclass);


--
-- Name: pohladavkove_doklady_suvisiace_zop id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.pohladavkove_doklady_suvisiace_zop ALTER COLUMN id SET DEFAULT nextval('itms.pohladavkove_doklady_suvisiace_zop_id_seq'::regclass);


--
-- Name: polozky_rozpoctu id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.polozky_rozpoctu ALTER COLUMN id SET DEFAULT nextval('itms.polozky_rozpoctu_id_seq'::regclass);


--
-- Name: prioritne_osi id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.prioritne_osi ALTER COLUMN id SET DEFAULT nextval('itms.prioritne_osi_id_seq'::regclass);


--
-- Name: projektove_ukazovatele id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projektove_ukazovatele ALTER COLUMN id SET DEFAULT nextval('itms.projektove_ukazovatele_id_seq'::regclass);


--
-- Name: projektove_ukazovatele_casy_plnenia id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projektove_ukazovatele_casy_plnenia ALTER COLUMN id SET DEFAULT nextval('itms.projektove_ukazovatele_casy_plnenia_id_seq'::regclass);


--
-- Name: projektove_ukazovatele_fondy id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projektove_ukazovatele_fondy ALTER COLUMN id SET DEFAULT nextval('itms.projektove_ukazovatele_fondy_id_seq'::regclass);


--
-- Name: projekty id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty ALTER COLUMN id SET DEFAULT nextval('itms.projekty_id_seq'::regclass);


--
-- Name: projekty_aktivity id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_aktivity ALTER COLUMN id SET DEFAULT nextval('itms.projekty_aktivity_id_seq'::regclass);


--
-- Name: projekty_formy_financovania id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_formy_financovania ALTER COLUMN id SET DEFAULT nextval('itms.projekty_formy_financovania_id_seq'::regclass);


--
-- Name: projekty_hospodarske_cinnosti id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_hospodarske_cinnosti ALTER COLUMN id SET DEFAULT nextval('itms.projekty_hospodarske_cinnosti_id_seq'::regclass);


--
-- Name: projekty_intenzity id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_intenzity ALTER COLUMN id SET DEFAULT nextval('itms.projekty_intenzity_id_seq'::regclass);


--
-- Name: projekty_meratelne_ukazovatele id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_meratelne_ukazovatele ALTER COLUMN id SET DEFAULT nextval('itms.projekty_meratelne_ukazovatele_id_seq'::regclass);


--
-- Name: projekty_miesta_realizacie id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_miesta_realizacie ALTER COLUMN id SET DEFAULT nextval('itms.projekty_miesta_realizacie_id_seq'::regclass);


--
-- Name: projekty_miesta_realizacie_mimo_uzemia_op id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_miesta_realizacie_mimo_uzemia_op ALTER COLUMN id SET DEFAULT nextval('itms.projekty_miesta_realizacie_mimo_uzemia_op_id_seq'::regclass);


--
-- Name: projekty_oblasti_intervencie id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_oblasti_intervencie ALTER COLUMN id SET DEFAULT nextval('itms.projekty_oblasti_intervencie_id_seq'::regclass);


--
-- Name: projekty_organizacne_zlozky id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_organizacne_zlozky ALTER COLUMN id SET DEFAULT nextval('itms.projekty_organizacne_zlozky_id_seq'::regclass);


--
-- Name: projekty_partneri id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_partneri ALTER COLUMN id SET DEFAULT nextval('itms.projekty_partneri_id_seq'::regclass);


--
-- Name: projekty_polozky_rozpoctu id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_polozky_rozpoctu ALTER COLUMN id SET DEFAULT nextval('itms.projekty_polozky_rozpoctu_id_seq'::regclass);


--
-- Name: projekty_sekundarne_tematicke_okruhy id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_sekundarne_tematicke_okruhy ALTER COLUMN id SET DEFAULT nextval('itms.projekty_sekundarne_tematicke_okruhy_id_seq'::regclass);


--
-- Name: projekty_typy_uzemia id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_typy_uzemia ALTER COLUMN id SET DEFAULT nextval('itms.projekty_typy_uzemia_id_seq'::regclass);


--
-- Name: projekty_uzemne_mechanizmy id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_uzemne_mechanizmy ALTER COLUMN id SET DEFAULT nextval('itms.projekty_uzemne_mechanizmy_id_seq'::regclass);


--
-- Name: subjekty id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.subjekty ALTER COLUMN id SET DEFAULT nextval('itms.subjekty_id_seq'::regclass);


--
-- Name: typy_aktivit id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.typy_aktivit ALTER COLUMN id SET DEFAULT nextval('itms.typy_aktivit_id_seq'::regclass);


--
-- Name: uctovne_doklady id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.uctovne_doklady ALTER COLUMN id SET DEFAULT nextval('itms.uctovne_doklady_id_seq'::regclass);


--
-- Name: uctovne_doklady_polozky_dokladu id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.uctovne_doklady_polozky_dokladu ALTER COLUMN id SET DEFAULT nextval('itms.uctovne_doklady_polozky_dokladu_id_seq'::regclass);


--
-- Name: uctovne_doklady_projekty id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.uctovne_doklady_projekty ALTER COLUMN id SET DEFAULT nextval('itms.uctovne_doklady_projekty_id_seq'::regclass);


--
-- Name: verejne_obstaravania id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania ALTER COLUMN id SET DEFAULT nextval('itms.verejne_obstaravania_id_seq'::regclass);


--
-- Name: verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik ALTER COLUMN id SET DEFAULT nextval('itms.verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovn_id_seq'::regclass);


--
-- Name: verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik ALTER COLUMN id SET DEFAULT nextval('itms.verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik_id_seq'::regclass);


--
-- Name: verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik ALTER COLUMN id SET DEFAULT nextval('itms.verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik_id_seq'::regclass);


--
-- Name: verejne_obstaravania_operacne_programy id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania_operacne_programy ALTER COLUMN id SET DEFAULT nextval('itms.verejne_obstaravania_operacne_programy_id_seq'::regclass);


--
-- Name: verejne_obstaravania_projekty id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania_projekty ALTER COLUMN id SET DEFAULT nextval('itms.verejne_obstaravania_projekty_id_seq'::regclass);


--
-- Name: verejne_obstaravania_uctovne_doklady id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania_uctovne_doklady ALTER COLUMN id SET DEFAULT nextval('itms.verejne_obstaravania_uctovne_doklady_id_seq'::regclass);


--
-- Name: vyzvy_planovane id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_planovane ALTER COLUMN id SET DEFAULT nextval('itms.vyzvy_planovane_id_seq'::regclass);


--
-- Name: vyzvy_planovane_doplnujuce_info id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_planovane_doplnujuce_info ALTER COLUMN id SET DEFAULT nextval('itms.vyzvy_planovane_doplnujuce_info_id_seq'::regclass);


--
-- Name: vyzvy_planovane_konkretne_ciele id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_planovane_konkretne_ciele ALTER COLUMN id SET DEFAULT nextval('itms.vyzvy_planovane_konkretne_ciele_id_seq'::regclass);


--
-- Name: vyzvy_planovane_poskytovatelia id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_planovane_poskytovatelia ALTER COLUMN id SET DEFAULT nextval('itms.vyzvy_planovane_poskytovatelia_id_seq'::regclass);


--
-- Name: vyzvy_vyhlasene id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene ALTER COLUMN id SET DEFAULT nextval('itms.vyzvy_vyhlasene_id_seq'::regclass);


--
-- Name: vyzvy_vyhlasene_doplnujuce_info id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_doplnujuce_info ALTER COLUMN id SET DEFAULT nextval('itms.vyzvy_vyhlasene_doplnujuce_info_id_seq'::regclass);


--
-- Name: vyzvy_vyhlasene_fondy id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_fondy ALTER COLUMN id SET DEFAULT nextval('itms.vyzvy_vyhlasene_fondy_id_seq'::regclass);


--
-- Name: vyzvy_vyhlasene_konkretne_ciele_typy_aktivit id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit ALTER COLUMN id SET DEFAULT nextval('itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_id_seq'::regclass);


--
-- Name: vyzvy_vyhlasene_kontaktne_osoby id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_kontaktne_osoby ALTER COLUMN id SET DEFAULT nextval('itms.vyzvy_vyhlasene_kontaktne_osoby_id_seq'::regclass);


--
-- Name: vyzvy_vyhlasene_poskytovatelia id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_poskytovatelia ALTER COLUMN id SET DEFAULT nextval('itms.vyzvy_vyhlasene_poskytovatelia_id_seq'::regclass);


--
-- Name: vyzvy_vyhlasene_posudzovane_obdobia id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_posudzovane_obdobia ALTER COLUMN id SET DEFAULT nextval('itms.vyzvy_vyhlasene_posudzovane_obdobia_id_seq'::regclass);


--
-- Name: vyzvy_vyhlasene_vyzvy_planovane id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_vyzvy_planovane ALTER COLUMN id SET DEFAULT nextval('itms.vyzvy_vyhlasene_vyzvy_planovane_id_seq'::regclass);


--
-- Name: zmluvy_verejne_obstaravania id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zmluvy_verejne_obstaravania ALTER COLUMN id SET DEFAULT nextval('itms.zmluvy_verejne_obstaravania_id_seq'::regclass);


--
-- Name: zmluvy_verejne_obstaravania_dalsie_url id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zmluvy_verejne_obstaravania_dalsie_url ALTER COLUMN id SET DEFAULT nextval('itms.zmluvy_verejne_obstaravania_dalsie_url_id_seq'::regclass);


--
-- Name: zmluvy_verejne_obstaravania_dodavatelia id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zmluvy_verejne_obstaravania_dodavatelia ALTER COLUMN id SET DEFAULT nextval('itms.zmluvy_verejne_obstaravania_dodavatelia_id_seq'::regclass);


--
-- Name: zonfp_prijate id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_prijate_id_seq'::regclass);


--
-- Name: zonfp_prijate_aktivity_projekt id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_aktivity_projekt ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_prijate_aktivity_projekt_id_seq'::regclass);


--
-- Name: zonfp_prijate_formy_financovania id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_formy_financovania ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_prijate_formy_financovania_id_seq'::regclass);


--
-- Name: zonfp_prijate_hospodarske_cinnosti id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_hospodarske_cinnosti ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_prijate_hospodarske_cinnosti_id_seq'::regclass);


--
-- Name: zonfp_prijate_meratelne_ukazovatele id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_meratelne_ukazovatele ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_prijate_meratelne_ukazovatele_id_seq'::regclass);


--
-- Name: zonfp_prijate_miesta_realizacie id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_miesta_realizacie ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_prijate_miesta_realizacie_id_seq'::regclass);


--
-- Name: zonfp_prijate_miesta_realizacie_mimo_uzemia_op id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_miesta_realizacie_mimo_uzemia_op ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_prijate_miesta_realizacie_mimo_uzemia_op_id_seq'::regclass);


--
-- Name: zonfp_prijate_oblasti_intervencie id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_oblasti_intervencie ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_prijate_oblasti_intervencie_id_seq'::regclass);


--
-- Name: zonfp_prijate_organizacne_zlozky id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_organizacne_zlozky ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_prijate_organizacne_zlozky_id_seq'::regclass);


--
-- Name: zonfp_prijate_partneri id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_partneri ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_prijate_partneri_id_seq'::regclass);


--
-- Name: zonfp_prijate_polozky_rozpoctu id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_polozky_rozpoctu ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_prijate_polozky_rozpoctu_id_seq'::regclass);


--
-- Name: zonfp_prijate_sekundarne_tematicke_okruhy id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_sekundarne_tematicke_okruhy ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_prijate_sekundarne_tematicke_okruhy_id_seq'::regclass);


--
-- Name: zonfp_prijate_typy_uzemia id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_typy_uzemia ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_prijate_typy_uzemia_id_seq'::regclass);


--
-- Name: zonfp_prijate_uzemne_mechanizmy id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_uzemne_mechanizmy ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_prijate_uzemne_mechanizmy_id_seq'::regclass);


--
-- Name: zonfp_spracovane id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_id_seq'::regclass);


--
-- Name: zonfp_spracovane_aktivity_projekt id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_aktivity_projekt ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_aktivity_projekt_id_seq'::regclass);


--
-- Name: zonfp_spracovane_formy_financovania id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_formy_financovania ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_formy_financovania_id_seq'::regclass);


--
-- Name: zonfp_spracovane_hodnotitelia id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_hodnotitelia ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_hodnotitelia_id_seq'::regclass);


--
-- Name: zonfp_spracovane_hospodarske_cinnosti id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_hospodarske_cinnosti ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_hospodarske_cinnosti_id_seq'::regclass);


--
-- Name: zonfp_spracovane_meratelne_ukazovatele id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_meratelne_ukazovatele ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_meratelne_ukazovatele_id_seq'::regclass);


--
-- Name: zonfp_spracovane_miesta_realizacie id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_miesta_realizacie ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_miesta_realizacie_id_seq'::regclass);


--
-- Name: zonfp_spracovane_miesta_realizacie_mimo_uzemia_op id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_miesta_realizacie_mimo_uzemia_op ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_miesta_realizacie_mimo_uzemia_op_id_seq'::regclass);


--
-- Name: zonfp_spracovane_oblasti_intervencie id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_oblasti_intervencie ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_oblasti_intervencie_id_seq'::regclass);


--
-- Name: zonfp_spracovane_organizacne_zlozky id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_organizacne_zlozky ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_organizacne_zlozky_id_seq'::regclass);


--
-- Name: zonfp_spracovane_partneri id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_partneri ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_partneri_id_seq'::regclass);


--
-- Name: zonfp_spracovane_polozky_rozpoctu id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_polozky_rozpoctu ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_polozky_rozpoctu_id_seq'::regclass);


--
-- Name: zonfp_spracovane_sekundarne_tematicke_okruhy id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_sekundarne_tematicke_okruhy ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_sekundarne_tematicke_okruhy_id_seq'::regclass);


--
-- Name: zonfp_spracovane_typy_uzemia id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_typy_uzemia ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_typy_uzemia_id_seq'::regclass);


--
-- Name: zonfp_spracovane_uzemne_mechanizmy id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_uzemne_mechanizmy ALTER COLUMN id SET DEFAULT nextval('itms.zonfp_uzemne_mechanizmy_id_seq'::regclass);


--
-- Name: zop id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zop ALTER COLUMN id SET DEFAULT nextval('itms.zop_id_seq'::regclass);


--
-- Name: zop_predkladane_za_subjekty id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zop_predkladane_za_subjekty ALTER COLUMN id SET DEFAULT nextval('itms.zop_predkladane_za_subjekty_id_seq'::regclass);


--
-- Name: dokumenty id; Type: DEFAULT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.dokumenty ALTER COLUMN id SET DEFAULT nextval('metais.dokumenty_id_seq'::regclass);


--
-- Name: isvs id; Type: DEFAULT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.isvs ALTER COLUMN id SET DEFAULT nextval('metais.isvs_id_seq'::regclass);


--
-- Name: projekty id; Type: DEFAULT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.projekty ALTER COLUMN id SET DEFAULT nextval('metais.projekty_id_seq'::regclass);


--
-- Name: bulletin_issues id; Type: DEFAULT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.bulletin_issues ALTER COLUMN id SET DEFAULT nextval('ov.bulletin_issues_id_seq'::regclass);


--
-- Name: konkurz_restrukturalizacia_actors id; Type: DEFAULT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.konkurz_restrukturalizacia_actors ALTER COLUMN id SET DEFAULT nextval('ov.konkurz_restrukturalizacia_actors_id_seq'::regclass);


--
-- Name: konkurz_restrukturalizacia_issues id; Type: DEFAULT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.konkurz_restrukturalizacia_issues ALTER COLUMN id SET DEFAULT nextval('ov.konkurz_restrukturalizacia_issues_id_seq'::regclass);


--
-- Name: konkurz_restrukturalizacia_proposings id; Type: DEFAULT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.konkurz_restrukturalizacia_proposings ALTER COLUMN id SET DEFAULT nextval('ov.konkurz_restrukturalizacia_proposings_id_seq'::regclass);


--
-- Name: konkurz_vyrovnanie_issues id; Type: DEFAULT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.konkurz_vyrovnanie_issues ALTER COLUMN id SET DEFAULT nextval('ov.konkurz_vyrovnanie_issues_id_seq'::regclass);


--
-- Name: likvidator_issues id; Type: DEFAULT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.likvidator_issues ALTER COLUMN id SET DEFAULT nextval('ov.likvidator_issues_id_seq'::regclass);


--
-- Name: or_podanie_issue_documents id; Type: DEFAULT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.or_podanie_issue_documents ALTER COLUMN id SET DEFAULT nextval('ov.or_podanie_issue_documents_id_seq'::regclass);


--
-- Name: or_podanie_issues id; Type: DEFAULT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.or_podanie_issues ALTER COLUMN id SET DEFAULT nextval('ov.or_podanie_issues_id_seq'::regclass);


--
-- Name: raw_issues id; Type: DEFAULT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.raw_issues ALTER COLUMN id SET DEFAULT nextval('ov.raw_issues_id_seq'::regclass);


--
-- Name: znizenie_imania_ceos id; Type: DEFAULT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.znizenie_imania_ceos ALTER COLUMN id SET DEFAULT nextval('ov.znizenie_imania_ceos_id_seq'::regclass);


--
-- Name: znizenie_imania_issues id; Type: DEFAULT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.znizenie_imania_issues ALTER COLUMN id SET DEFAULT nextval('ov.znizenie_imania_issues_id_seq'::regclass);


--
-- Name: versions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.versions ALTER COLUMN id SET DEFAULT nextval('public.versions_id_seq'::regclass);


--
-- Name: esa2010_codes id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.esa2010_codes ALTER COLUMN id SET DEFAULT nextval('rpo.esu2010_codes_id_seq'::regclass);


--
-- Name: legal_forms id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.legal_forms ALTER COLUMN id SET DEFAULT nextval('rpo.legal_forms_id_seq'::regclass);


--
-- Name: main_activity_codes id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.main_activity_codes ALTER COLUMN id SET DEFAULT nextval('rpo.main_activity_codes_id_seq'::regclass);


--
-- Name: organization_address_entries id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_address_entries ALTER COLUMN id SET DEFAULT nextval('rpo.organization_address_entries_id_seq'::regclass);


--
-- Name: organization_alternate_name_entries id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_alternate_name_entries ALTER COLUMN id SET DEFAULT nextval('rpo.organization_alternate_name_entries_id_seq'::regclass);


--
-- Name: organization_authorization_entries id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_authorization_entries ALTER COLUMN id SET DEFAULT nextval('rpo.organization_authorization_entries_id_seq'::regclass);


--
-- Name: organization_deposit_entries id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_deposit_entries ALTER COLUMN id SET DEFAULT nextval('rpo.organization_deposit_entries_id_seq'::regclass);


--
-- Name: organization_economic_activity_entries id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_economic_activity_entries ALTER COLUMN id SET DEFAULT nextval('rpo.organization_economic_activity_entries_id_seq'::regclass);


--
-- Name: organization_equity_entries id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_equity_entries ALTER COLUMN id SET DEFAULT nextval('rpo.organization_equity_entries_id_seq'::regclass);


--
-- Name: organization_identifier_entries id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_identifier_entries ALTER COLUMN id SET DEFAULT nextval('rpo.organization_identifier_entries_id_seq'::regclass);


--
-- Name: organization_legal_form_entries id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_legal_form_entries ALTER COLUMN id SET DEFAULT nextval('rpo.organization_legal_form_entries_id_seq'::regclass);


--
-- Name: organization_legal_status_entries id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_legal_status_entries ALTER COLUMN id SET DEFAULT nextval('rpo.organization_legal_status_entries_id_seq'::regclass);


--
-- Name: organization_name_entries id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_name_entries ALTER COLUMN id SET DEFAULT nextval('rpo.organization_name_entries_id_seq'::regclass);


--
-- Name: organization_other_legal_fact_entries id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_other_legal_fact_entries ALTER COLUMN id SET DEFAULT nextval('rpo.organization_other_legal_fact_entries_id_seq'::regclass);


--
-- Name: organization_predecessor_entries id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_predecessor_entries ALTER COLUMN id SET DEFAULT nextval('rpo.organization_predecessor_entries_id_seq'::regclass);


--
-- Name: organization_registration_number_entries id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_registration_number_entries ALTER COLUMN id SET DEFAULT nextval('rpo.organization_registration_number_entries_id_seq'::regclass);


--
-- Name: organization_registration_office_entries id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_registration_office_entries ALTER COLUMN id SET DEFAULT nextval('rpo.organization_registration_office_entries_id_seq'::regclass);


--
-- Name: organization_share_entries id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_share_entries ALTER COLUMN id SET DEFAULT nextval('rpo.organization_share_entries_id_seq'::regclass);


--
-- Name: organization_stakeholder_entries id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_stakeholder_entries ALTER COLUMN id SET DEFAULT nextval('rpo.organization_stakeholder_entries_id_seq'::regclass);


--
-- Name: organization_statutory_entries id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_statutory_entries ALTER COLUMN id SET DEFAULT nextval('rpo.organization_statutory_entries_id_seq'::regclass);


--
-- Name: organization_successor_entries id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_successor_entries ALTER COLUMN id SET DEFAULT nextval('rpo.organization_successor_entries_id_seq'::regclass);


--
-- Name: organizations id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organizations ALTER COLUMN id SET DEFAULT nextval('rpo.organizations_id_seq'::regclass);


--
-- Name: share_forms id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.share_forms ALTER COLUMN id SET DEFAULT nextval('rpo.share_forms_id_seq'::regclass);


--
-- Name: share_types id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.share_types ALTER COLUMN id SET DEFAULT nextval('rpo.share_types_id_seq'::regclass);


--
-- Name: stakeholder_types id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.stakeholder_types ALTER COLUMN id SET DEFAULT nextval('rpo.stakeholder_types_id_seq'::regclass);


--
-- Name: statutory_types id; Type: DEFAULT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.statutory_types ALTER COLUMN id SET DEFAULT nextval('rpo.statutory_types_id_seq'::regclass);


--
-- Name: organization_to_corporate_bodies id; Type: DEFAULT; Schema: rpo_to_datahub; Owner: -
--

ALTER TABLE ONLY rpo_to_datahub.organization_to_corporate_bodies ALTER COLUMN id SET DEFAULT nextval('rpo_to_datahub.organization_to_corporate_bodies_id_seq'::regclass);


--
-- Name: accounting_entities id; Type: DEFAULT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ruz.accounting_entities ALTER COLUMN id SET DEFAULT nextval('ruz.ruz_accounting_entities_id_seq'::regclass);


--
-- Name: districts id; Type: DEFAULT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ruz.districts ALTER COLUMN id SET DEFAULT nextval('ruz.ruz_districts_id_seq'::regclass);


--
-- Name: legal_forms id; Type: DEFAULT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ruz.legal_forms ALTER COLUMN id SET DEFAULT nextval('ruz.ruz_legal_forms_id_seq'::regclass);


--
-- Name: municipalities id; Type: DEFAULT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ruz.municipalities ALTER COLUMN id SET DEFAULT nextval('ruz.ruz_municipalities_id_seq'::regclass);


--
-- Name: organization_sizes id; Type: DEFAULT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ruz.organization_sizes ALTER COLUMN id SET DEFAULT nextval('ruz.ruz_organization_sizes_id_seq'::regclass);


--
-- Name: ownership_types id; Type: DEFAULT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ruz.ownership_types ALTER COLUMN id SET DEFAULT nextval('ruz.ruz_ownership_types_id_seq'::regclass);


--
-- Name: regions id; Type: DEFAULT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ruz.regions ALTER COLUMN id SET DEFAULT nextval('ruz.ruz_regions_id_seq'::regclass);


--
-- Name: sk_nace_categories id; Type: DEFAULT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ruz.sk_nace_categories ALTER COLUMN id SET DEFAULT nextval('ruz.ruz_sk_nace_categories_id_seq'::regclass);


--
-- Name: accounting_entity_to_corporate_bodies id; Type: DEFAULT; Schema: ruz_to_datahub; Owner: -
--

ALTER TABLE ONLY ruz_to_datahub.accounting_entity_to_corporate_bodies ALTER COLUMN id SET DEFAULT nextval('ruz_to_datahub.accounting_entity_to_corporate_bodies_id_seq'::regclass);


--
-- Name: debtors id; Type: DEFAULT; Schema: socpoist; Owner: -
--

ALTER TABLE ONLY socpoist.debtors ALTER COLUMN id SET DEFAULT nextval('socpoist.debtors_id_seq'::regclass);


--
-- Name: public_authority_edesks id; Type: DEFAULT; Schema: upvs; Owner: -
--

ALTER TABLE ONLY upvs.public_authority_edesks ALTER COLUMN id SET DEFAULT nextval('upvs.public_authority_edesks_id_seq'::regclass);


--
-- Name: services_with_forms id; Type: DEFAULT; Schema: upvs; Owner: -
--

ALTER TABLE ONLY upvs.services_with_forms ALTER COLUMN id SET DEFAULT nextval('upvs.services_with_forms_id_seq'::regclass);


--
-- Name: debtors id; Type: DEFAULT; Schema: vszp; Owner: -
--

ALTER TABLE ONLY vszp.debtors ALTER COLUMN id SET DEFAULT nextval('vszp.debtors_id_seq'::regclass);


--
-- Name: bulletin_issues id; Type: DEFAULT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.bulletin_issues ALTER COLUMN id SET DEFAULT nextval('vvo.bulletins_id_seq'::regclass);


--
-- Name: contract_awards id; Type: DEFAULT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.contract_awards ALTER COLUMN id SET DEFAULT nextval('vvo.agreements_id_seq'::regclass);


--
-- Name: contracting_authorities id; Type: DEFAULT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.contracting_authorities ALTER COLUMN id SET DEFAULT nextval('vvo.contracting_authorities_id_seq'::regclass);


--
-- Name: contractors id; Type: DEFAULT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.contractors ALTER COLUMN id SET DEFAULT nextval('vvo.agreement_suppliers_id_seq'::regclass);


--
-- Name: contracts id; Type: DEFAULT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.contracts ALTER COLUMN id SET DEFAULT nextval('vvo.contracts_id_seq'::regclass);


--
-- Name: notice_suppliers id; Type: DEFAULT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.notice_suppliers ALTER COLUMN id SET DEFAULT nextval('vvo.notice_suppliers_id_seq'::regclass);


--
-- Name: notice_types id; Type: DEFAULT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.notice_types ALTER COLUMN id SET DEFAULT nextval('vvo.announcement_types_id_seq'::regclass);


--
-- Name: notices id; Type: DEFAULT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.notices ALTER COLUMN id SET DEFAULT nextval('vvo.notices_id_seq'::regclass);


--
-- Name: procedure_types id; Type: DEFAULT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.procedure_types ALTER COLUMN id SET DEFAULT nextval('vvo.procedure_types_id_seq'::regclass);


--
-- Name: raw_notices id; Type: DEFAULT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.raw_notices ALTER COLUMN id SET DEFAULT nextval('vvo.raw_notices_id_seq'::regclass);


--
-- Name: result_notice_lot_main_cpvs id; Type: DEFAULT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.result_notice_lot_main_cpvs ALTER COLUMN id SET DEFAULT nextval('vvo.result_notice_item_cpvs_id_seq'::regclass);


--
-- Name: result_notice_lots id; Type: DEFAULT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.result_notice_lots ALTER COLUMN id SET DEFAULT nextval('vvo.result_notice_items_id_seq'::regclass);


--
-- Name: result_notice_main_cpvs id; Type: DEFAULT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.result_notice_main_cpvs ALTER COLUMN id SET DEFAULT nextval('vvo.result_notice_cpvs_id_seq'::regclass);


--
-- Name: result_notices id; Type: DEFAULT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.result_notices ALTER COLUMN id SET DEFAULT nextval('vvo.result_notices_id_seq'::regclass);


--
-- Name: attachments attachments_pkey; Type: CONSTRAINT; Schema: crz; Owner: -
--

ALTER TABLE ONLY crz.attachments
    ADD CONSTRAINT attachments_pkey PRIMARY KEY (id);


--
-- Name: contracts contracts_pkey; Type: CONSTRAINT; Schema: crz; Owner: -
--

ALTER TABLE ONLY crz.contracts
    ADD CONSTRAINT contracts_pkey PRIMARY KEY (id);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: crz; Owner: -
--

ALTER TABLE ONLY crz.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: corporate_bodies corporate_bodies_pkey; Type: CONSTRAINT; Schema: datahub; Owner: -
--

ALTER TABLE ONLY datahub.corporate_bodies
    ADD CONSTRAINT corporate_bodies_pkey PRIMARY KEY (id);


--
-- Name: income_tax_subjects income_tax_subjects_pkey; Type: CONSTRAINT; Schema: fs; Owner: -
--

ALTER TABLE ONLY fs.income_tax_subjects
    ADD CONSTRAINT income_tax_subjects_pkey PRIMARY KEY (id);


--
-- Name: tax_liabilities tax_liabilities_pkey; Type: CONSTRAINT; Schema: fs; Owner: -
--

ALTER TABLE ONLY fs.tax_liabilities
    ADD CONSTRAINT tax_liabilities_pkey PRIMARY KEY (id);


--
-- Name: tax_liabilities tax_liabilities_uniq; Type: CONSTRAINT; Schema: fs; Owner: -
--

ALTER TABLE ONLY fs.tax_liabilities
    ADD CONSTRAINT tax_liabilities_uniq UNIQUE (tin, taxable_period);


--
-- Name: vat_subjects vat_subjects_pkey; Type: CONSTRAINT; Schema: fs; Owner: -
--

ALTER TABLE ONLY fs.vat_subjects
    ADD CONSTRAINT vat_subjects_pkey PRIMARY KEY (id);


--
-- Name: vat_subjects vat_subjects_uniq; Type: CONSTRAINT; Schema: fs; Owner: -
--

ALTER TABLE ONLY fs.vat_subjects
    ADD CONSTRAINT vat_subjects_uniq UNIQUE (vatin, name, street, municipality, postal_code, country);


--
-- Name: income_tax_subject_to_corporate_bodies income_tax_subject_to_corporate_bodies_pkey; Type: CONSTRAINT; Schema: fs_to_datahub; Owner: -
--

ALTER TABLE ONLY fs_to_datahub.income_tax_subject_to_corporate_bodies
    ADD CONSTRAINT income_tax_subject_to_corporate_bodies_pkey PRIMARY KEY (id);


--
-- Name: tax_liability_to_corporate_bodies tax_liability_to_corporate_bodies_pkey; Type: CONSTRAINT; Schema: fs_to_datahub; Owner: -
--

ALTER TABLE ONLY fs_to_datahub.tax_liability_to_corporate_bodies
    ADD CONSTRAINT tax_liability_to_corporate_bodies_pkey PRIMARY KEY (id);


--
-- Name: tax_liability_to_corporate_bodies tax_liability_to_corporate_bodies_uniq; Type: CONSTRAINT; Schema: fs_to_datahub; Owner: -
--

ALTER TABLE ONLY fs_to_datahub.tax_liability_to_corporate_bodies
    ADD CONSTRAINT tax_liability_to_corporate_bodies_uniq UNIQUE (corporate_body_id, tax_liability_id);


--
-- Name: vat_subject_to_corporate_bodies vat_subject_to_corporate_bodies_pkey; Type: CONSTRAINT; Schema: fs_to_datahub; Owner: -
--

ALTER TABLE ONLY fs_to_datahub.vat_subject_to_corporate_bodies
    ADD CONSTRAINT vat_subject_to_corporate_bodies_pkey PRIMARY KEY (id);


--
-- Name: vat_subject_to_corporate_bodies vat_subject_to_corporate_bodies_uniq; Type: CONSTRAINT; Schema: fs_to_datahub; Owner: -
--

ALTER TABLE ONLY fs_to_datahub.vat_subject_to_corporate_bodies
    ADD CONSTRAINT vat_subject_to_corporate_bodies_uniq UNIQUE (corporate_body_id, vat_subject_id);


--
-- Name: aktivity aktivity_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.aktivity
    ADD CONSTRAINT aktivity_pkey PRIMARY KEY (id);


--
-- Name: ciselniky ciselniky_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.ciselniky
    ADD CONSTRAINT ciselniky_pkey PRIMARY KEY (id);


--
-- Name: deklarovane_vydavky deklarovane_vydavky_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.deklarovane_vydavky
    ADD CONSTRAINT deklarovane_vydavky_pkey PRIMARY KEY (id);


--
-- Name: deklarovane_vydavky_sumy_neschvalene_na_preplatenie deklarovane_vydavky_sumy_neschvalene_na_preplatenie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.deklarovane_vydavky_sumy_neschvalene_na_preplatenie
    ADD CONSTRAINT deklarovane_vydavky_sumy_neschvalene_na_preplatenie_pkey PRIMARY KEY (id);


--
-- Name: deklarovane_vydavky_sumy_neziadane_na_preplatenie deklarovane_vydavky_sumy_neziadane_na_preplatenie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.deklarovane_vydavky_sumy_neziadane_na_preplatenie
    ADD CONSTRAINT deklarovane_vydavky_sumy_neziadane_na_preplatenie_pkey PRIMARY KEY (id);


--
-- Name: dodavatelia dodavatelia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.dodavatelia
    ADD CONSTRAINT dodavatelia_pkey PRIMARY KEY (id);


--
-- Name: hodnoty_ciselnikov hodnoty_ciselnikov_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.hodnoty_ciselnikov
    ADD CONSTRAINT hodnoty_ciselnikov_pkey PRIMARY KEY (id);


--
-- Name: intenzity intenzity_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.intenzity
    ADD CONSTRAINT intenzity_pkey PRIMARY KEY (id);


--
-- Name: intenzity_zdroje intenzity_zdroje_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.intenzity_zdroje
    ADD CONSTRAINT intenzity_zdroje_pkey PRIMARY KEY (id);


--
-- Name: konkretne_ciele_hodnoty_ciselnikov konkretne_ciele_hodnoty_ciselnikov_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.konkretne_ciele_hodnoty_ciselnikov
    ADD CONSTRAINT konkretne_ciele_hodnoty_ciselnikov_pkey PRIMARY KEY (id);


--
-- Name: konkretne_ciele konkretne_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.konkretne_ciele
    ADD CONSTRAINT konkretne_ciele_pkey PRIMARY KEY (id);


--
-- Name: konkretne_ciele_typy_aktivit konkretne_ciele_typy_aktivit_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.konkretne_ciele_typy_aktivit
    ADD CONSTRAINT konkretne_ciele_typy_aktivit_pkey PRIMARY KEY (id);


--
-- Name: miesta_realizacie miesta_realizacie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.miesta_realizacie
    ADD CONSTRAINT miesta_realizacie_pkey PRIMARY KEY (id);


--
-- Name: monitorovacie_terminy monitorovacie_terminy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.monitorovacie_terminy
    ADD CONSTRAINT monitorovacie_terminy_pkey PRIMARY KEY (id);


--
-- Name: nezrovnalosti nezrovnalosti_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti
    ADD CONSTRAINT nezrovnalosti_pkey PRIMARY KEY (id);


--
-- Name: nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost
    ADD CONSTRAINT nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost_pkey PRIMARY KEY (id);


--
-- Name: nezrovnalosti_subjekty_ktore_zistili_nezrovnalost nezrovnalosti_subjekty_ktore_zistili_nezrovnalost_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_subjekty_ktore_zistili_nezrovnalost
    ADD CONSTRAINT nezrovnalosti_subjekty_ktore_zistili_nezrovnalost_pkey PRIMARY KEY (id);


--
-- Name: nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie
    ADD CONSTRAINT nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie_pkey PRIMARY KEY (id);


--
-- Name: nezrovnalosti_suvisiace_nezrovnalosti nezrovnalosti_suvisiace_nezrovnalosti_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_suvisiace_nezrovnalosti
    ADD CONSTRAINT nezrovnalosti_suvisiace_nezrovnalosti_pkey PRIMARY KEY (id);


--
-- Name: nezrovnalosti_suvisiace_pohladavkove_doklady nezrovnalosti_suvisiace_pohladavkove_doklady_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_suvisiace_pohladavkove_doklady
    ADD CONSTRAINT nezrovnalosti_suvisiace_pohladavkove_doklady_pkey PRIMARY KEY (id);


--
-- Name: nezrovnalosti_suvisiace_verejne_obstaravania nezrovnalosti_suvisiace_verejne_obstaravania_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_suvisiace_verejne_obstaravania
    ADD CONSTRAINT nezrovnalosti_suvisiace_verejne_obstaravania_pkey PRIMARY KEY (id);


--
-- Name: nezrovnalosti_suvisiace_zop nezrovnalosti_suvisiace_zop_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_suvisiace_zop
    ADD CONSTRAINT nezrovnalosti_suvisiace_zop_pkey PRIMARY KEY (id);


--
-- Name: nezrovnalosti_typy_nezrovnalosti nezrovnalosti_typy_nezrovnalosti_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_typy_nezrovnalosti
    ADD CONSTRAINT nezrovnalosti_typy_nezrovnalosti_pkey PRIMARY KEY (id);


--
-- Name: nuts_kody nuts_kody_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nuts_kody
    ADD CONSTRAINT nuts_kody_pkey PRIMARY KEY (id);


--
-- Name: operacne_programy operacne_programy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.operacne_programy
    ADD CONSTRAINT operacne_programy_pkey PRIMARY KEY (id);


--
-- Name: organizacne_zlozky organizacne_zlozky_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.organizacne_zlozky
    ADD CONSTRAINT organizacne_zlozky_pkey PRIMARY KEY (id);


--
-- Name: osoby osoby_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.osoby
    ADD CONSTRAINT osoby_pkey PRIMARY KEY (id);


--
-- Name: pohladavkove_doklady pohladavkove_doklady_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.pohladavkove_doklady
    ADD CONSTRAINT pohladavkove_doklady_pkey PRIMARY KEY (id);


--
-- Name: pohladavkove_doklady_suvisiace_verejne_obstaravania pohladavkove_doklady_suvisiace_verejne_obstaravania_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.pohladavkove_doklady_suvisiace_verejne_obstaravania
    ADD CONSTRAINT pohladavkove_doklady_suvisiace_verejne_obstaravania_pkey PRIMARY KEY (id);


--
-- Name: pohladavkove_doklady_suvisiace_zop pohladavkove_doklady_suvisiace_zop_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.pohladavkove_doklady_suvisiace_zop
    ADD CONSTRAINT pohladavkove_doklady_suvisiace_zop_pkey PRIMARY KEY (id);


--
-- Name: polozky_rozpoctu polozky_rozpoctu_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.polozky_rozpoctu
    ADD CONSTRAINT polozky_rozpoctu_pkey PRIMARY KEY (id);


--
-- Name: prioritne_osi prioritne_osi_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.prioritne_osi
    ADD CONSTRAINT prioritne_osi_pkey PRIMARY KEY (id);


--
-- Name: projektove_ukazovatele_casy_plnenia projektove_ukazovatele_casy_plnenia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projektove_ukazovatele_casy_plnenia
    ADD CONSTRAINT projektove_ukazovatele_casy_plnenia_pkey PRIMARY KEY (id);


--
-- Name: projektove_ukazovatele_fondy projektove_ukazovatele_fondy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projektove_ukazovatele_fondy
    ADD CONSTRAINT projektove_ukazovatele_fondy_pkey PRIMARY KEY (id);


--
-- Name: projektove_ukazovatele projektove_ukazovatele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projektove_ukazovatele
    ADD CONSTRAINT projektove_ukazovatele_pkey PRIMARY KEY (id);


--
-- Name: projekty_aktivity projekty_aktivity_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_aktivity
    ADD CONSTRAINT projekty_aktivity_pkey PRIMARY KEY (id);


--
-- Name: projekty_formy_financovania projekty_formy_financovania_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_formy_financovania
    ADD CONSTRAINT projekty_formy_financovania_pkey PRIMARY KEY (id);


--
-- Name: projekty_hospodarske_cinnosti projekty_hospodarske_cinnosti_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_hospodarske_cinnosti
    ADD CONSTRAINT projekty_hospodarske_cinnosti_pkey PRIMARY KEY (id);


--
-- Name: projekty_intenzity projekty_intenzity_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_intenzity
    ADD CONSTRAINT projekty_intenzity_pkey PRIMARY KEY (id);


--
-- Name: projekty_meratelne_ukazovatele projekty_meratelne_ukazovatele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_meratelne_ukazovatele
    ADD CONSTRAINT projekty_meratelne_ukazovatele_pkey PRIMARY KEY (id);


--
-- Name: projekty_miesta_realizacie_mimo_uzemia_op projekty_miesta_realizacie_mimo_uzemia_op_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_miesta_realizacie_mimo_uzemia_op
    ADD CONSTRAINT projekty_miesta_realizacie_mimo_uzemia_op_pkey PRIMARY KEY (id);


--
-- Name: projekty_miesta_realizacie projekty_miesta_realizacie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_miesta_realizacie
    ADD CONSTRAINT projekty_miesta_realizacie_pkey PRIMARY KEY (id);


--
-- Name: projekty_oblasti_intervencie projekty_oblasti_intervencie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_oblasti_intervencie
    ADD CONSTRAINT projekty_oblasti_intervencie_pkey PRIMARY KEY (id);


--
-- Name: projekty_organizacne_zlozky projekty_organizacne_zlozky_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_organizacne_zlozky
    ADD CONSTRAINT projekty_organizacne_zlozky_pkey PRIMARY KEY (id);


--
-- Name: projekty_partneri projekty_partneri_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_partneri
    ADD CONSTRAINT projekty_partneri_pkey PRIMARY KEY (id);


--
-- Name: projekty projekty_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty
    ADD CONSTRAINT projekty_pkey PRIMARY KEY (id);


--
-- Name: projekty_polozky_rozpoctu projekty_polozky_rozpoctu_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_polozky_rozpoctu
    ADD CONSTRAINT projekty_polozky_rozpoctu_pkey PRIMARY KEY (id);


--
-- Name: projekty_sekundarne_tematicke_okruhy projekty_sekundarne_tematicke_okruhy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_sekundarne_tematicke_okruhy
    ADD CONSTRAINT projekty_sekundarne_tematicke_okruhy_pkey PRIMARY KEY (id);


--
-- Name: projekty_typy_uzemia projekty_typy_uzemia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_typy_uzemia
    ADD CONSTRAINT projekty_typy_uzemia_pkey PRIMARY KEY (id);


--
-- Name: projekty_uzemne_mechanizmy projekty_uzemne_mechanizmy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_uzemne_mechanizmy
    ADD CONSTRAINT projekty_uzemne_mechanizmy_pkey PRIMARY KEY (id);


--
-- Name: subjekty subjekty_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.subjekty
    ADD CONSTRAINT subjekty_pkey PRIMARY KEY (id);


--
-- Name: typy_aktivit typy_aktivit_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.typy_aktivit
    ADD CONSTRAINT typy_aktivit_pkey PRIMARY KEY (id);


--
-- Name: uctovne_doklady uctovne_doklady_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.uctovne_doklady
    ADD CONSTRAINT uctovne_doklady_pkey PRIMARY KEY (id);


--
-- Name: uctovne_doklady_polozky_dokladu uctovne_doklady_polozky_dokladu_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.uctovne_doklady_polozky_dokladu
    ADD CONSTRAINT uctovne_doklady_polozky_dokladu_pkey PRIMARY KEY (id);


--
-- Name: uctovne_doklady_projekty uctovne_doklady_projekty_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.uctovne_doklady_projekty
    ADD CONSTRAINT uctovne_doklady_projekty_pkey PRIMARY KEY (id);


--
-- Name: verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik
    ADD CONSTRAINT verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik_pkey PRIMARY KEY (id);


--
-- Name: verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik
    ADD CONSTRAINT verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik_pkey PRIMARY KEY (id);


--
-- Name: verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik
    ADD CONSTRAINT verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik_pkey PRIMARY KEY (id);


--
-- Name: verejne_obstaravania_operacne_programy verejne_obstaravania_operacne_programy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania_operacne_programy
    ADD CONSTRAINT verejne_obstaravania_operacne_programy_pkey PRIMARY KEY (id);


--
-- Name: verejne_obstaravania verejne_obstaravania_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania
    ADD CONSTRAINT verejne_obstaravania_pkey PRIMARY KEY (id);


--
-- Name: verejne_obstaravania_projekty verejne_obstaravania_projekty_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania_projekty
    ADD CONSTRAINT verejne_obstaravania_projekty_pkey PRIMARY KEY (id);


--
-- Name: verejne_obstaravania_uctovne_doklady verejne_obstaravania_uctovne_doklady_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania_uctovne_doklady
    ADD CONSTRAINT verejne_obstaravania_uctovne_doklady_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_planovane_doplnujuce_info vyzvy_planovane_doplnujuce_info_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_planovane_doplnujuce_info
    ADD CONSTRAINT vyzvy_planovane_doplnujuce_info_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_planovane_konkretne_ciele vyzvy_planovane_konkretne_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_planovane_konkretne_ciele
    ADD CONSTRAINT vyzvy_planovane_konkretne_ciele_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_planovane vyzvy_planovane_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_planovane
    ADD CONSTRAINT vyzvy_planovane_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_planovane_poskytovatelia vyzvy_planovane_poskytovatelia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_planovane_poskytovatelia
    ADD CONSTRAINT vyzvy_planovane_poskytovatelia_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_vyhlasene_doplnujuce_info vyzvy_vyhlasene_doplnujuce_info_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_doplnujuce_info
    ADD CONSTRAINT vyzvy_vyhlasene_doplnujuce_info_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_vyhlasene_fondy vyzvy_vyhlasene_fondy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_fondy
    ADD CONSTRAINT vyzvy_vyhlasene_fondy_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_vyhlasene_konkretne_ciele_typy_aktivit vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit
    ADD CONSTRAINT vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_vyhlasene_kontaktne_osoby vyzvy_vyhlasene_kontaktne_osoby_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_kontaktne_osoby
    ADD CONSTRAINT vyzvy_vyhlasene_kontaktne_osoby_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_vyhlasene vyzvy_vyhlasene_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene
    ADD CONSTRAINT vyzvy_vyhlasene_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_vyhlasene_poskytovatelia vyzvy_vyhlasene_poskytovatelia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_poskytovatelia
    ADD CONSTRAINT vyzvy_vyhlasene_poskytovatelia_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_vyhlasene_posudzovane_obdobia vyzvy_vyhlasene_posudzovane_obdobia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_posudzovane_obdobia
    ADD CONSTRAINT vyzvy_vyhlasene_posudzovane_obdobia_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_vyhlasene_vyzvy_planovane vyzvy_vyhlasene_vyzvy_planovane_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_vyzvy_planovane
    ADD CONSTRAINT vyzvy_vyhlasene_vyzvy_planovane_pkey PRIMARY KEY (id);


--
-- Name: zmluvy_verejne_obstaravania_dalsie_url zmluvy_verejne_obstaravania_dalsie_url_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zmluvy_verejne_obstaravania_dalsie_url
    ADD CONSTRAINT zmluvy_verejne_obstaravania_dalsie_url_pkey PRIMARY KEY (id);


--
-- Name: zmluvy_verejne_obstaravania_dodavatelia zmluvy_verejne_obstaravania_dodavatelia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zmluvy_verejne_obstaravania_dodavatelia
    ADD CONSTRAINT zmluvy_verejne_obstaravania_dodavatelia_pkey PRIMARY KEY (id);


--
-- Name: zmluvy_verejne_obstaravania zmluvy_verejne_obstaravania_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zmluvy_verejne_obstaravania
    ADD CONSTRAINT zmluvy_verejne_obstaravania_pkey PRIMARY KEY (id);


--
-- Name: zonfp_spracovane_aktivity_projekt zonfp_aktivity_projekt_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_aktivity_projekt
    ADD CONSTRAINT zonfp_aktivity_projekt_pkey PRIMARY KEY (id);


--
-- Name: zonfp_spracovane_formy_financovania zonfp_formy_financovania_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_formy_financovania
    ADD CONSTRAINT zonfp_formy_financovania_pkey PRIMARY KEY (id);


--
-- Name: zonfp_spracovane_hodnotitelia zonfp_hodnotitelia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_hodnotitelia
    ADD CONSTRAINT zonfp_hodnotitelia_pkey PRIMARY KEY (id);


--
-- Name: zonfp_spracovane_hospodarske_cinnosti zonfp_hospodarske_cinnosti_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_hospodarske_cinnosti
    ADD CONSTRAINT zonfp_hospodarske_cinnosti_pkey PRIMARY KEY (id);


--
-- Name: zonfp_spracovane_meratelne_ukazovatele zonfp_meratelne_ukazovatele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_meratelne_ukazovatele
    ADD CONSTRAINT zonfp_meratelne_ukazovatele_pkey PRIMARY KEY (id);


--
-- Name: zonfp_spracovane_miesta_realizacie_mimo_uzemia_op zonfp_miesta_realizacie_mimo_uzemia_op_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_miesta_realizacie_mimo_uzemia_op
    ADD CONSTRAINT zonfp_miesta_realizacie_mimo_uzemia_op_pkey PRIMARY KEY (id);


--
-- Name: zonfp_spracovane_miesta_realizacie zonfp_miesta_realizacie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_miesta_realizacie
    ADD CONSTRAINT zonfp_miesta_realizacie_pkey PRIMARY KEY (id);


--
-- Name: zonfp_spracovane_oblasti_intervencie zonfp_oblasti_intervencie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_oblasti_intervencie
    ADD CONSTRAINT zonfp_oblasti_intervencie_pkey PRIMARY KEY (id);


--
-- Name: zonfp_spracovane_organizacne_zlozky zonfp_organizacne_zlozky_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_organizacne_zlozky
    ADD CONSTRAINT zonfp_organizacne_zlozky_pkey PRIMARY KEY (id);


--
-- Name: zonfp_spracovane_partneri zonfp_partneri_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_partneri
    ADD CONSTRAINT zonfp_partneri_pkey PRIMARY KEY (id);


--
-- Name: zonfp_spracovane zonfp_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane
    ADD CONSTRAINT zonfp_pkey PRIMARY KEY (id);


--
-- Name: zonfp_spracovane_polozky_rozpoctu zonfp_polozky_rozpoctu_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_polozky_rozpoctu
    ADD CONSTRAINT zonfp_polozky_rozpoctu_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_aktivity_projekt zonfp_prijate_aktivity_projekt_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_aktivity_projekt
    ADD CONSTRAINT zonfp_prijate_aktivity_projekt_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_formy_financovania zonfp_prijate_formy_financovania_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_formy_financovania
    ADD CONSTRAINT zonfp_prijate_formy_financovania_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_hospodarske_cinnosti zonfp_prijate_hospodarske_cinnosti_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_hospodarske_cinnosti
    ADD CONSTRAINT zonfp_prijate_hospodarske_cinnosti_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_meratelne_ukazovatele zonfp_prijate_meratelne_ukazovatele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_meratelne_ukazovatele
    ADD CONSTRAINT zonfp_prijate_meratelne_ukazovatele_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_miesta_realizacie_mimo_uzemia_op zonfp_prijate_miesta_realizacie_mimo_uzemia_op_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_miesta_realizacie_mimo_uzemia_op
    ADD CONSTRAINT zonfp_prijate_miesta_realizacie_mimo_uzemia_op_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_miesta_realizacie zonfp_prijate_miesta_realizacie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_miesta_realizacie
    ADD CONSTRAINT zonfp_prijate_miesta_realizacie_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_oblasti_intervencie zonfp_prijate_oblasti_intervencie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_oblasti_intervencie
    ADD CONSTRAINT zonfp_prijate_oblasti_intervencie_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_organizacne_zlozky zonfp_prijate_organizacne_zlozky_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_organizacne_zlozky
    ADD CONSTRAINT zonfp_prijate_organizacne_zlozky_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_partneri zonfp_prijate_partneri_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_partneri
    ADD CONSTRAINT zonfp_prijate_partneri_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate zonfp_prijate_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate
    ADD CONSTRAINT zonfp_prijate_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_polozky_rozpoctu zonfp_prijate_polozky_rozpoctu_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_polozky_rozpoctu
    ADD CONSTRAINT zonfp_prijate_polozky_rozpoctu_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_sekundarne_tematicke_okruhy zonfp_prijate_sekundarne_tematicke_okruhy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_sekundarne_tematicke_okruhy
    ADD CONSTRAINT zonfp_prijate_sekundarne_tematicke_okruhy_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_typy_uzemia zonfp_prijate_typy_uzemia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_typy_uzemia
    ADD CONSTRAINT zonfp_prijate_typy_uzemia_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_uzemne_mechanizmy zonfp_prijate_uzemne_mechanizmy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_uzemne_mechanizmy
    ADD CONSTRAINT zonfp_prijate_uzemne_mechanizmy_pkey PRIMARY KEY (id);


--
-- Name: zonfp_spracovane_sekundarne_tematicke_okruhy zonfp_sekundarne_tematicke_okruhy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_sekundarne_tematicke_okruhy
    ADD CONSTRAINT zonfp_sekundarne_tematicke_okruhy_pkey PRIMARY KEY (id);


--
-- Name: zonfp_spracovane_typy_uzemia zonfp_typy_uzemia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_typy_uzemia
    ADD CONSTRAINT zonfp_typy_uzemia_pkey PRIMARY KEY (id);


--
-- Name: zonfp_spracovane_uzemne_mechanizmy zonfp_uzemne_mechanizmy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_uzemne_mechanizmy
    ADD CONSTRAINT zonfp_uzemne_mechanizmy_pkey PRIMARY KEY (id);


--
-- Name: zop zop_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zop
    ADD CONSTRAINT zop_pkey PRIMARY KEY (id);


--
-- Name: zop_predkladane_za_subjekty zop_predkladane_za_subjekty_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zop_predkladane_za_subjekty
    ADD CONSTRAINT zop_predkladane_za_subjekty_pkey PRIMARY KEY (id);


--
-- Name: dokumenty dokumenty_pkey; Type: CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.dokumenty
    ADD CONSTRAINT dokumenty_pkey PRIMARY KEY (id);


--
-- Name: isvs isvs_pkey; Type: CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.isvs
    ADD CONSTRAINT isvs_pkey PRIMARY KEY (id);


--
-- Name: projekty projekty_pkey; Type: CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.projekty
    ADD CONSTRAINT projekty_pkey PRIMARY KEY (id);


--
-- Name: bulletin_issues bulletin_issues_pkey; Type: CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.bulletin_issues
    ADD CONSTRAINT bulletin_issues_pkey PRIMARY KEY (id);


--
-- Name: konkurz_restrukturalizacia_actors konkurz_restrukturalizacia_actors_pkey; Type: CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.konkurz_restrukturalizacia_actors
    ADD CONSTRAINT konkurz_restrukturalizacia_actors_pkey PRIMARY KEY (id);


--
-- Name: konkurz_restrukturalizacia_issues konkurz_restrukturalizacia_issues_pkey; Type: CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.konkurz_restrukturalizacia_issues
    ADD CONSTRAINT konkurz_restrukturalizacia_issues_pkey PRIMARY KEY (id);


--
-- Name: konkurz_restrukturalizacia_proposings konkurz_restrukturalizacia_proposings_pkey; Type: CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.konkurz_restrukturalizacia_proposings
    ADD CONSTRAINT konkurz_restrukturalizacia_proposings_pkey PRIMARY KEY (id);


--
-- Name: konkurz_vyrovnanie_issues konkurz_vyrovnanie_issues_pkey; Type: CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.konkurz_vyrovnanie_issues
    ADD CONSTRAINT konkurz_vyrovnanie_issues_pkey PRIMARY KEY (id);


--
-- Name: likvidator_issues likvidator_issues_pkey; Type: CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.likvidator_issues
    ADD CONSTRAINT likvidator_issues_pkey PRIMARY KEY (id);


--
-- Name: or_podanie_issue_documents or_podanie_issue_documents_pkey; Type: CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.or_podanie_issue_documents
    ADD CONSTRAINT or_podanie_issue_documents_pkey PRIMARY KEY (id);


--
-- Name: or_podanie_issues or_podanie_issues_pkey; Type: CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.or_podanie_issues
    ADD CONSTRAINT or_podanie_issues_pkey PRIMARY KEY (id);


--
-- Name: raw_issues raw_issues_pkey; Type: CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.raw_issues
    ADD CONSTRAINT raw_issues_pkey PRIMARY KEY (id);


--
-- Name: znizenie_imania_ceos znizenie_imania_ceos_pkey; Type: CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.znizenie_imania_ceos
    ADD CONSTRAINT znizenie_imania_ceos_pkey PRIMARY KEY (id);


--
-- Name: znizenie_imania_issues znizenie_imania_issues_pkey; Type: CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.znizenie_imania_issues
    ADD CONSTRAINT znizenie_imania_issues_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: versions versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: esa2010_codes esu2010_codes_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.esa2010_codes
    ADD CONSTRAINT esu2010_codes_pkey PRIMARY KEY (id);


--
-- Name: legal_forms legal_forms_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.legal_forms
    ADD CONSTRAINT legal_forms_pkey PRIMARY KEY (id);


--
-- Name: main_activity_codes main_activity_codes_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.main_activity_codes
    ADD CONSTRAINT main_activity_codes_pkey PRIMARY KEY (id);


--
-- Name: organization_address_entries organization_address_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_address_entries
    ADD CONSTRAINT organization_address_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_alternate_name_entries organization_alternate_name_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_alternate_name_entries
    ADD CONSTRAINT organization_alternate_name_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_authorization_entries organization_authorization_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_authorization_entries
    ADD CONSTRAINT organization_authorization_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_deposit_entries organization_deposit_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_deposit_entries
    ADD CONSTRAINT organization_deposit_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_economic_activity_entries organization_economic_activity_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_economic_activity_entries
    ADD CONSTRAINT organization_economic_activity_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_equity_entries organization_equity_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_equity_entries
    ADD CONSTRAINT organization_equity_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_identifier_entries organization_identifier_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_identifier_entries
    ADD CONSTRAINT organization_identifier_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_legal_form_entries organization_legal_form_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_legal_form_entries
    ADD CONSTRAINT organization_legal_form_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_legal_status_entries organization_legal_status_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_legal_status_entries
    ADD CONSTRAINT organization_legal_status_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_name_entries organization_name_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_name_entries
    ADD CONSTRAINT organization_name_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_other_legal_fact_entries organization_other_legal_fact_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_other_legal_fact_entries
    ADD CONSTRAINT organization_other_legal_fact_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_predecessor_entries organization_predecessor_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_predecessor_entries
    ADD CONSTRAINT organization_predecessor_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_registration_number_entries organization_registration_number_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_registration_number_entries
    ADD CONSTRAINT organization_registration_number_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_registration_office_entries organization_registration_office_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_registration_office_entries
    ADD CONSTRAINT organization_registration_office_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_share_entries organization_share_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_share_entries
    ADD CONSTRAINT organization_share_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_stakeholder_entries organization_stakeholder_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_stakeholder_entries
    ADD CONSTRAINT organization_stakeholder_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_statutory_entries organization_statutory_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_statutory_entries
    ADD CONSTRAINT organization_statutory_entries_pkey PRIMARY KEY (id);


--
-- Name: organization_successor_entries organization_successor_entries_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_successor_entries
    ADD CONSTRAINT organization_successor_entries_pkey PRIMARY KEY (id);


--
-- Name: organizations organizations_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: share_forms share_forms_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.share_forms
    ADD CONSTRAINT share_forms_pkey PRIMARY KEY (id);


--
-- Name: share_types share_types_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.share_types
    ADD CONSTRAINT share_types_pkey PRIMARY KEY (id);


--
-- Name: stakeholder_types stakeholder_types_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.stakeholder_types
    ADD CONSTRAINT stakeholder_types_pkey PRIMARY KEY (id);


--
-- Name: statutory_types statutory_types_pkey; Type: CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.statutory_types
    ADD CONSTRAINT statutory_types_pkey PRIMARY KEY (id);


--
-- Name: organization_to_corporate_bodies organization_to_corporate_bodies_pkey; Type: CONSTRAINT; Schema: rpo_to_datahub; Owner: -
--

ALTER TABLE ONLY rpo_to_datahub.organization_to_corporate_bodies
    ADD CONSTRAINT organization_to_corporate_bodies_pkey PRIMARY KEY (id);


--
-- Name: organization_to_corporate_bodies organization_to_corporate_bodies_uniq; Type: CONSTRAINT; Schema: rpo_to_datahub; Owner: -
--

ALTER TABLE ONLY rpo_to_datahub.organization_to_corporate_bodies
    ADD CONSTRAINT organization_to_corporate_bodies_uniq UNIQUE (corporate_body_id, organization_id);


--
-- Name: accounting_entities ruz_accounting_entities_pkey; Type: CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ruz.accounting_entities
    ADD CONSTRAINT ruz_accounting_entities_pkey PRIMARY KEY (id);


--
-- Name: districts ruz_districts_pkey; Type: CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ruz.districts
    ADD CONSTRAINT ruz_districts_pkey PRIMARY KEY (id);


--
-- Name: legal_forms ruz_legal_forms_pkey; Type: CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ruz.legal_forms
    ADD CONSTRAINT ruz_legal_forms_pkey PRIMARY KEY (id);


--
-- Name: municipalities ruz_municipalities_pkey; Type: CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ruz.municipalities
    ADD CONSTRAINT ruz_municipalities_pkey PRIMARY KEY (id);


--
-- Name: organization_sizes ruz_organization_sizes_pkey; Type: CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ruz.organization_sizes
    ADD CONSTRAINT ruz_organization_sizes_pkey PRIMARY KEY (id);


--
-- Name: ownership_types ruz_ownership_types_pkey; Type: CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ruz.ownership_types
    ADD CONSTRAINT ruz_ownership_types_pkey PRIMARY KEY (id);


--
-- Name: regions ruz_regions_pkey; Type: CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ruz.regions
    ADD CONSTRAINT ruz_regions_pkey PRIMARY KEY (id);


--
-- Name: sk_nace_categories ruz_sk_nace_categories_pkey; Type: CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ruz.sk_nace_categories
    ADD CONSTRAINT ruz_sk_nace_categories_pkey PRIMARY KEY (id);


--
-- Name: accounting_entity_to_corporate_bodies accounting_entity_to_corporate_bodies_pkey; Type: CONSTRAINT; Schema: ruz_to_datahub; Owner: -
--

ALTER TABLE ONLY ruz_to_datahub.accounting_entity_to_corporate_bodies
    ADD CONSTRAINT accounting_entity_to_corporate_bodies_pkey PRIMARY KEY (id);


--
-- Name: accounting_entity_to_corporate_bodies accounting_entity_to_corporate_bodies_uniq; Type: CONSTRAINT; Schema: ruz_to_datahub; Owner: -
--

ALTER TABLE ONLY ruz_to_datahub.accounting_entity_to_corporate_bodies
    ADD CONSTRAINT accounting_entity_to_corporate_bodies_uniq UNIQUE (corporate_body_id, accounting_entity_id);


--
-- Name: debtors debtors_pkey; Type: CONSTRAINT; Schema: socpoist; Owner: -
--

ALTER TABLE ONLY socpoist.debtors
    ADD CONSTRAINT debtors_pkey PRIMARY KEY (id);


--
-- Name: public_authority_edesks public_authority_edesks_pkey; Type: CONSTRAINT; Schema: upvs; Owner: -
--

ALTER TABLE ONLY upvs.public_authority_edesks
    ADD CONSTRAINT public_authority_edesks_pkey PRIMARY KEY (id);


--
-- Name: services_with_forms services_with_forms_pkey; Type: CONSTRAINT; Schema: upvs; Owner: -
--

ALTER TABLE ONLY upvs.services_with_forms
    ADD CONSTRAINT services_with_forms_pkey PRIMARY KEY (id);


--
-- Name: debtors debtors_pkey; Type: CONSTRAINT; Schema: vszp; Owner: -
--

ALTER TABLE ONLY vszp.debtors
    ADD CONSTRAINT debtors_pkey PRIMARY KEY (id);


--
-- Name: contractors agreement_suppliers_pkey; Type: CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.contractors
    ADD CONSTRAINT agreement_suppliers_pkey PRIMARY KEY (id);


--
-- Name: contract_awards agreements_pkey; Type: CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.contract_awards
    ADD CONSTRAINT agreements_pkey PRIMARY KEY (id);


--
-- Name: notice_types announcement_types_pkey; Type: CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.notice_types
    ADD CONSTRAINT announcement_types_pkey PRIMARY KEY (id);


--
-- Name: bulletin_issues bulletins_pkey; Type: CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.bulletin_issues
    ADD CONSTRAINT bulletins_pkey PRIMARY KEY (id);


--
-- Name: contracting_authorities contracting_authorities_pkey; Type: CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.contracting_authorities
    ADD CONSTRAINT contracting_authorities_pkey PRIMARY KEY (id);


--
-- Name: contracts contracts_pkey; Type: CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.contracts
    ADD CONSTRAINT contracts_pkey PRIMARY KEY (id);


--
-- Name: notice_suppliers notice_suppliers_pkey; Type: CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.notice_suppliers
    ADD CONSTRAINT notice_suppliers_pkey PRIMARY KEY (id);


--
-- Name: notices notices_pkey; Type: CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.notices
    ADD CONSTRAINT notices_pkey PRIMARY KEY (id);


--
-- Name: procedure_types procedure_types_pkey; Type: CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.procedure_types
    ADD CONSTRAINT procedure_types_pkey PRIMARY KEY (id);


--
-- Name: raw_notices raw_notices_pkey; Type: CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.raw_notices
    ADD CONSTRAINT raw_notices_pkey PRIMARY KEY (id);


--
-- Name: result_notice_main_cpvs result_notice_cpvs_pkey; Type: CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.result_notice_main_cpvs
    ADD CONSTRAINT result_notice_cpvs_pkey PRIMARY KEY (id);


--
-- Name: result_notice_lot_main_cpvs result_notice_item_cpvs_pkey; Type: CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.result_notice_lot_main_cpvs
    ADD CONSTRAINT result_notice_item_cpvs_pkey PRIMARY KEY (id);


--
-- Name: result_notice_lots result_notice_items_pkey; Type: CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.result_notice_lots
    ADD CONSTRAINT result_notice_items_pkey PRIMARY KEY (id);


--
-- Name: result_notices result_notices_pkey; Type: CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.result_notices
    ADD CONSTRAINT result_notices_pkey PRIMARY KEY (id);


--
-- Name: procedure_types vvo_unique_code; Type: CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.procedure_types
    ADD CONSTRAINT vvo_unique_code UNIQUE (code, category);


--
-- Name: index_crz.attachments_on_contract_id; Type: INDEX; Schema: crz; Owner: -
--

CREATE INDEX "index_crz.attachments_on_contract_id" ON crz.attachments USING btree (contract_id);


--
-- Name: index_crz.contracts_on_updated_at_and_id; Type: INDEX; Schema: crz; Owner: -
--

CREATE UNIQUE INDEX "index_crz.contracts_on_updated_at_and_id" ON crz.contracts USING btree (updated_at, id);


--
-- Name: index_datahub.corporate_bodies_on_cin; Type: INDEX; Schema: datahub; Owner: -
--

CREATE UNIQUE INDEX "index_datahub.corporate_bodies_on_cin" ON datahub.corporate_bodies USING btree (cin);


--
-- Name: index_datahub.corporate_bodies_on_name; Type: INDEX; Schema: datahub; Owner: -
--

CREATE INDEX "index_datahub.corporate_bodies_on_name" ON datahub.corporate_bodies USING btree (name);


--
-- Name: index_datahub.corporate_bodies_on_tin; Type: INDEX; Schema: datahub; Owner: -
--

CREATE INDEX "index_datahub.corporate_bodies_on_tin" ON datahub.corporate_bodies USING btree (tin);


--
-- Name: index_datahub.corporate_bodies_on_updated_at_and_id; Type: INDEX; Schema: datahub; Owner: -
--

CREATE UNIQUE INDEX "index_datahub.corporate_bodies_on_updated_at_and_id" ON datahub.corporate_bodies USING btree (updated_at, id);


--
-- Name: index_fs.income_tax_subjects_on_cin; Type: INDEX; Schema: fs; Owner: -
--

CREATE INDEX "index_fs.income_tax_subjects_on_cin" ON fs.income_tax_subjects USING btree (cin);


--
-- Name: index_fs.income_tax_subjects_on_tin; Type: INDEX; Schema: fs; Owner: -
--

CREATE INDEX "index_fs.income_tax_subjects_on_tin" ON fs.income_tax_subjects USING btree (tin);


--
-- Name: index_fs.income_tax_subjects_on_updated_at_and_id; Type: INDEX; Schema: fs; Owner: -
--

CREATE UNIQUE INDEX "index_fs.income_tax_subjects_on_updated_at_and_id" ON fs.income_tax_subjects USING btree (updated_at, id);


--
-- Name: index_fs.tax_liabilities_on_cin; Type: INDEX; Schema: fs; Owner: -
--

CREATE INDEX "index_fs.tax_liabilities_on_cin" ON fs.tax_liabilities USING btree (cin);


--
-- Name: index_fs.tax_liabilities_on_tin; Type: INDEX; Schema: fs; Owner: -
--

CREATE INDEX "index_fs.tax_liabilities_on_tin" ON fs.tax_liabilities USING btree (tin);


--
-- Name: index_fs.tax_liabilities_on_updated_at_and_id; Type: INDEX; Schema: fs; Owner: -
--

CREATE UNIQUE INDEX "index_fs.tax_liabilities_on_updated_at_and_id" ON fs.tax_liabilities USING btree (updated_at, id);


--
-- Name: index_fs.tax_liabilities_on_vatin; Type: INDEX; Schema: fs; Owner: -
--

CREATE INDEX "index_fs.tax_liabilities_on_vatin" ON fs.tax_liabilities USING btree (vatin);


--
-- Name: index_fs.vat_subjects_on_cin; Type: INDEX; Schema: fs; Owner: -
--

CREATE INDEX "index_fs.vat_subjects_on_cin" ON fs.vat_subjects USING btree (cin);


--
-- Name: index_fs.vat_subjects_on_updated_at_and_id; Type: INDEX; Schema: fs; Owner: -
--

CREATE UNIQUE INDEX "index_fs.vat_subjects_on_updated_at_and_id" ON fs.vat_subjects USING btree (updated_at, id);


--
-- Name: index_fs.vat_subjects_on_vatin; Type: INDEX; Schema: fs; Owner: -
--

CREATE INDEX "index_fs.vat_subjects_on_vatin" ON fs.vat_subjects USING btree (vatin);


--
-- Name: index_fs_to_datahub.its_to_cbs_on_corporate_body_id; Type: INDEX; Schema: fs_to_datahub; Owner: -
--

CREATE INDEX "index_fs_to_datahub.its_to_cbs_on_corporate_body_id" ON fs_to_datahub.income_tax_subject_to_corporate_bodies USING btree (corporate_body_id);


--
-- Name: index_fs_to_datahub.its_to_cbs_on_tis_id; Type: INDEX; Schema: fs_to_datahub; Owner: -
--

CREATE INDEX "index_fs_to_datahub.its_to_cbs_on_tis_id" ON fs_to_datahub.income_tax_subject_to_corporate_bodies USING btree (income_tax_subject_id);


--
-- Name: index_fs_to_datahub.tl_to_cbs_on_corporate_body_id; Type: INDEX; Schema: fs_to_datahub; Owner: -
--

CREATE INDEX "index_fs_to_datahub.tl_to_cbs_on_corporate_body_id" ON fs_to_datahub.tax_liability_to_corporate_bodies USING btree (corporate_body_id);


--
-- Name: index_fs_to_datahub.tl_to_cbs_on_tax_liability_id; Type: INDEX; Schema: fs_to_datahub; Owner: -
--

CREATE UNIQUE INDEX "index_fs_to_datahub.tl_to_cbs_on_tax_liability_id" ON fs_to_datahub.tax_liability_to_corporate_bodies USING btree (tax_liability_id);


--
-- Name: index_fs_to_datahub.vs_to_cbs_on_corporate_body_id; Type: INDEX; Schema: fs_to_datahub; Owner: -
--

CREATE INDEX "index_fs_to_datahub.vs_to_cbs_on_corporate_body_id" ON fs_to_datahub.vat_subject_to_corporate_bodies USING btree (corporate_body_id);


--
-- Name: index_fs_to_datahub.vs_to_cbs_on_vat_subject_id; Type: INDEX; Schema: fs_to_datahub; Owner: -
--

CREATE INDEX "index_fs_to_datahub.vs_to_cbs_on_vat_subject_id" ON fs_to_datahub.vat_subject_to_corporate_bodies USING btree (vat_subject_id);


--
-- Name: index_itms.aktivity_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.aktivity_on_itms_id" ON itms.aktivity USING btree (itms_id);


--
-- Name: index_itms.aktivity_on_subjekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.aktivity_on_subjekt_id" ON itms.aktivity USING btree (subjekt_id);


--
-- Name: index_itms.aktivity_on_typ_aktivity_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.aktivity_on_typ_aktivity_id" ON itms.aktivity USING btree (typ_aktivity_id);


--
-- Name: index_itms.ciselniky_on_ciselnik_kod; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.ciselniky_on_ciselnik_kod" ON itms.ciselniky USING btree (ciselnik_kod);


--
-- Name: index_itms.deklarovane_vydavky_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.deklarovane_vydavky_on_itms_id" ON itms.deklarovane_vydavky USING btree (itms_id);


--
-- Name: index_itms.deklarovane_vydavky_on_polozka_rozpoctu_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.deklarovane_vydavky_on_polozka_rozpoctu_id" ON itms.deklarovane_vydavky USING btree (polozka_rozpoctu_id);


--
-- Name: index_itms.deklarovane_vydavky_on_uctovny_doklad_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.deklarovane_vydavky_on_uctovny_doklad_id" ON itms.deklarovane_vydavky USING btree (uctovny_doklad_id);


--
-- Name: index_itms.deklarovane_vydavky_on_verejne_obstaravanie_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.deklarovane_vydavky_on_verejne_obstaravanie_id" ON itms.deklarovane_vydavky USING btree (verejne_obstaravanie_id);


--
-- Name: index_itms.deklarovane_vydavky_on_zmluva_vo_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.deklarovane_vydavky_on_zmluva_vo_id" ON itms.deklarovane_vydavky USING btree (zmluva_verejne_obstaravanie_id);


--
-- Name: index_itms.deklarovane_vydavky_on_zop_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.deklarovane_vydavky_on_zop_id" ON itms.deklarovane_vydavky USING btree (zop_id);


--
-- Name: index_itms.deklarovane_vydavky_sumy_neschvalene_dns; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.deklarovane_vydavky_sumy_neschvalene_dns" ON itms.deklarovane_vydavky_sumy_neschvalene_na_preplatenie USING btree (druh_neschvalenej_sumy);


--
-- Name: index_itms.deklarovane_vydavky_sumy_neschvalene_dv; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.deklarovane_vydavky_sumy_neschvalene_dv" ON itms.deklarovane_vydavky_sumy_neschvalene_na_preplatenie USING btree (deklarovany_vydavok_id);


--
-- Name: index_itms.deklarovane_vydavky_sumy_neschvalene_sn; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.deklarovane_vydavky_sumy_neschvalene_sn" ON itms.deklarovane_vydavky_sumy_neschvalene_na_preplatenie USING btree (suma_neschvalena);


--
-- Name: index_itms.deklarovane_vydavky_sumy_neziadane_dns; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.deklarovane_vydavky_sumy_neziadane_dns" ON itms.deklarovane_vydavky_sumy_neziadane_na_preplatenie USING btree (druh_neziadanej_sumy);


--
-- Name: index_itms.deklarovane_vydavky_sumy_neziadane_dv; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.deklarovane_vydavky_sumy_neziadane_dv" ON itms.deklarovane_vydavky_sumy_neziadane_na_preplatenie USING btree (deklarovany_vydavok_id);


--
-- Name: index_itms.deklarovane_vydavky_sumy_neziadane_sn; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.deklarovane_vydavky_sumy_neziadane_sn" ON itms.deklarovane_vydavky_sumy_neziadane_na_preplatenie USING btree (suma_neziadana);


--
-- Name: index_itms.dodavatelia_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.dodavatelia_on_itms_id" ON itms.dodavatelia USING btree (itms_id);


--
-- Name: index_itms.dodavatelia_on_obec_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.dodavatelia_on_obec_id" ON itms.dodavatelia USING btree (obec_id);


--
-- Name: index_itms.dodavatelia_on_stat_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.dodavatelia_on_stat_id" ON itms.dodavatelia USING btree (stat_id);


--
-- Name: index_itms.dodavatelia_on_typ_ineho_identifikacneho_cisla_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.dodavatelia_on_typ_ineho_identifikacneho_cisla_id" ON itms.dodavatelia USING btree (typ_ineho_identifikacneho_cisla_id);


--
-- Name: index_itms.hodnoty_ciselnikov_on_ciselnik_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.hodnoty_ciselnikov_on_ciselnik_id" ON itms.hodnoty_ciselnikov USING btree (ciselnik_id);


--
-- Name: index_itms.hodnoty_ciselnikov_on_ciselnik_id_and_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.hodnoty_ciselnikov_on_ciselnik_id_and_itms_id" ON itms.hodnoty_ciselnikov USING btree (ciselnik_id, itms_id);


--
-- Name: index_itms.hodnoty_ciselnikov_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.hodnoty_ciselnikov_on_itms_id" ON itms.hodnoty_ciselnikov USING btree (itms_id);


--
-- Name: index_itms.intenzity_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.intenzity_on_itms_id" ON itms.intenzity USING btree (itms_id);


--
-- Name: index_itms.intenzity_on_subjekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.intenzity_on_subjekt_id" ON itms.intenzity USING btree (subjekt_id);


--
-- Name: index_itms.intenzity_on_zdroj_eu_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.intenzity_on_zdroj_eu_id" ON itms.intenzity USING btree (zdroj_eu_id);


--
-- Name: index_itms.intenzity_on_zdroj_pr_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.intenzity_on_zdroj_pr_id" ON itms.intenzity USING btree (zdroj_pr_id);


--
-- Name: index_itms.intenzity_on_zdroj_sr_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.intenzity_on_zdroj_sr_id" ON itms.intenzity USING btree (zdroj_sr_id);


--
-- Name: index_itms.intenzity_on_zdroj_vz_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.intenzity_on_zdroj_vz_id" ON itms.intenzity USING btree (zdroj_vz_id);


--
-- Name: index_itms.intenzity_on_zdroj_yei_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.intenzity_on_zdroj_yei_id" ON itms.intenzity USING btree (zdroj_yei_id);


--
-- Name: index_itms.intenzity_zdroje_on_zdroj_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.intenzity_zdroje_on_zdroj_id" ON itms.intenzity_zdroje USING btree (zdroj_id);


--
-- Name: index_itms.konkretne_ciele_hodnoty_ciselnikov_on_hc; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.konkretne_ciele_hodnoty_ciselnikov_on_hc" ON itms.konkretne_ciele_hodnoty_ciselnikov USING btree (hodnota_ciselnika_id);


--
-- Name: index_itms.konkretne_ciele_hodnoty_ciselnikov_on_kc; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.konkretne_ciele_hodnoty_ciselnikov_on_kc" ON itms.konkretne_ciele_hodnoty_ciselnikov USING btree (konkretny_ciel_id);


--
-- Name: index_itms.konkretne_ciele_hodnoty_ciselnikov_on_kc_hc; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.konkretne_ciele_hodnoty_ciselnikov_on_kc_hc" ON itms.konkretne_ciele_hodnoty_ciselnikov USING btree (konkretny_ciel_id, hodnota_ciselnika_id);


--
-- Name: index_itms.konkretne_ciele_on_fond_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.konkretne_ciele_on_fond_id" ON itms.konkretne_ciele USING btree (fond_id);


--
-- Name: index_itms.konkretne_ciele_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.konkretne_ciele_on_itms_id" ON itms.konkretne_ciele USING btree (itms_id);


--
-- Name: index_itms.konkretne_ciele_on_kategoria_regionov_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.konkretne_ciele_on_kategoria_regionov_id" ON itms.konkretne_ciele USING btree (kategoria_regionov_id);


--
-- Name: index_itms.konkretne_ciele_on_prioritna_os_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.konkretne_ciele_on_prioritna_os_id" ON itms.konkretne_ciele USING btree (prioritna_os_id);


--
-- Name: index_itms.konkretne_ciele_typy_aktivit_on_kc_and_ta; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.konkretne_ciele_typy_aktivit_on_kc_and_ta" ON itms.konkretne_ciele_typy_aktivit USING btree (konkretny_ciel_id, typ_aktivity_id);


--
-- Name: index_itms.konkretne_ciele_typy_aktivit_on_konkretny_ciel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.konkretne_ciele_typy_aktivit_on_konkretny_ciel_id" ON itms.konkretne_ciele_typy_aktivit USING btree (konkretny_ciel_id);


--
-- Name: index_itms.konkretne_ciele_typy_aktivit_on_typ_aktivity_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.konkretne_ciele_typy_aktivit_on_typ_aktivity_id" ON itms.konkretne_ciele_typy_aktivit USING btree (typ_aktivity_id);


--
-- Name: index_itms.miesta_realizacie_on_nuts_3_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.miesta_realizacie_on_nuts_3_id" ON itms.miesta_realizacie USING btree (nuts_3_id);


--
-- Name: index_itms.miesta_realizacie_on_nuts_4_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.miesta_realizacie_on_nuts_4_id" ON itms.miesta_realizacie USING btree (nuts_4_id);


--
-- Name: index_itms.miesta_realizacie_on_nuts_5_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.miesta_realizacie_on_nuts_5_id" ON itms.miesta_realizacie USING btree (nuts_5_id);


--
-- Name: index_itms.miesta_realizacie_on_stat_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.miesta_realizacie_on_stat_id" ON itms.miesta_realizacie USING btree (stat_id);


--
-- Name: index_itms.monitorovacie_terminy_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.monitorovacie_terminy_on_projekt_id" ON itms.monitorovacie_terminy USING btree (projekt_id);


--
-- Name: index_itms.nezrovnalosti_on_administrativny_stav_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_on_administrativny_stav_id" ON itms.nezrovnalosti USING btree (administrativny_stav_id);


--
-- Name: index_itms.nezrovnalosti_on_dlznik_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_on_dlznik_id" ON itms.nezrovnalosti USING btree (dlznik_id);


--
-- Name: index_itms.nezrovnalosti_on_financny_stav_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_on_financny_stav_id" ON itms.nezrovnalosti USING btree (financny_stav_id);


--
-- Name: index_itms.nezrovnalosti_on_hlavny_typ_nezrovnalosti_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_on_hlavny_typ_nezrovnalosti_id" ON itms.nezrovnalosti USING btree (hlavny_typ_nezrovnalosti_id);


--
-- Name: index_itms.nezrovnalosti_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.nezrovnalosti_on_itms_id" ON itms.nezrovnalosti USING btree (itms_id);


--
-- Name: index_itms.nezrovnalosti_on_konkretny_ciel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_on_konkretny_ciel_id" ON itms.nezrovnalosti USING btree (konkretny_ciel_id);


--
-- Name: index_itms.nezrovnalosti_on_operacny_program_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_on_operacny_program_id" ON itms.nezrovnalosti USING btree (operacny_program_id);


--
-- Name: index_itms.nezrovnalosti_on_prioritna_os_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_on_prioritna_os_id" ON itms.nezrovnalosti USING btree (prioritna_os_id);


--
-- Name: index_itms.nezrovnalosti_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_on_projekt_id" ON itms.nezrovnalosti USING btree (projekt_id);


--
-- Name: index_itms.nezrovnalosti_pohladavkove_doklady_doklad; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_pohladavkove_doklady_doklad" ON itms.nezrovnalosti_suvisiace_pohladavkove_doklady USING btree (pohladavkovy_doklad_id);


--
-- Name: index_itms.nezrovnalosti_pohladavkove_doklady_nezrovnalost; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_pohladavkove_doklady_nezrovnalost" ON itms.nezrovnalosti_suvisiace_pohladavkove_doklady USING btree (nezrovnalost_id);


--
-- Name: index_itms.nezrovnalosti_subjekty_sposobili_nezrovnalosti; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_subjekty_sposobili_nezrovnalosti" ON itms.nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost USING btree (nezrovnalost_id);


--
-- Name: index_itms.nezrovnalosti_subjekty_sposobili_subjekty; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_subjekty_sposobili_subjekty" ON itms.nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost USING btree (subjekt_id);


--
-- Name: index_itms.nezrovnalosti_subjekty_zistili_nezrovnalost; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_subjekty_zistili_nezrovnalost" ON itms.nezrovnalosti_subjekty_ktore_zistili_nezrovnalost USING btree (nezrovnalost_id);


--
-- Name: index_itms.nezrovnalosti_subjekty_zistili_subjekty; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_subjekty_zistili_subjekty" ON itms.nezrovnalosti_subjekty_ktore_zistili_nezrovnalost USING btree (subjekt_id);


--
-- Name: index_itms.nezrovnalosti_subjekty_zodpovedne_nezrovnalosti; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_subjekty_zodpovedne_nezrovnalosti" ON itms.nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie USING btree (nezrovnalost_id);


--
-- Name: index_itms.nezrovnalosti_subjekty_zodpovedne_subjekty; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_subjekty_zodpovedne_subjekty" ON itms.nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie USING btree (subjekt_id);


--
-- Name: index_itms.nezrovnalosti_suvisiace_nezrovnalosti_nezrovnalost; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_suvisiace_nezrovnalosti_nezrovnalost" ON itms.nezrovnalosti_suvisiace_nezrovnalosti USING btree (nezrovnalost_id);


--
-- Name: index_itms.nezrovnalosti_suvisiace_nezrovnalosti_suvisiaca; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_suvisiace_nezrovnalosti_suvisiaca" ON itms.nezrovnalosti_suvisiace_nezrovnalosti USING btree (suvisiaca_nezrovnalost_id);


--
-- Name: index_itms.nezrovnalosti_suvisiace_verejne_obstaravania_on_n; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_suvisiace_verejne_obstaravania_on_n" ON itms.nezrovnalosti_suvisiace_verejne_obstaravania USING btree (nezrovnalost_id);


--
-- Name: index_itms.nezrovnalosti_suvisiace_verejne_obstaravania_on_vo; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_suvisiace_verejne_obstaravania_on_vo" ON itms.nezrovnalosti_suvisiace_verejne_obstaravania USING btree (verejne_obstaravanie_id);


--
-- Name: index_itms.nezrovnalosti_suvisiace_vo_on_n_and_vo; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.nezrovnalosti_suvisiace_vo_on_n_and_vo" ON itms.nezrovnalosti_suvisiace_verejne_obstaravania USING btree (nezrovnalost_id, verejne_obstaravanie_id);


--
-- Name: index_itms.nezrovnalosti_suvisiace_zop_on_nezrovnalost_and_zop; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.nezrovnalosti_suvisiace_zop_on_nezrovnalost_and_zop" ON itms.nezrovnalosti_suvisiace_zop USING btree (nezrovnalost_id, zop_id);


--
-- Name: index_itms.nezrovnalosti_suvisiace_zop_on_nezrovnalost_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_suvisiace_zop_on_nezrovnalost_id" ON itms.nezrovnalosti_suvisiace_zop USING btree (nezrovnalost_id);


--
-- Name: index_itms.nezrovnalosti_suvisiace_zop_on_zop_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_suvisiace_zop_on_zop_id" ON itms.nezrovnalosti_suvisiace_zop USING btree (zop_id);


--
-- Name: index_itms.nezrovnalosti_typy_nezrovnalosti_on_kod_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_typy_nezrovnalosti_on_kod_id" ON itms.nezrovnalosti_typy_nezrovnalosti USING btree (kod_id);


--
-- Name: index_itms.nezrovnalosti_typy_nezrovnalosti_on_nezrovnalost_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_typy_nezrovnalosti_on_nezrovnalost_id" ON itms.nezrovnalosti_typy_nezrovnalosti USING btree (nezrovnalost_id);


--
-- Name: index_itms.nuts_kody_on_hodnota_nuts_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nuts_kody_on_hodnota_nuts_id" ON itms.nuts_kody USING btree (hodnota_nuts_id);


--
-- Name: index_itms.operacne_programy_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.operacne_programy_on_itms_id" ON itms.operacne_programy USING btree (itms_id);


--
-- Name: index_itms.operacne_programy_on_subjekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.operacne_programy_on_subjekt_id" ON itms.operacne_programy USING btree (subjekt_id);


--
-- Name: index_itms.organizacne_zlozky_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.organizacne_zlozky_on_itms_id" ON itms.organizacne_zlozky USING btree (itms_id);


--
-- Name: index_itms.osoby_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.osoby_on_itms_id" ON itms.osoby USING btree (itms_id);


--
-- Name: index_itms.pohladavkove_doklady_on_dlznik_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.pohladavkove_doklady_on_dlznik_id" ON itms.pohladavkove_doklady USING btree (dlznik_id);


--
-- Name: index_itms.pohladavkove_doklady_on_dovod_vratenia_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.pohladavkove_doklady_on_dovod_vratenia_id" ON itms.pohladavkove_doklady USING btree (dovod_vratenia_id);


--
-- Name: index_itms.pohladavkove_doklady_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.pohladavkove_doklady_on_itms_id" ON itms.pohladavkove_doklady USING btree (itms_id);


--
-- Name: index_itms.pohladavkove_doklady_on_konkretny_ciel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.pohladavkove_doklady_on_konkretny_ciel_id" ON itms.pohladavkove_doklady USING btree (konkretny_ciel_id);


--
-- Name: index_itms.pohladavkove_doklady_on_nezrovnalost_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.pohladavkove_doklady_on_nezrovnalost_id" ON itms.pohladavkove_doklady USING btree (nezrovnalost_id);


--
-- Name: index_itms.pohladavkove_doklady_on_prioritna_os_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.pohladavkove_doklady_on_prioritna_os_id" ON itms.pohladavkove_doklady USING btree (prioritna_os_id);


--
-- Name: index_itms.pohladavkove_doklady_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.pohladavkove_doklady_on_projekt_id" ON itms.pohladavkove_doklady USING btree (projekt_id);


--
-- Name: index_itms.pohladavkove_doklady_on_zodpovedny_subjekt; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.pohladavkove_doklady_on_zodpovedny_subjekt" ON itms.pohladavkove_doklady USING btree (subjekt_zodpovedny_za_vymahanie_id);


--
-- Name: index_itms.pohladavkove_doklady_suvisiace_vo_on_pd; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.pohladavkove_doklady_suvisiace_vo_on_pd" ON itms.pohladavkove_doklady_suvisiace_verejne_obstaravania USING btree (pohladavkovy_doklad_id);


--
-- Name: index_itms.pohladavkove_doklady_suvisiace_vo_on_pd_and_vo; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.pohladavkove_doklady_suvisiace_vo_on_pd_and_vo" ON itms.pohladavkove_doklady_suvisiace_verejne_obstaravania USING btree (pohladavkovy_doklad_id, verejne_obstaravanie_id);


--
-- Name: index_itms.pohladavkove_doklady_suvisiace_vo_on_vo; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.pohladavkove_doklady_suvisiace_vo_on_vo" ON itms.pohladavkove_doklady_suvisiace_verejne_obstaravania USING btree (verejne_obstaravanie_id);


--
-- Name: index_itms.pohladavkove_doklady_suvisiace_zop_on_pd; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.pohladavkove_doklady_suvisiace_zop_on_pd" ON itms.pohladavkove_doklady_suvisiace_zop USING btree (pohladavkovy_doklad_id);


--
-- Name: index_itms.pohladavkove_doklady_suvisiace_zop_on_pd_and_zop; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.pohladavkove_doklady_suvisiace_zop_on_pd_and_zop" ON itms.pohladavkove_doklady_suvisiace_zop USING btree (pohladavkovy_doklad_id, zop_id);


--
-- Name: index_itms.pohladavkove_doklady_suvisiace_zop_on_zop_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.pohladavkove_doklady_suvisiace_zop_on_zop_id" ON itms.pohladavkove_doklady_suvisiace_zop USING btree (zop_id);


--
-- Name: index_itms.polozky_rozpoctu_on_aktivita_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.polozky_rozpoctu_on_aktivita_id" ON itms.polozky_rozpoctu USING btree (aktivita_id);


--
-- Name: index_itms.polozky_rozpoctu_on_intenzita_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.polozky_rozpoctu_on_intenzita_id" ON itms.polozky_rozpoctu USING btree (intenzita_id);


--
-- Name: index_itms.polozky_rozpoctu_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.polozky_rozpoctu_on_itms_id" ON itms.polozky_rozpoctu USING btree (itms_id);


--
-- Name: index_itms.polozky_rozpoctu_on_skupina_vydavkov_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.polozky_rozpoctu_on_skupina_vydavkov_id" ON itms.polozky_rozpoctu USING btree (skupina_vydavkov_id);


--
-- Name: index_itms.polozky_rozpoctu_on_subjekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.polozky_rozpoctu_on_subjekt_id" ON itms.polozky_rozpoctu USING btree (subjekt_id);


--
-- Name: index_itms.prioritne_osi_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.prioritne_osi_on_itms_id" ON itms.prioritne_osi USING btree (itms_id);


--
-- Name: index_itms.prioritne_osi_on_operacny_program_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.prioritne_osi_on_operacny_program_id" ON itms.prioritne_osi USING btree (operacny_program_id);


--
-- Name: index_itms.projektove_ukazovatele_casy_plnenia_cas; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projektove_ukazovatele_casy_plnenia_cas" ON itms.projektove_ukazovatele_casy_plnenia USING btree (kod_id);


--
-- Name: index_itms.projektove_ukazovatele_casy_plnenia_ukazovatel; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projektove_ukazovatele_casy_plnenia_ukazovatel" ON itms.projektove_ukazovatele_casy_plnenia USING btree (projektovy_ukazovatel_id);


--
-- Name: index_itms.projektove_ukazovatele_fondy_fond; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projektove_ukazovatele_fondy_fond" ON itms.projektove_ukazovatele_fondy USING btree (kod_id);


--
-- Name: index_itms.projektove_ukazovatele_fondy_ukazovatel; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projektove_ukazovatele_fondy_ukazovatel" ON itms.projektove_ukazovatele_fondy USING btree (projektovy_ukazovatel_id);


--
-- Name: index_itms.projektove_ukazovatele_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projektove_ukazovatele_on_itms_id" ON itms.projektove_ukazovatele USING btree (itms_id);


--
-- Name: index_itms.projekty_aktivity_on_aktivita_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_aktivity_on_aktivita_id" ON itms.projekty_aktivity USING btree (aktivita_id);


--
-- Name: index_itms.projekty_aktivity_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_aktivity_on_projekt_id" ON itms.projekty_aktivity USING btree (projekt_id);


--
-- Name: index_itms.projekty_formy_financovania_on_forma_financovania_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_formy_financovania_on_forma_financovania_id" ON itms.projekty_formy_financovania USING btree (forma_financovania_id);


--
-- Name: index_itms.projekty_formy_financovania_on_p_and_ff; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projekty_formy_financovania_on_p_and_ff" ON itms.projekty_formy_financovania USING btree (projekt_id, forma_financovania_id);


--
-- Name: index_itms.projekty_formy_financovania_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_formy_financovania_on_projekt_id" ON itms.projekty_formy_financovania USING btree (projekt_id);


--
-- Name: index_itms.projekty_hosp_cinnosti_on_p_and_hc; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projekty_hosp_cinnosti_on_p_and_hc" ON itms.projekty_hospodarske_cinnosti USING btree (projekt_id, hospodarska_cinnost_id);


--
-- Name: index_itms.projekty_hospodarske_cinnosti_on_hospodarska_cinnost; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_hospodarske_cinnosti_on_hospodarska_cinnost" ON itms.projekty_hospodarske_cinnosti USING btree (hospodarska_cinnost_id);


--
-- Name: index_itms.projekty_hospodarske_cinnosti_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_hospodarske_cinnosti_on_projekt_id" ON itms.projekty_hospodarske_cinnosti USING btree (projekt_id);


--
-- Name: index_itms.projekty_intenzity_on_intenzita_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_intenzity_on_intenzita_id" ON itms.projekty_intenzity USING btree (intenzita_id);


--
-- Name: index_itms.projekty_intenzity_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_intenzity_on_projekt_id" ON itms.projekty_intenzity USING btree (projekt_id);


--
-- Name: index_itms.projekty_intenzity_on_projekt_id_and_intenzita_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projekty_intenzity_on_projekt_id_and_intenzita_id" ON itms.projekty_intenzity USING btree (projekt_id, intenzita_id);


--
-- Name: index_itms.projekty_meratelne_ukazovatele_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_meratelne_ukazovatele_on_projekt_id" ON itms.projekty_meratelne_ukazovatele USING btree (projekt_id);


--
-- Name: index_itms.projekty_meratelne_ukazovatele_on_projekt_ukazovatel; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projekty_meratelne_ukazovatele_on_projekt_ukazovatel" ON itms.projekty_meratelne_ukazovatele USING btree (projekt_id, projektovy_ukazovatel_id);


--
-- Name: index_itms.projekty_meratelne_ukazovatele_on_ukazovatel; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_meratelne_ukazovatele_on_ukazovatel" ON itms.projekty_meratelne_ukazovatele USING btree (projektovy_ukazovatel_id);


--
-- Name: index_itms.projekty_miesta_realizacie_mimo_uzemia_op_on_miesto; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_miesta_realizacie_mimo_uzemia_op_on_miesto" ON itms.projekty_miesta_realizacie_mimo_uzemia_op USING btree (miesto_realizacie_id);


--
-- Name: index_itms.projekty_miesta_realizacie_mimo_uzemia_op_on_projekt; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_miesta_realizacie_mimo_uzemia_op_on_projekt" ON itms.projekty_miesta_realizacie_mimo_uzemia_op USING btree (projekt_id);


--
-- Name: index_itms.projekty_miesta_realizacie_on_miesto_realizacie_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_miesta_realizacie_on_miesto_realizacie_id" ON itms.projekty_miesta_realizacie USING btree (miesto_realizacie_id);


--
-- Name: index_itms.projekty_miesta_realizacie_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_miesta_realizacie_on_projekt_id" ON itms.projekty_miesta_realizacie USING btree (projekt_id);


--
-- Name: index_itms.projekty_oblasti_intervencie_on_oblast_intervencie; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_oblasti_intervencie_on_oblast_intervencie" ON itms.projekty_oblasti_intervencie USING btree (oblast_intervencie_id);


--
-- Name: index_itms.projekty_oblasti_intervencie_on_p_and_oi; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projekty_oblasti_intervencie_on_p_and_oi" ON itms.projekty_oblasti_intervencie USING btree (projekt_id, oblast_intervencie_id);


--
-- Name: index_itms.projekty_oblasti_intervencie_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_oblasti_intervencie_on_projekt_id" ON itms.projekty_oblasti_intervencie USING btree (projekt_id);


--
-- Name: index_itms.projekty_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projekty_on_itms_id" ON itms.projekty USING btree (itms_id);


--
-- Name: index_itms.projekty_on_prijimatel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_on_prijimatel_id" ON itms.projekty USING btree (prijimatel_id);


--
-- Name: index_itms.projekty_on_schvalena_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_on_schvalena_zonfp_id" ON itms.projekty USING btree (schvalena_zonfp_id);


--
-- Name: index_itms.projekty_on_vyzva_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_on_vyzva_id" ON itms.projekty USING btree (vyzva_id);


--
-- Name: index_itms.projekty_organizacne_zlozky_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_organizacne_zlozky_on_projekt_id" ON itms.projekty_organizacne_zlozky USING btree (projekt_id);


--
-- Name: index_itms.projekty_organizacne_zlozky_on_zlozka; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_organizacne_zlozky_on_zlozka" ON itms.projekty_organizacne_zlozky USING btree (organizacna_zlozka_id);


--
-- Name: index_itms.projekty_partneri_on_partner_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_partneri_on_partner_id" ON itms.projekty_partneri USING btree (partner_id);


--
-- Name: index_itms.projekty_partneri_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_partneri_on_projekt_id" ON itms.projekty_partneri USING btree (projekt_id);


--
-- Name: index_itms.projekty_partneri_on_projekt_id_and_partner_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projekty_partneri_on_projekt_id_and_partner_id" ON itms.projekty_partneri USING btree (projekt_id, partner_id);


--
-- Name: index_itms.projekty_polozky_rozpoctu_on_p_and_pr; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projekty_polozky_rozpoctu_on_p_and_pr" ON itms.projekty_polozky_rozpoctu USING btree (projekt_id, polozka_rozpoctu_id);


--
-- Name: index_itms.projekty_polozky_rozpoctu_on_polozka_rozpoctu_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_polozky_rozpoctu_on_polozka_rozpoctu_id" ON itms.projekty_polozky_rozpoctu USING btree (polozka_rozpoctu_id);


--
-- Name: index_itms.projekty_polozky_rozpoctu_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_polozky_rozpoctu_on_projekt_id" ON itms.projekty_polozky_rozpoctu USING btree (projekt_id);


--
-- Name: index_itms.projekty_sekundarne_tematicke_okruhy_on_p_and_sto; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projekty_sekundarne_tematicke_okruhy_on_p_and_sto" ON itms.projekty_sekundarne_tematicke_okruhy USING btree (projekt_id, sekundarny_tematicky_okruh_id);


--
-- Name: index_itms.projekty_sekundarne_tematicke_okruhy_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_sekundarne_tematicke_okruhy_on_projekt_id" ON itms.projekty_sekundarne_tematicke_okruhy USING btree (projekt_id);


--
-- Name: index_itms.projekty_sekundarne_tematicke_okruhy_on_sto; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_sekundarne_tematicke_okruhy_on_sto" ON itms.projekty_sekundarne_tematicke_okruhy USING btree (sekundarny_tematicky_okruh_id);


--
-- Name: index_itms.projekty_typy_uzemia_on_p_and_tu; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projekty_typy_uzemia_on_p_and_tu" ON itms.projekty_typy_uzemia USING btree (projekt_id, typ_uzemia_id);


--
-- Name: index_itms.projekty_typy_uzemia_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_typy_uzemia_on_projekt_id" ON itms.projekty_typy_uzemia USING btree (projekt_id);


--
-- Name: index_itms.projekty_typy_uzemia_on_typ_uzemia_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_typy_uzemia_on_typ_uzemia_id" ON itms.projekty_typy_uzemia USING btree (typ_uzemia_id);


--
-- Name: index_itms.projekty_uzemne_mechanizmy_on_p_and_um; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projekty_uzemne_mechanizmy_on_p_and_um" ON itms.projekty_uzemne_mechanizmy USING btree (projekt_id, uzemny_mechanizmus_id);


--
-- Name: index_itms.projekty_uzemne_mechanizmy_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_uzemne_mechanizmy_on_projekt_id" ON itms.projekty_uzemne_mechanizmy USING btree (projekt_id);


--
-- Name: index_itms.projekty_uzemne_mechanizmy_on_uzemny_mechanizmus_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_uzemne_mechanizmy_on_uzemny_mechanizmus_id" ON itms.projekty_uzemne_mechanizmy USING btree (uzemny_mechanizmus_id);


--
-- Name: index_itms.subjekty_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.subjekty_on_itms_id" ON itms.subjekty USING btree (itms_id);


--
-- Name: index_itms.subjekty_on_obec_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.subjekty_on_obec_id" ON itms.subjekty USING btree (obec_id);


--
-- Name: index_itms.subjekty_on_stat_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.subjekty_on_stat_id" ON itms.subjekty USING btree (stat_id);


--
-- Name: index_itms.subjekty_on_typ_ineho_identifikacneho_cisla_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.subjekty_on_typ_ineho_identifikacneho_cisla_id" ON itms.subjekty USING btree (typ_ineho_identifikacneho_cisla_id);


--
-- Name: index_itms.typy_aktivit_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.typy_aktivit_on_itms_id" ON itms.typy_aktivit USING btree (itms_id);


--
-- Name: index_itms.uctovne_doklady_on_ddo; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.uctovne_doklady_on_ddo" ON itms.uctovne_doklady USING btree (dodavatel_dodavatel_obstaravatel_id);


--
-- Name: index_itms.uctovne_doklady_on_dodavatel_subjekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.uctovne_doklady_on_dodavatel_subjekt_id" ON itms.uctovne_doklady USING btree (dodavatel_subjekt_id);


--
-- Name: index_itms.uctovne_doklady_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.uctovne_doklady_on_itms_id" ON itms.uctovne_doklady USING btree (itms_id);


--
-- Name: index_itms.uctovne_doklady_on_vlastnik_dokladu_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.uctovne_doklady_on_vlastnik_dokladu_id" ON itms.uctovne_doklady USING btree (vlastnik_dokladu_id);


--
-- Name: index_itms.uctovne_doklady_polozky_dokladu_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.uctovne_doklady_polozky_dokladu_on_itms_id" ON itms.uctovne_doklady_polozky_dokladu USING btree (itms_id);


--
-- Name: index_itms.uctovne_doklady_polozky_dokladu_on_uctovny_doklad_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.uctovne_doklady_polozky_dokladu_on_uctovny_doklad_id" ON itms.uctovne_doklady_polozky_dokladu USING btree (uctovny_doklad_id);


--
-- Name: index_itms.uctovne_doklady_projekty_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.uctovne_doklady_projekty_on_projekt_id" ON itms.uctovne_doklady_projekty USING btree (projekt_id);


--
-- Name: index_itms.uctovne_doklady_projekty_on_uctovny_doklad_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.uctovne_doklady_projekty_on_uctovny_doklad_id" ON itms.uctovne_doklady_projekty USING btree (uctovny_doklad_id);


--
-- Name: index_itms.uctovne_doklady_projekty_on_ud_and_p; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.uctovne_doklady_projekty_on_ud_and_p" ON itms.uctovne_doklady_projekty USING btree (uctovny_doklad_id, projekt_id);


--
-- Name: index_itms.verejne_obstaravania_on_druh_zakazky_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.verejne_obstaravania_on_druh_zakazky_id" ON itms.verejne_obstaravania USING btree (druh_zakazky_id);


--
-- Name: index_itms.verejne_obstaravania_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.verejne_obstaravania_on_itms_id" ON itms.verejne_obstaravania USING btree (itms_id);


--
-- Name: index_itms.verejne_obstaravania_on_metoda_vo_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.verejne_obstaravania_on_metoda_vo_id" ON itms.verejne_obstaravania USING btree (metoda_vo_id);


--
-- Name: index_itms.verejne_obstaravania_on_obstaravatel_subjekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.verejne_obstaravania_on_obstaravatel_subjekt_id" ON itms.verejne_obstaravania USING btree (obstaravatel_subjekt_id);


--
-- Name: index_itms.verejne_obstaravania_on_postup_obstaravania_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.verejne_obstaravania_on_postup_obstaravania_id" ON itms.verejne_obstaravania USING btree (postup_obstaravania_id);


--
-- Name: index_itms.verejne_obstaravania_on_zadavatel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.verejne_obstaravania_on_zadavatel_id" ON itms.verejne_obstaravania USING btree (zadavatel_id);


--
-- Name: index_itms.verejne_obstaravania_operacne_programy_on_op; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.verejne_obstaravania_operacne_programy_on_op" ON itms.verejne_obstaravania_operacne_programy USING btree (operacny_program_id);


--
-- Name: index_itms.verejne_obstaravania_operacne_programy_on_vo; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.verejne_obstaravania_operacne_programy_on_vo" ON itms.verejne_obstaravania_operacne_programy USING btree (verejne_obstaravanie_id);


--
-- Name: index_itms.verejne_obstaravania_operacne_programy_on_vo_and_op; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.verejne_obstaravania_operacne_programy_on_vo_and_op" ON itms.verejne_obstaravania_operacne_programy USING btree (verejne_obstaravanie_id, operacny_program_id);


--
-- Name: index_itms.verejne_obstaravania_projekty_on_p; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.verejne_obstaravania_projekty_on_p" ON itms.verejne_obstaravania_projekty USING btree (projekt_id);


--
-- Name: index_itms.verejne_obstaravania_projekty_on_vo; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.verejne_obstaravania_projekty_on_vo" ON itms.verejne_obstaravania_projekty USING btree (verejne_obstaravanie_id);


--
-- Name: index_itms.verejne_obstaravania_projekty_on_vo_and_p; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.verejne_obstaravania_projekty_on_vo_and_p" ON itms.verejne_obstaravania_projekty USING btree (verejne_obstaravanie_id, projekt_id);


--
-- Name: index_itms.verejne_obstaravania_uctovne_doklady_on_ud; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.verejne_obstaravania_uctovne_doklady_on_ud" ON itms.verejne_obstaravania_uctovne_doklady USING btree (uctovny_doklad_id);


--
-- Name: index_itms.verejne_obstaravania_uctovne_doklady_on_vo; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.verejne_obstaravania_uctovne_doklady_on_vo" ON itms.verejne_obstaravania_uctovne_doklady USING btree (verejne_obstaravanie_id);


--
-- Name: index_itms.verejne_obstaravania_uctovne_doklady_on_vo_and_ud; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.verejne_obstaravania_uctovne_doklady_on_vo_and_ud" ON itms.verejne_obstaravania_uctovne_doklady USING btree (verejne_obstaravanie_id, uctovny_doklad_id);


--
-- Name: index_itms.vo_doplnujuce_predmety_doplnkovy_slovnik_predmet; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vo_doplnujuce_predmety_doplnkovy_slovnik_predmet" ON itms.verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik USING btree (predmet_id);


--
-- Name: index_itms.vo_doplnujuce_predmety_doplnkovy_slovnik_vo; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vo_doplnujuce_predmety_doplnkovy_slovnik_vo" ON itms.verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik USING btree (verejne_obstaravanie_id);


--
-- Name: index_itms.vo_doplnujuce_predmety_doplnkovy_slovnik_vo_predmet; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.vo_doplnujuce_predmety_doplnkovy_slovnik_vo_predmet" ON itms.verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik USING btree (verejne_obstaravanie_id, predmet_id);


--
-- Name: index_itms.vo_doplnujuce_predmety_hlavny_slovnik_predmet; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vo_doplnujuce_predmety_hlavny_slovnik_predmet" ON itms.verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik USING btree (predmet_id);


--
-- Name: index_itms.vo_doplnujuce_predmety_hlavny_slovnik_vo; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vo_doplnujuce_predmety_hlavny_slovnik_vo" ON itms.verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik USING btree (verejne_obstaravanie_id);


--
-- Name: index_itms.vo_doplnujuce_predmety_hlavny_slovnik_vo_predmet; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.vo_doplnujuce_predmety_hlavny_slovnik_vo_predmet" ON itms.verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik USING btree (verejne_obstaravanie_id, predmet_id);


--
-- Name: index_itms.vo_hlavne_predmety_doplnkovy_slovnik_predmet; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vo_hlavne_predmety_doplnkovy_slovnik_predmet" ON itms.verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik USING btree (predmet_id);


--
-- Name: index_itms.vo_hlavne_predmety_doplnkovy_slovnik_vo; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vo_hlavne_predmety_doplnkovy_slovnik_vo" ON itms.verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik USING btree (verejne_obstaravanie_id);


--
-- Name: index_itms.vo_hlavne_predmety_doplnkovy_slovnik_vo_predmet; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.vo_hlavne_predmety_doplnkovy_slovnik_vo_predmet" ON itms.verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik USING btree (verejne_obstaravanie_id, predmet_id);


--
-- Name: index_itms.vo_on_hlavny_predmet_hlavny_slovnik; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vo_on_hlavny_predmet_hlavny_slovnik" ON itms.verejne_obstaravania USING btree (hlavny_predmet_hlavny_slovnik_id);


--
-- Name: index_itms.vo_on_obstaravatel_dodavatel_obstaravatel; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vo_on_obstaravatel_dodavatel_obstaravatel" ON itms.verejne_obstaravania USING btree (obstaravatel_dodavatel_obstaravatel_id);


--
-- Name: index_itms.vyzvy_planovane_doplnujuce_info_on_vyzva_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_planovane_doplnujuce_info_on_vyzva_id" ON itms.vyzvy_planovane_doplnujuce_info USING btree (vyzva_id);


--
-- Name: index_itms.vyzvy_planovane_konkretne_ciele_on_konkretny_ciel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_planovane_konkretne_ciele_on_konkretny_ciel_id" ON itms.vyzvy_planovane_konkretne_ciele USING btree (konkretny_ciel_id);


--
-- Name: index_itms.vyzvy_planovane_konkretne_ciele_on_vyzva_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_planovane_konkretne_ciele_on_vyzva_id" ON itms.vyzvy_planovane_konkretne_ciele USING btree (vyzva_id);


--
-- Name: index_itms.vyzvy_planovane_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.vyzvy_planovane_on_itms_id" ON itms.vyzvy_planovane USING btree (itms_id);


--
-- Name: index_itms.vyzvy_planovane_on_vyhlasovatel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_planovane_on_vyhlasovatel_id" ON itms.vyzvy_planovane USING btree (vyhlasovatel_id);


--
-- Name: index_itms.vyzvy_planovane_poskytovatelia_on_poskytovatel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_planovane_poskytovatelia_on_poskytovatel_id" ON itms.vyzvy_planovane_poskytovatelia USING btree (poskytovatel_id);


--
-- Name: index_itms.vyzvy_planovane_poskytovatelia_on_vyzva_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_planovane_poskytovatelia_on_vyzva_id" ON itms.vyzvy_planovane_poskytovatelia USING btree (vyzva_id);


--
-- Name: index_itms.vyzvy_vyhlasene_doplnujuce_info_on_vyzva_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_doplnujuce_info_on_vyzva_id" ON itms.vyzvy_vyhlasene_doplnujuce_info USING btree (vyzva_id);


--
-- Name: index_itms.vyzvy_vyhlasene_fondy_on_fond_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_fondy_on_fond_id" ON itms.vyzvy_vyhlasene_fondy USING btree (fond_id);


--
-- Name: index_itms.vyzvy_vyhlasene_fondy_on_vyzva_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_fondy_on_vyzva_id" ON itms.vyzvy_vyhlasene_fondy USING btree (vyzva_id);


--
-- Name: index_itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_on_kc; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_on_kc" ON itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit USING btree (konkretny_ciel_id);


--
-- Name: index_itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_on_ta; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_on_ta" ON itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit USING btree (typ_aktivity_id);


--
-- Name: index_itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_on_v; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_on_v" ON itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit USING btree (vyzva_id);


--
-- Name: index_itms.vyzvy_vyhlasene_kontaktne_osoby_on_osoba_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_kontaktne_osoby_on_osoba_id" ON itms.vyzvy_vyhlasene_kontaktne_osoby USING btree (osoba_id);


--
-- Name: index_itms.vyzvy_vyhlasene_kontaktne_osoby_on_vyzva_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_kontaktne_osoby_on_vyzva_id" ON itms.vyzvy_vyhlasene_kontaktne_osoby USING btree (vyzva_id);


--
-- Name: index_itms.vyzvy_vyhlasene_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.vyzvy_vyhlasene_on_itms_id" ON itms.vyzvy_vyhlasene USING btree (itms_id);


--
-- Name: index_itms.vyzvy_vyhlasene_on_vyhlasovatel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_on_vyhlasovatel_id" ON itms.vyzvy_vyhlasene USING btree (vyhlasovatel_id);


--
-- Name: index_itms.vyzvy_vyhlasene_poskytovatelia_on_poskytovatel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_poskytovatelia_on_poskytovatel_id" ON itms.vyzvy_vyhlasene_poskytovatelia USING btree (poskytovatel_id);


--
-- Name: index_itms.vyzvy_vyhlasene_poskytovatelia_on_vyzva_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_poskytovatelia_on_vyzva_id" ON itms.vyzvy_vyhlasene_poskytovatelia USING btree (vyzva_id);


--
-- Name: index_itms.vyzvy_vyhlasene_posudzovane_obdobia_on_vyzva_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_posudzovane_obdobia_on_vyzva_id" ON itms.vyzvy_vyhlasene_posudzovane_obdobia USING btree (vyzva_id);


--
-- Name: index_itms.vyzvy_vyhlasene_vyzvy_planovane_on_pv; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_vyzvy_planovane_on_pv" ON itms.vyzvy_vyhlasene_vyzvy_planovane USING btree (planovana_vyzva_id);


--
-- Name: index_itms.vyzvy_vyhlasene_vyzvy_planovane_on_vv; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_vyzvy_planovane_on_vv" ON itms.vyzvy_vyhlasene_vyzvy_planovane USING btree (vyhlasena_vyzva_id);


--
-- Name: index_itms.zmluvy_verejne_obstaravania_dalsie_url_zvo; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zmluvy_verejne_obstaravania_dalsie_url_zvo" ON itms.zmluvy_verejne_obstaravania_dalsie_url USING btree (zmluva_verejne_obstaravanie_id);


--
-- Name: index_itms.zmluvy_verejne_obstaravania_dodavatelia_ddo; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zmluvy_verejne_obstaravania_dodavatelia_ddo" ON itms.zmluvy_verejne_obstaravania_dodavatelia USING btree (dodavatel_dodavatel_obstaravatel_id);


--
-- Name: index_itms.zmluvy_verejne_obstaravania_dodavatelia_ds; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zmluvy_verejne_obstaravania_dodavatelia_ds" ON itms.zmluvy_verejne_obstaravania_dodavatelia USING btree (dodavatel_subjekt_id);


--
-- Name: index_itms.zmluvy_verejne_obstaravania_dodavatelia_zvo; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zmluvy_verejne_obstaravania_dodavatelia_zvo" ON itms.zmluvy_verejne_obstaravania_dodavatelia USING btree (zmluva_verejne_obstaravanie_id);


--
-- Name: index_itms.zmluvy_verejne_obstaravania_hddo; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zmluvy_verejne_obstaravania_hddo" ON itms.zmluvy_verejne_obstaravania USING btree (hlavny_dodavatel_dodavatel_obstaravatel_id);


--
-- Name: index_itms.zmluvy_verejne_obstaravania_hds; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zmluvy_verejne_obstaravania_hds" ON itms.zmluvy_verejne_obstaravania USING btree (hlavny_dodavatel_subjekt_id);


--
-- Name: index_itms.zmluvy_verejne_obstaravania_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zmluvy_verejne_obstaravania_on_itms_id" ON itms.zmluvy_verejne_obstaravania USING btree (itms_id);


--
-- Name: index_itms.zmluvy_verejne_obstaravania_vo; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zmluvy_verejne_obstaravania_vo" ON itms.zmluvy_verejne_obstaravania USING btree (verejne_obstaravanie_id);


--
-- Name: index_itms.zonfp_aktivity_projekt_on_subjekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_aktivity_projekt_on_subjekt_id" ON itms.zonfp_spracovane_aktivity_projekt USING btree (subjekt_id);


--
-- Name: index_itms.zonfp_aktivity_projekt_on_typ_aktivity_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_aktivity_projekt_on_typ_aktivity_id" ON itms.zonfp_spracovane_aktivity_projekt USING btree (typ_aktivity_id);


--
-- Name: index_itms.zonfp_aktivity_projekt_on_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_aktivity_projekt_on_zonfp_id" ON itms.zonfp_spracovane_aktivity_projekt USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_formy_financovania_on_forma_financovania_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_formy_financovania_on_forma_financovania_id" ON itms.zonfp_spracovane_formy_financovania USING btree (forma_financovania_id);


--
-- Name: index_itms.zonfp_formy_financovania_on_z_and_ff; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_formy_financovania_on_z_and_ff" ON itms.zonfp_spracovane_formy_financovania USING btree (zonfp_id, forma_financovania_id);


--
-- Name: index_itms.zonfp_formy_financovania_on_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_formy_financovania_on_zonfp_id" ON itms.zonfp_spracovane_formy_financovania USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_hodnotitelia_on_hodnotitel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_hodnotitelia_on_hodnotitel_id" ON itms.zonfp_spracovane_hodnotitelia USING btree (hodnotitel_id);


--
-- Name: index_itms.zonfp_hodnotitelia_on_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_hodnotitelia_on_zonfp_id" ON itms.zonfp_spracovane_hodnotitelia USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_hodnotitelia_on_zonfp_id_and_hodnotitel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_hodnotitelia_on_zonfp_id_and_hodnotitel_id" ON itms.zonfp_spracovane_hodnotitelia USING btree (zonfp_id, hodnotitel_id);


--
-- Name: index_itms.zonfp_hospodarske_cinnosti_on_hospodarska_cinnost_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_hospodarske_cinnosti_on_hospodarska_cinnost_id" ON itms.zonfp_spracovane_hospodarske_cinnosti USING btree (hospodarska_cinnost_id);


--
-- Name: index_itms.zonfp_hospodarske_cinnosti_on_z_and_hc; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_hospodarske_cinnosti_on_z_and_hc" ON itms.zonfp_spracovane_hospodarske_cinnosti USING btree (zonfp_id, hospodarska_cinnost_id);


--
-- Name: index_itms.zonfp_hospodarske_cinnosti_on_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_hospodarske_cinnosti_on_zonfp_id" ON itms.zonfp_spracovane_hospodarske_cinnosti USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_meratelne_ukazovatele_on_ukazovatel; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_meratelne_ukazovatele_on_ukazovatel" ON itms.zonfp_spracovane_meratelne_ukazovatele USING btree (projektovy_ukazovatel_id);


--
-- Name: index_itms.zonfp_meratelne_ukazovatele_on_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_meratelne_ukazovatele_on_zonfp_id" ON itms.zonfp_spracovane_meratelne_ukazovatele USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_meratelne_ukazovatele_on_zonfp_ukazovatel; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_meratelne_ukazovatele_on_zonfp_ukazovatel" ON itms.zonfp_spracovane_meratelne_ukazovatele USING btree (zonfp_id, projektovy_ukazovatel_id);


--
-- Name: index_itms.zonfp_miesta_realizacie_mimo_uzemia_op_on_mr; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_miesta_realizacie_mimo_uzemia_op_on_mr" ON itms.zonfp_spracovane_miesta_realizacie_mimo_uzemia_op USING btree (miesto_realizacie_id);


--
-- Name: index_itms.zonfp_miesta_realizacie_mimo_uzemia_op_on_z_and_mr; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_miesta_realizacie_mimo_uzemia_op_on_z_and_mr" ON itms.zonfp_spracovane_miesta_realizacie_mimo_uzemia_op USING btree (zonfp_id, miesto_realizacie_id);


--
-- Name: index_itms.zonfp_miesta_realizacie_mimo_uzemia_op_on_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_miesta_realizacie_mimo_uzemia_op_on_zonfp_id" ON itms.zonfp_spracovane_miesta_realizacie_mimo_uzemia_op USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_miesta_realizacie_on_miesto_realizacie_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_miesta_realizacie_on_miesto_realizacie_id" ON itms.zonfp_spracovane_miesta_realizacie USING btree (miesto_realizacie_id);


--
-- Name: index_itms.zonfp_miesta_realizacie_on_z_and_mr; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_miesta_realizacie_on_z_and_mr" ON itms.zonfp_spracovane_miesta_realizacie USING btree (zonfp_id, miesto_realizacie_id);


--
-- Name: index_itms.zonfp_miesta_realizacie_on_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_miesta_realizacie_on_zonfp_id" ON itms.zonfp_spracovane_miesta_realizacie USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_oblasti_intervencie_on_oblast_intervencie_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_oblasti_intervencie_on_oblast_intervencie_id" ON itms.zonfp_spracovane_oblasti_intervencie USING btree (oblast_intervencie_id);


--
-- Name: index_itms.zonfp_oblasti_intervencie_on_z_and_oi; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_oblasti_intervencie_on_z_and_oi" ON itms.zonfp_spracovane_oblasti_intervencie USING btree (zonfp_id, oblast_intervencie_id);


--
-- Name: index_itms.zonfp_oblasti_intervencie_on_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_oblasti_intervencie_on_zonfp_id" ON itms.zonfp_spracovane_oblasti_intervencie USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_on_itms_id" ON itms.zonfp_spracovane USING btree (itms_id);


--
-- Name: index_itms.zonfp_on_vysledok_konania_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_on_vysledok_konania_id" ON itms.zonfp_spracovane USING btree (vysledok_konania_id);


--
-- Name: index_itms.zonfp_on_vyzva_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_on_vyzva_id" ON itms.zonfp_spracovane USING btree (vyzva_id);


--
-- Name: index_itms.zonfp_on_ziadatel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_on_ziadatel_id" ON itms.zonfp_spracovane USING btree (ziadatel_id);


--
-- Name: index_itms.zonfp_organizacne_zlozky_on_organizacna_zlozka_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_organizacne_zlozky_on_organizacna_zlozka_id" ON itms.zonfp_spracovane_organizacne_zlozky USING btree (organizacna_zlozka_id);


--
-- Name: index_itms.zonfp_organizacne_zlozky_on_z_and_oz; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_organizacne_zlozky_on_z_and_oz" ON itms.zonfp_spracovane_organizacne_zlozky USING btree (zonfp_id, organizacna_zlozka_id);


--
-- Name: index_itms.zonfp_organizacne_zlozky_on_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_organizacne_zlozky_on_zonfp_id" ON itms.zonfp_spracovane_organizacne_zlozky USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_partneri_on_partner_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_partneri_on_partner_id" ON itms.zonfp_spracovane_partneri USING btree (partner_id);


--
-- Name: index_itms.zonfp_partneri_on_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_partneri_on_zonfp_id" ON itms.zonfp_spracovane_partneri USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_partneri_on_zonfp_id_and_partner_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_partneri_on_zonfp_id_and_partner_id" ON itms.zonfp_spracovane_partneri USING btree (zonfp_id, partner_id);


--
-- Name: index_itms.zonfp_polozky_rozpoctu_on_skupina_vydavkov_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_polozky_rozpoctu_on_skupina_vydavkov_id" ON itms.zonfp_spracovane_polozky_rozpoctu USING btree (skupina_vydavkov_id);


--
-- Name: index_itms.zonfp_polozky_rozpoctu_on_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_polozky_rozpoctu_on_zonfp_id" ON itms.zonfp_spracovane_polozky_rozpoctu USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_prijate_aktivity_projekt_on_subjekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_aktivity_projekt_on_subjekt_id" ON itms.zonfp_prijate_aktivity_projekt USING btree (subjekt_id);


--
-- Name: index_itms.zonfp_prijate_aktivity_projekt_on_typ_aktivity_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_aktivity_projekt_on_typ_aktivity_id" ON itms.zonfp_prijate_aktivity_projekt USING btree (typ_aktivity_id);


--
-- Name: index_itms.zonfp_prijate_aktivity_projekt_on_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_aktivity_projekt_on_zonfp_id" ON itms.zonfp_prijate_aktivity_projekt USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_prijate_formy_financovania_on_ff; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_formy_financovania_on_ff" ON itms.zonfp_prijate_formy_financovania USING btree (forma_financovania_id);


--
-- Name: index_itms.zonfp_prijate_formy_financovania_on_z_and_ff; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_prijate_formy_financovania_on_z_and_ff" ON itms.zonfp_prijate_formy_financovania USING btree (zonfp_id, forma_financovania_id);


--
-- Name: index_itms.zonfp_prijate_formy_financovania_on_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_formy_financovania_on_zonfp_id" ON itms.zonfp_prijate_formy_financovania USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_prijate_hospodarske_cinnosti_on_hc; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_hospodarske_cinnosti_on_hc" ON itms.zonfp_prijate_hospodarske_cinnosti USING btree (hospodarska_cinnost_id);


--
-- Name: index_itms.zonfp_prijate_hospodarske_cinnosti_on_z_and_hc; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_prijate_hospodarske_cinnosti_on_z_and_hc" ON itms.zonfp_prijate_hospodarske_cinnosti USING btree (zonfp_id, hospodarska_cinnost_id);


--
-- Name: index_itms.zonfp_prijate_hospodarske_cinnosti_on_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_hospodarske_cinnosti_on_zonfp_id" ON itms.zonfp_prijate_hospodarske_cinnosti USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_prijate_meratelne_ukazovatele_on_ukazovatel; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_meratelne_ukazovatele_on_ukazovatel" ON itms.zonfp_prijate_meratelne_ukazovatele USING btree (projektovy_ukazovatel_id);


--
-- Name: index_itms.zonfp_prijate_meratelne_ukazovatele_on_z_and_mu; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_prijate_meratelne_ukazovatele_on_z_and_mu" ON itms.zonfp_prijate_meratelne_ukazovatele USING btree (zonfp_id, projektovy_ukazovatel_id);


--
-- Name: index_itms.zonfp_prijate_meratelne_ukazovatele_on_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_meratelne_ukazovatele_on_zonfp_id" ON itms.zonfp_prijate_meratelne_ukazovatele USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_prijate_miesta_realizacie_mimo_op_on_z_and_mr; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_prijate_miesta_realizacie_mimo_op_on_z_and_mr" ON itms.zonfp_prijate_miesta_realizacie_mimo_uzemia_op USING btree (zonfp_id, miesto_realizacie_id);


--
-- Name: index_itms.zonfp_prijate_miesta_realizacie_mimo_uzemia_op_on_mr; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_miesta_realizacie_mimo_uzemia_op_on_mr" ON itms.zonfp_prijate_miesta_realizacie_mimo_uzemia_op USING btree (miesto_realizacie_id);


--
-- Name: index_itms.zonfp_prijate_miesta_realizacie_mimo_uzemia_op_on_z; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_miesta_realizacie_mimo_uzemia_op_on_z" ON itms.zonfp_prijate_miesta_realizacie_mimo_uzemia_op USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_prijate_miesta_realizacie_on_mr; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_miesta_realizacie_on_mr" ON itms.zonfp_prijate_miesta_realizacie USING btree (miesto_realizacie_id);


--
-- Name: index_itms.zonfp_prijate_miesta_realizacie_on_z_and_mr; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_prijate_miesta_realizacie_on_z_and_mr" ON itms.zonfp_prijate_miesta_realizacie USING btree (zonfp_id, miesto_realizacie_id);


--
-- Name: index_itms.zonfp_prijate_miesta_realizacie_on_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_miesta_realizacie_on_zonfp_id" ON itms.zonfp_prijate_miesta_realizacie USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_prijate_oblasti_intervencie_on_oi; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_oblasti_intervencie_on_oi" ON itms.zonfp_prijate_oblasti_intervencie USING btree (oblast_intervencie_id);


--
-- Name: index_itms.zonfp_prijate_oblasti_intervencie_on_z_and_oi; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_prijate_oblasti_intervencie_on_z_and_oi" ON itms.zonfp_prijate_oblasti_intervencie USING btree (zonfp_id, oblast_intervencie_id);


--
-- Name: index_itms.zonfp_prijate_oblasti_intervencie_on_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_oblasti_intervencie_on_zonfp_id" ON itms.zonfp_prijate_oblasti_intervencie USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_prijate_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_prijate_on_itms_id" ON itms.zonfp_prijate USING btree (itms_id);


--
-- Name: index_itms.zonfp_prijate_on_vyzva_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_on_vyzva_id" ON itms.zonfp_prijate USING btree (vyzva_id);


--
-- Name: index_itms.zonfp_prijate_on_ziadatel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_on_ziadatel_id" ON itms.zonfp_prijate USING btree (ziadatel_id);


--
-- Name: index_itms.zonfp_prijate_organizacne_zlozky_on_oz; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_organizacne_zlozky_on_oz" ON itms.zonfp_prijate_organizacne_zlozky USING btree (organizacna_zlozka_id);


--
-- Name: index_itms.zonfp_prijate_organizacne_zlozky_on_z_and_oz; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_prijate_organizacne_zlozky_on_z_and_oz" ON itms.zonfp_prijate_organizacne_zlozky USING btree (zonfp_id, organizacna_zlozka_id);


--
-- Name: index_itms.zonfp_prijate_organizacne_zlozky_on_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_organizacne_zlozky_on_zonfp_id" ON itms.zonfp_prijate_organizacne_zlozky USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_prijate_partneri_on_partner_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_partneri_on_partner_id" ON itms.zonfp_prijate_partneri USING btree (partner_id);


--
-- Name: index_itms.zonfp_prijate_partneri_on_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_partneri_on_zonfp_id" ON itms.zonfp_prijate_partneri USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_prijate_partneri_on_zonfp_id_and_partner_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_prijate_partneri_on_zonfp_id_and_partner_id" ON itms.zonfp_prijate_partneri USING btree (zonfp_id, partner_id);


--
-- Name: index_itms.zonfp_prijate_polozky_rozpoctu_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_polozky_rozpoctu_on_itms_id" ON itms.zonfp_prijate_polozky_rozpoctu USING btree (itms_id);


--
-- Name: index_itms.zonfp_prijate_polozky_rozpoctu_on_sv; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_polozky_rozpoctu_on_sv" ON itms.zonfp_prijate_polozky_rozpoctu USING btree (skupina_vydavkov_id);


--
-- Name: index_itms.zonfp_prijate_polozky_rozpoctu_on_z_and_pr; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_prijate_polozky_rozpoctu_on_z_and_pr" ON itms.zonfp_prijate_polozky_rozpoctu USING btree (zonfp_id, itms_id);


--
-- Name: index_itms.zonfp_prijate_polozky_rozpoctu_on_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_polozky_rozpoctu_on_zonfp_id" ON itms.zonfp_prijate_polozky_rozpoctu USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_prijate_sekundarne_tematicke_okruhy_on_sto; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_sekundarne_tematicke_okruhy_on_sto" ON itms.zonfp_prijate_sekundarne_tematicke_okruhy USING btree (sekundarny_tematicky_okruh_id);


--
-- Name: index_itms.zonfp_prijate_sekundarne_tematicke_okruhy_on_zp; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_sekundarne_tematicke_okruhy_on_zp" ON itms.zonfp_prijate_sekundarne_tematicke_okruhy USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_prijate_sto_on_z_and_sto; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_prijate_sto_on_z_and_sto" ON itms.zonfp_prijate_sekundarne_tematicke_okruhy USING btree (zonfp_id, sekundarny_tematicky_okruh_id);


--
-- Name: index_itms.zonfp_prijate_typy_uzemia_on_typ_uzemia_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_typy_uzemia_on_typ_uzemia_id" ON itms.zonfp_prijate_typy_uzemia USING btree (typ_uzemia_id);


--
-- Name: index_itms.zonfp_prijate_typy_uzemia_on_z_and_tu; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_prijate_typy_uzemia_on_z_and_tu" ON itms.zonfp_prijate_typy_uzemia USING btree (zonfp_id, typ_uzemia_id);


--
-- Name: index_itms.zonfp_prijate_typy_uzemia_on_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_typy_uzemia_on_zonfp_id" ON itms.zonfp_prijate_typy_uzemia USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_prijate_uzemne_mechanizmy_on_um; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_uzemne_mechanizmy_on_um" ON itms.zonfp_prijate_uzemne_mechanizmy USING btree (uzemny_mechanizmus_id);


--
-- Name: index_itms.zonfp_prijate_uzemne_mechanizmy_on_z_and_um; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_prijate_uzemne_mechanizmy_on_z_and_um" ON itms.zonfp_prijate_uzemne_mechanizmy USING btree (zonfp_id, uzemny_mechanizmus_id);


--
-- Name: index_itms.zonfp_prijate_uzemne_mechanizmy_on_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_prijate_uzemne_mechanizmy_on_zonfp_id" ON itms.zonfp_prijate_uzemne_mechanizmy USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_sekundarne_tematicke_okruhy_on_sto; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_sekundarne_tematicke_okruhy_on_sto" ON itms.zonfp_spracovane_sekundarne_tematicke_okruhy USING btree (sekundarny_tematicky_okruh_id);


--
-- Name: index_itms.zonfp_sekundarne_tematicke_okruhy_on_z_and_sto; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_sekundarne_tematicke_okruhy_on_z_and_sto" ON itms.zonfp_spracovane_sekundarne_tematicke_okruhy USING btree (zonfp_id, sekundarny_tematicky_okruh_id);


--
-- Name: index_itms.zonfp_sekundarne_tematicke_okruhy_on_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_sekundarne_tematicke_okruhy_on_zonfp_id" ON itms.zonfp_spracovane_sekundarne_tematicke_okruhy USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_spracovane_polozky_rozpoctu_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_spracovane_polozky_rozpoctu_on_itms_id" ON itms.zonfp_spracovane_polozky_rozpoctu USING btree (itms_id);


--
-- Name: index_itms.zonfp_spracovane_polozky_rozpoctu_on_z_and_pr; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_spracovane_polozky_rozpoctu_on_z_and_pr" ON itms.zonfp_spracovane_polozky_rozpoctu USING btree (zonfp_id, itms_id);


--
-- Name: index_itms.zonfp_typy_uzemia_on_typ_uzemia_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_typy_uzemia_on_typ_uzemia_id" ON itms.zonfp_spracovane_typy_uzemia USING btree (typ_uzemia_id);


--
-- Name: index_itms.zonfp_typy_uzemia_on_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_typy_uzemia_on_zonfp_id" ON itms.zonfp_spracovane_typy_uzemia USING btree (zonfp_id);


--
-- Name: index_itms.zonfp_typy_uzemia_on_zonfp_id_and_typ_uzemia_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_typy_uzemia_on_zonfp_id_and_typ_uzemia_id" ON itms.zonfp_spracovane_typy_uzemia USING btree (zonfp_id, typ_uzemia_id);


--
-- Name: index_itms.zonfp_uzemne_mechanizmy_on_uzemny_mechanizmus_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_uzemne_mechanizmy_on_uzemny_mechanizmus_id" ON itms.zonfp_spracovane_uzemne_mechanizmy USING btree (uzemny_mechanizmus_id);


--
-- Name: index_itms.zonfp_uzemne_mechanizmy_on_z_and_um; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_uzemne_mechanizmy_on_z_and_um" ON itms.zonfp_spracovane_uzemne_mechanizmy USING btree (zonfp_id, uzemny_mechanizmus_id);


--
-- Name: index_itms.zonfp_uzemne_mechanizmy_on_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zonfp_uzemne_mechanizmy_on_zonfp_id" ON itms.zonfp_spracovane_uzemne_mechanizmy USING btree (zonfp_id);


--
-- Name: index_itms.zop_on_hlavny_cehranicny_partner_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zop_on_hlavny_cehranicny_partner_id" ON itms.zop USING btree (hlavny_cehranicny_partner_id);


--
-- Name: index_itms.zop_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zop_on_itms_id" ON itms.zop USING btree (itms_id);


--
-- Name: index_itms.zop_on_predfinancovanie_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zop_on_predfinancovanie_id" ON itms.zop USING btree (predfinancovanie_id);


--
-- Name: index_itms.zop_on_predkladana_za_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zop_on_predkladana_za_id" ON itms.zop USING btree (predkladana_za_id);


--
-- Name: index_itms.zop_on_prijimatel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zop_on_prijimatel_id" ON itms.zop USING btree (prijimatel_id);


--
-- Name: index_itms.zop_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zop_on_projekt_id" ON itms.zop USING btree (projekt_id);


--
-- Name: index_itms.zop_predkladane_za_subjekty_on_subjekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zop_predkladane_za_subjekty_on_subjekt_id" ON itms.zop_predkladane_za_subjekty USING btree (subjekt_id);


--
-- Name: index_itms.zop_predkladane_za_subjekty_on_zop_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zop_predkladane_za_subjekty_on_zop_id" ON itms.zop_predkladane_za_subjekty USING btree (zop_id);


--
-- Name: index_metais.dokumenty_on_attachable_type_and_attachable_id; Type: INDEX; Schema: metais; Owner: -
--

CREATE INDEX "index_metais.dokumenty_on_attachable_type_and_attachable_id" ON metais.dokumenty USING btree (attachable_type, attachable_id);


--
-- Name: index_metais.isvs_on_projekt_id; Type: INDEX; Schema: metais; Owner: -
--

CREATE INDEX "index_metais.isvs_on_projekt_id" ON metais.isvs USING btree (projekt_id);


--
-- Name: index_ov.bulletin_issues_on_updated_at_and_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE UNIQUE INDEX "index_ov.bulletin_issues_on_updated_at_and_id" ON ov.bulletin_issues USING btree (updated_at, id);


--
-- Name: index_ov.bulletin_issues_on_year_and_number; Type: INDEX; Schema: ov; Owner: -
--

CREATE UNIQUE INDEX "index_ov.bulletin_issues_on_year_and_number" ON ov.bulletin_issues USING btree (year, number);


--
-- Name: index_ov.konkurz_restrukturalizacia_issues_on_bulletin_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE INDEX "index_ov.konkurz_restrukturalizacia_issues_on_bulletin_issue_id" ON ov.konkurz_restrukturalizacia_issues USING btree (bulletin_issue_id);


--
-- Name: index_ov.konkurz_restrukturalizacia_issues_on_raw_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE UNIQUE INDEX "index_ov.konkurz_restrukturalizacia_issues_on_raw_issue_id" ON ov.konkurz_restrukturalizacia_issues USING btree (raw_issue_id);


--
-- Name: index_ov.konkurz_restrukturalizacia_issues_on_updated_at_and_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE UNIQUE INDEX "index_ov.konkurz_restrukturalizacia_issues_on_updated_at_and_id" ON ov.konkurz_restrukturalizacia_issues USING btree (updated_at, id);


--
-- Name: index_ov.konkurz_restrukturalizacia_proposings_on_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE INDEX "index_ov.konkurz_restrukturalizacia_proposings_on_issue_id" ON ov.konkurz_restrukturalizacia_proposings USING btree (issue_id);


--
-- Name: index_ov.konkurz_vyrovnanie_issues_on_bulletin_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE INDEX "index_ov.konkurz_vyrovnanie_issues_on_bulletin_issue_id" ON ov.konkurz_vyrovnanie_issues USING btree (bulletin_issue_id);


--
-- Name: index_ov.konkurz_vyrovnanie_issues_on_raw_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE UNIQUE INDEX "index_ov.konkurz_vyrovnanie_issues_on_raw_issue_id" ON ov.konkurz_vyrovnanie_issues USING btree (raw_issue_id);


--
-- Name: index_ov.konkurz_vyrovnanie_issues_on_updated_at_and_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE UNIQUE INDEX "index_ov.konkurz_vyrovnanie_issues_on_updated_at_and_id" ON ov.konkurz_vyrovnanie_issues USING btree (updated_at, id);


--
-- Name: index_ov.likvidator_issues_on_bulletin_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE INDEX "index_ov.likvidator_issues_on_bulletin_issue_id" ON ov.likvidator_issues USING btree (bulletin_issue_id);


--
-- Name: index_ov.likvidator_issues_on_raw_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE UNIQUE INDEX "index_ov.likvidator_issues_on_raw_issue_id" ON ov.likvidator_issues USING btree (raw_issue_id);


--
-- Name: index_ov.likvidator_issues_on_updated_at_and_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE UNIQUE INDEX "index_ov.likvidator_issues_on_updated_at_and_id" ON ov.likvidator_issues USING btree (updated_at, id);


--
-- Name: index_ov.or_podanie_issue_documents_on_or_podanie_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE INDEX "index_ov.or_podanie_issue_documents_on_or_podanie_issue_id" ON ov.or_podanie_issue_documents USING btree (or_podanie_issue_id);


--
-- Name: index_ov.or_podanie_issues_on_bulletin_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE INDEX "index_ov.or_podanie_issues_on_bulletin_issue_id" ON ov.or_podanie_issues USING btree (bulletin_issue_id);


--
-- Name: index_ov.or_podanie_issues_on_raw_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE INDEX "index_ov.or_podanie_issues_on_raw_issue_id" ON ov.or_podanie_issues USING btree (raw_issue_id);


--
-- Name: index_ov.or_podanie_issues_on_updated_at_and_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE UNIQUE INDEX "index_ov.or_podanie_issues_on_updated_at_and_id" ON ov.or_podanie_issues USING btree (updated_at, id);


--
-- Name: index_ov.raw_issues_on_bulletin_issue_id_and_file_name; Type: INDEX; Schema: ov; Owner: -
--

CREATE INDEX "index_ov.raw_issues_on_bulletin_issue_id_and_file_name" ON ov.raw_issues USING btree (bulletin_issue_id, file_name);


--
-- Name: index_ov.raw_issues_on_updated_at_and_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE UNIQUE INDEX "index_ov.raw_issues_on_updated_at_and_id" ON ov.raw_issues USING btree (updated_at, id);


--
-- Name: index_ov.znizenie_imania_ceos_on_znizenie_imania_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE INDEX "index_ov.znizenie_imania_ceos_on_znizenie_imania_issue_id" ON ov.znizenie_imania_ceos USING btree (znizenie_imania_issue_id);


--
-- Name: index_ov.znizenie_imania_issues_on_bulletin_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE INDEX "index_ov.znizenie_imania_issues_on_bulletin_issue_id" ON ov.znizenie_imania_issues USING btree (bulletin_issue_id);


--
-- Name: index_ov.znizenie_imania_issues_on_raw_issue_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE UNIQUE INDEX "index_ov.znizenie_imania_issues_on_raw_issue_id" ON ov.znizenie_imania_issues USING btree (raw_issue_id);


--
-- Name: index_ov.znizenie_imania_issues_on_updated_at_and_id; Type: INDEX; Schema: ov; Owner: -
--

CREATE UNIQUE INDEX "index_ov.znizenie_imania_issues_on_updated_at_and_id" ON ov.znizenie_imania_issues USING btree (updated_at, id);


--
-- Name: index_versions_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_versions_on_item_type_and_item_id ON public.versions USING btree (item_type, item_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON public.schema_migrations USING btree (version);


--
-- Name: index_rpo.organization_address_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_address_entries_on_organization_id" ON rpo.organization_address_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_alternames_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_alternames_on_organization_id" ON rpo.organization_alternate_name_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_authorization_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_authorization_entries_on_organization_id" ON rpo.organization_authorization_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_deposit_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_deposit_entries_on_organization_id" ON rpo.organization_deposit_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_economic_activity_entries_on_org_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_economic_activity_entries_on_org_id" ON rpo.organization_economic_activity_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_equity_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_equity_entries_on_organization_id" ON rpo.organization_equity_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_identifier_entries_on_ipo_and_org_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_identifier_entries_on_ipo_and_org_id" ON rpo.organization_identifier_entries USING btree (ipo, organization_id);


--
-- Name: index_rpo.organization_identifier_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_identifier_entries_on_organization_id" ON rpo.organization_identifier_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_legal_form_entries_on_legal_form_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_legal_form_entries_on_legal_form_id" ON rpo.organization_legal_form_entries USING btree (legal_form_id);


--
-- Name: index_rpo.organization_legal_form_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_legal_form_entries_on_organization_id" ON rpo.organization_legal_form_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_legal_status_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_legal_status_entries_on_organization_id" ON rpo.organization_legal_status_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_name_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_name_entries_on_organization_id" ON rpo.organization_name_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_olfe_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_olfe_on_organization_id" ON rpo.organization_other_legal_fact_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_predecessor_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_predecessor_entries_on_organization_id" ON rpo.organization_predecessor_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_registration_numbers_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_registration_numbers_on_organization_id" ON rpo.organization_registration_number_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_registration_offices_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_registration_offices_on_organization_id" ON rpo.organization_registration_office_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_share_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_share_entries_on_organization_id" ON rpo.organization_share_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_share_entries_on_share_form_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_share_entries_on_share_form_id" ON rpo.organization_share_entries USING btree (share_form_id);


--
-- Name: index_rpo.organization_share_entries_on_share_type_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_share_entries_on_share_type_id" ON rpo.organization_share_entries USING btree (share_type_id);


--
-- Name: index_rpo.organization_stakeholder_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_stakeholder_entries_on_organization_id" ON rpo.organization_stakeholder_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_statutory_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_statutory_entries_on_organization_id" ON rpo.organization_statutory_entries USING btree (organization_id);


--
-- Name: index_rpo.organization_successor_entries_on_organization_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.organization_successor_entries_on_organization_id" ON rpo.organization_successor_entries USING btree (organization_id);


--
-- Name: index_rpo.organizations_on_updated_at_and_id; Type: INDEX; Schema: rpo; Owner: -
--

CREATE UNIQUE INDEX "index_rpo.organizations_on_updated_at_and_id" ON rpo.organizations USING btree (updated_at, id);


--
-- Name: index_rpo.share_forms_on_name; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.share_forms_on_name" ON rpo.share_forms USING btree (name);


--
-- Name: index_rpo.share_types_on_name; Type: INDEX; Schema: rpo; Owner: -
--

CREATE INDEX "index_rpo.share_types_on_name" ON rpo.share_types USING btree (name);


--
-- Name: index_rpo_to_datahub.o_to_cbs_on_corporate_body_id; Type: INDEX; Schema: rpo_to_datahub; Owner: -
--

CREATE INDEX "index_rpo_to_datahub.o_to_cbs_on_corporate_body_id" ON rpo_to_datahub.organization_to_corporate_bodies USING btree (corporate_body_id);


--
-- Name: index_rpo_to_datahub.o_to_cbs_on_organization_id; Type: INDEX; Schema: rpo_to_datahub; Owner: -
--

CREATE UNIQUE INDEX "index_rpo_to_datahub.o_to_cbs_on_organization_id" ON rpo_to_datahub.organization_to_corporate_bodies USING btree (organization_id);


--
-- Name: index_ruz.accounting_entities_on_ico; Type: INDEX; Schema: ruz; Owner: -
--

CREATE INDEX "index_ruz.accounting_entities_on_ico" ON ruz.accounting_entities USING btree (cin);


--
-- Name: index_ruz.accounting_entities_on_updated_at_and_id; Type: INDEX; Schema: ruz; Owner: -
--

CREATE UNIQUE INDEX "index_ruz.accounting_entities_on_updated_at_and_id" ON ruz.accounting_entities USING btree (updated_at, id);


--
-- Name: index_ruz.districts_on_code; Type: INDEX; Schema: ruz; Owner: -
--

CREATE UNIQUE INDEX "index_ruz.districts_on_code" ON ruz.districts USING btree (code);


--
-- Name: index_ruz.legal_forms_on_code; Type: INDEX; Schema: ruz; Owner: -
--

CREATE UNIQUE INDEX "index_ruz.legal_forms_on_code" ON ruz.legal_forms USING btree (code);


--
-- Name: index_ruz.municipalities_on_code; Type: INDEX; Schema: ruz; Owner: -
--

CREATE UNIQUE INDEX "index_ruz.municipalities_on_code" ON ruz.municipalities USING btree (code);


--
-- Name: index_ruz.organization_sizes_on_code; Type: INDEX; Schema: ruz; Owner: -
--

CREATE UNIQUE INDEX "index_ruz.organization_sizes_on_code" ON ruz.organization_sizes USING btree (code);


--
-- Name: index_ruz.ownership_types_on_code; Type: INDEX; Schema: ruz; Owner: -
--

CREATE UNIQUE INDEX "index_ruz.ownership_types_on_code" ON ruz.ownership_types USING btree (code);


--
-- Name: index_ruz.regions_on_code; Type: INDEX; Schema: ruz; Owner: -
--

CREATE UNIQUE INDEX "index_ruz.regions_on_code" ON ruz.regions USING btree (code);


--
-- Name: index_ruz.sk_nace_categories_on_code; Type: INDEX; Schema: ruz; Owner: -
--

CREATE UNIQUE INDEX "index_ruz.sk_nace_categories_on_code" ON ruz.sk_nace_categories USING btree (code);


--
-- Name: index_ruz_accounting_entities_on_district_id; Type: INDEX; Schema: ruz; Owner: -
--

CREATE INDEX index_ruz_accounting_entities_on_district_id ON ruz.accounting_entities USING btree (district_id);


--
-- Name: index_ruz_accounting_entities_on_legal_form_id; Type: INDEX; Schema: ruz; Owner: -
--

CREATE INDEX index_ruz_accounting_entities_on_legal_form_id ON ruz.accounting_entities USING btree (legal_form_id);


--
-- Name: index_ruz_accounting_entities_on_municipality_id; Type: INDEX; Schema: ruz; Owner: -
--

CREATE INDEX index_ruz_accounting_entities_on_municipality_id ON ruz.accounting_entities USING btree (municipality_id);


--
-- Name: index_ruz_accounting_entities_on_organization_size_id; Type: INDEX; Schema: ruz; Owner: -
--

CREATE INDEX index_ruz_accounting_entities_on_organization_size_id ON ruz.accounting_entities USING btree (organization_size_id);


--
-- Name: index_ruz_accounting_entities_on_ownership_type_id; Type: INDEX; Schema: ruz; Owner: -
--

CREATE INDEX index_ruz_accounting_entities_on_ownership_type_id ON ruz.accounting_entities USING btree (ownership_type_id);


--
-- Name: index_ruz_accounting_entities_on_region_id; Type: INDEX; Schema: ruz; Owner: -
--

CREATE INDEX index_ruz_accounting_entities_on_region_id ON ruz.accounting_entities USING btree (region_id);


--
-- Name: index_ruz_accounting_entities_on_sk_nace_category_id; Type: INDEX; Schema: ruz; Owner: -
--

CREATE INDEX index_ruz_accounting_entities_on_sk_nace_category_id ON ruz.accounting_entities USING btree (sk_nace_category_id);


--
-- Name: index_ruz_districts_on_region_id; Type: INDEX; Schema: ruz; Owner: -
--

CREATE INDEX index_ruz_districts_on_region_id ON ruz.districts USING btree (region_id);


--
-- Name: index_ruz_municipalities_on_parent_id; Type: INDEX; Schema: ruz; Owner: -
--

CREATE INDEX index_ruz_municipalities_on_parent_id ON ruz.municipalities USING btree (district_id);


--
-- Name: index_ruz_to_datahub.ae_to_cbs_on_accounting_entity_id; Type: INDEX; Schema: ruz_to_datahub; Owner: -
--

CREATE UNIQUE INDEX "index_ruz_to_datahub.ae_to_cbs_on_accounting_entity_id" ON ruz_to_datahub.accounting_entity_to_corporate_bodies USING btree (accounting_entity_id);


--
-- Name: index_ruz_to_datahub.ae_to_cbs_on_corporate_body_id; Type: INDEX; Schema: ruz_to_datahub; Owner: -
--

CREATE INDEX "index_ruz_to_datahub.ae_to_cbs_on_corporate_body_id" ON ruz_to_datahub.accounting_entity_to_corporate_bodies USING btree (corporate_body_id);


--
-- Name: index_upvs.public_authority_edesks_on_cin; Type: INDEX; Schema: upvs; Owner: -
--

CREATE INDEX "index_upvs.public_authority_edesks_on_cin" ON upvs.public_authority_edesks USING btree (cin);


--
-- Name: index_upvs.public_authority_edesks_on_uri; Type: INDEX; Schema: upvs; Owner: -
--

CREATE UNIQUE INDEX "index_upvs.public_authority_edesks_on_uri" ON upvs.public_authority_edesks USING btree (uri);


--
-- Name: index_upvs.services_with_forms_on_instance_id; Type: INDEX; Schema: upvs; Owner: -
--

CREATE UNIQUE INDEX "index_upvs.services_with_forms_on_instance_id" ON upvs.services_with_forms USING btree (instance_id);


--
-- Name: index_upvs.services_with_forms_on_institution_uri; Type: INDEX; Schema: upvs; Owner: -
--

CREATE INDEX "index_upvs.services_with_forms_on_institution_uri" ON upvs.services_with_forms USING btree (institution_uri);


--
-- Name: index_upvs.services_with_forms_on_schema_url; Type: INDEX; Schema: upvs; Owner: -
--

CREATE INDEX "index_upvs.services_with_forms_on_schema_url" ON upvs.services_with_forms USING btree (schema_url);


--
-- Name: index_vvo.agreement_suppliers_on_agreement_id; Type: INDEX; Schema: vvo; Owner: -
--

CREATE INDEX "index_vvo.agreement_suppliers_on_agreement_id" ON vvo.contractors USING btree (contract_award_id);


--
-- Name: index_vvo.agreements_on_result_notice_id; Type: INDEX; Schema: vvo; Owner: -
--

CREATE INDEX "index_vvo.agreements_on_result_notice_id" ON vvo.contract_awards USING btree (result_notice_id);


--
-- Name: index_vvo.announcement_types_on_code; Type: INDEX; Schema: vvo; Owner: -
--

CREATE UNIQUE INDEX "index_vvo.announcement_types_on_code" ON vvo.notice_types USING btree (code);


--
-- Name: index_vvo.notice_suppliers_on_notice_id; Type: INDEX; Schema: vvo; Owner: -
--

CREATE INDEX "index_vvo.notice_suppliers_on_notice_id" ON vvo.notice_suppliers USING btree (notice_id);


--
-- Name: index_vvo.notices_on_contract_id; Type: INDEX; Schema: vvo; Owner: -
--

CREATE INDEX "index_vvo.notices_on_contract_id" ON vvo.notices USING btree (contract_id);


--
-- Name: index_vvo.notices_on_contracting_authority_id; Type: INDEX; Schema: vvo; Owner: -
--

CREATE INDEX "index_vvo.notices_on_contracting_authority_id" ON vvo.notices USING btree (contracting_authority_id);


--
-- Name: index_vvo.notices_on_procedure_type_id; Type: INDEX; Schema: vvo; Owner: -
--

CREATE INDEX "index_vvo.notices_on_procedure_type_id" ON vvo.notices USING btree (procedure_type_id);


--
-- Name: index_vvo.raw_notices_on_bulletin_id; Type: INDEX; Schema: vvo; Owner: -
--

CREATE INDEX "index_vvo.raw_notices_on_bulletin_id" ON vvo.raw_notices USING btree (bulletin_issue_id);


--
-- Name: index_vvo.raw_notices_on_bulletin_id_and_number; Type: INDEX; Schema: vvo; Owner: -
--

CREATE UNIQUE INDEX "index_vvo.raw_notices_on_bulletin_id_and_number" ON vvo.raw_notices USING btree (bulletin_issue_id, number);


--
-- Name: index_vvo.raw_notices_on_contract_id; Type: INDEX; Schema: vvo; Owner: -
--

CREATE INDEX "index_vvo.raw_notices_on_contract_id" ON vvo.raw_notices USING btree (contract_id);


--
-- Name: index_vvo.raw_notices_on_contracting_authority_id; Type: INDEX; Schema: vvo; Owner: -
--

CREATE INDEX "index_vvo.raw_notices_on_contracting_authority_id" ON vvo.raw_notices USING btree (contracting_authority_id);


--
-- Name: index_vvo.result_notice_cpvs_on_result_notice_id; Type: INDEX; Schema: vvo; Owner: -
--

CREATE INDEX "index_vvo.result_notice_cpvs_on_result_notice_id" ON vvo.result_notice_main_cpvs USING btree (result_notice_id);


--
-- Name: index_vvo.result_notice_item_cpvs_on_result_notice_item_id; Type: INDEX; Schema: vvo; Owner: -
--

CREATE INDEX "index_vvo.result_notice_item_cpvs_on_result_notice_item_id" ON vvo.result_notice_lot_main_cpvs USING btree (result_notice_lot_id);


--
-- Name: index_vvo.result_notice_items_on_result_notice_id; Type: INDEX; Schema: vvo; Owner: -
--

CREATE INDEX "index_vvo.result_notice_items_on_result_notice_id" ON vvo.result_notice_lots USING btree (result_notice_id);


--
-- Name: index_vvo.result_notices_on_bulletin_issue_id; Type: INDEX; Schema: vvo; Owner: -
--

CREATE INDEX "index_vvo.result_notices_on_bulletin_issue_id" ON vvo.result_notices USING btree (bulletin_issue_id);


--
-- Name: index_vvo.result_notices_on_contract_id; Type: INDEX; Schema: vvo; Owner: -
--

CREATE INDEX "index_vvo.result_notices_on_contract_id" ON vvo.result_notices USING btree (contract_id);


--
-- Name: index_vvo.result_notices_on_notice_type_id; Type: INDEX; Schema: vvo; Owner: -
--

CREATE INDEX "index_vvo.result_notices_on_notice_type_id" ON vvo.result_notices USING btree (notice_type_id);


--
-- Name: index_vvo.result_notices_on_raw_notice_id; Type: INDEX; Schema: vvo; Owner: -
--

CREATE UNIQUE INDEX "index_vvo.result_notices_on_raw_notice_id" ON vvo.result_notices USING btree (raw_notice_id);


--
-- Name: contracts fk_rails_43c7c1b4e3; Type: FK CONSTRAINT; Schema: crz; Owner: -
--

ALTER TABLE ONLY crz.contracts
    ADD CONSTRAINT fk_rails_43c7c1b4e3 FOREIGN KEY (department_id) REFERENCES crz.departments(id);


--
-- Name: attachments fk_rails_741b6026e6; Type: FK CONSTRAINT; Schema: crz; Owner: -
--

ALTER TABLE ONLY crz.attachments
    ADD CONSTRAINT fk_rails_741b6026e6 FOREIGN KEY (contract_id) REFERENCES crz.contracts(id) ON DELETE CASCADE;


--
-- Name: corporate_bodies fk_rails_2d425ea40a; Type: FK CONSTRAINT; Schema: datahub; Owner: -
--

ALTER TABLE ONLY datahub.corporate_bodies
    ADD CONSTRAINT fk_rails_2d425ea40a FOREIGN KEY (main_corporate_body_id) REFERENCES datahub.corporate_bodies(id);


--
-- Name: vat_subject_to_corporate_bodies fk_rails_1166f6e411; Type: FK CONSTRAINT; Schema: fs_to_datahub; Owner: -
--

ALTER TABLE ONLY fs_to_datahub.vat_subject_to_corporate_bodies
    ADD CONSTRAINT fk_rails_1166f6e411 FOREIGN KEY (corporate_body_id) REFERENCES datahub.corporate_bodies(id) ON DELETE CASCADE;


--
-- Name: income_tax_subject_to_corporate_bodies fk_rails_1aae96ae27; Type: FK CONSTRAINT; Schema: fs_to_datahub; Owner: -
--

ALTER TABLE ONLY fs_to_datahub.income_tax_subject_to_corporate_bodies
    ADD CONSTRAINT fk_rails_1aae96ae27 FOREIGN KEY (corporate_body_id) REFERENCES datahub.corporate_bodies(id) ON DELETE CASCADE;


--
-- Name: vat_subject_to_corporate_bodies fk_rails_5fb118847f; Type: FK CONSTRAINT; Schema: fs_to_datahub; Owner: -
--

ALTER TABLE ONLY fs_to_datahub.vat_subject_to_corporate_bodies
    ADD CONSTRAINT fk_rails_5fb118847f FOREIGN KEY (vat_subject_id) REFERENCES fs.vat_subjects(id) ON DELETE CASCADE;


--
-- Name: tax_liability_to_corporate_bodies fk_rails_604b6f8323; Type: FK CONSTRAINT; Schema: fs_to_datahub; Owner: -
--

ALTER TABLE ONLY fs_to_datahub.tax_liability_to_corporate_bodies
    ADD CONSTRAINT fk_rails_604b6f8323 FOREIGN KEY (corporate_body_id) REFERENCES datahub.corporate_bodies(id) ON DELETE CASCADE;


--
-- Name: income_tax_subject_to_corporate_bodies fk_rails_94a182cfab; Type: FK CONSTRAINT; Schema: fs_to_datahub; Owner: -
--

ALTER TABLE ONLY fs_to_datahub.income_tax_subject_to_corporate_bodies
    ADD CONSTRAINT fk_rails_94a182cfab FOREIGN KEY (income_tax_subject_id) REFERENCES fs.income_tax_subjects(id) ON DELETE CASCADE;


--
-- Name: tax_liability_to_corporate_bodies fk_rails_f114d77c2c; Type: FK CONSTRAINT; Schema: fs_to_datahub; Owner: -
--

ALTER TABLE ONLY fs_to_datahub.tax_liability_to_corporate_bodies
    ADD CONSTRAINT fk_rails_f114d77c2c FOREIGN KEY (tax_liability_id) REFERENCES fs.tax_liabilities(id) ON DELETE CASCADE;


--
-- Name: zonfp_spracovane_uzemne_mechanizmy fk_rails_00bd9064dc; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_uzemne_mechanizmy
    ADD CONSTRAINT fk_rails_00bd9064dc FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_spracovane(id);


--
-- Name: zonfp_spracovane_typy_uzemia fk_rails_00be24adb6; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_typy_uzemia
    ADD CONSTRAINT fk_rails_00be24adb6 FOREIGN KEY (typ_uzemia_id) REFERENCES itms.konkretne_ciele_hodnoty_ciselnikov(id);


--
-- Name: zonfp_spracovane_partneri fk_rails_00c0160bcd; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_partneri
    ADD CONSTRAINT fk_rails_00c0160bcd FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_spracovane(id);


--
-- Name: konkretne_ciele fk_rails_0115d1b95f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.konkretne_ciele
    ADD CONSTRAINT fk_rails_0115d1b95f FOREIGN KEY (kategoria_regionov_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: deklarovane_vydavky fk_rails_01546df3bb; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.deklarovane_vydavky
    ADD CONSTRAINT fk_rails_01546df3bb FOREIGN KEY (zmluva_verejne_obstaravanie_id) REFERENCES itms.zmluvy_verejne_obstaravania(id);


--
-- Name: zonfp_prijate_organizacne_zlozky fk_rails_025ecae0ca; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_organizacne_zlozky
    ADD CONSTRAINT fk_rails_025ecae0ca FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_prijate(id);


--
-- Name: uctovne_doklady_projekty fk_rails_028b9af1eb; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.uctovne_doklady_projekty
    ADD CONSTRAINT fk_rails_028b9af1eb FOREIGN KEY (uctovny_doklad_id) REFERENCES itms.uctovne_doklady(id);


--
-- Name: nezrovnalosti_suvisiace_nezrovnalosti fk_rails_03702170c9; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_suvisiace_nezrovnalosti
    ADD CONSTRAINT fk_rails_03702170c9 FOREIGN KEY (nezrovnalost_id) REFERENCES itms.nezrovnalosti(id);


--
-- Name: zmluvy_verejne_obstaravania fk_rails_039600fef2; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zmluvy_verejne_obstaravania
    ADD CONSTRAINT fk_rails_039600fef2 FOREIGN KEY (hlavny_dodavatel_dodavatel_obstaravatel_id) REFERENCES itms.dodavatelia(id);


--
-- Name: zmluvy_verejne_obstaravania_dodavatelia fk_rails_03ced0a1cb; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zmluvy_verejne_obstaravania_dodavatelia
    ADD CONSTRAINT fk_rails_03ced0a1cb FOREIGN KEY (dodavatel_dodavatel_obstaravatel_id) REFERENCES itms.dodavatelia(id);


--
-- Name: projekty_miesta_realizacie_mimo_uzemia_op fk_rails_0496cc57e6; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_miesta_realizacie_mimo_uzemia_op
    ADD CONSTRAINT fk_rails_0496cc57e6 FOREIGN KEY (miesto_realizacie_id) REFERENCES itms.miesta_realizacie(id);


--
-- Name: zonfp_spracovane_aktivity_projekt fk_rails_05b9e9ab0a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_aktivity_projekt
    ADD CONSTRAINT fk_rails_05b9e9ab0a FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_spracovane(id);


--
-- Name: zonfp_prijate fk_rails_05e66344e7; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate
    ADD CONSTRAINT fk_rails_05e66344e7 FOREIGN KEY (vyzva_id) REFERENCES itms.vyzvy_vyhlasene(id);


--
-- Name: zonfp_spracovane_hospodarske_cinnosti fk_rails_079dc61bb0; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_hospodarske_cinnosti
    ADD CONSTRAINT fk_rails_079dc61bb0 FOREIGN KEY (hospodarska_cinnost_id) REFERENCES itms.konkretne_ciele_hodnoty_ciselnikov(id);


--
-- Name: zonfp_spracovane_miesta_realizacie_mimo_uzemia_op fk_rails_096daa70ed; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_miesta_realizacie_mimo_uzemia_op
    ADD CONSTRAINT fk_rails_096daa70ed FOREIGN KEY (miesto_realizacie_id) REFERENCES itms.miesta_realizacie(id);


--
-- Name: projektove_ukazovatele_fondy fk_rails_09e399f617; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projektove_ukazovatele_fondy
    ADD CONSTRAINT fk_rails_09e399f617 FOREIGN KEY (projektovy_ukazovatel_id) REFERENCES itms.projektove_ukazovatele(id);


--
-- Name: projekty_sekundarne_tematicke_okruhy fk_rails_0d0a4a8a13; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_sekundarne_tematicke_okruhy
    ADD CONSTRAINT fk_rails_0d0a4a8a13 FOREIGN KEY (sekundarny_tematicky_okruh_id) REFERENCES itms.konkretne_ciele_hodnoty_ciselnikov(id);


--
-- Name: zonfp_prijate_miesta_realizacie_mimo_uzemia_op fk_rails_0d6201496e; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_miesta_realizacie_mimo_uzemia_op
    ADD CONSTRAINT fk_rails_0d6201496e FOREIGN KEY (miesto_realizacie_id) REFERENCES itms.miesta_realizacie(id);


--
-- Name: zonfp_prijate_miesta_realizacie fk_rails_0e0ce5ec3c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_miesta_realizacie
    ADD CONSTRAINT fk_rails_0e0ce5ec3c FOREIGN KEY (miesto_realizacie_id) REFERENCES itms.miesta_realizacie(id);


--
-- Name: zonfp_prijate_polozky_rozpoctu fk_rails_0ebf095739; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_polozky_rozpoctu
    ADD CONSTRAINT fk_rails_0ebf095739 FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_prijate(id);


--
-- Name: nezrovnalosti_suvisiace_pohladavkove_doklady fk_rails_0ec85641c2; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_suvisiace_pohladavkove_doklady
    ADD CONSTRAINT fk_rails_0ec85641c2 FOREIGN KEY (pohladavkovy_doklad_id) REFERENCES itms.pohladavkove_doklady(id);


--
-- Name: zonfp_spracovane_organizacne_zlozky fk_rails_0f2aac883b; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_organizacne_zlozky
    ADD CONSTRAINT fk_rails_0f2aac883b FOREIGN KEY (organizacna_zlozka_id) REFERENCES itms.organizacne_zlozky(id);


--
-- Name: zonfp_spracovane_formy_financovania fk_rails_0f3db1df5e; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_formy_financovania
    ADD CONSTRAINT fk_rails_0f3db1df5e FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_spracovane(id);


--
-- Name: zop_predkladane_za_subjekty fk_rails_12b29bdafe; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zop_predkladane_za_subjekty
    ADD CONSTRAINT fk_rails_12b29bdafe FOREIGN KEY (zop_id) REFERENCES itms.zop(id);


--
-- Name: nezrovnalosti_typy_nezrovnalosti fk_rails_136836cd96; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_typy_nezrovnalosti
    ADD CONSTRAINT fk_rails_136836cd96 FOREIGN KEY (nezrovnalost_id) REFERENCES itms.nezrovnalosti(id);


--
-- Name: pohladavkove_doklady fk_rails_140cb2bca8; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.pohladavkove_doklady
    ADD CONSTRAINT fk_rails_140cb2bca8 FOREIGN KEY (dovod_vratenia_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: zonfp_prijate_hospodarske_cinnosti fk_rails_16e0085ca6; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_hospodarske_cinnosti
    ADD CONSTRAINT fk_rails_16e0085ca6 FOREIGN KEY (hospodarska_cinnost_id) REFERENCES itms.konkretne_ciele_hodnoty_ciselnikov(id);


--
-- Name: vyzvy_vyhlasene fk_rails_1792cc9243; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene
    ADD CONSTRAINT fk_rails_1792cc9243 FOREIGN KEY (vyhlasovatel_id) REFERENCES itms.subjekty(id);


--
-- Name: dodavatelia fk_rails_17b4b919d8; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.dodavatelia
    ADD CONSTRAINT fk_rails_17b4b919d8 FOREIGN KEY (typ_ineho_identifikacneho_cisla_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost fk_rails_17faad18e6; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost
    ADD CONSTRAINT fk_rails_17faad18e6 FOREIGN KEY (subjekt_id) REFERENCES itms.subjekty(id);


--
-- Name: verejne_obstaravania fk_rails_18381644cd; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania
    ADD CONSTRAINT fk_rails_18381644cd FOREIGN KEY (druh_zakazky_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: vyzvy_vyhlasene_poskytovatelia fk_rails_19863b7ff4; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_poskytovatelia
    ADD CONSTRAINT fk_rails_19863b7ff4 FOREIGN KEY (poskytovatel_id) REFERENCES itms.subjekty(id);


--
-- Name: intenzity_zdroje fk_rails_1aede24bdd; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.intenzity_zdroje
    ADD CONSTRAINT fk_rails_1aede24bdd FOREIGN KEY (zdroj_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: verejne_obstaravania fk_rails_1c274e13bb; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania
    ADD CONSTRAINT fk_rails_1c274e13bb FOREIGN KEY (hlavny_predmet_hlavny_slovnik_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: zonfp_spracovane fk_rails_1c418e1dd9; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane
    ADD CONSTRAINT fk_rails_1c418e1dd9 FOREIGN KEY (vysledok_konania_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: projekty_uzemne_mechanizmy fk_rails_1d298f9f96; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_uzemne_mechanizmy
    ADD CONSTRAINT fk_rails_1d298f9f96 FOREIGN KEY (uzemny_mechanizmus_id) REFERENCES itms.konkretne_ciele_hodnoty_ciselnikov(id);


--
-- Name: zonfp_prijate_organizacne_zlozky fk_rails_1e3ce0d845; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_organizacne_zlozky
    ADD CONSTRAINT fk_rails_1e3ce0d845 FOREIGN KEY (organizacna_zlozka_id) REFERENCES itms.organizacne_zlozky(id);


--
-- Name: vyzvy_vyhlasene_poskytovatelia fk_rails_2137cdd4b6; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_poskytovatelia
    ADD CONSTRAINT fk_rails_2137cdd4b6 FOREIGN KEY (vyzva_id) REFERENCES itms.vyzvy_vyhlasene(id);


--
-- Name: verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik fk_rails_225a5db0b4; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik
    ADD CONSTRAINT fk_rails_225a5db0b4 FOREIGN KEY (predmet_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: zonfp_prijate_polozky_rozpoctu fk_rails_226e994fc8; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_polozky_rozpoctu
    ADD CONSTRAINT fk_rails_226e994fc8 FOREIGN KEY (skupina_vydavkov_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: projekty_miesta_realizacie_mimo_uzemia_op fk_rails_2425cf6aca; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_miesta_realizacie_mimo_uzemia_op
    ADD CONSTRAINT fk_rails_2425cf6aca FOREIGN KEY (projekt_id) REFERENCES itms.projekty(id);


--
-- Name: verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik fk_rails_24965b7679; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik
    ADD CONSTRAINT fk_rails_24965b7679 FOREIGN KEY (verejne_obstaravanie_id) REFERENCES itms.verejne_obstaravania(id);


--
-- Name: zonfp_prijate_partneri fk_rails_24f57afa2f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_partneri
    ADD CONSTRAINT fk_rails_24f57afa2f FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_prijate(id);


--
-- Name: nezrovnalosti_typy_nezrovnalosti fk_rails_257a019f0e; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_typy_nezrovnalosti
    ADD CONSTRAINT fk_rails_257a019f0e FOREIGN KEY (kod_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie fk_rails_25c3a95ab7; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie
    ADD CONSTRAINT fk_rails_25c3a95ab7 FOREIGN KEY (nezrovnalost_id) REFERENCES itms.nezrovnalosti(id);


--
-- Name: verejne_obstaravania_projekty fk_rails_25e3a0891d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania_projekty
    ADD CONSTRAINT fk_rails_25e3a0891d FOREIGN KEY (projekt_id) REFERENCES itms.projekty(id);


--
-- Name: projekty fk_rails_262be0aab1; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty
    ADD CONSTRAINT fk_rails_262be0aab1 FOREIGN KEY (prijimatel_id) REFERENCES itms.subjekty(id);


--
-- Name: zop_predkladane_za_subjekty fk_rails_2c548e6f82; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zop_predkladane_za_subjekty
    ADD CONSTRAINT fk_rails_2c548e6f82 FOREIGN KEY (subjekt_id) REFERENCES itms.subjekty(id);


--
-- Name: konkretne_ciele_typy_aktivit fk_rails_2ce092e5a7; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.konkretne_ciele_typy_aktivit
    ADD CONSTRAINT fk_rails_2ce092e5a7 FOREIGN KEY (typ_aktivity_id) REFERENCES itms.typy_aktivit(id);


--
-- Name: zonfp_prijate_uzemne_mechanizmy fk_rails_2db6d6e8da; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_uzemne_mechanizmy
    ADD CONSTRAINT fk_rails_2db6d6e8da FOREIGN KEY (uzemny_mechanizmus_id) REFERENCES itms.konkretne_ciele_hodnoty_ciselnikov(id);


--
-- Name: konkretne_ciele_typy_aktivit fk_rails_2f20a81991; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.konkretne_ciele_typy_aktivit
    ADD CONSTRAINT fk_rails_2f20a81991 FOREIGN KEY (konkretny_ciel_id) REFERENCES itms.konkretne_ciele(id);


--
-- Name: vyzvy_planovane fk_rails_2f656b722b; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_planovane
    ADD CONSTRAINT fk_rails_2f656b722b FOREIGN KEY (vyhlasovatel_id) REFERENCES itms.subjekty(id);


--
-- Name: zonfp_spracovane_miesta_realizacie fk_rails_2f9bbaa2d6; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_miesta_realizacie
    ADD CONSTRAINT fk_rails_2f9bbaa2d6 FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_spracovane(id);


--
-- Name: prioritne_osi fk_rails_2faddf5b73; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.prioritne_osi
    ADD CONSTRAINT fk_rails_2faddf5b73 FOREIGN KEY (operacny_program_id) REFERENCES itms.operacne_programy(id);


--
-- Name: zonfp_prijate_aktivity_projekt fk_rails_327f5486ef; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_aktivity_projekt
    ADD CONSTRAINT fk_rails_327f5486ef FOREIGN KEY (typ_aktivity_id) REFERENCES itms.typy_aktivit(id);


--
-- Name: intenzity fk_rails_342c83d880; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.intenzity
    ADD CONSTRAINT fk_rails_342c83d880 FOREIGN KEY (zdroj_vz_id) REFERENCES itms.intenzity_zdroje(id);


--
-- Name: miesta_realizacie fk_rails_350aad395f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.miesta_realizacie
    ADD CONSTRAINT fk_rails_350aad395f FOREIGN KEY (stat_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: projekty fk_rails_35284387ac; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty
    ADD CONSTRAINT fk_rails_35284387ac FOREIGN KEY (schvalena_zonfp_id) REFERENCES itms.zonfp_spracovane(id);


--
-- Name: zonfp_prijate_formy_financovania fk_rails_357176f08e; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_formy_financovania
    ADD CONSTRAINT fk_rails_357176f08e FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_prijate(id);


--
-- Name: zop fk_rails_382fc42473; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zop
    ADD CONSTRAINT fk_rails_382fc42473 FOREIGN KEY (hlavny_cehranicny_partner_id) REFERENCES itms.subjekty(id);


--
-- Name: uctovne_doklady_polozky_dokladu fk_rails_390d8ee387; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.uctovne_doklady_polozky_dokladu
    ADD CONSTRAINT fk_rails_390d8ee387 FOREIGN KEY (uctovny_doklad_id) REFERENCES itms.uctovne_doklady(id);


--
-- Name: nezrovnalosti fk_rails_3980438432; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti
    ADD CONSTRAINT fk_rails_3980438432 FOREIGN KEY (financny_stav_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: deklarovane_vydavky fk_rails_3a22dd6f01; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.deklarovane_vydavky
    ADD CONSTRAINT fk_rails_3a22dd6f01 FOREIGN KEY (polozka_rozpoctu_id) REFERENCES itms.polozky_rozpoctu(id);


--
-- Name: nezrovnalosti_suvisiace_zop fk_rails_3ab8350341; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_suvisiace_zop
    ADD CONSTRAINT fk_rails_3ab8350341 FOREIGN KEY (zop_id) REFERENCES itms.zop(id);


--
-- Name: pohladavkove_doklady fk_rails_3cad360dd7; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.pohladavkove_doklady
    ADD CONSTRAINT fk_rails_3cad360dd7 FOREIGN KEY (subjekt_zodpovedny_za_vymahanie_id) REFERENCES itms.subjekty(id);


--
-- Name: zonfp_prijate_partneri fk_rails_3d9d63d941; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_partneri
    ADD CONSTRAINT fk_rails_3d9d63d941 FOREIGN KEY (partner_id) REFERENCES itms.subjekty(id);


--
-- Name: zop fk_rails_3eff3ae857; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zop
    ADD CONSTRAINT fk_rails_3eff3ae857 FOREIGN KEY (predkladana_za_id) REFERENCES itms.subjekty(id);


--
-- Name: deklarovane_vydavky_sumy_neschvalene_na_preplatenie fk_rails_3fb64d1f6a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.deklarovane_vydavky_sumy_neschvalene_na_preplatenie
    ADD CONSTRAINT fk_rails_3fb64d1f6a FOREIGN KEY (deklarovany_vydavok_id) REFERENCES itms.deklarovane_vydavky(id);


--
-- Name: vyzvy_planovane_doplnujuce_info fk_rails_3ffd858a5d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_planovane_doplnujuce_info
    ADD CONSTRAINT fk_rails_3ffd858a5d FOREIGN KEY (vyzva_id) REFERENCES itms.vyzvy_planovane(id);


--
-- Name: projekty_aktivity fk_rails_41d0028c9d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_aktivity
    ADD CONSTRAINT fk_rails_41d0028c9d FOREIGN KEY (projekt_id) REFERENCES itms.projekty(id);


--
-- Name: zonfp_spracovane_hodnotitelia fk_rails_42d321084b; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_hodnotitelia
    ADD CONSTRAINT fk_rails_42d321084b FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_spracovane(id);


--
-- Name: vyzvy_vyhlasene_fondy fk_rails_43ac458ef5; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_fondy
    ADD CONSTRAINT fk_rails_43ac458ef5 FOREIGN KEY (vyzva_id) REFERENCES itms.vyzvy_vyhlasene(id);


--
-- Name: konkretne_ciele fk_rails_44f150d5d8; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.konkretne_ciele
    ADD CONSTRAINT fk_rails_44f150d5d8 FOREIGN KEY (fond_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: zonfp_spracovane_aktivity_projekt fk_rails_4648a655f2; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_aktivity_projekt
    ADD CONSTRAINT fk_rails_4648a655f2 FOREIGN KEY (typ_aktivity_id) REFERENCES itms.typy_aktivit(id);


--
-- Name: polozky_rozpoctu fk_rails_466d6c5443; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.polozky_rozpoctu
    ADD CONSTRAINT fk_rails_466d6c5443 FOREIGN KEY (skupina_vydavkov_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: aktivity fk_rails_47b7955fdd; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.aktivity
    ADD CONSTRAINT fk_rails_47b7955fdd FOREIGN KEY (subjekt_id) REFERENCES itms.subjekty(id);


--
-- Name: pohladavkove_doklady_suvisiace_zop fk_rails_47bdf1be19; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.pohladavkove_doklady_suvisiace_zop
    ADD CONSTRAINT fk_rails_47bdf1be19 FOREIGN KEY (pohladavkovy_doklad_id) REFERENCES itms.pohladavkove_doklady(id);


--
-- Name: vyzvy_planovane_konkretne_ciele fk_rails_47bea54338; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_planovane_konkretne_ciele
    ADD CONSTRAINT fk_rails_47bea54338 FOREIGN KEY (konkretny_ciel_id) REFERENCES itms.konkretne_ciele(id);


--
-- Name: vyzvy_planovane_poskytovatelia fk_rails_4b2cc174c3; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_planovane_poskytovatelia
    ADD CONSTRAINT fk_rails_4b2cc174c3 FOREIGN KEY (vyzva_id) REFERENCES itms.vyzvy_planovane(id);


--
-- Name: subjekty fk_rails_4c898ab9c7; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.subjekty
    ADD CONSTRAINT fk_rails_4c898ab9c7 FOREIGN KEY (stat_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: zonfp_spracovane_miesta_realizacie fk_rails_4d54ad5583; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_miesta_realizacie
    ADD CONSTRAINT fk_rails_4d54ad5583 FOREIGN KEY (miesto_realizacie_id) REFERENCES itms.miesta_realizacie(id);


--
-- Name: pohladavkove_doklady fk_rails_4d83be54d9; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.pohladavkove_doklady
    ADD CONSTRAINT fk_rails_4d83be54d9 FOREIGN KEY (prioritna_os_id) REFERENCES itms.prioritne_osi(id);


--
-- Name: zmluvy_verejne_obstaravania_dodavatelia fk_rails_4da1c132e1; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zmluvy_verejne_obstaravania_dodavatelia
    ADD CONSTRAINT fk_rails_4da1c132e1 FOREIGN KEY (zmluva_verejne_obstaravanie_id) REFERENCES itms.zmluvy_verejne_obstaravania(id);


--
-- Name: verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik fk_rails_4da2ae7a20; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik
    ADD CONSTRAINT fk_rails_4da2ae7a20 FOREIGN KEY (verejne_obstaravanie_id) REFERENCES itms.verejne_obstaravania(id);


--
-- Name: projekty_typy_uzemia fk_rails_4e304a144d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_typy_uzemia
    ADD CONSTRAINT fk_rails_4e304a144d FOREIGN KEY (projekt_id) REFERENCES itms.projekty(id);


--
-- Name: verejne_obstaravania fk_rails_4f0c3f949a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania
    ADD CONSTRAINT fk_rails_4f0c3f949a FOREIGN KEY (obstaravatel_dodavatel_obstaravatel_id) REFERENCES itms.dodavatelia(id);


--
-- Name: zonfp_spracovane_hodnotitelia fk_rails_4f280e9b20; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_hodnotitelia
    ADD CONSTRAINT fk_rails_4f280e9b20 FOREIGN KEY (hodnotitel_id) REFERENCES itms.osoby(id);


--
-- Name: nezrovnalosti fk_rails_4f35e719c2; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti
    ADD CONSTRAINT fk_rails_4f35e719c2 FOREIGN KEY (hlavny_typ_nezrovnalosti_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: projekty_polozky_rozpoctu fk_rails_4fc331a058; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_polozky_rozpoctu
    ADD CONSTRAINT fk_rails_4fc331a058 FOREIGN KEY (projekt_id) REFERENCES itms.projekty(id);


--
-- Name: vyzvy_vyhlasene_konkretne_ciele_typy_aktivit fk_rails_50b7fceecd; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit
    ADD CONSTRAINT fk_rails_50b7fceecd FOREIGN KEY (konkretny_ciel_id) REFERENCES itms.konkretne_ciele(id);


--
-- Name: zonfp_spracovane fk_rails_512e4c4c1c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane
    ADD CONSTRAINT fk_rails_512e4c4c1c FOREIGN KEY (ziadatel_id) REFERENCES itms.subjekty(id);


--
-- Name: nezrovnalosti_suvisiace_verejne_obstaravania fk_rails_53091b9df9; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_suvisiace_verejne_obstaravania
    ADD CONSTRAINT fk_rails_53091b9df9 FOREIGN KEY (verejne_obstaravanie_id) REFERENCES itms.verejne_obstaravania(id);


--
-- Name: verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik fk_rails_542918dbe1; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik
    ADD CONSTRAINT fk_rails_542918dbe1 FOREIGN KEY (predmet_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: projekty_meratelne_ukazovatele fk_rails_546a109c63; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_meratelne_ukazovatele
    ADD CONSTRAINT fk_rails_546a109c63 FOREIGN KEY (projekt_id) REFERENCES itms.projekty(id);


--
-- Name: vyzvy_vyhlasene_vyzvy_planovane fk_rails_548236611b; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_vyzvy_planovane
    ADD CONSTRAINT fk_rails_548236611b FOREIGN KEY (planovana_vyzva_id) REFERENCES itms.vyzvy_planovane(id);


--
-- Name: zonfp_spracovane_polozky_rozpoctu fk_rails_56c4e15d44; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_polozky_rozpoctu
    ADD CONSTRAINT fk_rails_56c4e15d44 FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_spracovane(id);


--
-- Name: projekty_hospodarske_cinnosti fk_rails_5827b58bb9; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_hospodarske_cinnosti
    ADD CONSTRAINT fk_rails_5827b58bb9 FOREIGN KEY (projekt_id) REFERENCES itms.projekty(id);


--
-- Name: zonfp_spracovane_uzemne_mechanizmy fk_rails_5a9038c4f3; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_uzemne_mechanizmy
    ADD CONSTRAINT fk_rails_5a9038c4f3 FOREIGN KEY (uzemny_mechanizmus_id) REFERENCES itms.konkretne_ciele_hodnoty_ciselnikov(id);


--
-- Name: polozky_rozpoctu fk_rails_5bea80ee4e; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.polozky_rozpoctu
    ADD CONSTRAINT fk_rails_5bea80ee4e FOREIGN KEY (aktivita_id) REFERENCES itms.aktivity(id);


--
-- Name: zonfp_spracovane_hospodarske_cinnosti fk_rails_5cac1f1c7e; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_hospodarske_cinnosti
    ADD CONSTRAINT fk_rails_5cac1f1c7e FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_spracovane(id);


--
-- Name: pohladavkove_doklady_suvisiace_verejne_obstaravania fk_rails_5f28bffb76; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.pohladavkove_doklady_suvisiace_verejne_obstaravania
    ADD CONSTRAINT fk_rails_5f28bffb76 FOREIGN KEY (pohladavkovy_doklad_id) REFERENCES itms.pohladavkove_doklady(id);


--
-- Name: nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost fk_rails_5f723e1acd; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost
    ADD CONSTRAINT fk_rails_5f723e1acd FOREIGN KEY (nezrovnalost_id) REFERENCES itms.nezrovnalosti(id);


--
-- Name: vyzvy_vyhlasene_fondy fk_rails_5f8bc02fae; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_fondy
    ADD CONSTRAINT fk_rails_5f8bc02fae FOREIGN KEY (fond_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: verejne_obstaravania fk_rails_60f63bc7e2; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania
    ADD CONSTRAINT fk_rails_60f63bc7e2 FOREIGN KEY (postup_obstaravania_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: projektove_ukazovatele_casy_plnenia fk_rails_6364309b83; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projektove_ukazovatele_casy_plnenia
    ADD CONSTRAINT fk_rails_6364309b83 FOREIGN KEY (kod_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: zonfp_spracovane_miesta_realizacie_mimo_uzemia_op fk_rails_64ec721cb6; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_miesta_realizacie_mimo_uzemia_op
    ADD CONSTRAINT fk_rails_64ec721cb6 FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_spracovane(id);


--
-- Name: deklarovane_vydavky_sumy_neziadane_na_preplatenie fk_rails_65cd02ab8f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.deklarovane_vydavky_sumy_neziadane_na_preplatenie
    ADD CONSTRAINT fk_rails_65cd02ab8f FOREIGN KEY (deklarovany_vydavok_id) REFERENCES itms.deklarovane_vydavky(id);


--
-- Name: verejne_obstaravania_projekty fk_rails_666b79ae9b; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania_projekty
    ADD CONSTRAINT fk_rails_666b79ae9b FOREIGN KEY (verejne_obstaravanie_id) REFERENCES itms.verejne_obstaravania(id);


--
-- Name: zop fk_rails_677e49b6d4; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zop
    ADD CONSTRAINT fk_rails_677e49b6d4 FOREIGN KEY (prijimatel_id) REFERENCES itms.subjekty(id);


--
-- Name: polozky_rozpoctu fk_rails_6837e22c76; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.polozky_rozpoctu
    ADD CONSTRAINT fk_rails_6837e22c76 FOREIGN KEY (subjekt_id) REFERENCES itms.subjekty(id);


--
-- Name: zonfp_spracovane_oblasti_intervencie fk_rails_68aa37fcce; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_oblasti_intervencie
    ADD CONSTRAINT fk_rails_68aa37fcce FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_spracovane(id);


--
-- Name: zonfp_prijate_miesta_realizacie fk_rails_696e7fdb11; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_miesta_realizacie
    ADD CONSTRAINT fk_rails_696e7fdb11 FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_prijate(id);


--
-- Name: operacne_programy fk_rails_69da6acee6; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.operacne_programy
    ADD CONSTRAINT fk_rails_69da6acee6 FOREIGN KEY (subjekt_id) REFERENCES itms.subjekty(id);


--
-- Name: deklarovane_vydavky fk_rails_6af1d0518f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.deklarovane_vydavky
    ADD CONSTRAINT fk_rails_6af1d0518f FOREIGN KEY (uctovny_doklad_id) REFERENCES itms.uctovne_doklady(id);


--
-- Name: vyzvy_vyhlasene_kontaktne_osoby fk_rails_6c4cefed09; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_kontaktne_osoby
    ADD CONSTRAINT fk_rails_6c4cefed09 FOREIGN KEY (osoba_id) REFERENCES itms.osoby(id);


--
-- Name: nuts_kody fk_rails_6d8977cc9f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nuts_kody
    ADD CONSTRAINT fk_rails_6d8977cc9f FOREIGN KEY (hodnota_nuts_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: nezrovnalosti_suvisiace_zop fk_rails_6e331313aa; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_suvisiace_zop
    ADD CONSTRAINT fk_rails_6e331313aa FOREIGN KEY (nezrovnalost_id) REFERENCES itms.nezrovnalosti(id);


--
-- Name: nezrovnalosti fk_rails_6e7c1b8881; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti
    ADD CONSTRAINT fk_rails_6e7c1b8881 FOREIGN KEY (prioritna_os_id) REFERENCES itms.prioritne_osi(id);


--
-- Name: zonfp_prijate_sekundarne_tematicke_okruhy fk_rails_721b7692f0; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_sekundarne_tematicke_okruhy
    ADD CONSTRAINT fk_rails_721b7692f0 FOREIGN KEY (sekundarny_tematicky_okruh_id) REFERENCES itms.konkretne_ciele_hodnoty_ciselnikov(id);


--
-- Name: zonfp_prijate_formy_financovania fk_rails_735983760d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_formy_financovania
    ADD CONSTRAINT fk_rails_735983760d FOREIGN KEY (forma_financovania_id) REFERENCES itms.konkretne_ciele_hodnoty_ciselnikov(id);


--
-- Name: projekty_hospodarske_cinnosti fk_rails_73b32244be; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_hospodarske_cinnosti
    ADD CONSTRAINT fk_rails_73b32244be FOREIGN KEY (hospodarska_cinnost_id) REFERENCES itms.konkretne_ciele_hodnoty_ciselnikov(id);


--
-- Name: zonfp_prijate_miesta_realizacie_mimo_uzemia_op fk_rails_76bbdba8d1; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_miesta_realizacie_mimo_uzemia_op
    ADD CONSTRAINT fk_rails_76bbdba8d1 FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_prijate(id);


--
-- Name: subjekty fk_rails_77623d0edc; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.subjekty
    ADD CONSTRAINT fk_rails_77623d0edc FOREIGN KEY (obec_id) REFERENCES itms.nuts_kody(id);


--
-- Name: uctovne_doklady_projekty fk_rails_782031234c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.uctovne_doklady_projekty
    ADD CONSTRAINT fk_rails_782031234c FOREIGN KEY (projekt_id) REFERENCES itms.projekty(id);


--
-- Name: konkretne_ciele_hodnoty_ciselnikov fk_rails_7a7cdcf0c3; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.konkretne_ciele_hodnoty_ciselnikov
    ADD CONSTRAINT fk_rails_7a7cdcf0c3 FOREIGN KEY (konkretny_ciel_id) REFERENCES itms.konkretne_ciele(id);


--
-- Name: projekty_formy_financovania fk_rails_7b6ee5736e; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_formy_financovania
    ADD CONSTRAINT fk_rails_7b6ee5736e FOREIGN KEY (forma_financovania_id) REFERENCES itms.konkretne_ciele_hodnoty_ciselnikov(id);


--
-- Name: projekty_intenzity fk_rails_7c26d63282; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_intenzity
    ADD CONSTRAINT fk_rails_7c26d63282 FOREIGN KEY (intenzita_id) REFERENCES itms.intenzity(id);


--
-- Name: projekty_intenzity fk_rails_7d596202b5; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_intenzity
    ADD CONSTRAINT fk_rails_7d596202b5 FOREIGN KEY (projekt_id) REFERENCES itms.projekty(id);


--
-- Name: konkretne_ciele fk_rails_7e925d13d4; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.konkretne_ciele
    ADD CONSTRAINT fk_rails_7e925d13d4 FOREIGN KEY (prioritna_os_id) REFERENCES itms.prioritne_osi(id);


--
-- Name: zonfp_spracovane_partneri fk_rails_80274e8d49; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_partneri
    ADD CONSTRAINT fk_rails_80274e8d49 FOREIGN KEY (partner_id) REFERENCES itms.subjekty(id);


--
-- Name: nezrovnalosti_subjekty_ktore_zistili_nezrovnalost fk_rails_803c402796; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_subjekty_ktore_zistili_nezrovnalost
    ADD CONSTRAINT fk_rails_803c402796 FOREIGN KEY (nezrovnalost_id) REFERENCES itms.nezrovnalosti(id);


--
-- Name: intenzity fk_rails_818c3c0e61; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.intenzity
    ADD CONSTRAINT fk_rails_818c3c0e61 FOREIGN KEY (zdroj_eu_id) REFERENCES itms.intenzity_zdroje(id);


--
-- Name: monitorovacie_terminy fk_rails_83b35e71b4; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.monitorovacie_terminy
    ADD CONSTRAINT fk_rails_83b35e71b4 FOREIGN KEY (projekt_id) REFERENCES itms.projekty(id);


--
-- Name: zonfp_prijate_oblasti_intervencie fk_rails_843603625e; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_oblasti_intervencie
    ADD CONSTRAINT fk_rails_843603625e FOREIGN KEY (oblast_intervencie_id) REFERENCES itms.konkretne_ciele_hodnoty_ciselnikov(id);


--
-- Name: pohladavkove_doklady fk_rails_85d83b30d7; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.pohladavkove_doklady
    ADD CONSTRAINT fk_rails_85d83b30d7 FOREIGN KEY (dlznik_id) REFERENCES itms.subjekty(id);


--
-- Name: projekty_partneri fk_rails_88302c96ad; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_partneri
    ADD CONSTRAINT fk_rails_88302c96ad FOREIGN KEY (partner_id) REFERENCES itms.subjekty(id);


--
-- Name: nezrovnalosti_subjekty_ktore_zistili_nezrovnalost fk_rails_8897be5588; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_subjekty_ktore_zistili_nezrovnalost
    ADD CONSTRAINT fk_rails_8897be5588 FOREIGN KEY (subjekt_id) REFERENCES itms.subjekty(id);


--
-- Name: zop fk_rails_899422ef35; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zop
    ADD CONSTRAINT fk_rails_899422ef35 FOREIGN KEY (predfinancovanie_id) REFERENCES itms.zop(id);


--
-- Name: zonfp_spracovane_meratelne_ukazovatele fk_rails_899eb09f3c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_meratelne_ukazovatele
    ADD CONSTRAINT fk_rails_899eb09f3c FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_spracovane(id);


--
-- Name: zonfp_spracovane_sekundarne_tematicke_okruhy fk_rails_89aac1cc38; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_sekundarne_tematicke_okruhy
    ADD CONSTRAINT fk_rails_89aac1cc38 FOREIGN KEY (sekundarny_tematicky_okruh_id) REFERENCES itms.konkretne_ciele_hodnoty_ciselnikov(id);


--
-- Name: verejne_obstaravania_uctovne_doklady fk_rails_89fad4de08; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania_uctovne_doklady
    ADD CONSTRAINT fk_rails_89fad4de08 FOREIGN KEY (verejne_obstaravanie_id) REFERENCES itms.verejne_obstaravania(id);


--
-- Name: projekty_organizacne_zlozky fk_rails_8aa8b44f6c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_organizacne_zlozky
    ADD CONSTRAINT fk_rails_8aa8b44f6c FOREIGN KEY (projekt_id) REFERENCES itms.projekty(id);


--
-- Name: verejne_obstaravania_operacne_programy fk_rails_8bb220c518; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania_operacne_programy
    ADD CONSTRAINT fk_rails_8bb220c518 FOREIGN KEY (operacny_program_id) REFERENCES itms.operacne_programy(id);


--
-- Name: nezrovnalosti_suvisiace_pohladavkove_doklady fk_rails_8d000a95b1; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_suvisiace_pohladavkove_doklady
    ADD CONSTRAINT fk_rails_8d000a95b1 FOREIGN KEY (nezrovnalost_id) REFERENCES itms.nezrovnalosti(id);


--
-- Name: nezrovnalosti_suvisiace_verejne_obstaravania fk_rails_8d1b1169fa; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_suvisiace_verejne_obstaravania
    ADD CONSTRAINT fk_rails_8d1b1169fa FOREIGN KEY (nezrovnalost_id) REFERENCES itms.nezrovnalosti(id);


--
-- Name: verejne_obstaravania_uctovne_doklady fk_rails_8e51e82a4a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania_uctovne_doklady
    ADD CONSTRAINT fk_rails_8e51e82a4a FOREIGN KEY (uctovny_doklad_id) REFERENCES itms.uctovne_doklady(id);


--
-- Name: polozky_rozpoctu fk_rails_8ed1a0f859; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.polozky_rozpoctu
    ADD CONSTRAINT fk_rails_8ed1a0f859 FOREIGN KEY (intenzita_id) REFERENCES itms.intenzity(id);


--
-- Name: hodnoty_ciselnikov fk_rails_8fb44e9504; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.hodnoty_ciselnikov
    ADD CONSTRAINT fk_rails_8fb44e9504 FOREIGN KEY (ciselnik_id) REFERENCES itms.ciselniky(id);


--
-- Name: vyzvy_vyhlasene_konkretne_ciele_typy_aktivit fk_rails_940d7db37d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit
    ADD CONSTRAINT fk_rails_940d7db37d FOREIGN KEY (vyzva_id) REFERENCES itms.vyzvy_vyhlasene(id);


--
-- Name: verejne_obstaravania_operacne_programy fk_rails_94aa9b848a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania_operacne_programy
    ADD CONSTRAINT fk_rails_94aa9b848a FOREIGN KEY (verejne_obstaravanie_id) REFERENCES itms.verejne_obstaravania(id);


--
-- Name: deklarovane_vydavky fk_rails_94f260648c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.deklarovane_vydavky
    ADD CONSTRAINT fk_rails_94f260648c FOREIGN KEY (zop_id) REFERENCES itms.zop(id);


--
-- Name: dodavatelia fk_rails_97435e089d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.dodavatelia
    ADD CONSTRAINT fk_rails_97435e089d FOREIGN KEY (obec_id) REFERENCES itms.nuts_kody(id);


--
-- Name: miesta_realizacie fk_rails_985f46756c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.miesta_realizacie
    ADD CONSTRAINT fk_rails_985f46756c FOREIGN KEY (nuts_5_id) REFERENCES itms.nuts_kody(id);


--
-- Name: zonfp_spracovane_sekundarne_tematicke_okruhy fk_rails_9a28904f8b; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_sekundarne_tematicke_okruhy
    ADD CONSTRAINT fk_rails_9a28904f8b FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_spracovane(id);


--
-- Name: zonfp_prijate_meratelne_ukazovatele fk_rails_9b0f2b8e98; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_meratelne_ukazovatele
    ADD CONSTRAINT fk_rails_9b0f2b8e98 FOREIGN KEY (projektovy_ukazovatel_id) REFERENCES itms.projektove_ukazovatele(id);


--
-- Name: pohladavkove_doklady fk_rails_9d8c329615; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.pohladavkove_doklady
    ADD CONSTRAINT fk_rails_9d8c329615 FOREIGN KEY (projekt_id) REFERENCES itms.projekty(id);


--
-- Name: zonfp_spracovane_oblasti_intervencie fk_rails_9dc2525b6b; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_oblasti_intervencie
    ADD CONSTRAINT fk_rails_9dc2525b6b FOREIGN KEY (oblast_intervencie_id) REFERENCES itms.konkretne_ciele_hodnoty_ciselnikov(id);


--
-- Name: vyzvy_vyhlasene_vyzvy_planovane fk_rails_9ea2c85d7e; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_vyzvy_planovane
    ADD CONSTRAINT fk_rails_9ea2c85d7e FOREIGN KEY (vyhlasena_vyzva_id) REFERENCES itms.vyzvy_vyhlasene(id);


--
-- Name: dodavatelia fk_rails_9ea404b7ef; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.dodavatelia
    ADD CONSTRAINT fk_rails_9ea404b7ef FOREIGN KEY (stat_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: projekty_miesta_realizacie fk_rails_9f12cb21f5; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_miesta_realizacie
    ADD CONSTRAINT fk_rails_9f12cb21f5 FOREIGN KEY (miesto_realizacie_id) REFERENCES itms.miesta_realizacie(id);


--
-- Name: projektove_ukazovatele_fondy fk_rails_a191cf5c1f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projektove_ukazovatele_fondy
    ADD CONSTRAINT fk_rails_a191cf5c1f FOREIGN KEY (kod_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: zonfp_prijate_aktivity_projekt fk_rails_a37f350f1b; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_aktivity_projekt
    ADD CONSTRAINT fk_rails_a37f350f1b FOREIGN KEY (subjekt_id) REFERENCES itms.subjekty(id);


--
-- Name: uctovne_doklady fk_rails_a3e6b23ab9; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.uctovne_doklady
    ADD CONSTRAINT fk_rails_a3e6b23ab9 FOREIGN KEY (dodavatel_dodavatel_obstaravatel_id) REFERENCES itms.dodavatelia(id);


--
-- Name: zonfp_prijate_meratelne_ukazovatele fk_rails_a4796df983; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_meratelne_ukazovatele
    ADD CONSTRAINT fk_rails_a4796df983 FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_prijate(id);


--
-- Name: zonfp_spracovane_formy_financovania fk_rails_a9cb13bf8d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_formy_financovania
    ADD CONSTRAINT fk_rails_a9cb13bf8d FOREIGN KEY (forma_financovania_id) REFERENCES itms.konkretne_ciele_hodnoty_ciselnikov(id);


--
-- Name: miesta_realizacie fk_rails_abf9fbf76a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.miesta_realizacie
    ADD CONSTRAINT fk_rails_abf9fbf76a FOREIGN KEY (nuts_4_id) REFERENCES itms.nuts_kody(id);


--
-- Name: pohladavkove_doklady_suvisiace_verejne_obstaravania fk_rails_aeb46e7e58; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.pohladavkove_doklady_suvisiace_verejne_obstaravania
    ADD CONSTRAINT fk_rails_aeb46e7e58 FOREIGN KEY (verejne_obstaravanie_id) REFERENCES itms.verejne_obstaravania(id);


--
-- Name: zonfp_prijate fk_rails_af699e32f9; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate
    ADD CONSTRAINT fk_rails_af699e32f9 FOREIGN KEY (ziadatel_id) REFERENCES itms.subjekty(id);


--
-- Name: zonfp_spracovane_organizacne_zlozky fk_rails_af89f96e79; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_organizacne_zlozky
    ADD CONSTRAINT fk_rails_af89f96e79 FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_spracovane(id);


--
-- Name: vyzvy_vyhlasene_doplnujuce_info fk_rails_b0d1bbc3a6; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_doplnujuce_info
    ADD CONSTRAINT fk_rails_b0d1bbc3a6 FOREIGN KEY (vyzva_id) REFERENCES itms.vyzvy_vyhlasene(id);


--
-- Name: vyzvy_planovane_poskytovatelia fk_rails_b12395dd94; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_planovane_poskytovatelia
    ADD CONSTRAINT fk_rails_b12395dd94 FOREIGN KEY (poskytovatel_id) REFERENCES itms.subjekty(id);


--
-- Name: intenzity fk_rails_b607ab30e5; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.intenzity
    ADD CONSTRAINT fk_rails_b607ab30e5 FOREIGN KEY (subjekt_id) REFERENCES itms.subjekty(id);


--
-- Name: nezrovnalosti fk_rails_b88db6d3d7; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti
    ADD CONSTRAINT fk_rails_b88db6d3d7 FOREIGN KEY (projekt_id) REFERENCES itms.projekty(id);


--
-- Name: zonfp_spracovane_typy_uzemia fk_rails_b9aa6d8591; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_typy_uzemia
    ADD CONSTRAINT fk_rails_b9aa6d8591 FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_spracovane(id);


--
-- Name: zonfp_prijate_oblasti_intervencie fk_rails_b9ca9e7cfd; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_oblasti_intervencie
    ADD CONSTRAINT fk_rails_b9ca9e7cfd FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_prijate(id);


--
-- Name: vyzvy_vyhlasene_konkretne_ciele_typy_aktivit fk_rails_ba7c143782; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit
    ADD CONSTRAINT fk_rails_ba7c143782 FOREIGN KEY (typ_aktivity_id) REFERENCES itms.typy_aktivit(id);


--
-- Name: subjekty fk_rails_bb3b9af5f0; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.subjekty
    ADD CONSTRAINT fk_rails_bb3b9af5f0 FOREIGN KEY (typ_ineho_identifikacneho_cisla_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: pohladavkove_doklady_suvisiace_zop fk_rails_bb988a1214; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.pohladavkove_doklady_suvisiace_zop
    ADD CONSTRAINT fk_rails_bb988a1214 FOREIGN KEY (zop_id) REFERENCES itms.zop(id);


--
-- Name: projekty_meratelne_ukazovatele fk_rails_bbef4e8041; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_meratelne_ukazovatele
    ADD CONSTRAINT fk_rails_bbef4e8041 FOREIGN KEY (projektovy_ukazovatel_id) REFERENCES itms.projektove_ukazovatele(id);


--
-- Name: projekty_sekundarne_tematicke_okruhy fk_rails_bc31563b61; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_sekundarne_tematicke_okruhy
    ADD CONSTRAINT fk_rails_bc31563b61 FOREIGN KEY (projekt_id) REFERENCES itms.projekty(id);


--
-- Name: nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie fk_rails_bea5988603; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie
    ADD CONSTRAINT fk_rails_bea5988603 FOREIGN KEY (subjekt_id) REFERENCES itms.subjekty(id);


--
-- Name: pohladavkove_doklady fk_rails_c0ce7701a5; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.pohladavkove_doklady
    ADD CONSTRAINT fk_rails_c0ce7701a5 FOREIGN KEY (konkretny_ciel_id) REFERENCES itms.konkretne_ciele(id);


--
-- Name: projekty_polozky_rozpoctu fk_rails_c27d7f2c80; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_polozky_rozpoctu
    ADD CONSTRAINT fk_rails_c27d7f2c80 FOREIGN KEY (polozka_rozpoctu_id) REFERENCES itms.polozky_rozpoctu(id);


--
-- Name: projekty fk_rails_c67c463462; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty
    ADD CONSTRAINT fk_rails_c67c463462 FOREIGN KEY (vyzva_id) REFERENCES itms.vyzvy_vyhlasene(id);


--
-- Name: zop fk_rails_c7d92e1dac; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zop
    ADD CONSTRAINT fk_rails_c7d92e1dac FOREIGN KEY (projekt_id) REFERENCES itms.projekty(id);


--
-- Name: uctovne_doklady fk_rails_c88d29d579; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.uctovne_doklady
    ADD CONSTRAINT fk_rails_c88d29d579 FOREIGN KEY (vlastnik_dokladu_id) REFERENCES itms.subjekty(id);


--
-- Name: zonfp_spracovane_polozky_rozpoctu fk_rails_ca35ba4dd4; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_polozky_rozpoctu
    ADD CONSTRAINT fk_rails_ca35ba4dd4 FOREIGN KEY (skupina_vydavkov_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: verejne_obstaravania fk_rails_cbc060088a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania
    ADD CONSTRAINT fk_rails_cbc060088a FOREIGN KEY (metoda_vo_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: vyzvy_vyhlasene_kontaktne_osoby fk_rails_cbe8943658; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_kontaktne_osoby
    ADD CONSTRAINT fk_rails_cbe8943658 FOREIGN KEY (vyzva_id) REFERENCES itms.vyzvy_vyhlasene(id);


--
-- Name: intenzity fk_rails_cc33bd1188; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.intenzity
    ADD CONSTRAINT fk_rails_cc33bd1188 FOREIGN KEY (zdroj_pr_id) REFERENCES itms.intenzity_zdroje(id);


--
-- Name: projekty_formy_financovania fk_rails_ccb963193d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_formy_financovania
    ADD CONSTRAINT fk_rails_ccb963193d FOREIGN KEY (projekt_id) REFERENCES itms.projekty(id);


--
-- Name: projekty_typy_uzemia fk_rails_cfa415d433; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_typy_uzemia
    ADD CONSTRAINT fk_rails_cfa415d433 FOREIGN KEY (typ_uzemia_id) REFERENCES itms.konkretne_ciele_hodnoty_ciselnikov(id);


--
-- Name: zonfp_spracovane_aktivity_projekt fk_rails_d0de622c00; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_aktivity_projekt
    ADD CONSTRAINT fk_rails_d0de622c00 FOREIGN KEY (subjekt_id) REFERENCES itms.subjekty(id);


--
-- Name: konkretne_ciele_hodnoty_ciselnikov fk_rails_d2e0814133; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.konkretne_ciele_hodnoty_ciselnikov
    ADD CONSTRAINT fk_rails_d2e0814133 FOREIGN KEY (hodnota_ciselnika_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: zmluvy_verejne_obstaravania_dalsie_url fk_rails_d40543fb1d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zmluvy_verejne_obstaravania_dalsie_url
    ADD CONSTRAINT fk_rails_d40543fb1d FOREIGN KEY (zmluva_verejne_obstaravanie_id) REFERENCES itms.zmluvy_verejne_obstaravania(id);


--
-- Name: uctovne_doklady fk_rails_d6b4b75adf; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.uctovne_doklady
    ADD CONSTRAINT fk_rails_d6b4b75adf FOREIGN KEY (dodavatel_subjekt_id) REFERENCES itms.subjekty(id);


--
-- Name: zmluvy_verejne_obstaravania_dodavatelia fk_rails_d8681305e0; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zmluvy_verejne_obstaravania_dodavatelia
    ADD CONSTRAINT fk_rails_d8681305e0 FOREIGN KEY (dodavatel_subjekt_id) REFERENCES itms.subjekty(id);


--
-- Name: aktivity fk_rails_daa70d785a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.aktivity
    ADD CONSTRAINT fk_rails_daa70d785a FOREIGN KEY (typ_aktivity_id) REFERENCES itms.typy_aktivit(id);


--
-- Name: projekty_miesta_realizacie fk_rails_dc617d6865; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_miesta_realizacie
    ADD CONSTRAINT fk_rails_dc617d6865 FOREIGN KEY (projekt_id) REFERENCES itms.projekty(id);


--
-- Name: nezrovnalosti fk_rails_dca9598718; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti
    ADD CONSTRAINT fk_rails_dca9598718 FOREIGN KEY (administrativny_stav_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: verejne_obstaravania fk_rails_dd29737b6c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania
    ADD CONSTRAINT fk_rails_dd29737b6c FOREIGN KEY (zadavatel_id) REFERENCES itms.subjekty(id);


--
-- Name: zonfp_spracovane_meratelne_ukazovatele fk_rails_df9a9ead9a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_spracovane_meratelne_ukazovatele
    ADD CONSTRAINT fk_rails_df9a9ead9a FOREIGN KEY (projektovy_ukazovatel_id) REFERENCES itms.projektove_ukazovatele(id);


--
-- Name: projekty_organizacne_zlozky fk_rails_e184bf1313; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_organizacne_zlozky
    ADD CONSTRAINT fk_rails_e184bf1313 FOREIGN KEY (organizacna_zlozka_id) REFERENCES itms.organizacne_zlozky(id);


--
-- Name: nezrovnalosti fk_rails_e281735595; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti
    ADD CONSTRAINT fk_rails_e281735595 FOREIGN KEY (dlznik_id) REFERENCES itms.subjekty(id);


--
-- Name: zmluvy_verejne_obstaravania fk_rails_e472fdc8b1; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zmluvy_verejne_obstaravania
    ADD CONSTRAINT fk_rails_e472fdc8b1 FOREIGN KEY (verejne_obstaravanie_id) REFERENCES itms.verejne_obstaravania(id);


--
-- Name: zonfp_prijate_uzemne_mechanizmy fk_rails_e51955e37c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_uzemne_mechanizmy
    ADD CONSTRAINT fk_rails_e51955e37c FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_prijate(id);


--
-- Name: verejne_obstaravania fk_rails_e6d4131836; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania
    ADD CONSTRAINT fk_rails_e6d4131836 FOREIGN KEY (obstaravatel_subjekt_id) REFERENCES itms.subjekty(id);


--
-- Name: nezrovnalosti fk_rails_e847f12883; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti
    ADD CONSTRAINT fk_rails_e847f12883 FOREIGN KEY (operacny_program_id) REFERENCES itms.operacne_programy(id);


--
-- Name: projekty_aktivity fk_rails_e8fee81bd1; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_aktivity
    ADD CONSTRAINT fk_rails_e8fee81bd1 FOREIGN KEY (aktivita_id) REFERENCES itms.aktivity(id);


--
-- Name: intenzity fk_rails_e965354053; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.intenzity
    ADD CONSTRAINT fk_rails_e965354053 FOREIGN KEY (zdroj_yei_id) REFERENCES itms.intenzity_zdroje(id);


--
-- Name: verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik fk_rails_e96ea796f7; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik
    ADD CONSTRAINT fk_rails_e96ea796f7 FOREIGN KEY (predmet_id) REFERENCES itms.hodnoty_ciselnikov(id);


--
-- Name: zonfp_prijate_hospodarske_cinnosti fk_rails_e996acb6f4; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_hospodarske_cinnosti
    ADD CONSTRAINT fk_rails_e996acb6f4 FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_prijate(id);


--
-- Name: zonfp_prijate_aktivity_projekt fk_rails_e9e93a0924; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_aktivity_projekt
    ADD CONSTRAINT fk_rails_e9e93a0924 FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_prijate(id);


--
-- Name: miesta_realizacie fk_rails_ea79d69beb; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.miesta_realizacie
    ADD CONSTRAINT fk_rails_ea79d69beb FOREIGN KEY (nuts_3_id) REFERENCES itms.nuts_kody(id);


--
-- Name: projekty_uzemne_mechanizmy fk_rails_ea9eccefc6; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_uzemne_mechanizmy
    ADD CONSTRAINT fk_rails_ea9eccefc6 FOREIGN KEY (projekt_id) REFERENCES itms.projekty(id);


--
-- Name: projekty_oblasti_intervencie fk_rails_eb8e371c76; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_oblasti_intervencie
    ADD CONSTRAINT fk_rails_eb8e371c76 FOREIGN KEY (oblast_intervencie_id) REFERENCES itms.konkretne_ciele_hodnoty_ciselnikov(id);


--
-- Name: projektove_ukazovatele_casy_plnenia fk_rails_ec6c3cb4c4; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projektove_ukazovatele_casy_plnenia
    ADD CONSTRAINT fk_rails_ec6c3cb4c4 FOREIGN KEY (projektovy_ukazovatel_id) REFERENCES itms.projektove_ukazovatele(id);


--
-- Name: deklarovane_vydavky fk_rails_efa9344803; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.deklarovane_vydavky
    ADD CONSTRAINT fk_rails_efa9344803 FOREIGN KEY (verejne_obstaravanie_id) REFERENCES itms.verejne_obstaravania(id);


--
-- Name: projekty_oblasti_intervencie fk_rails_f1873062c5; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_oblasti_intervencie
    ADD CONSTRAINT fk_rails_f1873062c5 FOREIGN KEY (projekt_id) REFERENCES itms.projekty(id);


--
-- Name: zonfp_prijate_typy_uzemia fk_rails_f44704da46; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_typy_uzemia
    ADD CONSTRAINT fk_rails_f44704da46 FOREIGN KEY (typ_uzemia_id) REFERENCES itms.konkretne_ciele_hodnoty_ciselnikov(id);


--
-- Name: vyzvy_planovane_konkretne_ciele fk_rails_f515e5059d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_planovane_konkretne_ciele
    ADD CONSTRAINT fk_rails_f515e5059d FOREIGN KEY (vyzva_id) REFERENCES itms.vyzvy_planovane(id);


--
-- Name: verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik fk_rails_f529907463; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik
    ADD CONSTRAINT fk_rails_f529907463 FOREIGN KEY (verejne_obstaravanie_id) REFERENCES itms.verejne_obstaravania(id);


--
-- Name: vyzvy_vyhlasene_posudzovane_obdobia fk_rails_f52dc2f93f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.vyzvy_vyhlasene_posudzovane_obdobia
    ADD CONSTRAINT fk_rails_f52dc2f93f FOREIGN KEY (vyzva_id) REFERENCES itms.vyzvy_vyhlasene(id);


--
-- Name: zmluvy_verejne_obstaravania fk_rails_f6565b6e80; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zmluvy_verejne_obstaravania
    ADD CONSTRAINT fk_rails_f6565b6e80 FOREIGN KEY (hlavny_dodavatel_subjekt_id) REFERENCES itms.subjekty(id);


--
-- Name: nezrovnalosti_suvisiace_nezrovnalosti fk_rails_f8a54bdaf1; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti_suvisiace_nezrovnalosti
    ADD CONSTRAINT fk_rails_f8a54bdaf1 FOREIGN KEY (suvisiaca_nezrovnalost_id) REFERENCES itms.nezrovnalosti(id);


--
-- Name: zonfp_prijate_sekundarne_tematicke_okruhy fk_rails_f8e90133c1; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_sekundarne_tematicke_okruhy
    ADD CONSTRAINT fk_rails_f8e90133c1 FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_prijate(id);


--
-- Name: projekty_partneri fk_rails_fb2a83b9a4; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.projekty_partneri
    ADD CONSTRAINT fk_rails_fb2a83b9a4 FOREIGN KEY (projekt_id) REFERENCES itms.projekty(id);


--
-- Name: zonfp_prijate_typy_uzemia fk_rails_fb56814877; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.zonfp_prijate_typy_uzemia
    ADD CONSTRAINT fk_rails_fb56814877 FOREIGN KEY (zonfp_id) REFERENCES itms.zonfp_prijate(id);


--
-- Name: nezrovnalosti fk_rails_fc1493d31c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.nezrovnalosti
    ADD CONSTRAINT fk_rails_fc1493d31c FOREIGN KEY (konkretny_ciel_id) REFERENCES itms.konkretne_ciele(id);


--
-- Name: pohladavkove_doklady fk_rails_fe55c9b1f5; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.pohladavkove_doklady
    ADD CONSTRAINT fk_rails_fe55c9b1f5 FOREIGN KEY (nezrovnalost_id) REFERENCES itms.nezrovnalosti(id);


--
-- Name: intenzity fk_rails_ffc31e6216; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY itms.intenzity
    ADD CONSTRAINT fk_rails_ffc31e6216 FOREIGN KEY (zdroj_sr_id) REFERENCES itms.intenzity_zdroje(id);


--
-- Name: isvs fk_rails_e9b23a9824; Type: FK CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.isvs
    ADD CONSTRAINT fk_rails_e9b23a9824 FOREIGN KEY (projekt_id) REFERENCES metais.projekty(id);


--
-- Name: konkurz_restrukturalizacia_issues fk_rails_01f2555605; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.konkurz_restrukturalizacia_issues
    ADD CONSTRAINT fk_rails_01f2555605 FOREIGN KEY (debtor_id) REFERENCES ov.konkurz_restrukturalizacia_actors(id) ON DELETE CASCADE;


--
-- Name: or_podanie_issue_documents fk_rails_06649ad96d; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.or_podanie_issue_documents
    ADD CONSTRAINT fk_rails_06649ad96d FOREIGN KEY (or_podanie_issue_id) REFERENCES ov.or_podanie_issues(id) ON DELETE CASCADE;


--
-- Name: znizenie_imania_issues fk_rails_10be52a24f; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.znizenie_imania_issues
    ADD CONSTRAINT fk_rails_10be52a24f FOREIGN KEY (raw_issue_id) REFERENCES ov.raw_issues(id) ON DELETE CASCADE;


--
-- Name: or_podanie_issues fk_rails_296053f2e5; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.or_podanie_issues
    ADD CONSTRAINT fk_rails_296053f2e5 FOREIGN KEY (raw_issue_id) REFERENCES ov.raw_issues(id) ON DELETE CASCADE;


--
-- Name: konkurz_restrukturalizacia_proposings fk_rails_478427253d; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.konkurz_restrukturalizacia_proposings
    ADD CONSTRAINT fk_rails_478427253d FOREIGN KEY (issue_id) REFERENCES ov.konkurz_restrukturalizacia_issues(id) ON DELETE CASCADE;


--
-- Name: likvidator_issues fk_rails_4c291d9773; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.likvidator_issues
    ADD CONSTRAINT fk_rails_4c291d9773 FOREIGN KEY (raw_issue_id) REFERENCES ov.raw_issues(id) ON DELETE CASCADE;


--
-- Name: likvidator_issues fk_rails_4ce66fa0cc; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.likvidator_issues
    ADD CONSTRAINT fk_rails_4ce66fa0cc FOREIGN KEY (bulletin_issue_id) REFERENCES ov.bulletin_issues(id) ON DELETE CASCADE;


--
-- Name: konkurz_restrukturalizacia_issues fk_rails_5bf005ec9f; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.konkurz_restrukturalizacia_issues
    ADD CONSTRAINT fk_rails_5bf005ec9f FOREIGN KEY (raw_issue_id) REFERENCES ov.raw_issues(id) ON DELETE CASCADE;


--
-- Name: konkurz_vyrovnanie_issues fk_rails_605d9df774; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.konkurz_vyrovnanie_issues
    ADD CONSTRAINT fk_rails_605d9df774 FOREIGN KEY (bulletin_issue_id) REFERENCES ov.bulletin_issues(id) ON DELETE CASCADE;


--
-- Name: or_podanie_issues fk_rails_6726036788; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.or_podanie_issues
    ADD CONSTRAINT fk_rails_6726036788 FOREIGN KEY (bulletin_issue_id) REFERENCES ov.bulletin_issues(id) ON DELETE CASCADE;


--
-- Name: znizenie_imania_issues fk_rails_7aee147bb0; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.znizenie_imania_issues
    ADD CONSTRAINT fk_rails_7aee147bb0 FOREIGN KEY (bulletin_issue_id) REFERENCES ov.bulletin_issues(id) ON DELETE CASCADE;


--
-- Name: konkurz_restrukturalizacia_proposings fk_rails_7d80f1d1cd; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.konkurz_restrukturalizacia_proposings
    ADD CONSTRAINT fk_rails_7d80f1d1cd FOREIGN KEY (actor_id) REFERENCES ov.konkurz_restrukturalizacia_actors(id) ON DELETE CASCADE;


--
-- Name: znizenie_imania_ceos fk_rails_8bb6f430bf; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.znizenie_imania_ceos
    ADD CONSTRAINT fk_rails_8bb6f430bf FOREIGN KEY (znizenie_imania_issue_id) REFERENCES ov.znizenie_imania_issues(id) ON DELETE CASCADE;


--
-- Name: konkurz_vyrovnanie_issues fk_rails_c2450a59ca; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.konkurz_vyrovnanie_issues
    ADD CONSTRAINT fk_rails_c2450a59ca FOREIGN KEY (raw_issue_id) REFERENCES ov.raw_issues(id) ON DELETE CASCADE;


--
-- Name: raw_issues fk_rails_ebe06fe061; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.raw_issues
    ADD CONSTRAINT fk_rails_ebe06fe061 FOREIGN KEY (bulletin_issue_id) REFERENCES ov.bulletin_issues(id) ON DELETE CASCADE;


--
-- Name: konkurz_restrukturalizacia_issues fk_rails_fccf2c79e3; Type: FK CONSTRAINT; Schema: ov; Owner: -
--

ALTER TABLE ONLY ov.konkurz_restrukturalizacia_issues
    ADD CONSTRAINT fk_rails_fccf2c79e3 FOREIGN KEY (bulletin_issue_id) REFERENCES ov.bulletin_issues(id) ON DELETE CASCADE;


--
-- Name: organization_registration_number_entries fk_rails_069a38e331; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_registration_number_entries
    ADD CONSTRAINT fk_rails_069a38e331 FOREIGN KEY (organization_id) REFERENCES rpo.organizations(id) ON DELETE CASCADE;


--
-- Name: organization_other_legal_fact_entries fk_rails_215d851542; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_other_legal_fact_entries
    ADD CONSTRAINT fk_rails_215d851542 FOREIGN KEY (organization_id) REFERENCES rpo.organizations(id) ON DELETE CASCADE;


--
-- Name: organizations fk_rails_23fe270425; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organizations
    ADD CONSTRAINT fk_rails_23fe270425 FOREIGN KEY (main_organization_id) REFERENCES rpo.organizations(id);


--
-- Name: organization_name_entries fk_rails_28212d8658; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_name_entries
    ADD CONSTRAINT fk_rails_28212d8658 FOREIGN KEY (organization_id) REFERENCES rpo.organizations(id) ON DELETE CASCADE;


--
-- Name: organization_economic_activity_entries fk_rails_390f731901; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_economic_activity_entries
    ADD CONSTRAINT fk_rails_390f731901 FOREIGN KEY (organization_id) REFERENCES rpo.organizations(id) ON DELETE CASCADE;


--
-- Name: organization_alternate_name_entries fk_rails_4005e2af52; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_alternate_name_entries
    ADD CONSTRAINT fk_rails_4005e2af52 FOREIGN KEY (organization_id) REFERENCES rpo.organizations(id) ON DELETE CASCADE;


--
-- Name: organization_statutory_entries fk_rails_4353ee8dca; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_statutory_entries
    ADD CONSTRAINT fk_rails_4353ee8dca FOREIGN KEY (statutory_type_id) REFERENCES rpo.statutory_types(id);


--
-- Name: organization_equity_entries fk_rails_48a2a0edd8; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_equity_entries
    ADD CONSTRAINT fk_rails_48a2a0edd8 FOREIGN KEY (organization_id) REFERENCES rpo.organizations(id) ON DELETE CASCADE;


--
-- Name: organization_share_entries fk_rails_4b0656a8ad; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_share_entries
    ADD CONSTRAINT fk_rails_4b0656a8ad FOREIGN KEY (share_type_id) REFERENCES rpo.share_types(id);


--
-- Name: organization_share_entries fk_rails_508997d9f2; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_share_entries
    ADD CONSTRAINT fk_rails_508997d9f2 FOREIGN KEY (organization_id) REFERENCES rpo.organizations(id) ON DELETE CASCADE;


--
-- Name: organization_registration_office_entries fk_rails_63e63a42b9; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_registration_office_entries
    ADD CONSTRAINT fk_rails_63e63a42b9 FOREIGN KEY (organization_id) REFERENCES rpo.organizations(id) ON DELETE CASCADE;


--
-- Name: organization_legal_status_entries fk_rails_6cef665c99; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_legal_status_entries
    ADD CONSTRAINT fk_rails_6cef665c99 FOREIGN KEY (organization_id) REFERENCES rpo.organizations(id) ON DELETE CASCADE;


--
-- Name: organization_statutory_entries fk_rails_72a67bd06f; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_statutory_entries
    ADD CONSTRAINT fk_rails_72a67bd06f FOREIGN KEY (organization_id) REFERENCES rpo.organizations(id) ON DELETE CASCADE;


--
-- Name: organizations fk_rails_7868457a85; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organizations
    ADD CONSTRAINT fk_rails_7868457a85 FOREIGN KEY (esa2010_code_id) REFERENCES rpo.esa2010_codes(id);


--
-- Name: organization_address_entries fk_rails_789033779b; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_address_entries
    ADD CONSTRAINT fk_rails_789033779b FOREIGN KEY (organization_id) REFERENCES rpo.organizations(id) ON DELETE CASCADE;


--
-- Name: organization_authorization_entries fk_rails_78ea181ad6; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_authorization_entries
    ADD CONSTRAINT fk_rails_78ea181ad6 FOREIGN KEY (organization_id) REFERENCES rpo.organizations(id) ON DELETE CASCADE;


--
-- Name: organization_deposit_entries fk_rails_8229555cd0; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_deposit_entries
    ADD CONSTRAINT fk_rails_8229555cd0 FOREIGN KEY (organization_id) REFERENCES rpo.organizations(id) ON DELETE CASCADE;


--
-- Name: organization_predecessor_entries fk_rails_9bb9d00968; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_predecessor_entries
    ADD CONSTRAINT fk_rails_9bb9d00968 FOREIGN KEY (organization_id) REFERENCES rpo.organizations(id) ON DELETE CASCADE;


--
-- Name: organization_stakeholder_entries fk_rails_b9d1486d04; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_stakeholder_entries
    ADD CONSTRAINT fk_rails_b9d1486d04 FOREIGN KEY (organization_id) REFERENCES rpo.organizations(id) ON DELETE CASCADE;


--
-- Name: organization_share_entries fk_rails_c704e079d2; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_share_entries
    ADD CONSTRAINT fk_rails_c704e079d2 FOREIGN KEY (share_form_id) REFERENCES rpo.share_forms(id);


--
-- Name: organization_legal_form_entries fk_rails_d0211d6167; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_legal_form_entries
    ADD CONSTRAINT fk_rails_d0211d6167 FOREIGN KEY (legal_form_id) REFERENCES rpo.legal_forms(id);


--
-- Name: organization_successor_entries fk_rails_d4e3e4bde0; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_successor_entries
    ADD CONSTRAINT fk_rails_d4e3e4bde0 FOREIGN KEY (organization_id) REFERENCES rpo.organizations(id) ON DELETE CASCADE;


--
-- Name: organization_identifier_entries fk_rails_d551f8828e; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_identifier_entries
    ADD CONSTRAINT fk_rails_d551f8828e FOREIGN KEY (organization_id) REFERENCES rpo.organizations(id) ON DELETE CASCADE;


--
-- Name: organizations fk_rails_d575a47b40; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organizations
    ADD CONSTRAINT fk_rails_d575a47b40 FOREIGN KEY (main_activity_code_id) REFERENCES rpo.main_activity_codes(id);


--
-- Name: organization_stakeholder_entries fk_rails_df1f7464af; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_stakeholder_entries
    ADD CONSTRAINT fk_rails_df1f7464af FOREIGN KEY (stakeholder_type_id) REFERENCES rpo.stakeholder_types(id);


--
-- Name: organization_legal_form_entries fk_rails_fbdd6d9c68; Type: FK CONSTRAINT; Schema: rpo; Owner: -
--

ALTER TABLE ONLY rpo.organization_legal_form_entries
    ADD CONSTRAINT fk_rails_fbdd6d9c68 FOREIGN KEY (organization_id) REFERENCES rpo.organizations(id) ON DELETE CASCADE;


--
-- Name: organization_to_corporate_bodies fk_rails_c3b7d4a7cd; Type: FK CONSTRAINT; Schema: rpo_to_datahub; Owner: -
--

ALTER TABLE ONLY rpo_to_datahub.organization_to_corporate_bodies
    ADD CONSTRAINT fk_rails_c3b7d4a7cd FOREIGN KEY (organization_id) REFERENCES rpo.organizations(id) ON DELETE CASCADE;


--
-- Name: organization_to_corporate_bodies fk_rails_fac45fa0c7; Type: FK CONSTRAINT; Schema: rpo_to_datahub; Owner: -
--

ALTER TABLE ONLY rpo_to_datahub.organization_to_corporate_bodies
    ADD CONSTRAINT fk_rails_fac45fa0c7 FOREIGN KEY (corporate_body_id) REFERENCES datahub.corporate_bodies(id) ON DELETE CASCADE;


--
-- Name: accounting_entities fk_rails_07ed14320c; Type: FK CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ruz.accounting_entities
    ADD CONSTRAINT fk_rails_07ed14320c FOREIGN KEY (municipality_id) REFERENCES ruz.municipalities(id);


--
-- Name: accounting_entities fk_rails_38ebf8d996; Type: FK CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ruz.accounting_entities
    ADD CONSTRAINT fk_rails_38ebf8d996 FOREIGN KEY (region_id) REFERENCES ruz.regions(id);


--
-- Name: municipalities fk_rails_392af0429a; Type: FK CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ruz.municipalities
    ADD CONSTRAINT fk_rails_392af0429a FOREIGN KEY (district_id) REFERENCES ruz.districts(id) ON DELETE CASCADE;


--
-- Name: accounting_entities fk_rails_6a4ade2d22; Type: FK CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ruz.accounting_entities
    ADD CONSTRAINT fk_rails_6a4ade2d22 FOREIGN KEY (legal_form_id) REFERENCES ruz.legal_forms(id);


--
-- Name: accounting_entities fk_rails_97883ca5ad; Type: FK CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ruz.accounting_entities
    ADD CONSTRAINT fk_rails_97883ca5ad FOREIGN KEY (organization_size_id) REFERENCES ruz.organization_sizes(id);


--
-- Name: accounting_entities fk_rails_ad69be1cc0; Type: FK CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ruz.accounting_entities
    ADD CONSTRAINT fk_rails_ad69be1cc0 FOREIGN KEY (ownership_type_id) REFERENCES ruz.ownership_types(id);


--
-- Name: districts fk_rails_b859c65541; Type: FK CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ruz.districts
    ADD CONSTRAINT fk_rails_b859c65541 FOREIGN KEY (region_id) REFERENCES ruz.regions(id) ON DELETE CASCADE;


--
-- Name: accounting_entities fk_rails_e8d3e563e0; Type: FK CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ruz.accounting_entities
    ADD CONSTRAINT fk_rails_e8d3e563e0 FOREIGN KEY (district_id) REFERENCES ruz.districts(id);


--
-- Name: accounting_entities fk_rails_f37ffa746c; Type: FK CONSTRAINT; Schema: ruz; Owner: -
--

ALTER TABLE ONLY ruz.accounting_entities
    ADD CONSTRAINT fk_rails_f37ffa746c FOREIGN KEY (sk_nace_category_id) REFERENCES ruz.sk_nace_categories(id);


--
-- Name: accounting_entity_to_corporate_bodies fk_rails_4384ad32b4; Type: FK CONSTRAINT; Schema: ruz_to_datahub; Owner: -
--

ALTER TABLE ONLY ruz_to_datahub.accounting_entity_to_corporate_bodies
    ADD CONSTRAINT fk_rails_4384ad32b4 FOREIGN KEY (corporate_body_id) REFERENCES datahub.corporate_bodies(id) ON DELETE CASCADE;


--
-- Name: accounting_entity_to_corporate_bodies fk_rails_b9792f9055; Type: FK CONSTRAINT; Schema: ruz_to_datahub; Owner: -
--

ALTER TABLE ONLY ruz_to_datahub.accounting_entity_to_corporate_bodies
    ADD CONSTRAINT fk_rails_b9792f9055 FOREIGN KEY (accounting_entity_id) REFERENCES ruz.accounting_entities(id) ON DELETE CASCADE;


--
-- Name: result_notices fk_rails_01251ddbaf; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.result_notices
    ADD CONSTRAINT fk_rails_01251ddbaf FOREIGN KEY (contracting_authority_id) REFERENCES vvo.contracting_authorities(id) ON DELETE CASCADE;


--
-- Name: contractors fk_rails_0141124b0b; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.contractors
    ADD CONSTRAINT fk_rails_0141124b0b FOREIGN KEY (contract_award_id) REFERENCES vvo.contract_awards(id) ON DELETE CASCADE;


--
-- Name: notices fk_rails_189dae0237; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.notices
    ADD CONSTRAINT fk_rails_189dae0237 FOREIGN KEY (raw_notice_id) REFERENCES vvo.raw_notices(id);


--
-- Name: raw_notices fk_rails_2965d55cab; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.raw_notices
    ADD CONSTRAINT fk_rails_2965d55cab FOREIGN KEY (notice_type_id) REFERENCES vvo.notice_types(id);


--
-- Name: result_notices fk_rails_2f54d3abd1; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.result_notices
    ADD CONSTRAINT fk_rails_2f54d3abd1 FOREIGN KEY (bulletin_issue_id) REFERENCES vvo.bulletin_issues(id) ON DELETE CASCADE;


--
-- Name: result_notice_lots fk_rails_46621bd6f9; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.result_notice_lots
    ADD CONSTRAINT fk_rails_46621bd6f9 FOREIGN KEY (result_notice_id) REFERENCES vvo.result_notices(id) ON DELETE CASCADE;


--
-- Name: contract_awards fk_rails_4ebe2a9ae2; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.contract_awards
    ADD CONSTRAINT fk_rails_4ebe2a9ae2 FOREIGN KEY (result_notice_id) REFERENCES vvo.result_notices(id) ON DELETE CASCADE;


--
-- Name: result_notice_lot_main_cpvs fk_rails_504141c77e; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.result_notice_lot_main_cpvs
    ADD CONSTRAINT fk_rails_504141c77e FOREIGN KEY (result_notice_lot_id) REFERENCES vvo.result_notice_lots(id) ON DELETE CASCADE;


--
-- Name: notice_suppliers fk_rails_56618ccf4f; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.notice_suppliers
    ADD CONSTRAINT fk_rails_56618ccf4f FOREIGN KEY (notice_id) REFERENCES vvo.notices(id) ON DELETE CASCADE;


--
-- Name: result_notices fk_rails_60e44e731a; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.result_notices
    ADD CONSTRAINT fk_rails_60e44e731a FOREIGN KEY (raw_notice_id) REFERENCES vvo.raw_notices(id) ON DELETE CASCADE;


--
-- Name: notices fk_rails_6154057566; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.notices
    ADD CONSTRAINT fk_rails_6154057566 FOREIGN KEY (notice_type_id) REFERENCES vvo.notice_types(id);


--
-- Name: result_notices fk_rails_6e839c3c34; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.result_notices
    ADD CONSTRAINT fk_rails_6e839c3c34 FOREIGN KEY (notice_type_id) REFERENCES vvo.notice_types(id) ON DELETE CASCADE;


--
-- Name: notices fk_rails_7044e59199; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.notices
    ADD CONSTRAINT fk_rails_7044e59199 FOREIGN KEY (contracting_authority_id) REFERENCES vvo.contracting_authorities(id);


--
-- Name: result_notice_main_cpvs fk_rails_761755b44a; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.result_notice_main_cpvs
    ADD CONSTRAINT fk_rails_761755b44a FOREIGN KEY (result_notice_id) REFERENCES vvo.result_notices(id) ON DELETE CASCADE;


--
-- Name: notices fk_rails_86b5e17ff4; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.notices
    ADD CONSTRAINT fk_rails_86b5e17ff4 FOREIGN KEY (bulletin_issue_id) REFERENCES vvo.bulletin_issues(id);


--
-- Name: notices fk_rails_b442791ca1; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.notices
    ADD CONSTRAINT fk_rails_b442791ca1 FOREIGN KEY (contract_id) REFERENCES vvo.contracts(id);


--
-- Name: notices fk_rails_b5b2f1b1b2; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.notices
    ADD CONSTRAINT fk_rails_b5b2f1b1b2 FOREIGN KEY (procedure_type_id) REFERENCES vvo.procedure_types(id);


--
-- Name: raw_notices fk_rails_c0eda68529; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.raw_notices
    ADD CONSTRAINT fk_rails_c0eda68529 FOREIGN KEY (bulletin_issue_id) REFERENCES vvo.bulletin_issues(id);


--
-- Name: result_notices fk_rails_cbeb7267a3; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.result_notices
    ADD CONSTRAINT fk_rails_cbeb7267a3 FOREIGN KEY (contract_id) REFERENCES vvo.contracts(id) ON DELETE CASCADE;


--
-- Name: raw_notices fk_rails_ce5c668074; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.raw_notices
    ADD CONSTRAINT fk_rails_ce5c668074 FOREIGN KEY (contract_id) REFERENCES vvo.contracts(id) ON DELETE CASCADE;


--
-- Name: raw_notices fk_rails_ff034edcd4; Type: FK CONSTRAINT; Schema: vvo; Owner: -
--

ALTER TABLE ONLY vvo.raw_notices
    ADD CONSTRAINT fk_rails_ff034edcd4 FOREIGN KEY (contracting_authority_id) REFERENCES vvo.contracting_authorities(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20160228204654'),
('20160304144454'),
('20160304151009'),
('20160304210816'),
('20160304211624'),
('20160304213306'),
('20160305001135'),
('20160305084653'),
('20160307215611'),
('20160308210325'),
('20160309115526'),
('20160309120612'),
('20160429141807'),
('20160506091443'),
('20160506115555'),
('20160506135302'),
('20160506141328'),
('20160506145648'),
('20160506201551'),
('20160506201735'),
('20160506204302'),
('20160509085025'),
('20160509091003'),
('20160509123118'),
('20160509133921'),
('20160509142808'),
('20160509144034'),
('20160509202636'),
('20160509210342'),
('20160509211550'),
('20160509213609'),
('20160510141343'),
('20160511143847'),
('20160511174234'),
('20160512140751'),
('20160512141004'),
('20160512142220'),
('20160512163333'),
('20160512205002'),
('20160512222238'),
('20160512223007'),
('20160513090321'),
('20160513093332'),
('20160513100718'),
('20160513102554'),
('20160513111743'),
('20160513115940'),
('20160513123028'),
('20160513144927'),
('20160515073133'),
('20160515073826'),
('20160515074954'),
('20160516152548'),
('20160516153747'),
('20160516194853'),
('20160517092857'),
('20160517101512'),
('20160517102123'),
('20160517103922'),
('20160517110722'),
('20160517111053'),
('20160517113734'),
('20160517115800'),
('20160517125158'),
('20160517211611'),
('20160519200530'),
('20160520141455'),
('20160520142114'),
('20160520151100'),
('20160523062919'),
('20160523111212'),
('20160523134144'),
('20160523144401'),
('20160523150519'),
('20160524145856'),
('20160524155401'),
('20160524192650'),
('20160524192805'),
('20160524192859'),
('20160524195216'),
('20160524210510'),
('20160524210952'),
('20160524213930'),
('20160524221026'),
('20160524223055'),
('20160525105622'),
('20160525122831'),
('20160525202154'),
('20160525202912'),
('20160525203905'),
('20160603134420'),
('20160603134547'),
('20160603134923'),
('20160603201156'),
('20160603201256'),
('20160603202143'),
('20160604214151'),
('20160604222116'),
('20160605101834'),
('20160605192328'),
('20160605192524'),
('20160605193318'),
('20160605211444'),
('20160605211612'),
('20160607183913'),
('20160609161856'),
('20160609175034'),
('20160609183417'),
('20160610124301'),
('20160613145120'),
('20160613161922'),
('20160614082527'),
('20160615165505'),
('20160622105806'),
('20160622112911'),
('20160622113449'),
('20160622113649'),
('20160622114653'),
('20160622115927'),
('20160622142531'),
('20160622143425'),
('20160622144845'),
('20160622202723'),
('20160622231145'),
('20160623150755'),
('20160629144830'),
('20160629151520'),
('20160629201243'),
('20160629221305'),
('20160629221424'),
('20160629221800'),
('20160706111638'),
('20160707212141'),
('20160708105151'),
('20160708121934'),
('20160708140307'),
('20160708155010'),
('20160708172910'),
('20160708173417'),
('20160711125108'),
('20160711151815'),
('20160718092226'),
('20160718092417'),
('20160718094712'),
('20160719123714'),
('20160720085630'),
('20160721091930'),
('20160721134515'),
('20160721144047'),
('20160721151057'),
('20160721153228'),
('20160721153817'),
('20160721160533'),
('20160721160901'),
('20160721162155'),
('20160722151335'),
('20160722151503'),
('20160727150803'),
('20160803124909'),
('20160803142910'),
('20160803205746'),
('20160808125148'),
('20160809092452'),
('20160809095256'),
('20160809115742'),
('20160809120030'),
('20160811100934'),
('20160811102028'),
('20160811103149'),
('20160811104830'),
('20160811111706'),
('20160811112312'),
('20160811121506'),
('20160811124755'),
('20160812133817'),
('20160812135204'),
('20160812135415'),
('20160812140655'),
('20160812142245'),
('20160812142416'),
('20160812202908'),
('20160812215714'),
('20160815130928'),
('20160818110211'),
('20160818110621'),
('20160818135739'),
('20160825110839'),
('20160825120623'),
('20160830120608'),
('20160830121920'),
('20160922171257'),
('20160922171735'),
('20160922214651'),
('20160928120044'),
('20160928123138'),
('20160928213723'),
('20160929120951'),
('20160929121253'),
('20160929121400'),
('20160929124430'),
('20160929124817'),
('20160929125059'),
('20160929125508'),
('20160929141035'),
('20160929191619'),
('20160930085831'),
('20160930095522'),
('20160930102048'),
('20160930115800'),
('20160930123332'),
('20161003193157'),
('20161004113728'),
('20161004114212'),
('20161004124538'),
('20161004193154'),
('20161006084404'),
('20161006101852'),
('20161010192304'),
('20161012181059'),
('20161013101528'),
('20161014135018'),
('20161017150133'),
('20161018104802'),
('20161018110703'),
('20161018161338'),
('20161018181120'),
('20161019092802'),
('20161019115531'),
('20161026190851'),
('20161026210022'),
('20161027124621'),
('20161107115451'),
('20161122142159'),
('20161125161820'),
('20161125162116'),
('20161127235806'),
('20161202114030'),
('20161202115521'),
('20161202124714'),
('20161206110352'),
('20161206172917'),
('20161206185650'),
('20161206185744'),
('20161213142507'),
('20161215151750'),
('20170222131821'),
('20170223074140'),
('20170302173103'),
('20170302183645'),
('20170302183858'),
('20170303121017'),
('20170303140814'),
('20170303142338'),
('20170303153316'),
('20170303160912'),
('20170303175236'),
('20170307104233'),
('20170307105434'),
('20170307105556'),
('20170307124408'),
('20170307125314'),
('20170307151036'),
('20170307172631'),
('20170307183347'),
('20170308102422'),
('20170308103852'),
('20170308130201'),
('20170308130647'),
('20170308130735'),
('20170308133417'),
('20170308155643'),
('20170308160622'),
('20170309111507'),
('20170309143958'),
('20170309144326'),
('20170310094003'),
('20170311231900'),
('20170313102633'),
('20170313103239'),
('20170315140546'),
('20170319225835'),
('20170320131008'),
('20170320131435'),
('20170329084258'),
('20170329085357'),
('20170329090438'),
('20170329094622'),
('20170329120915'),
('20170329121733'),
('20170329121857'),
('20170329122713'),
('20170329135058'),
('20170329141426'),
('20170329142521'),
('20170329144448'),
('20170329151809'),
('20170329215013'),
('20170329215303'),
('20170329220358'),
('20170329230107'),
('20170329230724'),
('20170329231043'),
('20170331114756'),
('20170331120537'),
('20170403143209'),
('20170404163431'),
('20170410145002'),
('20170424171314'),
('20170503084111'),
('20170503142604'),
('20170503160605'),
('20170503162251'),
('20170503165125'),
('20170503173221'),
('20170503194931'),
('20170503212442'),
('20170504134508'),
('20170504182810'),
('20170504192725'),
('20170612194706'),
('20170621103205'),
('20170718063739'),
('20170718083436'),
('20170822172435'),
('20171005080348'),
('20171005094049'),
('20171005104049'),
('20171005104149'),
('20171005104249'),
('20171005105044'),
('20171005110144'),
('20171005115835'),
('20171005115935'),
('20171005173414'),
('20171007133948'),
('20171008150412'),
('20171008150512'),
('20171009080951'),
('20171009115759'),
('20171012201924'),
('20171013180259'),
('20171017111719'),
('20171017171650'),
('20171017175318'),
('20171017175408'),
('20171017175418'),
('20171017175518'),
('20171017182731'),
('20171017182931'),
('20171113145824'),
('20171114124735'),
('20171114143548'),
('20171115092048'),
('20171117102940'),
('20171120133917'),
('20171206231819'),
('20171214142454'),
('20171214151327'),
('20171221180201'),
('20171221215154'),
('20171221222028'),
('20171221222608'),
('20171222121456'),
('20180413093500'),
('20180413114952'),
('20180413124957'),
('20180518121930'),
('20180518122314'),
('20180524045359'),
('20180524045911'),
('20180524080406'),
('20180524080437'),
('20180524135924'),
('20180611111652'),
('20180622082846'),
('20180623091917'),
('20180626205454'),
('20180626212748'),
('20180704152240'),
('20180706161136'),
('20180723150841'),
('20180725063145'),
('20180725063706'),
('20180725063931'),
('20180726152944'),
('20180806095308'),
('20180820080219'),
('20180911070415'),
('20180911070420'),
('20180911070434'),
('20180911070435'),
('20180911070436'),
('20180911070447'),
('20180914155404'),
('20190129173131'),
('20190131154926'),
('20190204094702'),
('20190204144349'),
('20190717121004'),
('20190717135732'),
('20190802120239'),
('20190805192655'),
('20191030214642'),
('20191107112524'),
('20191111093609'),
('20200115163549'),
('20200424134824'),
('20200424153823'),
('20200507163446'),
('20200518225601'),
('20200531222054'),
('20200601163242'),
('20200601225620'),
('20200607165129'),
('20200608094226'),
('20200622175825'),
('20200623183523'),
('20200716141809'),
('20200727102001'),
('20200731154854'),
('20200731162304'),
('20200731163851'),
('20200926145550'),
('20201010212647'),
('20210119212032'),
('20210318095354'),
('20211111170431'),
('20211111170500'),
('20220412204356'),
('20220702123618'),
('20220727093837'),
('20220727093838');


