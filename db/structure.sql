--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: itms; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA itms;


--
-- Name: upvs; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA upvs;


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = itms, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: aktivity; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE aktivity (
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

CREATE SEQUENCE aktivity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: aktivity_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE aktivity_id_seq OWNED BY aktivity.id;


--
-- Name: ciselniky; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE ciselniky (
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

CREATE SEQUENCE ciselniky_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ciselniky_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE ciselniky_id_seq OWNED BY ciselniky.id;


--
-- Name: dodavatelia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE dodavatelia (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    itms_created_at character varying,
    itms_updated_at character varying,
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
-- Name: dodavatelia_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE dodavatelia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dodavatelia_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE dodavatelia_id_seq OWNED BY dodavatelia.id;


--
-- Name: hodnoty_ciselnikov; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE hodnoty_ciselnikov (
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

CREATE SEQUENCE hodnoty_ciselnikov_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: hodnoty_ciselnikov_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE hodnoty_ciselnikov_id_seq OWNED BY hodnoty_ciselnikov.id;


--
-- Name: intenzity; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE intenzity (
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
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: intenzity_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE intenzity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: intenzity_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE intenzity_id_seq OWNED BY intenzity.id;


--
-- Name: kody; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE kody (
    id integer NOT NULL,
    kod_id integer,
    kod_zdroj character varying,
    nazov character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: kody_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE kody_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: kody_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE kody_id_seq OWNED BY kody.id;


--
-- Name: konkretne_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE konkretne_ciele (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    itms_created_at timestamp without time zone,
    itms_updated_at timestamp without time zone,
    fond_id integer,
    kategoria_regionov character varying,
    kod character varying,
    nazov character varying,
    technicka_asistencia boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: konkretne_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE konkretne_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: konkretne_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE konkretne_ciele_id_seq OWNED BY konkretne_ciele.id;


--
-- Name: miesta_realizacie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE miesta_realizacie (
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

CREATE SEQUENCE miesta_realizacie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: miesta_realizacie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE miesta_realizacie_id_seq OWNED BY miesta_realizacie.id;


--
-- Name: monitorovacie_terminy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE monitorovacie_terminy (
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

CREATE SEQUENCE monitorovacie_terminy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: monitorovacie_terminy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE monitorovacie_terminy_id_seq OWNED BY monitorovacie_terminy.id;


--
-- Name: nezrovnalosti; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE nezrovnalosti (
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

CREATE SEQUENCE nezrovnalosti_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nezrovnalosti_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE nezrovnalosti_id_seq OWNED BY nezrovnalosti.id;


--
-- Name: nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost (
    id integer NOT NULL,
    nezrovnalost_id integer,
    subjekt_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost_id_seq OWNED BY nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost.id;


--
-- Name: nezrovnalosti_subjekty_ktore_zistili_nezrovnalost; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE nezrovnalosti_subjekty_ktore_zistili_nezrovnalost (
    id integer NOT NULL,
    nezrovnalost_id integer,
    subjekt_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nezrovnalosti_subjekty_ktore_zistili_nezrovnalost_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE nezrovnalosti_subjekty_ktore_zistili_nezrovnalost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nezrovnalosti_subjekty_ktore_zistili_nezrovnalost_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE nezrovnalosti_subjekty_ktore_zistili_nezrovnalost_id_seq OWNED BY nezrovnalosti_subjekty_ktore_zistili_nezrovnalost.id;


--
-- Name: nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie (
    id integer NOT NULL,
    nezrovnalost_id integer,
    subjekt_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie_id_seq OWNED BY nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie.id;


--
-- Name: nezrovnalosti_suvisiace_nezrovnalosti; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE nezrovnalosti_suvisiace_nezrovnalosti (
    id integer NOT NULL,
    nezrovnalost_id integer,
    suvisiaca_nezrovnalost_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nezrovnalosti_suvisiace_nezrovnalosti_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE nezrovnalosti_suvisiace_nezrovnalosti_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nezrovnalosti_suvisiace_nezrovnalosti_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE nezrovnalosti_suvisiace_nezrovnalosti_id_seq OWNED BY nezrovnalosti_suvisiace_nezrovnalosti.id;


--
-- Name: nezrovnalosti_suvisiace_pohladavkove_doklady; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE nezrovnalosti_suvisiace_pohladavkove_doklady (
    id integer NOT NULL,
    nezrovnalost_id integer,
    pohladavkovy_doklad_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nezrovnalosti_suvisiace_pohladavkove_doklady_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE nezrovnalosti_suvisiace_pohladavkove_doklady_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nezrovnalosti_suvisiace_pohladavkove_doklady_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE nezrovnalosti_suvisiace_pohladavkove_doklady_id_seq OWNED BY nezrovnalosti_suvisiace_pohladavkove_doklady.id;


--
-- Name: nezrovnalosti_typy_nezrovnalosti; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE nezrovnalosti_typy_nezrovnalosti (
    id integer NOT NULL,
    nezrovnalost_id integer,
    kod_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: nezrovnalosti_typy_nezrovnalosti_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE nezrovnalosti_typy_nezrovnalosti_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nezrovnalosti_typy_nezrovnalosti_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE nezrovnalosti_typy_nezrovnalosti_id_seq OWNED BY nezrovnalosti_typy_nezrovnalosti.id;


--
-- Name: nuts_kody; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE nuts_kody (
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

CREATE SEQUENCE nuts_kody_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nuts_kody_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE nuts_kody_id_seq OWNED BY nuts_kody.id;


--
-- Name: operacne_programy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE operacne_programy (
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

CREATE SEQUENCE operacne_programy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: operacne_programy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE operacne_programy_id_seq OWNED BY operacne_programy.id;


--
-- Name: organizacne_zlozky; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE organizacne_zlozky (
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

CREATE SEQUENCE organizacne_zlozky_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizacne_zlozky_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE organizacne_zlozky_id_seq OWNED BY organizacne_zlozky.id;


--
-- Name: osoby; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE osoby (
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

CREATE SEQUENCE osoby_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: osoby_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE osoby_id_seq OWNED BY osoby.id;


--
-- Name: pohladavkove_doklady; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE pohladavkove_doklady (
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

CREATE SEQUENCE pohladavkove_doklady_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pohladavkove_doklady_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE pohladavkove_doklady_id_seq OWNED BY pohladavkove_doklady.id;


--
-- Name: polozky_rozpoctu; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE polozky_rozpoctu (
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

CREATE SEQUENCE polozky_rozpoctu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: polozky_rozpoctu_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE polozky_rozpoctu_id_seq OWNED BY polozky_rozpoctu.id;


--
-- Name: prioritne_osi; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE prioritne_osi (
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

CREATE SEQUENCE prioritne_osi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: prioritne_osi_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE prioritne_osi_id_seq OWNED BY prioritne_osi.id;


--
-- Name: projektove_ukazovatele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projektove_ukazovatele (
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

CREATE TABLE projektove_ukazovatele_casy_plnenia (
    id integer NOT NULL,
    projektovy_ukazovatel_id integer,
    kod_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projektove_ukazovatele_casy_plnenia_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projektove_ukazovatele_casy_plnenia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projektove_ukazovatele_casy_plnenia_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projektove_ukazovatele_casy_plnenia_id_seq OWNED BY projektove_ukazovatele_casy_plnenia.id;


--
-- Name: projektove_ukazovatele_fondy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projektove_ukazovatele_fondy (
    id integer NOT NULL,
    projektovy_ukazovatel_id integer,
    kod_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projektove_ukazovatele_fondy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projektove_ukazovatele_fondy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projektove_ukazovatele_fondy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projektove_ukazovatele_fondy_id_seq OWNED BY projektove_ukazovatele_fondy.id;


--
-- Name: projektove_ukazovatele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projektove_ukazovatele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projektove_ukazovatele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projektove_ukazovatele_id_seq OWNED BY projektove_ukazovatele.id;


--
-- Name: projekty; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    itms_created_at timestamp without time zone,
    itms_updated_at timestamp without time zone,
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

CREATE TABLE projekty_aktivity (
    id integer NOT NULL,
    projekt_id integer,
    aktivita_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projekty_aktivity_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_aktivity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_aktivity_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_aktivity_id_seq OWNED BY projekty_aktivity.id;


--
-- Name: projekty_formy_financovania; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_formy_financovania (
    id integer NOT NULL,
    projekt_id integer,
    konkretny_ciel_id integer,
    hodnota_ciselnika_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projekty_formy_financovania_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_formy_financovania_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_formy_financovania_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_formy_financovania_id_seq OWNED BY projekty_formy_financovania.id;


--
-- Name: projekty_hospodarske_cinnosti; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_hospodarske_cinnosti (
    id integer NOT NULL,
    projekt_id integer,
    konkretny_ciel_id integer,
    hodnota_ciselnika_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projekty_hospodarske_cinnosti_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_hospodarske_cinnosti_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_hospodarske_cinnosti_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_hospodarske_cinnosti_id_seq OWNED BY projekty_hospodarske_cinnosti.id;


--
-- Name: projekty_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_id_seq OWNED BY projekty.id;


--
-- Name: projekty_intenzity; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_intenzity (
    id integer NOT NULL,
    projekt_id integer,
    intenzita_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projekty_intenzity_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_intenzity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_intenzity_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_intenzity_id_seq OWNED BY projekty_intenzity.id;


--
-- Name: projekty_meratelne_ukazovatele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_meratelne_ukazovatele (
    id integer NOT NULL,
    projekt_id integer,
    aktualny_skutocny_stav numeric,
    datum_posledneho_merania date,
    hodnota_cielova_celkova numeric,
    priznak_rizika boolean,
    projektovy_ukazovatel_id integer
);


--
-- Name: projekty_meratelne_ukazovatele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_meratelne_ukazovatele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_meratelne_ukazovatele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_meratelne_ukazovatele_id_seq OWNED BY projekty_meratelne_ukazovatele.id;


--
-- Name: projekty_miesta_realizacie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_miesta_realizacie (
    id integer NOT NULL,
    projekt_id integer NOT NULL,
    miesto_realizacie_id integer NOT NULL
);


--
-- Name: projekty_miesta_realizacie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_miesta_realizacie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_miesta_realizacie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_miesta_realizacie_id_seq OWNED BY projekty_miesta_realizacie.id;


--
-- Name: projekty_miesta_realizacie_mimo_uzemia_op; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_miesta_realizacie_mimo_uzemia_op (
    id integer NOT NULL,
    projekt_id integer NOT NULL,
    miesto_realizacie_id integer NOT NULL
);


--
-- Name: projekty_miesta_realizacie_mimo_uzemia_op_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_miesta_realizacie_mimo_uzemia_op_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_miesta_realizacie_mimo_uzemia_op_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_miesta_realizacie_mimo_uzemia_op_id_seq OWNED BY projekty_miesta_realizacie_mimo_uzemia_op.id;


--
-- Name: projekty_oblasti_intervencie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_oblasti_intervencie (
    id integer NOT NULL,
    projekt_id integer,
    konkretny_ciel_id integer,
    hodnota_ciselnika_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projekty_oblasti_intervencie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_oblasti_intervencie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_oblasti_intervencie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_oblasti_intervencie_id_seq OWNED BY projekty_oblasti_intervencie.id;


--
-- Name: projekty_organizacne_zlozky; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_organizacne_zlozky (
    id integer NOT NULL,
    projekt_id integer NOT NULL,
    organizacna_zlozka_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projekty_organizacne_zlozky_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_organizacne_zlozky_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_organizacne_zlozky_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_organizacne_zlozky_id_seq OWNED BY projekty_organizacne_zlozky.id;


--
-- Name: projekty_partneri; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_partneri (
    id integer NOT NULL,
    projekt_id integer NOT NULL,
    partner_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projekty_partneri_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_partneri_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_partneri_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_partneri_id_seq OWNED BY projekty_partneri.id;


--
-- Name: projekty_polozky_rozpoctu; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_polozky_rozpoctu (
    id integer NOT NULL,
    projekt_id integer NOT NULL,
    polozka_rozpoctu_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projekty_polozky_rozpoctu_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_polozky_rozpoctu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_polozky_rozpoctu_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_polozky_rozpoctu_id_seq OWNED BY projekty_polozky_rozpoctu.id;


--
-- Name: projekty_sekundarne_tematicke_okruhy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_sekundarne_tematicke_okruhy (
    id integer NOT NULL,
    projekt_id integer,
    konkretny_ciel_id integer,
    hodnota_ciselnika_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projekty_sekundarne_tematicke_okruhy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_sekundarne_tematicke_okruhy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_sekundarne_tematicke_okruhy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_sekundarne_tematicke_okruhy_id_seq OWNED BY projekty_sekundarne_tematicke_okruhy.id;


--
-- Name: projekty_typy_uzemia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_typy_uzemia (
    id integer NOT NULL,
    projekt_id integer,
    konkretny_ciel_id integer,
    hodnota_ciselnika_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projekty_typy_uzemia_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_typy_uzemia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_typy_uzemia_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_typy_uzemia_id_seq OWNED BY projekty_typy_uzemia.id;


--
-- Name: projekty_uzemne_mechanizmy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_uzemne_mechanizmy (
    id integer NOT NULL,
    projekt_id integer,
    konkretny_ciel_id integer,
    hodnota_ciselnika_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: projekty_uzemne_mechanizmy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_uzemne_mechanizmy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_uzemne_mechanizmy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_uzemne_mechanizmy_id_seq OWNED BY projekty_uzemne_mechanizmy.id;


--
-- Name: subjekty; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE subjekty (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    itms_created_at character varying,
    itms_updated_at character varying,
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

CREATE SEQUENCE subjekty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subjekty_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE subjekty_id_seq OWNED BY subjekty.id;


--
-- Name: typy_aktivit; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE typy_aktivit (
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

CREATE SEQUENCE typy_aktivit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: typy_aktivit_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE typy_aktivit_id_seq OWNED BY typy_aktivit.id;


--
-- Name: uctovne_doklady; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE uctovne_doklady (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: uctovne_doklady_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE uctovne_doklady_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: uctovne_doklady_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE uctovne_doklady_id_seq OWNED BY uctovne_doklady.id;


--
-- Name: verejne_obstaravania; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE verejne_obstaravania (
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

CREATE TABLE verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik (
    id integer NOT NULL,
    verejne_obstaravanie_id integer NOT NULL,
    predmet_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovn_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovn_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovn_id_seq OWNED BY verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik.id;


--
-- Name: verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik (
    id integer NOT NULL,
    verejne_obstaravanie_id integer NOT NULL,
    predmet_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik_id_seq OWNED BY verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik.id;


--
-- Name: verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik (
    id integer NOT NULL,
    verejne_obstaravanie_id integer NOT NULL,
    predmet_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik_id_seq OWNED BY verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik.id;


--
-- Name: verejne_obstaravania_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE verejne_obstaravania_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: verejne_obstaravania_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE verejne_obstaravania_id_seq OWNED BY verejne_obstaravania.id;


--
-- Name: verejne_obstaravania_operacne_programy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE verejne_obstaravania_operacne_programy (
    id integer NOT NULL,
    verejne_obstaravanie_id integer NOT NULL,
    operacny_program_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: verejne_obstaravania_operacne_programy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE verejne_obstaravania_operacne_programy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: verejne_obstaravania_operacne_programy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE verejne_obstaravania_operacne_programy_id_seq OWNED BY verejne_obstaravania_operacne_programy.id;


--
-- Name: verejne_obstaravania_projekty; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE verejne_obstaravania_projekty (
    id integer NOT NULL,
    verejne_obstaravanie_id integer NOT NULL,
    projekt_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: verejne_obstaravania_projekty_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE verejne_obstaravania_projekty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: verejne_obstaravania_projekty_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE verejne_obstaravania_projekty_id_seq OWNED BY verejne_obstaravania_projekty.id;


--
-- Name: verejne_obstaravania_uctovne_doklady; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE verejne_obstaravania_uctovne_doklady (
    id integer NOT NULL,
    verejne_obstaravanie_id integer NOT NULL,
    uctovny_doklad_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: verejne_obstaravania_uctovne_doklady_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE verejne_obstaravania_uctovne_doklady_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: verejne_obstaravania_uctovne_doklady_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE verejne_obstaravania_uctovne_doklady_id_seq OWNED BY verejne_obstaravania_uctovne_doklady.id;


--
-- Name: vyzvy_planovane; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE vyzvy_planovane (
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

CREATE TABLE vyzvy_planovane_doplnujuce_info (
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

CREATE SEQUENCE vyzvy_planovane_doplnujuce_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_planovane_doplnujuce_info_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE vyzvy_planovane_doplnujuce_info_id_seq OWNED BY vyzvy_planovane_doplnujuce_info.id;


--
-- Name: vyzvy_planovane_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE vyzvy_planovane_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_planovane_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE vyzvy_planovane_id_seq OWNED BY vyzvy_planovane.id;


--
-- Name: vyzvy_planovane_konkretne_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE vyzvy_planovane_konkretne_ciele (
    id integer NOT NULL,
    vyzva_id integer NOT NULL,
    konkretny_ciel_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vyzvy_planovane_konkretne_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE vyzvy_planovane_konkretne_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_planovane_konkretne_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE vyzvy_planovane_konkretne_ciele_id_seq OWNED BY vyzvy_planovane_konkretne_ciele.id;


--
-- Name: vyzvy_planovane_poskytovatelia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE vyzvy_planovane_poskytovatelia (
    id integer NOT NULL,
    vyzva_id integer NOT NULL,
    poskytovatel_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vyzvy_planovane_poskytovatelia_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE vyzvy_planovane_poskytovatelia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_planovane_poskytovatelia_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE vyzvy_planovane_poskytovatelia_id_seq OWNED BY vyzvy_planovane_poskytovatelia.id;


--
-- Name: vyzvy_vyhlasene; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE vyzvy_vyhlasene (
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

CREATE TABLE vyzvy_vyhlasene_doplnujuce_info (
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

CREATE SEQUENCE vyzvy_vyhlasene_doplnujuce_info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_vyhlasene_doplnujuce_info_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE vyzvy_vyhlasene_doplnujuce_info_id_seq OWNED BY vyzvy_vyhlasene_doplnujuce_info.id;


--
-- Name: vyzvy_vyhlasene_fondy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE vyzvy_vyhlasene_fondy (
    id integer NOT NULL,
    vyzva_id integer NOT NULL,
    fond_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vyzvy_vyhlasene_fondy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE vyzvy_vyhlasene_fondy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_vyhlasene_fondy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE vyzvy_vyhlasene_fondy_id_seq OWNED BY vyzvy_vyhlasene_fondy.id;


--
-- Name: vyzvy_vyhlasene_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE vyzvy_vyhlasene_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_vyhlasene_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE vyzvy_vyhlasene_id_seq OWNED BY vyzvy_vyhlasene.id;


--
-- Name: vyzvy_vyhlasene_konkretne_ciele_typy_aktivit; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE vyzvy_vyhlasene_konkretne_ciele_typy_aktivit (
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

CREATE SEQUENCE vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_id_seq OWNED BY vyzvy_vyhlasene_konkretne_ciele_typy_aktivit.id;


--
-- Name: vyzvy_vyhlasene_kontaktne_osoby; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE vyzvy_vyhlasene_kontaktne_osoby (
    id integer NOT NULL,
    vyzva_id integer NOT NULL,
    osoba_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vyzvy_vyhlasene_kontaktne_osoby_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE vyzvy_vyhlasene_kontaktne_osoby_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_vyhlasene_kontaktne_osoby_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE vyzvy_vyhlasene_kontaktne_osoby_id_seq OWNED BY vyzvy_vyhlasene_kontaktne_osoby.id;


--
-- Name: vyzvy_vyhlasene_poskytovatelia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE vyzvy_vyhlasene_poskytovatelia (
    id integer NOT NULL,
    vyzva_id integer NOT NULL,
    poskytovatel_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vyzvy_vyhlasene_poskytovatelia_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE vyzvy_vyhlasene_poskytovatelia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_vyhlasene_poskytovatelia_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE vyzvy_vyhlasene_poskytovatelia_id_seq OWNED BY vyzvy_vyhlasene_poskytovatelia.id;


--
-- Name: vyzvy_vyhlasene_posudzovane_obdobia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE vyzvy_vyhlasene_posudzovane_obdobia (
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

CREATE SEQUENCE vyzvy_vyhlasene_posudzovane_obdobia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_vyhlasene_posudzovane_obdobia_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE vyzvy_vyhlasene_posudzovane_obdobia_id_seq OWNED BY vyzvy_vyhlasene_posudzovane_obdobia.id;


--
-- Name: vyzvy_vyhlasene_vyzvy_planovane; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE vyzvy_vyhlasene_vyzvy_planovane (
    id integer NOT NULL,
    vyhlasena_vyzva_id integer NOT NULL,
    planovana_vyzva_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vyzvy_vyhlasene_vyzvy_planovane_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE vyzvy_vyhlasene_vyzvy_planovane_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_vyhlasene_vyzvy_planovane_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE vyzvy_vyhlasene_vyzvy_planovane_id_seq OWNED BY vyzvy_vyhlasene_vyzvy_planovane.id;


--
-- Name: zdroje_intenzit; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zdroje_intenzit (
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
-- Name: zdroje_intenzit_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zdroje_intenzit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zdroje_intenzit_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zdroje_intenzit_id_seq OWNED BY zdroje_intenzit.id;


--
-- Name: zmluvy_verejne_obstaravania; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zmluvy_verejne_obstaravania (
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
    verejne_obstaravanie_id integer
);


--
-- Name: zmluvy_verejne_obstaravania_dalsie_url; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zmluvy_verejne_obstaravania_dalsie_url (
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

CREATE SEQUENCE zmluvy_verejne_obstaravania_dalsie_url_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zmluvy_verejne_obstaravania_dalsie_url_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zmluvy_verejne_obstaravania_dalsie_url_id_seq OWNED BY zmluvy_verejne_obstaravania_dalsie_url.id;


--
-- Name: zmluvy_verejne_obstaravania_dodavatelia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zmluvy_verejne_obstaravania_dodavatelia (
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

CREATE SEQUENCE zmluvy_verejne_obstaravania_dodavatelia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zmluvy_verejne_obstaravania_dodavatelia_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zmluvy_verejne_obstaravania_dodavatelia_id_seq OWNED BY zmluvy_verejne_obstaravania_dodavatelia.id;


--
-- Name: zmluvy_verejne_obstaravania_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zmluvy_verejne_obstaravania_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zmluvy_verejne_obstaravania_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zmluvy_verejne_obstaravania_id_seq OWNED BY zmluvy_verejne_obstaravania.id;


--
-- Name: zonfp; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: zonfp_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_id_seq OWNED BY zonfp.id;


--
-- Name: zonfp_prijate; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_prijate (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    akronym character varying,
    kod character varying,
    nazov character varying,
    zameranie_projektu character varying,
    popis_projektu text,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    datum_predlozenia timestamp without time zone,
    datum_ziadany_konca_hlavnych_aktivit timestamp without time zone,
    datum_ziadany_konca_realizacie timestamp without time zone,
    datum_ziadany_zaciatku_hlavnych_aktivit timestamp without time zone,
    datum_ziadany_zaciatku_realizacie timestamp without time zone,
    percento_ziadane_spolufinancovania numeric,
    suma_ziadana_celkova numeric,
    suma_ziadana_celkova_projektov_generujucich_prijem numeric,
    suma_ziadana_nfp numeric,
    suma_ziadana_vlastnych_zdrojov numeric
);


--
-- Name: zonfp_prijate_aktivity_projekt_subjekty; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_prijate_aktivity_projekt_subjekty (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_prijate_aktivity_projekty_id bigint NOT NULL,
    ico character varying,
    dic character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: zonfp_prijate_aktivity_projekt_subjekty_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_prijate_aktivity_projekt_subjekty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_aktivity_projekt_subjekty_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_prijate_aktivity_projekt_subjekty_id_seq OWNED BY zonfp_prijate_aktivity_projekt_subjekty.id;


--
-- Name: zonfp_prijate_aktivity_projekty; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_prijate_aktivity_projekty (
    id integer NOT NULL,
    zonfp_prijate_id bigint NOT NULL,
    kod character varying,
    nazov character varying,
    datum_konca_planovany character varying,
    datum_konca_skutocny character varying,
    datum_zaciatku_planovany character varying,
    datum_zaciatku_skutocny character varying
);


--
-- Name: zonfp_prijate_aktivity_projekty_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_prijate_aktivity_projekty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_aktivity_projekty_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_prijate_aktivity_projekty_id_seq OWNED BY zonfp_prijate_aktivity_projekty.id;


--
-- Name: zonfp_prijate_formy_financovania; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_prijate_formy_financovania (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_prijate_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: zonfp_prijate_formy_financovania_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_prijate_formy_financovania_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_prijate_formy_financovania_id bigint NOT NULL
);


--
-- Name: zonfp_prijate_formy_financovania_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_prijate_formy_financovania_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_formy_financovania_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_prijate_formy_financovania_ciele_id_seq OWNED BY zonfp_prijate_formy_financovania_ciele.id;


--
-- Name: zonfp_prijate_formy_financovania_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_prijate_formy_financovania_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_formy_financovania_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_prijate_formy_financovania_id_seq OWNED BY zonfp_prijate_formy_financovania.id;


--
-- Name: zonfp_prijate_hospodarske_cinnosti; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_prijate_hospodarske_cinnosti (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_prijate_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: zonfp_prijate_hospodarske_cinnosti_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_prijate_hospodarske_cinnosti_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_prijate_hospodarske_cinnosti_id bigint NOT NULL
);


--
-- Name: zonfp_prijate_hospodarske_cinnosti_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_prijate_hospodarske_cinnosti_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_hospodarske_cinnosti_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_prijate_hospodarske_cinnosti_ciele_id_seq OWNED BY zonfp_prijate_hospodarske_cinnosti_ciele.id;


--
-- Name: zonfp_prijate_hospodarske_cinnosti_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_prijate_hospodarske_cinnosti_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_hospodarske_cinnosti_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_prijate_hospodarske_cinnosti_id_seq OWNED BY zonfp_prijate_hospodarske_cinnosti.id;


--
-- Name: zonfp_prijate_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_prijate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_prijate_id_seq OWNED BY zonfp_prijate.id;


--
-- Name: zonfp_prijate_meratelne_ukazovatele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_prijate_meratelne_ukazovatele (
    id integer NOT NULL,
    zonfp_prijate_id bigint NOT NULL,
    kod character varying,
    merna_jednotka character varying,
    nazov character varying,
    aktualny_skutocny_stav numeric,
    hodnota_cielova_celkova numeric
);


--
-- Name: zonfp_prijate_meratelne_ukazovatele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_prijate_meratelne_ukazovatele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_meratelne_ukazovatele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_prijate_meratelne_ukazovatele_id_seq OWNED BY zonfp_prijate_meratelne_ukazovatele.id;


--
-- Name: zonfp_prijate_miesta_realizacie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_prijate_miesta_realizacie (
    id integer NOT NULL,
    zonfp_prijate_id bigint NOT NULL
);


--
-- Name: zonfp_prijate_miesta_realizacie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_prijate_miesta_realizacie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_miesta_realizacie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_prijate_miesta_realizacie_id_seq OWNED BY zonfp_prijate_miesta_realizacie.id;


--
-- Name: zonfp_prijate_miesta_realizacie_units; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_prijate_miesta_realizacie_units (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_prijate_miesta_realizacie_id bigint NOT NULL,
    typ character varying,
    nazov character varying
);


--
-- Name: zonfp_prijate_miesta_realizacie_units_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_prijate_miesta_realizacie_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_miesta_realizacie_units_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_prijate_miesta_realizacie_units_id_seq OWNED BY zonfp_prijate_miesta_realizacie_units.id;


--
-- Name: zonfp_prijate_oblasti_intervencie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_prijate_oblasti_intervencie (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_prijate_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: zonfp_prijate_oblasti_intervencie_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_prijate_oblasti_intervencie_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_prijate_oblasti_intervencie_id bigint NOT NULL
);


--
-- Name: zonfp_prijate_oblasti_intervencie_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_prijate_oblasti_intervencie_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_oblasti_intervencie_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_prijate_oblasti_intervencie_ciele_id_seq OWNED BY zonfp_prijate_oblasti_intervencie_ciele.id;


--
-- Name: zonfp_prijate_oblasti_intervencie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_prijate_oblasti_intervencie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_oblasti_intervencie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_prijate_oblasti_intervencie_id_seq OWNED BY zonfp_prijate_oblasti_intervencie.id;


--
-- Name: zonfp_prijate_organizacne_zlozky; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_prijate_organizacne_zlozky (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_prijate_id bigint NOT NULL,
    adresa character varying,
    nazov character varying
);


--
-- Name: zonfp_prijate_organizacne_zlozky_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_prijate_organizacne_zlozky_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_organizacne_zlozky_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_prijate_organizacne_zlozky_id_seq OWNED BY zonfp_prijate_organizacne_zlozky.id;


--
-- Name: zonfp_prijate_partneri; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_prijate_partneri (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_prijate_id bigint NOT NULL,
    ico character varying,
    dic character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: zonfp_prijate_partneri_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_prijate_partneri_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_partneri_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_prijate_partneri_id_seq OWNED BY zonfp_prijate_partneri.id;


--
-- Name: zonfp_prijate_typy_uzemia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_prijate_typy_uzemia (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_prijate_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: zonfp_prijate_typy_uzemia_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_prijate_typy_uzemia_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_prijate_typy_uzemia_id bigint NOT NULL
);


--
-- Name: zonfp_prijate_typy_uzemia_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_prijate_typy_uzemia_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_typy_uzemia_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_prijate_typy_uzemia_ciele_id_seq OWNED BY zonfp_prijate_typy_uzemia_ciele.id;


--
-- Name: zonfp_prijate_typy_uzemia_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_prijate_typy_uzemia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_typy_uzemia_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_prijate_typy_uzemia_id_seq OWNED BY zonfp_prijate_typy_uzemia.id;


--
-- Name: zonfp_prijate_uzemne_mechanizmy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_prijate_uzemne_mechanizmy (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_prijate_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: zonfp_prijate_uzemne_mechanizmy_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_prijate_uzemne_mechanizmy_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_prijate_uzemne_mechanizmy_id bigint NOT NULL
);


--
-- Name: zonfp_prijate_uzemne_mechanizmy_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_prijate_uzemne_mechanizmy_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_uzemne_mechanizmy_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_prijate_uzemne_mechanizmy_ciele_id_seq OWNED BY zonfp_prijate_uzemne_mechanizmy_ciele.id;


--
-- Name: zonfp_prijate_uzemne_mechanizmy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_prijate_uzemne_mechanizmy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_uzemne_mechanizmy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_prijate_uzemne_mechanizmy_id_seq OWNED BY zonfp_prijate_uzemne_mechanizmy.id;


--
-- Name: zonfp_prijate_vyzvy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_prijate_vyzvy (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_prijate_id bigint NOT NULL
);


--
-- Name: zonfp_prijate_vyzvy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_prijate_vyzvy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_vyzvy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_prijate_vyzvy_id_seq OWNED BY zonfp_prijate_vyzvy.id;


--
-- Name: zonfp_prijate_ziadatel; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_prijate_ziadatel (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_prijate_id bigint NOT NULL,
    ico character varying,
    dic character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: zonfp_prijate_ziadatel_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_prijate_ziadatel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_prijate_ziadatel_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_prijate_ziadatel_id_seq OWNED BY zonfp_prijate_ziadatel.id;


--
-- Name: zonfp_schvalene; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_schvalene (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    akronym character varying,
    kod character varying,
    nazov character varying,
    zameranie_projektu character varying,
    popis_projektu text,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    datum_schvalenia timestamp without time zone,
    datum_schvaleny_konca_hlavnych_aktivit timestamp without time zone,
    datum_schvaleny_konca_realizacie timestamp without time zone,
    datum_schvaleny_zaciatku_hlavnych_aktivit timestamp without time zone,
    datum_schvaleny_zaciatku_realizacie timestamp without time zone,
    percento_schvalene_spolufinancovania numeric,
    pocet_bodov_hodnotenia_celkovy numeric,
    suma_schvalena_celkova numeric,
    suma_schvalena_celkova_projektov_generujucich_prijem numeric,
    suma_schvalena_nfp numeric,
    suma_schvalena_vlastnych_zdrojov numeric
);


--
-- Name: zonfp_schvalene_aktivity_projekt_subjekty; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_schvalene_aktivity_projekt_subjekty (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_schvalene_aktivity_projekty_id bigint NOT NULL,
    ico character varying,
    dic character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: zonfp_schvalene_aktivity_projekt_subjekty_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_schvalene_aktivity_projekt_subjekty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_schvalene_aktivity_projekt_subjekty_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_schvalene_aktivity_projekt_subjekty_id_seq OWNED BY zonfp_schvalene_aktivity_projekt_subjekty.id;


--
-- Name: zonfp_schvalene_aktivity_projekty; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_schvalene_aktivity_projekty (
    id integer NOT NULL,
    zonfp_schvalene_id bigint NOT NULL,
    kod character varying,
    nazov character varying,
    datum_konca_planovany character varying,
    datum_konca_skutocny character varying,
    datum_zaciatku_planovany character varying,
    datum_zaciatku_skutocny character varying
);


--
-- Name: zonfp_schvalene_aktivity_projekty_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_schvalene_aktivity_projekty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_schvalene_aktivity_projekty_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_schvalene_aktivity_projekty_id_seq OWNED BY zonfp_schvalene_aktivity_projekty.id;


--
-- Name: zonfp_schvalene_formy_financovania; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_schvalene_formy_financovania (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_schvalene_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: zonfp_schvalene_formy_financovania_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_schvalene_formy_financovania_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_schvalene_formy_financovania_id bigint NOT NULL
);


--
-- Name: zonfp_schvalene_formy_financovania_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_schvalene_formy_financovania_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_schvalene_formy_financovania_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_schvalene_formy_financovania_ciele_id_seq OWNED BY zonfp_schvalene_formy_financovania_ciele.id;


--
-- Name: zonfp_schvalene_formy_financovania_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_schvalene_formy_financovania_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_schvalene_formy_financovania_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_schvalene_formy_financovania_id_seq OWNED BY zonfp_schvalene_formy_financovania.id;


--
-- Name: zonfp_schvalene_hodnotitelia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_schvalene_hodnotitelia (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_schvalene_id bigint NOT NULL,
    email character varying,
    meno character varying,
    meno_uplne character varying,
    priezvisko character varying,
    telefon character varying
);


--
-- Name: zonfp_schvalene_hodnotitelia_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_schvalene_hodnotitelia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_schvalene_hodnotitelia_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_schvalene_hodnotitelia_id_seq OWNED BY zonfp_schvalene_hodnotitelia.id;


--
-- Name: zonfp_schvalene_hospodarske_cinnosti; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_schvalene_hospodarske_cinnosti (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_schvalene_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: zonfp_schvalene_hospodarske_cinnosti_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_schvalene_hospodarske_cinnosti_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_schvalene_hospodarske_cinnosti_id bigint NOT NULL
);


--
-- Name: zonfp_schvalene_hospodarske_cinnosti_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_schvalene_hospodarske_cinnosti_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_schvalene_hospodarske_cinnosti_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_schvalene_hospodarske_cinnosti_ciele_id_seq OWNED BY zonfp_schvalene_hospodarske_cinnosti_ciele.id;


--
-- Name: zonfp_schvalene_hospodarske_cinnosti_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_schvalene_hospodarske_cinnosti_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_schvalene_hospodarske_cinnosti_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_schvalene_hospodarske_cinnosti_id_seq OWNED BY zonfp_schvalene_hospodarske_cinnosti.id;


--
-- Name: zonfp_schvalene_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_schvalene_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_schvalene_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_schvalene_id_seq OWNED BY zonfp_schvalene.id;


--
-- Name: zonfp_schvalene_meratelne_ukazovatele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_schvalene_meratelne_ukazovatele (
    id integer NOT NULL,
    zonfp_schvalene_id bigint NOT NULL,
    kod character varying,
    merna_jednotka character varying,
    nazov character varying,
    aktualny_skutocny_stav numeric,
    hodnota_cielova_celkova numeric
);


--
-- Name: zonfp_schvalene_meratelne_ukazovatele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_schvalene_meratelne_ukazovatele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_schvalene_meratelne_ukazovatele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_schvalene_meratelne_ukazovatele_id_seq OWNED BY zonfp_schvalene_meratelne_ukazovatele.id;


--
-- Name: zonfp_schvalene_miesta_realizacie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_schvalene_miesta_realizacie (
    id integer NOT NULL,
    zonfp_schvalene_id bigint NOT NULL
);


--
-- Name: zonfp_schvalene_miesta_realizacie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_schvalene_miesta_realizacie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_schvalene_miesta_realizacie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_schvalene_miesta_realizacie_id_seq OWNED BY zonfp_schvalene_miesta_realizacie.id;


--
-- Name: zonfp_schvalene_miesta_realizacie_units; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_schvalene_miesta_realizacie_units (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_schvalene_miesta_realizacie_id bigint NOT NULL,
    typ character varying,
    nazov character varying
);


--
-- Name: zonfp_schvalene_miesta_realizacie_units_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_schvalene_miesta_realizacie_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_schvalene_miesta_realizacie_units_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_schvalene_miesta_realizacie_units_id_seq OWNED BY zonfp_schvalene_miesta_realizacie_units.id;


--
-- Name: zonfp_schvalene_oblasti_intervencie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_schvalene_oblasti_intervencie (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_schvalene_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: zonfp_schvalene_oblasti_intervencie_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_schvalene_oblasti_intervencie_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_schvalene_oblasti_intervencie_id bigint NOT NULL
);


--
-- Name: zonfp_schvalene_oblasti_intervencie_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_schvalene_oblasti_intervencie_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_schvalene_oblasti_intervencie_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_schvalene_oblasti_intervencie_ciele_id_seq OWNED BY zonfp_schvalene_oblasti_intervencie_ciele.id;


--
-- Name: zonfp_schvalene_oblasti_intervencie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_schvalene_oblasti_intervencie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_schvalene_oblasti_intervencie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_schvalene_oblasti_intervencie_id_seq OWNED BY zonfp_schvalene_oblasti_intervencie.id;


--
-- Name: zonfp_schvalene_organizacne_zlozky; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_schvalene_organizacne_zlozky (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_schvalene_id bigint NOT NULL,
    adresa character varying,
    nazov character varying
);


--
-- Name: zonfp_schvalene_organizacne_zlozky_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_schvalene_organizacne_zlozky_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_schvalene_organizacne_zlozky_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_schvalene_organizacne_zlozky_id_seq OWNED BY zonfp_schvalene_organizacne_zlozky.id;


--
-- Name: zonfp_schvalene_partneri; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_schvalene_partneri (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_schvalene_id bigint NOT NULL,
    ico character varying,
    dic character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: zonfp_schvalene_partneri_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_schvalene_partneri_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_schvalene_partneri_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_schvalene_partneri_id_seq OWNED BY zonfp_schvalene_partneri.id;


--
-- Name: zonfp_schvalene_typy_uzemia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_schvalene_typy_uzemia (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_schvalene_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: zonfp_schvalene_typy_uzemia_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_schvalene_typy_uzemia_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_schvalene_typy_uzemia_id bigint NOT NULL
);


--
-- Name: zonfp_schvalene_typy_uzemia_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_schvalene_typy_uzemia_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_schvalene_typy_uzemia_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_schvalene_typy_uzemia_ciele_id_seq OWNED BY zonfp_schvalene_typy_uzemia_ciele.id;


--
-- Name: zonfp_schvalene_typy_uzemia_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_schvalene_typy_uzemia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_schvalene_typy_uzemia_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_schvalene_typy_uzemia_id_seq OWNED BY zonfp_schvalene_typy_uzemia.id;


--
-- Name: zonfp_schvalene_uzemne_mechanizmy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_schvalene_uzemne_mechanizmy (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_schvalene_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: zonfp_schvalene_uzemne_mechanizmy_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_schvalene_uzemne_mechanizmy_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_schvalene_uzemne_mechanizmy_id bigint NOT NULL
);


--
-- Name: zonfp_schvalene_uzemne_mechanizmy_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_schvalene_uzemne_mechanizmy_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_schvalene_uzemne_mechanizmy_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_schvalene_uzemne_mechanizmy_ciele_id_seq OWNED BY zonfp_schvalene_uzemne_mechanizmy_ciele.id;


--
-- Name: zonfp_schvalene_uzemne_mechanizmy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_schvalene_uzemne_mechanizmy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_schvalene_uzemne_mechanizmy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_schvalene_uzemne_mechanizmy_id_seq OWNED BY zonfp_schvalene_uzemne_mechanizmy.id;


--
-- Name: zonfp_schvalene_vyzvy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_schvalene_vyzvy (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_schvalene_id bigint NOT NULL
);


--
-- Name: zonfp_schvalene_vyzvy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_schvalene_vyzvy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_schvalene_vyzvy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_schvalene_vyzvy_id_seq OWNED BY zonfp_schvalene_vyzvy.id;


--
-- Name: zonfp_schvalene_ziadatel; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_schvalene_ziadatel (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_schvalene_id bigint NOT NULL,
    ico character varying,
    dic character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: zonfp_schvalene_ziadatel_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_schvalene_ziadatel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_schvalene_ziadatel_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_schvalene_ziadatel_id_seq OWNED BY zonfp_schvalene_ziadatel.id;


--
-- Name: zonfp_zamietnute; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_zamietnute (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    akronym character varying,
    kod character varying,
    nazov character varying,
    zameranie_projektu character varying,
    popis_projektu text,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    datum_zamietnutia timestamp without time zone,
    datum_ziadany_konca_hlavnych_aktivit timestamp without time zone,
    datum_ziadany_konca_realizacie timestamp without time zone,
    datum_ziadany_zaciatku_hlavnych_aktivit timestamp without time zone,
    datum_ziadany_zaciatku_realizacie timestamp without time zone,
    percento_ziadane_spolufinancovania numeric,
    suma_ziadana_celkova numeric,
    suma_ziadana_celkova_projektov_generujucich_prijem numeric,
    suma_ziadana_nfp numeric,
    suma_ziadana_vlastnych_zdrojov numeric
);


--
-- Name: zonfp_zamietnute_aktivity_projekt_subjekty; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_zamietnute_aktivity_projekt_subjekty (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_zamietnute_aktivity_projekty_id bigint NOT NULL,
    ico character varying,
    dic character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: zonfp_zamietnute_aktivity_projekt_subjekty_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_zamietnute_aktivity_projekt_subjekty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_zamietnute_aktivity_projekt_subjekty_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_zamietnute_aktivity_projekt_subjekty_id_seq OWNED BY zonfp_zamietnute_aktivity_projekt_subjekty.id;


--
-- Name: zonfp_zamietnute_aktivity_projekty; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_zamietnute_aktivity_projekty (
    id integer NOT NULL,
    zonfp_zamietnute_id bigint NOT NULL,
    kod character varying,
    nazov character varying,
    datum_konca_planovany character varying,
    datum_konca_skutocny character varying,
    datum_zaciatku_planovany character varying,
    datum_zaciatku_skutocny character varying
);


--
-- Name: zonfp_zamietnute_aktivity_projekty_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_zamietnute_aktivity_projekty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_zamietnute_aktivity_projekty_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_zamietnute_aktivity_projekty_id_seq OWNED BY zonfp_zamietnute_aktivity_projekty.id;


--
-- Name: zonfp_zamietnute_formy_financovania; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_zamietnute_formy_financovania (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_zamietnute_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: zonfp_zamietnute_formy_financovania_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_zamietnute_formy_financovania_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_zamietnute_formy_financovania_id bigint NOT NULL
);


--
-- Name: zonfp_zamietnute_formy_financovania_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_zamietnute_formy_financovania_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_zamietnute_formy_financovania_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_zamietnute_formy_financovania_ciele_id_seq OWNED BY zonfp_zamietnute_formy_financovania_ciele.id;


--
-- Name: zonfp_zamietnute_formy_financovania_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_zamietnute_formy_financovania_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_zamietnute_formy_financovania_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_zamietnute_formy_financovania_id_seq OWNED BY zonfp_zamietnute_formy_financovania.id;


--
-- Name: zonfp_zamietnute_hospodarske_cinnosti; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_zamietnute_hospodarske_cinnosti (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_zamietnute_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: zonfp_zamietnute_hospodarske_cinnosti_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_zamietnute_hospodarske_cinnosti_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_zamietnute_hospodarske_cinnosti_id bigint NOT NULL
);


--
-- Name: zonfp_zamietnute_hospodarske_cinnosti_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_zamietnute_hospodarske_cinnosti_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_zamietnute_hospodarske_cinnosti_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_zamietnute_hospodarske_cinnosti_ciele_id_seq OWNED BY zonfp_zamietnute_hospodarske_cinnosti_ciele.id;


--
-- Name: zonfp_zamietnute_hospodarske_cinnosti_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_zamietnute_hospodarske_cinnosti_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_zamietnute_hospodarske_cinnosti_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_zamietnute_hospodarske_cinnosti_id_seq OWNED BY zonfp_zamietnute_hospodarske_cinnosti.id;


--
-- Name: zonfp_zamietnute_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_zamietnute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_zamietnute_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_zamietnute_id_seq OWNED BY zonfp_zamietnute.id;


--
-- Name: zonfp_zamietnute_meratelne_ukazovatele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_zamietnute_meratelne_ukazovatele (
    id integer NOT NULL,
    zonfp_zamietnute_id bigint NOT NULL,
    kod character varying,
    merna_jednotka character varying,
    nazov character varying,
    aktualny_skutocny_stav numeric,
    hodnota_cielova_celkova numeric
);


--
-- Name: zonfp_zamietnute_meratelne_ukazovatele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_zamietnute_meratelne_ukazovatele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_zamietnute_meratelne_ukazovatele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_zamietnute_meratelne_ukazovatele_id_seq OWNED BY zonfp_zamietnute_meratelne_ukazovatele.id;


--
-- Name: zonfp_zamietnute_miesta_realizacie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_zamietnute_miesta_realizacie (
    id integer NOT NULL,
    zonfp_zamietnute_id bigint NOT NULL
);


--
-- Name: zonfp_zamietnute_miesta_realizacie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_zamietnute_miesta_realizacie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_zamietnute_miesta_realizacie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_zamietnute_miesta_realizacie_id_seq OWNED BY zonfp_zamietnute_miesta_realizacie.id;


--
-- Name: zonfp_zamietnute_miesta_realizacie_units; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_zamietnute_miesta_realizacie_units (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_zamietnute_miesta_realizacie_id bigint NOT NULL,
    typ character varying,
    nazov character varying
);


--
-- Name: zonfp_zamietnute_miesta_realizacie_units_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_zamietnute_miesta_realizacie_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_zamietnute_miesta_realizacie_units_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_zamietnute_miesta_realizacie_units_id_seq OWNED BY zonfp_zamietnute_miesta_realizacie_units.id;


--
-- Name: zonfp_zamietnute_oblasti_intervencie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_zamietnute_oblasti_intervencie (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_zamietnute_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: zonfp_zamietnute_oblasti_intervencie_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_zamietnute_oblasti_intervencie_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_zamietnute_oblasti_intervencie_id bigint NOT NULL
);


--
-- Name: zonfp_zamietnute_oblasti_intervencie_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_zamietnute_oblasti_intervencie_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_zamietnute_oblasti_intervencie_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_zamietnute_oblasti_intervencie_ciele_id_seq OWNED BY zonfp_zamietnute_oblasti_intervencie_ciele.id;


--
-- Name: zonfp_zamietnute_oblasti_intervencie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_zamietnute_oblasti_intervencie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_zamietnute_oblasti_intervencie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_zamietnute_oblasti_intervencie_id_seq OWNED BY zonfp_zamietnute_oblasti_intervencie.id;


--
-- Name: zonfp_zamietnute_organizacne_zlozky; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_zamietnute_organizacne_zlozky (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_zamietnute_id bigint NOT NULL,
    adresa character varying,
    nazov character varying
);


--
-- Name: zonfp_zamietnute_organizacne_zlozky_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_zamietnute_organizacne_zlozky_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_zamietnute_organizacne_zlozky_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_zamietnute_organizacne_zlozky_id_seq OWNED BY zonfp_zamietnute_organizacne_zlozky.id;


--
-- Name: zonfp_zamietnute_partneri; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_zamietnute_partneri (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_zamietnute_id bigint NOT NULL,
    ico character varying,
    dic character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: zonfp_zamietnute_partneri_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_zamietnute_partneri_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_zamietnute_partneri_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_zamietnute_partneri_id_seq OWNED BY zonfp_zamietnute_partneri.id;


--
-- Name: zonfp_zamietnute_typy_uzemia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_zamietnute_typy_uzemia (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_zamietnute_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: zonfp_zamietnute_typy_uzemia_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_zamietnute_typy_uzemia_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_zamietnute_typy_uzemia_id bigint NOT NULL
);


--
-- Name: zonfp_zamietnute_typy_uzemia_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_zamietnute_typy_uzemia_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_zamietnute_typy_uzemia_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_zamietnute_typy_uzemia_ciele_id_seq OWNED BY zonfp_zamietnute_typy_uzemia_ciele.id;


--
-- Name: zonfp_zamietnute_typy_uzemia_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_zamietnute_typy_uzemia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_zamietnute_typy_uzemia_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_zamietnute_typy_uzemia_id_seq OWNED BY zonfp_zamietnute_typy_uzemia.id;


--
-- Name: zonfp_zamietnute_uzemne_mechanizmy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_zamietnute_uzemne_mechanizmy (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_zamietnute_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: zonfp_zamietnute_uzemne_mechanizmy_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_zamietnute_uzemne_mechanizmy_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_zamietnute_uzemne_mechanizmy_id bigint NOT NULL
);


--
-- Name: zonfp_zamietnute_uzemne_mechanizmy_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_zamietnute_uzemne_mechanizmy_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_zamietnute_uzemne_mechanizmy_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_zamietnute_uzemne_mechanizmy_ciele_id_seq OWNED BY zonfp_zamietnute_uzemne_mechanizmy_ciele.id;


--
-- Name: zonfp_zamietnute_uzemne_mechanizmy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_zamietnute_uzemne_mechanizmy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_zamietnute_uzemne_mechanizmy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_zamietnute_uzemne_mechanizmy_id_seq OWNED BY zonfp_zamietnute_uzemne_mechanizmy.id;


--
-- Name: zonfp_zamietnute_vysledok_konania; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_zamietnute_vysledok_konania (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_zamietnute_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: zonfp_zamietnute_vysledok_konania_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_zamietnute_vysledok_konania_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_zamietnute_vysledok_konania_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_zamietnute_vysledok_konania_id_seq OWNED BY zonfp_zamietnute_vysledok_konania.id;


--
-- Name: zonfp_zamietnute_vyzvy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_zamietnute_vyzvy (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_zamietnute_id bigint NOT NULL
);


--
-- Name: zonfp_zamietnute_vyzvy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_zamietnute_vyzvy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_zamietnute_vyzvy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_zamietnute_vyzvy_id_seq OWNED BY zonfp_zamietnute_vyzvy.id;


--
-- Name: zonfp_zamietnute_ziadatel; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zonfp_zamietnute_ziadatel (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zonfp_zamietnute_id bigint NOT NULL,
    ico character varying,
    dic character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: zonfp_zamietnute_ziadatel_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zonfp_zamietnute_ziadatel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zonfp_zamietnute_ziadatel_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zonfp_zamietnute_ziadatel_id_seq OWNED BY zonfp_zamietnute_ziadatel.id;


--
-- Name: zop_predlozene; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zop_predlozene (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    kod character varying,
    typ character varying,
    narokovana_suma numeric,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    datum_prijatia timestamp without time zone,
    vyplaca_sa_partnerovi boolean,
    zop_je_zaverecna boolean
);


--
-- Name: zop_predlozene_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zop_predlozene_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zop_predlozene_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zop_predlozene_id_seq OWNED BY zop_predlozene.id;


--
-- Name: zop_predlozene_predfinancovanie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zop_predlozene_predfinancovanie (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zop_predlozene_id bigint NOT NULL
);


--
-- Name: zop_predlozene_predfinancovanie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zop_predlozene_predfinancovanie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zop_predlozene_predfinancovanie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zop_predlozene_predfinancovanie_id_seq OWNED BY zop_predlozene_predfinancovanie.id;


--
-- Name: zop_predlozene_predkladana_za; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zop_predlozene_predkladana_za (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zop_predlozene_id bigint NOT NULL,
    ico character varying,
    dic character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: zop_predlozene_predkladana_za_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zop_predlozene_predkladana_za_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zop_predlozene_predkladana_za_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zop_predlozene_predkladana_za_id_seq OWNED BY zop_predlozene_predkladana_za.id;


--
-- Name: zop_predlozene_prijimatel; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zop_predlozene_prijimatel (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zop_predlozene_id bigint NOT NULL,
    ico character varying,
    dic character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: zop_predlozene_prijimatel_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zop_predlozene_prijimatel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zop_predlozene_prijimatel_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zop_predlozene_prijimatel_id_seq OWNED BY zop_predlozene_prijimatel.id;


--
-- Name: zop_predlozene_projekt; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zop_predlozene_projekt (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zop_predlozene_id bigint NOT NULL
);


--
-- Name: zop_predlozene_projekt_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zop_predlozene_projekt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zop_predlozene_projekt_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zop_predlozene_projekt_id_seq OWNED BY zop_predlozene_projekt.id;


--
-- Name: zop_uhradene; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zop_uhradene (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    kod character varying,
    typ character varying,
    narokovana_suma numeric,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    datum_prijatia timestamp without time zone,
    vyplaca_sa_partnerovi boolean,
    zop_je_zaverecna boolean,
    datum_uhrady timestamp without time zone,
    schvalena_suma integer
);


--
-- Name: zop_uhradene_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zop_uhradene_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zop_uhradene_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zop_uhradene_id_seq OWNED BY zop_uhradene.id;


--
-- Name: zop_uhradene_predfinancovanie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zop_uhradene_predfinancovanie (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zop_uhradene_id bigint NOT NULL
);


--
-- Name: zop_uhradene_predfinancovanie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zop_uhradene_predfinancovanie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zop_uhradene_predfinancovanie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zop_uhradene_predfinancovanie_id_seq OWNED BY zop_uhradene_predfinancovanie.id;


--
-- Name: zop_uhradene_predkladana_za; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zop_uhradene_predkladana_za (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zop_uhradene_id bigint NOT NULL,
    ico character varying,
    dic character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: zop_uhradene_predkladana_za_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zop_uhradene_predkladana_za_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zop_uhradene_predkladana_za_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zop_uhradene_predkladana_za_id_seq OWNED BY zop_uhradene_predkladana_za.id;


--
-- Name: zop_uhradene_prijimatel; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zop_uhradene_prijimatel (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zop_uhradene_id bigint NOT NULL,
    ico character varying,
    dic character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: zop_uhradene_prijimatel_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zop_uhradene_prijimatel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zop_uhradene_prijimatel_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zop_uhradene_prijimatel_id_seq OWNED BY zop_uhradene_prijimatel.id;


--
-- Name: zop_uhradene_projekt; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zop_uhradene_projekt (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zop_uhradene_id bigint NOT NULL
);


--
-- Name: zop_uhradene_projekt_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zop_uhradene_projekt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zop_uhradene_projekt_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zop_uhradene_projekt_id_seq OWNED BY zop_uhradene_projekt.id;


--
-- Name: zop_zamietnute; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zop_zamietnute (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    kod character varying,
    typ character varying,
    narokovana_suma numeric,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    datum_prijatia timestamp without time zone,
    vyplaca_sa_partnerovi boolean,
    zop_je_zaverecna boolean
);


--
-- Name: zop_zamietnute_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zop_zamietnute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zop_zamietnute_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zop_zamietnute_id_seq OWNED BY zop_zamietnute.id;


--
-- Name: zop_zamietnute_predfinancovanie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zop_zamietnute_predfinancovanie (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zop_zamietnute_id bigint NOT NULL
);


--
-- Name: zop_zamietnute_predfinancovanie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zop_zamietnute_predfinancovanie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zop_zamietnute_predfinancovanie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zop_zamietnute_predfinancovanie_id_seq OWNED BY zop_zamietnute_predfinancovanie.id;


--
-- Name: zop_zamietnute_predkladana_za; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zop_zamietnute_predkladana_za (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zop_zamietnute_id bigint NOT NULL,
    ico character varying,
    dic character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: zop_zamietnute_predkladana_za_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zop_zamietnute_predkladana_za_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zop_zamietnute_predkladana_za_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zop_zamietnute_predkladana_za_id_seq OWNED BY zop_zamietnute_predkladana_za.id;


--
-- Name: zop_zamietnute_prijimatel; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zop_zamietnute_prijimatel (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zop_zamietnute_id bigint NOT NULL,
    ico character varying,
    dic character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: zop_zamietnute_prijimatel_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zop_zamietnute_prijimatel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zop_zamietnute_prijimatel_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zop_zamietnute_prijimatel_id_seq OWNED BY zop_zamietnute_prijimatel.id;


--
-- Name: zop_zamietnute_projekt; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zop_zamietnute_projekt (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zop_zamietnute_id bigint NOT NULL
);


--
-- Name: zop_zamietnute_projekt_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zop_zamietnute_projekt_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zop_zamietnute_projekt_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zop_zamietnute_projekt_id_seq OWNED BY zop_zamietnute_projekt.id;


SET search_path = public, pg_catalog;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


SET search_path = upvs, pg_catalog;

--
-- Name: public_authority_edesks; Type: TABLE; Schema: upvs; Owner: -
--

CREATE TABLE public_authority_edesks (
    id integer NOT NULL,
    cin bigint NOT NULL,
    uri character varying NOT NULL,
    name character varying NOT NULL,
    street character varying,
    street_number character varying,
    postal_code character varying,
    city character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: public_authority_edesks_id_seq; Type: SEQUENCE; Schema: upvs; Owner: -
--

CREATE SEQUENCE public_authority_edesks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: public_authority_edesks_id_seq; Type: SEQUENCE OWNED BY; Schema: upvs; Owner: -
--

ALTER SEQUENCE public_authority_edesks_id_seq OWNED BY public_authority_edesks.id;


SET search_path = itms, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY aktivity ALTER COLUMN id SET DEFAULT nextval('aktivity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY ciselniky ALTER COLUMN id SET DEFAULT nextval('ciselniky_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY dodavatelia ALTER COLUMN id SET DEFAULT nextval('dodavatelia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY hodnoty_ciselnikov ALTER COLUMN id SET DEFAULT nextval('hodnoty_ciselnikov_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY intenzity ALTER COLUMN id SET DEFAULT nextval('intenzity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY kody ALTER COLUMN id SET DEFAULT nextval('kody_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY konkretne_ciele ALTER COLUMN id SET DEFAULT nextval('konkretne_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY miesta_realizacie ALTER COLUMN id SET DEFAULT nextval('miesta_realizacie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY monitorovacie_terminy ALTER COLUMN id SET DEFAULT nextval('monitorovacie_terminy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti ALTER COLUMN id SET DEFAULT nextval('nezrovnalosti_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost ALTER COLUMN id SET DEFAULT nextval('nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_subjekty_ktore_zistili_nezrovnalost ALTER COLUMN id SET DEFAULT nextval('nezrovnalosti_subjekty_ktore_zistili_nezrovnalost_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie ALTER COLUMN id SET DEFAULT nextval('nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_suvisiace_nezrovnalosti ALTER COLUMN id SET DEFAULT nextval('nezrovnalosti_suvisiace_nezrovnalosti_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_suvisiace_pohladavkove_doklady ALTER COLUMN id SET DEFAULT nextval('nezrovnalosti_suvisiace_pohladavkove_doklady_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_typy_nezrovnalosti ALTER COLUMN id SET DEFAULT nextval('nezrovnalosti_typy_nezrovnalosti_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nuts_kody ALTER COLUMN id SET DEFAULT nextval('nuts_kody_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY operacne_programy ALTER COLUMN id SET DEFAULT nextval('operacne_programy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY organizacne_zlozky ALTER COLUMN id SET DEFAULT nextval('organizacne_zlozky_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY osoby ALTER COLUMN id SET DEFAULT nextval('osoby_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY pohladavkove_doklady ALTER COLUMN id SET DEFAULT nextval('pohladavkove_doklady_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY polozky_rozpoctu ALTER COLUMN id SET DEFAULT nextval('polozky_rozpoctu_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY prioritne_osi ALTER COLUMN id SET DEFAULT nextval('prioritne_osi_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projektove_ukazovatele ALTER COLUMN id SET DEFAULT nextval('projektove_ukazovatele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projektove_ukazovatele_casy_plnenia ALTER COLUMN id SET DEFAULT nextval('projektove_ukazovatele_casy_plnenia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projektove_ukazovatele_fondy ALTER COLUMN id SET DEFAULT nextval('projektove_ukazovatele_fondy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty ALTER COLUMN id SET DEFAULT nextval('projekty_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_aktivity ALTER COLUMN id SET DEFAULT nextval('projekty_aktivity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_formy_financovania ALTER COLUMN id SET DEFAULT nextval('projekty_formy_financovania_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_hospodarske_cinnosti ALTER COLUMN id SET DEFAULT nextval('projekty_hospodarske_cinnosti_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_intenzity ALTER COLUMN id SET DEFAULT nextval('projekty_intenzity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_meratelne_ukazovatele ALTER COLUMN id SET DEFAULT nextval('projekty_meratelne_ukazovatele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_miesta_realizacie ALTER COLUMN id SET DEFAULT nextval('projekty_miesta_realizacie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_miesta_realizacie_mimo_uzemia_op ALTER COLUMN id SET DEFAULT nextval('projekty_miesta_realizacie_mimo_uzemia_op_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_oblasti_intervencie ALTER COLUMN id SET DEFAULT nextval('projekty_oblasti_intervencie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_organizacne_zlozky ALTER COLUMN id SET DEFAULT nextval('projekty_organizacne_zlozky_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_partneri ALTER COLUMN id SET DEFAULT nextval('projekty_partneri_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_polozky_rozpoctu ALTER COLUMN id SET DEFAULT nextval('projekty_polozky_rozpoctu_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_sekundarne_tematicke_okruhy ALTER COLUMN id SET DEFAULT nextval('projekty_sekundarne_tematicke_okruhy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_typy_uzemia ALTER COLUMN id SET DEFAULT nextval('projekty_typy_uzemia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_uzemne_mechanizmy ALTER COLUMN id SET DEFAULT nextval('projekty_uzemne_mechanizmy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY subjekty ALTER COLUMN id SET DEFAULT nextval('subjekty_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY typy_aktivit ALTER COLUMN id SET DEFAULT nextval('typy_aktivit_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY uctovne_doklady ALTER COLUMN id SET DEFAULT nextval('uctovne_doklady_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania ALTER COLUMN id SET DEFAULT nextval('verejne_obstaravania_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik ALTER COLUMN id SET DEFAULT nextval('verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovn_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik ALTER COLUMN id SET DEFAULT nextval('verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik ALTER COLUMN id SET DEFAULT nextval('verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_operacne_programy ALTER COLUMN id SET DEFAULT nextval('verejne_obstaravania_operacne_programy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_projekty ALTER COLUMN id SET DEFAULT nextval('verejne_obstaravania_projekty_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_uctovne_doklady ALTER COLUMN id SET DEFAULT nextval('verejne_obstaravania_uctovne_doklady_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane ALTER COLUMN id SET DEFAULT nextval('vyzvy_planovane_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane_doplnujuce_info ALTER COLUMN id SET DEFAULT nextval('vyzvy_planovane_doplnujuce_info_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane_konkretne_ciele ALTER COLUMN id SET DEFAULT nextval('vyzvy_planovane_konkretne_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane_poskytovatelia ALTER COLUMN id SET DEFAULT nextval('vyzvy_planovane_poskytovatelia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene ALTER COLUMN id SET DEFAULT nextval('vyzvy_vyhlasene_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_doplnujuce_info ALTER COLUMN id SET DEFAULT nextval('vyzvy_vyhlasene_doplnujuce_info_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_fondy ALTER COLUMN id SET DEFAULT nextval('vyzvy_vyhlasene_fondy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_konkretne_ciele_typy_aktivit ALTER COLUMN id SET DEFAULT nextval('vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_kontaktne_osoby ALTER COLUMN id SET DEFAULT nextval('vyzvy_vyhlasene_kontaktne_osoby_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_poskytovatelia ALTER COLUMN id SET DEFAULT nextval('vyzvy_vyhlasene_poskytovatelia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_posudzovane_obdobia ALTER COLUMN id SET DEFAULT nextval('vyzvy_vyhlasene_posudzovane_obdobia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_vyzvy_planovane ALTER COLUMN id SET DEFAULT nextval('vyzvy_vyhlasene_vyzvy_planovane_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zdroje_intenzit ALTER COLUMN id SET DEFAULT nextval('zdroje_intenzit_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravania ALTER COLUMN id SET DEFAULT nextval('zmluvy_verejne_obstaravania_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravania_dalsie_url ALTER COLUMN id SET DEFAULT nextval('zmluvy_verejne_obstaravania_dalsie_url_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravania_dodavatelia ALTER COLUMN id SET DEFAULT nextval('zmluvy_verejne_obstaravania_dodavatelia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp ALTER COLUMN id SET DEFAULT nextval('zonfp_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate ALTER COLUMN id SET DEFAULT nextval('zonfp_prijate_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_aktivity_projekt_subjekty ALTER COLUMN id SET DEFAULT nextval('zonfp_prijate_aktivity_projekt_subjekty_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_aktivity_projekty ALTER COLUMN id SET DEFAULT nextval('zonfp_prijate_aktivity_projekty_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_formy_financovania ALTER COLUMN id SET DEFAULT nextval('zonfp_prijate_formy_financovania_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_formy_financovania_ciele ALTER COLUMN id SET DEFAULT nextval('zonfp_prijate_formy_financovania_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_hospodarske_cinnosti ALTER COLUMN id SET DEFAULT nextval('zonfp_prijate_hospodarske_cinnosti_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_hospodarske_cinnosti_ciele ALTER COLUMN id SET DEFAULT nextval('zonfp_prijate_hospodarske_cinnosti_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_meratelne_ukazovatele ALTER COLUMN id SET DEFAULT nextval('zonfp_prijate_meratelne_ukazovatele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_miesta_realizacie ALTER COLUMN id SET DEFAULT nextval('zonfp_prijate_miesta_realizacie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_miesta_realizacie_units ALTER COLUMN id SET DEFAULT nextval('zonfp_prijate_miesta_realizacie_units_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_oblasti_intervencie ALTER COLUMN id SET DEFAULT nextval('zonfp_prijate_oblasti_intervencie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_oblasti_intervencie_ciele ALTER COLUMN id SET DEFAULT nextval('zonfp_prijate_oblasti_intervencie_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_organizacne_zlozky ALTER COLUMN id SET DEFAULT nextval('zonfp_prijate_organizacne_zlozky_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_partneri ALTER COLUMN id SET DEFAULT nextval('zonfp_prijate_partneri_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_typy_uzemia ALTER COLUMN id SET DEFAULT nextval('zonfp_prijate_typy_uzemia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_typy_uzemia_ciele ALTER COLUMN id SET DEFAULT nextval('zonfp_prijate_typy_uzemia_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_uzemne_mechanizmy ALTER COLUMN id SET DEFAULT nextval('zonfp_prijate_uzemne_mechanizmy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_uzemne_mechanizmy_ciele ALTER COLUMN id SET DEFAULT nextval('zonfp_prijate_uzemne_mechanizmy_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_vyzvy ALTER COLUMN id SET DEFAULT nextval('zonfp_prijate_vyzvy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_ziadatel ALTER COLUMN id SET DEFAULT nextval('zonfp_prijate_ziadatel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene ALTER COLUMN id SET DEFAULT nextval('zonfp_schvalene_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_aktivity_projekt_subjekty ALTER COLUMN id SET DEFAULT nextval('zonfp_schvalene_aktivity_projekt_subjekty_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_aktivity_projekty ALTER COLUMN id SET DEFAULT nextval('zonfp_schvalene_aktivity_projekty_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_formy_financovania ALTER COLUMN id SET DEFAULT nextval('zonfp_schvalene_formy_financovania_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_formy_financovania_ciele ALTER COLUMN id SET DEFAULT nextval('zonfp_schvalene_formy_financovania_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_hodnotitelia ALTER COLUMN id SET DEFAULT nextval('zonfp_schvalene_hodnotitelia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_hospodarske_cinnosti ALTER COLUMN id SET DEFAULT nextval('zonfp_schvalene_hospodarske_cinnosti_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_hospodarske_cinnosti_ciele ALTER COLUMN id SET DEFAULT nextval('zonfp_schvalene_hospodarske_cinnosti_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_meratelne_ukazovatele ALTER COLUMN id SET DEFAULT nextval('zonfp_schvalene_meratelne_ukazovatele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_miesta_realizacie ALTER COLUMN id SET DEFAULT nextval('zonfp_schvalene_miesta_realizacie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_miesta_realizacie_units ALTER COLUMN id SET DEFAULT nextval('zonfp_schvalene_miesta_realizacie_units_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_oblasti_intervencie ALTER COLUMN id SET DEFAULT nextval('zonfp_schvalene_oblasti_intervencie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_oblasti_intervencie_ciele ALTER COLUMN id SET DEFAULT nextval('zonfp_schvalene_oblasti_intervencie_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_organizacne_zlozky ALTER COLUMN id SET DEFAULT nextval('zonfp_schvalene_organizacne_zlozky_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_partneri ALTER COLUMN id SET DEFAULT nextval('zonfp_schvalene_partneri_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_typy_uzemia ALTER COLUMN id SET DEFAULT nextval('zonfp_schvalene_typy_uzemia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_typy_uzemia_ciele ALTER COLUMN id SET DEFAULT nextval('zonfp_schvalene_typy_uzemia_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_uzemne_mechanizmy ALTER COLUMN id SET DEFAULT nextval('zonfp_schvalene_uzemne_mechanizmy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_uzemne_mechanizmy_ciele ALTER COLUMN id SET DEFAULT nextval('zonfp_schvalene_uzemne_mechanizmy_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_vyzvy ALTER COLUMN id SET DEFAULT nextval('zonfp_schvalene_vyzvy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_ziadatel ALTER COLUMN id SET DEFAULT nextval('zonfp_schvalene_ziadatel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute ALTER COLUMN id SET DEFAULT nextval('zonfp_zamietnute_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_aktivity_projekt_subjekty ALTER COLUMN id SET DEFAULT nextval('zonfp_zamietnute_aktivity_projekt_subjekty_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_aktivity_projekty ALTER COLUMN id SET DEFAULT nextval('zonfp_zamietnute_aktivity_projekty_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_formy_financovania ALTER COLUMN id SET DEFAULT nextval('zonfp_zamietnute_formy_financovania_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_formy_financovania_ciele ALTER COLUMN id SET DEFAULT nextval('zonfp_zamietnute_formy_financovania_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_hospodarske_cinnosti ALTER COLUMN id SET DEFAULT nextval('zonfp_zamietnute_hospodarske_cinnosti_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_hospodarske_cinnosti_ciele ALTER COLUMN id SET DEFAULT nextval('zonfp_zamietnute_hospodarske_cinnosti_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_meratelne_ukazovatele ALTER COLUMN id SET DEFAULT nextval('zonfp_zamietnute_meratelne_ukazovatele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_miesta_realizacie ALTER COLUMN id SET DEFAULT nextval('zonfp_zamietnute_miesta_realizacie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_miesta_realizacie_units ALTER COLUMN id SET DEFAULT nextval('zonfp_zamietnute_miesta_realizacie_units_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_oblasti_intervencie ALTER COLUMN id SET DEFAULT nextval('zonfp_zamietnute_oblasti_intervencie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_oblasti_intervencie_ciele ALTER COLUMN id SET DEFAULT nextval('zonfp_zamietnute_oblasti_intervencie_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_organizacne_zlozky ALTER COLUMN id SET DEFAULT nextval('zonfp_zamietnute_organizacne_zlozky_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_partneri ALTER COLUMN id SET DEFAULT nextval('zonfp_zamietnute_partneri_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_typy_uzemia ALTER COLUMN id SET DEFAULT nextval('zonfp_zamietnute_typy_uzemia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_typy_uzemia_ciele ALTER COLUMN id SET DEFAULT nextval('zonfp_zamietnute_typy_uzemia_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_uzemne_mechanizmy ALTER COLUMN id SET DEFAULT nextval('zonfp_zamietnute_uzemne_mechanizmy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_uzemne_mechanizmy_ciele ALTER COLUMN id SET DEFAULT nextval('zonfp_zamietnute_uzemne_mechanizmy_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_vysledok_konania ALTER COLUMN id SET DEFAULT nextval('zonfp_zamietnute_vysledok_konania_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_vyzvy ALTER COLUMN id SET DEFAULT nextval('zonfp_zamietnute_vyzvy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_ziadatel ALTER COLUMN id SET DEFAULT nextval('zonfp_zamietnute_ziadatel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_predlozene ALTER COLUMN id SET DEFAULT nextval('zop_predlozene_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_predlozene_predfinancovanie ALTER COLUMN id SET DEFAULT nextval('zop_predlozene_predfinancovanie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_predlozene_predkladana_za ALTER COLUMN id SET DEFAULT nextval('zop_predlozene_predkladana_za_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_predlozene_prijimatel ALTER COLUMN id SET DEFAULT nextval('zop_predlozene_prijimatel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_predlozene_projekt ALTER COLUMN id SET DEFAULT nextval('zop_predlozene_projekt_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_uhradene ALTER COLUMN id SET DEFAULT nextval('zop_uhradene_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_uhradene_predfinancovanie ALTER COLUMN id SET DEFAULT nextval('zop_uhradene_predfinancovanie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_uhradene_predkladana_za ALTER COLUMN id SET DEFAULT nextval('zop_uhradene_predkladana_za_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_uhradene_prijimatel ALTER COLUMN id SET DEFAULT nextval('zop_uhradene_prijimatel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_uhradene_projekt ALTER COLUMN id SET DEFAULT nextval('zop_uhradene_projekt_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_zamietnute ALTER COLUMN id SET DEFAULT nextval('zop_zamietnute_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_zamietnute_predfinancovanie ALTER COLUMN id SET DEFAULT nextval('zop_zamietnute_predfinancovanie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_zamietnute_predkladana_za ALTER COLUMN id SET DEFAULT nextval('zop_zamietnute_predkladana_za_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_zamietnute_prijimatel ALTER COLUMN id SET DEFAULT nextval('zop_zamietnute_prijimatel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_zamietnute_projekt ALTER COLUMN id SET DEFAULT nextval('zop_zamietnute_projekt_id_seq'::regclass);


SET search_path = upvs, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: upvs; Owner: -
--

ALTER TABLE ONLY public_authority_edesks ALTER COLUMN id SET DEFAULT nextval('public_authority_edesks_id_seq'::regclass);


SET search_path = itms, pg_catalog;

--
-- Name: aktivity_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY aktivity
    ADD CONSTRAINT aktivity_pkey PRIMARY KEY (id);


--
-- Name: ciselniky_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY ciselniky
    ADD CONSTRAINT ciselniky_pkey PRIMARY KEY (id);


--
-- Name: dodavatelia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY dodavatelia
    ADD CONSTRAINT dodavatelia_pkey PRIMARY KEY (id);


--
-- Name: hodnoty_ciselnikov_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY hodnoty_ciselnikov
    ADD CONSTRAINT hodnoty_ciselnikov_pkey PRIMARY KEY (id);


--
-- Name: intenzity_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY intenzity
    ADD CONSTRAINT intenzity_pkey PRIMARY KEY (id);


--
-- Name: kody_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY kody
    ADD CONSTRAINT kody_pkey PRIMARY KEY (id);


--
-- Name: konkretne_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY konkretne_ciele
    ADD CONSTRAINT konkretne_ciele_pkey PRIMARY KEY (id);


--
-- Name: miesta_realizacie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY miesta_realizacie
    ADD CONSTRAINT miesta_realizacie_pkey PRIMARY KEY (id);


--
-- Name: monitorovacie_terminy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY monitorovacie_terminy
    ADD CONSTRAINT monitorovacie_terminy_pkey PRIMARY KEY (id);


--
-- Name: nezrovnalosti_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti
    ADD CONSTRAINT nezrovnalosti_pkey PRIMARY KEY (id);


--
-- Name: nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost
    ADD CONSTRAINT nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost_pkey PRIMARY KEY (id);


--
-- Name: nezrovnalosti_subjekty_ktore_zistili_nezrovnalost_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_subjekty_ktore_zistili_nezrovnalost
    ADD CONSTRAINT nezrovnalosti_subjekty_ktore_zistili_nezrovnalost_pkey PRIMARY KEY (id);


--
-- Name: nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie
    ADD CONSTRAINT nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie_pkey PRIMARY KEY (id);


--
-- Name: nezrovnalosti_suvisiace_nezrovnalosti_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_suvisiace_nezrovnalosti
    ADD CONSTRAINT nezrovnalosti_suvisiace_nezrovnalosti_pkey PRIMARY KEY (id);


--
-- Name: nezrovnalosti_suvisiace_pohladavkove_doklady_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_suvisiace_pohladavkove_doklady
    ADD CONSTRAINT nezrovnalosti_suvisiace_pohladavkove_doklady_pkey PRIMARY KEY (id);


--
-- Name: nezrovnalosti_typy_nezrovnalosti_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_typy_nezrovnalosti
    ADD CONSTRAINT nezrovnalosti_typy_nezrovnalosti_pkey PRIMARY KEY (id);


--
-- Name: nuts_kody_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nuts_kody
    ADD CONSTRAINT nuts_kody_pkey PRIMARY KEY (id);


--
-- Name: operacne_programy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY operacne_programy
    ADD CONSTRAINT operacne_programy_pkey PRIMARY KEY (id);


--
-- Name: organizacne_zlozky_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY organizacne_zlozky
    ADD CONSTRAINT organizacne_zlozky_pkey PRIMARY KEY (id);


--
-- Name: osoby_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY osoby
    ADD CONSTRAINT osoby_pkey PRIMARY KEY (id);


--
-- Name: pohladavkove_doklady_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY pohladavkove_doklady
    ADD CONSTRAINT pohladavkove_doklady_pkey PRIMARY KEY (id);


--
-- Name: polozky_rozpoctu_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY polozky_rozpoctu
    ADD CONSTRAINT polozky_rozpoctu_pkey PRIMARY KEY (id);


--
-- Name: prioritne_osi_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY prioritne_osi
    ADD CONSTRAINT prioritne_osi_pkey PRIMARY KEY (id);


--
-- Name: projektove_ukazovatele_casy_plnenia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projektove_ukazovatele_casy_plnenia
    ADD CONSTRAINT projektove_ukazovatele_casy_plnenia_pkey PRIMARY KEY (id);


--
-- Name: projektove_ukazovatele_fondy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projektove_ukazovatele_fondy
    ADD CONSTRAINT projektove_ukazovatele_fondy_pkey PRIMARY KEY (id);


--
-- Name: projektove_ukazovatele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projektove_ukazovatele
    ADD CONSTRAINT projektove_ukazovatele_pkey PRIMARY KEY (id);


--
-- Name: projekty_aktivity_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_aktivity
    ADD CONSTRAINT projekty_aktivity_pkey PRIMARY KEY (id);


--
-- Name: projekty_formy_financovania_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_formy_financovania
    ADD CONSTRAINT projekty_formy_financovania_pkey PRIMARY KEY (id);


--
-- Name: projekty_hospodarske_cinnosti_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_hospodarske_cinnosti
    ADD CONSTRAINT projekty_hospodarske_cinnosti_pkey PRIMARY KEY (id);


--
-- Name: projekty_intenzity_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_intenzity
    ADD CONSTRAINT projekty_intenzity_pkey PRIMARY KEY (id);


--
-- Name: projekty_meratelne_ukazovatele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_meratelne_ukazovatele
    ADD CONSTRAINT projekty_meratelne_ukazovatele_pkey PRIMARY KEY (id);


--
-- Name: projekty_miesta_realizacie_mimo_uzemia_op_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_miesta_realizacie_mimo_uzemia_op
    ADD CONSTRAINT projekty_miesta_realizacie_mimo_uzemia_op_pkey PRIMARY KEY (id);


--
-- Name: projekty_miesta_realizacie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_miesta_realizacie
    ADD CONSTRAINT projekty_miesta_realizacie_pkey PRIMARY KEY (id);


--
-- Name: projekty_oblasti_intervencie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_oblasti_intervencie
    ADD CONSTRAINT projekty_oblasti_intervencie_pkey PRIMARY KEY (id);


--
-- Name: projekty_organizacne_zlozky_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_organizacne_zlozky
    ADD CONSTRAINT projekty_organizacne_zlozky_pkey PRIMARY KEY (id);


--
-- Name: projekty_partneri_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_partneri
    ADD CONSTRAINT projekty_partneri_pkey PRIMARY KEY (id);


--
-- Name: projekty_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty
    ADD CONSTRAINT projekty_pkey PRIMARY KEY (id);


--
-- Name: projekty_polozky_rozpoctu_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_polozky_rozpoctu
    ADD CONSTRAINT projekty_polozky_rozpoctu_pkey PRIMARY KEY (id);


--
-- Name: projekty_sekundarne_tematicke_okruhy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_sekundarne_tematicke_okruhy
    ADD CONSTRAINT projekty_sekundarne_tematicke_okruhy_pkey PRIMARY KEY (id);


--
-- Name: projekty_typy_uzemia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_typy_uzemia
    ADD CONSTRAINT projekty_typy_uzemia_pkey PRIMARY KEY (id);


--
-- Name: projekty_uzemne_mechanizmy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_uzemne_mechanizmy
    ADD CONSTRAINT projekty_uzemne_mechanizmy_pkey PRIMARY KEY (id);


--
-- Name: subjekty_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY subjekty
    ADD CONSTRAINT subjekty_pkey PRIMARY KEY (id);


--
-- Name: typy_aktivit_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY typy_aktivit
    ADD CONSTRAINT typy_aktivit_pkey PRIMARY KEY (id);


--
-- Name: uctovne_doklady_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY uctovne_doklady
    ADD CONSTRAINT uctovne_doklady_pkey PRIMARY KEY (id);


--
-- Name: verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik
    ADD CONSTRAINT verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik_pkey PRIMARY KEY (id);


--
-- Name: verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik
    ADD CONSTRAINT verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik_pkey PRIMARY KEY (id);


--
-- Name: verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik
    ADD CONSTRAINT verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik_pkey PRIMARY KEY (id);


--
-- Name: verejne_obstaravania_operacne_programy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_operacne_programy
    ADD CONSTRAINT verejne_obstaravania_operacne_programy_pkey PRIMARY KEY (id);


--
-- Name: verejne_obstaravania_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania
    ADD CONSTRAINT verejne_obstaravania_pkey PRIMARY KEY (id);


--
-- Name: verejne_obstaravania_projekty_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_projekty
    ADD CONSTRAINT verejne_obstaravania_projekty_pkey PRIMARY KEY (id);


--
-- Name: verejne_obstaravania_uctovne_doklady_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_uctovne_doklady
    ADD CONSTRAINT verejne_obstaravania_uctovne_doklady_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_planovane_doplnujuce_info_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane_doplnujuce_info
    ADD CONSTRAINT vyzvy_planovane_doplnujuce_info_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_planovane_konkretne_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane_konkretne_ciele
    ADD CONSTRAINT vyzvy_planovane_konkretne_ciele_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_planovane_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane
    ADD CONSTRAINT vyzvy_planovane_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_planovane_poskytovatelia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane_poskytovatelia
    ADD CONSTRAINT vyzvy_planovane_poskytovatelia_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_vyhlasene_doplnujuce_info_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_doplnujuce_info
    ADD CONSTRAINT vyzvy_vyhlasene_doplnujuce_info_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_vyhlasene_fondy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_fondy
    ADD CONSTRAINT vyzvy_vyhlasene_fondy_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_konkretne_ciele_typy_aktivit
    ADD CONSTRAINT vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_vyhlasene_kontaktne_osoby_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_kontaktne_osoby
    ADD CONSTRAINT vyzvy_vyhlasene_kontaktne_osoby_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_vyhlasene_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene
    ADD CONSTRAINT vyzvy_vyhlasene_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_vyhlasene_poskytovatelia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_poskytovatelia
    ADD CONSTRAINT vyzvy_vyhlasene_poskytovatelia_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_vyhlasene_posudzovane_obdobia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_posudzovane_obdobia
    ADD CONSTRAINT vyzvy_vyhlasene_posudzovane_obdobia_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_vyhlasene_vyzvy_planovane_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_vyzvy_planovane
    ADD CONSTRAINT vyzvy_vyhlasene_vyzvy_planovane_pkey PRIMARY KEY (id);


--
-- Name: zdroje_intenzit_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zdroje_intenzit
    ADD CONSTRAINT zdroje_intenzit_pkey PRIMARY KEY (id);


--
-- Name: zmluvy_verejne_obstaravania_dalsie_url_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravania_dalsie_url
    ADD CONSTRAINT zmluvy_verejne_obstaravania_dalsie_url_pkey PRIMARY KEY (id);


--
-- Name: zmluvy_verejne_obstaravania_dodavatelia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravania_dodavatelia
    ADD CONSTRAINT zmluvy_verejne_obstaravania_dodavatelia_pkey PRIMARY KEY (id);


--
-- Name: zmluvy_verejne_obstaravania_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravania
    ADD CONSTRAINT zmluvy_verejne_obstaravania_pkey PRIMARY KEY (id);


--
-- Name: zonfp_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp
    ADD CONSTRAINT zonfp_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_aktivity_projekt_subjekty_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_aktivity_projekt_subjekty
    ADD CONSTRAINT zonfp_prijate_aktivity_projekt_subjekty_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_aktivity_projekty_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_aktivity_projekty
    ADD CONSTRAINT zonfp_prijate_aktivity_projekty_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_formy_financovania_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_formy_financovania_ciele
    ADD CONSTRAINT zonfp_prijate_formy_financovania_ciele_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_formy_financovania_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_formy_financovania
    ADD CONSTRAINT zonfp_prijate_formy_financovania_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_hospodarske_cinnosti_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_hospodarske_cinnosti_ciele
    ADD CONSTRAINT zonfp_prijate_hospodarske_cinnosti_ciele_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_hospodarske_cinnosti_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_hospodarske_cinnosti
    ADD CONSTRAINT zonfp_prijate_hospodarske_cinnosti_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_meratelne_ukazovatele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_meratelne_ukazovatele
    ADD CONSTRAINT zonfp_prijate_meratelne_ukazovatele_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_miesta_realizacie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_miesta_realizacie
    ADD CONSTRAINT zonfp_prijate_miesta_realizacie_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_miesta_realizacie_units_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_miesta_realizacie_units
    ADD CONSTRAINT zonfp_prijate_miesta_realizacie_units_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_oblasti_intervencie_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_oblasti_intervencie_ciele
    ADD CONSTRAINT zonfp_prijate_oblasti_intervencie_ciele_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_oblasti_intervencie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_oblasti_intervencie
    ADD CONSTRAINT zonfp_prijate_oblasti_intervencie_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_organizacne_zlozky_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_organizacne_zlozky
    ADD CONSTRAINT zonfp_prijate_organizacne_zlozky_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_partneri_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_partneri
    ADD CONSTRAINT zonfp_prijate_partneri_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate
    ADD CONSTRAINT zonfp_prijate_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_typy_uzemia_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_typy_uzemia_ciele
    ADD CONSTRAINT zonfp_prijate_typy_uzemia_ciele_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_typy_uzemia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_typy_uzemia
    ADD CONSTRAINT zonfp_prijate_typy_uzemia_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_uzemne_mechanizmy_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_uzemne_mechanizmy_ciele
    ADD CONSTRAINT zonfp_prijate_uzemne_mechanizmy_ciele_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_uzemne_mechanizmy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_uzemne_mechanizmy
    ADD CONSTRAINT zonfp_prijate_uzemne_mechanizmy_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_vyzvy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_vyzvy
    ADD CONSTRAINT zonfp_prijate_vyzvy_pkey PRIMARY KEY (id);


--
-- Name: zonfp_prijate_ziadatel_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_ziadatel
    ADD CONSTRAINT zonfp_prijate_ziadatel_pkey PRIMARY KEY (id);


--
-- Name: zonfp_schvalene_aktivity_projekt_subjekty_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_aktivity_projekt_subjekty
    ADD CONSTRAINT zonfp_schvalene_aktivity_projekt_subjekty_pkey PRIMARY KEY (id);


--
-- Name: zonfp_schvalene_aktivity_projekty_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_aktivity_projekty
    ADD CONSTRAINT zonfp_schvalene_aktivity_projekty_pkey PRIMARY KEY (id);


--
-- Name: zonfp_schvalene_formy_financovania_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_formy_financovania_ciele
    ADD CONSTRAINT zonfp_schvalene_formy_financovania_ciele_pkey PRIMARY KEY (id);


--
-- Name: zonfp_schvalene_formy_financovania_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_formy_financovania
    ADD CONSTRAINT zonfp_schvalene_formy_financovania_pkey PRIMARY KEY (id);


--
-- Name: zonfp_schvalene_hodnotitelia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_hodnotitelia
    ADD CONSTRAINT zonfp_schvalene_hodnotitelia_pkey PRIMARY KEY (id);


--
-- Name: zonfp_schvalene_hospodarske_cinnosti_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_hospodarske_cinnosti_ciele
    ADD CONSTRAINT zonfp_schvalene_hospodarske_cinnosti_ciele_pkey PRIMARY KEY (id);


--
-- Name: zonfp_schvalene_hospodarske_cinnosti_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_hospodarske_cinnosti
    ADD CONSTRAINT zonfp_schvalene_hospodarske_cinnosti_pkey PRIMARY KEY (id);


--
-- Name: zonfp_schvalene_meratelne_ukazovatele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_meratelne_ukazovatele
    ADD CONSTRAINT zonfp_schvalene_meratelne_ukazovatele_pkey PRIMARY KEY (id);


--
-- Name: zonfp_schvalene_miesta_realizacie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_miesta_realizacie
    ADD CONSTRAINT zonfp_schvalene_miesta_realizacie_pkey PRIMARY KEY (id);


--
-- Name: zonfp_schvalene_miesta_realizacie_units_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_miesta_realizacie_units
    ADD CONSTRAINT zonfp_schvalene_miesta_realizacie_units_pkey PRIMARY KEY (id);


--
-- Name: zonfp_schvalene_oblasti_intervencie_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_oblasti_intervencie_ciele
    ADD CONSTRAINT zonfp_schvalene_oblasti_intervencie_ciele_pkey PRIMARY KEY (id);


--
-- Name: zonfp_schvalene_oblasti_intervencie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_oblasti_intervencie
    ADD CONSTRAINT zonfp_schvalene_oblasti_intervencie_pkey PRIMARY KEY (id);


--
-- Name: zonfp_schvalene_organizacne_zlozky_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_organizacne_zlozky
    ADD CONSTRAINT zonfp_schvalene_organizacne_zlozky_pkey PRIMARY KEY (id);


--
-- Name: zonfp_schvalene_partneri_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_partneri
    ADD CONSTRAINT zonfp_schvalene_partneri_pkey PRIMARY KEY (id);


--
-- Name: zonfp_schvalene_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene
    ADD CONSTRAINT zonfp_schvalene_pkey PRIMARY KEY (id);


--
-- Name: zonfp_schvalene_typy_uzemia_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_typy_uzemia_ciele
    ADD CONSTRAINT zonfp_schvalene_typy_uzemia_ciele_pkey PRIMARY KEY (id);


--
-- Name: zonfp_schvalene_typy_uzemia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_typy_uzemia
    ADD CONSTRAINT zonfp_schvalene_typy_uzemia_pkey PRIMARY KEY (id);


--
-- Name: zonfp_schvalene_uzemne_mechanizmy_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_uzemne_mechanizmy_ciele
    ADD CONSTRAINT zonfp_schvalene_uzemne_mechanizmy_ciele_pkey PRIMARY KEY (id);


--
-- Name: zonfp_schvalene_uzemne_mechanizmy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_uzemne_mechanizmy
    ADD CONSTRAINT zonfp_schvalene_uzemne_mechanizmy_pkey PRIMARY KEY (id);


--
-- Name: zonfp_schvalene_vyzvy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_vyzvy
    ADD CONSTRAINT zonfp_schvalene_vyzvy_pkey PRIMARY KEY (id);


--
-- Name: zonfp_schvalene_ziadatel_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_ziadatel
    ADD CONSTRAINT zonfp_schvalene_ziadatel_pkey PRIMARY KEY (id);


--
-- Name: zonfp_zamietnute_aktivity_projekt_subjekty_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_aktivity_projekt_subjekty
    ADD CONSTRAINT zonfp_zamietnute_aktivity_projekt_subjekty_pkey PRIMARY KEY (id);


--
-- Name: zonfp_zamietnute_aktivity_projekty_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_aktivity_projekty
    ADD CONSTRAINT zonfp_zamietnute_aktivity_projekty_pkey PRIMARY KEY (id);


--
-- Name: zonfp_zamietnute_formy_financovania_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_formy_financovania_ciele
    ADD CONSTRAINT zonfp_zamietnute_formy_financovania_ciele_pkey PRIMARY KEY (id);


--
-- Name: zonfp_zamietnute_formy_financovania_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_formy_financovania
    ADD CONSTRAINT zonfp_zamietnute_formy_financovania_pkey PRIMARY KEY (id);


--
-- Name: zonfp_zamietnute_hospodarske_cinnosti_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_hospodarske_cinnosti_ciele
    ADD CONSTRAINT zonfp_zamietnute_hospodarske_cinnosti_ciele_pkey PRIMARY KEY (id);


--
-- Name: zonfp_zamietnute_hospodarske_cinnosti_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_hospodarske_cinnosti
    ADD CONSTRAINT zonfp_zamietnute_hospodarske_cinnosti_pkey PRIMARY KEY (id);


--
-- Name: zonfp_zamietnute_meratelne_ukazovatele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_meratelne_ukazovatele
    ADD CONSTRAINT zonfp_zamietnute_meratelne_ukazovatele_pkey PRIMARY KEY (id);


--
-- Name: zonfp_zamietnute_miesta_realizacie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_miesta_realizacie
    ADD CONSTRAINT zonfp_zamietnute_miesta_realizacie_pkey PRIMARY KEY (id);


--
-- Name: zonfp_zamietnute_miesta_realizacie_units_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_miesta_realizacie_units
    ADD CONSTRAINT zonfp_zamietnute_miesta_realizacie_units_pkey PRIMARY KEY (id);


--
-- Name: zonfp_zamietnute_oblasti_intervencie_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_oblasti_intervencie_ciele
    ADD CONSTRAINT zonfp_zamietnute_oblasti_intervencie_ciele_pkey PRIMARY KEY (id);


--
-- Name: zonfp_zamietnute_oblasti_intervencie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_oblasti_intervencie
    ADD CONSTRAINT zonfp_zamietnute_oblasti_intervencie_pkey PRIMARY KEY (id);


--
-- Name: zonfp_zamietnute_organizacne_zlozky_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_organizacne_zlozky
    ADD CONSTRAINT zonfp_zamietnute_organizacne_zlozky_pkey PRIMARY KEY (id);


--
-- Name: zonfp_zamietnute_partneri_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_partneri
    ADD CONSTRAINT zonfp_zamietnute_partneri_pkey PRIMARY KEY (id);


--
-- Name: zonfp_zamietnute_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute
    ADD CONSTRAINT zonfp_zamietnute_pkey PRIMARY KEY (id);


--
-- Name: zonfp_zamietnute_typy_uzemia_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_typy_uzemia_ciele
    ADD CONSTRAINT zonfp_zamietnute_typy_uzemia_ciele_pkey PRIMARY KEY (id);


--
-- Name: zonfp_zamietnute_typy_uzemia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_typy_uzemia
    ADD CONSTRAINT zonfp_zamietnute_typy_uzemia_pkey PRIMARY KEY (id);


--
-- Name: zonfp_zamietnute_uzemne_mechanizmy_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_uzemne_mechanizmy_ciele
    ADD CONSTRAINT zonfp_zamietnute_uzemne_mechanizmy_ciele_pkey PRIMARY KEY (id);


--
-- Name: zonfp_zamietnute_uzemne_mechanizmy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_uzemne_mechanizmy
    ADD CONSTRAINT zonfp_zamietnute_uzemne_mechanizmy_pkey PRIMARY KEY (id);


--
-- Name: zonfp_zamietnute_vysledok_konania_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_vysledok_konania
    ADD CONSTRAINT zonfp_zamietnute_vysledok_konania_pkey PRIMARY KEY (id);


--
-- Name: zonfp_zamietnute_vyzvy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_vyzvy
    ADD CONSTRAINT zonfp_zamietnute_vyzvy_pkey PRIMARY KEY (id);


--
-- Name: zonfp_zamietnute_ziadatel_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_ziadatel
    ADD CONSTRAINT zonfp_zamietnute_ziadatel_pkey PRIMARY KEY (id);


--
-- Name: zop_predlozene_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_predlozene
    ADD CONSTRAINT zop_predlozene_pkey PRIMARY KEY (id);


--
-- Name: zop_predlozene_predfinancovanie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_predlozene_predfinancovanie
    ADD CONSTRAINT zop_predlozene_predfinancovanie_pkey PRIMARY KEY (id);


--
-- Name: zop_predlozene_predkladana_za_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_predlozene_predkladana_za
    ADD CONSTRAINT zop_predlozene_predkladana_za_pkey PRIMARY KEY (id);


--
-- Name: zop_predlozene_prijimatel_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_predlozene_prijimatel
    ADD CONSTRAINT zop_predlozene_prijimatel_pkey PRIMARY KEY (id);


--
-- Name: zop_predlozene_projekt_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_predlozene_projekt
    ADD CONSTRAINT zop_predlozene_projekt_pkey PRIMARY KEY (id);


--
-- Name: zop_uhradene_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_uhradene
    ADD CONSTRAINT zop_uhradene_pkey PRIMARY KEY (id);


--
-- Name: zop_uhradene_predfinancovanie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_uhradene_predfinancovanie
    ADD CONSTRAINT zop_uhradene_predfinancovanie_pkey PRIMARY KEY (id);


--
-- Name: zop_uhradene_predkladana_za_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_uhradene_predkladana_za
    ADD CONSTRAINT zop_uhradene_predkladana_za_pkey PRIMARY KEY (id);


--
-- Name: zop_uhradene_prijimatel_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_uhradene_prijimatel
    ADD CONSTRAINT zop_uhradene_prijimatel_pkey PRIMARY KEY (id);


--
-- Name: zop_uhradene_projekt_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_uhradene_projekt
    ADD CONSTRAINT zop_uhradene_projekt_pkey PRIMARY KEY (id);


--
-- Name: zop_zamietnute_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_zamietnute
    ADD CONSTRAINT zop_zamietnute_pkey PRIMARY KEY (id);


--
-- Name: zop_zamietnute_predfinancovanie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_zamietnute_predfinancovanie
    ADD CONSTRAINT zop_zamietnute_predfinancovanie_pkey PRIMARY KEY (id);


--
-- Name: zop_zamietnute_predkladana_za_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_zamietnute_predkladana_za
    ADD CONSTRAINT zop_zamietnute_predkladana_za_pkey PRIMARY KEY (id);


--
-- Name: zop_zamietnute_prijimatel_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_zamietnute_prijimatel
    ADD CONSTRAINT zop_zamietnute_prijimatel_pkey PRIMARY KEY (id);


--
-- Name: zop_zamietnute_projekt_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_zamietnute_projekt
    ADD CONSTRAINT zop_zamietnute_projekt_pkey PRIMARY KEY (id);


SET search_path = public, pg_catalog;

--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


SET search_path = upvs, pg_catalog;

--
-- Name: public_authority_edesks_pkey; Type: CONSTRAINT; Schema: upvs; Owner: -
--

ALTER TABLE ONLY public_authority_edesks
    ADD CONSTRAINT public_authority_edesks_pkey PRIMARY KEY (id);


SET search_path = itms, pg_catalog;

--
-- Name: index_itms.aktivity_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.aktivity_on_itms_id" ON aktivity USING btree (itms_id);


--
-- Name: index_itms.aktivity_on_subjekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.aktivity_on_subjekt_id" ON aktivity USING btree (subjekt_id);


--
-- Name: index_itms.aktivity_on_typ_aktivity_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.aktivity_on_typ_aktivity_id" ON aktivity USING btree (typ_aktivity_id);


--
-- Name: index_itms.ciselniky_on_ciselnik_kod; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.ciselniky_on_ciselnik_kod" ON ciselniky USING btree (ciselnik_kod);


--
-- Name: index_itms.dodavatelia_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.dodavatelia_on_itms_id" ON dodavatelia USING btree (itms_id);


--
-- Name: index_itms.dodavatelia_on_obec_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.dodavatelia_on_obec_id" ON dodavatelia USING btree (obec_id);


--
-- Name: index_itms.dodavatelia_on_stat_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.dodavatelia_on_stat_id" ON dodavatelia USING btree (stat_id);


--
-- Name: index_itms.dodavatelia_on_typ_ineho_identifikacneho_cisla_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.dodavatelia_on_typ_ineho_identifikacneho_cisla_id" ON dodavatelia USING btree (typ_ineho_identifikacneho_cisla_id);


--
-- Name: index_itms.hodnoty_ciselnikov_on_ciselnik_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.hodnoty_ciselnikov_on_ciselnik_id" ON hodnoty_ciselnikov USING btree (ciselnik_id);


--
-- Name: index_itms.hodnoty_ciselnikov_on_ciselnik_id_and_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.hodnoty_ciselnikov_on_ciselnik_id_and_itms_id" ON hodnoty_ciselnikov USING btree (ciselnik_id, itms_id);


--
-- Name: index_itms.hodnoty_ciselnikov_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.hodnoty_ciselnikov_on_itms_id" ON hodnoty_ciselnikov USING btree (itms_id);


--
-- Name: index_itms.intenzity_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.intenzity_on_itms_id" ON intenzity USING btree (itms_id);


--
-- Name: index_itms.intenzity_on_subjekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.intenzity_on_subjekt_id" ON intenzity USING btree (subjekt_id);


--
-- Name: index_itms.intenzity_on_zdroj_eu_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.intenzity_on_zdroj_eu_id" ON intenzity USING btree (zdroj_eu_id);


--
-- Name: index_itms.intenzity_on_zdroj_pr_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.intenzity_on_zdroj_pr_id" ON intenzity USING btree (zdroj_pr_id);


--
-- Name: index_itms.intenzity_on_zdroj_sr_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.intenzity_on_zdroj_sr_id" ON intenzity USING btree (zdroj_sr_id);


--
-- Name: index_itms.intenzity_on_zdroj_vz_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.intenzity_on_zdroj_vz_id" ON intenzity USING btree (zdroj_vz_id);


--
-- Name: index_itms.intenzity_on_zdroj_yei_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.intenzity_on_zdroj_yei_id" ON intenzity USING btree (zdroj_yei_id);


--
-- Name: index_itms.konkretne_ciele_on_fond_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.konkretne_ciele_on_fond_id" ON konkretne_ciele USING btree (fond_id);


--
-- Name: index_itms.konkretne_ciele_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.konkretne_ciele_on_itms_id" ON konkretne_ciele USING btree (itms_id);


--
-- Name: index_itms.miesta_realizacie_on_nuts_3_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.miesta_realizacie_on_nuts_3_id" ON miesta_realizacie USING btree (nuts_3_id);


--
-- Name: index_itms.miesta_realizacie_on_nuts_4_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.miesta_realizacie_on_nuts_4_id" ON miesta_realizacie USING btree (nuts_4_id);


--
-- Name: index_itms.miesta_realizacie_on_nuts_5_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.miesta_realizacie_on_nuts_5_id" ON miesta_realizacie USING btree (nuts_5_id);


--
-- Name: index_itms.miesta_realizacie_on_stat_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.miesta_realizacie_on_stat_id" ON miesta_realizacie USING btree (stat_id);


--
-- Name: index_itms.monitorovacie_terminy_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.monitorovacie_terminy_on_projekt_id" ON monitorovacie_terminy USING btree (projekt_id);


--
-- Name: index_itms.nezrovnalosti_on_administrativny_stav_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_on_administrativny_stav_id" ON nezrovnalosti USING btree (administrativny_stav_id);


--
-- Name: index_itms.nezrovnalosti_on_dlznik_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_on_dlznik_id" ON nezrovnalosti USING btree (dlznik_id);


--
-- Name: index_itms.nezrovnalosti_on_financny_stav_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_on_financny_stav_id" ON nezrovnalosti USING btree (financny_stav_id);


--
-- Name: index_itms.nezrovnalosti_on_hlavny_typ_nezrovnalosti_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_on_hlavny_typ_nezrovnalosti_id" ON nezrovnalosti USING btree (hlavny_typ_nezrovnalosti_id);


--
-- Name: index_itms.nezrovnalosti_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.nezrovnalosti_on_itms_id" ON nezrovnalosti USING btree (itms_id);


--
-- Name: index_itms.nezrovnalosti_on_konkretny_ciel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_on_konkretny_ciel_id" ON nezrovnalosti USING btree (konkretny_ciel_id);


--
-- Name: index_itms.nezrovnalosti_on_operacny_program_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_on_operacny_program_id" ON nezrovnalosti USING btree (operacny_program_id);


--
-- Name: index_itms.nezrovnalosti_on_prioritna_os_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_on_prioritna_os_id" ON nezrovnalosti USING btree (prioritna_os_id);


--
-- Name: index_itms.nezrovnalosti_pohladavkove_doklady_doklad; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_pohladavkove_doklady_doklad" ON nezrovnalosti_suvisiace_pohladavkove_doklady USING btree (pohladavkovy_doklad_id);


--
-- Name: index_itms.nezrovnalosti_pohladavkove_doklady_nezrovnalost; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_pohladavkove_doklady_nezrovnalost" ON nezrovnalosti_suvisiace_pohladavkove_doklady USING btree (nezrovnalost_id);


--
-- Name: index_itms.nezrovnalosti_subjekty_sposobili_nezrovnalosti; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_subjekty_sposobili_nezrovnalosti" ON nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost USING btree (nezrovnalost_id);


--
-- Name: index_itms.nezrovnalosti_subjekty_sposobili_subjekty; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_subjekty_sposobili_subjekty" ON nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost USING btree (subjekt_id);


--
-- Name: index_itms.nezrovnalosti_subjekty_zistili_nezrovnalost; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_subjekty_zistili_nezrovnalost" ON nezrovnalosti_subjekty_ktore_zistili_nezrovnalost USING btree (nezrovnalost_id);


--
-- Name: index_itms.nezrovnalosti_subjekty_zistili_subjekty; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_subjekty_zistili_subjekty" ON nezrovnalosti_subjekty_ktore_zistili_nezrovnalost USING btree (subjekt_id);


--
-- Name: index_itms.nezrovnalosti_subjekty_zodpovedne_nezrovnalosti; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_subjekty_zodpovedne_nezrovnalosti" ON nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie USING btree (nezrovnalost_id);


--
-- Name: index_itms.nezrovnalosti_subjekty_zodpovedne_subjekty; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_subjekty_zodpovedne_subjekty" ON nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie USING btree (subjekt_id);


--
-- Name: index_itms.nezrovnalosti_suvisiace_nezrovnalosti_nezrovnalost; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_suvisiace_nezrovnalosti_nezrovnalost" ON nezrovnalosti_suvisiace_nezrovnalosti USING btree (nezrovnalost_id);


--
-- Name: index_itms.nezrovnalosti_suvisiace_nezrovnalosti_suvisiaca; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_suvisiace_nezrovnalosti_suvisiaca" ON nezrovnalosti_suvisiace_nezrovnalosti USING btree (suvisiaca_nezrovnalost_id);


--
-- Name: index_itms.nezrovnalosti_typy_nezrovnalosti_on_kod_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_typy_nezrovnalosti_on_kod_id" ON nezrovnalosti_typy_nezrovnalosti USING btree (kod_id);


--
-- Name: index_itms.nezrovnalosti_typy_nezrovnalosti_on_nezrovnalost_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nezrovnalosti_typy_nezrovnalosti_on_nezrovnalost_id" ON nezrovnalosti_typy_nezrovnalosti USING btree (nezrovnalost_id);


--
-- Name: index_itms.nuts_kody_on_hodnota_nuts_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.nuts_kody_on_hodnota_nuts_id" ON nuts_kody USING btree (hodnota_nuts_id);


--
-- Name: index_itms.operacne_programy_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.operacne_programy_on_itms_id" ON operacne_programy USING btree (itms_id);


--
-- Name: index_itms.operacne_programy_on_subjekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.operacne_programy_on_subjekt_id" ON operacne_programy USING btree (subjekt_id);


--
-- Name: index_itms.organizacne_zlozky_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.organizacne_zlozky_on_itms_id" ON organizacne_zlozky USING btree (itms_id);


--
-- Name: index_itms.osoby_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.osoby_on_itms_id" ON osoby USING btree (itms_id);


--
-- Name: index_itms.pohladavkove_doklady_on_dlznik_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.pohladavkove_doklady_on_dlznik_id" ON pohladavkove_doklady USING btree (dlznik_id);


--
-- Name: index_itms.pohladavkove_doklady_on_dovod_vratenia_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.pohladavkove_doklady_on_dovod_vratenia_id" ON pohladavkove_doklady USING btree (dovod_vratenia_id);


--
-- Name: index_itms.pohladavkove_doklady_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.pohladavkove_doklady_on_itms_id" ON pohladavkove_doklady USING btree (itms_id);


--
-- Name: index_itms.pohladavkove_doklady_on_konkretny_ciel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.pohladavkove_doklady_on_konkretny_ciel_id" ON pohladavkove_doklady USING btree (konkretny_ciel_id);


--
-- Name: index_itms.pohladavkove_doklady_on_nezrovnalost_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.pohladavkove_doklady_on_nezrovnalost_id" ON pohladavkove_doklady USING btree (nezrovnalost_id);


--
-- Name: index_itms.pohladavkove_doklady_on_prioritna_os_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.pohladavkove_doklady_on_prioritna_os_id" ON pohladavkove_doklady USING btree (prioritna_os_id);


--
-- Name: index_itms.pohladavkove_doklady_on_zodpovedny_subjekt; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.pohladavkove_doklady_on_zodpovedny_subjekt" ON pohladavkove_doklady USING btree (subjekt_zodpovedny_za_vymahanie_id);


--
-- Name: index_itms.polozky_rozpoctu_on_aktivita_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.polozky_rozpoctu_on_aktivita_id" ON polozky_rozpoctu USING btree (aktivita_id);


--
-- Name: index_itms.polozky_rozpoctu_on_intenzita_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.polozky_rozpoctu_on_intenzita_id" ON polozky_rozpoctu USING btree (intenzita_id);


--
-- Name: index_itms.polozky_rozpoctu_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.polozky_rozpoctu_on_itms_id" ON polozky_rozpoctu USING btree (itms_id);


--
-- Name: index_itms.polozky_rozpoctu_on_skupina_vydavkov_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.polozky_rozpoctu_on_skupina_vydavkov_id" ON polozky_rozpoctu USING btree (skupina_vydavkov_id);


--
-- Name: index_itms.polozky_rozpoctu_on_subjekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.polozky_rozpoctu_on_subjekt_id" ON polozky_rozpoctu USING btree (subjekt_id);


--
-- Name: index_itms.prioritne_osi_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.prioritne_osi_on_itms_id" ON prioritne_osi USING btree (itms_id);


--
-- Name: index_itms.prioritne_osi_on_operacny_program_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.prioritne_osi_on_operacny_program_id" ON prioritne_osi USING btree (operacny_program_id);


--
-- Name: index_itms.projektove_ukazovatele_casy_plnenia_cas; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projektove_ukazovatele_casy_plnenia_cas" ON projektove_ukazovatele_casy_plnenia USING btree (kod_id);


--
-- Name: index_itms.projektove_ukazovatele_casy_plnenia_ukazovatel; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projektove_ukazovatele_casy_plnenia_ukazovatel" ON projektove_ukazovatele_casy_plnenia USING btree (projektovy_ukazovatel_id);


--
-- Name: index_itms.projektove_ukazovatele_fondy_fond; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projektove_ukazovatele_fondy_fond" ON projektove_ukazovatele_fondy USING btree (kod_id);


--
-- Name: index_itms.projektove_ukazovatele_fondy_ukazovatel; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projektove_ukazovatele_fondy_ukazovatel" ON projektove_ukazovatele_fondy USING btree (projektovy_ukazovatel_id);


--
-- Name: index_itms.projektove_ukazovatele_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projektove_ukazovatele_on_itms_id" ON projektove_ukazovatele USING btree (itms_id);


--
-- Name: index_itms.projekty_aktivity_on_aktivita_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_aktivity_on_aktivita_id" ON projekty_aktivity USING btree (aktivita_id);


--
-- Name: index_itms.projekty_aktivity_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_aktivity_on_projekt_id" ON projekty_aktivity USING btree (projekt_id);


--
-- Name: index_itms.projekty_formy_financovania_on_hodnota_ciselnika_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_formy_financovania_on_hodnota_ciselnika_id" ON projekty_formy_financovania USING btree (hodnota_ciselnika_id);


--
-- Name: index_itms.projekty_formy_financovania_on_konkretny_ciel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_formy_financovania_on_konkretny_ciel_id" ON projekty_formy_financovania USING btree (konkretny_ciel_id);


--
-- Name: index_itms.projekty_formy_financovania_on_p_kc_hc; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projekty_formy_financovania_on_p_kc_hc" ON projekty_formy_financovania USING btree (projekt_id, konkretny_ciel_id, hodnota_ciselnika_id);


--
-- Name: index_itms.projekty_formy_financovania_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_formy_financovania_on_projekt_id" ON projekty_formy_financovania USING btree (projekt_id);


--
-- Name: index_itms.projekty_hosp_cinnosti_on_p_kc_hc; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projekty_hosp_cinnosti_on_p_kc_hc" ON projekty_hospodarske_cinnosti USING btree (projekt_id, konkretny_ciel_id, hodnota_ciselnika_id);


--
-- Name: index_itms.projekty_hospodarske_cinnosti_on_hc; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_hospodarske_cinnosti_on_hc" ON projekty_hospodarske_cinnosti USING btree (hodnota_ciselnika_id);


--
-- Name: index_itms.projekty_hospodarske_cinnosti_on_konkretny_ciel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_hospodarske_cinnosti_on_konkretny_ciel_id" ON projekty_hospodarske_cinnosti USING btree (konkretny_ciel_id);


--
-- Name: index_itms.projekty_hospodarske_cinnosti_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_hospodarske_cinnosti_on_projekt_id" ON projekty_hospodarske_cinnosti USING btree (projekt_id);


--
-- Name: index_itms.projekty_intenzity_on_intenzita_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_intenzity_on_intenzita_id" ON projekty_intenzity USING btree (intenzita_id);


--
-- Name: index_itms.projekty_intenzity_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_intenzity_on_projekt_id" ON projekty_intenzity USING btree (projekt_id);


--
-- Name: index_itms.projekty_intenzity_on_projekt_id_and_intenzita_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projekty_intenzity_on_projekt_id_and_intenzita_id" ON projekty_intenzity USING btree (projekt_id, intenzita_id);


--
-- Name: index_itms.projekty_meratelne_ukazovatele_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_meratelne_ukazovatele_on_projekt_id" ON projekty_meratelne_ukazovatele USING btree (projekt_id);


--
-- Name: index_itms.projekty_meratelne_ukazovatele_on_projekt_ukazovatel; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projekty_meratelne_ukazovatele_on_projekt_ukazovatel" ON projekty_meratelne_ukazovatele USING btree (projekt_id, projektovy_ukazovatel_id);


--
-- Name: index_itms.projekty_meratelne_ukazovatele_on_ukazovatel; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_meratelne_ukazovatele_on_ukazovatel" ON projekty_meratelne_ukazovatele USING btree (projektovy_ukazovatel_id);


--
-- Name: index_itms.projekty_miesta_realizacie_mimo_uzemia_op_on_miesto; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_miesta_realizacie_mimo_uzemia_op_on_miesto" ON projekty_miesta_realizacie_mimo_uzemia_op USING btree (miesto_realizacie_id);


--
-- Name: index_itms.projekty_miesta_realizacie_mimo_uzemia_op_on_projekt; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_miesta_realizacie_mimo_uzemia_op_on_projekt" ON projekty_miesta_realizacie_mimo_uzemia_op USING btree (projekt_id);


--
-- Name: index_itms.projekty_miesta_realizacie_on_miesto_realizacie_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_miesta_realizacie_on_miesto_realizacie_id" ON projekty_miesta_realizacie USING btree (miesto_realizacie_id);


--
-- Name: index_itms.projekty_miesta_realizacie_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_miesta_realizacie_on_projekt_id" ON projekty_miesta_realizacie USING btree (projekt_id);


--
-- Name: index_itms.projekty_oblasti_intervencie_on_hodnota_ciselnika_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_oblasti_intervencie_on_hodnota_ciselnika_id" ON projekty_oblasti_intervencie USING btree (hodnota_ciselnika_id);


--
-- Name: index_itms.projekty_oblasti_intervencie_on_konkretny_ciel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_oblasti_intervencie_on_konkretny_ciel_id" ON projekty_oblasti_intervencie USING btree (konkretny_ciel_id);


--
-- Name: index_itms.projekty_oblasti_intervencie_on_p_kc_hc; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projekty_oblasti_intervencie_on_p_kc_hc" ON projekty_oblasti_intervencie USING btree (projekt_id, konkretny_ciel_id, hodnota_ciselnika_id);


--
-- Name: index_itms.projekty_oblasti_intervencie_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_oblasti_intervencie_on_projekt_id" ON projekty_oblasti_intervencie USING btree (projekt_id);


--
-- Name: index_itms.projekty_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projekty_on_itms_id" ON projekty USING btree (itms_id);


--
-- Name: index_itms.projekty_on_prijimatel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_on_prijimatel_id" ON projekty USING btree (prijimatel_id);


--
-- Name: index_itms.projekty_on_schvalena_zonfp_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_on_schvalena_zonfp_id" ON projekty USING btree (schvalena_zonfp_id);


--
-- Name: index_itms.projekty_on_vyzva_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_on_vyzva_id" ON projekty USING btree (vyzva_id);


--
-- Name: index_itms.projekty_organizacne_zlozky_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_organizacne_zlozky_on_projekt_id" ON projekty_organizacne_zlozky USING btree (projekt_id);


--
-- Name: index_itms.projekty_organizacne_zlozky_on_zlozka; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_organizacne_zlozky_on_zlozka" ON projekty_organizacne_zlozky USING btree (organizacna_zlozka_id);


--
-- Name: index_itms.projekty_partneri_on_partner_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_partneri_on_partner_id" ON projekty_partneri USING btree (partner_id);


--
-- Name: index_itms.projekty_partneri_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_partneri_on_projekt_id" ON projekty_partneri USING btree (projekt_id);


--
-- Name: index_itms.projekty_partneri_on_projekt_id_and_partner_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projekty_partneri_on_projekt_id_and_partner_id" ON projekty_partneri USING btree (projekt_id, partner_id);


--
-- Name: index_itms.projekty_polozky_rozpoctu_on_p_and_pr; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projekty_polozky_rozpoctu_on_p_and_pr" ON projekty_polozky_rozpoctu USING btree (projekt_id, polozka_rozpoctu_id);


--
-- Name: index_itms.projekty_polozky_rozpoctu_on_polozka_rozpoctu_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_polozky_rozpoctu_on_polozka_rozpoctu_id" ON projekty_polozky_rozpoctu USING btree (polozka_rozpoctu_id);


--
-- Name: index_itms.projekty_polozky_rozpoctu_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_polozky_rozpoctu_on_projekt_id" ON projekty_polozky_rozpoctu USING btree (projekt_id);


--
-- Name: index_itms.projekty_sekundarne_tematicke_okruhy_on_hc; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_sekundarne_tematicke_okruhy_on_hc" ON projekty_sekundarne_tematicke_okruhy USING btree (hodnota_ciselnika_id);


--
-- Name: index_itms.projekty_sekundarne_tematicke_okruhy_on_kc; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_sekundarne_tematicke_okruhy_on_kc" ON projekty_sekundarne_tematicke_okruhy USING btree (konkretny_ciel_id);


--
-- Name: index_itms.projekty_sekundarne_tematicke_okruhy_on_p_kc_hc; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projekty_sekundarne_tematicke_okruhy_on_p_kc_hc" ON projekty_sekundarne_tematicke_okruhy USING btree (projekt_id, konkretny_ciel_id, hodnota_ciselnika_id);


--
-- Name: index_itms.projekty_sekundarne_tematicke_okruhy_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_sekundarne_tematicke_okruhy_on_projekt_id" ON projekty_sekundarne_tematicke_okruhy USING btree (projekt_id);


--
-- Name: index_itms.projekty_typy_uzemia_on_hodnota_ciselnika_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_typy_uzemia_on_hodnota_ciselnika_id" ON projekty_typy_uzemia USING btree (hodnota_ciselnika_id);


--
-- Name: index_itms.projekty_typy_uzemia_on_konkretny_ciel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_typy_uzemia_on_konkretny_ciel_id" ON projekty_typy_uzemia USING btree (konkretny_ciel_id);


--
-- Name: index_itms.projekty_typy_uzemia_on_p_kc_hc; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projekty_typy_uzemia_on_p_kc_hc" ON projekty_typy_uzemia USING btree (projekt_id, konkretny_ciel_id, hodnota_ciselnika_id);


--
-- Name: index_itms.projekty_typy_uzemia_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_typy_uzemia_on_projekt_id" ON projekty_typy_uzemia USING btree (projekt_id);


--
-- Name: index_itms.projekty_uzemne_mechanizmy_on_hodnota_ciselnika_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_uzemne_mechanizmy_on_hodnota_ciselnika_id" ON projekty_uzemne_mechanizmy USING btree (hodnota_ciselnika_id);


--
-- Name: index_itms.projekty_uzemne_mechanizmy_on_konkretny_ciel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_uzemne_mechanizmy_on_konkretny_ciel_id" ON projekty_uzemne_mechanizmy USING btree (konkretny_ciel_id);


--
-- Name: index_itms.projekty_uzemne_mechanizmy_on_p_kc_hc; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projekty_uzemne_mechanizmy_on_p_kc_hc" ON projekty_uzemne_mechanizmy USING btree (projekt_id, konkretny_ciel_id, hodnota_ciselnika_id);


--
-- Name: index_itms.projekty_uzemne_mechanizmy_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_uzemne_mechanizmy_on_projekt_id" ON projekty_uzemne_mechanizmy USING btree (projekt_id);


--
-- Name: index_itms.subjekty_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.subjekty_on_itms_id" ON subjekty USING btree (itms_id);


--
-- Name: index_itms.subjekty_on_obec_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.subjekty_on_obec_id" ON subjekty USING btree (obec_id);


--
-- Name: index_itms.subjekty_on_stat_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.subjekty_on_stat_id" ON subjekty USING btree (stat_id);


--
-- Name: index_itms.subjekty_on_typ_ineho_identifikacneho_cisla_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.subjekty_on_typ_ineho_identifikacneho_cisla_id" ON subjekty USING btree (typ_ineho_identifikacneho_cisla_id);


--
-- Name: index_itms.typy_aktivit_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.typy_aktivit_on_itms_id" ON typy_aktivit USING btree (itms_id);


--
-- Name: index_itms.uctovne_doklady_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.uctovne_doklady_on_itms_id" ON uctovne_doklady USING btree (itms_id);


--
-- Name: index_itms.verejne_obstaravania_on_druh_zakazky_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.verejne_obstaravania_on_druh_zakazky_id" ON verejne_obstaravania USING btree (druh_zakazky_id);


--
-- Name: index_itms.verejne_obstaravania_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.verejne_obstaravania_on_itms_id" ON verejne_obstaravania USING btree (itms_id);


--
-- Name: index_itms.verejne_obstaravania_on_metoda_vo_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.verejne_obstaravania_on_metoda_vo_id" ON verejne_obstaravania USING btree (metoda_vo_id);


--
-- Name: index_itms.verejne_obstaravania_on_obstaravatel_subjekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.verejne_obstaravania_on_obstaravatel_subjekt_id" ON verejne_obstaravania USING btree (obstaravatel_subjekt_id);


--
-- Name: index_itms.verejne_obstaravania_on_postup_obstaravania_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.verejne_obstaravania_on_postup_obstaravania_id" ON verejne_obstaravania USING btree (postup_obstaravania_id);


--
-- Name: index_itms.verejne_obstaravania_on_zadavatel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.verejne_obstaravania_on_zadavatel_id" ON verejne_obstaravania USING btree (zadavatel_id);


--
-- Name: index_itms.verejne_obstaravania_operacne_programy_on_op; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.verejne_obstaravania_operacne_programy_on_op" ON verejne_obstaravania_operacne_programy USING btree (operacny_program_id);


--
-- Name: index_itms.verejne_obstaravania_operacne_programy_on_vo; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.verejne_obstaravania_operacne_programy_on_vo" ON verejne_obstaravania_operacne_programy USING btree (verejne_obstaravanie_id);


--
-- Name: index_itms.verejne_obstaravania_operacne_programy_on_vo_and_op; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.verejne_obstaravania_operacne_programy_on_vo_and_op" ON verejne_obstaravania_operacne_programy USING btree (verejne_obstaravanie_id, operacny_program_id);


--
-- Name: index_itms.verejne_obstaravania_projekty_on_p; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.verejne_obstaravania_projekty_on_p" ON verejne_obstaravania_projekty USING btree (projekt_id);


--
-- Name: index_itms.verejne_obstaravania_projekty_on_vo; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.verejne_obstaravania_projekty_on_vo" ON verejne_obstaravania_projekty USING btree (verejne_obstaravanie_id);


--
-- Name: index_itms.verejne_obstaravania_projekty_on_vo_and_p; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.verejne_obstaravania_projekty_on_vo_and_p" ON verejne_obstaravania_projekty USING btree (verejne_obstaravanie_id, projekt_id);


--
-- Name: index_itms.verejne_obstaravania_uctovne_doklady_on_ud; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.verejne_obstaravania_uctovne_doklady_on_ud" ON verejne_obstaravania_uctovne_doklady USING btree (uctovny_doklad_id);


--
-- Name: index_itms.verejne_obstaravania_uctovne_doklady_on_vo; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.verejne_obstaravania_uctovne_doklady_on_vo" ON verejne_obstaravania_uctovne_doklady USING btree (verejne_obstaravanie_id);


--
-- Name: index_itms.verejne_obstaravania_uctovne_doklady_on_vo_and_ud; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.verejne_obstaravania_uctovne_doklady_on_vo_and_ud" ON verejne_obstaravania_uctovne_doklady USING btree (verejne_obstaravanie_id, uctovny_doklad_id);


--
-- Name: index_itms.vo_doplnujuce_predmety_doplnkovy_slovnik_predmet; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vo_doplnujuce_predmety_doplnkovy_slovnik_predmet" ON verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik USING btree (predmet_id);


--
-- Name: index_itms.vo_doplnujuce_predmety_doplnkovy_slovnik_vo; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vo_doplnujuce_predmety_doplnkovy_slovnik_vo" ON verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik USING btree (verejne_obstaravanie_id);


--
-- Name: index_itms.vo_doplnujuce_predmety_doplnkovy_slovnik_vo_predmet; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.vo_doplnujuce_predmety_doplnkovy_slovnik_vo_predmet" ON verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik USING btree (verejne_obstaravanie_id, predmet_id);


--
-- Name: index_itms.vo_doplnujuce_predmety_hlavny_slovnik_predmet; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vo_doplnujuce_predmety_hlavny_slovnik_predmet" ON verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik USING btree (predmet_id);


--
-- Name: index_itms.vo_doplnujuce_predmety_hlavny_slovnik_vo; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vo_doplnujuce_predmety_hlavny_slovnik_vo" ON verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik USING btree (verejne_obstaravanie_id);


--
-- Name: index_itms.vo_doplnujuce_predmety_hlavny_slovnik_vo_predmet; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.vo_doplnujuce_predmety_hlavny_slovnik_vo_predmet" ON verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik USING btree (verejne_obstaravanie_id, predmet_id);


--
-- Name: index_itms.vo_hlavne_predmety_doplnkovy_slovnik_predmet; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vo_hlavne_predmety_doplnkovy_slovnik_predmet" ON verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik USING btree (predmet_id);


--
-- Name: index_itms.vo_hlavne_predmety_doplnkovy_slovnik_vo; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vo_hlavne_predmety_doplnkovy_slovnik_vo" ON verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik USING btree (verejne_obstaravanie_id);


--
-- Name: index_itms.vo_hlavne_predmety_doplnkovy_slovnik_vo_predmet; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.vo_hlavne_predmety_doplnkovy_slovnik_vo_predmet" ON verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik USING btree (verejne_obstaravanie_id, predmet_id);


--
-- Name: index_itms.vo_on_hlavny_predmet_hlavny_slovnik; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vo_on_hlavny_predmet_hlavny_slovnik" ON verejne_obstaravania USING btree (hlavny_predmet_hlavny_slovnik_id);


--
-- Name: index_itms.vo_on_obstaravatel_dodavatel_obstaravatel; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vo_on_obstaravatel_dodavatel_obstaravatel" ON verejne_obstaravania USING btree (obstaravatel_dodavatel_obstaravatel_id);


--
-- Name: index_itms.vyzvy_planovane_doplnujuce_info_on_vyzva_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_planovane_doplnujuce_info_on_vyzva_id" ON vyzvy_planovane_doplnujuce_info USING btree (vyzva_id);


--
-- Name: index_itms.vyzvy_planovane_konkretne_ciele_on_konkretny_ciel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_planovane_konkretne_ciele_on_konkretny_ciel_id" ON vyzvy_planovane_konkretne_ciele USING btree (konkretny_ciel_id);


--
-- Name: index_itms.vyzvy_planovane_konkretne_ciele_on_vyzva_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_planovane_konkretne_ciele_on_vyzva_id" ON vyzvy_planovane_konkretne_ciele USING btree (vyzva_id);


--
-- Name: index_itms.vyzvy_planovane_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.vyzvy_planovane_on_itms_id" ON vyzvy_planovane USING btree (itms_id);


--
-- Name: index_itms.vyzvy_planovane_on_vyhlasovatel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_planovane_on_vyhlasovatel_id" ON vyzvy_planovane USING btree (vyhlasovatel_id);


--
-- Name: index_itms.vyzvy_planovane_poskytovatelia_on_poskytovatel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_planovane_poskytovatelia_on_poskytovatel_id" ON vyzvy_planovane_poskytovatelia USING btree (poskytovatel_id);


--
-- Name: index_itms.vyzvy_planovane_poskytovatelia_on_vyzva_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_planovane_poskytovatelia_on_vyzva_id" ON vyzvy_planovane_poskytovatelia USING btree (vyzva_id);


--
-- Name: index_itms.vyzvy_vyhlasene_doplnujuce_info_on_vyzva_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_doplnujuce_info_on_vyzva_id" ON vyzvy_vyhlasene_doplnujuce_info USING btree (vyzva_id);


--
-- Name: index_itms.vyzvy_vyhlasene_fondy_on_fond_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_fondy_on_fond_id" ON vyzvy_vyhlasene_fondy USING btree (fond_id);


--
-- Name: index_itms.vyzvy_vyhlasene_fondy_on_vyzva_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_fondy_on_vyzva_id" ON vyzvy_vyhlasene_fondy USING btree (vyzva_id);


--
-- Name: index_itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_on_kc; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_on_kc" ON vyzvy_vyhlasene_konkretne_ciele_typy_aktivit USING btree (konkretny_ciel_id);


--
-- Name: index_itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_on_ta; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_on_ta" ON vyzvy_vyhlasene_konkretne_ciele_typy_aktivit USING btree (typ_aktivity_id);


--
-- Name: index_itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_on_v; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_konkretne_ciele_typy_aktivit_on_v" ON vyzvy_vyhlasene_konkretne_ciele_typy_aktivit USING btree (vyzva_id);


--
-- Name: index_itms.vyzvy_vyhlasene_kontaktne_osoby_on_osoba_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_kontaktne_osoby_on_osoba_id" ON vyzvy_vyhlasene_kontaktne_osoby USING btree (osoba_id);


--
-- Name: index_itms.vyzvy_vyhlasene_kontaktne_osoby_on_vyzva_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_kontaktne_osoby_on_vyzva_id" ON vyzvy_vyhlasene_kontaktne_osoby USING btree (vyzva_id);


--
-- Name: index_itms.vyzvy_vyhlasene_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.vyzvy_vyhlasene_on_itms_id" ON vyzvy_vyhlasene USING btree (itms_id);


--
-- Name: index_itms.vyzvy_vyhlasene_on_vyhlasovatel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_on_vyhlasovatel_id" ON vyzvy_vyhlasene USING btree (vyhlasovatel_id);


--
-- Name: index_itms.vyzvy_vyhlasene_poskytovatelia_on_poskytovatel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_poskytovatelia_on_poskytovatel_id" ON vyzvy_vyhlasene_poskytovatelia USING btree (poskytovatel_id);


--
-- Name: index_itms.vyzvy_vyhlasene_poskytovatelia_on_vyzva_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_poskytovatelia_on_vyzva_id" ON vyzvy_vyhlasene_poskytovatelia USING btree (vyzva_id);


--
-- Name: index_itms.vyzvy_vyhlasene_posudzovane_obdobia_on_vyzva_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_posudzovane_obdobia_on_vyzva_id" ON vyzvy_vyhlasene_posudzovane_obdobia USING btree (vyzva_id);


--
-- Name: index_itms.vyzvy_vyhlasene_vyzvy_planovane_on_pv; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_vyzvy_planovane_on_pv" ON vyzvy_vyhlasene_vyzvy_planovane USING btree (planovana_vyzva_id);


--
-- Name: index_itms.vyzvy_vyhlasene_vyzvy_planovane_on_vv; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.vyzvy_vyhlasene_vyzvy_planovane_on_vv" ON vyzvy_vyhlasene_vyzvy_planovane USING btree (vyhlasena_vyzva_id);


--
-- Name: index_itms.zdroje_intenzit_on_zdroj_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zdroje_intenzit_on_zdroj_id" ON zdroje_intenzit USING btree (zdroj_id);


--
-- Name: index_itms.zmluvy_verejne_obstaravania_dalsie_url_zvo; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zmluvy_verejne_obstaravania_dalsie_url_zvo" ON zmluvy_verejne_obstaravania_dalsie_url USING btree (zmluva_verejne_obstaravanie_id);


--
-- Name: index_itms.zmluvy_verejne_obstaravania_dodavatelia_ddo; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zmluvy_verejne_obstaravania_dodavatelia_ddo" ON zmluvy_verejne_obstaravania_dodavatelia USING btree (dodavatel_dodavatel_obstaravatel_id);


--
-- Name: index_itms.zmluvy_verejne_obstaravania_dodavatelia_ds; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zmluvy_verejne_obstaravania_dodavatelia_ds" ON zmluvy_verejne_obstaravania_dodavatelia USING btree (dodavatel_subjekt_id);


--
-- Name: index_itms.zmluvy_verejne_obstaravania_dodavatelia_zvo; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zmluvy_verejne_obstaravania_dodavatelia_zvo" ON zmluvy_verejne_obstaravania_dodavatelia USING btree (zmluva_verejne_obstaravanie_id);


--
-- Name: index_itms.zmluvy_verejne_obstaravania_hddo; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zmluvy_verejne_obstaravania_hddo" ON zmluvy_verejne_obstaravania USING btree (hlavny_dodavatel_dodavatel_obstaravatel_id);


--
-- Name: index_itms.zmluvy_verejne_obstaravania_hds; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zmluvy_verejne_obstaravania_hds" ON zmluvy_verejne_obstaravania USING btree (hlavny_dodavatel_subjekt_id);


--
-- Name: index_itms.zmluvy_verejne_obstaravania_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zmluvy_verejne_obstaravania_on_itms_id" ON zmluvy_verejne_obstaravania USING btree (itms_id);


--
-- Name: index_itms.zmluvy_verejne_obstaravania_vo; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.zmluvy_verejne_obstaravania_vo" ON zmluvy_verejne_obstaravania USING btree (verejne_obstaravanie_id);


--
-- Name: index_itms.zonfp_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_on_itms_id" ON zonfp USING btree (itms_id);


--
-- Name: index_itms.zonfp_prijate_on_itms_identifier; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_prijate_on_itms_identifier" ON zonfp_prijate USING btree (itms_identifier);


--
-- Name: index_itms.zonfp_schvalene_on_itms_identifier; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_schvalene_on_itms_identifier" ON zonfp_schvalene USING btree (itms_identifier);


--
-- Name: index_itms.zonfp_zamietnute_on_itms_identifier; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zonfp_zamietnute_on_itms_identifier" ON zonfp_zamietnute USING btree (itms_identifier);


--
-- Name: index_itms.zop_predlozene_on_itms_identifier; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zop_predlozene_on_itms_identifier" ON zop_predlozene USING btree (itms_identifier);


--
-- Name: index_itms.zop_uhradene_on_itms_identifier; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zop_uhradene_on_itms_identifier" ON zop_uhradene USING btree (itms_identifier);


--
-- Name: index_itms.zop_zamietnute_on_itms_identifier; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.zop_zamietnute_on_itms_identifier" ON zop_zamietnute USING btree (itms_identifier);


SET search_path = upvs, pg_catalog;

--
-- Name: index_upvs.public_authority_edesks_on_cin; Type: INDEX; Schema: upvs; Owner: -
--

CREATE INDEX "index_upvs.public_authority_edesks_on_cin" ON public_authority_edesks USING btree (cin);


--
-- Name: index_upvs.public_authority_edesks_on_uri; Type: INDEX; Schema: upvs; Owner: -
--

CREATE UNIQUE INDEX "index_upvs.public_authority_edesks_on_uri" ON public_authority_edesks USING btree (uri);


SET search_path = itms, pg_catalog;

--
-- Name: fk_rails_0299640ff3; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_oblasti_intervencie
    ADD CONSTRAINT fk_rails_0299640ff3 FOREIGN KEY (konkretny_ciel_id) REFERENCES konkretne_ciele(id);


--
-- Name: fk_rails_03702170c9; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_suvisiace_nezrovnalosti
    ADD CONSTRAINT fk_rails_03702170c9 FOREIGN KEY (nezrovnalost_id) REFERENCES nezrovnalosti(id);


--
-- Name: fk_rails_039600fef2; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravania
    ADD CONSTRAINT fk_rails_039600fef2 FOREIGN KEY (hlavny_dodavatel_dodavatel_obstaravatel_id) REFERENCES dodavatelia(id);


--
-- Name: fk_rails_03ced0a1cb; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravania_dodavatelia
    ADD CONSTRAINT fk_rails_03ced0a1cb FOREIGN KEY (dodavatel_dodavatel_obstaravatel_id) REFERENCES dodavatelia(id);


--
-- Name: fk_rails_0496cc57e6; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_miesta_realizacie_mimo_uzemia_op
    ADD CONSTRAINT fk_rails_0496cc57e6 FOREIGN KEY (miesto_realizacie_id) REFERENCES miesta_realizacie(id);


--
-- Name: fk_rails_0529c2166a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_sekundarne_tematicke_okruhy
    ADD CONSTRAINT fk_rails_0529c2166a FOREIGN KEY (konkretny_ciel_id) REFERENCES konkretne_ciele(id);


--
-- Name: fk_rails_06f323bf15; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_meratelne_ukazovatele
    ADD CONSTRAINT fk_rails_06f323bf15 FOREIGN KEY (zonfp_prijate_id) REFERENCES zonfp_prijate(id);


--
-- Name: fk_rails_0854327a3f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_sekundarne_tematicke_okruhy
    ADD CONSTRAINT fk_rails_0854327a3f FOREIGN KEY (hodnota_ciselnika_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_08b0e2b924; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_hospodarske_cinnosti_ciele
    ADD CONSTRAINT fk_rails_08b0e2b924 FOREIGN KEY (zonfp_prijate_hospodarske_cinnosti_id) REFERENCES zonfp_prijate_hospodarske_cinnosti(id);


--
-- Name: fk_rails_09e399f617; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projektove_ukazovatele_fondy
    ADD CONSTRAINT fk_rails_09e399f617 FOREIGN KEY (projektovy_ukazovatel_id) REFERENCES projektove_ukazovatele(id);


--
-- Name: fk_rails_0ae8024275; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_ziadatel
    ADD CONSTRAINT fk_rails_0ae8024275 FOREIGN KEY (zonfp_prijate_id) REFERENCES zonfp_prijate(id);


--
-- Name: fk_rails_0ec85641c2; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_suvisiace_pohladavkove_doklady
    ADD CONSTRAINT fk_rails_0ec85641c2 FOREIGN KEY (pohladavkovy_doklad_id) REFERENCES pohladavkove_doklady(id);


--
-- Name: fk_rails_131189e0ab; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_organizacne_zlozky
    ADD CONSTRAINT fk_rails_131189e0ab FOREIGN KEY (zonfp_zamietnute_id) REFERENCES zonfp_zamietnute(id);


--
-- Name: fk_rails_132d3013ca; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_vysledok_konania
    ADD CONSTRAINT fk_rails_132d3013ca FOREIGN KEY (zonfp_zamietnute_id) REFERENCES zonfp_zamietnute(id);


--
-- Name: fk_rails_136836cd96; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_typy_nezrovnalosti
    ADD CONSTRAINT fk_rails_136836cd96 FOREIGN KEY (nezrovnalost_id) REFERENCES nezrovnalosti(id);


--
-- Name: fk_rails_140cb2bca8; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY pohladavkove_doklady
    ADD CONSTRAINT fk_rails_140cb2bca8 FOREIGN KEY (dovod_vratenia_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_169af2760b; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_formy_financovania_ciele
    ADD CONSTRAINT fk_rails_169af2760b FOREIGN KEY (zonfp_prijate_formy_financovania_id) REFERENCES zonfp_prijate_formy_financovania(id);


--
-- Name: fk_rails_174103e9f8; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_typy_uzemia_ciele
    ADD CONSTRAINT fk_rails_174103e9f8 FOREIGN KEY (zonfp_schvalene_typy_uzemia_id) REFERENCES zonfp_schvalene_typy_uzemia(id);


--
-- Name: fk_rails_1792cc9243; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene
    ADD CONSTRAINT fk_rails_1792cc9243 FOREIGN KEY (vyhlasovatel_id) REFERENCES subjekty(id);


--
-- Name: fk_rails_17b4b919d8; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY dodavatelia
    ADD CONSTRAINT fk_rails_17b4b919d8 FOREIGN KEY (typ_ineho_identifikacneho_cisla_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_17faad18e6; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost
    ADD CONSTRAINT fk_rails_17faad18e6 FOREIGN KEY (subjekt_id) REFERENCES subjekty(id);


--
-- Name: fk_rails_18381644cd; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania
    ADD CONSTRAINT fk_rails_18381644cd FOREIGN KEY (druh_zakazky_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_19863b7ff4; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_poskytovatelia
    ADD CONSTRAINT fk_rails_19863b7ff4 FOREIGN KEY (poskytovatel_id) REFERENCES subjekty(id);


--
-- Name: fk_rails_1ba901166f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_formy_financovania
    ADD CONSTRAINT fk_rails_1ba901166f FOREIGN KEY (zonfp_zamietnute_id) REFERENCES zonfp_zamietnute(id);


--
-- Name: fk_rails_1baa81f3f7; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_uzemne_mechanizmy_ciele
    ADD CONSTRAINT fk_rails_1baa81f3f7 FOREIGN KEY (zonfp_zamietnute_uzemne_mechanizmy_id) REFERENCES zonfp_zamietnute_uzemne_mechanizmy(id);


--
-- Name: fk_rails_1c274e13bb; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania
    ADD CONSTRAINT fk_rails_1c274e13bb FOREIGN KEY (hlavny_predmet_hlavny_slovnik_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_1d6686783c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_typy_uzemia_ciele
    ADD CONSTRAINT fk_rails_1d6686783c FOREIGN KEY (zonfp_zamietnute_typy_uzemia_id) REFERENCES zonfp_zamietnute_typy_uzemia(id);


--
-- Name: fk_rails_1ff2f777dc; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_predlozene_predkladana_za
    ADD CONSTRAINT fk_rails_1ff2f777dc FOREIGN KEY (zop_predlozene_id) REFERENCES zop_predlozene(id);


--
-- Name: fk_rails_20e5c19bdc; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_hospodarske_cinnosti
    ADD CONSTRAINT fk_rails_20e5c19bdc FOREIGN KEY (zonfp_zamietnute_id) REFERENCES zonfp_zamietnute(id);


--
-- Name: fk_rails_2137cdd4b6; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_poskytovatelia
    ADD CONSTRAINT fk_rails_2137cdd4b6 FOREIGN KEY (vyzva_id) REFERENCES vyzvy_vyhlasene(id);


--
-- Name: fk_rails_225a5db0b4; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik
    ADD CONSTRAINT fk_rails_225a5db0b4 FOREIGN KEY (predmet_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_2425cf6aca; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_miesta_realizacie_mimo_uzemia_op
    ADD CONSTRAINT fk_rails_2425cf6aca FOREIGN KEY (projekt_id) REFERENCES projekty(id);


--
-- Name: fk_rails_24965b7679; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_hlavne_predmety_doplnkovy_slovnik
    ADD CONSTRAINT fk_rails_24965b7679 FOREIGN KEY (verejne_obstaravanie_id) REFERENCES verejne_obstaravania(id);


--
-- Name: fk_rails_257a019f0e; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_typy_nezrovnalosti
    ADD CONSTRAINT fk_rails_257a019f0e FOREIGN KEY (kod_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_25c3a95ab7; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie
    ADD CONSTRAINT fk_rails_25c3a95ab7 FOREIGN KEY (nezrovnalost_id) REFERENCES nezrovnalosti(id);


--
-- Name: fk_rails_25e3a0891d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_projekty
    ADD CONSTRAINT fk_rails_25e3a0891d FOREIGN KEY (projekt_id) REFERENCES projekty(id);


--
-- Name: fk_rails_262be0aab1; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty
    ADD CONSTRAINT fk_rails_262be0aab1 FOREIGN KEY (prijimatel_id) REFERENCES subjekty(id);


--
-- Name: fk_rails_276ee63a5d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_zamietnute_predkladana_za
    ADD CONSTRAINT fk_rails_276ee63a5d FOREIGN KEY (zop_zamietnute_id) REFERENCES zop_zamietnute(id);


--
-- Name: fk_rails_2826c1e619; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_oblasti_intervencie_ciele
    ADD CONSTRAINT fk_rails_2826c1e619 FOREIGN KEY (zonfp_schvalene_oblasti_intervencie_id) REFERENCES zonfp_schvalene_oblasti_intervencie(id);


--
-- Name: fk_rails_286e4aa34c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_aktivity_projekt_subjekty
    ADD CONSTRAINT fk_rails_286e4aa34c FOREIGN KEY (zonfp_zamietnute_aktivity_projekty_id) REFERENCES zonfp_zamietnute_aktivity_projekty(id);


--
-- Name: fk_rails_2f656b722b; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane
    ADD CONSTRAINT fk_rails_2f656b722b FOREIGN KEY (vyhlasovatel_id) REFERENCES subjekty(id);


--
-- Name: fk_rails_2faddf5b73; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY prioritne_osi
    ADD CONSTRAINT fk_rails_2faddf5b73 FOREIGN KEY (operacny_program_id) REFERENCES operacne_programy(id);


--
-- Name: fk_rails_342c83d880; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY intenzity
    ADD CONSTRAINT fk_rails_342c83d880 FOREIGN KEY (zdroj_vz_id) REFERENCES zdroje_intenzit(id);


--
-- Name: fk_rails_350aad395f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY miesta_realizacie
    ADD CONSTRAINT fk_rails_350aad395f FOREIGN KEY (stat_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_35284387ac; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty
    ADD CONSTRAINT fk_rails_35284387ac FOREIGN KEY (schvalena_zonfp_id) REFERENCES zonfp(id);


--
-- Name: fk_rails_372cf8756f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_ziadatel
    ADD CONSTRAINT fk_rails_372cf8756f FOREIGN KEY (zonfp_schvalene_id) REFERENCES zonfp_schvalene(id);


--
-- Name: fk_rails_38bac79fdc; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_uzemne_mechanizmy
    ADD CONSTRAINT fk_rails_38bac79fdc FOREIGN KEY (zonfp_zamietnute_id) REFERENCES zonfp_zamietnute(id);


--
-- Name: fk_rails_3980438432; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti
    ADD CONSTRAINT fk_rails_3980438432 FOREIGN KEY (financny_stav_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_3cad360dd7; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY pohladavkove_doklady
    ADD CONSTRAINT fk_rails_3cad360dd7 FOREIGN KEY (subjekt_zodpovedny_za_vymahanie_id) REFERENCES subjekty(id);


--
-- Name: fk_rails_3db8d84aaa; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_formy_financovania
    ADD CONSTRAINT fk_rails_3db8d84aaa FOREIGN KEY (zonfp_schvalene_id) REFERENCES zonfp_schvalene(id);


--
-- Name: fk_rails_3deb67d8ba; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_oblasti_intervencie_ciele
    ADD CONSTRAINT fk_rails_3deb67d8ba FOREIGN KEY (zonfp_zamietnute_oblasti_intervencie_id) REFERENCES zonfp_zamietnute_oblasti_intervencie(id);


--
-- Name: fk_rails_3e3a53de08; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_formy_financovania
    ADD CONSTRAINT fk_rails_3e3a53de08 FOREIGN KEY (zonfp_prijate_id) REFERENCES zonfp_prijate(id);


--
-- Name: fk_rails_3f7de3afd6; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_uhradene_prijimatel
    ADD CONSTRAINT fk_rails_3f7de3afd6 FOREIGN KEY (zop_uhradene_id) REFERENCES zop_uhradene(id);


--
-- Name: fk_rails_3ffd858a5d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane_doplnujuce_info
    ADD CONSTRAINT fk_rails_3ffd858a5d FOREIGN KEY (vyzva_id) REFERENCES vyzvy_planovane(id);


--
-- Name: fk_rails_417cdb163f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_formy_financovania
    ADD CONSTRAINT fk_rails_417cdb163f FOREIGN KEY (konkretny_ciel_id) REFERENCES konkretne_ciele(id);


--
-- Name: fk_rails_41d0028c9d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_aktivity
    ADD CONSTRAINT fk_rails_41d0028c9d FOREIGN KEY (projekt_id) REFERENCES projekty(id);


--
-- Name: fk_rails_42a6c1da2a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_predlozene_prijimatel
    ADD CONSTRAINT fk_rails_42a6c1da2a FOREIGN KEY (zop_predlozene_id) REFERENCES zop_predlozene(id);


--
-- Name: fk_rails_43ac458ef5; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_fondy
    ADD CONSTRAINT fk_rails_43ac458ef5 FOREIGN KEY (vyzva_id) REFERENCES vyzvy_vyhlasene(id);


--
-- Name: fk_rails_44f150d5d8; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY konkretne_ciele
    ADD CONSTRAINT fk_rails_44f150d5d8 FOREIGN KEY (fond_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_466d6c5443; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY polozky_rozpoctu
    ADD CONSTRAINT fk_rails_466d6c5443 FOREIGN KEY (skupina_vydavkov_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_47b7955fdd; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY aktivity
    ADD CONSTRAINT fk_rails_47b7955fdd FOREIGN KEY (subjekt_id) REFERENCES subjekty(id);


--
-- Name: fk_rails_47bea54338; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane_konkretne_ciele
    ADD CONSTRAINT fk_rails_47bea54338 FOREIGN KEY (konkretny_ciel_id) REFERENCES konkretne_ciele(id);


--
-- Name: fk_rails_4b2cc174c3; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane_poskytovatelia
    ADD CONSTRAINT fk_rails_4b2cc174c3 FOREIGN KEY (vyzva_id) REFERENCES vyzvy_planovane(id);


--
-- Name: fk_rails_4c5ebdf210; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_vyzvy
    ADD CONSTRAINT fk_rails_4c5ebdf210 FOREIGN KEY (zonfp_schvalene_id) REFERENCES zonfp_schvalene(id);


--
-- Name: fk_rails_4c898ab9c7; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY subjekty
    ADD CONSTRAINT fk_rails_4c898ab9c7 FOREIGN KEY (stat_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_4ceaac61ef; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_uzemne_mechanizmy
    ADD CONSTRAINT fk_rails_4ceaac61ef FOREIGN KEY (hodnota_ciselnika_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_4d83be54d9; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY pohladavkove_doklady
    ADD CONSTRAINT fk_rails_4d83be54d9 FOREIGN KEY (prioritna_os_id) REFERENCES prioritne_osi(id);


--
-- Name: fk_rails_4da1c132e1; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravania_dodavatelia
    ADD CONSTRAINT fk_rails_4da1c132e1 FOREIGN KEY (zmluva_verejne_obstaravanie_id) REFERENCES zmluvy_verejne_obstaravania(id);


--
-- Name: fk_rails_4da2ae7a20; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik
    ADD CONSTRAINT fk_rails_4da2ae7a20 FOREIGN KEY (verejne_obstaravanie_id) REFERENCES verejne_obstaravania(id);


--
-- Name: fk_rails_4e304a144d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_typy_uzemia
    ADD CONSTRAINT fk_rails_4e304a144d FOREIGN KEY (projekt_id) REFERENCES projekty(id);


--
-- Name: fk_rails_4f0c3f949a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania
    ADD CONSTRAINT fk_rails_4f0c3f949a FOREIGN KEY (obstaravatel_dodavatel_obstaravatel_id) REFERENCES dodavatelia(id);


--
-- Name: fk_rails_4f35e719c2; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti
    ADD CONSTRAINT fk_rails_4f35e719c2 FOREIGN KEY (hlavny_typ_nezrovnalosti_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_4f4d107e15; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_miesta_realizacie_units
    ADD CONSTRAINT fk_rails_4f4d107e15 FOREIGN KEY (zonfp_schvalene_miesta_realizacie_id) REFERENCES zonfp_schvalene_miesta_realizacie(id);


--
-- Name: fk_rails_4fc331a058; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_polozky_rozpoctu
    ADD CONSTRAINT fk_rails_4fc331a058 FOREIGN KEY (projekt_id) REFERENCES projekty(id);


--
-- Name: fk_rails_50b7fceecd; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_konkretne_ciele_typy_aktivit
    ADD CONSTRAINT fk_rails_50b7fceecd FOREIGN KEY (konkretny_ciel_id) REFERENCES konkretne_ciele(id);


--
-- Name: fk_rails_512e1ff920; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_hospodarske_cinnosti
    ADD CONSTRAINT fk_rails_512e1ff920 FOREIGN KEY (hodnota_ciselnika_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_542918dbe1; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_doplnujuce_predmety_hlavny_slovnik
    ADD CONSTRAINT fk_rails_542918dbe1 FOREIGN KEY (predmet_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_546a109c63; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_meratelne_ukazovatele
    ADD CONSTRAINT fk_rails_546a109c63 FOREIGN KEY (projekt_id) REFERENCES projekty(id);


--
-- Name: fk_rails_5473ddf63b; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_zamietnute_prijimatel
    ADD CONSTRAINT fk_rails_5473ddf63b FOREIGN KEY (zop_zamietnute_id) REFERENCES zop_zamietnute(id);


--
-- Name: fk_rails_548236611b; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_vyzvy_planovane
    ADD CONSTRAINT fk_rails_548236611b FOREIGN KEY (planovana_vyzva_id) REFERENCES vyzvy_planovane(id);


--
-- Name: fk_rails_5695891e7b; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_hospodarske_cinnosti
    ADD CONSTRAINT fk_rails_5695891e7b FOREIGN KEY (konkretny_ciel_id) REFERENCES konkretne_ciele(id);


--
-- Name: fk_rails_5827b58bb9; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_hospodarske_cinnosti
    ADD CONSTRAINT fk_rails_5827b58bb9 FOREIGN KEY (projekt_id) REFERENCES projekty(id);


--
-- Name: fk_rails_5979b8f53a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_zamietnute_projekt
    ADD CONSTRAINT fk_rails_5979b8f53a FOREIGN KEY (zop_zamietnute_id) REFERENCES zop_zamietnute(id);


--
-- Name: fk_rails_5bea80ee4e; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY polozky_rozpoctu
    ADD CONSTRAINT fk_rails_5bea80ee4e FOREIGN KEY (aktivita_id) REFERENCES aktivity(id);


--
-- Name: fk_rails_5e3e3373cd; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_typy_uzemia
    ADD CONSTRAINT fk_rails_5e3e3373cd FOREIGN KEY (konkretny_ciel_id) REFERENCES konkretne_ciele(id);


--
-- Name: fk_rails_5f723e1acd; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost
    ADD CONSTRAINT fk_rails_5f723e1acd FOREIGN KEY (nezrovnalost_id) REFERENCES nezrovnalosti(id);


--
-- Name: fk_rails_5f8bc02fae; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_fondy
    ADD CONSTRAINT fk_rails_5f8bc02fae FOREIGN KEY (fond_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_60f63bc7e2; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania
    ADD CONSTRAINT fk_rails_60f63bc7e2 FOREIGN KEY (postup_obstaravania_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_6347bcec2b; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_uhradene_projekt
    ADD CONSTRAINT fk_rails_6347bcec2b FOREIGN KEY (zop_uhradene_id) REFERENCES zop_uhradene(id);


--
-- Name: fk_rails_6364309b83; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projektove_ukazovatele_casy_plnenia
    ADD CONSTRAINT fk_rails_6364309b83 FOREIGN KEY (kod_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_666b79ae9b; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_projekty
    ADD CONSTRAINT fk_rails_666b79ae9b FOREIGN KEY (verejne_obstaravanie_id) REFERENCES verejne_obstaravania(id);


--
-- Name: fk_rails_66f817d32a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_hospodarske_cinnosti_ciele
    ADD CONSTRAINT fk_rails_66f817d32a FOREIGN KEY (zonfp_zamietnute_hospodarske_cinnosti_id) REFERENCES zonfp_zamietnute_hospodarske_cinnosti(id);


--
-- Name: fk_rails_6756f57485; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_predlozene_predfinancovanie
    ADD CONSTRAINT fk_rails_6756f57485 FOREIGN KEY (zop_predlozene_id) REFERENCES zop_predlozene(id);


--
-- Name: fk_rails_6837e22c76; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY polozky_rozpoctu
    ADD CONSTRAINT fk_rails_6837e22c76 FOREIGN KEY (subjekt_id) REFERENCES subjekty(id);


--
-- Name: fk_rails_690e6a8952; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_organizacne_zlozky
    ADD CONSTRAINT fk_rails_690e6a8952 FOREIGN KEY (zonfp_schvalene_id) REFERENCES zonfp_schvalene(id);


--
-- Name: fk_rails_69da6acee6; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY operacne_programy
    ADD CONSTRAINT fk_rails_69da6acee6 FOREIGN KEY (subjekt_id) REFERENCES subjekty(id);


--
-- Name: fk_rails_6c4cefed09; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_kontaktne_osoby
    ADD CONSTRAINT fk_rails_6c4cefed09 FOREIGN KEY (osoba_id) REFERENCES osoby(id);


--
-- Name: fk_rails_6d8977cc9f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nuts_kody
    ADD CONSTRAINT fk_rails_6d8977cc9f FOREIGN KEY (hodnota_nuts_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_6e7c1b8881; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti
    ADD CONSTRAINT fk_rails_6e7c1b8881 FOREIGN KEY (prioritna_os_id) REFERENCES prioritne_osi(id);


--
-- Name: fk_rails_6f36ab41e1; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_uhradene_predfinancovanie
    ADD CONSTRAINT fk_rails_6f36ab41e1 FOREIGN KEY (zop_uhradene_id) REFERENCES zop_uhradene(id);


--
-- Name: fk_rails_77623d0edc; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY subjekty
    ADD CONSTRAINT fk_rails_77623d0edc FOREIGN KEY (obec_id) REFERENCES nuts_kody(id);


--
-- Name: fk_rails_77a3989ba2; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_uzemne_mechanizmy_ciele
    ADD CONSTRAINT fk_rails_77a3989ba2 FOREIGN KEY (zonfp_prijate_uzemne_mechanizmy_id) REFERENCES zonfp_prijate_uzemne_mechanizmy(id);


--
-- Name: fk_rails_7c26d63282; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_intenzity
    ADD CONSTRAINT fk_rails_7c26d63282 FOREIGN KEY (intenzita_id) REFERENCES intenzity(id);


--
-- Name: fk_rails_7c74b60b48; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_organizacne_zlozky
    ADD CONSTRAINT fk_rails_7c74b60b48 FOREIGN KEY (zonfp_prijate_id) REFERENCES zonfp_prijate(id);


--
-- Name: fk_rails_7d596202b5; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_intenzity
    ADD CONSTRAINT fk_rails_7d596202b5 FOREIGN KEY (projekt_id) REFERENCES projekty(id);


--
-- Name: fk_rails_7e27a6a773; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_meratelne_ukazovatele
    ADD CONSTRAINT fk_rails_7e27a6a773 FOREIGN KEY (zonfp_zamietnute_id) REFERENCES zonfp_zamietnute(id);


--
-- Name: fk_rails_803c402796; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_subjekty_ktore_zistili_nezrovnalost
    ADD CONSTRAINT fk_rails_803c402796 FOREIGN KEY (nezrovnalost_id) REFERENCES nezrovnalosti(id);


--
-- Name: fk_rails_80b7e1eff1; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_formy_financovania_ciele
    ADD CONSTRAINT fk_rails_80b7e1eff1 FOREIGN KEY (zonfp_schvalene_formy_financovania_id) REFERENCES zonfp_schvalene_formy_financovania(id);


--
-- Name: fk_rails_818c3c0e61; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY intenzity
    ADD CONSTRAINT fk_rails_818c3c0e61 FOREIGN KEY (zdroj_eu_id) REFERENCES zdroje_intenzit(id);


--
-- Name: fk_rails_8389e158be; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_aktivity_projekty
    ADD CONSTRAINT fk_rails_8389e158be FOREIGN KEY (zonfp_prijate_id) REFERENCES zonfp_prijate(id);


--
-- Name: fk_rails_83b35e71b4; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY monitorovacie_terminy
    ADD CONSTRAINT fk_rails_83b35e71b4 FOREIGN KEY (projekt_id) REFERENCES projekty(id);


--
-- Name: fk_rails_8593edf06e; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_formy_financovania
    ADD CONSTRAINT fk_rails_8593edf06e FOREIGN KEY (hodnota_ciselnika_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_85d83b30d7; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY pohladavkove_doklady
    ADD CONSTRAINT fk_rails_85d83b30d7 FOREIGN KEY (dlznik_id) REFERENCES subjekty(id);


--
-- Name: fk_rails_85eacf3416; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_aktivity_projekty
    ADD CONSTRAINT fk_rails_85eacf3416 FOREIGN KEY (zonfp_schvalene_id) REFERENCES zonfp_schvalene(id);


--
-- Name: fk_rails_867519c9e3; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_hospodarske_cinnosti
    ADD CONSTRAINT fk_rails_867519c9e3 FOREIGN KEY (zonfp_schvalene_id) REFERENCES zonfp_schvalene(id);


--
-- Name: fk_rails_88302c96ad; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_partneri
    ADD CONSTRAINT fk_rails_88302c96ad FOREIGN KEY (partner_id) REFERENCES subjekty(id);


--
-- Name: fk_rails_8897be5588; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_subjekty_ktore_zistili_nezrovnalost
    ADD CONSTRAINT fk_rails_8897be5588 FOREIGN KEY (subjekt_id) REFERENCES subjekty(id);


--
-- Name: fk_rails_8986ddb3e0; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_oblasti_intervencie
    ADD CONSTRAINT fk_rails_8986ddb3e0 FOREIGN KEY (zonfp_zamietnute_id) REFERENCES zonfp_zamietnute(id);


--
-- Name: fk_rails_899f745c2a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_hospodarske_cinnosti_ciele
    ADD CONSTRAINT fk_rails_899f745c2a FOREIGN KEY (zonfp_schvalene_hospodarske_cinnosti_id) REFERENCES zonfp_schvalene_hospodarske_cinnosti(id);


--
-- Name: fk_rails_89fad4de08; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_uctovne_doklady
    ADD CONSTRAINT fk_rails_89fad4de08 FOREIGN KEY (verejne_obstaravanie_id) REFERENCES verejne_obstaravania(id);


--
-- Name: fk_rails_8a9cbb93cb; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_typy_uzemia
    ADD CONSTRAINT fk_rails_8a9cbb93cb FOREIGN KEY (zonfp_schvalene_id) REFERENCES zonfp_schvalene(id);


--
-- Name: fk_rails_8aa8b44f6c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_organizacne_zlozky
    ADD CONSTRAINT fk_rails_8aa8b44f6c FOREIGN KEY (projekt_id) REFERENCES projekty(id);


--
-- Name: fk_rails_8bb220c518; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_operacne_programy
    ADD CONSTRAINT fk_rails_8bb220c518 FOREIGN KEY (operacny_program_id) REFERENCES operacne_programy(id);


--
-- Name: fk_rails_8d000a95b1; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_suvisiace_pohladavkove_doklady
    ADD CONSTRAINT fk_rails_8d000a95b1 FOREIGN KEY (nezrovnalost_id) REFERENCES nezrovnalosti(id);


--
-- Name: fk_rails_8e51e82a4a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_uctovne_doklady
    ADD CONSTRAINT fk_rails_8e51e82a4a FOREIGN KEY (uctovny_doklad_id) REFERENCES uctovne_doklady(id);


--
-- Name: fk_rails_8ed1a0f859; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY polozky_rozpoctu
    ADD CONSTRAINT fk_rails_8ed1a0f859 FOREIGN KEY (intenzita_id) REFERENCES intenzity(id);


--
-- Name: fk_rails_8fb44e9504; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY hodnoty_ciselnikov
    ADD CONSTRAINT fk_rails_8fb44e9504 FOREIGN KEY (ciselnik_id) REFERENCES ciselniky(id);


--
-- Name: fk_rails_9286d58589; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_oblasti_intervencie
    ADD CONSTRAINT fk_rails_9286d58589 FOREIGN KEY (hodnota_ciselnika_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_940d7db37d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_konkretne_ciele_typy_aktivit
    ADD CONSTRAINT fk_rails_940d7db37d FOREIGN KEY (vyzva_id) REFERENCES vyzvy_vyhlasene(id);


--
-- Name: fk_rails_94aa9b848a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_operacne_programy
    ADD CONSTRAINT fk_rails_94aa9b848a FOREIGN KEY (verejne_obstaravanie_id) REFERENCES verejne_obstaravania(id);


--
-- Name: fk_rails_94bff2dc1a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_partneri
    ADD CONSTRAINT fk_rails_94bff2dc1a FOREIGN KEY (zonfp_zamietnute_id) REFERENCES zonfp_zamietnute(id);


--
-- Name: fk_rails_97435e089d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY dodavatelia
    ADD CONSTRAINT fk_rails_97435e089d FOREIGN KEY (obec_id) REFERENCES nuts_kody(id);


--
-- Name: fk_rails_985f46756c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY miesta_realizacie
    ADD CONSTRAINT fk_rails_985f46756c FOREIGN KEY (nuts_5_id) REFERENCES nuts_kody(id);


--
-- Name: fk_rails_9bee500755; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_vyzvy
    ADD CONSTRAINT fk_rails_9bee500755 FOREIGN KEY (zonfp_zamietnute_id) REFERENCES zonfp_zamietnute(id);


--
-- Name: fk_rails_9ea2c85d7e; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_vyzvy_planovane
    ADD CONSTRAINT fk_rails_9ea2c85d7e FOREIGN KEY (vyhlasena_vyzva_id) REFERENCES vyzvy_vyhlasene(id);


--
-- Name: fk_rails_9ea404b7ef; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY dodavatelia
    ADD CONSTRAINT fk_rails_9ea404b7ef FOREIGN KEY (stat_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_9f12cb21f5; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_miesta_realizacie
    ADD CONSTRAINT fk_rails_9f12cb21f5 FOREIGN KEY (miesto_realizacie_id) REFERENCES miesta_realizacie(id);


--
-- Name: fk_rails_a191cf5c1f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projektove_ukazovatele_fondy
    ADD CONSTRAINT fk_rails_a191cf5c1f FOREIGN KEY (kod_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_a446ffcc6a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_formy_financovania_ciele
    ADD CONSTRAINT fk_rails_a446ffcc6a FOREIGN KEY (zonfp_zamietnute_formy_financovania_id) REFERENCES zonfp_zamietnute_formy_financovania(id);


--
-- Name: fk_rails_a7d99d3ceb; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_miesta_realizacie
    ADD CONSTRAINT fk_rails_a7d99d3ceb FOREIGN KEY (zonfp_schvalene_id) REFERENCES zonfp_schvalene(id);


--
-- Name: fk_rails_aa07f2a0b3; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_miesta_realizacie
    ADD CONSTRAINT fk_rails_aa07f2a0b3 FOREIGN KEY (zonfp_prijate_id) REFERENCES zonfp_prijate(id);


--
-- Name: fk_rails_aaf66724bd; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_hospodarske_cinnosti
    ADD CONSTRAINT fk_rails_aaf66724bd FOREIGN KEY (zonfp_prijate_id) REFERENCES zonfp_prijate(id);


--
-- Name: fk_rails_ab21eb7dbf; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_miesta_realizacie_units
    ADD CONSTRAINT fk_rails_ab21eb7dbf FOREIGN KEY (zonfp_zamietnute_miesta_realizacie_id) REFERENCES zonfp_zamietnute_miesta_realizacie(id);


--
-- Name: fk_rails_abf5b2acff; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_aktivity_projekt_subjekty
    ADD CONSTRAINT fk_rails_abf5b2acff FOREIGN KEY (zonfp_schvalene_aktivity_projekty_id) REFERENCES zonfp_schvalene_aktivity_projekty(id);


--
-- Name: fk_rails_abf9fbf76a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY miesta_realizacie
    ADD CONSTRAINT fk_rails_abf9fbf76a FOREIGN KEY (nuts_4_id) REFERENCES nuts_kody(id);


--
-- Name: fk_rails_acd8f0376f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_ziadatel
    ADD CONSTRAINT fk_rails_acd8f0376f FOREIGN KEY (zonfp_zamietnute_id) REFERENCES zonfp_zamietnute(id);


--
-- Name: fk_rails_b0d1bbc3a6; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_doplnujuce_info
    ADD CONSTRAINT fk_rails_b0d1bbc3a6 FOREIGN KEY (vyzva_id) REFERENCES vyzvy_vyhlasene(id);


--
-- Name: fk_rails_b12395dd94; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane_poskytovatelia
    ADD CONSTRAINT fk_rails_b12395dd94 FOREIGN KEY (poskytovatel_id) REFERENCES subjekty(id);


--
-- Name: fk_rails_b29797bf99; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_vyzvy
    ADD CONSTRAINT fk_rails_b29797bf99 FOREIGN KEY (zonfp_prijate_id) REFERENCES zonfp_prijate(id);


--
-- Name: fk_rails_b33c26e656; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_miesta_realizacie_units
    ADD CONSTRAINT fk_rails_b33c26e656 FOREIGN KEY (zonfp_prijate_miesta_realizacie_id) REFERENCES zonfp_prijate_miesta_realizacie(id);


--
-- Name: fk_rails_b607ab30e5; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY intenzity
    ADD CONSTRAINT fk_rails_b607ab30e5 FOREIGN KEY (subjekt_id) REFERENCES subjekty(id);


--
-- Name: fk_rails_ba7c143782; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_konkretne_ciele_typy_aktivit
    ADD CONSTRAINT fk_rails_ba7c143782 FOREIGN KEY (typ_aktivity_id) REFERENCES typy_aktivit(id);


--
-- Name: fk_rails_bb32b68e7f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_hodnotitelia
    ADD CONSTRAINT fk_rails_bb32b68e7f FOREIGN KEY (zonfp_schvalene_id) REFERENCES zonfp_schvalene(id);


--
-- Name: fk_rails_bb3b9af5f0; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY subjekty
    ADD CONSTRAINT fk_rails_bb3b9af5f0 FOREIGN KEY (typ_ineho_identifikacneho_cisla_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_bb8efda835; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_zamietnute_predfinancovanie
    ADD CONSTRAINT fk_rails_bb8efda835 FOREIGN KEY (zop_zamietnute_id) REFERENCES zop_zamietnute(id);


--
-- Name: fk_rails_bbef4e8041; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_meratelne_ukazovatele
    ADD CONSTRAINT fk_rails_bbef4e8041 FOREIGN KEY (projektovy_ukazovatel_id) REFERENCES projektove_ukazovatele(id);


--
-- Name: fk_rails_bc31563b61; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_sekundarne_tematicke_okruhy
    ADD CONSTRAINT fk_rails_bc31563b61 FOREIGN KEY (projekt_id) REFERENCES projekty(id);


--
-- Name: fk_rails_bde76ecd09; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_aktivity_projekt_subjekty
    ADD CONSTRAINT fk_rails_bde76ecd09 FOREIGN KEY (zonfp_prijate_aktivity_projekty_id) REFERENCES zonfp_prijate_aktivity_projekty(id);


--
-- Name: fk_rails_bea5988603; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie
    ADD CONSTRAINT fk_rails_bea5988603 FOREIGN KEY (subjekt_id) REFERENCES subjekty(id);


--
-- Name: fk_rails_bf15cbc5cf; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_oblasti_intervencie_ciele
    ADD CONSTRAINT fk_rails_bf15cbc5cf FOREIGN KEY (zonfp_prijate_oblasti_intervencie_id) REFERENCES zonfp_prijate_oblasti_intervencie(id);


--
-- Name: fk_rails_c0ce7701a5; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY pohladavkove_doklady
    ADD CONSTRAINT fk_rails_c0ce7701a5 FOREIGN KEY (konkretny_ciel_id) REFERENCES konkretne_ciele(id);


--
-- Name: fk_rails_c27d7f2c80; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_polozky_rozpoctu
    ADD CONSTRAINT fk_rails_c27d7f2c80 FOREIGN KEY (polozka_rozpoctu_id) REFERENCES polozky_rozpoctu(id);


--
-- Name: fk_rails_c456178d5d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_oblasti_intervencie
    ADD CONSTRAINT fk_rails_c456178d5d FOREIGN KEY (zonfp_schvalene_id) REFERENCES zonfp_schvalene(id);


--
-- Name: fk_rails_c556957979; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_typy_uzemia
    ADD CONSTRAINT fk_rails_c556957979 FOREIGN KEY (zonfp_zamietnute_id) REFERENCES zonfp_zamietnute(id);


--
-- Name: fk_rails_c67c463462; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty
    ADD CONSTRAINT fk_rails_c67c463462 FOREIGN KEY (vyzva_id) REFERENCES vyzvy_vyhlasene(id);


--
-- Name: fk_rails_c7cc60fd51; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_uzemne_mechanizmy
    ADD CONSTRAINT fk_rails_c7cc60fd51 FOREIGN KEY (zonfp_schvalene_id) REFERENCES zonfp_schvalene(id);


--
-- Name: fk_rails_c91e683028; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_aktivity_projekty
    ADD CONSTRAINT fk_rails_c91e683028 FOREIGN KEY (zonfp_zamietnute_id) REFERENCES zonfp_zamietnute(id);


--
-- Name: fk_rails_cbc060088a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania
    ADD CONSTRAINT fk_rails_cbc060088a FOREIGN KEY (metoda_vo_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_cbe8943658; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_kontaktne_osoby
    ADD CONSTRAINT fk_rails_cbe8943658 FOREIGN KEY (vyzva_id) REFERENCES vyzvy_vyhlasene(id);


--
-- Name: fk_rails_cc33bd1188; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY intenzity
    ADD CONSTRAINT fk_rails_cc33bd1188 FOREIGN KEY (zdroj_pr_id) REFERENCES zdroje_intenzit(id);


--
-- Name: fk_rails_ccb963193d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_formy_financovania
    ADD CONSTRAINT fk_rails_ccb963193d FOREIGN KEY (projekt_id) REFERENCES projekty(id);


--
-- Name: fk_rails_d40543fb1d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravania_dalsie_url
    ADD CONSTRAINT fk_rails_d40543fb1d FOREIGN KEY (zmluva_verejne_obstaravanie_id) REFERENCES zmluvy_verejne_obstaravania(id);


--
-- Name: fk_rails_d50f9dbb57; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_partneri
    ADD CONSTRAINT fk_rails_d50f9dbb57 FOREIGN KEY (zonfp_prijate_id) REFERENCES zonfp_prijate(id);


--
-- Name: fk_rails_d75aef9463; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_partneri
    ADD CONSTRAINT fk_rails_d75aef9463 FOREIGN KEY (zonfp_schvalene_id) REFERENCES zonfp_schvalene(id);


--
-- Name: fk_rails_d8681305e0; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravania_dodavatelia
    ADD CONSTRAINT fk_rails_d8681305e0 FOREIGN KEY (dodavatel_subjekt_id) REFERENCES subjekty(id);


--
-- Name: fk_rails_daa70d785a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY aktivity
    ADD CONSTRAINT fk_rails_daa70d785a FOREIGN KEY (typ_aktivity_id) REFERENCES typy_aktivit(id);


--
-- Name: fk_rails_dc617d6865; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_miesta_realizacie
    ADD CONSTRAINT fk_rails_dc617d6865 FOREIGN KEY (projekt_id) REFERENCES projekty(id);


--
-- Name: fk_rails_dca9598718; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti
    ADD CONSTRAINT fk_rails_dca9598718 FOREIGN KEY (administrativny_stav_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_dd066eede4; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_typy_uzemia
    ADD CONSTRAINT fk_rails_dd066eede4 FOREIGN KEY (zonfp_prijate_id) REFERENCES zonfp_prijate(id);


--
-- Name: fk_rails_dd29737b6c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania
    ADD CONSTRAINT fk_rails_dd29737b6c FOREIGN KEY (zadavatel_id) REFERENCES subjekty(id);


--
-- Name: fk_rails_de5d60c98a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_uhradene_predkladana_za
    ADD CONSTRAINT fk_rails_de5d60c98a FOREIGN KEY (zop_uhradene_id) REFERENCES zop_uhradene(id);


--
-- Name: fk_rails_de79713a9b; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zdroje_intenzit
    ADD CONSTRAINT fk_rails_de79713a9b FOREIGN KEY (zdroj_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_e184bf1313; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_organizacne_zlozky
    ADD CONSTRAINT fk_rails_e184bf1313 FOREIGN KEY (organizacna_zlozka_id) REFERENCES organizacne_zlozky(id);


--
-- Name: fk_rails_e281735595; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti
    ADD CONSTRAINT fk_rails_e281735595 FOREIGN KEY (dlznik_id) REFERENCES subjekty(id);


--
-- Name: fk_rails_e472fdc8b1; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravania
    ADD CONSTRAINT fk_rails_e472fdc8b1 FOREIGN KEY (verejne_obstaravanie_id) REFERENCES verejne_obstaravania(id);


--
-- Name: fk_rails_e4f9b6a174; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_uzemne_mechanizmy_ciele
    ADD CONSTRAINT fk_rails_e4f9b6a174 FOREIGN KEY (zonfp_schvalene_uzemne_mechanizmy_id) REFERENCES zonfp_schvalene_uzemne_mechanizmy(id);


--
-- Name: fk_rails_e6d4131836; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania
    ADD CONSTRAINT fk_rails_e6d4131836 FOREIGN KEY (obstaravatel_subjekt_id) REFERENCES subjekty(id);


--
-- Name: fk_rails_e7ad464858; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_uzemne_mechanizmy
    ADD CONSTRAINT fk_rails_e7ad464858 FOREIGN KEY (zonfp_prijate_id) REFERENCES zonfp_prijate(id);


--
-- Name: fk_rails_e847f12883; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti
    ADD CONSTRAINT fk_rails_e847f12883 FOREIGN KEY (operacny_program_id) REFERENCES operacne_programy(id);


--
-- Name: fk_rails_e8fee81bd1; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_aktivity
    ADD CONSTRAINT fk_rails_e8fee81bd1 FOREIGN KEY (aktivita_id) REFERENCES aktivity(id);


--
-- Name: fk_rails_e906d93305; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_meratelne_ukazovatele
    ADD CONSTRAINT fk_rails_e906d93305 FOREIGN KEY (zonfp_schvalene_id) REFERENCES zonfp_schvalene(id);


--
-- Name: fk_rails_e92b5798fe; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_oblasti_intervencie
    ADD CONSTRAINT fk_rails_e92b5798fe FOREIGN KEY (zonfp_prijate_id) REFERENCES zonfp_prijate(id);


--
-- Name: fk_rails_e965354053; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY intenzity
    ADD CONSTRAINT fk_rails_e965354053 FOREIGN KEY (zdroj_yei_id) REFERENCES zdroje_intenzit(id);


--
-- Name: fk_rails_e96ea796f7; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik
    ADD CONSTRAINT fk_rails_e96ea796f7 FOREIGN KEY (predmet_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_e9c0519acf; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_predlozene_projekt
    ADD CONSTRAINT fk_rails_e9c0519acf FOREIGN KEY (zop_predlozene_id) REFERENCES zop_predlozene(id);


--
-- Name: fk_rails_ea79d69beb; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY miesta_realizacie
    ADD CONSTRAINT fk_rails_ea79d69beb FOREIGN KEY (nuts_3_id) REFERENCES nuts_kody(id);


--
-- Name: fk_rails_ea9eccefc6; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_uzemne_mechanizmy
    ADD CONSTRAINT fk_rails_ea9eccefc6 FOREIGN KEY (projekt_id) REFERENCES projekty(id);


--
-- Name: fk_rails_ec6c3cb4c4; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projektove_ukazovatele_casy_plnenia
    ADD CONSTRAINT fk_rails_ec6c3cb4c4 FOREIGN KEY (projektovy_ukazovatel_id) REFERENCES projektove_ukazovatele(id);


--
-- Name: fk_rails_ecf1ac688d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_typy_uzemia
    ADD CONSTRAINT fk_rails_ecf1ac688d FOREIGN KEY (hodnota_ciselnika_id) REFERENCES hodnoty_ciselnikov(id);


--
-- Name: fk_rails_eef7449abc; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_uzemne_mechanizmy
    ADD CONSTRAINT fk_rails_eef7449abc FOREIGN KEY (konkretny_ciel_id) REFERENCES konkretne_ciele(id);


--
-- Name: fk_rails_f1873062c5; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_oblasti_intervencie
    ADD CONSTRAINT fk_rails_f1873062c5 FOREIGN KEY (projekt_id) REFERENCES projekty(id);


--
-- Name: fk_rails_f515e5059d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane_konkretne_ciele
    ADD CONSTRAINT fk_rails_f515e5059d FOREIGN KEY (vyzva_id) REFERENCES vyzvy_planovane(id);


--
-- Name: fk_rails_f529907463; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_doplnujuce_predmety_doplnkovy_slovnik
    ADD CONSTRAINT fk_rails_f529907463 FOREIGN KEY (verejne_obstaravanie_id) REFERENCES verejne_obstaravania(id);


--
-- Name: fk_rails_f52dc2f93f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_posudzovane_obdobia
    ADD CONSTRAINT fk_rails_f52dc2f93f FOREIGN KEY (vyzva_id) REFERENCES vyzvy_vyhlasene(id);


--
-- Name: fk_rails_f55d944621; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_miesta_realizacie
    ADD CONSTRAINT fk_rails_f55d944621 FOREIGN KEY (zonfp_zamietnute_id) REFERENCES zonfp_zamietnute(id);


--
-- Name: fk_rails_f6565b6e80; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravania
    ADD CONSTRAINT fk_rails_f6565b6e80 FOREIGN KEY (hlavny_dodavatel_subjekt_id) REFERENCES subjekty(id);


--
-- Name: fk_rails_f8a54bdaf1; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_suvisiace_nezrovnalosti
    ADD CONSTRAINT fk_rails_f8a54bdaf1 FOREIGN KEY (suvisiaca_nezrovnalost_id) REFERENCES nezrovnalosti(id);


--
-- Name: fk_rails_f927319243; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_typy_uzemia_ciele
    ADD CONSTRAINT fk_rails_f927319243 FOREIGN KEY (zonfp_prijate_typy_uzemia_id) REFERENCES zonfp_prijate_typy_uzemia(id);


--
-- Name: fk_rails_fb2a83b9a4; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_partneri
    ADD CONSTRAINT fk_rails_fb2a83b9a4 FOREIGN KEY (projekt_id) REFERENCES projekty(id);


--
-- Name: fk_rails_fc1493d31c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti
    ADD CONSTRAINT fk_rails_fc1493d31c FOREIGN KEY (konkretny_ciel_id) REFERENCES konkretne_ciele(id);


--
-- Name: fk_rails_fe55c9b1f5; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY pohladavkove_doklady
    ADD CONSTRAINT fk_rails_fe55c9b1f5 FOREIGN KEY (nezrovnalost_id) REFERENCES nezrovnalosti(id);


--
-- Name: fk_rails_ffc31e6216; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY intenzity
    ADD CONSTRAINT fk_rails_ffc31e6216 FOREIGN KEY (zdroj_sr_id) REFERENCES zdroje_intenzit(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20170222131821'),
('20170223074140'),
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
('20171005080348'),
('20171005094049'),
('20171005104049'),
('20171005104149'),
('20171005104249'),
('20171005105044'),
('20171005110144'),
('20171005115835'),
('20171005173414'),
('20171007133948'),
('20171008150412'),
('20171009080951'),
('20171009115759'),
('20171012201924'),
('20171017111719'),
('20171017171650'),
('20171017175218'),
('20171017175318'),
('20171017175418'),
('20171017175518'),
('20171017182731'),
('20171017182931'),
('20171113145824'),
('20171113180259'),
('20171114124735'),
('20171114143548'),
('20171115092048');


