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
-- Name: eid22; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA eid22;


--
-- Name: itms; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA itms;


--
-- Name: metais; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA metais;


--
-- Name: upvs; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA upvs;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: JednotnePracoviska; Type: TABLE; Schema: eid22; Owner: -
--

CREATE TABLE eid22."JednotnePracoviska" (
    id character varying NOT NULL,
    name character varying NOT NULL
);


--
-- Name: eIdClaims; Type: TABLE; Schema: eid22; Owner: -
--

CREATE TABLE eid22."eIdClaims" (
    jp character varying NOT NULL,
    "claimNo" integer NOT NULL,
    "dateClaimed" date NOT NULL,
    "dateReady" date,
    "dateTaken" date
);


--
-- Name: workLog; Type: TABLE; Schema: eid22; Owner: -
--

CREATE TABLE eid22."workLog" (
    id bigint NOT NULL,
    ts timestamp without time zone NOT NULL,
    text text NOT NULL
);


--
-- Name: workLog_id_seq; Type: SEQUENCE; Schema: eid22; Owner: -
--

CREATE SEQUENCE eid22."workLog_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: workLog_id_seq; Type: SEQUENCE OWNED BY; Schema: eid22; Owner: -
--

ALTER SEQUENCE eid22."workLog_id_seq" OWNED BY eid22."workLog".id;


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
    popis character varying,
    deleted_at timestamp without time zone
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
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
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
-- Name: codelist_investment_type; Type: TABLE; Schema: metais; Owner: -
--

