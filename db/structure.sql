--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.8

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
-- Name: dodavatelia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE dodavatelia (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    dic character varying,
    ico character varying,
    ine_identifikacne_cislo character varying,
    nazov character varying,
    updated_at timestamp without time zone,
    created_at timestamp without time zone
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
-- Name: kody_konkretnych_cielov; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE kody_konkretnych_cielov (
    id integer NOT NULL,
    kod_id integer,
    kod_zdroj character varying,
    konkretny_ciel_id integer,
    nazov character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: kody_konkretnych_cielov_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE kody_konkretnych_cielov_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: kody_konkretnych_cielov_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE kody_konkretnych_cielov_id_seq OWNED BY kody_konkretnych_cielov.id;


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
    prijimatel_id integer,
    stav character varying,
    suma_celkova_projektov_generujucich_prijem numeric,
    suma_zazmluvnena numeric,
    suma_zazmluvnena_povodna numeric,
    url_adresa_zmluva character varying,
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
    forma_financovania_id integer,
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
    hospodarska_cinnost_id integer,
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
-- Name: projekty_oblasti_intervencie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_oblasti_intervencie (
    id integer NOT NULL,
    projekt_id integer,
    oblast_intervencie_id integer,
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
-- Name: projekty_sekundarne_tematicke_okruhy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_sekundarne_tematicke_okruhy (
    id integer NOT NULL,
    projekt_id integer,
    sekundarny_tematicky_okruh_id integer,
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
    typ_uzemia_id integer,
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
-- Name: projekty_ukoncene; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_ukoncene (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    akronym character varying,
    cislo_zmluvy character varying,
    kod character varying,
    nazov character varying,
    stav character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    datum_konca_hlavnych_aktivit timestamp without time zone,
    datum_konca_realizacie timestamp without time zone,
    datum_platnosti_zmluvy timestamp without time zone,
    datum_ucinnosti_zmluvy timestamp without time zone,
    datum_zaciatku_hlavnych_aktivit timestamp without time zone,
    datum_zaciatku_realizacie timestamp without time zone,
    dlzka_celkova_hlavnych_aktivit bigint,
    dlzka_celkova_projektu bigint,
    suma_celkova_projektov_generujucich_prijem numeric,
    suma_zazmluvnena numeric,
    suma_zazmluvnena_povodna numeric,
    popis_projektu text,
    zameranie_projektu text
);


--
-- Name: projekty_ukoncene_aktivity; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_ukoncene_aktivity (
    id integer NOT NULL,
    projekty_ukoncene_id bigint NOT NULL,
    datum_konca_planovany character varying,
    datum_konca_skutocny character varying,
    datum_zaciatku_planovany character varying,
    datum_zaciatku_skutocny character varying,
    kod character varying,
    nazov character varying
);


--
-- Name: projekty_ukoncene_aktivity_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_ukoncene_aktivity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_ukoncene_aktivity_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_ukoncene_aktivity_id_seq OWNED BY projekty_ukoncene_aktivity.id;


--
-- Name: projekty_ukoncene_aktivity_subjekty; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_ukoncene_aktivity_subjekty (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_ukoncene_aktivity_id bigint NOT NULL,
    ico character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: projekty_ukoncene_aktivity_subjekty_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_ukoncene_aktivity_subjekty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_ukoncene_aktivity_subjekty_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_ukoncene_aktivity_subjekty_id_seq OWNED BY projekty_ukoncene_aktivity_subjekty.id;


--
-- Name: projekty_ukoncene_formy_financovania; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_ukoncene_formy_financovania (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_ukoncene_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: projekty_ukoncene_formy_financovania_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_ukoncene_formy_financovania_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_ukoncene_formy_financovania_id bigint NOT NULL
);


--
-- Name: projekty_ukoncene_formy_financovania_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_ukoncene_formy_financovania_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_ukoncene_formy_financovania_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_ukoncene_formy_financovania_ciele_id_seq OWNED BY projekty_ukoncene_formy_financovania_ciele.id;


--
-- Name: projekty_ukoncene_formy_financovania_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_ukoncene_formy_financovania_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_ukoncene_formy_financovania_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_ukoncene_formy_financovania_id_seq OWNED BY projekty_ukoncene_formy_financovania.id;


--
-- Name: projekty_ukoncene_hospodarske_cinnosti; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_ukoncene_hospodarske_cinnosti (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_ukoncene_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: projekty_ukoncene_hospodarske_cinnosti_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_ukoncene_hospodarske_cinnosti_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_ukoncene_hospodarske_cinnosti_id bigint NOT NULL
);


--
-- Name: projekty_ukoncene_hospodarske_cinnosti_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_ukoncene_hospodarske_cinnosti_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_ukoncene_hospodarske_cinnosti_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_ukoncene_hospodarske_cinnosti_ciele_id_seq OWNED BY projekty_ukoncene_hospodarske_cinnosti_ciele.id;


--
-- Name: projekty_ukoncene_hospodarske_cinnosti_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_ukoncene_hospodarske_cinnosti_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_ukoncene_hospodarske_cinnosti_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_ukoncene_hospodarske_cinnosti_id_seq OWNED BY projekty_ukoncene_hospodarske_cinnosti.id;


--
-- Name: projekty_ukoncene_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_ukoncene_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_ukoncene_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_ukoncene_id_seq OWNED BY projekty_ukoncene.id;


--
-- Name: projekty_ukoncene_intenzity; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_ukoncene_intenzity (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_ukoncene_id bigint NOT NULL,
    nazov character varying
);


--
-- Name: projekty_ukoncene_intenzity_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_ukoncene_intenzity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_ukoncene_intenzity_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_ukoncene_intenzity_id_seq OWNED BY projekty_ukoncene_intenzity.id;


--
-- Name: projekty_ukoncene_intenzity_subjekty; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_ukoncene_intenzity_subjekty (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_ukoncene_intenzity_id bigint NOT NULL,
    ico character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: projekty_ukoncene_intenzity_subjekty_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_ukoncene_intenzity_subjekty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_ukoncene_intenzity_subjekty_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_ukoncene_intenzity_subjekty_id_seq OWNED BY projekty_ukoncene_intenzity_subjekty.id;


--
-- Name: projekty_ukoncene_intenzity_zdroje; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_ukoncene_intenzity_zdroje (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_ukoncene_intenzity_id bigint NOT NULL,
    cerpanie_eu numeric,
    cerpanie_ro numeric,
    percento numeric,
    suma_zazmluvnena numeric,
    typ character varying,
    kod character varying,
    nazov character varying
);


--
-- Name: projekty_ukoncene_intenzity_zdroje_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_ukoncene_intenzity_zdroje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_ukoncene_intenzity_zdroje_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_ukoncene_intenzity_zdroje_id_seq OWNED BY projekty_ukoncene_intenzity_zdroje.id;


--
-- Name: projekty_ukoncene_meratelne_ukazovatele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_ukoncene_meratelne_ukazovatele (
    id integer NOT NULL,
    projekty_ukoncene_id bigint NOT NULL,
    aktualny_skutocny_stav numeric,
    hodnota_cielova_celkova numeric,
    kod character varying,
    merna_jednotka character varying,
    nazov character varying
);


--
-- Name: projekty_ukoncene_meratelne_ukazovatele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_ukoncene_meratelne_ukazovatele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_ukoncene_meratelne_ukazovatele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_ukoncene_meratelne_ukazovatele_id_seq OWNED BY projekty_ukoncene_meratelne_ukazovatele.id;


--
-- Name: projekty_ukoncene_miesta_realizacie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_ukoncene_miesta_realizacie (
    id integer NOT NULL,
    projekty_ukoncene_id bigint NOT NULL
);


--
-- Name: projekty_ukoncene_miesta_realizacie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_ukoncene_miesta_realizacie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_ukoncene_miesta_realizacie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_ukoncene_miesta_realizacie_id_seq OWNED BY projekty_ukoncene_miesta_realizacie.id;


--
-- Name: projekty_ukoncene_miesta_realizacie_units; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_ukoncene_miesta_realizacie_units (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_ukoncene_miesta_realizacie_id bigint NOT NULL,
    typ character varying,
    nazov character varying
);


--
-- Name: projekty_ukoncene_miesta_realizacie_units_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_ukoncene_miesta_realizacie_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_ukoncene_miesta_realizacie_units_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_ukoncene_miesta_realizacie_units_id_seq OWNED BY projekty_ukoncene_miesta_realizacie_units.id;


--
-- Name: projekty_ukoncene_monitorovacie_terminy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_ukoncene_monitorovacie_terminy (
    id integer NOT NULL,
    projekty_ukoncene_id bigint NOT NULL,
    datum_predlozenia_najneskorsi character varying,
    termin_monitorovania character varying,
    typ_monitorovacej_spravy character varying,
    poradove_cislo bigint
);


--
-- Name: projekty_ukoncene_monitorovacie_terminy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_ukoncene_monitorovacie_terminy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_ukoncene_monitorovacie_terminy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_ukoncene_monitorovacie_terminy_id_seq OWNED BY projekty_ukoncene_monitorovacie_terminy.id;


--
-- Name: projekty_ukoncene_oblasti_intervencie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_ukoncene_oblasti_intervencie (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_ukoncene_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: projekty_ukoncene_oblasti_intervencie_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_ukoncene_oblasti_intervencie_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_ukoncene_oblasti_intervencie_id bigint NOT NULL
);


--
-- Name: projekty_ukoncene_oblasti_intervencie_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_ukoncene_oblasti_intervencie_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_ukoncene_oblasti_intervencie_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_ukoncene_oblasti_intervencie_ciele_id_seq OWNED BY projekty_ukoncene_oblasti_intervencie_ciele.id;


--
-- Name: projekty_ukoncene_oblasti_intervencie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_ukoncene_oblasti_intervencie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_ukoncene_oblasti_intervencie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_ukoncene_oblasti_intervencie_id_seq OWNED BY projekty_ukoncene_oblasti_intervencie.id;


--
-- Name: projekty_ukoncene_organizacne_zlozky; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_ukoncene_organizacne_zlozky (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_ukoncene_id bigint NOT NULL,
    adresa character varying,
    nazov character varying
);


--
-- Name: projekty_ukoncene_organizacne_zlozky_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_ukoncene_organizacne_zlozky_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_ukoncene_organizacne_zlozky_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_ukoncene_organizacne_zlozky_id_seq OWNED BY projekty_ukoncene_organizacne_zlozky.id;


--
-- Name: projekty_ukoncene_partneri; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_ukoncene_partneri (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_ukoncene_id bigint NOT NULL,
    ico character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: projekty_ukoncene_partneri_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_ukoncene_partneri_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_ukoncene_partneri_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_ukoncene_partneri_id_seq OWNED BY projekty_ukoncene_partneri.id;


--
-- Name: projekty_ukoncene_prijimatel; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_ukoncene_prijimatel (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_ukoncene_id bigint NOT NULL,
    ine_identifikacne_cislo character varying,
    ico character varying
);


--
-- Name: projekty_ukoncene_prijimatel_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_ukoncene_prijimatel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_ukoncene_prijimatel_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_ukoncene_prijimatel_id_seq OWNED BY projekty_ukoncene_prijimatel.id;


--
-- Name: projekty_ukoncene_schvalene_zonfp; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_ukoncene_schvalene_zonfp (
    id integer NOT NULL,
    itms_identifier bigint,
    projekty_ukoncene_id integer
);


--
-- Name: projekty_ukoncene_schvalene_zonfp_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_ukoncene_schvalene_zonfp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_ukoncene_schvalene_zonfp_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_ukoncene_schvalene_zonfp_id_seq OWNED BY projekty_ukoncene_schvalene_zonfp.id;


--
-- Name: projekty_ukoncene_typy_uzemia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_ukoncene_typy_uzemia (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_ukoncene_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: projekty_ukoncene_typy_uzemia_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_ukoncene_typy_uzemia_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_ukoncene_typy_uzemia_id bigint NOT NULL
);


--
-- Name: projekty_ukoncene_typy_uzemia_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_ukoncene_typy_uzemia_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_ukoncene_typy_uzemia_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_ukoncene_typy_uzemia_ciele_id_seq OWNED BY projekty_ukoncene_typy_uzemia_ciele.id;


--
-- Name: projekty_ukoncene_typy_uzemia_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_ukoncene_typy_uzemia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_ukoncene_typy_uzemia_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_ukoncene_typy_uzemia_id_seq OWNED BY projekty_ukoncene_typy_uzemia.id;


--
-- Name: projekty_ukoncene_uzemne_mechanizmy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_ukoncene_uzemne_mechanizmy (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_ukoncene_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: projekty_ukoncene_uzemne_mechanizmy_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_ukoncene_uzemne_mechanizmy_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_ukoncene_uzemne_mechanizmy_id bigint NOT NULL
);


--
-- Name: projekty_ukoncene_uzemne_mechanizmy_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_ukoncene_uzemne_mechanizmy_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_ukoncene_uzemne_mechanizmy_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_ukoncene_uzemne_mechanizmy_ciele_id_seq OWNED BY projekty_ukoncene_uzemne_mechanizmy_ciele.id;


--
-- Name: projekty_ukoncene_uzemne_mechanizmy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_ukoncene_uzemne_mechanizmy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_ukoncene_uzemne_mechanizmy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_ukoncene_uzemne_mechanizmy_id_seq OWNED BY projekty_ukoncene_uzemne_mechanizmy.id;


--
-- Name: projekty_ukoncene_vyzva; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_ukoncene_vyzva (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_ukoncene_id bigint NOT NULL
);


--
-- Name: projekty_ukoncene_vyzva_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_ukoncene_vyzva_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_ukoncene_vyzva_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_ukoncene_vyzva_id_seq OWNED BY projekty_ukoncene_vyzva.id;


--
-- Name: projekty_uzemne_mechanizmy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_uzemne_mechanizmy (
    id integer NOT NULL,
    projekt_id integer,
    uzemny_mechanizmus_id integer,
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
-- Name: projekty_vrealizacii; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_vrealizacii (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    akronym character varying,
    cislo_zmluvy character varying,
    kod character varying,
    nazov character varying,
    stav character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    datum_konca_hlavnych_aktivit timestamp without time zone,
    datum_konca_realizacie timestamp without time zone,
    datum_platnosti_zmluvy timestamp without time zone,
    datum_ucinnosti_zmluvy timestamp without time zone,
    datum_zaciatku_hlavnych_aktivit timestamp without time zone,
    datum_zaciatku_realizacie timestamp without time zone,
    dlzka_celkova_hlavnych_aktivit bigint,
    dlzka_celkova_projektu bigint,
    suma_celkova_projektov_generujucich_prijem numeric,
    suma_zazmluvnena numeric,
    suma_zazmluvnena_povodna numeric,
    popis_projektu text,
    zameranie_projektu text
);


--
-- Name: projekty_vrealizacii_aktivity; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_vrealizacii_aktivity (
    id integer NOT NULL,
    projekty_vrealizacii_id bigint NOT NULL,
    datum_konca_planovany character varying,
    datum_konca_skutocny character varying,
    datum_zaciatku_planovany character varying,
    datum_zaciatku_skutocny character varying,
    kod character varying,
    nazov character varying
);


--
-- Name: projekty_vrealizacii_aktivity_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_vrealizacii_aktivity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_vrealizacii_aktivity_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_vrealizacii_aktivity_id_seq OWNED BY projekty_vrealizacii_aktivity.id;


--
-- Name: projekty_vrealizacii_aktivity_subjekty; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_vrealizacii_aktivity_subjekty (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_vrealizacii_aktivity_id bigint NOT NULL,
    ico character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: projekty_vrealizacii_aktivity_subjekty_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_vrealizacii_aktivity_subjekty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_vrealizacii_aktivity_subjekty_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_vrealizacii_aktivity_subjekty_id_seq OWNED BY projekty_vrealizacii_aktivity_subjekty.id;


--
-- Name: projekty_vrealizacii_formy_financovania; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_vrealizacii_formy_financovania (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_vrealizacii_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: projekty_vrealizacii_formy_financovania_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_vrealizacii_formy_financovania_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_vrealizacii_formy_financovania_id bigint NOT NULL
);


--
-- Name: projekty_vrealizacii_formy_financovania_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_vrealizacii_formy_financovania_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_vrealizacii_formy_financovania_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_vrealizacii_formy_financovania_ciele_id_seq OWNED BY projekty_vrealizacii_formy_financovania_ciele.id;


--
-- Name: projekty_vrealizacii_formy_financovania_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_vrealizacii_formy_financovania_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_vrealizacii_formy_financovania_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_vrealizacii_formy_financovania_id_seq OWNED BY projekty_vrealizacii_formy_financovania.id;


--
-- Name: projekty_vrealizacii_hospodarske_cinnosti; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_vrealizacii_hospodarske_cinnosti (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_vrealizacii_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: projekty_vrealizacii_hospodarske_cinnosti_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_vrealizacii_hospodarske_cinnosti_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_vrealizacii_hospodarske_cinnosti_id bigint NOT NULL
);


--
-- Name: projekty_vrealizacii_hospodarske_cinnosti_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_vrealizacii_hospodarske_cinnosti_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_vrealizacii_hospodarske_cinnosti_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_vrealizacii_hospodarske_cinnosti_ciele_id_seq OWNED BY projekty_vrealizacii_hospodarske_cinnosti_ciele.id;


--
-- Name: projekty_vrealizacii_hospodarske_cinnosti_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_vrealizacii_hospodarske_cinnosti_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_vrealizacii_hospodarske_cinnosti_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_vrealizacii_hospodarske_cinnosti_id_seq OWNED BY projekty_vrealizacii_hospodarske_cinnosti.id;


--
-- Name: projekty_vrealizacii_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_vrealizacii_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_vrealizacii_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_vrealizacii_id_seq OWNED BY projekty_vrealizacii.id;


--
-- Name: projekty_vrealizacii_intenzity; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_vrealizacii_intenzity (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_vrealizacii_id bigint NOT NULL,
    nazov character varying
);


--
-- Name: projekty_vrealizacii_intenzity_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_vrealizacii_intenzity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_vrealizacii_intenzity_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_vrealizacii_intenzity_id_seq OWNED BY projekty_vrealizacii_intenzity.id;


--
-- Name: projekty_vrealizacii_intenzity_subjekty; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_vrealizacii_intenzity_subjekty (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_vrealizacii_intenzity_id bigint NOT NULL,
    ico character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: projekty_vrealizacii_intenzity_subjekty_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_vrealizacii_intenzity_subjekty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_vrealizacii_intenzity_subjekty_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_vrealizacii_intenzity_subjekty_id_seq OWNED BY projekty_vrealizacii_intenzity_subjekty.id;


--
-- Name: projekty_vrealizacii_intenzity_zdroje; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_vrealizacii_intenzity_zdroje (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_vrealizacii_intenzity_id bigint NOT NULL,
    cerpanie_eu numeric,
    cerpanie_ro numeric,
    percento numeric,
    suma_zazmluvnena numeric,
    typ character varying,
    kod character varying,
    nazov character varying
);


--
-- Name: projekty_vrealizacii_intenzity_zdroje_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_vrealizacii_intenzity_zdroje_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_vrealizacii_intenzity_zdroje_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_vrealizacii_intenzity_zdroje_id_seq OWNED BY projekty_vrealizacii_intenzity_zdroje.id;


--
-- Name: projekty_vrealizacii_meratelne_ukazovatele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_vrealizacii_meratelne_ukazovatele (
    id integer NOT NULL,
    projekty_vrealizacii_id bigint NOT NULL,
    aktualny_skutocny_stav numeric,
    hodnota_cielova_celkova numeric,
    kod character varying,
    merna_jednotka character varying,
    nazov character varying
);


--
-- Name: projekty_vrealizacii_meratelne_ukazovatele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_vrealizacii_meratelne_ukazovatele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_vrealizacii_meratelne_ukazovatele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_vrealizacii_meratelne_ukazovatele_id_seq OWNED BY projekty_vrealizacii_meratelne_ukazovatele.id;


--
-- Name: projekty_vrealizacii_miesta_realizacie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_vrealizacii_miesta_realizacie (
    id integer NOT NULL,
    projekty_vrealizacii_id bigint NOT NULL
);


--
-- Name: projekty_vrealizacii_miesta_realizacie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_vrealizacii_miesta_realizacie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_vrealizacii_miesta_realizacie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_vrealizacii_miesta_realizacie_id_seq OWNED BY projekty_vrealizacii_miesta_realizacie.id;


--
-- Name: projekty_vrealizacii_miesta_realizacie_units; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_vrealizacii_miesta_realizacie_units (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_vrealizacii_miesta_realizacie_id bigint NOT NULL,
    typ character varying,
    nazov character varying
);


--
-- Name: projekty_vrealizacii_miesta_realizacie_units_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_vrealizacii_miesta_realizacie_units_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_vrealizacii_miesta_realizacie_units_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_vrealizacii_miesta_realizacie_units_id_seq OWNED BY projekty_vrealizacii_miesta_realizacie_units.id;


--
-- Name: projekty_vrealizacii_monitorovacie_terminy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_vrealizacii_monitorovacie_terminy (
    id integer NOT NULL,
    projekty_vrealizacii_id bigint NOT NULL,
    datum_predlozenia_najneskorsi character varying,
    termin_monitorovania character varying,
    typ_monitorovacej_spravy character varying,
    poradove_cislo bigint
);


--
-- Name: projekty_vrealizacii_monitorovacie_terminy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_vrealizacii_monitorovacie_terminy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_vrealizacii_monitorovacie_terminy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_vrealizacii_monitorovacie_terminy_id_seq OWNED BY projekty_vrealizacii_monitorovacie_terminy.id;


--
-- Name: projekty_vrealizacii_oblasti_intervencie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_vrealizacii_oblasti_intervencie (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_vrealizacii_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: projekty_vrealizacii_oblasti_intervencie_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_vrealizacii_oblasti_intervencie_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_vrealizacii_oblasti_intervencie_id bigint NOT NULL
);


--
-- Name: projekty_vrealizacii_oblasti_intervencie_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_vrealizacii_oblasti_intervencie_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_vrealizacii_oblasti_intervencie_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_vrealizacii_oblasti_intervencie_ciele_id_seq OWNED BY projekty_vrealizacii_oblasti_intervencie_ciele.id;


--
-- Name: projekty_vrealizacii_oblasti_intervencie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_vrealizacii_oblasti_intervencie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_vrealizacii_oblasti_intervencie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_vrealizacii_oblasti_intervencie_id_seq OWNED BY projekty_vrealizacii_oblasti_intervencie.id;


--
-- Name: projekty_vrealizacii_organizacne_zlozky; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_vrealizacii_organizacne_zlozky (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_vrealizacii_id bigint NOT NULL,
    adresa character varying,
    nazov character varying
);


--
-- Name: projekty_vrealizacii_organizacne_zlozky_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_vrealizacii_organizacne_zlozky_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_vrealizacii_organizacne_zlozky_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_vrealizacii_organizacne_zlozky_id_seq OWNED BY projekty_vrealizacii_organizacne_zlozky.id;


--
-- Name: projekty_vrealizacii_partneri; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_vrealizacii_partneri (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_vrealizacii_id bigint NOT NULL,
    ico character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: projekty_vrealizacii_partneri_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_vrealizacii_partneri_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_vrealizacii_partneri_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_vrealizacii_partneri_id_seq OWNED BY projekty_vrealizacii_partneri.id;


--
-- Name: projekty_vrealizacii_prijimatel; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_vrealizacii_prijimatel (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_vrealizacii_id bigint NOT NULL,
    ine_identifikacne_cislo character varying,
    ico character varying
);


--
-- Name: projekty_vrealizacii_prijimatel_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_vrealizacii_prijimatel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_vrealizacii_prijimatel_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_vrealizacii_prijimatel_id_seq OWNED BY projekty_vrealizacii_prijimatel.id;


--
-- Name: projekty_vrealizacii_schvalene_zonfp; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_vrealizacii_schvalene_zonfp (
    id integer NOT NULL,
    itms_identifier bigint,
    projekty_vrealizacii_id integer
);


--
-- Name: projekty_vrealizacii_schvalene_zonfp_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_vrealizacii_schvalene_zonfp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_vrealizacii_schvalene_zonfp_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_vrealizacii_schvalene_zonfp_id_seq OWNED BY projekty_vrealizacii_schvalene_zonfp.id;


--
-- Name: projekty_vrealizacii_typy_uzemia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_vrealizacii_typy_uzemia (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_vrealizacii_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: projekty_vrealizacii_typy_uzemia_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_vrealizacii_typy_uzemia_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_vrealizacii_typy_uzemia_id bigint NOT NULL
);


--
-- Name: projekty_vrealizacii_typy_uzemia_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_vrealizacii_typy_uzemia_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_vrealizacii_typy_uzemia_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_vrealizacii_typy_uzemia_ciele_id_seq OWNED BY projekty_vrealizacii_typy_uzemia_ciele.id;


--
-- Name: projekty_vrealizacii_typy_uzemia_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_vrealizacii_typy_uzemia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_vrealizacii_typy_uzemia_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_vrealizacii_typy_uzemia_id_seq OWNED BY projekty_vrealizacii_typy_uzemia.id;


--
-- Name: projekty_vrealizacii_uzemne_mechanizmy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_vrealizacii_uzemne_mechanizmy (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_vrealizacii_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: projekty_vrealizacii_uzemne_mechanizmy_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_vrealizacii_uzemne_mechanizmy_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_vrealizacii_uzemne_mechanizmy_id bigint NOT NULL
);


--
-- Name: projekty_vrealizacii_uzemne_mechanizmy_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_vrealizacii_uzemne_mechanizmy_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_vrealizacii_uzemne_mechanizmy_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_vrealizacii_uzemne_mechanizmy_ciele_id_seq OWNED BY projekty_vrealizacii_uzemne_mechanizmy_ciele.id;


--
-- Name: projekty_vrealizacii_uzemne_mechanizmy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_vrealizacii_uzemne_mechanizmy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_vrealizacii_uzemne_mechanizmy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_vrealizacii_uzemne_mechanizmy_id_seq OWNED BY projekty_vrealizacii_uzemne_mechanizmy.id;


--
-- Name: projekty_vrealizacii_vyzva; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE projekty_vrealizacii_vyzva (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    projekty_vrealizacii_id bigint NOT NULL
);


--
-- Name: projekty_vrealizacii_vyzva_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE projekty_vrealizacii_vyzva_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projekty_vrealizacii_vyzva_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE projekty_vrealizacii_vyzva_id_seq OWNED BY projekty_vrealizacii_vyzva.id;


--
-- Name: subjekty; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE subjekty (
    id integer NOT NULL,
    itms_id integer NOT NULL,
    itms_href character varying,
    itms_created_at timestamp without time zone,
    itms_updated_at timestamp without time zone,
    dic character varying,
    gps_lat numeric,
    gps_lon numeric,
    ico character varying,
    ine_identifikacne_cislo character varying,
    nazov character varying,
    obec character varying,
    psc character varying,
    stat character varying,
    typ_ineho_identifikacneho_cisla character varying,
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
    itms_identifier bigint NOT NULL,
    celkova_vyska_dokladu numeric,
    cislo_dokladu character varying,
    cislo_zmluvy_s_dodavatelom_bez_vo character varying,
    nazov character varying,
    typ character varying,
    datum_uhrady timestamp without time zone,
    datum_vyhotovenia timestamp without time zone,
    updated_at timestamp without time zone,
    created_at timestamp without time zone
);


--
-- Name: uctovne_doklady_dodavatel; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE uctovne_doklady_dodavatel (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    uctovne_doklady_id bigint NOT NULL,
    ico character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: uctovne_doklady_dodavatel_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE uctovne_doklady_dodavatel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: uctovne_doklady_dodavatel_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE uctovne_doklady_dodavatel_id_seq OWNED BY uctovne_doklady_dodavatel.id;


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
-- Name: uctovne_doklady_polozky_dokladu; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE uctovne_doklady_polozky_dokladu (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    uctovne_doklady_id bigint NOT NULL,
    dph numeric,
    jednotkova_cena numeric,
    mnozstvo numeric,
    sadzba_dph numeric,
    suma_bez_dph numeric,
    suma_opravnena numeric,
    suma_spolu numeric,
    suma_ziadana numeric,
    suma_zrealizovanych_vydavkov numeric,
    nazov character varying,
    poradove_cislo bigint
);


--
-- Name: uctovne_doklady_polozky_dokladu_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE uctovne_doklady_polozky_dokladu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: uctovne_doklady_polozky_dokladu_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE uctovne_doklady_polozky_dokladu_id_seq OWNED BY uctovne_doklady_polozky_dokladu.id;


--
-- Name: uctovne_doklady_projekty; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE uctovne_doklady_projekty (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    uctovne_doklady_id bigint NOT NULL
);


--
-- Name: uctovne_doklady_projekty_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE uctovne_doklady_projekty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: uctovne_doklady_projekty_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE uctovne_doklady_projekty_id_seq OWNED BY uctovne_doklady_projekty.id;


--
-- Name: uctovne_doklady_verejne_obstaravania; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE uctovne_doklady_verejne_obstaravania (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    uctovne_doklady_id bigint NOT NULL
);


--
-- Name: uctovne_doklady_verejne_obstaravania_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE uctovne_doklady_verejne_obstaravania_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: uctovne_doklady_verejne_obstaravania_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE uctovne_doklady_verejne_obstaravania_id_seq OWNED BY uctovne_doklady_verejne_obstaravania.id;


--
-- Name: uctovne_doklady_vlastnik_dokladu; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE uctovne_doklady_vlastnik_dokladu (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    uctovne_doklady_id bigint NOT NULL,
    ico character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: uctovne_doklady_vlastnik_dokladu_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE uctovne_doklady_vlastnik_dokladu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: uctovne_doklady_vlastnik_dokladu_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE uctovne_doklady_vlastnik_dokladu_id_seq OWNED BY uctovne_doklady_vlastnik_dokladu.id;


--
-- Name: verejne_obstaravania; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE verejne_obstaravania (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    cislo_vestnika character varying,
    cislo_zverejnenia_vo_vestniku character varying,
    kod character varying,
    nazov character varying,
    stav character varying,
    url_odkaz_oznamenie character varying,
    pocet_prijatych_ponuk bigint,
    pocet_vylucenych_ponuk bigint,
    predpokladana_hodnota_zakazky numeric,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    datum_zverejnenia_vo_vestniku timestamp without time zone,
    zverejnene_vo_vestniku_eu boolean
);


--
-- Name: verejne_obstaravania_druh_zakazky; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE verejne_obstaravania_druh_zakazky (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    verejne_obstaravania_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: verejne_obstaravania_druh_zakazky_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE verejne_obstaravania_druh_zakazky_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: verejne_obstaravania_druh_zakazky_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE verejne_obstaravania_druh_zakazky_id_seq OWNED BY verejne_obstaravania_druh_zakazky.id;


--
-- Name: verejne_obstaravania_hlavny_predmet_doplnkovy_slovniky; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE verejne_obstaravania_hlavny_predmet_doplnkovy_slovniky (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    verejne_obstaravania_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: verejne_obstaravania_hlavny_predmet_doplnkovy_slovniky_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE verejne_obstaravania_hlavny_predmet_doplnkovy_slovniky_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: verejne_obstaravania_hlavny_predmet_doplnkovy_slovniky_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE verejne_obstaravania_hlavny_predmet_doplnkovy_slovniky_id_seq OWNED BY verejne_obstaravania_hlavny_predmet_doplnkovy_slovniky.id;


--
-- Name: verejne_obstaravania_hlavny_predmet_hlavny_slovniky; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE verejne_obstaravania_hlavny_predmet_hlavny_slovniky (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    verejne_obstaravania_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: verejne_obstaravania_hlavny_predmet_hlavny_slovniky_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE verejne_obstaravania_hlavny_predmet_hlavny_slovniky_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: verejne_obstaravania_hlavny_predmet_hlavny_slovniky_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE verejne_obstaravania_hlavny_predmet_hlavny_slovniky_id_seq OWNED BY verejne_obstaravania_hlavny_predmet_hlavny_slovniky.id;


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
-- Name: verejne_obstaravania_metody_vo; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE verejne_obstaravania_metody_vo (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    verejne_obstaravania_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: verejne_obstaravania_metody_vo_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE verejne_obstaravania_metody_vo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: verejne_obstaravania_metody_vo_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE verejne_obstaravania_metody_vo_id_seq OWNED BY verejne_obstaravania_metody_vo.id;


--
-- Name: verejne_obstaravania_obstaravatel; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE verejne_obstaravania_obstaravatel (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    verejne_obstaravania_id bigint NOT NULL,
    ico character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: verejne_obstaravania_obstaravatel_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE verejne_obstaravania_obstaravatel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: verejne_obstaravania_obstaravatel_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE verejne_obstaravania_obstaravatel_id_seq OWNED BY verejne_obstaravania_obstaravatel.id;


--
-- Name: verejne_obstaravania_operacne_programy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE verejne_obstaravania_operacne_programy (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    verejne_obstaravania_id bigint NOT NULL
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
-- Name: verejne_obstaravania_postup_obstaravania; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE verejne_obstaravania_postup_obstaravania (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    verejne_obstaravania_id bigint NOT NULL,
    kod_zdroj character varying,
    nazov character varying
);


--
-- Name: verejne_obstaravania_postup_obstaravania_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE verejne_obstaravania_postup_obstaravania_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: verejne_obstaravania_postup_obstaravania_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE verejne_obstaravania_postup_obstaravania_id_seq OWNED BY verejne_obstaravania_postup_obstaravania.id;


--
-- Name: verejne_obstaravania_projekty; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE verejne_obstaravania_projekty (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    verejne_obstaravania_id bigint NOT NULL
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
    itms_identifier bigint NOT NULL,
    verejne_obstaravania_id bigint NOT NULL
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
-- Name: verejne_obstaravania_zadavatel; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE verejne_obstaravania_zadavatel (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    verejne_obstaravania_id bigint NOT NULL,
    ico character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: verejne_obstaravania_zadavatel_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE verejne_obstaravania_zadavatel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: verejne_obstaravania_zadavatel_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE verejne_obstaravania_zadavatel_id_seq OWNED BY verejne_obstaravania_zadavatel.id;


--
-- Name: vyzvy_planovane; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE vyzvy_planovane (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    druh character varying,
    kod character varying,
    nazov character varying,
    stav character varying,
    typ character varying,
    alokacia_eu numeric,
    alokacia_sr numeric,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    technicka_asistencia boolean,
    typ1_kolo character varying,
    typ2_kolo character varying,
    datum_uzavretia1_kolo timestamp without time zone,
    datum_uzavretia2_kolo timestamp without time zone,
    datum_vyhlasenia1_kolo timestamp without time zone,
    datum_vyhlasenia2_kolo timestamp without time zone
);


--
-- Name: vyzvy_planovane_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE vyzvy_planovane_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    vyzvy_planovane_id bigint NOT NULL
);


--
-- Name: vyzvy_planovane_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE vyzvy_planovane_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_planovane_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE vyzvy_planovane_ciele_id_seq OWNED BY vyzvy_planovane_ciele.id;


--
-- Name: vyzvy_planovane_doplnujuce_info; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE vyzvy_planovane_doplnujuce_info (
    id integer NOT NULL,
    vyzvy_planovane_id bigint NOT NULL,
    nazov character varying,
    url character varying
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
-- Name: vyzvy_planovane_poskytovatelia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE vyzvy_planovane_poskytovatelia (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    vyzvy_planovane_id bigint NOT NULL,
    ico character varying,
    ine_identifikacne_cislo character varying
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
-- Name: vyzvy_planovane_vyhlasovatel; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE vyzvy_planovane_vyhlasovatel (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    vyzvy_planovane_id bigint NOT NULL,
    ico character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: vyzvy_planovane_vyhlasovatel_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE vyzvy_planovane_vyhlasovatel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_planovane_vyhlasovatel_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE vyzvy_planovane_vyhlasovatel_id_seq OWNED BY vyzvy_planovane_vyhlasovatel.id;


--
-- Name: vyzvy_vyhlasene; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE vyzvy_vyhlasene (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    druh character varying,
    kod character varying,
    nazov character varying,
    stav character varying,
    typ character varying,
    alokacia_eu numeric,
    alokacia_sr numeric,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    technicka_asistencia boolean,
    datum_uzavretia timestamp without time zone,
    datum_vyhlasenia timestamp without time zone
);


--
-- Name: vyzvy_vyhlasene_ciele; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE vyzvy_vyhlasene_ciele (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    vyzvy_vyhlasene_id bigint NOT NULL
);


--
-- Name: vyzvy_vyhlasene_ciele_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE vyzvy_vyhlasene_ciele_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_vyhlasene_ciele_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE vyzvy_vyhlasene_ciele_id_seq OWNED BY vyzvy_vyhlasene_ciele.id;


--
-- Name: vyzvy_vyhlasene_doplnujuce_info; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE vyzvy_vyhlasene_doplnujuce_info (
    id integer NOT NULL,
    vyzvy_vyhlasene_id bigint NOT NULL,
    nazov character varying,
    url character varying
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
    vyzvy_vyhlasene_id bigint NOT NULL,
    nazov character varying
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
-- Name: vyzvy_vyhlasene_poskytovatelia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE vyzvy_vyhlasene_poskytovatelia (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    vyzvy_vyhlasene_id bigint NOT NULL,
    ico character varying,
    ine_identifikacne_cislo character varying
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
-- Name: vyzvy_vyhlasene_vyhlasovatel; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE vyzvy_vyhlasene_vyhlasovatel (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    vyzvy_vyhlasene_id bigint NOT NULL,
    ico character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: vyzvy_vyhlasene_vyhlasovatel_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE vyzvy_vyhlasene_vyhlasovatel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vyzvy_vyhlasene_vyhlasovatel_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE vyzvy_vyhlasene_vyhlasovatel_id_seq OWNED BY vyzvy_vyhlasene_vyhlasovatel.id;


--
-- Name: vzvy_vyhlasene_kontaktne_osoby; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE vzvy_vyhlasene_kontaktne_osoby (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    vyzvy_vyhlasene_id bigint NOT NULL,
    email character varying,
    meno character varying,
    meno_uplne character varying,
    priezvisko character varying,
    telefon character varying
);


--
-- Name: vzvy_vyhlasene_kontaktne_osoby_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE vzvy_vyhlasene_kontaktne_osoby_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vzvy_vyhlasene_kontaktne_osoby_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE vzvy_vyhlasene_kontaktne_osoby_id_seq OWNED BY vzvy_vyhlasene_kontaktne_osoby.id;


--
-- Name: vzvy_vyhlasene_planovane_vyzvy; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE vzvy_vyhlasene_planovane_vyzvy (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    vyzvy_vyhlasene_id bigint NOT NULL
);


--
-- Name: vzvy_vyhlasene_planovane_vyzvy_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE vzvy_vyhlasene_planovane_vyzvy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vzvy_vyhlasene_planovane_vyzvy_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE vzvy_vyhlasene_planovane_vyzvy_id_seq OWNED BY vzvy_vyhlasene_planovane_vyzvy.id;


--
-- Name: vzvy_vyhlasene_posudzovane_obdobia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE vzvy_vyhlasene_posudzovane_obdobia (
    id integer NOT NULL,
    vyzvy_vyhlasene_id bigint NOT NULL,
    datum_uzavierky character varying,
    poradove_cislo bigint
);


--
-- Name: vzvy_vyhlasene_posudzovane_obdobia_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE vzvy_vyhlasene_posudzovane_obdobia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vzvy_vyhlasene_posudzovane_obdobia_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE vzvy_vyhlasene_posudzovane_obdobia_id_seq OWNED BY vzvy_vyhlasene_posudzovane_obdobia.id;


--
-- Name: zmluvy_verejne_obstaravanie; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zmluvy_verejne_obstaravanie (
    id integer NOT NULL,
    verejne_obstaravania_id bigint NOT NULL,
    itms_identifier bigint NOT NULL,
    cislo_zmluvy character varying,
    kod character varying,
    nazov character varying,
    predmet_zmluvy character varying,
    url_odkaz_na_zmluvu character varying,
    celkova_suma_zmluvy numeric,
    suma_bez_dph numeric,
    datum_platnosti timestamp without time zone,
    datum_ucinnosti timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: zmluvy_verejne_obstaravanie_dalsie_url; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zmluvy_verejne_obstaravanie_dalsie_url (
    id integer NOT NULL,
    zmluvy_verejne_obstaravanie_id bigint NOT NULL,
    nazov character varying,
    url character varying
);


--
-- Name: zmluvy_verejne_obstaravanie_dalsie_url_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zmluvy_verejne_obstaravanie_dalsie_url_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zmluvy_verejne_obstaravanie_dalsie_url_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zmluvy_verejne_obstaravanie_dalsie_url_id_seq OWNED BY zmluvy_verejne_obstaravanie_dalsie_url.id;


--
-- Name: zmluvy_verejne_obstaravanie_dodavatelia; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zmluvy_verejne_obstaravanie_dodavatelia (
    id integer NOT NULL,
    zmluvy_verejne_obstaravanie_id bigint NOT NULL,
    je_hlavny_dodavatel boolean
);


--
-- Name: zmluvy_verejne_obstaravanie_dodavatelia_dodavatel; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zmluvy_verejne_obstaravanie_dodavatelia_dodavatel (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zmluvy_verejne_obstaravanie_dodavatelia_id bigint NOT NULL,
    ico character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: zmluvy_verejne_obstaravanie_dodavatelia_dodavatel_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zmluvy_verejne_obstaravanie_dodavatelia_dodavatel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zmluvy_verejne_obstaravanie_dodavatelia_dodavatel_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zmluvy_verejne_obstaravanie_dodavatelia_dodavatel_id_seq OWNED BY zmluvy_verejne_obstaravanie_dodavatelia_dodavatel.id;


--
-- Name: zmluvy_verejne_obstaravanie_dodavatelia_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zmluvy_verejne_obstaravanie_dodavatelia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zmluvy_verejne_obstaravanie_dodavatelia_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zmluvy_verejne_obstaravanie_dodavatelia_id_seq OWNED BY zmluvy_verejne_obstaravanie_dodavatelia.id;


--
-- Name: zmluvy_verejne_obstaravanie_hlavny_dodavatel; Type: TABLE; Schema: itms; Owner: -
--

CREATE TABLE zmluvy_verejne_obstaravanie_hlavny_dodavatel (
    id integer NOT NULL,
    itms_identifier bigint NOT NULL,
    zmluvy_verejne_obstaravanie_id bigint NOT NULL,
    ico character varying,
    ine_identifikacne_cislo character varying
);


--
-- Name: zmluvy_verejne_obstaravanie_hlavny_dodavatel_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zmluvy_verejne_obstaravanie_hlavny_dodavatel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zmluvy_verejne_obstaravanie_hlavny_dodavatel_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zmluvy_verejne_obstaravanie_hlavny_dodavatel_id_seq OWNED BY zmluvy_verejne_obstaravanie_hlavny_dodavatel.id;


--
-- Name: zmluvy_verejne_obstaravanie_id_seq; Type: SEQUENCE; Schema: itms; Owner: -
--

CREATE SEQUENCE zmluvy_verejne_obstaravanie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: zmluvy_verejne_obstaravanie_id_seq; Type: SEQUENCE OWNED BY; Schema: itms; Owner: -
--

ALTER SEQUENCE zmluvy_verejne_obstaravanie_id_seq OWNED BY zmluvy_verejne_obstaravanie.id;


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

ALTER TABLE ONLY dodavatelia ALTER COLUMN id SET DEFAULT nextval('dodavatelia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY kody ALTER COLUMN id SET DEFAULT nextval('kody_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY kody_konkretnych_cielov ALTER COLUMN id SET DEFAULT nextval('kody_konkretnych_cielov_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY konkretne_ciele ALTER COLUMN id SET DEFAULT nextval('konkretne_ciele_id_seq'::regclass);


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

ALTER TABLE ONLY operacne_programy ALTER COLUMN id SET DEFAULT nextval('operacne_programy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY pohladavkove_doklady ALTER COLUMN id SET DEFAULT nextval('pohladavkove_doklady_id_seq'::regclass);


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

ALTER TABLE ONLY projekty_oblasti_intervencie ALTER COLUMN id SET DEFAULT nextval('projekty_oblasti_intervencie_id_seq'::regclass);


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

ALTER TABLE ONLY projekty_ukoncene ALTER COLUMN id SET DEFAULT nextval('projekty_ukoncene_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_aktivity ALTER COLUMN id SET DEFAULT nextval('projekty_ukoncene_aktivity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_aktivity_subjekty ALTER COLUMN id SET DEFAULT nextval('projekty_ukoncene_aktivity_subjekty_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_formy_financovania ALTER COLUMN id SET DEFAULT nextval('projekty_ukoncene_formy_financovania_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_formy_financovania_ciele ALTER COLUMN id SET DEFAULT nextval('projekty_ukoncene_formy_financovania_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_hospodarske_cinnosti ALTER COLUMN id SET DEFAULT nextval('projekty_ukoncene_hospodarske_cinnosti_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_hospodarske_cinnosti_ciele ALTER COLUMN id SET DEFAULT nextval('projekty_ukoncene_hospodarske_cinnosti_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_intenzity ALTER COLUMN id SET DEFAULT nextval('projekty_ukoncene_intenzity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_intenzity_subjekty ALTER COLUMN id SET DEFAULT nextval('projekty_ukoncene_intenzity_subjekty_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_intenzity_zdroje ALTER COLUMN id SET DEFAULT nextval('projekty_ukoncene_intenzity_zdroje_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_meratelne_ukazovatele ALTER COLUMN id SET DEFAULT nextval('projekty_ukoncene_meratelne_ukazovatele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_miesta_realizacie ALTER COLUMN id SET DEFAULT nextval('projekty_ukoncene_miesta_realizacie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_miesta_realizacie_units ALTER COLUMN id SET DEFAULT nextval('projekty_ukoncene_miesta_realizacie_units_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_monitorovacie_terminy ALTER COLUMN id SET DEFAULT nextval('projekty_ukoncene_monitorovacie_terminy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_oblasti_intervencie ALTER COLUMN id SET DEFAULT nextval('projekty_ukoncene_oblasti_intervencie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_oblasti_intervencie_ciele ALTER COLUMN id SET DEFAULT nextval('projekty_ukoncene_oblasti_intervencie_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_organizacne_zlozky ALTER COLUMN id SET DEFAULT nextval('projekty_ukoncene_organizacne_zlozky_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_partneri ALTER COLUMN id SET DEFAULT nextval('projekty_ukoncene_partneri_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_prijimatel ALTER COLUMN id SET DEFAULT nextval('projekty_ukoncene_prijimatel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_schvalene_zonfp ALTER COLUMN id SET DEFAULT nextval('projekty_ukoncene_schvalene_zonfp_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_typy_uzemia ALTER COLUMN id SET DEFAULT nextval('projekty_ukoncene_typy_uzemia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_typy_uzemia_ciele ALTER COLUMN id SET DEFAULT nextval('projekty_ukoncene_typy_uzemia_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_uzemne_mechanizmy ALTER COLUMN id SET DEFAULT nextval('projekty_ukoncene_uzemne_mechanizmy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_uzemne_mechanizmy_ciele ALTER COLUMN id SET DEFAULT nextval('projekty_ukoncene_uzemne_mechanizmy_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_vyzva ALTER COLUMN id SET DEFAULT nextval('projekty_ukoncene_vyzva_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_uzemne_mechanizmy ALTER COLUMN id SET DEFAULT nextval('projekty_uzemne_mechanizmy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii ALTER COLUMN id SET DEFAULT nextval('projekty_vrealizacii_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_aktivity ALTER COLUMN id SET DEFAULT nextval('projekty_vrealizacii_aktivity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_aktivity_subjekty ALTER COLUMN id SET DEFAULT nextval('projekty_vrealizacii_aktivity_subjekty_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_formy_financovania ALTER COLUMN id SET DEFAULT nextval('projekty_vrealizacii_formy_financovania_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_formy_financovania_ciele ALTER COLUMN id SET DEFAULT nextval('projekty_vrealizacii_formy_financovania_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_hospodarske_cinnosti ALTER COLUMN id SET DEFAULT nextval('projekty_vrealizacii_hospodarske_cinnosti_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_hospodarske_cinnosti_ciele ALTER COLUMN id SET DEFAULT nextval('projekty_vrealizacii_hospodarske_cinnosti_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_intenzity ALTER COLUMN id SET DEFAULT nextval('projekty_vrealizacii_intenzity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_intenzity_subjekty ALTER COLUMN id SET DEFAULT nextval('projekty_vrealizacii_intenzity_subjekty_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_intenzity_zdroje ALTER COLUMN id SET DEFAULT nextval('projekty_vrealizacii_intenzity_zdroje_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_meratelne_ukazovatele ALTER COLUMN id SET DEFAULT nextval('projekty_vrealizacii_meratelne_ukazovatele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_miesta_realizacie ALTER COLUMN id SET DEFAULT nextval('projekty_vrealizacii_miesta_realizacie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_miesta_realizacie_units ALTER COLUMN id SET DEFAULT nextval('projekty_vrealizacii_miesta_realizacie_units_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_monitorovacie_terminy ALTER COLUMN id SET DEFAULT nextval('projekty_vrealizacii_monitorovacie_terminy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_oblasti_intervencie ALTER COLUMN id SET DEFAULT nextval('projekty_vrealizacii_oblasti_intervencie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_oblasti_intervencie_ciele ALTER COLUMN id SET DEFAULT nextval('projekty_vrealizacii_oblasti_intervencie_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_organizacne_zlozky ALTER COLUMN id SET DEFAULT nextval('projekty_vrealizacii_organizacne_zlozky_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_partneri ALTER COLUMN id SET DEFAULT nextval('projekty_vrealizacii_partneri_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_prijimatel ALTER COLUMN id SET DEFAULT nextval('projekty_vrealizacii_prijimatel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_schvalene_zonfp ALTER COLUMN id SET DEFAULT nextval('projekty_vrealizacii_schvalene_zonfp_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_typy_uzemia ALTER COLUMN id SET DEFAULT nextval('projekty_vrealizacii_typy_uzemia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_typy_uzemia_ciele ALTER COLUMN id SET DEFAULT nextval('projekty_vrealizacii_typy_uzemia_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_uzemne_mechanizmy ALTER COLUMN id SET DEFAULT nextval('projekty_vrealizacii_uzemne_mechanizmy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_uzemne_mechanizmy_ciele ALTER COLUMN id SET DEFAULT nextval('projekty_vrealizacii_uzemne_mechanizmy_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_vyzva ALTER COLUMN id SET DEFAULT nextval('projekty_vrealizacii_vyzva_id_seq'::regclass);


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

ALTER TABLE ONLY uctovne_doklady_dodavatel ALTER COLUMN id SET DEFAULT nextval('uctovne_doklady_dodavatel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY uctovne_doklady_polozky_dokladu ALTER COLUMN id SET DEFAULT nextval('uctovne_doklady_polozky_dokladu_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY uctovne_doklady_projekty ALTER COLUMN id SET DEFAULT nextval('uctovne_doklady_projekty_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY uctovne_doklady_verejne_obstaravania ALTER COLUMN id SET DEFAULT nextval('uctovne_doklady_verejne_obstaravania_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY uctovne_doklady_vlastnik_dokladu ALTER COLUMN id SET DEFAULT nextval('uctovne_doklady_vlastnik_dokladu_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania ALTER COLUMN id SET DEFAULT nextval('verejne_obstaravania_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_druh_zakazky ALTER COLUMN id SET DEFAULT nextval('verejne_obstaravania_druh_zakazky_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_hlavny_predmet_doplnkovy_slovniky ALTER COLUMN id SET DEFAULT nextval('verejne_obstaravania_hlavny_predmet_doplnkovy_slovniky_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_hlavny_predmet_hlavny_slovniky ALTER COLUMN id SET DEFAULT nextval('verejne_obstaravania_hlavny_predmet_hlavny_slovniky_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_metody_vo ALTER COLUMN id SET DEFAULT nextval('verejne_obstaravania_metody_vo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_obstaravatel ALTER COLUMN id SET DEFAULT nextval('verejne_obstaravania_obstaravatel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_operacne_programy ALTER COLUMN id SET DEFAULT nextval('verejne_obstaravania_operacne_programy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_postup_obstaravania ALTER COLUMN id SET DEFAULT nextval('verejne_obstaravania_postup_obstaravania_id_seq'::regclass);


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

ALTER TABLE ONLY verejne_obstaravania_zadavatel ALTER COLUMN id SET DEFAULT nextval('verejne_obstaravania_zadavatel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane ALTER COLUMN id SET DEFAULT nextval('vyzvy_planovane_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane_ciele ALTER COLUMN id SET DEFAULT nextval('vyzvy_planovane_ciele_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane_doplnujuce_info ALTER COLUMN id SET DEFAULT nextval('vyzvy_planovane_doplnujuce_info_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane_poskytovatelia ALTER COLUMN id SET DEFAULT nextval('vyzvy_planovane_poskytovatelia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane_vyhlasovatel ALTER COLUMN id SET DEFAULT nextval('vyzvy_planovane_vyhlasovatel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene ALTER COLUMN id SET DEFAULT nextval('vyzvy_vyhlasene_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_ciele ALTER COLUMN id SET DEFAULT nextval('vyzvy_vyhlasene_ciele_id_seq'::regclass);


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

ALTER TABLE ONLY vyzvy_vyhlasene_poskytovatelia ALTER COLUMN id SET DEFAULT nextval('vyzvy_vyhlasene_poskytovatelia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_vyhlasovatel ALTER COLUMN id SET DEFAULT nextval('vyzvy_vyhlasene_vyhlasovatel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vzvy_vyhlasene_kontaktne_osoby ALTER COLUMN id SET DEFAULT nextval('vzvy_vyhlasene_kontaktne_osoby_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vzvy_vyhlasene_planovane_vyzvy ALTER COLUMN id SET DEFAULT nextval('vzvy_vyhlasene_planovane_vyzvy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vzvy_vyhlasene_posudzovane_obdobia ALTER COLUMN id SET DEFAULT nextval('vzvy_vyhlasene_posudzovane_obdobia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravanie ALTER COLUMN id SET DEFAULT nextval('zmluvy_verejne_obstaravanie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravanie_dalsie_url ALTER COLUMN id SET DEFAULT nextval('zmluvy_verejne_obstaravanie_dalsie_url_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravanie_dodavatelia ALTER COLUMN id SET DEFAULT nextval('zmluvy_verejne_obstaravanie_dodavatelia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravanie_dodavatelia_dodavatel ALTER COLUMN id SET DEFAULT nextval('zmluvy_verejne_obstaravanie_dodavatelia_dodavatel_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravanie_hlavny_dodavatel ALTER COLUMN id SET DEFAULT nextval('zmluvy_verejne_obstaravanie_hlavny_dodavatel_id_seq'::regclass);


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
-- Name: dodavatelia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY dodavatelia
    ADD CONSTRAINT dodavatelia_pkey PRIMARY KEY (id);


--
-- Name: kody_konkretnych_cielov_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY kody_konkretnych_cielov
    ADD CONSTRAINT kody_konkretnych_cielov_pkey PRIMARY KEY (id);


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
-- Name: operacne_programy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY operacne_programy
    ADD CONSTRAINT operacne_programy_pkey PRIMARY KEY (id);


--
-- Name: pohladavkove_doklady_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY pohladavkove_doklady
    ADD CONSTRAINT pohladavkove_doklady_pkey PRIMARY KEY (id);


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
-- Name: projekty_oblasti_intervencie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_oblasti_intervencie
    ADD CONSTRAINT projekty_oblasti_intervencie_pkey PRIMARY KEY (id);


--
-- Name: projekty_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty
    ADD CONSTRAINT projekty_pkey PRIMARY KEY (id);


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
-- Name: projekty_ukoncene_aktivity_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_aktivity
    ADD CONSTRAINT projekty_ukoncene_aktivity_pkey PRIMARY KEY (id);


--
-- Name: projekty_ukoncene_aktivity_subjekty_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_aktivity_subjekty
    ADD CONSTRAINT projekty_ukoncene_aktivity_subjekty_pkey PRIMARY KEY (id);


--
-- Name: projekty_ukoncene_formy_financovania_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_formy_financovania_ciele
    ADD CONSTRAINT projekty_ukoncene_formy_financovania_ciele_pkey PRIMARY KEY (id);


--
-- Name: projekty_ukoncene_formy_financovania_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_formy_financovania
    ADD CONSTRAINT projekty_ukoncene_formy_financovania_pkey PRIMARY KEY (id);


--
-- Name: projekty_ukoncene_hospodarske_cinnosti_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_hospodarske_cinnosti_ciele
    ADD CONSTRAINT projekty_ukoncene_hospodarske_cinnosti_ciele_pkey PRIMARY KEY (id);


--
-- Name: projekty_ukoncene_hospodarske_cinnosti_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_hospodarske_cinnosti
    ADD CONSTRAINT projekty_ukoncene_hospodarske_cinnosti_pkey PRIMARY KEY (id);


--
-- Name: projekty_ukoncene_intenzity_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_intenzity
    ADD CONSTRAINT projekty_ukoncene_intenzity_pkey PRIMARY KEY (id);


--
-- Name: projekty_ukoncene_intenzity_subjekty_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_intenzity_subjekty
    ADD CONSTRAINT projekty_ukoncene_intenzity_subjekty_pkey PRIMARY KEY (id);


--
-- Name: projekty_ukoncene_intenzity_zdroje_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_intenzity_zdroje
    ADD CONSTRAINT projekty_ukoncene_intenzity_zdroje_pkey PRIMARY KEY (id);


--
-- Name: projekty_ukoncene_meratelne_ukazovatele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_meratelne_ukazovatele
    ADD CONSTRAINT projekty_ukoncene_meratelne_ukazovatele_pkey PRIMARY KEY (id);


--
-- Name: projekty_ukoncene_miesta_realizacie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_miesta_realizacie
    ADD CONSTRAINT projekty_ukoncene_miesta_realizacie_pkey PRIMARY KEY (id);


--
-- Name: projekty_ukoncene_miesta_realizacie_units_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_miesta_realizacie_units
    ADD CONSTRAINT projekty_ukoncene_miesta_realizacie_units_pkey PRIMARY KEY (id);


--
-- Name: projekty_ukoncene_monitorovacie_terminy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_monitorovacie_terminy
    ADD CONSTRAINT projekty_ukoncene_monitorovacie_terminy_pkey PRIMARY KEY (id);


--
-- Name: projekty_ukoncene_oblasti_intervencie_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_oblasti_intervencie_ciele
    ADD CONSTRAINT projekty_ukoncene_oblasti_intervencie_ciele_pkey PRIMARY KEY (id);


--
-- Name: projekty_ukoncene_oblasti_intervencie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_oblasti_intervencie
    ADD CONSTRAINT projekty_ukoncene_oblasti_intervencie_pkey PRIMARY KEY (id);


--
-- Name: projekty_ukoncene_organizacne_zlozky_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_organizacne_zlozky
    ADD CONSTRAINT projekty_ukoncene_organizacne_zlozky_pkey PRIMARY KEY (id);


--
-- Name: projekty_ukoncene_partneri_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_partneri
    ADD CONSTRAINT projekty_ukoncene_partneri_pkey PRIMARY KEY (id);


--
-- Name: projekty_ukoncene_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene
    ADD CONSTRAINT projekty_ukoncene_pkey PRIMARY KEY (id);


--
-- Name: projekty_ukoncene_prijimatel_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_prijimatel
    ADD CONSTRAINT projekty_ukoncene_prijimatel_pkey PRIMARY KEY (id);


--
-- Name: projekty_ukoncene_schvalene_zonfp_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_schvalene_zonfp
    ADD CONSTRAINT projekty_ukoncene_schvalene_zonfp_pkey PRIMARY KEY (id);


--
-- Name: projekty_ukoncene_typy_uzemia_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_typy_uzemia_ciele
    ADD CONSTRAINT projekty_ukoncene_typy_uzemia_ciele_pkey PRIMARY KEY (id);


--
-- Name: projekty_ukoncene_typy_uzemia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_typy_uzemia
    ADD CONSTRAINT projekty_ukoncene_typy_uzemia_pkey PRIMARY KEY (id);


--
-- Name: projekty_ukoncene_uzemne_mechanizmy_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_uzemne_mechanizmy_ciele
    ADD CONSTRAINT projekty_ukoncene_uzemne_mechanizmy_ciele_pkey PRIMARY KEY (id);


--
-- Name: projekty_ukoncene_uzemne_mechanizmy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_uzemne_mechanizmy
    ADD CONSTRAINT projekty_ukoncene_uzemne_mechanizmy_pkey PRIMARY KEY (id);


--
-- Name: projekty_ukoncene_vyzva_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_vyzva
    ADD CONSTRAINT projekty_ukoncene_vyzva_pkey PRIMARY KEY (id);


--
-- Name: projekty_uzemne_mechanizmy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_uzemne_mechanizmy
    ADD CONSTRAINT projekty_uzemne_mechanizmy_pkey PRIMARY KEY (id);


--
-- Name: projekty_vrealizacii_aktivity_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_aktivity
    ADD CONSTRAINT projekty_vrealizacii_aktivity_pkey PRIMARY KEY (id);


--
-- Name: projekty_vrealizacii_aktivity_subjekty_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_aktivity_subjekty
    ADD CONSTRAINT projekty_vrealizacii_aktivity_subjekty_pkey PRIMARY KEY (id);


--
-- Name: projekty_vrealizacii_formy_financovania_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_formy_financovania_ciele
    ADD CONSTRAINT projekty_vrealizacii_formy_financovania_ciele_pkey PRIMARY KEY (id);


--
-- Name: projekty_vrealizacii_formy_financovania_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_formy_financovania
    ADD CONSTRAINT projekty_vrealizacii_formy_financovania_pkey PRIMARY KEY (id);


--
-- Name: projekty_vrealizacii_hospodarske_cinnosti_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_hospodarske_cinnosti_ciele
    ADD CONSTRAINT projekty_vrealizacii_hospodarske_cinnosti_ciele_pkey PRIMARY KEY (id);


--
-- Name: projekty_vrealizacii_hospodarske_cinnosti_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_hospodarske_cinnosti
    ADD CONSTRAINT projekty_vrealizacii_hospodarske_cinnosti_pkey PRIMARY KEY (id);


--
-- Name: projekty_vrealizacii_intenzity_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_intenzity
    ADD CONSTRAINT projekty_vrealizacii_intenzity_pkey PRIMARY KEY (id);


--
-- Name: projekty_vrealizacii_intenzity_subjekty_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_intenzity_subjekty
    ADD CONSTRAINT projekty_vrealizacii_intenzity_subjekty_pkey PRIMARY KEY (id);


--
-- Name: projekty_vrealizacii_intenzity_zdroje_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_intenzity_zdroje
    ADD CONSTRAINT projekty_vrealizacii_intenzity_zdroje_pkey PRIMARY KEY (id);


--
-- Name: projekty_vrealizacii_meratelne_ukazovatele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_meratelne_ukazovatele
    ADD CONSTRAINT projekty_vrealizacii_meratelne_ukazovatele_pkey PRIMARY KEY (id);


--
-- Name: projekty_vrealizacii_miesta_realizacie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_miesta_realizacie
    ADD CONSTRAINT projekty_vrealizacii_miesta_realizacie_pkey PRIMARY KEY (id);


--
-- Name: projekty_vrealizacii_miesta_realizacie_units_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_miesta_realizacie_units
    ADD CONSTRAINT projekty_vrealizacii_miesta_realizacie_units_pkey PRIMARY KEY (id);


--
-- Name: projekty_vrealizacii_monitorovacie_terminy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_monitorovacie_terminy
    ADD CONSTRAINT projekty_vrealizacii_monitorovacie_terminy_pkey PRIMARY KEY (id);


--
-- Name: projekty_vrealizacii_oblasti_intervencie_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_oblasti_intervencie_ciele
    ADD CONSTRAINT projekty_vrealizacii_oblasti_intervencie_ciele_pkey PRIMARY KEY (id);


--
-- Name: projekty_vrealizacii_oblasti_intervencie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_oblasti_intervencie
    ADD CONSTRAINT projekty_vrealizacii_oblasti_intervencie_pkey PRIMARY KEY (id);


--
-- Name: projekty_vrealizacii_organizacne_zlozky_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_organizacne_zlozky
    ADD CONSTRAINT projekty_vrealizacii_organizacne_zlozky_pkey PRIMARY KEY (id);


--
-- Name: projekty_vrealizacii_partneri_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_partneri
    ADD CONSTRAINT projekty_vrealizacii_partneri_pkey PRIMARY KEY (id);


--
-- Name: projekty_vrealizacii_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii
    ADD CONSTRAINT projekty_vrealizacii_pkey PRIMARY KEY (id);


--
-- Name: projekty_vrealizacii_prijimatel_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_prijimatel
    ADD CONSTRAINT projekty_vrealizacii_prijimatel_pkey PRIMARY KEY (id);


--
-- Name: projekty_vrealizacii_schvalene_zonfp_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_schvalene_zonfp
    ADD CONSTRAINT projekty_vrealizacii_schvalene_zonfp_pkey PRIMARY KEY (id);


--
-- Name: projekty_vrealizacii_typy_uzemia_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_typy_uzemia_ciele
    ADD CONSTRAINT projekty_vrealizacii_typy_uzemia_ciele_pkey PRIMARY KEY (id);


--
-- Name: projekty_vrealizacii_typy_uzemia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_typy_uzemia
    ADD CONSTRAINT projekty_vrealizacii_typy_uzemia_pkey PRIMARY KEY (id);


--
-- Name: projekty_vrealizacii_uzemne_mechanizmy_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_uzemne_mechanizmy_ciele
    ADD CONSTRAINT projekty_vrealizacii_uzemne_mechanizmy_ciele_pkey PRIMARY KEY (id);


--
-- Name: projekty_vrealizacii_uzemne_mechanizmy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_uzemne_mechanizmy
    ADD CONSTRAINT projekty_vrealizacii_uzemne_mechanizmy_pkey PRIMARY KEY (id);


--
-- Name: projekty_vrealizacii_vyzva_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_vyzva
    ADD CONSTRAINT projekty_vrealizacii_vyzva_pkey PRIMARY KEY (id);


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
-- Name: uctovne_doklady_dodavatel_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY uctovne_doklady_dodavatel
    ADD CONSTRAINT uctovne_doklady_dodavatel_pkey PRIMARY KEY (id);


--
-- Name: uctovne_doklady_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY uctovne_doklady
    ADD CONSTRAINT uctovne_doklady_pkey PRIMARY KEY (id);


--
-- Name: uctovne_doklady_polozky_dokladu_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY uctovne_doklady_polozky_dokladu
    ADD CONSTRAINT uctovne_doklady_polozky_dokladu_pkey PRIMARY KEY (id);


--
-- Name: uctovne_doklady_projekty_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY uctovne_doklady_projekty
    ADD CONSTRAINT uctovne_doklady_projekty_pkey PRIMARY KEY (id);


--
-- Name: uctovne_doklady_verejne_obstaravania_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY uctovne_doklady_verejne_obstaravania
    ADD CONSTRAINT uctovne_doklady_verejne_obstaravania_pkey PRIMARY KEY (id);


--
-- Name: uctovne_doklady_vlastnik_dokladu_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY uctovne_doklady_vlastnik_dokladu
    ADD CONSTRAINT uctovne_doklady_vlastnik_dokladu_pkey PRIMARY KEY (id);


--
-- Name: verejne_obstaravania_druh_zakazky_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_druh_zakazky
    ADD CONSTRAINT verejne_obstaravania_druh_zakazky_pkey PRIMARY KEY (id);


--
-- Name: verejne_obstaravania_hlavny_predmet_doplnkovy_slovniky_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_hlavny_predmet_doplnkovy_slovniky
    ADD CONSTRAINT verejne_obstaravania_hlavny_predmet_doplnkovy_slovniky_pkey PRIMARY KEY (id);


--
-- Name: verejne_obstaravania_hlavny_predmet_hlavny_slovniky_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_hlavny_predmet_hlavny_slovniky
    ADD CONSTRAINT verejne_obstaravania_hlavny_predmet_hlavny_slovniky_pkey PRIMARY KEY (id);


--
-- Name: verejne_obstaravania_metody_vo_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_metody_vo
    ADD CONSTRAINT verejne_obstaravania_metody_vo_pkey PRIMARY KEY (id);


--
-- Name: verejne_obstaravania_obstaravatel_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_obstaravatel
    ADD CONSTRAINT verejne_obstaravania_obstaravatel_pkey PRIMARY KEY (id);


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
-- Name: verejne_obstaravania_postup_obstaravania_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_postup_obstaravania
    ADD CONSTRAINT verejne_obstaravania_postup_obstaravania_pkey PRIMARY KEY (id);


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
-- Name: verejne_obstaravania_zadavatel_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_zadavatel
    ADD CONSTRAINT verejne_obstaravania_zadavatel_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_planovane_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane_ciele
    ADD CONSTRAINT vyzvy_planovane_ciele_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_planovane_doplnujuce_info_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane_doplnujuce_info
    ADD CONSTRAINT vyzvy_planovane_doplnujuce_info_pkey PRIMARY KEY (id);


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
-- Name: vyzvy_planovane_vyhlasovatel_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane_vyhlasovatel
    ADD CONSTRAINT vyzvy_planovane_vyhlasovatel_pkey PRIMARY KEY (id);


--
-- Name: vyzvy_vyhlasene_ciele_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_ciele
    ADD CONSTRAINT vyzvy_vyhlasene_ciele_pkey PRIMARY KEY (id);


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
-- Name: vyzvy_vyhlasene_vyhlasovatel_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_vyhlasovatel
    ADD CONSTRAINT vyzvy_vyhlasene_vyhlasovatel_pkey PRIMARY KEY (id);


--
-- Name: vzvy_vyhlasene_kontaktne_osoby_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vzvy_vyhlasene_kontaktne_osoby
    ADD CONSTRAINT vzvy_vyhlasene_kontaktne_osoby_pkey PRIMARY KEY (id);


--
-- Name: vzvy_vyhlasene_planovane_vyzvy_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vzvy_vyhlasene_planovane_vyzvy
    ADD CONSTRAINT vzvy_vyhlasene_planovane_vyzvy_pkey PRIMARY KEY (id);


--
-- Name: vzvy_vyhlasene_posudzovane_obdobia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vzvy_vyhlasene_posudzovane_obdobia
    ADD CONSTRAINT vzvy_vyhlasene_posudzovane_obdobia_pkey PRIMARY KEY (id);


--
-- Name: zmluvy_verejne_obstaravanie_dalsie_url_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravanie_dalsie_url
    ADD CONSTRAINT zmluvy_verejne_obstaravanie_dalsie_url_pkey PRIMARY KEY (id);


--
-- Name: zmluvy_verejne_obstaravanie_dodavatelia_dodavatel_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravanie_dodavatelia_dodavatel
    ADD CONSTRAINT zmluvy_verejne_obstaravanie_dodavatelia_dodavatel_pkey PRIMARY KEY (id);


--
-- Name: zmluvy_verejne_obstaravanie_dodavatelia_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravanie_dodavatelia
    ADD CONSTRAINT zmluvy_verejne_obstaravanie_dodavatelia_pkey PRIMARY KEY (id);


--
-- Name: zmluvy_verejne_obstaravanie_hlavny_dodavatel_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravanie_hlavny_dodavatel
    ADD CONSTRAINT zmluvy_verejne_obstaravanie_hlavny_dodavatel_pkey PRIMARY KEY (id);


--
-- Name: zmluvy_verejne_obstaravanie_pkey; Type: CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravanie
    ADD CONSTRAINT zmluvy_verejne_obstaravanie_pkey PRIMARY KEY (id);


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
-- Name: index_itms.kody_konkretnych_cielov_on_kod_and_zdroj_and_ciel; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.kody_konkretnych_cielov_on_kod_and_zdroj_and_ciel" ON kody_konkretnych_cielov USING btree (kod_id, kod_zdroj, konkretny_ciel_id);


--
-- Name: index_itms.kody_konkretnych_cielov_on_konkretny_ciel_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.kody_konkretnych_cielov_on_konkretny_ciel_id" ON kody_konkretnych_cielov USING btree (konkretny_ciel_id);


--
-- Name: index_itms.kody_on_kod_id_and_kod_zdroj; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.kody_on_kod_id_and_kod_zdroj" ON kody USING btree (kod_id, kod_zdroj);


--
-- Name: index_itms.konkretne_ciele_on_fond_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.konkretne_ciele_on_fond_id" ON konkretne_ciele USING btree (fond_id);


--
-- Name: index_itms.konkretne_ciele_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.konkretne_ciele_on_itms_id" ON konkretne_ciele USING btree (itms_id);


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
-- Name: index_itms.operacne_programy_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.operacne_programy_on_itms_id" ON operacne_programy USING btree (itms_id);


--
-- Name: index_itms.operacne_programy_on_subjekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.operacne_programy_on_subjekt_id" ON operacne_programy USING btree (subjekt_id);


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
-- Name: index_itms.projekty_formy_financovania_on_forma_financovania_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_formy_financovania_on_forma_financovania_id" ON projekty_formy_financovania USING btree (forma_financovania_id);


--
-- Name: index_itms.projekty_formy_financovania_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_formy_financovania_on_projekt_id" ON projekty_formy_financovania USING btree (projekt_id);


--
-- Name: index_itms.projekty_hospodarske_cinnosti_hosp_cinnost; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_hospodarske_cinnosti_hosp_cinnost" ON projekty_hospodarske_cinnosti USING btree (hospodarska_cinnost_id);


--
-- Name: index_itms.projekty_hospodarske_cinnosti_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_hospodarske_cinnosti_on_projekt_id" ON projekty_hospodarske_cinnosti USING btree (projekt_id);


--
-- Name: index_itms.projekty_oblasti_intervencie_oblast; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_oblasti_intervencie_oblast" ON projekty_oblasti_intervencie USING btree (oblast_intervencie_id);


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
-- Name: index_itms.projekty_sekundarne_tematicke_okruhy_okruh; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_sekundarne_tematicke_okruhy_okruh" ON projekty_sekundarne_tematicke_okruhy USING btree (sekundarny_tematicky_okruh_id);


--
-- Name: index_itms.projekty_sekundarne_tematicke_okruhy_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_sekundarne_tematicke_okruhy_on_projekt_id" ON projekty_sekundarne_tematicke_okruhy USING btree (projekt_id);


--
-- Name: index_itms.projekty_typy_uzemia_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_typy_uzemia_on_projekt_id" ON projekty_typy_uzemia USING btree (projekt_id);


--
-- Name: index_itms.projekty_typy_uzemia_on_typ_uzemia_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_typy_uzemia_on_typ_uzemia_id" ON projekty_typy_uzemia USING btree (typ_uzemia_id);


--
-- Name: index_itms.projekty_ukoncene_on_itms_identifier; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projekty_ukoncene_on_itms_identifier" ON projekty_ukoncene USING btree (itms_identifier);


--
-- Name: index_itms.projekty_uzemne_mechanizmy_on_projekt_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_uzemne_mechanizmy_on_projekt_id" ON projekty_uzemne_mechanizmy USING btree (projekt_id);


--
-- Name: index_itms.projekty_uzemne_mechanizmy_on_uzemny_mechanizmus_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.projekty_uzemne_mechanizmy_on_uzemny_mechanizmus_id" ON projekty_uzemne_mechanizmy USING btree (uzemny_mechanizmus_id);


--
-- Name: index_itms.projekty_vrealizacii_on_itms_identifier; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.projekty_vrealizacii_on_itms_identifier" ON projekty_vrealizacii USING btree (itms_identifier);


--
-- Name: index_itms.subjekty_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.subjekty_on_itms_id" ON subjekty USING btree (itms_id);


--
-- Name: index_itms.typy_aktivit_on_itms_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.typy_aktivit_on_itms_id" ON typy_aktivit USING btree (itms_id);


--
-- Name: index_itms.uctovne_doklady_dodavatel_on_uctovne_doklady_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.uctovne_doklady_dodavatel_on_uctovne_doklady_id" ON uctovne_doklady_dodavatel USING btree (uctovne_doklady_id);


--
-- Name: index_itms.uctovne_doklady_on_itms_identifier; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.uctovne_doklady_on_itms_identifier" ON uctovne_doklady USING btree (itms_identifier);


--
-- Name: index_itms.uctovne_doklady_projekty_on_uctovne_doklady_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "index_itms.uctovne_doklady_projekty_on_uctovne_doklady_id" ON uctovne_doklady_projekty USING btree (uctovne_doklady_id);


--
-- Name: index_itms.verejne_obstaravania_on_itms_identifier; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.verejne_obstaravania_on_itms_identifier" ON verejne_obstaravania USING btree (itms_identifier);


--
-- Name: index_itms.vyzvy_planovane_on_itms_identifier; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.vyzvy_planovane_on_itms_identifier" ON vyzvy_planovane USING btree (itms_identifier);


--
-- Name: index_itms.vyzvy_vyhlasene_on_itms_identifier; Type: INDEX; Schema: itms; Owner: -
--

CREATE UNIQUE INDEX "index_itms.vyzvy_vyhlasene_on_itms_identifier" ON vyzvy_vyhlasene USING btree (itms_identifier);


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


--
-- Name: itms.ud_pd_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "itms.ud_pd_id" ON uctovne_doklady_polozky_dokladu USING btree (uctovne_doklady_id);


--
-- Name: itms.ud_vd_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "itms.ud_vd_id" ON uctovne_doklady_vlastnik_dokladu USING btree (uctovne_doklady_id);


--
-- Name: itms.ud_vo_id; Type: INDEX; Schema: itms; Owner: -
--

CREATE INDEX "itms.ud_vo_id" ON uctovne_doklady_verejne_obstaravania USING btree (uctovne_doklady_id);


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
-- Name: fk_rails_03702170c9; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_suvisiace_nezrovnalosti
    ADD CONSTRAINT fk_rails_03702170c9 FOREIGN KEY (nezrovnalost_id) REFERENCES nezrovnalosti(id);


--
-- Name: fk_rails_06f323bf15; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_meratelne_ukazovatele
    ADD CONSTRAINT fk_rails_06f323bf15 FOREIGN KEY (zonfp_prijate_id) REFERENCES zonfp_prijate(id);


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
-- Name: fk_rails_0d0a4a8a13; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_sekundarne_tematicke_okruhy
    ADD CONSTRAINT fk_rails_0d0a4a8a13 FOREIGN KEY (sekundarny_tematicky_okruh_id) REFERENCES kody_konkretnych_cielov(id);


--
-- Name: fk_rails_0d2a71f396; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_typy_uzemia_ciele
    ADD CONSTRAINT fk_rails_0d2a71f396 FOREIGN KEY (projekty_vrealizacii_typy_uzemia_id) REFERENCES projekty_vrealizacii_typy_uzemia(id);


--
-- Name: fk_rails_0ec85641c2; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_suvisiace_pohladavkove_doklady
    ADD CONSTRAINT fk_rails_0ec85641c2 FOREIGN KEY (pohladavkovy_doklad_id) REFERENCES pohladavkove_doklady(id);


--
-- Name: fk_rails_0fcfadbe7c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane_doplnujuce_info
    ADD CONSTRAINT fk_rails_0fcfadbe7c FOREIGN KEY (vyzvy_planovane_id) REFERENCES vyzvy_planovane(id);


--
-- Name: fk_rails_131189e0ab; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_organizacne_zlozky
    ADD CONSTRAINT fk_rails_131189e0ab FOREIGN KEY (zonfp_zamietnute_id) REFERENCES zonfp_zamietnute(id);


--
-- Name: fk_rails_131656cb1b; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_intenzity_subjekty
    ADD CONSTRAINT fk_rails_131656cb1b FOREIGN KEY (projekty_ukoncene_intenzity_id) REFERENCES projekty_ukoncene_intenzity(id);


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
    ADD CONSTRAINT fk_rails_140cb2bca8 FOREIGN KEY (dovod_vratenia_id) REFERENCES kody(id);


--
-- Name: fk_rails_1469c50b9c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_operacne_programy
    ADD CONSTRAINT fk_rails_1469c50b9c FOREIGN KEY (verejne_obstaravania_id) REFERENCES verejne_obstaravania(id);


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
-- Name: fk_rails_17faad18e6; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost
    ADD CONSTRAINT fk_rails_17faad18e6 FOREIGN KEY (subjekt_id) REFERENCES subjekty(id);


--
-- Name: fk_rails_1965577acd; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_prijimatel
    ADD CONSTRAINT fk_rails_1965577acd FOREIGN KEY (projekty_ukoncene_id) REFERENCES projekty_ukoncene(id);


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
-- Name: fk_rails_1c48e81f7b; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_formy_financovania
    ADD CONSTRAINT fk_rails_1c48e81f7b FOREIGN KEY (projekty_ukoncene_id) REFERENCES projekty_ukoncene(id);


--
-- Name: fk_rails_1d298f9f96; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_uzemne_mechanizmy
    ADD CONSTRAINT fk_rails_1d298f9f96 FOREIGN KEY (uzemny_mechanizmus_id) REFERENCES kody_konkretnych_cielov(id);


--
-- Name: fk_rails_1d6686783c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_typy_uzemia_ciele
    ADD CONSTRAINT fk_rails_1d6686783c FOREIGN KEY (zonfp_zamietnute_typy_uzemia_id) REFERENCES zonfp_zamietnute_typy_uzemia(id);


--
-- Name: fk_rails_1e5f5d421c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane_vyhlasovatel
    ADD CONSTRAINT fk_rails_1e5f5d421c FOREIGN KEY (vyzvy_planovane_id) REFERENCES vyzvy_planovane(id);


--
-- Name: fk_rails_1ff2f777dc; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_predlozene_predkladana_za
    ADD CONSTRAINT fk_rails_1ff2f777dc FOREIGN KEY (zop_predlozene_id) REFERENCES zop_predlozene(id);


--
-- Name: fk_rails_203b5a335e; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_hospodarske_cinnosti_ciele
    ADD CONSTRAINT fk_rails_203b5a335e FOREIGN KEY (projekty_ukoncene_hospodarske_cinnosti_id) REFERENCES projekty_ukoncene_hospodarske_cinnosti(id);


--
-- Name: fk_rails_20e5c19bdc; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_hospodarske_cinnosti
    ADD CONSTRAINT fk_rails_20e5c19bdc FOREIGN KEY (zonfp_zamietnute_id) REFERENCES zonfp_zamietnute(id);


--
-- Name: fk_rails_257a019f0e; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_typy_nezrovnalosti
    ADD CONSTRAINT fk_rails_257a019f0e FOREIGN KEY (kod_id) REFERENCES kody(id);


--
-- Name: fk_rails_25c3a95ab7; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_subjekty_zodpovedne_za_nasledne_konanie
    ADD CONSTRAINT fk_rails_25c3a95ab7 FOREIGN KEY (nezrovnalost_id) REFERENCES nezrovnalosti(id);


--
-- Name: fk_rails_262be0aab1; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty
    ADD CONSTRAINT fk_rails_262be0aab1 FOREIGN KEY (prijimatel_id) REFERENCES subjekty(id);


--
-- Name: fk_rails_26775dc4be; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_doplnujuce_info
    ADD CONSTRAINT fk_rails_26775dc4be FOREIGN KEY (vyzvy_vyhlasene_id) REFERENCES vyzvy_vyhlasene(id);


--
-- Name: fk_rails_27238f3f9c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_oblasti_intervencie
    ADD CONSTRAINT fk_rails_27238f3f9c FOREIGN KEY (projekty_ukoncene_id) REFERENCES projekty_ukoncene(id);


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
-- Name: fk_rails_2af438a4ad; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_formy_financovania_ciele
    ADD CONSTRAINT fk_rails_2af438a4ad FOREIGN KEY (projekty_vrealizacii_formy_financovania_id) REFERENCES projekty_vrealizacii_formy_financovania(id);


--
-- Name: fk_rails_2faddf5b73; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY prioritne_osi
    ADD CONSTRAINT fk_rails_2faddf5b73 FOREIGN KEY (operacny_program_id) REFERENCES operacne_programy(id);


--
-- Name: fk_rails_304e3fffe0; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_hospodarske_cinnosti
    ADD CONSTRAINT fk_rails_304e3fffe0 FOREIGN KEY (projekty_ukoncene_id) REFERENCES projekty_ukoncene(id);


--
-- Name: fk_rails_3475e6ed37; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_postup_obstaravania
    ADD CONSTRAINT fk_rails_3475e6ed37 FOREIGN KEY (verejne_obstaravania_id) REFERENCES verejne_obstaravania(id);


--
-- Name: fk_rails_36c02f5cf6; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_meratelne_ukazovatele
    ADD CONSTRAINT fk_rails_36c02f5cf6 FOREIGN KEY (projekty_ukoncene_id) REFERENCES projekty_ukoncene(id);


--
-- Name: fk_rails_372cf8756f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_ziadatel
    ADD CONSTRAINT fk_rails_372cf8756f FOREIGN KEY (zonfp_schvalene_id) REFERENCES zonfp_schvalene(id);


--
-- Name: fk_rails_37be77bcc1; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_intenzity
    ADD CONSTRAINT fk_rails_37be77bcc1 FOREIGN KEY (projekty_vrealizacii_id) REFERENCES projekty_vrealizacii(id);


--
-- Name: fk_rails_385db36ba3; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_zadavatel
    ADD CONSTRAINT fk_rails_385db36ba3 FOREIGN KEY (verejne_obstaravania_id) REFERENCES verejne_obstaravania(id);


--
-- Name: fk_rails_38bac79fdc; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_uzemne_mechanizmy
    ADD CONSTRAINT fk_rails_38bac79fdc FOREIGN KEY (zonfp_zamietnute_id) REFERENCES zonfp_zamietnute(id);


--
-- Name: fk_rails_3980438432; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti
    ADD CONSTRAINT fk_rails_3980438432 FOREIGN KEY (financny_stav_id) REFERENCES kody(id);


--
-- Name: fk_rails_3bb36e4382; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY uctovne_doklady_projekty
    ADD CONSTRAINT fk_rails_3bb36e4382 FOREIGN KEY (uctovne_doklady_id) REFERENCES uctovne_doklady(id);


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
-- Name: fk_rails_44f150d5d8; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY konkretne_ciele
    ADD CONSTRAINT fk_rails_44f150d5d8 FOREIGN KEY (fond_id) REFERENCES kody(id);


--
-- Name: fk_rails_46a417cc77; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY uctovne_doklady_verejne_obstaravania
    ADD CONSTRAINT fk_rails_46a417cc77 FOREIGN KEY (uctovne_doklady_id) REFERENCES uctovne_doklady(id);


--
-- Name: fk_rails_47b7955fdd; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY aktivity
    ADD CONSTRAINT fk_rails_47b7955fdd FOREIGN KEY (subjekt_id) REFERENCES subjekty(id);


--
-- Name: fk_rails_48ae045224; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY kody_konkretnych_cielov
    ADD CONSTRAINT fk_rails_48ae045224 FOREIGN KEY (konkretny_ciel_id) REFERENCES konkretne_ciele(id);


--
-- Name: fk_rails_48bf1b5ec9; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_ciele
    ADD CONSTRAINT fk_rails_48bf1b5ec9 FOREIGN KEY (vyzvy_vyhlasene_id) REFERENCES vyzvy_vyhlasene(id);


--
-- Name: fk_rails_4c5ebdf210; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_vyzvy
    ADD CONSTRAINT fk_rails_4c5ebdf210 FOREIGN KEY (zonfp_schvalene_id) REFERENCES zonfp_schvalene(id);


--
-- Name: fk_rails_4c7925a69d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_typy_uzemia
    ADD CONSTRAINT fk_rails_4c7925a69d FOREIGN KEY (projekty_vrealizacii_id) REFERENCES projekty_vrealizacii(id);


--
-- Name: fk_rails_4d83be54d9; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY pohladavkove_doklady
    ADD CONSTRAINT fk_rails_4d83be54d9 FOREIGN KEY (prioritna_os_id) REFERENCES prioritne_osi(id);


--
-- Name: fk_rails_4e304a144d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_typy_uzemia
    ADD CONSTRAINT fk_rails_4e304a144d FOREIGN KEY (projekt_id) REFERENCES projekty(id);


--
-- Name: fk_rails_4f35e719c2; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti
    ADD CONSTRAINT fk_rails_4f35e719c2 FOREIGN KEY (hlavny_typ_nezrovnalosti_id) REFERENCES kody(id);


--
-- Name: fk_rails_4f4d107e15; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_miesta_realizacie_units
    ADD CONSTRAINT fk_rails_4f4d107e15 FOREIGN KEY (zonfp_schvalene_miesta_realizacie_id) REFERENCES zonfp_schvalene_miesta_realizacie(id);


--
-- Name: fk_rails_5473ddf63b; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_zamietnute_prijimatel
    ADD CONSTRAINT fk_rails_5473ddf63b FOREIGN KEY (zop_zamietnute_id) REFERENCES zop_zamietnute(id);


--
-- Name: fk_rails_5827b58bb9; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_hospodarske_cinnosti
    ADD CONSTRAINT fk_rails_5827b58bb9 FOREIGN KEY (projekt_id) REFERENCES projekty(id);


--
-- Name: fk_rails_5924d2c609; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_schvalene_zonfp
    ADD CONSTRAINT fk_rails_5924d2c609 FOREIGN KEY (projekty_vrealizacii_id) REFERENCES projekty_vrealizacii(id);


--
-- Name: fk_rails_5979b8f53a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_zamietnute_projekt
    ADD CONSTRAINT fk_rails_5979b8f53a FOREIGN KEY (zop_zamietnute_id) REFERENCES zop_zamietnute(id);


--
-- Name: fk_rails_5f723e1acd; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_subjekty_ktore_sposobili_nezrovnalost
    ADD CONSTRAINT fk_rails_5f723e1acd FOREIGN KEY (nezrovnalost_id) REFERENCES nezrovnalosti(id);


--
-- Name: fk_rails_600510ad00; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravanie_dodavatelia
    ADD CONSTRAINT fk_rails_600510ad00 FOREIGN KEY (zmluvy_verejne_obstaravanie_id) REFERENCES zmluvy_verejne_obstaravanie(id);


--
-- Name: fk_rails_600b82bfc3; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_projekty
    ADD CONSTRAINT fk_rails_600b82bfc3 FOREIGN KEY (verejne_obstaravania_id) REFERENCES verejne_obstaravania(id);


--
-- Name: fk_rails_6264b2a8e9; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_monitorovacie_terminy
    ADD CONSTRAINT fk_rails_6264b2a8e9 FOREIGN KEY (projekty_vrealizacii_id) REFERENCES projekty_vrealizacii(id);


--
-- Name: fk_rails_62e4e0f847; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_hospodarske_cinnosti
    ADD CONSTRAINT fk_rails_62e4e0f847 FOREIGN KEY (projekty_vrealizacii_id) REFERENCES projekty_vrealizacii(id);


--
-- Name: fk_rails_6347bcec2b; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_uhradene_projekt
    ADD CONSTRAINT fk_rails_6347bcec2b FOREIGN KEY (zop_uhradene_id) REFERENCES zop_uhradene(id);


--
-- Name: fk_rails_6364309b83; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projektove_ukazovatele_casy_plnenia
    ADD CONSTRAINT fk_rails_6364309b83 FOREIGN KEY (kod_id) REFERENCES kody(id);


--
-- Name: fk_rails_66f817d32a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_hospodarske_cinnosti_ciele
    ADD CONSTRAINT fk_rails_66f817d32a FOREIGN KEY (zonfp_zamietnute_hospodarske_cinnosti_id) REFERENCES zonfp_zamietnute_hospodarske_cinnosti(id);


--
-- Name: fk_rails_67194c25e9; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravanie_dalsie_url
    ADD CONSTRAINT fk_rails_67194c25e9 FOREIGN KEY (zmluvy_verejne_obstaravanie_id) REFERENCES zmluvy_verejne_obstaravanie(id);


--
-- Name: fk_rails_6756f57485; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_predlozene_predfinancovanie
    ADD CONSTRAINT fk_rails_6756f57485 FOREIGN KEY (zop_predlozene_id) REFERENCES zop_predlozene(id);


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
-- Name: fk_rails_73b32244be; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_hospodarske_cinnosti
    ADD CONSTRAINT fk_rails_73b32244be FOREIGN KEY (hospodarska_cinnost_id) REFERENCES kody_konkretnych_cielov(id);


--
-- Name: fk_rails_777bf03d64; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_intenzity_zdroje
    ADD CONSTRAINT fk_rails_777bf03d64 FOREIGN KEY (projekty_ukoncene_intenzity_id) REFERENCES projekty_ukoncene_intenzity(id);


--
-- Name: fk_rails_77a3989ba2; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_uzemne_mechanizmy_ciele
    ADD CONSTRAINT fk_rails_77a3989ba2 FOREIGN KEY (zonfp_prijate_uzemne_mechanizmy_id) REFERENCES zonfp_prijate_uzemne_mechanizmy(id);


--
-- Name: fk_rails_7b0bdf691c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_uzemne_mechanizmy
    ADD CONSTRAINT fk_rails_7b0bdf691c FOREIGN KEY (projekty_ukoncene_id) REFERENCES projekty_ukoncene(id);


--
-- Name: fk_rails_7b211c12fb; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_typy_uzemia_ciele
    ADD CONSTRAINT fk_rails_7b211c12fb FOREIGN KEY (projekty_ukoncene_typy_uzemia_id) REFERENCES projekty_ukoncene_typy_uzemia(id);


--
-- Name: fk_rails_7b6ee5736e; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_formy_financovania
    ADD CONSTRAINT fk_rails_7b6ee5736e FOREIGN KEY (forma_financovania_id) REFERENCES kody_konkretnych_cielov(id);


--
-- Name: fk_rails_7c74b60b48; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_organizacne_zlozky
    ADD CONSTRAINT fk_rails_7c74b60b48 FOREIGN KEY (zonfp_prijate_id) REFERENCES zonfp_prijate(id);


--
-- Name: fk_rails_7e27a6a773; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_meratelne_ukazovatele
    ADD CONSTRAINT fk_rails_7e27a6a773 FOREIGN KEY (zonfp_zamietnute_id) REFERENCES zonfp_zamietnute(id);


--
-- Name: fk_rails_7f4ecf0df3; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_oblasti_intervencie_ciele
    ADD CONSTRAINT fk_rails_7f4ecf0df3 FOREIGN KEY (projekty_ukoncene_oblasti_intervencie_id) REFERENCES projekty_ukoncene_oblasti_intervencie(id);


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
-- Name: fk_rails_8169b658ea; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_vyzva
    ADD CONSTRAINT fk_rails_8169b658ea FOREIGN KEY (projekty_vrealizacii_id) REFERENCES projekty_vrealizacii(id);


--
-- Name: fk_rails_819fc2ce24; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY uctovne_doklady_polozky_dokladu
    ADD CONSTRAINT fk_rails_819fc2ce24 FOREIGN KEY (uctovne_doklady_id) REFERENCES uctovne_doklady(id);


--
-- Name: fk_rails_8389e158be; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_aktivity_projekty
    ADD CONSTRAINT fk_rails_8389e158be FOREIGN KEY (zonfp_prijate_id) REFERENCES zonfp_prijate(id);


--
-- Name: fk_rails_859094ae9b; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_formy_financovania
    ADD CONSTRAINT fk_rails_859094ae9b FOREIGN KEY (projekty_vrealizacii_id) REFERENCES projekty_vrealizacii(id);


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
-- Name: fk_rails_86bdea70cc; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_poskytovatelia
    ADD CONSTRAINT fk_rails_86bdea70cc FOREIGN KEY (vyzvy_vyhlasene_id) REFERENCES vyzvy_vyhlasene(id);


--
-- Name: fk_rails_87000b5551; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_oblasti_intervencie
    ADD CONSTRAINT fk_rails_87000b5551 FOREIGN KEY (projekty_vrealizacii_id) REFERENCES projekty_vrealizacii(id);


--
-- Name: fk_rails_8795e0b0af; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_partneri
    ADD CONSTRAINT fk_rails_8795e0b0af FOREIGN KEY (projekty_vrealizacii_id) REFERENCES projekty_vrealizacii(id);


--
-- Name: fk_rails_87a68d09a7; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_hlavny_predmet_hlavny_slovniky
    ADD CONSTRAINT fk_rails_87a68d09a7 FOREIGN KEY (verejne_obstaravania_id) REFERENCES verejne_obstaravania(id);


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
-- Name: fk_rails_8a9cbb93cb; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_typy_uzemia
    ADD CONSTRAINT fk_rails_8a9cbb93cb FOREIGN KEY (zonfp_schvalene_id) REFERENCES zonfp_schvalene(id);


--
-- Name: fk_rails_8abe3aac03; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_hlavny_predmet_doplnkovy_slovniky
    ADD CONSTRAINT fk_rails_8abe3aac03 FOREIGN KEY (verejne_obstaravania_id) REFERENCES verejne_obstaravania(id);


--
-- Name: fk_rails_8ad08ae289; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane_ciele
    ADD CONSTRAINT fk_rails_8ad08ae289 FOREIGN KEY (vyzvy_planovane_id) REFERENCES vyzvy_planovane(id);


--
-- Name: fk_rails_8d000a95b1; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti_suvisiace_pohladavkove_doklady
    ADD CONSTRAINT fk_rails_8d000a95b1 FOREIGN KEY (nezrovnalost_id) REFERENCES nezrovnalosti(id);


--
-- Name: fk_rails_9327f0bc50; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_oblasti_intervencie_ciele
    ADD CONSTRAINT fk_rails_9327f0bc50 FOREIGN KEY (projekty_vrealizacii_oblasti_intervencie_id) REFERENCES projekty_vrealizacii_oblasti_intervencie(id);


--
-- Name: fk_rails_94bff2dc1a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_partneri
    ADD CONSTRAINT fk_rails_94bff2dc1a FOREIGN KEY (zonfp_zamietnute_id) REFERENCES zonfp_zamietnute(id);


--
-- Name: fk_rails_9bee500755; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_vyzvy
    ADD CONSTRAINT fk_rails_9bee500755 FOREIGN KEY (zonfp_zamietnute_id) REFERENCES zonfp_zamietnute(id);


--
-- Name: fk_rails_9e848b2700; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_obstaravatel
    ADD CONSTRAINT fk_rails_9e848b2700 FOREIGN KEY (verejne_obstaravania_id) REFERENCES verejne_obstaravania(id);


--
-- Name: fk_rails_9eea4311d4; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_miesta_realizacie_units
    ADD CONSTRAINT fk_rails_9eea4311d4 FOREIGN KEY (projekty_ukoncene_miesta_realizacie_id) REFERENCES projekty_ukoncene_miesta_realizacie(id);


--
-- Name: fk_rails_9fc80cbae3; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY uctovne_doklady_vlastnik_dokladu
    ADD CONSTRAINT fk_rails_9fc80cbae3 FOREIGN KEY (uctovne_doklady_id) REFERENCES uctovne_doklady(id);


--
-- Name: fk_rails_a191cf5c1f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projektove_ukazovatele_fondy
    ADD CONSTRAINT fk_rails_a191cf5c1f FOREIGN KEY (kod_id) REFERENCES kody(id);


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
-- Name: fk_rails_acd8f0376f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_ziadatel
    ADD CONSTRAINT fk_rails_acd8f0376f FOREIGN KEY (zonfp_zamietnute_id) REFERENCES zonfp_zamietnute(id);


--
-- Name: fk_rails_aeec9f40a3; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vzvy_vyhlasene_kontaktne_osoby
    ADD CONSTRAINT fk_rails_aeec9f40a3 FOREIGN KEY (vyzvy_vyhlasene_id) REFERENCES vyzvy_vyhlasene(id);


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
-- Name: fk_rails_b5d68e3ca4; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_partneri
    ADD CONSTRAINT fk_rails_b5d68e3ca4 FOREIGN KEY (projekty_ukoncene_id) REFERENCES projekty_ukoncene(id);


--
-- Name: fk_rails_b7b13e16ec; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_vyzva
    ADD CONSTRAINT fk_rails_b7b13e16ec FOREIGN KEY (projekty_ukoncene_id) REFERENCES projekty_ukoncene(id);


--
-- Name: fk_rails_b9b07a10b4; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_meratelne_ukazovatele
    ADD CONSTRAINT fk_rails_b9b07a10b4 FOREIGN KEY (projekty_vrealizacii_id) REFERENCES projekty_vrealizacii(id);


--
-- Name: fk_rails_bb32b68e7f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_hodnotitelia
    ADD CONSTRAINT fk_rails_bb32b68e7f FOREIGN KEY (zonfp_schvalene_id) REFERENCES zonfp_schvalene(id);


--
-- Name: fk_rails_bb8efda835; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_zamietnute_predfinancovanie
    ADD CONSTRAINT fk_rails_bb8efda835 FOREIGN KEY (zop_zamietnute_id) REFERENCES zop_zamietnute(id);


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
-- Name: fk_rails_be079d854a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravanie_hlavny_dodavatel
    ADD CONSTRAINT fk_rails_be079d854a FOREIGN KEY (zmluvy_verejne_obstaravanie_id) REFERENCES zmluvy_verejne_obstaravanie(id);


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
-- Name: fk_rails_c2e0f43203; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_formy_financovania_ciele
    ADD CONSTRAINT fk_rails_c2e0f43203 FOREIGN KEY (projekty_ukoncene_formy_financovania_id) REFERENCES projekty_ukoncene_formy_financovania(id);


--
-- Name: fk_rails_c324a013fa; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_aktivity
    ADD CONSTRAINT fk_rails_c324a013fa FOREIGN KEY (projekty_vrealizacii_id) REFERENCES projekty_vrealizacii(id);


--
-- Name: fk_rails_c4537af002; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_hospodarske_cinnosti_ciele
    ADD CONSTRAINT fk_rails_c4537af002 FOREIGN KEY (projekty_vrealizacii_hospodarske_cinnosti_id) REFERENCES projekty_vrealizacii_hospodarske_cinnosti(id);


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
-- Name: fk_rails_c6c94be22c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_miesta_realizacie
    ADD CONSTRAINT fk_rails_c6c94be22c FOREIGN KEY (projekty_ukoncene_id) REFERENCES projekty_ukoncene(id);


--
-- Name: fk_rails_c7190db08c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_intenzity
    ADD CONSTRAINT fk_rails_c7190db08c FOREIGN KEY (projekty_ukoncene_id) REFERENCES projekty_ukoncene(id);


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
-- Name: fk_rails_c99d21522a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vzvy_vyhlasene_posudzovane_obdobia
    ADD CONSTRAINT fk_rails_c99d21522a FOREIGN KEY (vyzvy_vyhlasene_id) REFERENCES vyzvy_vyhlasene(id);


--
-- Name: fk_rails_caa56b5235; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravanie_dodavatelia_dodavatel
    ADD CONSTRAINT fk_rails_caa56b5235 FOREIGN KEY (zmluvy_verejne_obstaravanie_dodavatelia_id) REFERENCES zmluvy_verejne_obstaravanie_dodavatelia(id);


--
-- Name: fk_rails_cc9d9e9d3c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_vyhlasovatel
    ADD CONSTRAINT fk_rails_cc9d9e9d3c FOREIGN KEY (vyzvy_vyhlasene_id) REFERENCES vyzvy_vyhlasene(id);


--
-- Name: fk_rails_ccb963193d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_formy_financovania
    ADD CONSTRAINT fk_rails_ccb963193d FOREIGN KEY (projekt_id) REFERENCES projekty(id);


--
-- Name: fk_rails_cddb29730e; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vzvy_vyhlasene_planovane_vyzvy
    ADD CONSTRAINT fk_rails_cddb29730e FOREIGN KEY (vyzvy_vyhlasene_id) REFERENCES vyzvy_vyhlasene(id);


--
-- Name: fk_rails_ce4600c8f2; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zmluvy_verejne_obstaravanie
    ADD CONSTRAINT fk_rails_ce4600c8f2 FOREIGN KEY (verejne_obstaravania_id) REFERENCES verejne_obstaravania(id);


--
-- Name: fk_rails_cfa415d433; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_typy_uzemia
    ADD CONSTRAINT fk_rails_cfa415d433 FOREIGN KEY (typ_uzemia_id) REFERENCES kody_konkretnych_cielov(id);


--
-- Name: fk_rails_d1aba6ce0f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_miesta_realizacie_units
    ADD CONSTRAINT fk_rails_d1aba6ce0f FOREIGN KEY (projekty_vrealizacii_miesta_realizacie_id) REFERENCES projekty_vrealizacii_miesta_realizacie(id);


--
-- Name: fk_rails_d2880474b3; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_aktivity_subjekty
    ADD CONSTRAINT fk_rails_d2880474b3 FOREIGN KEY (projekty_vrealizacii_aktivity_id) REFERENCES projekty_vrealizacii_aktivity(id);


--
-- Name: fk_rails_d420725193; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_typy_uzemia
    ADD CONSTRAINT fk_rails_d420725193 FOREIGN KEY (projekty_ukoncene_id) REFERENCES projekty_ukoncene(id);


--
-- Name: fk_rails_d50f9dbb57; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_partneri
    ADD CONSTRAINT fk_rails_d50f9dbb57 FOREIGN KEY (zonfp_prijate_id) REFERENCES zonfp_prijate(id);


--
-- Name: fk_rails_d6559c195f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_organizacne_zlozky
    ADD CONSTRAINT fk_rails_d6559c195f FOREIGN KEY (projekty_vrealizacii_id) REFERENCES projekty_vrealizacii(id);


--
-- Name: fk_rails_d75aef9463; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_partneri
    ADD CONSTRAINT fk_rails_d75aef9463 FOREIGN KEY (zonfp_schvalene_id) REFERENCES zonfp_schvalene(id);


--
-- Name: fk_rails_d7faf83117; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_metody_vo
    ADD CONSTRAINT fk_rails_d7faf83117 FOREIGN KEY (verejne_obstaravania_id) REFERENCES verejne_obstaravania(id);


--
-- Name: fk_rails_d845918157; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_uctovne_doklady
    ADD CONSTRAINT fk_rails_d845918157 FOREIGN KEY (verejne_obstaravania_id) REFERENCES verejne_obstaravania(id);


--
-- Name: fk_rails_d89d786f35; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_intenzity_zdroje
    ADD CONSTRAINT fk_rails_d89d786f35 FOREIGN KEY (projekty_vrealizacii_intenzity_id) REFERENCES projekty_vrealizacii_intenzity(id);


--
-- Name: fk_rails_d9ac66b139; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_miesta_realizacie
    ADD CONSTRAINT fk_rails_d9ac66b139 FOREIGN KEY (projekty_vrealizacii_id) REFERENCES projekty_vrealizacii(id);


--
-- Name: fk_rails_daa70d785a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY aktivity
    ADD CONSTRAINT fk_rails_daa70d785a FOREIGN KEY (typ_aktivity_id) REFERENCES typy_aktivit(id);


--
-- Name: fk_rails_dca9598718; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti
    ADD CONSTRAINT fk_rails_dca9598718 FOREIGN KEY (administrativny_stav_id) REFERENCES kody(id);


--
-- Name: fk_rails_dd066eede4; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_prijate_typy_uzemia
    ADD CONSTRAINT fk_rails_dd066eede4 FOREIGN KEY (zonfp_prijate_id) REFERENCES zonfp_prijate(id);


--
-- Name: fk_rails_de5d60c98a; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_uhradene_predkladana_za
    ADD CONSTRAINT fk_rails_de5d60c98a FOREIGN KEY (zop_uhradene_id) REFERENCES zop_uhradene(id);


--
-- Name: fk_rails_e281735595; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY nezrovnalosti
    ADD CONSTRAINT fk_rails_e281735595 FOREIGN KEY (dlznik_id) REFERENCES subjekty(id);


--
-- Name: fk_rails_e373af711d; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_prijimatel
    ADD CONSTRAINT fk_rails_e373af711d FOREIGN KEY (projekty_vrealizacii_id) REFERENCES projekty_vrealizacii(id);


--
-- Name: fk_rails_e4f9b6a174; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_schvalene_uzemne_mechanizmy_ciele
    ADD CONSTRAINT fk_rails_e4f9b6a174 FOREIGN KEY (zonfp_schvalene_uzemne_mechanizmy_id) REFERENCES zonfp_schvalene_uzemne_mechanizmy(id);


--
-- Name: fk_rails_e709ec16d9; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_uzemne_mechanizmy
    ADD CONSTRAINT fk_rails_e709ec16d9 FOREIGN KEY (projekty_vrealizacii_id) REFERENCES projekty_vrealizacii(id);


--
-- Name: fk_rails_e782c270e2; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_planovane_poskytovatelia
    ADD CONSTRAINT fk_rails_e782c270e2 FOREIGN KEY (vyzvy_planovane_id) REFERENCES vyzvy_planovane(id);


--
-- Name: fk_rails_e79914694c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_schvalene_zonfp
    ADD CONSTRAINT fk_rails_e79914694c FOREIGN KEY (projekty_ukoncene_id) REFERENCES projekty_ukoncene(id);


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
-- Name: fk_rails_e9c0519acf; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zop_predlozene_projekt
    ADD CONSTRAINT fk_rails_e9c0519acf FOREIGN KEY (zop_predlozene_id) REFERENCES zop_predlozene(id);


--
-- Name: fk_rails_ea9eccefc6; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_uzemne_mechanizmy
    ADD CONSTRAINT fk_rails_ea9eccefc6 FOREIGN KEY (projekt_id) REFERENCES projekty(id);


--
-- Name: fk_rails_eb8e371c76; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_oblasti_intervencie
    ADD CONSTRAINT fk_rails_eb8e371c76 FOREIGN KEY (oblast_intervencie_id) REFERENCES kody_konkretnych_cielov(id);


--
-- Name: fk_rails_ebd65c5288; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_aktivity_subjekty
    ADD CONSTRAINT fk_rails_ebd65c5288 FOREIGN KEY (projekty_ukoncene_aktivity_id) REFERENCES projekty_ukoncene_aktivity(id);


--
-- Name: fk_rails_ec6c3cb4c4; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projektove_ukazovatele_casy_plnenia
    ADD CONSTRAINT fk_rails_ec6c3cb4c4 FOREIGN KEY (projektovy_ukazovatel_id) REFERENCES projektove_ukazovatele(id);


--
-- Name: fk_rails_ef82846cc4; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_organizacne_zlozky
    ADD CONSTRAINT fk_rails_ef82846cc4 FOREIGN KEY (projekty_ukoncene_id) REFERENCES projekty_ukoncene(id);


--
-- Name: fk_rails_f1873062c5; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_oblasti_intervencie
    ADD CONSTRAINT fk_rails_f1873062c5 FOREIGN KEY (projekt_id) REFERENCES projekty(id);


--
-- Name: fk_rails_f1e2d1e253; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_uzemne_mechanizmy_ciele
    ADD CONSTRAINT fk_rails_f1e2d1e253 FOREIGN KEY (projekty_ukoncene_uzemne_mechanizmy_id) REFERENCES projekty_ukoncene_uzemne_mechanizmy(id);


--
-- Name: fk_rails_f20660ea9f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_uzemne_mechanizmy_ciele
    ADD CONSTRAINT fk_rails_f20660ea9f FOREIGN KEY (projekty_vrealizacii_uzemne_mechanizmy_id) REFERENCES projekty_vrealizacii_uzemne_mechanizmy(id);


--
-- Name: fk_rails_f2aa972bf9; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY verejne_obstaravania_druh_zakazky
    ADD CONSTRAINT fk_rails_f2aa972bf9 FOREIGN KEY (verejne_obstaravania_id) REFERENCES verejne_obstaravania(id);


--
-- Name: fk_rails_f4a2aa0697; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_monitorovacie_terminy
    ADD CONSTRAINT fk_rails_f4a2aa0697 FOREIGN KEY (projekty_ukoncene_id) REFERENCES projekty_ukoncene(id);


--
-- Name: fk_rails_f55d944621; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY zonfp_zamietnute_miesta_realizacie
    ADD CONSTRAINT fk_rails_f55d944621 FOREIGN KEY (zonfp_zamietnute_id) REFERENCES zonfp_zamietnute(id);


--
-- Name: fk_rails_f74d2d4574; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY vyzvy_vyhlasene_fondy
    ADD CONSTRAINT fk_rails_f74d2d4574 FOREIGN KEY (vyzvy_vyhlasene_id) REFERENCES vyzvy_vyhlasene(id);


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
-- Name: fk_rails_f941f44f4e; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_ukoncene_aktivity
    ADD CONSTRAINT fk_rails_f941f44f4e FOREIGN KEY (projekty_ukoncene_id) REFERENCES projekty_ukoncene(id);


--
-- Name: fk_rails_f9a65c182f; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY uctovne_doklady_dodavatel
    ADD CONSTRAINT fk_rails_f9a65c182f FOREIGN KEY (uctovne_doklady_id) REFERENCES uctovne_doklady(id);


--
-- Name: fk_rails_fa124ae26c; Type: FK CONSTRAINT; Schema: itms; Owner: -
--

ALTER TABLE ONLY projekty_vrealizacii_intenzity_subjekty
    ADD CONSTRAINT fk_rails_fa124ae26c FOREIGN KEY (projekty_vrealizacii_intenzity_id) REFERENCES projekty_vrealizacii_intenzity(id);


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
('20171005104049'),
('20171005105044'),
('20171005110144'),
('20171005115835'),
('20171005122114'),
('20171005173414'),
('20171007133948'),
('20171008150412'),
('20171009080951'),
('20171009115759'),
('20171017171650'),
('20171017182931');