CREATE TABLE metais.codelist_investment_type (
    id bigint NOT NULL,
    code character varying NOT NULL,
    nazov character varying NOT NULL,
    order_list integer NOT NULL,
    popis character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: codelist_investment_type_id_seq; Type: SEQUENCE; Schema: metais; Owner: -
--

CREATE SEQUENCE metais.codelist_investment_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: codelist_investment_type_id_seq; Type: SEQUENCE OWNED BY; Schema: metais; Owner: -
--

ALTER SEQUENCE metais.codelist_investment_type_id_seq OWNED BY metais.codelist_investment_type.id;


--
-- Name: codelist_program; Type: TABLE; Schema: metais; Owner: -
--

CREATE TABLE metais.codelist_program (
    id bigint NOT NULL,
    kod_metais character varying NOT NULL,
    nazov character varying NOT NULL,
    nazov_en character varying,
    ref_id character varying,
    zdroj character varying,
    raw_data text,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    uuid character varying
);


--
-- Name: codelist_program_id_seq; Type: SEQUENCE; Schema: metais; Owner: -
--

CREATE SEQUENCE metais.codelist_program_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: codelist_program_id_seq; Type: SEQUENCE OWNED BY; Schema: metais; Owner: -
--

ALTER SEQUENCE metais.codelist_program_id_seq OWNED BY metais.codelist_program.id;


--
-- Name: codelist_project_phase; Type: TABLE; Schema: metais; Owner: -
--

CREATE TABLE metais.codelist_project_phase (
    id bigint NOT NULL,
    code character varying NOT NULL,
    nazov character varying NOT NULL,
    order_list integer NOT NULL,
    popis character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: codelist_project_phase_id_seq; Type: SEQUENCE; Schema: metais; Owner: -
--

CREATE SEQUENCE metais.codelist_project_phase_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: codelist_project_phase_id_seq; Type: SEQUENCE OWNED BY; Schema: metais; Owner: -
--

ALTER SEQUENCE metais.codelist_project_phase_id_seq OWNED BY metais.codelist_project_phase.id;


--
-- Name: codelist_project_state; Type: TABLE; Schema: metais; Owner: -
--

CREATE TABLE metais.codelist_project_state (
    id bigint NOT NULL,
    code character varying NOT NULL,
    nazov character varying NOT NULL,
    order_list integer NOT NULL,
    popis character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: codelist_project_state_id_seq; Type: SEQUENCE; Schema: metais; Owner: -
--

CREATE SEQUENCE metais.codelist_project_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: codelist_project_state_id_seq; Type: SEQUENCE OWNED BY; Schema: metais; Owner: -
--

ALTER SEQUENCE metais.codelist_project_state_id_seq OWNED BY metais.codelist_project_state.id;


--
-- Name: codelist_source; Type: TABLE; Schema: metais; Owner: -
--

CREATE TABLE metais.codelist_source (
    id bigint NOT NULL,
    code character varying NOT NULL,
    nazov character varying NOT NULL,
    order_list integer NOT NULL,
    popis character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: codelist_source_id_seq; Type: SEQUENCE; Schema: metais; Owner: -
--

CREATE SEQUENCE metais.codelist_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: codelist_source_id_seq; Type: SEQUENCE OWNED BY; Schema: metais; Owner: -
--

ALTER SEQUENCE metais.codelist_source_id_seq OWNED BY metais.codelist_source.id;


--
-- Name: isvs; Type: TABLE; Schema: metais; Owner: -
--

CREATE TABLE metais.isvs (
    id bigint NOT NULL,
    project_id bigint,
    uuid character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    latest_version_id bigint
);


--
-- Name: isvs_document_versions; Type: TABLE; Schema: metais; Owner: -
--

CREATE TABLE metais.isvs_document_versions (
    id bigint NOT NULL,
    document_id bigint NOT NULL,
    nazov character varying NOT NULL,
    kod_metais character varying NOT NULL,
    ref_id character varying NOT NULL,
    mime_type character varying,
    content_length integer,
    status character varying,
    poznamka text,
    typ_dokumentu character varying,
    filename character varying,
    metais_created_at timestamp without time zone,
    metais_updated_at timestamp without time zone,
    raw_data jsonb NOT NULL,
    raw_meta jsonb NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: isvs_document_versions_id_seq; Type: SEQUENCE; Schema: metais; Owner: -
--

CREATE SEQUENCE metais.isvs_document_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: isvs_document_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: metais; Owner: -
--

ALTER SEQUENCE metais.isvs_document_versions_id_seq OWNED BY metais.isvs_document_versions.id;


--
-- Name: isvs_documents; Type: TABLE; Schema: metais; Owner: -
--

CREATE TABLE metais.isvs_documents (
    id bigint NOT NULL,
    isvs_id bigint,
    uuid character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    latest_version_id bigint
);


--
-- Name: isvs_documents_id_seq; Type: SEQUENCE; Schema: metais; Owner: -
--

CREATE SEQUENCE metais.isvs_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: isvs_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: metais; Owner: -
--

ALTER SEQUENCE metais.isvs_documents_id_seq OWNED BY metais.isvs_documents.id;


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
-- Name: isvs_versions; Type: TABLE; Schema: metais; Owner: -
--

CREATE TABLE metais.isvs_versions (
    id bigint NOT NULL,
    isvs_id bigint NOT NULL,
    nazov character varying NOT NULL,
    kod_metais character varying NOT NULL,
    ref_id character varying,
    popis text,
    popis_as_is text,
    poznamka text,
    zdroj character varying,
    stav_isvs character varying,
    typ_isvs character varying,
    raw_data jsonb NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    metais_created_at timestamp without time zone
);


--
-- Name: isvs_versions_id_seq; Type: SEQUENCE; Schema: metais; Owner: -
--

CREATE SEQUENCE metais.isvs_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: isvs_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: metais; Owner: -
--

ALTER SEQUENCE metais.isvs_versions_id_seq OWNED BY metais.isvs_versions.id;


--
-- Name: project_changes; Type: TABLE; Schema: metais; Owner: -
--

CREATE TABLE metais.project_changes (
    id bigint NOT NULL,
    project_version_id bigint NOT NULL,
    field character varying,
    old_value character varying,
    new_value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: project_changes_id_seq; Type: SEQUENCE; Schema: metais; Owner: -
--

CREATE SEQUENCE metais.project_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: project_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: metais; Owner: -
--

ALTER SEQUENCE metais.project_changes_id_seq OWNED BY metais.project_changes.id;


--
-- Name: project_document_versions; Type: TABLE; Schema: metais; Owner: -
--

CREATE TABLE metais.project_document_versions (
    id bigint NOT NULL,
    document_id bigint NOT NULL,
    nazov character varying NOT NULL,
    kod_metais character varying NOT NULL,
    ref_id character varying NOT NULL,
    mime_type character varying,
    content_length integer,
    status character varying,
    poznamka text,
    typ_dokumentu character varying,
    filename character varying,
    metais_created_at timestamp without time zone,
    metais_updated_at timestamp without time zone,
    raw_data jsonb NOT NULL,
    raw_meta jsonb NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: project_document_versions_id_seq; Type: SEQUENCE; Schema: metais; Owner: -
--

CREATE SEQUENCE metais.project_document_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: project_document_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: metais; Owner: -
--

ALTER SEQUENCE metais.project_document_versions_id_seq OWNED BY metais.project_document_versions.id;


--
-- Name: project_documents; Type: TABLE; Schema: metais; Owner: -
--

CREATE TABLE metais.project_documents (
    id bigint NOT NULL,
    project_id bigint,
    uuid character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    latest_version_id bigint
);


--
-- Name: project_documents_id_seq; Type: SEQUENCE; Schema: metais; Owner: -
--

CREATE SEQUENCE metais.project_documents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: project_documents_id_seq; Type: SEQUENCE OWNED BY; Schema: metais; Owner: -
--

ALTER SEQUENCE metais.project_documents_id_seq OWNED BY metais.project_documents.id;


--
-- Name: project_versions; Type: TABLE; Schema: metais; Owner: -
--

CREATE TABLE metais.project_versions (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    nazov character varying NOT NULL,
    kod_metais character varying NOT NULL,
    typ_investicie character varying,
    prijimatel character varying,
    faza_projektu character varying,
    program character varying,
    popis text,
    datum_zacatia timestamp without time zone,
    termin_ukoncenia timestamp without time zone,
    schvalovaci_proces character varying,
    zdroj character varying,
    financna_skupina character varying,
    suma_vydavkov numeric(15,2),
    rocne_naklady numeric(15,2),
    ref_id character varying,
    status character varying,
    zmena_stavu timestamp without time zone,
    schvalene_rocne_naklady numeric(15,2),
    schvaleny_rozpocet numeric(15,2),
    datum_nfp timestamp without time zone,
    link_nfp character varying,
    vyhlasenie_vo timestamp without time zone,
    vo character varying,
    zmluva_o_dielo timestamp without time zone,
    zmluva_o_dielo_crz character varying,
    raw_data jsonb NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    metais_created_at timestamp without time zone
);


--
-- Name: project_versions_id_seq; Type: SEQUENCE; Schema: metais; Owner: -
--

CREATE SEQUENCE metais.project_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: project_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: metais; Owner: -
--

ALTER SEQUENCE metais.project_versions_id_seq OWNED BY metais.project_versions.id;


--
-- Name: projects; Type: TABLE; Schema: metais; Owner: -
--

CREATE TABLE metais.projects (
    id bigint NOT NULL,
    uuid character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    latest_version_id bigint
);


--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: metais; Owner: -
--

CREATE SEQUENCE metais.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: metais; Owner: -
--

ALTER SEQUENCE metais.projects_id_seq OWNED BY metais.projects.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: public_authority_active_edesks; Type: TABLE; Schema: upvs; Owner: -
--

CREATE TABLE upvs.public_authority_active_edesks (
    id bigint NOT NULL,
    cin bigint NOT NULL,
    uri character varying NOT NULL,
    name character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: public_authority_active_edesks_id_seq; Type: SEQUENCE; Schema: upvs; Owner: -
--

CREATE SEQUENCE upvs.public_authority_active_edesks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: public_authority_active_edesks_id_seq; Type: SEQUENCE OWNED BY; Schema: upvs; Owner: -
--

ALTER SEQUENCE upvs.public_authority_active_edesks_id_seq OWNED BY upvs.public_authority_active_edesks.id;


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
-- Name: workLog id; Type: DEFAULT; Schema: eid22; Owner: -
--

ALTER TABLE ONLY eid22."workLog" ALTER COLUMN id SET DEFAULT nextval('eid22."workLog_id_seq"'::regclass);


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
-- Name: codelist_investment_type id; Type: DEFAULT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.codelist_investment_type ALTER COLUMN id SET DEFAULT nextval('metais.codelist_investment_type_id_seq'::regclass);


--
-- Name: codelist_program id; Type: DEFAULT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.codelist_program ALTER COLUMN id SET DEFAULT nextval('metais.codelist_program_id_seq'::regclass);


--
-- Name: codelist_project_phase id; Type: DEFAULT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.codelist_project_phase ALTER COLUMN id SET DEFAULT nextval('metais.codelist_project_phase_id_seq'::regclass);


--
-- Name: codelist_project_state id; Type: DEFAULT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.codelist_project_state ALTER COLUMN id SET DEFAULT nextval('metais.codelist_project_state_id_seq'::regclass);


--
-- Name: codelist_source id; Type: DEFAULT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.codelist_source ALTER COLUMN id SET DEFAULT nextval('metais.codelist_source_id_seq'::regclass);


--
-- Name: isvs id; Type: DEFAULT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.isvs ALTER COLUMN id SET DEFAULT nextval('metais.isvs_id_seq'::regclass);


--
-- Name: isvs_document_versions id; Type: DEFAULT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.isvs_document_versions ALTER COLUMN id SET DEFAULT nextval('metais.isvs_document_versions_id_seq'::regclass);


--
-- Name: isvs_documents id; Type: DEFAULT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.isvs_documents ALTER COLUMN id SET DEFAULT nextval('metais.isvs_documents_id_seq'::regclass);


--
-- Name: isvs_versions id; Type: DEFAULT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.isvs_versions ALTER COLUMN id SET DEFAULT nextval('metais.isvs_versions_id_seq'::regclass);


--
-- Name: project_changes id; Type: DEFAULT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.project_changes ALTER COLUMN id SET DEFAULT nextval('metais.project_changes_id_seq'::regclass);


--
-- Name: project_document_versions id; Type: DEFAULT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.project_document_versions ALTER COLUMN id SET DEFAULT nextval('metais.project_document_versions_id_seq'::regclass);


--
-- Name: project_documents id; Type: DEFAULT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.project_documents ALTER COLUMN id SET DEFAULT nextval('metais.project_documents_id_seq'::regclass);


--
-- Name: project_versions id; Type: DEFAULT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.project_versions ALTER COLUMN id SET DEFAULT nextval('metais.project_versions_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.projects ALTER COLUMN id SET DEFAULT nextval('metais.projects_id_seq'::regclass);


--
-- Name: public_authority_active_edesks id; Type: DEFAULT; Schema: upvs; Owner: -
--

ALTER TABLE ONLY upvs.public_authority_active_edesks ALTER COLUMN id SET DEFAULT nextval('upvs.public_authority_active_edesks_id_seq'::regclass);


--
-- Name: public_authority_edesks id; Type: DEFAULT; Schema: upvs; Owner: -
--

ALTER TABLE ONLY upvs.public_authority_edesks ALTER COLUMN id SET DEFAULT nextval('upvs.public_authority_edesks_id_seq'::regclass);


--
-- Name: services_with_forms id; Type: DEFAULT; Schema: upvs; Owner: -
--

ALTER TABLE ONLY upvs.services_with_forms ALTER COLUMN id SET DEFAULT nextval('upvs.services_with_forms_id_seq'::regclass);


--
-- Name: JednotnePracoviska JednotnePracoviska_pkey; Type: CONSTRAINT; Schema: eid22; Owner: -
--

ALTER TABLE ONLY eid22."JednotnePracoviska"
    ADD CONSTRAINT "JednotnePracoviska_pkey" PRIMARY KEY (id);


--
-- Name: eIdClaims eIdClaims_pkey; Type: CONSTRAINT; Schema: eid22; Owner: -
--

ALTER TABLE ONLY eid22."eIdClaims"
    ADD CONSTRAINT "eIdClaims_pkey" PRIMARY KEY (jp, "claimNo", "dateClaimed");


--
-- Name: workLog workLog_pkey; Type: CONSTRAINT; Schema: eid22; Owner: -
--

ALTER TABLE ONLY eid22."workLog"
    ADD CONSTRAINT "workLog_pkey" PRIMARY KEY (id);


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
-- Name: codelist_investment_type codelist_investment_type_pkey; Type: CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.codelist_investment_type
    ADD CONSTRAINT codelist_investment_type_pkey PRIMARY KEY (id);


--
-- Name: codelist_program codelist_program_pkey; Type: CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.codelist_program
    ADD CONSTRAINT codelist_program_pkey PRIMARY KEY (id);


--
-- Name: codelist_project_phase codelist_project_phase_pkey; Type: CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.codelist_project_phase
    ADD CONSTRAINT codelist_project_phase_pkey PRIMARY KEY (id);


--
-- Name: codelist_project_state codelist_project_state_pkey; Type: CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.codelist_project_state
    ADD CONSTRAINT codelist_project_state_pkey PRIMARY KEY (id);


--
-- Name: codelist_source codelist_source_pkey; Type: CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.codelist_source
    ADD CONSTRAINT codelist_source_pkey PRIMARY KEY (id);


--
-- Name: isvs_document_versions isvs_document_versions_pkey; Type: CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.isvs_document_versions
    ADD CONSTRAINT isvs_document_versions_pkey PRIMARY KEY (id);


--
-- Name: isvs_documents isvs_documents_pkey; Type: CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.isvs_documents
    ADD CONSTRAINT isvs_documents_pkey PRIMARY KEY (id);


--
-- Name: isvs isvs_pkey; Type: CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.isvs
    ADD CONSTRAINT isvs_pkey PRIMARY KEY (id);


--
-- Name: isvs_versions isvs_versions_pkey; Type: CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.isvs_versions
    ADD CONSTRAINT isvs_versions_pkey PRIMARY KEY (id);


--
-- Name: project_changes project_changes_pkey; Type: CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.project_changes
    ADD CONSTRAINT project_changes_pkey PRIMARY KEY (id);


--
-- Name: project_document_versions project_document_versions_pkey; Type: CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.project_document_versions
    ADD CONSTRAINT project_document_versions_pkey PRIMARY KEY (id);


--
-- Name: project_documents project_documents_pkey; Type: CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.project_documents
    ADD CONSTRAINT project_documents_pkey PRIMARY KEY (id);


--
-- Name: project_versions project_versions_pkey; Type: CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.project_versions
    ADD CONSTRAINT project_versions_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: public_authority_active_edesks public_authority_active_edesks_pkey; Type: CONSTRAINT; Schema: upvs; Owner: -
--

ALTER TABLE ONLY upvs.public_authority_active_edesks
    ADD CONSTRAINT public_authority_active_edesks_pkey PRIMARY KEY (id);


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
-- Name: index_metais.codelist_investment_type_on_code; Type: INDEX; Schema: metais; Owner: -
--

CREATE INDEX "index_metais.codelist_investment_type_on_code" ON metais.codelist_investment_type USING btree (code);


--
-- Name: index_metais.codelist_program_on_kod_metais; Type: INDEX; Schema: metais; Owner: -
--

CREATE INDEX "index_metais.codelist_program_on_kod_metais" ON metais.codelist_program USING btree (kod_metais);


--
-- Name: index_metais.codelist_project_phase_on_code; Type: INDEX; Schema: metais; Owner: -
--

CREATE INDEX "index_metais.codelist_project_phase_on_code" ON metais.codelist_project_phase USING btree (code);


--
-- Name: index_metais.codelist_project_state_on_code; Type: INDEX; Schema: metais; Owner: -
--

CREATE INDEX "index_metais.codelist_project_state_on_code" ON metais.codelist_project_state USING btree (code);


--
-- Name: index_metais.codelist_source_on_code; Type: INDEX; Schema: metais; Owner: -
--

CREATE INDEX "index_metais.codelist_source_on_code" ON metais.codelist_source USING btree (code);


--
-- Name: index_metais.isvs_document_versions_on_document_id; Type: INDEX; Schema: metais; Owner: -
--

CREATE INDEX "index_metais.isvs_document_versions_on_document_id" ON metais.isvs_document_versions USING btree (document_id);


--
-- Name: index_metais.isvs_documents_on_isvs_id; Type: INDEX; Schema: metais; Owner: -
--

CREATE INDEX "index_metais.isvs_documents_on_isvs_id" ON metais.isvs_documents USING btree (isvs_id);


--
-- Name: index_metais.isvs_documents_on_latest_version_id; Type: INDEX; Schema: metais; Owner: -
--

CREATE INDEX "index_metais.isvs_documents_on_latest_version_id" ON metais.isvs_documents USING btree (latest_version_id);


--
-- Name: index_metais.isvs_documents_on_uuid; Type: INDEX; Schema: metais; Owner: -
--

CREATE INDEX "index_metais.isvs_documents_on_uuid" ON metais.isvs_documents USING btree (uuid);


--
-- Name: index_metais.isvs_on_latest_version_id; Type: INDEX; Schema: metais; Owner: -
--

CREATE INDEX "index_metais.isvs_on_latest_version_id" ON metais.isvs USING btree (latest_version_id);


--
-- Name: index_metais.isvs_on_project_id; Type: INDEX; Schema: metais; Owner: -
--

CREATE INDEX "index_metais.isvs_on_project_id" ON metais.isvs USING btree (project_id);


--
-- Name: index_metais.isvs_on_uuid; Type: INDEX; Schema: metais; Owner: -
--

CREATE INDEX "index_metais.isvs_on_uuid" ON metais.isvs USING btree (uuid);


--
-- Name: index_metais.isvs_versions_on_isvs_id; Type: INDEX; Schema: metais; Owner: -
--

CREATE INDEX "index_metais.isvs_versions_on_isvs_id" ON metais.isvs_versions USING btree (isvs_id);


--
-- Name: index_metais.project_changes_on_project_version_id; Type: INDEX; Schema: metais; Owner: -
--

CREATE INDEX "index_metais.project_changes_on_project_version_id" ON metais.project_changes USING btree (project_version_id);


--
-- Name: index_metais.project_document_versions_on_document_id; Type: INDEX; Schema: metais; Owner: -
--

CREATE INDEX "index_metais.project_document_versions_on_document_id" ON metais.project_document_versions USING btree (document_id);


--
-- Name: index_metais.project_documents_on_latest_version_id; Type: INDEX; Schema: metais; Owner: -
--

CREATE INDEX "index_metais.project_documents_on_latest_version_id" ON metais.project_documents USING btree (latest_version_id);


--
-- Name: index_metais.project_documents_on_project_id; Type: INDEX; Schema: metais; Owner: -
--

CREATE INDEX "index_metais.project_documents_on_project_id" ON metais.project_documents USING btree (project_id);


--
-- Name: index_metais.project_documents_on_uuid; Type: INDEX; Schema: metais; Owner: -
--

CREATE INDEX "index_metais.project_documents_on_uuid" ON metais.project_documents USING btree (uuid);


--
-- Name: index_metais.project_versions_on_project_id; Type: INDEX; Schema: metais; Owner: -
--

CREATE INDEX "index_metais.project_versions_on_project_id" ON metais.project_versions USING btree (project_id);


--
-- Name: index_metais.projects_on_latest_version_id; Type: INDEX; Schema: metais; Owner: -
--

CREATE INDEX "index_metais.projects_on_latest_version_id" ON metais.projects USING btree (latest_version_id);


--
-- Name: index_metais.projects_on_uuid; Type: INDEX; Schema: metais; Owner: -
--

CREATE INDEX "index_metais.projects_on_uuid" ON metais.projects USING btree (uuid);


--
-- Name: index_upvs.public_authority_active_edesks_on_cin; Type: INDEX; Schema: upvs; Owner: -
--

CREATE INDEX "index_upvs.public_authority_active_edesks_on_cin" ON upvs.public_authority_active_edesks USING btree (cin);


--
-- Name: index_upvs.public_authority_active_edesks_on_uri; Type: INDEX; Schema: upvs; Owner: -
--

CREATE UNIQUE INDEX "index_upvs.public_authority_active_edesks_on_uri" ON upvs.public_authority_active_edesks USING btree (uri);


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
    ADD CONSTRAINT fk_rails_342c83d880 FOREIGN KEY (zdroj_vz_id) REFERENCES itms.intenzity_zdroje(id) ON DELETE SET NULL;


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
    ADD CONSTRAINT fk_rails_818c3c0e61 FOREIGN KEY (zdroj_eu_id) REFERENCES itms.intenzity_zdroje(id) ON DELETE SET NULL;


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
    ADD CONSTRAINT fk_rails_cc33bd1188 FOREIGN KEY (zdroj_pr_id) REFERENCES itms.intenzity_zdroje(id) ON DELETE SET NULL;


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
    ADD CONSTRAINT fk_rails_e965354053 FOREIGN KEY (zdroj_yei_id) REFERENCES itms.intenzity_zdroje(id) ON DELETE SET NULL;


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
    ADD CONSTRAINT fk_rails_ffc31e6216 FOREIGN KEY (zdroj_sr_id) REFERENCES itms.intenzity_zdroje(id) ON DELETE SET NULL;


--
-- Name: projects fk_rails_1925410d1c; Type: FK CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.projects
    ADD CONSTRAINT fk_rails_1925410d1c FOREIGN KEY (latest_version_id) REFERENCES metais.project_versions(id);


--
-- Name: isvs_documents fk_rails_2926a855af; Type: FK CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.isvs_documents
    ADD CONSTRAINT fk_rails_2926a855af FOREIGN KEY (isvs_id) REFERENCES metais.isvs(id);


--
-- Name: isvs_documents fk_rails_5d253a31fc; Type: FK CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.isvs_documents
    ADD CONSTRAINT fk_rails_5d253a31fc FOREIGN KEY (latest_version_id) REFERENCES metais.isvs_document_versions(id);


--
-- Name: project_versions fk_rails_819be9e3a6; Type: FK CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.project_versions
    ADD CONSTRAINT fk_rails_819be9e3a6 FOREIGN KEY (project_id) REFERENCES metais.projects(id);


--
-- Name: project_documents fk_rails_868923b92d; Type: FK CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.project_documents
    ADD CONSTRAINT fk_rails_868923b92d FOREIGN KEY (project_id) REFERENCES metais.projects(id);


--
-- Name: isvs fk_rails_8befaa8056; Type: FK CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.isvs
    ADD CONSTRAINT fk_rails_8befaa8056 FOREIGN KEY (project_id) REFERENCES metais.projects(id);


--
-- Name: project_documents fk_rails_9352955d7e; Type: FK CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.project_documents
    ADD CONSTRAINT fk_rails_9352955d7e FOREIGN KEY (latest_version_id) REFERENCES metais.project_document_versions(id);


--
-- Name: project_changes fk_rails_a57192e308; Type: FK CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.project_changes
    ADD CONSTRAINT fk_rails_a57192e308 FOREIGN KEY (project_version_id) REFERENCES metais.project_versions(id);


--
-- Name: project_document_versions fk_rails_ae50626673; Type: FK CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.project_document_versions
    ADD CONSTRAINT fk_rails_ae50626673 FOREIGN KEY (document_id) REFERENCES metais.project_documents(id);


--
-- Name: isvs_document_versions fk_rails_affcff3ef1; Type: FK CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.isvs_document_versions
    ADD CONSTRAINT fk_rails_affcff3ef1 FOREIGN KEY (document_id) REFERENCES metais.isvs_documents(id);


--
-- Name: isvs fk_rails_be183a92d5; Type: FK CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.isvs
    ADD CONSTRAINT fk_rails_be183a92d5 FOREIGN KEY (latest_version_id) REFERENCES metais.isvs_versions(id);


--
-- Name: isvs_versions fk_rails_ce75fc7d23; Type: FK CONSTRAINT; Schema: metais; Owner: -
--

ALTER TABLE ONLY metais.isvs_versions
    ADD CONSTRAINT fk_rails_ce75fc7d23 FOREIGN KEY (isvs_id) REFERENCES metais.isvs(id);


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
('20171214142454'),
('20171214151327'),
('20171221180201'),
('20171221215154'),
('20171221222028'),
('20171221222608'),
('20171222121456'),
('20190805192655'),
('20191030214642'),
('20191107112524'),
('20200424134824'),
('20200424153823'),
('20200518225601'),
('20200531222054'),
('20200601163242'),
('20200716141809'),
('20220702123618'),
('20220810120123'),
('20220810120320'),
('20220810120510'),
('20220811192959'),
('20220902164827'),
('20220919080112'),
('20220919084308'),
('20221219105855'),
('20231106173059'),
('20231107130000'),
('20240709105101');


