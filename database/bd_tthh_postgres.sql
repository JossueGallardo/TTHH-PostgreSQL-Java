--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-06-10 18:59:42

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 247 (class 1255 OID 25549)
-- Name: generar_id_empleado(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generar_id_empleado() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Generar el nuevo ID con el formato E-XXXX
    NEW.id_Empleado := 'E-' || LPAD(nextval('seq_id_empleado')::TEXT, 4, '0');
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.generar_id_empleado() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 226 (class 1259 OID 25337)
-- Name: ajustes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ajustes (
    id_ajuste character(7) NOT NULL,
    user_id character(12),
    aju_descripcion character(30),
    aju_fechahora timestamp without time zone,
    aju_num_produc integer,
    estado_aju character(3)
);


ALTER TABLE public.ajustes OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 25417)
-- Name: asientos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asientos (
    id_asiento character(7) NOT NULL,
    asi_descripcion character(30),
    asi_total_debe numeric(7,2),
    asi_total_haber numeric(7,2),
    asi_fechahora timestamp without time zone,
    user_id character(12),
    estado_asi character(3)
);


ALTER TABLE public.asientos OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 25497)
-- Name: bonificaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bonificaciones (
    id_bonificacion character(7) NOT NULL,
    bon_descripcion character(40) NOT NULL,
    bon_valor numeric(7,2),
    estado_bon character(3)
);


ALTER TABLE public.bonificaciones OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 25502)
-- Name: bonxempxpag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bonxempxpag (
    id_bonificacion character(7) NOT NULL,
    id_empleado character(7) NOT NULL,
    id_pago character(7) NOT NULL,
    bxe_fecha date,
    bxe_valor numeric(7,2),
    estado_bxe character(3)
);


ALTER TABLE public.bonxempxpag OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 25465)
-- Name: cargas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cargas (
    id_carga character(7) NOT NULL,
    car_cedula character(10),
    car_apellido1 character(30) NOT NULL,
    car_apellido2 character(30),
    car_nombre1 character(30) NOT NULL,
    car_nombre2 character(30),
    car_sexo character(1),
    car_fechanacimiento date,
    estado_car character(3),
    id_empleado character(7)
);


ALTER TABLE public.cargas OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 25247)
-- Name: ciudades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ciudades (
    id_ciudad character(3) NOT NULL,
    ciu_descripcion character(30)
);


ALTER TABLE public.ciudades OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 25262)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id_cliente character(7) NOT NULL,
    cli_nombre character(40),
    cli_ruc_ced character(13),
    cli_telefono character(10),
    cli_mail character(60),
    id_ciudad character(3),
    cli_celular character(10),
    cli_direccion character(60),
    estado_cli character(3)
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 25292)
-- Name: compras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compras (
    id_compra character(7) NOT NULL,
    id_proveedor character(7),
    oc_fecha_hora timestamp without time zone,
    oc_subtotal numeric(7,2),
    oc_iva integer,
    estado_oc character(3)
);


ALTER TABLE public.compras OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 25422)
-- Name: ctaxasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ctaxasi (
    id_asiento character(7) NOT NULL,
    id_cuenta character(15) NOT NULL,
    cxa_debe numeric(7,2),
    cxa_haber numeric(7,2),
    estado_cxa character(3)
);


ALTER TABLE public.ctaxasi OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 25407)
-- Name: cuentas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cuentas (
    id_cuenta character(15) NOT NULL,
    cue_descripcion character(60),
    cue_tipo character(3),
    cue_debe00 numeric(7,2),
    cue_debe01 numeric(7,2),
    cue_debe02 numeric(7,2),
    cue_debe03 numeric(7,2),
    cue_debe04 numeric(7,2),
    cue_debe05 numeric(7,2),
    cue_debe06 numeric(7,2),
    cue_debe07 numeric(7,2),
    cue_debe08 numeric(7,2),
    cue_debe09 numeric(7,2),
    cue_debe10 numeric(7,2),
    cue_debe11 numeric(7,2),
    cue_debe12 numeric(7,2),
    cue_debe13 numeric(7,2),
    cue_haber00 numeric(7,2),
    cue_haber01 numeric(7,2),
    cue_haber02 numeric(7,2),
    cue_haber03 numeric(7,2),
    cue_haber04 numeric(7,2),
    cue_haber05 numeric(7,2),
    cue_haber06 numeric(7,2),
    cue_haber07 numeric(7,2),
    cue_haber08 numeric(7,2),
    cue_haber09 numeric(7,2),
    cue_haber10 numeric(7,2),
    cue_haber11 numeric(7,2),
    cue_haber12 numeric(7,2),
    cue_haber13 numeric(7,2),
    estado_cue character(3)
);


ALTER TABLE public.cuentas OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 25438)
-- Name: departamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamentos (
    id_departamento character(7) NOT NULL,
    dep_nombre character(30) NOT NULL,
    dep_telefono character(12),
    dep_mail character(60),
    estado_dep character(3)
);


ALTER TABLE public.departamentos OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 25522)
-- Name: descuentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.descuentos (
    id_descuento character(7) NOT NULL,
    des_descripcion character(40) NOT NULL,
    des_valor numeric(7,2),
    estado_des character(3)
);


ALTER TABLE public.descuentos OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 25527)
-- Name: desxempxpag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.desxempxpag (
    id_descuento character(7) NOT NULL,
    id_empleado character(7) NOT NULL,
    id_pago character(7) NOT NULL,
    dxe_fecha date,
    dxe_valor numeric(7,2),
    estado_dxe character(3)
);


ALTER TABLE public.desxempxpag OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 25448)
-- Name: empleados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleados (
    id_empleado character(7) NOT NULL,
    emp_cedula character(10) NOT NULL,
    emp_apellido1 character(30) NOT NULL,
    emp_apellido2 character(30),
    emp_nombre1 character(30) NOT NULL,
    emp_nombre2 character(30),
    emp_sexo character(1),
    emp_fechanacimiento date,
    emp_sueldo numeric(7,2),
    emp_mail character(40),
    estado_emp character(3),
    id_departamento character(7),
    id_rol character(7),
    emp_fechaalta timestamp without time zone,
    emp_fechabaja timestamp without time zone,
    emp_fechamodificacion timestamp without time zone
);


ALTER TABLE public.empleados OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 25357)
-- Name: entregas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entregas (
    id_entrega character(7) NOT NULL,
    user_id character(12),
    ent_descripcion character(30),
    ent_fechahora timestamp without time zone,
    ent_num_produc integer,
    estado_ent character(3)
);


ALTER TABLE public.entregas OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 25377)
-- Name: facturas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facturas (
    id_factura character(7) NOT NULL,
    id_cliente character(7),
    fac_descripcion character(30),
    fac_fecha_hora timestamp without time zone,
    fac_subtotal numeric(7,2),
    fac_iva integer,
    estado_fac character(3)
);


ALTER TABLE public.facturas OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 25477)
-- Name: pagos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pagos (
    id_pago character(7) NOT NULL,
    pag_descripcion character(40),
    pag_fecha_inicio date,
    pag_fecha_fin date,
    estado_pag character(3)
);


ALTER TABLE public.pagos OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 25482)
-- Name: pagxemp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pagxemp (
    id_pago character(7) NOT NULL,
    id_empleado character(7) NOT NULL,
    emp_sueldo numeric(7,2),
    emp_bonificaciones numeric(7,2),
    emp_descuentos numeric(7,2),
    emp_valor_neto numeric(7,2),
    estado_pxe character(3)
);


ALTER TABLE public.pagxemp OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 25277)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id_producto character(7) NOT NULL,
    pro_descripcion character(40),
    pro_um_compra character(3),
    pro_um_venta character(3),
    pro_valor_compra numeric(7,2),
    pro_precio_venta numeric(7,2),
    pro_saldo_inicial integer,
    pro_qty_ingresos integer,
    pro_qty_egresos integer,
    pro_qty_ajustes integer,
    pro_saldo_final integer,
    estado_prod character(3)
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 25252)
-- Name: proveedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedores (
    id_proveedor character(7) NOT NULL,
    prv_nombre character(40),
    prv_ruc_ced character(13),
    prv_telefono character(10),
    prv_mail character(60),
    id_ciudad character(3),
    prv_celular character(10),
    prv_direccion character(60),
    estado_prv character(3)
);


ALTER TABLE public.proveedores OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 25342)
-- Name: proxaju; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proxaju (
    id_ajuste character(7) NOT NULL,
    id_producto character(7) NOT NULL,
    pxa_cantidad integer,
    pxa_qty_ajustada integer,
    estado_pxa character(3)
);


ALTER TABLE public.proxaju OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 25362)
-- Name: proxent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proxent (
    id_entrega character(7) NOT NULL,
    id_producto character(7) NOT NULL,
    pxe_cantidad integer,
    pxe_qty_entregada integer,
    estado_pxe character(3)
);


ALTER TABLE public.proxent OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 25387)
-- Name: proxfac; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proxfac (
    id_factura character(7) NOT NULL,
    id_producto character(7) NOT NULL,
    pxf_cantidad integer,
    pxf_valor numeric(7,2),
    estado_pxf character(3)
);


ALTER TABLE public.proxfac OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 25302)
-- Name: proxoc; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proxoc (
    id_compra character(7) NOT NULL,
    id_producto character(7) NOT NULL,
    pxo_cantidad integer,
    pxo_valor numeric(7,2),
    estado_pxoc character(3)
);


ALTER TABLE public.proxoc OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 25322)
-- Name: proxrec; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proxrec (
    id_recibo character(7) NOT NULL,
    id_producto character(7) NOT NULL,
    pxr_cantidad integer,
    pxr_qty_recibida integer,
    estado_pxr character(3)
);


ALTER TABLE public.proxrec OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 25317)
-- Name: recepciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recepciones (
    id_recibo character(7) NOT NULL,
    user_id character(12),
    rec_descripcion character(30),
    rec_fechahora timestamp without time zone,
    rec_num_produc integer,
    estado_rec character(3)
);


ALTER TABLE public.recepciones OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 25443)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id_rol character(7) NOT NULL,
    rol_descripcion character(40) NOT NULL,
    estado_rol character(3)
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 25548)
-- Name: seq_id_empleado; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_id_empleado
    START WITH 151
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.seq_id_empleado OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 25402)
-- Name: tipo_cuenta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_cuenta (
    id_tipo_cta character(3) NOT NULL,
    tip_descripcion character(7)
);


ALTER TABLE public.tipo_cuenta OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 25272)
-- Name: unidades_medidas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unidades_medidas (
    id_unidad_medida character(3) NOT NULL,
    um_descripcion character(20)
);


ALTER TABLE public.unidades_medidas OWNER TO postgres;

--
-- TOC entry 5055 (class 0 OID 25337)
-- Dependencies: 226
-- Data for Name: ajustes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ajustes (id_ajuste, user_id, aju_descripcion, aju_fechahora, aju_num_produc, estado_aju) FROM stdin;
AJU001 	postgres    	Ajuste del mes 01-enero       	2024-01-15 10:30:00	0	ACT
AJU002 	postgres    	Ajuste del mes 02-febrero     	2024-02-20 14:45:00	0	ACT
AJU003 	postgres    	Ajuste del mes 03-marzo       	2024-03-10 08:20:00	0	ACT
AJU004 	postgres    	Ajuste del mes 04-abril       	2024-04-25 16:50:00	0	ACT
AJU005 	postgres    	Ajuste del mes 05-mayo        	2024-05-18 11:15:00	0	ACT
AJU006 	postgres    	Ajuste del mes 06-junio       	2024-06-12 09:40:00	0	ACT
AJU007 	postgres    	Ajuste del mes 07-julio       	2024-07-22 15:30:00	0	ACT
AJU008 	postgres    	Ajuste del mes 08-agosto      	2024-08-05 10:00:00	0	ACT
AJU009 	postgres    	Ajuste del mes 09-septiembre  	2024-09-15 13:45:00	0	ACT
AJU010 	postgres    	Ajuste del mes 10-octubre     	2024-10-10 12:25:00	0	ACT
\.


--
-- TOC entry 5063 (class 0 OID 25417)
-- Dependencies: 234
-- Data for Name: asientos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asientos (id_asiento, asi_descripcion, asi_total_debe, asi_total_haber, asi_fechahora, user_id, estado_asi) FROM stdin;
A001   	Pago de salario empleado      	1000.00	1000.00	2024-11-15 10:00:00	USR123      	ACT
N01CCJW	Pago mensual a Javier Cóndor  	500.00	500.00	2025-01-15 11:29:13.802332	jwcondor    	ABI
\.


--
-- TOC entry 5071 (class 0 OID 25497)
-- Dependencies: 242
-- Data for Name: bonificaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bonificaciones (id_bonificacion, bon_descripcion, bon_valor, estado_bon) FROM stdin;
B-0001 	Bonificación Anual                      	1500.00	ACT
B-0002 	Bonificación de Desempeño               	1000.00	ACT
B-0003 	Bono de Puntualidad                     	300.00	ACT
B-0004 	Bonificación por Ventas                 	1200.00	ACT
B-0005 	Bono por Productividad                  	800.00	ACT
B-0006 	Bonificación de Navidad                 	500.00	ACT
B-0007 	Bonificación de Fiestas                 	450.00	ACT
B-0008 	Bono de Cumpleaños                      	200.00	ACT
B-0009 	Bono por Antigüedad                     	750.00	ACT
B-0010 	Bono Escolar                            	250.00	ACT
B-0011 	Bonificación por Horas Extras           	600.00	ACT
B-0012 	Bonificación por Turno Nocturno         	400.00	ACT
B-0013 	Bono de Recomendación                   	300.00	ACT
B-0014 	Bono por Liderazgo                      	950.00	ACT
B-0015 	Bonificación de Seguridad               	500.00	ACT
B-0016 	Bono por Mejora Continua                	700.00	ACT
B-0017 	Bono de Capacitación                    	350.00	ACT
B-0018 	Bonificación por Logro de Metas         	1000.00	ACT
B-0019 	Bono de Flexibilidad Laboral            	400.00	ACT
B-0020 	Bonificación por Asistencia Perfecta    	250.00	ACT
\.


--
-- TOC entry 5072 (class 0 OID 25502)
-- Dependencies: 243
-- Data for Name: bonxempxpag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bonxempxpag (id_bonificacion, id_empleado, id_pago, bxe_fecha, bxe_valor, estado_bxe) FROM stdin;
B-0002 	E-0005 	2025-01	2025-01-22	1000.00	PAG
\.


--
-- TOC entry 5068 (class 0 OID 25465)
-- Dependencies: 239
-- Data for Name: cargas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cargas (id_carga, car_cedula, car_apellido1, car_apellido2, car_nombre1, car_nombre2, car_sexo, car_fechanacimiento, estado_car, id_empleado) FROM stdin;
C-0001 	0104567001	Perez                         	Lopez                         	Ana                           	                              	F	1982-07-23	ACT	E-0003 
C-0002 	0104567002	Garcia                        	Martinez                      	Luis                          	                              	M	1990-11-14	ACT	E-0003 
C-0003 	0104567003	Lopez                         	Rodriguez                     	Carlos                        	                              	M	1987-01-05	ACT	E-0007 
C-0004 	0104567004	Martinez                      	Garcia                        	Maria                         	                              	F	1975-04-29	ACT	E-0012 
C-0005 	0104567005	Rodriguez                     	Johnson                       	James                         	                              	M	1993-08-16	ACT	E-0012 
C-0006 	0104567006	Johnson                       	Brown                         	Elena                         	                              	F	1989-10-12	ACT	E-0020 
C-0007 	0104567007	Smith                         	Davis                         	Pedro                         	                              	M	1995-12-31	ACT	E-0027 
C-0008 	0104567008	Brown                         	Wilson                        	Sarah                         	                              	F	1983-03-22	ACT	E-0030 
C-0009 	1708558430	Cóndor                        	Andrade                       	Patricia                      	Paola                         	F	1994-05-05	ACT	E-0099 
C-0010 	0104567010	Wilson                        	Martinez                      	Juan                          	                              	M	1988-06-05	ACT	E-0040 
C-0011 	0104567011	Perez                         	Rodriguez                     	Ana                           	                              	F	1991-11-21	ACT	E-0044 
C-0012 	0104567012	Garcia                        	Smith                         	Luis                          	                              	M	1974-01-01	ACT	E-0053 
C-0013 	0104567013	Lopez                         	Brown                         	Carlos                        	                              	M	1985-12-02	ACT	E-0065 
C-0014 	0104567014	Martinez                      	Davis                         	Maria                         	                              	F	1989-05-11	ACT	E-0071 
C-0015 	0104567015	Rodriguez                     	Wilson                        	James                         	                              	M	1993-04-14	ACT	E-0082 
C-0016 	0104567016	Johnson                       	Perez                         	Elena                         	                              	F	1977-07-03	ACT	E-0091 
C-0017 	0104567017	Smith                         	Johnson                       	Pedro                         	                              	M	1980-10-09	ACT	E-0105 
C-0018 	0104567018	Brown                         	Smith                         	Sarah                         	                              	F	1973-02-26	ACT	E-0117 
C-0019 	1708558432	Cóndor                        	Andrade                       	Lino                          	javier                        	M	1995-09-09	ACT	E-0099 
C-0020 	0104567020	Wilson                        	Lopez                         	Juan                          	                              	M	1990-09-25	ACT	E-0144 
C-0021 	1704567021	Lopez                         	Garcia                        	Ana                           	                              	F	1981-10-21	ACT	E-0013 
C-0022 	1704567022	Martinez                      	Rodriguez                     	Luis                          	                              	M	1992-05-02	ACT	E-0015 
C-0023 	1704567023	Rodriguez                     	Johnson                       	Carlos                        	                              	M	1979-08-13	ACT	E-0017 
C-0024 	1704567024	Johnson                       	Martinez                      	Gabriela                      	                              	F	1990-12-11	ACT	E-0018 
C-0025 	1704567025	Smith                         	Perez                         	James                         	                              	M	1985-07-07	ACT	E-0020 
C-0026 	1704567026	Brown                         	Wilson                        	Sarah                         	                              	F	1991-04-25	ACT	E-0021 
C-0027 	1704567027	Davis                         	Lopez                         	Elena                         	                              	F	1986-09-10	ACT	E-0023 
C-0028 	1704567028	Wilson                        	Brown                         	Juan                          	                              	M	1977-11-19	ACT	E-0024 
C-0029 	1704567029	Perez                         	Smith                         	Ana                           	                              	F	1988-01-30	ACT	E-0026 
C-0030 	1704567030	Garcia                        	Davis                         	Luis                          	                              	M	1994-03-14	ACT	E-0027 
C-0031 	1704567031	Lopez                         	Wilson                        	Carlos                        	                              	M	1982-12-23	ACT	E-0031 
C-0032 	1704567032	Martinez                      	Garcia                        	Maria                         	                              	F	1974-06-04	ACT	E-0033 
C-0033 	1704567033	Rodriguez                     	Smith                         	James                         	                              	M	1987-09-22	ACT	E-0035 
C-0034 	1704567034	Johnson                       	Perez                         	Elena                         	                              	F	1983-11-18	ACT	E-0037 
C-0035 	1704567035	Smith                         	Brown                         	Pedro                         	                              	M	1991-07-15	ACT	E-0040 
C-0036 	1704567036	Brown                         	Martinez                      	Gabriela                      	                              	F	1984-05-06	ACT	E-0042 
C-0037 	1704567037	Davis                         	Wilson                        	Carlos                        	                              	M	1978-03-29	ACT	E-0044 
C-0038 	1704567038	Wilson                        	Johnson                       	Sarah                         	                              	F	1979-08-09	ACT	E-0046 
C-0039 	1704567039	Perez                         	Rodriguez                     	James                         	                              	M	1980-02-19	ACT	E-0048 
C-0040 	1704567040	Garcia                        	Smith                         	Luis                          	                              	M	1993-12-03	ACT	E-0050 
\.


--
-- TOC entry 5046 (class 0 OID 25247)
-- Dependencies: 217
-- Data for Name: ciudades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ciudades (id_ciudad, ciu_descripcion) FROM stdin;
UIO	Quito                         
GYE	Guayaquil                     
CUE	Cuenca                        
SCO	Santo Domingo                 
MCH	Machala                       
DUR	Durán                         
PFO	Portoviejo                    
LOJ	Loja                          
AMB	Ambato                        
MIL	Manta                         
IBR	Ibarra                        
RIE	Riobamba                      
LAT	Latacunga                     
QUE	Quevedo                       
ESM	Esmeraldas                    
LIB	La Libertad                   
SAL	Salinas                       
TUL	Tulcán                        
ZAM	Zamora                        
OER	Otavalo                       
\.


--
-- TOC entry 5048 (class 0 OID 25262)
-- Dependencies: 219
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id_cliente, cli_nombre, cli_ruc_ced, cli_telefono, cli_mail, id_ciudad, cli_celular, cli_direccion, estado_cli) FROM stdin;
CLI001 	Juan Pérez                              	1710010010001	022345678 	juan.perez@clientes.com                                     	UIO	0991234567	Av. Amazonas y Naciones Unidas                              	ACT
CLI002 	María López                             	0910020020002	042345678 	maria.lopez@clientes.com                                    	GYE	0992345678	Cdla. Los Ceibos                                            	ACT
CLI003 	Comercial Cuenca                        	0100030030003	072345678 	contacto@comercialcuenca.com                                	CUE	0993456789	Av. Solano y Remigio Crespo                                 	ACT
CLI004 	Santo Domingo Express                   	1710040040004	023456789 	contacto@santodomingoexpress.com                            	SCO	0994567890	Av. Chone y Caracas                                         	ACT
CLI005 	Fernando León                           	0700050050005	072345679 	fernando.leon@clientes.com                                  	MCH	0995678901	Av. Rocafuerte y Bolívar                                    	ACT
CLI006 	Durán Market                            	0990060060006	042345679 	contacto@duranmarket.com                                    	DUR	0996789012	Av. Samborondón y Los Ángeles                               	ACT
CLI007 	Distribuidora Portoviejo                	1300070070007	052345679 	ventas@distribuidoraportoviejo.com                          	PFO	0997890123	Av. Manabí y Eloy Alfaro                                    	ACT
CLI008 	Quesería Loja                           	1100080080008	072345680 	info@queserialoja.com                                       	LOJ	0998901234	Av. Universitaria y 18 de Noviembre                         	ACT
CLI009 	Supermercado Ambato                     	1800090090009	032345680 	contacto@supermercadoambato.com                             	AMB	0999012345	Av. Cevallos y Quito                                        	ACT
CLI010 	Manta Comercial                         	1300100100010	052345680 	info@mantacomercial.com                                     	MIL	0990123456	Av. Flavio Reyes y Tarqui                                   	ACT
CLI011 	Restaurante El Norte                    	1000110110011	062345681 	contacto@restauranteelnorte.com                             	IBR	0991234501	Av. Bolívar y Pedro Moncayo                                 	ACT
CLI012 	Pastelería Riobamba                     	1700120120012	032345681 	ventas@pasteleriasriobamba.com                              	RIE	0992345012	Av. León Borja y Velasco                                    	ACT
CLI013 	Distribuidora Latacunga                 	1700130130013	032345682 	ventas@distribuidoralatacunga.com                           	LAT	0993456023	Av. Simón Bolívar y Quito                                   	ACT
CLI014 	Comercial Quevedo                       	1200140140014	052345682 	info@comercialquevedo.com                                   	QUE	0994567034	Av. Quito y Bolívar                                         	ACT
CLI015 	Bazar Esmeraldas                        	0800150150015	062345682 	contacto@bazaresmeraldas.com                                	ESM	0995678045	Av. Malecón y Colón                                         	ACT
CLI016 	La Libertad Store                       	0800160160016	042345683 	ventas@lalibertadstore.com                                  	LIB	0996789056	Av. 9 de Octubre y Colón                                    	ACT
CLI017 	Salinas Market                          	0800170170017	042345683 	contacto@salinasmarket.com                                  	SAL	0997890067	Av. Principal y Malecón                                     	ACT
CLI018 	Comercial Tulcán                        	0400180180018	062345684 	info@comercialtulcan.com                                    	TUL	0998901078	Av. Cotopaxi y Maldonado                                    	ACT
CLI019 	Zamora Distribuidora                    	1100190190019	072345684 	ventas@zamoradistribuidora.com                              	ZAM	0999012089	Av. Amazonía y Loja                                         	ACT
CLI020 	Otavalo Express                         	1000200200020	062345685 	contacto@otavaloexpress.com                                 	OER	0990123098	Av. Sucre y Bolívar                                         	ACT
CLI021 	Supermercado Quito                      	1710210210021	022346789 	ventas@supermercadoquito.com                                	UIO	0991122334	Av. Eloy Alfaro y 6 de Diciembre                            	ACT
CLI022 	Guayaquil Comercial                     	0910220220022	042346789 	info@guayaquilcomercial.com                                 	GYE	0992233445	Cdla. Urdesa Central                                        	ACT
CLI023 	Lácteos Cuenca Especial                 	0100230230023	072346789 	ventas@lacteoscuenca.com                                    	CUE	0993344556	Av. Don Bosco y Remigio Tamariz                             	ACT
CLI024 	Restaurante Santo Domingo               	1710240240024	023457890 	contacto@restaurantesantodomingo.com                        	SCO	0994455667	Av. Quito y Eloy Alfaro                                     	ACT
CLI025 	Verdulería Machala                      	0700250250025	072346890 	info@verdureriamachala.com                                  	MCH	0995566778	Av. Bolívar y Olmedo                                        	ACT
CLI026 	Durán Express                           	0990260260026	042346890 	contacto@duranexpress.com                                   	DUR	0996677889	Av. Durán y Samborondón                                     	ACT
CLI027 	Portoviejo Market                       	1300270270027	052346890 	ventas@portoviejomarket.com                                 	PFO	0997788990	Av. Eloy Alfaro y 9 de Octubre                              	ACT
CLI028 	Distribuidora Loja                      	1100280280028	072346800 	info@distribuidoraloja.com                                  	LOJ	0998899001	Av. Cuxibamba y Bolívar                                     	ACT
CLI029 	Ambato Comercial                        	1800290290029	032346800 	ventas@ambatocomercial.com                                  	AMB	0999900112	Av. Cevallos y Maldonado                                    	ACT
CLI030 	Pescadería Manta                        	1300300300030	052346800 	ventas@pescaderiamanta.com                                  	MIL	0990011223	Calle Tarqui y 12 de Noviembre                              	ACT
CLI031 	Especias Ibarra                         	1000310310031	062346801 	contacto@especiasibarra.com                                 	IBR	0991122335	Av. Bolívar y Velasco                                       	ACT
CLI032 	Riobamba Gourmet                        	1700320320032	032346801 	info@riobambagourmet.com                                    	RIE	0992233446	Av. León Borja y Maldonado                                  	ACT
CLI033 	Latacunga Market                        	1700330330033	032346802 	ventas@latacungamarket.com                                  	LAT	0993344557	Av. Amazonas y Sucre                                        	ACT
CLI034 	Quevedo Distribuidora                   	1200340340034	052346802 	info@quevedodistribuidora.com                               	QUE	0994455668	Av. Bolívar y Quito                                         	ACT
CLI035 	Esmeraldas Express                      	0800350350035	062346802 	contacto@esmeraldasexpress.com                              	ESM	0995566779	Av. Malecón y Quito                                         	ACT
CLI036 	La Libertad Comercial                   	0800360360036	042346803 	info@lalibertadcomercial.com                                	LIB	0996677890	Av. Colón y Sucre                                           	ACT
CLI037 	Salinas Distribuidora                   	0800370370037	042346803 	ventas@salinasdistribuidora.com                             	SAL	0997788901	Av. Principal y Bolívar                                     	ACT
CLI038 	Tulcán Comercial                        	0400380380038	062346804 	info@tulcancomercial.com                                    	TUL	0998899012	Av. Cotopaxi y Velasco                                      	ACT
CLI039 	Frutas y Verduras Zamora                	1100390390039	072346804 	ventas@frutasyverduraszamora.com                            	ZAM	0999900123	Av. Amazonía y Bolívar                                      	ACT
CLI040 	Otavalo Market                          	1000400400040	062346805 	info@otavalomarket.com                                      	OER	0990011234	Av. Sucre y Maldonado                                       	ACT
\.


--
-- TOC entry 5051 (class 0 OID 25292)
-- Dependencies: 222
-- Data for Name: compras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compras (id_compra, id_proveedor, oc_fecha_hora, oc_subtotal, oc_iva, estado_oc) FROM stdin;
CMP001 	PRV001 	2024-01-10 10:00:00	1500.00	0	ACT
CMP002 	PRV002 	2024-01-15 14:30:00	2500.00	0	ACT
CMP003 	PRV003 	2024-02-05 09:15:00	1800.00	0	ACT
CMP004 	PRV004 	2024-02-18 11:45:00	3200.00	0	ACT
CMP005 	PRV005 	2024-03-10 08:50:00	1300.00	0	ACT
CMP006 	PRV006 	2024-03-25 16:20:00	2800.00	0	ACT
CMP007 	PRV007 	2024-04-07 10:35:00	3500.00	0	ACT
CMP008 	PRV008 	2024-04-20 13:10:00	4000.00	0	ACT
CMP009 	PRV009 	2024-05-12 15:25:00	2200.00	0	ACT
CMP010 	PRV010 	2024-05-28 09:40:00	1750.00	0	ACT
CMP011 	PRV011 	2024-06-05 14:00:00	2950.00	0	ACT
CMP012 	PRV012 	2024-06-15 12:45:00	3300.00	0	ACT
CMP013 	PRV013 	2024-07-10 11:30:00	2700.00	0	ACT
CMP014 	PRV014 	2024-07-22 08:20:00	1900.00	0	ACT
CMP015 	PRV015 	2024-08-15 17:50:00	3100.00	0	ACT
CMP016 	PRV016 	2024-08-28 10:15:00	1250.00	0	ACT
CMP017 	PRV017 	2024-09-12 13:30:00	2750.00	0	ACT
CMP018 	PRV018 	2024-09-25 09:00:00	3600.00	0	ACT
CMP019 	PRV019 	2024-10-05 11:20:00	1500.00	0	ACT
CMP020 	PRV020 	2024-10-18 14:10:00	2200.00	0	ACT
\.


--
-- TOC entry 5064 (class 0 OID 25422)
-- Dependencies: 235
-- Data for Name: ctaxasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ctaxasi (id_asiento, id_cuenta, cxa_debe, cxa_haber, estado_cxa) FROM stdin;
A001   	5.2.01.01.01   	1000.00	0.00	ACT
A001   	1.1.01.02.01   	0.00	1000.00	ACT
N01CCJW	1.1.01.01.01   	300.00	0.00	ACT
N01CCJW	1.1.01.01.04   	200.00	0.00	ACT
N01CCJW	1.1.01.01.05   	0.00	500.00	ACT
\.


--
-- TOC entry 5062 (class 0 OID 25407)
-- Dependencies: 233
-- Data for Name: cuentas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cuentas (id_cuenta, cue_descripcion, cue_tipo, cue_debe00, cue_debe01, cue_debe02, cue_debe03, cue_debe04, cue_debe05, cue_debe06, cue_debe07, cue_debe08, cue_debe09, cue_debe10, cue_debe11, cue_debe12, cue_debe13, cue_haber00, cue_haber01, cue_haber02, cue_haber03, cue_haber04, cue_haber05, cue_haber06, cue_haber07, cue_haber08, cue_haber09, cue_haber10, cue_haber11, cue_haber12, cue_haber13, estado_cue) FROM stdin;
1.             	Activos                                                     	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.           	Corriente                                                   	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.01.        	Efectivo Y Equivalentes De Efectivo                         	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.01.01.     	Caja                                                        	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.01.01.01   	Caja General                                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.01.01.02   	Caja Tarjetas                                               	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.01.01.03   	Caja Posfechados                                            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.01.01.04   	Caja Chica                                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.01.01.05   	Transferencias Internas (Cero)                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.01.01.06   	Caja Reposición Administración                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.01.01.07   	Fondo Rotativo                                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.01.01.99   	Cuenta de Regularización(Siempre Cero)                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.01.02.     	Bancos                                                      	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.01.02.01   	Banco Pichincha                                             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.01.02.02   	Produbanco                                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.01.02.03   	Banco Austro                                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.        	Activos Financieros                                         	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.01.     	Activos Financieros A Valor Razonable Con Cambios En Resulta	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.01.01   	Activos Financieros                                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.02.     	Activos Financieros Disponibles Para La Venta               	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.03.     	Activos Financieros Mantenidos Hasta Su Vencimiento         	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.04.     	(-) Provisión Por Deterioro                                 	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.04.01   	(-) Provisión Por Deterioro                                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.05.     	Documentos Y Cuentas Por Cobrar Clientes No Relacionados    	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.05.01   	Clientes                                                    	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.05.02   	Empleados                                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.05.03   	Cheques Devueltos, Protestados O Cambio Cheques             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.05.04   	Transitoria Cruce Clientes (Siempre Cero)                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.05.05   	Transitoria Retenciones Atrazadas (Siempre Cero)            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.06.     	Documentos Y Cuentas Por Cobrar Clientes Relacionados       	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.06.01   	Clientes Relacionados                                       	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.07.     	Otras Cuentas Por Cobrar Relacionadas                       	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.07.01   	Prestamos Accionistas                                       	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.07.02   	Otras Cuentas Por Cobrar Relacionados                       	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.07.03   	Dividendos Accionistas / Socios                             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.08.     	Cuentas Por Cobrar Empleados                                	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.08.01   	Anticipo Empleados                                          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.08.02   	Prestamos Empleados                                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.08.03   	Faltantes Caja Por Cobrar                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.09.     	Cuentas Por Cobrar                                          	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.09.01   	Garantía Por Arriendo Oficina                               	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.09.02   	Cheques En Garantía                                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.09.03   	Otras Cuentas Por Cobrar                                    	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.11.     	(-) Provisión De Cuentas Incobrables                        	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.02.11.01   	(-) Provisión De Cuentas Incobrables                        	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.        	Inventarios                                                 	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.01.     	Inv. De Prod. Terminados                                    	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.01.01   	Inventarios De Prod. Terminados Con Iva                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.01.02   	Inventarios De Prod. Terminados Sin Iva                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.01.03   	Inventario Transitorio Ofertas                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.01.04   	Inventario Transitorio Cambio De Mercadería Con Iva         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.01.05   	Inventario Transitorio Cambio Mercadería Sin Iva            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.01.06   	Inventario Transitorio Recepciones de Compras               	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.03.     	Inv. De Sum. O Mat. A Ser Consumidos En Proceso             	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.03.01   	Envases plásticos -Botellas                                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.03.02   	Mangas termoencogibles                                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.03.03   	Sal en grano                                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.03.04   	Tapas para botellas                                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.03.05   	Fajillas para botellas                                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.05.     	Inventarios De Materia Prima                                	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.07.     	Importaciones En Transito                                   	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.07.01   	Importación En Transito No. Amg-Di1722                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.07.02   	Importación En Transito No. Amg-Di180409                    	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.07.03   	Importación En Transito No. Amg-Di180416                    	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.08.     	Obras En Construcción                                       	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.09.     	Inventarios Repuestos, Herramientas Y Accesorios            	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.09.01   	Inventarios Repuestos, Herramientas Y Accesorios            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.10.     	Producción En Proceso                                       	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.10.01   	Producción En Proceso                                       	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.11.     	Provisión De Inventarios Por Valor Neto De Realización      	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.11.01   	Provisión De Inventarios Por Valor Neto De Realización      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.12.     	Provisión De Inventarios Por Deterioro Físico               	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.12.01   	Provisión De Inventarios Por Deterioro Físico               	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.13.     	Transferencias Internas                                     	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.03.13.01   	Transferencias Internas Inv. (Cero)                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.04.        	Servicios Y Otros Pagados Anticipados                       	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.04.01.     	Seguros Pagados Por Anticipado                              	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.04.01.01   	Seguros A                                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.04.02.     	Arriendo Pagados Por Anticipado                             	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.04.02.01   	Arriendo Pagados Por Anticipado                             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.04.03.     	Anticipo A Proveedores                                      	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.04.03.01   	Anticipo A Laboratorios Negrete                             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.04.03.02   	Anticipo Proveedor Construcción                             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.04.03.03   	Anticipo Otros Proveedores                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.04.03.04   	Anticipo Proveedores Gastos Importación                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.05.        	Activos Por Impuestos Corrientes                            	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.05.01.     	Crédito Tributario A Favor De La Empresa Iva                	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.05.01.01   	Iva En Compras                                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.05.01.02   	Retenciones Iva De Clientes                                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.05.02.     	Crédito Tributario A Favor De La Empresa Renta              	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.05.02.01   	Anticipo Impuesto A La Renta                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.05.02.02   	Impuestos Retenidos Por Clientes Años Anteriores            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.05.02.03   	Impuestos Retenidos Por Clientes Año Actual                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.1.05.02.04   	Impuestos A La Renta A Favor Años Anteriores                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.           	Activo No Corriente                                         	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.        	Propiedad, Planta Y Equipo                                  	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.01.     	Costo                                                       	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.01.01   	Terrenos                                                    	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.01.02   	Edificios                                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.01.03   	Construcciones En Curso                                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.01.04   	Instalaciones                                               	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.01.05   	Muebles Y Enseres                                           	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.01.06   	Maquinaria Y Equipo                                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.01.07   	Naves, Aeronaves, Barcazas Y Similares                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.01.08   	Equipos De Computación                                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.01.09   	Vehículos, Equipos De Transporte Y Equipo Caminero Móvil    	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.01.10   	Otras Propiedades, Planta Y Equipo                          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.01.11   	Repuestos Y Herramientas                                    	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.02.     	(-) Depreciación Acumulada Propiedades, Planta Y Equipo     	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.02.02   	Dep.Acum. Edificios                                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.02.03   	Dep.Acum. Construcciones En Curso                           	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.02.04   	Dep.Acum. Instalaciones                                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.02.05   	Dep.Acum. Muebles Y Enseres                                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.02.06   	Dep.Acum. Maquinaria Y Equipo                               	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.02.07   	Dep.Acum. Naves, Aeronaves, Barcazas Y Similares            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.02.08   	Dep.Acum. Equipos De Computación                            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.02.09   	Dep.Acum. Vehículos, Equipos De Transporte Y Equipo Caminero	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.02.10   	Dep.Acum. Otras Propiedades, Planta Y Equipo                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.02.11   	Dep.Acum. Repuestos Y Herramientas                          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.03.     	(-) Deterioro Acumulado De Propiedades, Planta Y Equipo     	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.03.01   	Det.Acum. Terrenos                                          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.03.02   	Det.Acum. Edificios                                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.03.03   	Det.Acum. Construcciones En Curso                           	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.03.04   	Det.Acum. Instalaciones                                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.03.05   	Det.Acum. Muebles Y Enseres                                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.03.06   	Det.Acum. Maquinaria Y Equipo                               	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.03.07   	Det.Acum. Naves, Aeronaves, Barcazas Y Similares            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.03.08   	Det.Acum. Equipos De Computación                            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.03.09   	Det.Acum. Vehículos, Equipos De Transporte Y Equipo Caminero	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.03.10   	Det.Acum. Otras Propiedades,Planta Y Equipo                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.01.03.11   	Det.Acum. Repuestos Y Herramientas                          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.02.        	Propiedades De Inversion                                    	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.02.01.     	Costo                                                       	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.02.01.01   	Prop.Inversion Terrenos                                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.02.01.02   	Prop.Inversion Edificios                                    	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.02.02.     	(-)Deterioro Acumulado De Propiedades De Inversion          	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.02.02.01   	Det.Acum. Prop.Inversion Terrenos                           	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.02.02.02   	Det.Acum. Prop.Inversion Edificios                          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.04.        	Activo Intangible                                           	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.04.01.     	Costo                                                       	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.04.01.01   	Plusvalias                                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.04.01.02   	Marcas, Patentes, Derecho De Llave                          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.04.01.03   	Software Contable Y Ventas                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.04.02.     	(-) Amortizacion Acumalada De Activos Intangibles           	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.04.02.01   	Amortiz.Acum. Plusvalias                                    	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.04.02.02   	Amortiz .Acum. Marcas, Patentes, Derecho De Llave,Cuotas    	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.04.03.     	(-) Deterioro Acumulado De Activos Intangibles              	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.04.03.01   	Det.Acum. Plusvalias                                        	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.04.03.02   	Det.Acum. Marcas, Patentes, Derecho De Llave,Cuotas         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.05.        	Activos Por Impuestos Diferidos                             	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.05.01      	Activos Por Impuestos Diferidos                             	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.06.        	Activos Financieros No Corrientes                           	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.06.01.     	Activos Financieros Mantenidos Hasta Su Vencimiento         	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
1.2.06.01.01   	Depositos A Plazo Banco A                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.             	Pasivo                                                      	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.           	Pasivo Corriente                                            	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.03.        	Cuentas Y Documentos Por Pagar                              	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.03.01.     	Proveedores                                                 	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.03.01.01   	Proveedores Locales                                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.03.01.02   	Proveedores Del Exterior                                    	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.03.01.03   	Transitoria Cruce Proveedores (Siempre Cero)                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.04.        	Obligaciones Con Instituciones Financieras                  	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.04.01.     	Bancos Locales                                              	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.04.01.01   	Préstamo Banco Pichincha K 210000.00                        	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.04.01.02   	Préstamo Banco Pichincha K 100000.00                        	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.04.02.     	Bancos Del Exterior                                         	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.04.02.01   	Banco A                                                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.05.        	Provisiones                                                 	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.05.01.     	Contingencias Laborales                                     	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.05.01.01   	Contingencias Laborales                                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.05.02.     	Contingencias Tributarias                                   	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.05.02.01   	Contingencias Tributarias                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.        	Otras Obligaciones Corrientes                               	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.     	Con La Administracion Tributaria                            	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.01.  	Retencion En La Fuente                                      	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.01.01	Retencion Fuente En Relacion De Dependencia (302)           	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.01.02	Honorarios Profesionales 10% (303)                          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.01.03	Predomina El Intelecto 8%  (304)                            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.01.04	Predomina Mano De Obra 2% (307)                             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.01.05	Entre Sociedades 2% (308)                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.01.06	Publicidad Y Comunicacion 1% (309)                          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.01.07	Transporte Privado De Pasajeros O Carga 1% (310)            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.01.08	Transferencia De Bienes Muebles  1% (312)                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.01.09	Arriendamiento Mercantil (319)                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.01.10	Arrendamiento Bienes Inmuebles 8% (320)                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.01.11	Seguros Y Reaseguros (Primas Y Cesiones)  (322)             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.01.12	Rendimientos Financieros 2% (323)                           	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.01.13	Otras Retenciones 1% (343)                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.01.14	Otras Retenciones 2% (344)                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.01.15	Otras Retenciones 8% (345)                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.01.16	Otras Retenciones 25% (343)                                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.01.17	Formulario 103 Por Pagar                                    	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.01.18	Régimen Microempresarial 1.75% (351)                        	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.01.19	Otras Retenciones 1.75% (3440)                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.02.  	Impuesto Al Valor Agregado                                  	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.02.01	Iva En Ventas O Servicios                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.02.02	Retencion Del Iva 30% (721)                                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.02.03	Retencion Del Iva 70% (723)                                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.02.04	Retencion Del Iva 100% (725)                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.02.05	Retencion Del Iva 10%                                       	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.02.06	Retencion Del Iva 20%                                       	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.02.07	Formulario 104 Iva Por Pagar                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.03.  	Impuestos Sri Por Liquidar                                  	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.03.01	Facilidades De Pago                                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.04.  	Impuesto A Los Consumos Especiales                          	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.01.04.01	ICE En Ventas                                               	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.02.     	Impuesto A La Renta                                         	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.02.01   	Impuesto A La Renta Del Ejercicio Por Pagar                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.03.     	Con El Instituto Ecuatoriano De Seguridad Social            	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.03.01   	Aportes Personal Iess                                       	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.03.02   	Prestamos Quirografarios Iess                               	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.03.03   	Fondos De Reserva Iess                                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.03.04   	Aporte Patronal Iess                                        	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.03.05   	Prestamos Hipotecarios Iess                                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.03.06   	Extension Conyugal Por Pagar                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.04.     	Por Sueldos Beneficios De Ley A Empleados                   	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.04.01   	Sueldos                                                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.04.02   	Decimo Tercer Sueldo                                        	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.04.03   	Decimo Cuarto Sueldo                                        	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.04.04   	Vacaciones Provision                                        	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.04.05   	Fondos De Reserva Empleados                                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.04.06   	Liquidaciones Haberes Por Pagar                             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.05.     	Participacion Trabajadores Por Pagar                        	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.05.01   	Participacion Trabajadores Por Pagar Del Ejercicio          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.07.06.     	Dividendos Por Pagar                                        	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.08.        	Cuentas Por Pagar Relacionadas                              	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.08.01.     	Proveedor Relacionado                                       	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.08.02.     	Prestamos Relacionadas                                      	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.08.02.01   	Prestamos Relacionadas                                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.09.        	Otros Pasivos Financieros                                   	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.09.01.     	Comisiones                                                  	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.09.01.01   	Señor A                                                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.09.02.     	Otras Cuentas Por Pagar                                     	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.09.02.01   	Otras Cuentas Por Pagar                                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.09.02.02   	Anticipos En Ventas De Propiedad, Planta Y Equipo           	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.09.02.03   	Arriendos Por Pagar                                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.09.02.04   	Depositos Por Identificar                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.09.02.05   	Comision Tarjetas (Transitoria)                             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.09.02.99   	Otras Cuentas Por Pagar Propinas                            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.09.03.     	Tarjetas De Credito                                         	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.09.03.01   	Tarjeta A                                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.09.03.02   	Tarjeta B                                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.09.04.     	Prestamos De Terceros                                       	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.09.04.01   	Prestamo Elva Elizalde                                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.09.04.02   	Préstamo Por Pagar Silvia Pantoja                           	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.10.        	Anticipo De Clientes                                        	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.10.01.     	Anticipo De Clientes                                        	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.1.10.01.01   	Anticipo De Cliente Cobro Cartera                           	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.2.           	Pasivo No Corriente                                         	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.2.02.        	Cuentas Y Documentos Por Pagar                              	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.2.02.01.     	Proveedores Largo Plazo                                     	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.2.02.01.01   	Proveedores Largo Plazo Locales                             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.2.02.01.02   	Proveedores Largo Plazo Del Exterior                        	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.2.03.        	Obligaciones Con Instituciones Financieras Largo Plazo      	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.2.03.01.     	Prestamos Bcos Nacionales                                   	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.2.03.01.01   	Prestamos Banco Pichicnha                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.2.03.02.     	Prestamos Bcos Del Exterior                                 	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.2.03.02.01   	Banco A                                                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.2.04.        	Cuentas Por Pagar Relacionadas Largo Plazo                  	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.2.04.01.     	Proveedor Relacionado Largo Plazo                           	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.2.04.01.01   	Empresa A                                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.2.04.02.     	Prestamos Relacionadas Largo Plazo                          	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.2.04.02.01   	Pasivo No Corriente - Juan Pantoja                          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.2.07.        	Provisiones Por Bebeficios A Empleados                      	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.2.07.01.     	Provisiones Por Bebeficios A Empleados                      	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.2.07.01.01   	Jubilacion Patronal                                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.2.07.01.02   	Jubilacion Por Desahucio                                    	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.2.09.        	Pasivo Diferido                                             	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.2.09.01      	Ingresos Diferidos                                          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.2.09.02      	Pasivos Por Impuestos Diferidos                             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
2.2.10.        	Otros Pasivos Largo Plazo No Corrientes                     	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.             	Patrimonio Neto                                             	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.1.           	Capital                                                     	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.1.01.        	Capital Suscrito O Asignando                                	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.1.01.01      	Capital Suscrito O Asignando                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.1.01.02      	Socio B                                                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.2.           	Aportes De Socios O Accionistas Para Futura Capitalizacion  	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.2.01.        	Aportes De Socios O Accionistas Para Futura Capitalizacion  	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.2.01.01      	Aportes De Socios O Accionistas Para Futura Capitalizacion  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.2.01.02      	Socio B                                                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.4.           	Reservas                                                    	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.4.01.        	Reservas                                                    	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.4.01.01      	Reserva Legal                                               	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.4.01.02      	Reserva Facultativa Y Estatutaria                           	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.4.01.03      	Reserva De Capital                                          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.4.01.04      	Otras Reservas                                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.5.           	Otros Resultados Integrales                                 	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.5.01.        	Otros Resultados Integrales                                 	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.5.01.01      	Superavit Por Revaluacion De Act. Disponibles Para La Venta 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.5.01.02      	Superavit Por Revaluacion De Propiedades, Planta Y Equipo   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.5.01.03      	Superavit Por Revaluacion De Activos Intangibles            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.5.01.04      	Otros Superavit Por Revaluacion                             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.6.           	Resultados Acumulados                                       	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.6.01.        	Ganancias Acumuladas                                        	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.6.01.01      	Ganancias Acumuladas Año N                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.6.02.        	(-)Perdidas Acumuladas                                      	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.6.02.01      	(-)Perdidas Acumuladas Año N                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.6.03.        	Result. Acum. Provenientes De La Adopcion Por Primera Vez   	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.6.03.01      	Utilidad / Perdida Por Conversion De Niifs                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.7.           	Resultados Del Ejercicio                                    	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.7.01.        	Resultados Del Ejercicio                                    	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.7.01.01      	Ganancia Neta Del Periodo                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
3.7.01.02      	(-) Perdida Neta Del Periodo                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
4.             	Ingresos                                                    	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
4.1.           	Ingresos De Actividades Ordinarias                          	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
4.1.01.        	Venta De Bienes                                             	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
4.1.01.01      	Ventas Bienes Con Iva                                       	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
4.1.01.02      	Ventas Bienes Sin Iva                                       	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
4.1.02.        	(-) Descuentos En Ventas                                    	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
4.1.02.01      	Descuentos En Ventas Con Iva                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
4.1.02.02      	Descuentos En Ventas Sin Iva                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
4.1.02.04      	Otros Descuentos Ventas                                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
4.1.03.        	(-) Devoluciones En Ventas                                  	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
4.1.03.01      	Devolucion En Ventas Con Iva                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
4.1.03.02      	Devolucion En Ventas Sin Iva                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
4.2.           	Otros Ingresos                                              	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
4.2.01.        	Otros Ingresos                                              	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
4.2.01.01      	Utilidad En Venta De Activos Fijos                          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
4.2.01.02      	Ingreso Por Descuento En Ventas                             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
4.2.01.03      	Otros  Ingresos                                             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
4.2.01.04      	Otros Ingresos Por Facturacion                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
4.2.01.05      	Otros Ingresos Sobrantes Caja                               	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
4.2.01.06      	Venta Activos Fijos                                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.             	Egresos                                                     	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.           	Costos De Ventas Y Produccion                               	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.01.        	Materiales Utilizados O Productos Vendidos                  	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.01.01.     	Materiales Utilizados O Productos Vendidos                  	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.01.01.01   	Costo De Ventas Mercaderia Con Iva                          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.01.01.02   	Costo De Ventas Mercaderia Sin Iva                          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.01.01.03   	Descuento En Compras                                        	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.01.01.04   	Descuento Por Pronto Pago                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.01.01.05   	Otros Descuentos Compra                                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.01.02.     	Gasto Por Cantidades Anormales En El Proceso De Produccion  	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.01.02.01   	Gasto Por Cantidades Anormales De Mano De Obra              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.01.02.02   	Gasto Por Cantidades Anormales De Materiales                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.02.        	Materia Prima Consumida                                     	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.02.01.     	Materia Prima Consumida                                     	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.02.01.01   	Materia Prima Consumida                                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.02.99.     	Mp - Cta. Cierre Materia Prima Consumida                    	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.02.99.99   	Mp -  Cta. Cierre Materia Prima Consumida                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.        	Mano De Obra Directa                                        	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.01.     	Mod - Sueldos Y Beneficios Sociales                         	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.01.01.  	Mod - Sueldos Y Demas Remun. Materia Gravada Iess           	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.01.01.01	Mod - Sueldos Unificados                                    	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.01.01.02	Mod - Horas Extras                                          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.01.01.03	Mod - Comisiones Empleados                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.01.01.04	Mod - Bonos Por Desempeño                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.01.01.05	Mod - Participacion Trabajadores                            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.01.02.  	Mod - Aportes A La Seguridad Social (Incluido F. De Reserva)	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.01.02.01	Mod - Aporte Patronal                                       	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.01.02.02	Mod - Fondos De Reserva                                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.01.03.  	Mod - Beneficios Sociales E Indemnizaciones                 	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.01.03.01	Mod - Decimo Tercer Sueldo                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.01.03.02	Mod - Decimo Cuarto Sueldo                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.01.03.03	Mod - Vacaciones                                            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.01.03.04	Mod - Remuneracion Adicionales                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.01.03.05	Mod - Indemnizaciones Laborables                            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.01.03.06	Mod - Movilizacion                                          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.01.03.07	Mod - Vacaciones Por Pagar                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.02.     	Mod - Gasto Planes De Beneficios A Empleados                	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.02.01.  	Mod - Gasto Jubilacion Patronal Y Desahucio                 	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.02.01.01	Mod - Gasto Jubilacion Patronal                             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.02.01.02	Mod - Gasto Desahucio                                       	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.03.     	Mod - Cta De Cierre De Mano De Obra                         	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.03.99.  	Mod - Cta De Cierre De Mano De Obra                         	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.03.03.99.99	Mod - Cta De Cierre De Mano De Obra                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.        	Otros Costos Indirectos De Fabricacion                      	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.01.     	Cif - Depreciacione Planta Y Equipo                         	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.01.01   	Cif - Deprec. Edificios                                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.01.02   	Cif - Deprec. Instalaciones                                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.01.03   	Cif - Deprec. Muebles Y Enseres                             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.01.04   	Cif - Deprec. Maquinaria Y Equipo                           	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.01.05   	Cif - Deprec. Equipos De Computacion                        	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.01.06   	Cif - Deprec. Vehiculos,Equipos De Transporte Y Equipo Camin	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.01.07   	Cif - Deprec. Equipo De Logistica                           	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.03.     	Cif - Deterioro                                             	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.03.01   	Cif - Deterioro Propiedades, Planta Y Equipo                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.03.02   	Cif - Deterioro Inventarios                                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.03.03   	Cif - Deterioro Instrumentos Financieros                    	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.03.04   	Cif - Deterioro Intangibles                                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.03.05   	Cif - Deterioro Cuentas Por Cobrar                          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.03.06   	Cif - Deterioro Otros Activos                               	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.04.     	Cif - Efecto Valor Neto De Realizacion Inventarios          	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.04.01   	Cif - Ajuste Valor Neto De Realizacion                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.06.     	Cif - Mantenimiento Y Reparaciones                          	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.06.01   	Cif - Mant. Y Rep. De Equipos De Computacion                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.06.02   	Cif - Mant. Y Rep. De Equipos De Oficina                    	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.06.03   	Cif - Mant. Y Rep. De Vehiculos                             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.07.     	Cif - Suministros Materiales Y Repuestos                    	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.07.01   	Cif - Material De Embalaje                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.07.02   	Cif - Repuestos De Vehiculos                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.07.03   	Cif - Repuestos De Maquinaria                               	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.07.04   	Cif-Mantenimiento sistema eléctrico                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.08.     	Cif - Otros Costos De Produccion                            	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.08.01   	Cif - Servicio de Transporte de Materia Prima               	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.08.02   	Costo de Cireles                                            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.99.     	Cf - Cta De Cierre De Gastos Ind. De Fabricacion            	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.1.04.99.99   	Cf - Cta De Cierre De Gastos Ind. De Fabricacion            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.           	Gastos                                                      	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.        	Gastos De Ventas                                            	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.01.     	Gv - Sueldos Y Demas Remun. Materia Gravada Iess            	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.01.01   	Gv - Sueldos Unificados                                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.01.02   	Gv - Horas Extras                                           	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.01.03   	Gv - Comisiones Empleados                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.01.04   	Gv - Bonos Por Desempeño                                    	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.01.15   	Gv - 15% Participacion Trabajadores                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.02.     	Gv - Aportes A La Seguridad Social (Incluido Fondo De Reserv	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.02.01   	Gv - Aporte Patronal                                        	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.02.02   	Gv - Fondos De Reserva                                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.03.     	Gv - Beneficios Sociales E Indemnizaciones                  	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.03.01   	Gv - Decimo Tercer Sueldo                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.03.02   	Gv - Decimo Cuarto Sueldo                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.03.03   	Gv - Vacaciones                                             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.03.04   	Gv - Remuneracion Adicionales                               	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.03.05   	Gv - Indemnizaciones Laborables                             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.03.06   	Gv - Movilizacion                                           	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.03.07   	Gv - Vacaciones Por Pagar                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.04.     	Gv - Gasto Planes De Beneficios A Empleados                 	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.04.01   	Gv - Gasto Jubilacion Patronal                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.04.02   	Gv - Gasto Desahucio                                        	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.05.     	Gv - Honorarios, Comisiones Y Dietas Personas Naturales     	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.05.01   	Gv - Servicios Legales                                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.05.02   	Gv - Servicios Profesionales                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.06.     	Gv - Remuneraciones A Otros Trabajadores Autonomos          	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.06.01   	Gv - Servicios Ocasionales                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.06.02   	Gv - Servicios De Impresion E Imprenta                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.06.03   	Gv - Avaluos                                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.08.     	Gv - Mantenimiento Y Reparaciones                           	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.08.01   	Gv - Mant. Y Rep. De Equipos De Computacion                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.08.02   	Gv - Mant. Y Rep. De Equipos De Oficina                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.08.03   	Gv - Mant. Y Rep. De Vehiculos                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.08.04   	Gv - Mant. Y Rep. De  Instalaciones Telefonicas             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.09.     	Gv - Arrendamiento Operativo                                	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.09.01   	Gv - Arrendamiento De Oficina                               	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.10.     	Gv - Comisiones                                             	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.10.01   	Gv - Comisiones A Vendedores Externos                       	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.11.     	Gv - Promocion Y Publicidad                                 	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.11.01   	Gv - Ferias                                                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.11.02   	Gv - Servicios De Publicidad                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.11.03   	Gv - Publicidad Y Anuncios En Prensa                        	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.12.     	Gv - Combustibles Y Lubricantes                             	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.12.01   	Gv - Combustibles De Vehiculos                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.12.02   	Gv - Lubricantes                                            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.14.     	Gv - Seguros Y Reaseguros (Primas Y Cesiones)               	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.14.01   	Gv - Seguros De Vida                                        	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.14.02   	Gv - Seguros Generales                                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.14.03   	Gv - Asistencia Medica                                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.15.     	Gv - Transporte                                             	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.15.01   	Gv - Transporte De Personal                                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.15.02   	Gv - Transporte De Carga                                    	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.16.     	Gv - Gastos De Gestion                                      	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.16.01   	Gv - Refrigerios A Empleados                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.16.02   	Gv - Atencion A Clientes / Proveedores                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.16.03   	Gv - Gasto Restaurantes                                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.16.04   	Gv - Agasajo Navideño                                       	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.17.     	Gv - Gastos De Viajes                                       	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.17.01   	Gv - Pasajes Aereos                                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.17.02   	Gv - Hoteles                                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.17.03   	Gv - Alimentacion                                           	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.17.04   	Gv - Movilizacion En Viajes                                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.18.     	Gv - Agua, Energia, Luz Y Telecomunicaciones                	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.18.01   	Gv - Energia Electrica                                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.18.02   	Gv - Telefonia Celular                                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.18.03   	Gv - Telefonia Fija                                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.18.04   	Gv - Servicios De Internet                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.18.05   	Gv - Agua                                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.19.     	Gv - Notarios Y Registradores De La Propiedad Y Mercantiles 	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.19.01   	Gv - Notarios                                               	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.19.02   	Gv - Registradores De La Propiedad Y Mercantiles            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.20.     	Gv - Impuestos, Contribuciones Y Otros                      	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.20.01   	Gv - Gasto Impuesto A La Renta                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.20.02   	Gv - Gasto Iva                                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.20.03   	Gv - Municipales                                            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.20.04   	Gv - Camara De Comercio                                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.20.05   	Gv - Contribucion Superintendencia De Compañias             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.20.06   	Gv - Intereses Mora Y Multa                                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.20.07   	Gv - Impuestos Salida De Divisas                            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.21.     	Gv - Depreciaciones                                         	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.21.01   	Gv - Deprec. Edificios                                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.21.02   	Gv - Deprec. Instalaciones                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.21.03   	Gv - Deprec. Muebles Y Enseres                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.21.04   	Gv - Deprec. Maquinaria Y Equipo                            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.21.05   	Gv - Deprec. Equipos De Computacion                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.21.06   	Gv - Deprec. Vehiculos,Equipos De Transporte Y Equipo Camine	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.21.07   	Gv - Deprec. Equipo De Logistica                            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.22.     	Gv - Amortizaciones                                         	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.22.01   	Gv - Gastos Amortiz  Plusvalias                             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.22.02   	Gv - Gasto Amort.Iz. Marcas, Patentes, Derecho De Llave     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.23.     	Gv - Deterioro                                              	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.23.01   	Gv - Deterioro Propiedades, Planta Y Equipo                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.23.02   	Gv - Deterioro Inventarios                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.23.03   	Gv - Deterioro Instrumentos Financieros                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.23.04   	Gv - Deterioro Intangibles                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.23.05   	Gv - Deterioro Cuentas Por Cobrar                           	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.23.06   	Gv - Deterioro Otros Activos                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.27.     	Gv - Otros  Gastos                                          	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.27.01   	Gv - Suministros De Aseo Y Limpieza                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.27.02   	Gv - Suministros Y Materiales                               	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.27.04   	Gv - Comisiones Tarjetas De Credito                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.27.05   	Gv - Capacitacion Y Seminarios                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.27.07   	Gv - Seguridad                                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.27.09   	Gv - Suscripciones                                          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.27.11   	Gv - Atencion Empleados                                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.27.12   	Gv - Gastos Retenciones Asumidas                            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.27.13   	Gv - Donaciones                                             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.27.14   	Gv - Uniformes                                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.2.01.27.15   	Gv - Inventario Dañado U Obsoleto                           	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.           	Gastos Adminitrativos                                       	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.        	Ga - Gastos Administrativos                                 	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.01.     	Ga - Sueldos Y Demas Remun. Materia Gravada Iess            	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.01.01   	Ga - Sueldos Unificados                                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.01.02   	Ga - Horas Extras                                           	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.01.03   	Ga - Comisiones Empleados                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.01.04   	Ga - Bonos Por Desempeño                                    	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.01.05   	Ga - Bonos Empleados No Deducibles                          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.01.15   	Ga - 15% Participacion Trabajadores                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.02.     	Ga - Aportes A La Seguridad Social (Incluido Fondo De Reserv	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.02.01   	Ga - Aporte Patronal                                        	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.02.02   	Ga - Fondos De Reserva                                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.02.03   	Ga - Extension Conyugal                                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.03.     	Ga - Beneficios Sociales E Indemnizaciones                  	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.03.01   	Ga - Decimo Tercer Sueldo                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.03.02   	Ga - Decimo Cuarto Sueldo                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.03.03   	Ga - Vacaciones                                             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.03.04   	Ga - Remuneracion Adicionales                               	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.03.05   	Ga - Indemnizaciones Laborables                             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.03.06   	Ga - Movilizacion                                           	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.03.07   	Ga - Vacaciones Por Pagar                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.04.     	Ga - Gasto Planes De Beneficios A Empleados                 	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.04.01   	Ga - Gasto Jubilacion Patronal                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.04.02   	Ga - Gasto Desahucio                                        	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.05.     	Ga - Honorarios, Comisiones Y Dietas Personas Naturales     	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.05.01   	Ga - Servicios Legales                                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.05.02   	Ga - Servicios Profesionales                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.06.     	Ga - Remuneraciones A Otros Trabajadores Autonomos          	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.06.01   	Ga - Servicios Ocasionales                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.06.02   	Ga - Servicios De Impresion E Imprenta                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.06.03   	Ga - Análisis de laboratorio y  Permisos                    	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.06.04   	Ga Servicios De Redes Sociales                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.06.05   	Ga - Servicios Seguridad Industrial                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.08.     	Ga - Mantenimiento Y Reparaciones                           	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.08.01   	Ga - Mant. Y Rep. De Equipos De Computacion                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.08.02   	Ga - Mant. Y Rep. De Equipos De Oficina                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.08.03   	Ga - Mant. Y Rep. De Vehiculos                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.08.04   	Ga - Mant. Y Rep. De  Instalaciones Telefonicas             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.08.05   	Ga - Mantenimiento Instalaciones                            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.09.     	Ga - Arrendamiento Operativo                                	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.09.01   	Ga - Arrendamiento De Oficina                               	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.10.     	Ga - Comisiones                                             	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.10.01   	Ga - Comisiones A Vendedores Externos                       	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.11.     	Ga - Promocion Y Publicidad                                 	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.11.01   	Ga - Ferias                                                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.11.02   	Ga - Servicios De Publicidad                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.11.03   	Ga - Publicidad Y Anuncios En Prensa                        	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.12.     	Ga - Combustibles Y Lubricantes                             	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.12.01   	Ga - Combustibles De Vehiculos                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.12.02   	Ga - Lubricantes                                            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.14.     	Ga - Seguros Y Reaseguros (Primas Y Cesiones)               	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.14.01   	Ga - Seguros De Vida                                        	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.14.02   	Ga - Seguros Generales                                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.14.03   	Ga - Asistencia Medica                                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.15.     	Ga - Transporte                                             	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.15.01   	Ga - Transporte De Personal                                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.15.02   	Ga - Transporte De Encomienda                               	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.16.     	Ga - Gastos De Gestion                                      	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.16.01   	Ga - Refrigerios A Empleados                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.16.02   	Ga - Atencion A Clientes/Proveedores                        	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.16.03   	Ga - Gasto Restaurantes, Alimentacion Y Refrigerio          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.16.04   	Ga - Agasajo Navideño                                       	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.16.05   	Ga - Atencion Clientes                                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.17.     	Ga - Gastos De Viajes                                       	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.17.01   	Ga - Pasajes Aereos                                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.17.02   	Ga - Hoteles                                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.17.03   	Ga - Alimentacion Y Refrigerio                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.17.04   	Ga - Movilizacion En Viajes                                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.17.05   	Ga- Otros Gastos De Viajes                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.18.     	Ga - Agua, Energia, Luz Y Telecomunicaciones                	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.18.01   	Ga - Energia Electrica                                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.18.02   	Ga - Telefonia Celular                                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.18.03   	Ga - Telefonia Fija                                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.18.04   	Ga - Servicios De Internet                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.18.05   	Ga - Agua                                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.19.     	Ga - Notarios Y Registradores De La Propiedad Y Mercantiles 	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.19.01   	Ga - Notarios                                               	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.19.02   	Ga - Registradores De La Propiedad Y Mercantiles            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.20.     	Ga - Impuestos, Contribuciones Y Otros                      	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.20.01   	Ga - Gasto Impuesto A La Renta                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.20.02   	Ga - Gasto Iva                                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.20.03   	Ga - Patente Municipal                                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.20.04   	Ga - Camara De Comercio                                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.20.05   	Ga - Contribucion Superintendencia De Compañias             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.20.06   	Ga - Intereses Mora Y Multa                                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.20.07   	Ga - Impuestos Salida De Divisas                            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.20.08   	Ga- Impuesto Consumos Especiales Ice                        	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.20.09   	Ga- Retenciones Asumidas                                    	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.20.10   	Ga- 1.5 Por Mil                                             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.21.     	Ga - Depreciaciones                                         	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.21.01   	Ga - Deprec. Edificios                                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.21.02   	Ga - Deprec. Instalaciones                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.21.03   	Ga - Deprec. Muebles Y Enseres                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.21.04   	Ga - Deprec. Maquinaria Y Equipo                            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.21.05   	Ga - Deprec. Equipos De Computacion                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.21.06   	Ga - Deprec. Vehiculos,Equipos De Transporte Y Equipo Camine	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.21.07   	Ga - Deprec. Equipo De Logistica                            	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.22.     	Ga - Amortizaciones                                         	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.22.01   	Ga - Gastos Amortiz  Plusvalias                             	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.22.02   	Ga - Gasto Amort.Iz. Marcas, Patentes, Derecho De Llave     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.23.     	Ga - Deterioro                                              	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.23.01   	Ga - Deterioro Propiedades, Planta Y Equipo                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.23.02   	Ga - Deterioro Inventarios                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.23.03   	Ga - Deterioro Instrumentos Financieros                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.23.04   	Ga - Deterioro Intangibles                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.23.05   	Ga - Deterioro Cuentas Por Cobrar                           	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.23.06   	Ga - Deterioro Otros Activos                                	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.27.     	Ga - Otros  Gastos                                          	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.27.01   	Ga - Suministros De Aseo Y Limpieza                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.27.02   	Ga - Suministros Y Materiales                               	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.27.05   	Ga - Capacitacion Y Seminarios                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.27.07   	Ga - Seguridad Y  Monitoreo                                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.27.09   	Ga - Suscripciones                                          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.27.11   	Ga - Atencion Empleados                                     	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.27.13   	Ga - Donaciones Y Contribuciones Comuinidad                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.27.14   	Ga - Uniformes                                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.27.15   	Ga- Autoconsumo Suministros                                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.27.16   	Ga - Autoconsumo Alimentos                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.27.17   	Ga- Autocunsomo Otros                                       	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.27.18   	Otros Gastos Servicios                                      	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.27.19   	Otros Gastos Bienes                                         	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.3.01.27.20   	Ga - Servicio Auditoria Sociedades                          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.4.           	Gastos Financieros                                          	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.4.01.        	Gastos Financieros                                          	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.4.01.01.     	Gastos Financieros                                          	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.4.01.01.01   	Gf - Intereses Bancarios                                    	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.4.01.01.02   	Gf - Gastos Bancarios                                       	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.4.01.01.03   	Gf - Gastos Financiamiento De Activos                       	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.4.01.01.04   	Gf - Diferencia En Cambio                                   	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.4.01.01.05   	Gf - Otros Costos Financieros                               	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.4.01.01.06   	Gf- Seguro Pagado En Préstamos                              	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.4.01.02.     	Otros Gastos                                                	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.4.01.02.01   	Gf - Perdida En Inversiones En Asociadas                    	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.4.01.02.02   	Gf - Otros                                                  	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.5.           	Gastos No Deducibles                                        	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.5.01.        	Gastos No Deducibles                                        	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.5.01.01.     	Gastos No Deducibles                                        	MAY	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.5.01.01.01   	Gnd - Gasto No Deducible Generales                          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.5.01.01.02   	Devolucion Juguetes 2017                                    	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.5.01.01.03   	Gnd- Ingreso Y Egreso Facturas Mal Emitidas                 	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
5.5.01.01.04   	Gastos No Deducible Ajuste Cuentas                          	DET	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	ACT
\.


--
-- TOC entry 5065 (class 0 OID 25438)
-- Dependencies: 236
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departamentos (id_departamento, dep_nombre, dep_telefono, dep_mail, estado_dep) FROM stdin;
COMPRAS	Compras                       	0987654321  	compras@empresa.com                                         	ACT
BODEGAS	Bodegas                       	0987654322  	bodegas@empresa.com                                         	ACT
VENTAS 	Ventas                        	0987654323  	ventas@empresa.com                                          	ACT
RRHH   	Recursos Humanos              	0987654324  	rrhh@empresa.com                                            	ACT
CONTAB 	Contabilidad                  	0987654325  	contabilidad@empresa.com                                    	ACT
SISTEM 	Tecnologías de la Información 	0987654326  	it@empresa.com                                              	ACT
MARKET 	Marketing                     	0987654327  	marketing@empresa.com                                       	ACT
FINAN  	Finanzas                      	0987654328  	finanzas@empresa.com                                        	ACT
LOGIST 	Logística                     	0987654329  	logistica@empresa.com                                       	ACT
ADMINIS	Administración                	0987654330  	administracion@empresa.com                                  	ACT
\.


--
-- TOC entry 5073 (class 0 OID 25522)
-- Dependencies: 244
-- Data for Name: descuentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.descuentos (id_descuento, des_descripcion, des_valor, estado_des) FROM stdin;
D-0001 	Descuento de Seguro Médico              	200.00	ACT
D-0002 	Descuento de Aporte al IESS             	300.00	ACT
D-0003 	Descuento por Atrasos                   	50.00	ACT
D-0004 	Descuento por Faltas                    	100.00	ACT
D-0005 	Descuento de Seguro de Vida             	150.00	ACT
D-0006 	Descuento por Préstamo Personal         	400.00	ACT
D-0007 	Descuento de Seguro de Accidentes       	120.00	ACT
D-0008 	Descuento de Fondo de Pensiones         	350.00	ACT
D-0009 	Descuento por Uso de Herramientas       	70.00	ACT
D-0010 	Descuento por Capacitación              	80.00	ACT
D-0011 	Descuento de Uniforme                   	90.00	ACT
D-0012 	Descuento de Beneficio Social           	250.00	ACT
D-0013 	Descuento de Comisión Administrativa    	60.00	ACT
D-0014 	Descuento por Dañado de Equipos         	150.00	ACT
D-0015 	Descuento por Permisos No Pagados       	100.00	ACT
D-0016 	Descuento de Fondo de Ahorro            	200.00	ACT
D-0017 	Descuento por Servicios Médicos         	300.00	ACT
D-0018 	Descuento de Préstamo de Vivienda       	500.00	ACT
D-0019 	Descuento por Planificación Familiar    	120.00	ACT
D-0020 	Descuento por Convenio Educativo        	150.00	ACT
\.


--
-- TOC entry 5074 (class 0 OID 25527)
-- Dependencies: 245
-- Data for Name: desxempxpag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.desxempxpag (id_descuento, id_empleado, id_pago, dxe_fecha, dxe_valor, estado_dxe) FROM stdin;
D-0002 	E-0005 	2025-01	2025-01-22	300.00	PAG
D-0008 	E-0005 	2025-01	2025-01-22	350.00	PAG
D-0016 	E-0005 	2025-01	2025-01-22	200.00	PAG
\.


--
-- TOC entry 5067 (class 0 OID 25448)
-- Dependencies: 238
-- Data for Name: empleados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.empleados (id_empleado, emp_cedula, emp_apellido1, emp_apellido2, emp_nombre1, emp_nombre2, emp_sexo, emp_fechanacimiento, emp_sueldo, emp_mail, estado_emp, id_departamento, id_rol, emp_fechaalta, emp_fechabaja, emp_fechamodificacion) FROM stdin;
E-0126 	1704567916	Johnson                       	Martinez                      	Ana                           	Gabriela                      	F	1986-03-29	1750.00	agmjohnson1986@empresa.com              	ACT	BODEGAS	B-OPERA	\N	\N	\N
E-0127 	1704567917	Rodriguez                     	Davis                         	Carlos                        	Luis                          	M	1989-10-08	1900.00	cldavies1989@empresa.com                	ACT	FINAN  	CG-CONT	\N	\N	\N
E-0128 	1704567918	Brown                         	Garcia                        	Michael                       	Ana                           	M	1971-05-06	1450.00	magarcia1971@empresa.com                	ACT	MARKET 	C-COORD	\N	\N	\N
E-0133 	1704567923	Rodriguez                     	Brown                         	Michael                       	Carlos                        	M	1992-06-10	1600.00	mcrod1972@empresa.com                   	ACT	BODEGAS	B-OPERA	\N	\N	\N
E-0134 	1704567924	Garcia                        	Smith                         	Elena                         	Sarah                         	F	1984-09-21	1800.00	esmith1984@empresa.com                  	ACT	CONTAB 	CG-CONT	\N	\N	\N
E-0135 	1704567925	Davis                         	Martinez                      	Pedro                         	James                         	M	1989-07-14	2100.00	pjmartinez1989@empresa.com              	ACT	MARKET 	C-PLANI	\N	\N	\N
E-0136 	1704567926	Smith                         	Johnson                       	Maria                         	Luis                          	F	1974-02-11	1450.00	msjohnson1974@empresa.com               	ACT	VENTAS 	V-ANALI	\N	\N	\N
E-0137 	1704567927	Brown                         	Lopez                         	Carlos                        	James                         	M	1983-10-23	2500.00	cllopez1983@empresa.com                 	ACT	RRHH   	T-RECLU	\N	\N	\N
E-0138 	1704567928	Wilson                        	Rodriguez                     	Gabriela                      	Ana                           	F	1991-08-07	1500.00	garodriguez1991@empresa.com             	ACT	BODEGAS	B-ENCAR	\N	\N	\N
E-0139 	1704567929	Martinez                      	Wilson                        	Luis                          	Michael                       	M	1979-12-15	2400.00	lmwilson1979@empresa.com                	ACT	FINAN  	CG-AUXI	\N	\N	\N
E-0140 	1704567930	Perez                         	Johnson                       	Jennifer                      	Gabriela                      	F	1990-04-28	1350.00	jgjohnson1990@empresa.com               	ACT	LOGIST 	B-SUPER	\N	\N	\N
E-0141 	1704567931	Lopez                         	Smith                         	Carlos                        	Pedro                         	M	1972-06-09	1550.00	csmith1972@empresa.com                  	ACT	ADMINIS	S-GER  	\N	\N	\N
E-0142 	1704567932	Garcia                        	Brown                         	Ana                           	James                         	F	1994-02-27	2250.00	agbrown1994@empresa.com                 	ACT	COMPRAS	C-ANALI	\N	\N	\N
E-0143 	1704567933	Martinez                      	Davis                         	Michael                       	Sarah                         	M	1985-09-04	1700.00	msdavis1985@empresa.com                 	ACT	VENTAS 	V-REPRE	\N	\N	\N
E-0144 	1704567934	Rodriguez                     	Lopez                         	Elena                         	Carlos                        	F	1982-05-25	1900.00	ecrodriguez1982@empresa.com             	ACT	MARKET 	C-COORD	\N	\N	\N
E-0145 	1704567935	Wilson                        	Garcia                        	James                         	Luis                          	M	1977-01-29	1400.00	jgarcia1977@empresa.com                 	ACT	RRHH   	T-COORD	\N	\N	\N
E-0146 	1704567936	Perez                         	Johnson                       	Sarah                         	Maria                         	F	1988-11-17	2200.00	smjohnson1988@empresa.com               	ACT	BODEGAS	B-OPERA	\N	\N	\N
E-0147 	1704567937	Lopez                         	Smith                         	Pedro                         	Gabriela                      	M	1991-03-18	2050.00	pglopez1991@empresa.com                 	ACT	FINAN  	CG-CONT	\N	\N	\N
E-0148 	1704567938	Brown                         	Wilson                        	Ana                           	Michael                       	F	1975-12-29	1600.00	amwilson1975@empresa.com                	ACT	LOGIST 	B-COORD	\N	\N	\N
E-0149 	1704567939	Garcia                        	Martinez                      	Luis                          	Elena                         	M	1980-08-19	1850.00	lmartinez1980@empresa.com               	ACT	ADMINIS	S-DBA  	\N	\N	\N
E-0150 	1704567940	Rodriguez                     	Brown                         	Carlos                        	James                         	M	1986-12-31	1500.00	cbrown1986@empresa.com                  	ACT	VENTAS 	V-EJECU	\N	\N	\N
E-0104 	1704567894	Garcia                        	Lopez                         	Carlos                        	Luis                          	M	1981-11-07	1500.00	cgarcia1981@empresa.com                 	ACT	RRHH   	T-ESPEC	\N	\N	\N
E-0005 	1104567894	Martinez                      	Davis                         	Ana                           	Maria                         	F	1983-06-21	1800.00	amdavis1983@empresa.com                 	ACT	LOGIST 	B-COORD	\N	\N	\N
E-0006 	1104567895	Lopez                         	Brown                         	Gabriela                      	Sarah                         	F	1971-02-12	2000.00	gsbrown1971@empresa.com                 	ACT	MARKET 	C-PLANI	\N	\N	\N
E-0007 	1104567896	Wilson                        	Miller                        	Pedro                         	James                         	M	1989-11-08	1750.00	pjwilson1989@empresa.com                	ACT	ADMINIS	S-GER  	\N	\N	\N
E-0008 	1104567897	Johnson                       	Martinez                      	Michael                       	Carlos                        	M	1990-07-19	2100.00	mcmartinez1990@empresa.com              	ACT	SISTEM 	S-CEO  	\N	\N	\N
E-0009 	1104567898	Davis                         	Garcia                        	Jennifer                      	Elena                         	F	1982-01-05	1900.00	jegarcia1982@empresa.com                	ACT	FINAN  	CG-CONT	\N	\N	\N
E-0010 	1104567899	Martinez                      	Lopez                         	Luis                          	Juan                          	M	1973-04-23	1600.00	ljmartinez1973@empresa.com              	ACT	VENTAS 	V-EJECU	\N	\N	\N
E-0011 	1104567800	Perez                         	Smith                         	James                         	Luis                          	M	1987-06-30	1350.00	jlpsmith1987@empresa.com                	ACT	BODEGAS	B-ENCAR	\N	\N	\N
E-0012 	1104567801	Garcia                        	Johnson                       	Ana                           	Maria                         	F	1991-03-17	1550.00	amjgarcia1991@empresa.com               	ACT	COMPRAS	C-COORD	\N	\N	\N
E-0013 	1104567802	Rodriguez                     	Brown                         	Pedro                         	Michael                       	M	1968-09-14	1450.00	pmbrown1968@empresa.com                 	ACT	RRHH   	T-ESPEC	\N	\N	\N
E-0014 	1104567803	Smith                         	Davis                         	Carlos                        	Jennifer                      	M	1995-08-11	1850.00	cjdsmithe1995@empresa.com               	ACT	MARKET 	T-NOMIN	\N	\N	\N
E-0015 	1104567804	Johnson                       	Miller                        	Sarah                         	Luis                          	F	1979-12-21	2400.00	sljohnson1979@empresa.com               	ACT	CONTAB 	CG-AUXI	\N	\N	\N
E-0016 	1104567805	Wilson                        	Martinez                      	Gabriela                      	James                         	F	1984-10-07	1300.00	gimartinez1984@empresa.com              	ACT	FINAN  	V-ANALI	\N	\N	\N
E-0017 	1104567806	Davis                         	Garcia                        	Juan                          	Carlos                        	M	1990-06-29	2000.00	jdavis1990@empresa.com                  	ACT	VENTAS 	V-REPRE	\N	\N	\N
E-0018 	1104567807	Martinez                      	Lopez                         	Ana                           	Michael                       	F	1980-01-18	1950.00	amlopez1980@empresa.com                 	ACT	LOGIST 	B-SUPER	\N	\N	\N
E-0020 	1104567809	Wilson                        	Johnson                       	James                         	Sarah                         	M	1992-02-20	1800.00	jsjohnson1992@empresa.com               	ACT	BODEGAS	B-AUXIL	\N	\N	\N
E-0021 	0104567810	Smith                         	Brown                         	Michael                       	Elena                         	M	1985-11-24	1750.00	melena1985@empresa.com                  	ACT	MARKET 	C-ANALI	\N	\N	\N
E-0022 	0104567811	Johnson                       	Martinez                      	Carlos                        	Luis                          	M	1988-07-14	2000.00	clmartinez1988@empresa.com              	ACT	SISTEM 	S-PGM  	\N	\N	\N
E-0023 	0104567812	Brown                         	Lopez                         	Elena                         	Gabriela                      	F	1970-10-19	1600.00	elgabriela1970@empresa.com              	ACT	FINAN  	CG-CONT	\N	\N	\N
E-0024 	0104567813	Davis                         	Garcia                        	Pedro                         	James                         	M	1991-09-17	1850.00	pgarcia1991@empresa.com                 	ACT	CONTAB 	CG-AUXI	\N	\N	\N
E-0025 	0104567814	Martinez                      	Smith                         	Luis                          	Carlos                        	M	1975-04-15	1400.00	lcsmith1975@empresa.com                 	ACT	VENTAS 	V-ASESO	\N	\N	\N
E-0026 	0104567815	Lopez                         	Wilson                        	Ana                           	Jennifer                      	F	1993-11-25	2100.00	alwilson1993@empresa.com                	ACT	MARKET 	C-COORD	\N	\N	\N
E-0027 	0104567816	Johnson                       	Brown                         	Carlos                        	James                         	M	1969-06-06	1550.00	cjbbrown1969@empresa.com                	ACT	RRHH   	T-GENER	\N	\N	\N
E-0028 	0104567817	Garcia                        	Davis                         	Michael                       	Gabriela                      	M	1982-03-27	2000.00	mgdavis1982@empresa.com                 	ACT	BODEGAS	B-COORD	\N	\N	\N
E-0029 	0104567818	Rodriguez                     	Martinez                      	Sarah                         	Juan                          	F	1996-01-08	1750.00	sjmartinez1996@empresa.com              	ACT	ADMINIS	S-DBA  	\N	\N	\N
E-0030 	0104567819	Smith                         	Lopez                         	James                         	Luis                          	M	1984-12-09	1950.00	jlpsmith1984@empresa.com                	ACT	VENTAS 	V-EJECU	\N	\N	\N
E-0031 	0104567820	Martinez                      	Wilson                        	Ana                           	Carlos                        	F	1978-07-05	1450.00	acwilson1978@empresa.com                	ACT	VENTAS 	V-ANALI	\N	\N	\N
E-0032 	0104567822	Perez                         	Lopez                         	Juan                          	Gabriela                      	M	1986-04-12	1950.00	jglperez1986@empresa.com                	ACT	MARKET 	T-ESPEC	\N	\N	\N
E-0033 	0104567823	Johnson                       	Martinez                      	Elena                         	Luis                          	F	1990-12-02	2200.00	elmjohnson1990@empresa.com              	ACT	RRHH   	T-COORD	\N	\N	\N
E-0034 	0104567824	Brown                         	Smith                         	Carlos                        	James                         	M	1985-09-30	2100.00	cjbsmith1985@empresa.com                	ACT	LOGIST 	B-SUPER	\N	\N	\N
E-0035 	0104567825	Davis                         	Garcia                        	Maria                         	Ana                           	F	1973-02-14	1650.00	madavis1973@empresa.com                 	ACT	FINAN  	CG-CONT	\N	\N	\N
E-0036 	0104567826	Lopez                         	Johnson                       	Pedro                         	Michael                       	M	1976-06-08	1550.00	pmljohnson1976@empresa.com              	ACT	ADMINIS	S-CEO  	\N	\N	\N
E-0037 	0104567827	Martinez                      	Rodriguez                     	Gabriela                      	Sarah                         	F	1988-05-27	2000.00	gsrmartinez1988@empresa.com             	ACT	COMPRAS	C-PLANI	\N	\N	\N
E-0038 	0104567828	Garcia                        	Brown                         	Luis                          	Carlos                        	M	1972-03-13	1800.00	lcgarcia1972@empresa.com                	ACT	BODEGAS	B-OPERA	\N	\N	\N
E-0039 	0104567829	Smith                         	Davis                         	James                         	Luis                          	M	1987-08-17	2400.00	jlsmith1987@empresa.com                 	ACT	RRHH   	T-GENER	\N	\N	\N
E-0040 	0104567830	Wilson                        	Miller                        	Michael                       	Sarah                         	M	1994-10-23	1450.00	mswilson1994@empresa.com                	ACT	MARKET 	C-ANALI	\N	\N	\N
E-0041 	0104567831	Brown                         	Perez                         	Jennifer                      	Carlos                        	F	1983-01-19	2300.00	jcbrown1983@empresa.com                 	ACT	SISTEM 	S-PGM  	\N	\N	\N
E-0042 	0104567832	Garcia                        	Martinez                      	Juan                          	Elena                         	M	1981-07-28	1900.00	jegmartinez1981@empresa.com             	ACT	LOGIST 	B-ENCAR	\N	\N	\N
E-0043 	0104567833	Rodriguez                     	Lopez                         	Ana                           	James                         	F	1974-05-09	1400.00	ajrodriguez1974@empresa.com             	ACT	VENTAS 	V-EJECU	\N	\N	\N
E-0044 	0104567834	Davis                         	Smith                         	Luis                          	Pedro                         	M	1985-02-25	1550.00	lpdsmith1985@empresa.com                	ACT	CONTAB 	CG-AUXI	\N	\N	\N
E-0045 	0104567835	Martinez                      	Wilson                        	Carlos                        	Sarah                         	M	1992-09-18	2250.00	csmwilson1992@empresa.com               	ACT	BODEGAS	B-SUPER	\N	\N	\N
E-0046 	0104567836	Smith                         	Davis                         	Elena                         	Gabriela                      	F	1984-03-31	2500.00	egsmith1984@empresa.com                 	ACT	MARKET 	T-RECLU	\N	\N	\N
E-0047 	0104567837	Johnson                       	Garcia                        	Michael                       	Luis                          	M	1979-11-05	2100.00	mljohnson1979@empresa.com               	ACT	VENTAS 	V-ASESO	\N	\N	\N
E-0048 	0104567838	Perez                         	Lopez                         	Gabriela                      	Carlos                        	F	1989-08-22	1950.00	gclperez1989@empresa.com                	ACT	RRHH   	T-NOMIN	\N	\N	\N
E-0049 	0104567839	Wilson                        	Brown                         	Maria                         	Elena                         	F	1991-12-12	1800.00	mebwilson1991@empresa.com               	ACT	FINAN  	CG-CONT	\N	\N	\N
E-0050 	0104567840	Lopez                         	Johnson                       	Michael                       	James                         	M	1989-08-16	2500.00	mjlmichael1989@empresa.com              	ACT	RRHH   	T-RECLU	\N	\N	\N
E-0051 	0104567841	Martinez                      	Lopez                         	Pedro                         	Luis                          	M	1977-11-23	1650.00	pllopez1977@empresa.com                 	ACT	COMPRAS	C-ANALI	\N	\N	\N
E-0052 	0104567842	Garcia                        	Wilson                        	Carlos                        	James                         	M	1982-05-12	1750.00	cwilson1982@empresa.com                 	ACT	BODEGAS	B-OPERA	\N	\N	\N
E-0053 	0104567843	Smith                         	Brown                         	Maria                         	Sarah                         	F	1990-09-17	1450.00	msbrown1990@empresa.com                 	ACT	RRHH   	T-ESPEC	\N	\N	\N
E-0054 	0104567844	Rodriguez                     	Davis                         	Juan                          	Ana                           	M	1974-07-30	1500.00	jardav1974@empresa.com                  	ACT	LOGIST 	B-ENCAR	\N	\N	\N
E-0055 	0104567845	Perez                         	Martinez                      	Luis                          	Elena                         	M	1968-08-04	1900.00	lmper1970@empresa.com                   	ACT	FINAN  	CG-CONT	\N	\N	\N
E-0056 	0104567846	Martinez                      	Johnson                       	Sarah                         	Gabriela                      	F	1985-06-23	1550.00	sgjohnson1985@empresa.com               	ACT	SISTEM 	S-GER  	\N	\N	\N
E-0057 	0104567847	Lopez                         	Smith                         	Elena                         	Luis                          	F	1993-02-19	1350.00	elsmith1993@empresa.com                 	ACT	RRHH   	T-RECLU	\N	\N	\N
E-0058 	0104567848	Johnson                       	Garcia                        	Michael                       	James                         	M	1990-03-09	2250.00	mjgarcia1990@empresa.com                	ACT	VENTAS 	V-ANALI	\N	\N	\N
E-0059 	0104567849	Brown                         	Lopez                         	Carlos                        	Ana                           	M	1975-04-11	2450.00	cabrown1975@empresa.com                 	ACT	MARKET 	C-PLANI	\N	\N	\N
E-0060 	0104567850	Wilson                        	Davis                         	Luis                          	Sarah                         	M	1988-10-22	1400.00	lsdavis1988@empresa.com                 	ACT	BODEGAS	B-SUPER	\N	\N	\N
E-0061 	0104567851	Garcia                        	Perez                         	Pedro                         	Gabriela                      	M	1973-11-12	1800.00	gperez1973@empresa.com                  	ACT	FINAN  	CG-AUXI	\N	\N	\N
E-0062 	0104567852	Smith                         	Wilson                        	Jennifer                      	Carlos                        	F	1987-08-30	2000.00	jcsmith1987@empresa.com                 	ACT	LOGIST 	B-COORD	\N	\N	\N
E-0063 	0104567853	Johnson                       	Martinez                      	Maria                         	Juan                          	F	1992-09-18	1550.00	mjmartinez1992@empresa.com              	ACT	VENTAS 	V-EJECU	\N	\N	\N
E-0064 	0104567854	Lopez                         	Brown                         	Ana                           	Luis                          	F	1969-12-15	1600.00	albrown1969@empresa.com                 	ACT	RRHH   	T-ESPEC	\N	\N	\N
E-0065 	0104567855	Perez                         	Garcia                        	Luis                          	James                         	M	1978-05-07	1350.00	ljgarcia1978@empresa.com                	ACT	COMPRAS	C-COORD	\N	\N	\N
E-0066 	0104567856	Wilson                        	Smith                         	Gabriela                      	Maria                         	F	1984-03-26	1950.00	gmsmith1984@empresa.com                 	ACT	MARKET 	C-ANALI	\N	\N	\N
E-0097 	1704567887	Rodriguez                     	Lopez                         	Pedro                         	Carlos                        	M	1992-10-23	2300.00	pclopez1992@empresa.com                 	ACT	VENTAS 	V-EJECU	\N	\N	\N
E-0067 	0104567857	Brown                         	Davis                         	Carlos                        	Pedro                         	M	1980-12-30	2500.00	cpbrown1980@empresa.com                 	ACT	SISTEM 	S-PGM  	\N	\N	\N
E-0068 	0104567858	Martinez                      	Johnson                       	Elena                         	Sarah                         	F	1981-04-01	1500.00	emartinez1981@empresa.com               	ACT	LOGIST 	B-ENCAR	\N	\N	\N
E-0069 	0104567859	Rodriguez                     	Martinez                      	James                         	Gabriela                      	M	1994-11-05	2050.00	jmartinez1994@empresa.com               	ACT	BODEGAS	B-OPERA	\N	\N	\N
E-0070 	0104567860	Garcia                        	Lopez                         	Juan                          	Ana                           	M	1991-02-28	1650.00	jgarcia1991@empresa.com                 	ACT	FINAN  	CG-CONT	\N	\N	\N
E-0071 	0104567861	Martinez                      	Johnson                       	Pedro                         	James                         	M	1986-02-14	1650.00	pjmartinez1986@empresa.com              	ACT	VENTAS 	V-ANALI	\N	\N	\N
E-0072 	0104567862	Garcia                        	Wilson                        	Maria                         	Elena                         	F	1993-06-25	1750.00	mewilson1993@empresa.com                	ACT	COMPRAS	C-ANALI	\N	\N	\N
E-0073 	0104567863	Smith                         	Davis                         	Carlos                        	Luis                          	M	1988-03-08	1600.00	clsdsith1988@empresa.com                	ACT	RRHH   	T-GENER	\N	\N	\N
E-0074 	0104567864	Perez                         	Garcia                        	Jennifer                      	Gabriela                      	F	1977-01-29	2300.00	jgperez1977@empresa.com                 	ACT	BODEGAS	B-SUPER	\N	\N	\N
E-0075 	0104567865	Wilson                        	Brown                         	Ana                           	Sarah                         	F	1990-09-15	1450.00	aswbrown1990@empresa.com                	ACT	FINAN  	CG-AUXI	\N	\N	\N
E-0076 	0104567866	Davis                         	Martinez                      	Luis                          	Carlos                        	M	1982-10-19	1950.00	lcdavism1982@empresa.com                	ACT	SISTEM 	S-GER  	\N	\N	\N
E-0077 	0104567867	Lopez                         	Smith                         	Michael                       	Elena                         	M	1985-12-10	2150.00	melosmith1985@empresa.com               	ACT	VENTAS 	V-ASESO	\N	\N	\N
E-0078 	0104567868	Johnson                       	Brown                         	Gabriela                      	Ana                           	F	1992-11-26	2100.00	gbrownjohnson1992@empresa.com           	ACT	RRHH   	T-ESPEC	\N	\N	\N
E-0079 	0104567869	Brown                         	Lopez                         	Pedro                         	Juan                          	M	1980-04-03	1800.00	pjbrown1980@empresa.com                 	ACT	CONTAB 	CG-CONT	\N	\N	\N
E-0080 	0104567870	Rodriguez                     	Miller                        	Sarah                         	James                         	F	1979-07-11	2400.00	sjrodriguez1979@empresa.com             	ACT	MARKET 	C-COORD	\N	\N	\N
E-0081 	0104567871	Martinez                      	Smith                         	Juan                          	Carlos                        	M	1990-05-14	1550.00	jcsmith1990@empresa.com                 	ACT	ADMINIS	S-DBA  	\N	\N	\N
E-0082 	0104567872	Perez                         	Davis                         	James                         	Michael                       	M	1986-06-22	2200.00	jmperez1986@empresa.com                 	ACT	BODEGAS	B-ENCAR	\N	\N	\N
E-0083 	0104567873	Garcia                        	Johnson                       	Luis                          	Gabriela                      	M	1975-09-09	1350.00	gjohnson1975@empresa.com                	ACT	LOGIST 	B-OPERA	\N	\N	\N
E-0084 	0104567874	Lopez                         	Garcia                        	Ana                           	Sarah                         	F	1984-02-11	1400.00	asglopez1984@empresa.com                	ACT	FINAN  	CG-AUXI	\N	\N	\N
E-0085 	0104567875	Wilson                        	Martinez                      	Carlos                        	Luis                          	M	1991-08-29	2050.00	cwilsonmartinez1991@empresa.com         	ACT	VENTAS 	V-REPRE	\N	\N	\N
E-0086 	0104567876	Rodriguez                     	Brown                         	Gabriela                      	Elena                         	F	1982-04-20	1700.00	rjgabriela1982@empresa.com              	ACT	RRHH   	T-COORD	\N	\N	\N
E-0087 	0104567877	Davis                         	Smith                         	Sarah                         	James                         	F	1989-07-23	1500.00	sjamesdavissmith1989@empresa.com        	ACT	LOGIST 	B-ENCAR	\N	\N	\N
E-0088 	0104567878	Martinez                      	Wilson                        	Maria                         	Elena                         	F	1971-11-03	1800.00	mewilson1971@empresa.com                	ACT	COMPRAS	C-PLANI	\N	\N	\N
E-0089 	0104567879	Lopez                         	Rodriguez                     	Juan                          	Luis                          	M	1973-06-07	1450.00	jrodriguez1973@empresa.com              	ACT	RRHH   	T-NOMIN	\N	\N	\N
E-0090 	0104567880	Smith                         	Davis                         	Elena                         	Ana                           	F	1983-09-21	2250.00	sdana1983@empresa.com                   	ACT	BODEGAS	B-SUPER	\N	\N	\N
E-0091 	1704567881	Martinez                      	Lopez                         	Carlos                        	Pedro                         	M	1987-01-14	1650.00	clperez1987@empresa.com                 	ACT	COMPRAS	C-ANALI	\N	\N	\N
E-0092 	1704567882	Garcia                        	Johnson                       	Maria                         	Ana                           	F	1974-08-23	2000.00	majohnson1974@empresa.com               	ACT	BODEGAS	B-ENCAR	\N	\N	\N
E-0093 	1704567883	Smith                         	Davis                         	Luis                          	Gabriela                      	M	1985-02-11	1750.00	lgsmith1985@empresa.com                 	ACT	RRHH   	T-COORD	\N	\N	\N
E-0094 	1704567884	Lopez                         	Brown                         	Jennifer                      	Sarah                         	F	1991-03-29	1850.00	jslopez1991@empresa.com                 	ACT	MARKET 	C-ANALI	\N	\N	\N
E-0095 	1704567885	Perez                         	Wilson                        	Michael                       	James                         	M	1978-05-12	1500.00	mjwilson1978@empresa.com                	ACT	FINAN  	CG-AUXI	\N	\N	\N
E-0129 	1704567919	Martinez                      	Wilson                        	Elena                         	Luis                          	F	1981-07-17	1950.00	elwilson1981@empresa.com                	ACT	LOGIST 	B-ENCAR	\N	\N	\N
E-0130 	1704567920	Smith                         	Lopez                         	Juan                          	Sarah                         	M	1995-02-28	2100.00	jslopez1995@empresa.com                 	ACT	RRHH   	T-RECLU	\N	\N	\N
E-0131 	1704567921	Johnson                       	Perez                         	Ana                           	Maria                         	F	1980-05-03	1750.00	amperez1980@empresa.com                 	ACT	RRHH   	T-ESPEC	\N	\N	\N
E-0001 	1104567890	Perez                         	Lopez                         	Juan                          	Carlos                        	M	1985-05-12	1500.00	jclperez1985@empresa.com                	ACT	VENTAS 	V-REPRE	\N	\N	\N
E-0002 	1104567891	Garcia                        	Martinez                      	Maria                         	Elena                         	F	1992-03-09	1700.00	megmaria1992@empresa.com                	ACT	COMPRAS	C-ANALI	\N	\N	\N
E-0003 	1104567892	Rodriguez                     	Smith                         	Carlos                        	Luis                          	M	1978-07-23	2200.00	clsrodriguez1978@empresa.com            	ACT	BODEGAS	B-OPERA	\N	\N	\N
E-0004 	1104567893	Smith                         	Johnson                       	Luis                          	James                         	M	1965-10-18	1300.00	ljssmith1965@empresa.com                	ACT	RRHH   	T-RECLU	\N	\N	\N
E-0132 	1704567922	Lopez                         	Garcia                        	Luis                          	Gabriela                      	M	1976-04-18	2000.00	lglopez1976@empresa.com                 	ACT	SISTEM 	S-PGM  	\N	\N	\N
E-0096 	1704567886	Johnson                       	Martinez                      	Ana                           	Elena                         	F	1983-04-19	2150.00	aemartinez1983@empresa.com              	ACT	SISTEM 	S-GER  	\N	\N	\N
E-0098 	1704567888	Brown                         	Garcia                        	Gabriela                      	Luis                          	F	1976-06-17	1750.00	glgarcia1976@empresa.com                	ACT	RRHH   	T-RECLU	\N	\N	\N
E-0099 	1708558430	Cóndor                        	Cruz                          	Javier                        	Wilfrido                      	M	1965-09-14	2200.00	ccjw1965@empresa.com                    	ACT	SISTEM 	S-CEO  	\N	\N	\N
E-0100 	1704567890	Smith                         	Rodriguez                     	Carlos                        	Juan                          	M	1980-09-21	1950.00	cjrsmith1980@empresa.com                	ACT	ADMINIS	S-DBA  	\N	\N	\N
E-0101 	1704567891	Lopez                         	Martinez                      	Luis                          	Elena                         	M	1990-08-15	1600.00	lemartinez1990@empresa.com              	ACT	COMPRAS	C-COORD	\N	\N	\N
E-0102 	1704567892	Perez                         	Johnson                       	Elena                         	Maria                         	F	1987-12-12	1400.00	emperez1987@empresa.com                 	ACT	FINAN  	CG-CONT	\N	\N	\N
E-0103 	1704567893	Brown                         	Wilson                        	Gabriela                      	Sarah                         	F	1995-02-02	1700.00	gsbrown1995@empresa.com                 	ACT	MARKET 	T-NOMIN	\N	\N	\N
E-0105 	1704567895	Martinez                      	Brown                         	Pedro                         	Ana                           	M	1984-04-30	2200.00	pbrown1984@empresa.com                  	ACT	BODEGAS	B-OPERA	\N	\N	\N
E-0106 	1704567896	Davis                         	Garcia                        	Michael                       	James                         	M	1973-07-13	2400.00	mgarcia1973@empresa.com                 	ACT	LOGIST 	B-ENCAR	\N	\N	\N
E-0107 	1704567897	Rodriguez                     	Smith                         	Maria                         	Elena                         	F	1989-03-17	1900.00	msmith1989@empresa.com                  	ACT	VENTAS 	V-ANALI	\N	\N	\N
E-0108 	1704567898	Lopez                         	Wilson                        	Carlos                        	Gabriela                      	M	1976-08-11	2100.00	cwilson1976@empresa.com                 	ACT	RRHH   	T-COORD	\N	\N	\N
E-0109 	1704567899	Perez                         	Brown                         	Juan                          	Luis                          	M	1982-10-29	1450.00	jlbrown1982@empresa.com                 	ACT	FINAN  	CG-AUXI	\N	\N	\N
E-0110 	1704567900	Johnson                       	Garcia                        	Sarah                         	James                         	F	1991-01-19	1700.00	sgarcia1991@empresa.com                 	ACT	ADMINIS	S-CEO  	\N	\N	\N
E-0111 	1704567901	Martinez                      	Johnson                       	Ana                           	Maria                         	F	1977-04-16	1800.00	amjohnson1977@empresa.com               	ACT	RRHH   	T-GENER	\N	\N	\N
E-0112 	1704567902	Garcia                        	Smith                         	Pedro                         	James                         	M	1983-12-10	1500.00	pjsmith1983@empresa.com                 	ACT	BODEGAS	B-OPERA	\N	\N	\N
E-0113 	1704567903	Lopez                         	Brown                         	Luis                          	Carlos                        	M	1991-08-04	1550.00	lcbrown1991@empresa.com                 	ACT	MARKET 	C-ANALI	\N	\N	\N
E-0114 	1704567904	Perez                         	Martinez                      	James                         	Elena                         	M	1986-07-09	1750.00	jemartinez1986@empresa.com              	ACT	FINAN  	CG-CONT	\N	\N	\N
E-0115 	1704567905	Johnson                       	Wilson                        	Maria                         	Gabriela                      	F	1972-03-27	2200.00	mgwilson1972@empresa.com                	ACT	COMPRAS	C-PLANI	\N	\N	\N
E-0116 	1704567906	Brown                         	Garcia                        	Sarah                         	Michael                       	F	1990-10-20	1600.00	smgarcia1990@empresa.com                	ACT	VENTAS 	V-ASESO	\N	\N	\N
E-0117 	1704567907	Martinez                      	Davis                         	Carlos                        	Pedro                         	M	1979-05-01	1900.00	cpdavis1979@empresa.com                 	ACT	SISTEM 	S-PGM  	\N	\N	\N
E-0118 	1704567908	Smith                         	Lopez                         	Elena                         	Ana                           	F	1988-01-25	1450.00	elaslopez1988@empresa.com               	ACT	RRHH   	T-RECLU	\N	\N	\N
E-0119 	1704567909	Rodriguez                     	Johnson                       	Michael                       	Luis                          	M	1976-08-07	2300.00	mjohnson1976@empresa.com                	ACT	BODEGAS	B-SUPER	\N	\N	\N
E-0120 	1704567910	Garcia                        	Brown                         	Ana                           	James                         	F	1982-09-15	1700.00	ajbrown1982@empresa.com                 	ACT	MARKET 	T-ESPEC	\N	\N	\N
E-0121 	1704567911	Martinez                      	Smith                         	Carlos                        	Juan                          	M	1987-11-18	2150.00	cjmsmith1987@empresa.com                	ACT	LOGIST 	B-ENCAR	\N	\N	\N
E-0122 	1704567912	Davis                         	Wilson                        	Jennifer                      	Maria                         	F	1975-04-02	1500.00	jmwilson1975@empresa.com                	ACT	ADMINIS	S-DBA  	\N	\N	\N
E-0123 	1704567913	Lopez                         	Garcia                        	Luis                          	Elena                         	M	1992-06-11	2500.00	leogarcia1992@empresa.com               	ACT	VENTAS 	V-EJECU	\N	\N	\N
E-0124 	1704567914	Perez                         	Brown                         	Gabriela                      	Sarah                         	F	1983-08-14	1850.00	gbrown1983@empresa.com                  	ACT	RRHH   	T-NOMIN	\N	\N	\N
E-0125 	1704567915	Smith                         	Johnson                       	Pedro                         	James                         	M	1974-12-25	1300.00	pjjohnson1974@empresa.com               	ACT	CONTAB 	CG-AUXI	\N	\N	\N
E-0152 	0707001300	Veintimilla                   	Salazar                       	Andy                          	Ariel                         	M	2004-07-08	1250.00	andy@empresa.com                        	INA	BODEGAS	B-OPERA	2025-01-15 00:00:00	2025-01-15 13:17:07.517007	2025-01-15 13:30:43.083509
E-0153 	0701504250	Gallardo                      	Ramirez                       	Anthony                       	Tenesaca                      	M	2004-04-14	1500.00	anthony@empresa.com                     	ACT	SISTEM 	S-DBA  	2025-01-15 13:21:15.624313	\N	\N
E-0019 	1104567808	Garcia                        	Smith                         	Luis                          	Carlos                        	M	1977-05-14	2500.00	lcsmith1977@empresa.com                 	INA	RRHH   	T-COORD	\N	2025-01-22 14:17:29.787086	2025-01-22 14:26:21.075023
E-0151 	0707001392	Gallardo                      	Toro                          	Jossue                        	Hermel                        	M	2004-06-09	1250.00	jossue@empresa.com                      	ACT	COMPRAS	C-PLANI	\N	2025-02-15 22:53:48.37105	2025-02-15 22:54:03.68507
\.


--
-- TOC entry 5057 (class 0 OID 25357)
-- Dependencies: 228
-- Data for Name: entregas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entregas (id_entrega, user_id, ent_descripcion, ent_fechahora, ent_num_produc, estado_ent) FROM stdin;
\.


--
-- TOC entry 5059 (class 0 OID 25377)
-- Dependencies: 230
-- Data for Name: facturas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facturas (id_factura, id_cliente, fac_descripcion, fac_fecha_hora, fac_subtotal, fac_iva, estado_fac) FROM stdin;
FAC001 	CLI001 	Venta general                 	2024-01-10 10:00:00	0.00	0	ACT
FAC002 	CLI002 	Venta general                 	2024-01-15 14:30:00	0.00	0	ACT
FAC003 	CLI003 	Venta general                 	2024-02-05 09:15:00	0.00	0	ACT
FAC004 	CLI004 	Venta general                 	2024-02-18 11:45:00	0.00	0	ACT
FAC005 	CLI005 	Venta general                 	2024-03-10 08:50:00	0.00	0	ACT
FAC006 	CLI006 	Venta general                 	2024-03-25 16:20:00	0.00	0	ACT
FAC007 	CLI007 	Venta general                 	2024-04-07 10:35:00	0.00	0	ACT
FAC008 	CLI008 	Venta general                 	2024-04-20 13:10:00	0.00	0	ACT
FAC009 	CLI009 	Venta general                 	2024-05-12 15:25:00	0.00	0	ACT
FAC010 	CLI010 	Venta general                 	2024-05-28 09:40:00	0.00	0	ACT
FAC011 	CLI011 	Venta general                 	2024-06-05 14:00:00	0.00	0	ACT
FAC012 	CLI012 	Venta general                 	2024-06-15 12:45:00	0.00	0	ACT
FAC013 	CLI013 	Venta general                 	2024-07-10 11:30:00	0.00	0	ACT
FAC014 	CLI014 	Venta general                 	2024-07-22 08:20:00	0.00	0	ACT
FAC015 	CLI015 	Venta general                 	2024-08-15 17:50:00	0.00	0	ACT
FAC016 	CLI016 	Venta general                 	2024-08-28 10:15:00	0.00	0	ACT
FAC017 	CLI017 	Venta general                 	2024-09-12 13:30:00	0.00	0	ACT
FAC018 	CLI018 	Venta general                 	2024-09-25 09:00:00	0.00	0	ACT
FAC019 	CLI019 	Venta general                 	2024-10-05 11:20:00	0.00	0	ACT
FAC020 	CLI020 	Venta general                 	2024-10-18 14:10:00	0.00	0	ACT
\.


--
-- TOC entry 5069 (class 0 OID 25477)
-- Dependencies: 240
-- Data for Name: pagos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pagos (id_pago, pag_descripcion, pag_fecha_inicio, pag_fecha_fin, estado_pag) FROM stdin;
2023-01	Rol de pago - Enero                     	2023-01-01	2023-01-31	ACT
2023-02	Rol de pago - Febrero                   	2023-02-01	2023-02-28	ACT
2023-03	Rol de pago - Marzo                     	2023-03-01	2023-03-31	ACT
2023-04	Rol de pago - Abril                     	2023-04-01	2023-04-30	ACT
2023-05	Rol de pago - Mayo                      	2023-05-01	2023-05-31	ACT
2023-06	Rol de pago - Junio                     	2023-06-01	2023-06-30	ACT
2023-07	Rol de pago - Julio                     	2023-07-01	2023-07-31	ACT
2023-08	Rol de pago - Agosto                    	2023-08-01	2023-08-31	ACT
2023-09	Rol de pago - Septiembre                	2023-09-01	2023-09-30	ACT
2023-10	Rol de pago - Octubre                   	2023-10-01	2023-10-31	ACT
2023-11	Rol de pago - Noviembre                 	2023-11-01	2023-11-30	ACT
2023-12	Rol de pago - Diciembre                 	2023-12-01	2023-12-31	ACT
2024-01	Rol de pago - Enero                     	2024-01-01	2024-01-31	ACT
2024-02	Rol de pago - Febrero                   	2024-02-01	2024-02-28	ACT
2024-03	Rol de pago - Marzo                     	2024-03-01	2024-03-31	ACT
2024-04	Rol de pago - Abril                     	2024-04-01	2024-04-30	ACT
2024-05	Rol de pago - Mayo                      	2024-05-01	2024-05-31	ACT
2024-06	Rol de pago - Junio                     	2024-06-01	2024-06-30	ACT
2024-07	Rol de pago - Julio                     	2024-07-01	2024-07-31	ACT
2024-08	Rol de pago - Agosto                    	2024-08-01	2024-08-31	ACT
2024-09	Rol de pago - Septiembre                	2024-09-01	2024-09-30	ACT
2024-10	Rol de pago - Octubre                   	2024-10-01	2024-10-31	ACT
2024-11	Rol de pago - Noviembre                 	2024-11-01	2024-11-30	ACT
2024-12	Rol de pago - Diciembre                 	2024-12-01	2024-12-31	ACT
2025-01	Rol de pago - Enero                     	2025-01-01	2025-01-31	ACT
\.


--
-- TOC entry 5070 (class 0 OID 25482)
-- Dependencies: 241
-- Data for Name: pagxemp; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pagxemp (id_pago, id_empleado, emp_sueldo, emp_bonificaciones, emp_descuentos, emp_valor_neto, estado_pxe) FROM stdin;
2025-01	E-0005 	1800.00	1000.00	850.00	1950.00	PAG
\.


--
-- TOC entry 5050 (class 0 OID 25277)
-- Dependencies: 221
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (id_producto, pro_descripcion, pro_um_compra, pro_um_venta, pro_valor_compra, pro_precio_venta, pro_saldo_inicial, pro_qty_ingresos, pro_qty_egresos, pro_qty_ajustes, pro_saldo_final, estado_prod) FROM stdin;
P001   	Arroz Blanco                            	KG 	KG 	1.20	1.50	100	50	30	0	120	ACT
P002   	Aceite Vegetal                          	LT 	LT 	2.50	3.00	200	100	80	0	220	ACT
P003   	Azúcar                                  	KG 	KG 	1.10	1.40	150	80	60	0	170	ACT
P004   	Leche en Polvo                          	KG 	KG 	3.50	4.20	120	60	40	0	140	ACT
P005   	Fideos                                  	PK 	PK 	0.80	1.00	300	150	100	0	350	ACT
P006   	Harina de Trigo                         	KG 	KG 	1.30	1.60	130	70	50	0	150	ACT
P007   	Café                                    	PK 	PK 	2.00	2.50	100	50	30	0	120	ACT
P008   	Sal                                     	KG 	KG 	0.50	0.70	400	200	150	0	450	ACT
P009   	Leche Entera                            	LT 	LT 	1.00	1.30	250	100	80	0	270	ACT
P010   	Detergente en Polvo                     	KG 	KG 	2.80	3.40	80	40	20	0	100	ACT
P011   	Jabón de Tocador                        	UND	UND	0.40	0.50	500	250	200	0	550	ACT
P012   	Papel Higiénico                         	PK 	PK 	2.00	2.50	300	150	100	0	350	ACT
P013   	Shampoo                                 	LT 	LT 	3.00	3.80	60	30	20	0	70	ACT
P014   	Acondicionador                          	LT 	LT 	3.20	4.00	50	20	10	0	60	ACT
P015   	Cepillo Dental                          	UND	UND	1.00	1.20	200	100	80	0	220	ACT
P016   	Pasta Dental                            	UND	UND	2.20	2.80	150	75	60	0	165	ACT
P017   	Desinfectante                           	LT 	LT 	1.50	2.00	100	50	40	0	110	ACT
P018   	Cloro                                   	LT 	LT 	1.00	1.30	120	60	50	0	130	ACT
P019   	Esponja de Cocina                       	UND	UND	0.30	0.40	300	150	100	0	350	ACT
P020   	Toalla de Papel                         	PK 	PK 	2.50	3.00	80	40	30	0	90	ACT
P021   	Carne de Res                            	KG 	KG 	5.00	6.50	90	45	30	0	105	ACT
P022   	Pollo                                   	KG 	KG 	3.50	4.20	120	60	40	0	140	ACT
P023   	Pescado                                 	KG 	KG 	4.50	5.50	70	35	20	0	85	ACT
P024   	Queso                                   	KG 	KG 	3.20	4.00	100	50	30	0	120	ACT
P025   	Jamón                                   	KG 	KG 	4.00	5.00	60	30	20	0	70	ACT
P026   	Salchichas                              	PK 	PK 	1.50	2.00	150	75	50	0	175	ACT
P027   	Galletas                                	PK 	PK 	0.80	1.00	250	125	100	0	275	ACT
P028   	Pan de Molde                            	PK 	PK 	1.20	1.50	180	90	70	0	200	ACT
P029   	Mantequilla                             	KG 	KG 	2.80	3.50	110	55	40	0	125	ACT
P030   	Mayonesa                                	LT 	LT 	1.80	2.30	100	50	30	0	120	ACT
P031   	Salsa de Tomate                         	LT 	LT 	1.50	1.90	120	60	40	0	140	ACT
P032   	Cereal                                  	PK 	PK 	3.00	3.80	90	45	30	0	105	ACT
P033   	Mermelada                               	LT 	LT 	2.20	2.80	80	40	20	0	100	ACT
P034   	Avena                                   	KG 	KG 	1.50	1.90	150	75	50	0	175	ACT
P035   	Sardinas                                	PK 	PK 	1.00	1.30	200	100	70	0	230	ACT
P036   	Atún                                    	PK 	PK 	1.20	1.50	150	75	50	0	175	ACT
P037   	Jugo de Naranja                         	LT 	LT 	1.80	2.20	100	50	40	0	110	ACT
P038   	Refresco en Polvo                       	PK 	PK 	0.90	1.20	250	125	100	0	275	ACT
P039   	Chocolate en Barra                      	UND	UND	0.70	1.00	300	150	120	0	330	ACT
P040   	Manteca                                 	KG 	KG 	1.50	2.00	110	55	40	0	125	ACT
P041   	Harina de Maíz                          	KG 	KG 	1.10	1.40	180	90	70	0	200	ACT
P042   	Lentejas                                	KG 	KG 	1.30	1.70	220	110	80	0	250	ACT
P043   	Garbanzos                               	KG 	KG 	1.50	1.90	170	85	60	0	195	ACT
P044   	Frijoles                                	KG 	KG 	1.40	1.80	160	80	60	0	180	ACT
P045   	Ajo                                     	KG 	KG 	2.50	3.00	100	50	40	0	110	ACT
P046   	Cebolla                                 	KG 	KG 	1.20	1.50	200	100	70	0	230	ACT
P047   	Pimiento                                	KG 	KG 	1.80	2.30	140	70	50	0	160	ACT
P048   	Zanahoria                               	KG 	KG 	1.00	1.20	180	90	70	0	200	ACT
P049   	Papa                                    	KG 	KG 	0.90	1.10	250	125	100	0	275	ACT
P050   	Yuca                                    	KG 	KG 	0.80	1.00	300	150	120	0	330	ACT
P051   	Manzana                                 	KG 	KG 	1.50	2.00	130	65	50	0	145	ACT
P052   	Banano                                  	KG 	KG 	1.20	1.50	220	110	80	0	250	ACT
P053   	Naranja                                 	KG 	KG 	1.10	1.40	170	85	60	0	195	ACT
P054   	Limón                                   	KG 	KG 	1.00	1.30	150	75	50	0	175	ACT
P055   	Piña                                    	KG 	KG 	2.00	2.50	100	50	30	0	120	ACT
P056   	Sandía                                  	KG 	KG 	1.50	1.90	120	60	40	0	140	ACT
P057   	Uva                                     	KG 	KG 	2.20	2.80	110	55	40	0	125	ACT
P058   	Mango                                   	KG 	KG 	1.80	2.30	140	70	50	0	160	ACT
P059   	Durazno                                 	KG 	KG 	2.00	2.50	150	75	60	0	165	ACT
P060   	Aguacate                                	KG 	KG 	2.50	3.00	90	45	30	0	105	ACT
P061   	Cerveza                                 	LT 	LT 	1.50	2.00	200	100	80	0	220	ACT
P062   	Vino Tinto                              	LT 	LT 	5.00	7.00	120	60	40	0	140	ACT
P063   	Vodka                                   	LT 	LT 	8.00	10.50	100	50	30	0	120	ACT
P064   	Ron                                     	LT 	LT 	6.00	7.80	80	40	20	0	100	ACT
P065   	Whisky                                  	LT 	LT 	15.00	18.00	50	25	15	0	60	ACT
P066   	Tequila                                 	LT 	LT 	12.00	15.00	60	30	20	0	70	ACT
P067   	Coca Cola                               	LT 	LT 	0.80	1.00	300	150	100	0	350	ACT
P068   	Pepsi                                   	LT 	LT 	0.80	1.00	300	150	100	0	350	ACT
P069   	Jugo de Manzana                         	LT 	LT 	1.20	1.50	200	100	80	0	220	ACT
P070   	Agua Mineral                            	LT 	LT 	0.50	0.70	400	200	150	0	450	ACT
P071   	Gaseosa Naranja                         	LT 	LT 	0.80	1.00	250	125	100	0	275	ACT
P072   	Gaseosa Limón                           	LT 	LT 	0.80	1.00	250	125	100	0	275	ACT
P073   	Cereal de Maíz                          	PK 	PK 	2.50	3.20	120	60	40	0	140	ACT
P074   	Galletas de Chocolate                   	PK 	PK 	1.50	2.00	200	100	80	0	220	ACT
P075   	Galletas de Vainilla                    	PK 	PK 	1.30	1.80	180	90	70	0	200	ACT
P076   	Palomitas de Maíz                       	PK 	PK 	0.90	1.20	250	125	100	0	275	ACT
P077   	Helado de Vainilla                      	LT 	LT 	3.00	4.00	80	40	30	0	90	ACT
P078   	Helado de Chocolate                     	LT 	LT 	3.00	4.00	80	40	30	0	90	ACT
P079   	Yogurt Natural                          	LT 	LT 	1.20	1.50	100	50	30	0	120	ACT
P080   	Yogurt de Fresa                         	LT 	LT 	1.20	1.50	100	50	30	0	120	ACT
P081   	Leche Descremada                        	LT 	LT 	1.00	1.30	150	75	50	0	175	ACT
P082   	Leche Entera                            	LT 	LT 	1.10	1.40	140	70	40	0	170	ACT
P083   	Queso Mozzarella                        	KG 	KG 	4.50	5.50	80	40	20	0	100	ACT
P084   	Mantequilla sin Sal                     	KG 	KG 	3.00	3.80	120	60	40	0	140	ACT
P085   	Huevos                                  	DZA	DZA	1.80	2.20	300	150	120	0	330	ACT
P086   	Pollo Entero                            	KG 	KG 	3.20	4.00	90	45	30	0	105	ACT
P087   	Carne Molida                            	KG 	KG 	4.00	5.00	70	35	20	0	85	ACT
P088   	Chuleta de Cerdo                        	KG 	KG 	5.00	6.20	60	30	15	0	75	ACT
P089   	Café Instantáneo                        	PK 	PK 	3.00	3.80	200	100	80	0	220	ACT
P090   	Té en Bolsitas                          	PK 	PK 	1.00	1.30	150	75	50	0	175	ACT
P091   	Miel de Abeja                           	LT 	LT 	4.50	5.50	100	50	30	0	120	ACT
P092   	Vinagre                                 	LT 	LT 	1.20	1.50	120	60	40	0	140	ACT
P093   	Salsa de Soja                           	LT 	LT 	1.80	2.20	80	40	20	0	100	ACT
P094   	Aceite de Oliva                         	LT 	LT 	5.00	6.50	60	30	15	0	75	ACT
P095   	Aceitunas                               	KG 	KG 	3.50	4.50	140	70	50	0	160	ACT
P096   	Pepinillos                              	KG 	KG 	2.80	3.40	120	60	40	0	140	ACT
P097   	Harina para Tortillas                   	KG 	KG 	1.20	1.50	150	75	60	0	165	ACT
P098   	Azúcar Morena                           	KG 	KG 	1.10	1.40	130	65	50	0	145	ACT
P099   	Chocolate en Polvo                      	PK 	PK 	2.00	2.50	110	55	40	0	125	ACT
P100   	Gelatina                                	PK 	PK 	0.80	1.00	200	100	80	0	220	ACT
\.


--
-- TOC entry 5047 (class 0 OID 25252)
-- Dependencies: 218
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedores (id_proveedor, prv_nombre, prv_ruc_ced, prv_telefono, prv_mail, id_ciudad, prv_celular, prv_direccion, estado_prv) FROM stdin;
PRV001 	Distribuidora Alimentos Quito           	1790010010001	022345678 	alimentosquito@proveedores.com                              	UIO	0991234567	Av. Amazonas y Naciones Unidas                              	ACT
PRV002 	Aceites Guayaquil S.A.                  	0990020020002	042345678 	aceitesgye@proveedores.com                                  	GYE	0992345678	Cdla. Los Ceibos                                            	ACT
PRV003 	Lácteos Cuenca                          	0190030030003	072345678 	lacteoscuenca@proveedores.com                               	CUE	0993456789	Av. Remigio Crespo                                          	ACT
PRV004 	Carnes del Valle                        	1790040040004	023456789 	carnesvalle@proveedores.com                                 	SCO	0994567890	Av. Chone y Caracas                                         	ACT
PRV005 	Frutas y Verduras Machala               	0790050050005	072345679 	frutasmachala@proveedores.com                               	MCH	0995678901	Av. Rocafuerte y Bolívar                                    	ACT
PRV006 	Harinas Durán                           	0990060060006	042345679 	harinasduran@proveedores.com                                	DUR	0996789012	Av. Samborondón y Los Ángeles                               	ACT
PRV007 	Pescados Portoviejo                     	1390070070007	052345679 	pescadosportoviejo@proveedores.com                          	PFO	0997890123	Calle Rocafuerte y García Moreno                            	ACT
PRV008 	Quesos Loja                             	1190080080008	072345680 	quesosloja@proveedores.com                                  	LOJ	0998901234	Av. Universitaria y 18 de Noviembre                         	ACT
PRV009 	Cereales Ambato                         	1790090090009	032345680 	cerealesambato@proveedores.com                              	AMB	0999012345	Av. Cevallos y Quito                                        	ACT
PRV010 	Mariscos Manta                          	1390100100010	052345680 	mariscosmanta@proveedores.com                               	MIL	0990123456	Calle 13 y Flavio Reyes                                     	ACT
PRV011 	Condimentos Ibarra                      	1090110110011	062345681 	condimentosibarra@proveedores.com                           	IBR	0991234501	Av. El Retorno y Bolívar                                    	ACT
PRV012 	Pastas Riobamba                         	1690120120012	032345681 	pastasriobamba@proveedores.com                              	RIE	0992345012	Av. Daniel León Borja y Velasco                             	ACT
PRV013 	Embutidos Latacunga                     	1790130130013	032345682 	embutidoslatacunga@proveedores.com                          	LAT	0993456023	Av. Simón Bolívar y Quito                                   	ACT
PRV014 	Galletas Quevedo                        	1290140140014	052345682 	galletasquevedo@proveedores.com                             	QUE	0994567034	Av. Quito y Bolívar                                         	ACT
PRV015 	Bebidas Esmeraldas                      	0890150150015	062345682 	bebidasesmeraldas@proveedores.com                           	ESM	0995678045	Av. Malecón y Colón                                         	ACT
PRV016 	Helados La Libertad                     	0890160160016	042345683 	heladoslalibertad@proveedores.com                           	LIB	0996789056	Av. 9 de Octubre y Colón                                    	ACT
PRV017 	Confites Salinas                        	0890170170017	042345683 	confitessalinas@proveedores.com                             	SAL	0997890067	Av. Principal y Malecón                                     	ACT
PRV018 	Verduras Tulcán                         	0490180180018	062345684 	verdurastulcan@proveedores.com                              	TUL	0998901078	Av. Cotopaxi y Maldonado                                    	ACT
PRV019 	Frutas Zamora                           	1190190190019	072345684 	frutaszamora@proveedores.com                                	ZAM	0999012089	Av. Amazonía y Napo                                         	ACT
PRV020 	Granos Otavalo                          	1090200200020	062345685 	granosotavalo@proveedores.com                               	OER	0990123098	Av. Sucre y Bolívar                                         	ACT
PRV021 	Cárnicos Quito                          	1790210210021	022345689 	carnicosquito@proveedores.com                               	UIO	0991122334	Av. Eloy Alfaro y 6 de Diciembre                            	ACT
PRV022 	Aceites del Pacífico                    	0990220220022	042345689 	aceitespacifico@proveedores.com                             	GYE	0992233445	Cdla. Urdesa Norte                                          	ACT
PRV023 	Lácteos Cuenca Premium                  	0190230230023	072345689 	lacteospremium@proveedores.com                              	CUE	0993344556	Av. Solano y Remigio Tamariz                                	ACT
PRV024 	Panaderías del Valle                    	1790240240024	023456799 	panaderiasvalle@proveedores.com                             	SCO	0994455667	Av. Quito y Guayaquil                                       	ACT
PRV025 	Vegetales del Sur                       	0790250250025	072345799 	vegetalesdelsur@proveedores.com                             	MCH	0995566778	Av. Bolívar y Rocafuerte                                    	ACT
PRV026 	Harinas Selectas Durán                  	0990260260026	042345799 	harinasselectas@proveedores.com                             	DUR	0996677889	Av. Durán y Samborondón                                     	ACT
PRV027 	Mariscos Frescos Portoviejo             	1390270270027	052345799 	mariscosportoviejo@proveedores.com                          	PFO	0997788990	Av. Manabí y Eloy Alfaro                                    	ACT
PRV028 	Queserías Loja                          	1190280280028	072345800 	queseriasloja@proveedores.com                               	LOJ	0998899001	Av. 8 de Diciembre y Bolívar                                	ACT
PRV029 	Cereales Ambato Plus                    	1790290290029	032345800 	cerealesplus@proveedores.com                                	AMB	0999900112	Av. Cevallos y Martínez                                     	ACT
PRV030 	Pescados y Mariscos Manta               	1390300300030	052345800 	pescadosmariscosmanta@proveedores.com                       	MIL	0990011223	Calle Tarqui y Eloy Alfaro                                  	ACT
PRV031 	Especias del Norte                      	1090310310031	062345801 	especiasdelnorte@proveedores.com                            	IBR	0991122335	Av. Bolívar y Pedro Moncayo                                 	ACT
PRV032 	Pastas Riobamba Gourmet                 	1690320320032	032345801 	pastasgourmet@proveedores.com                               	RIE	0992233446	Av. León Borja y Bolívar                                    	ACT
PRV033 	Chocolates Latacunga                    	1790330330033	032345802 	chocolateslatacunga@proveedores.com                         	LAT	0993344557	Av. Amazonas y Quito                                        	ACT
PRV034 	Galletas de Oro Quevedo                 	1290340340034	052345802 	galletasoro@proveedores.com                                 	QUE	0994455668	Av. Bolívar y Pichincha                                     	ACT
PRV035 	Bebidas Tropicales Esmeraldas           	0890350350035	062345802 	bebidastropicales@proveedores.com                           	ESM	0995566779	Av. Colón y Malecón                                         	ACT
PRV036 	Helados Artesanales La Libertad         	0890360360036	042345803 	heladosartesanales@proveedores.com                          	LIB	0996677890	Av. 24 de Mayo y Colón                                      	ACT
PRV037 	Confitería Salinas                      	0890370370037	042345803 	confiteriasalinas@proveedores.com                           	SAL	0997788901	Av. Principal y Los Esteros                                 	ACT
PRV038 	Verduras de Altura Tulcán               	0490380380038	062345804 	verdurastulcan@proveedores.com                              	TUL	0998899012	Av. Sucre y Bolívar                                         	ACT
PRV039 	Frutas del Oriente Zamora               	1190390390039	072345804 	frutasoriente@proveedores.com                               	ZAM	0999900123	Av. Amazonía y Loja                                         	ACT
PRV040 	Granos y Semillas Otavalo               	1090400400040	062345805 	granossemillas@proveedores.com                              	OER	0990011234	Av. Sucre y Maldonado                                       	ACT
\.


--
-- TOC entry 5056 (class 0 OID 25342)
-- Dependencies: 227
-- Data for Name: proxaju; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proxaju (id_ajuste, id_producto, pxa_cantidad, pxa_qty_ajustada, estado_pxa) FROM stdin;
AJU003 	P011   	5	0	ACT
AJU003 	P012   	10	0	ACT
AJU003 	P013   	7	0	ACT
AJU004 	P014   	4	0	ACT
AJU004 	P015   	8	0	ACT
AJU004 	P016   	6	0	ACT
AJU005 	P017   	12	0	ACT
AJU005 	P018   	9	0	ACT
AJU005 	P019   	5	0	ACT
AJU006 	P020   	7	0	ACT
AJU006 	P021   	10	0	ACT
AJU006 	P022   	6	0	ACT
AJU007 	P023   	8	0	ACT
AJU007 	P024   	9	0	ACT
AJU007 	P025   	11	0	ACT
AJU008 	P026   	5	0	ACT
AJU008 	P027   	13	0	ACT
AJU008 	P028   	7	0	ACT
AJU009 	P029   	6	0	ACT
AJU009 	P030   	8	0	ACT
AJU009 	P001   	10	0	ACT
\.


--
-- TOC entry 5058 (class 0 OID 25362)
-- Dependencies: 229
-- Data for Name: proxent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proxent (id_entrega, id_producto, pxe_cantidad, pxe_qty_entregada, estado_pxe) FROM stdin;
\.


--
-- TOC entry 5060 (class 0 OID 25387)
-- Dependencies: 231
-- Data for Name: proxfac; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proxfac (id_factura, id_producto, pxf_cantidad, pxf_valor, estado_pxf) FROM stdin;
FAC006 	P011   	5	3.20	ACT
FAC006 	P012   	8	2.50	ACT
FAC006 	P013   	3	4.00	ACT
FAC006 	P014   	6	1.50	ACT
FAC007 	P015   	7	2.00	ACT
FAC007 	P016   	10	1.80	ACT
FAC007 	P017   	4	3.50	ACT
FAC007 	P018   	12	0.90	ACT
FAC008 	P019   	6	1.20	ACT
FAC008 	P020   	9	2.30	ACT
FAC008 	P021   	3	1.50	ACT
FAC008 	P022   	8	2.80	ACT
FAC009 	P023   	5	3.00	ACT
FAC009 	P024   	7	1.70	ACT
FAC009 	P025   	2	5.00	ACT
FAC009 	P026   	10	1.10	ACT
FAC010 	P027   	8	0.80	ACT
FAC010 	P028   	6	1.20	ACT
FAC010 	P029   	4	3.50	ACT
FAC010 	P030   	10	2.00	ACT
FAC011 	P031   	6	1.80	ACT
FAC011 	P032   	10	2.50	ACT
FAC011 	P033   	4	3.20	ACT
FAC011 	P034   	7	1.20	ACT
FAC012 	P035   	8	1.50	ACT
FAC012 	P036   	5	2.00	ACT
FAC012 	P037   	9	1.10	ACT
FAC012 	P038   	12	2.80	ACT
FAC013 	P039   	6	3.00	ACT
FAC013 	P040   	8	1.70	ACT
FAC013 	P001   	4	2.00	ACT
FAC013 	P002   	7	1.50	ACT
FAC014 	P003   	10	1.20	ACT
FAC014 	P004   	6	3.50	ACT
FAC014 	P005   	5	0.80	ACT
FAC014 	P006   	8	1.30	ACT
FAC015 	P007   	9	2.00	ACT
FAC015 	P008   	7	1.80	ACT
FAC015 	P009   	6	1.10	ACT
FAC015 	P010   	4	2.50	ACT
\.


--
-- TOC entry 5052 (class 0 OID 25302)
-- Dependencies: 223
-- Data for Name: proxoc; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proxoc (id_compra, id_producto, pxo_cantidad, pxo_valor, estado_pxoc) FROM stdin;
CMP001 	P001   	10	1.20	ACT
CMP001 	P002   	15	2.50	ACT
CMP001 	P003   	20	1.10	ACT
CMP001 	P004   	8	3.50	ACT
CMP002 	P005   	25	0.80	ACT
CMP002 	P006   	18	1.30	ACT
CMP002 	P007   	12	2.00	ACT
CMP002 	P008   	30	0.50	ACT
CMP003 	P009   	20	1.00	ACT
CMP003 	P010   	15	2.80	ACT
CMP003 	P011   	50	0.40	ACT
CMP003 	P012   	40	2.00	ACT
CMP004 	P013   	10	3.00	ACT
CMP004 	P014   	5	3.20	ACT
CMP004 	P015   	25	1.00	ACT
CMP004 	P016   	20	2.20	ACT
CMP005 	P017   	15	1.50	ACT
CMP005 	P018   	20	1.00	ACT
CMP005 	P019   	30	0.30	ACT
CMP005 	P020   	10	2.50	ACT
CMP006 	P021   	12	5.00	ACT
CMP006 	P022   	20	3.50	ACT
CMP006 	P023   	10	4.50	ACT
CMP006 	P024   	8	3.20	ACT
CMP007 	P025   	15	4.00	ACT
CMP007 	P026   	25	1.50	ACT
CMP007 	P027   	30	0.80	ACT
CMP007 	P028   	12	1.20	ACT
CMP008 	P029   	18	2.80	ACT
CMP008 	P030   	20	1.80	ACT
CMP008 	P031   	10	1.50	ACT
CMP008 	P032   	16	3.00	ACT
CMP009 	P033   	10	2.20	ACT
CMP009 	P034   	15	1.50	ACT
CMP009 	P035   	20	1.00	ACT
CMP009 	P036   	12	1.20	ACT
CMP010 	P037   	15	1.80	ACT
CMP010 	P038   	30	0.90	ACT
CMP010 	P039   	20	0.70	ACT
CMP010 	P040   	10	1.50	ACT
\.


--
-- TOC entry 5054 (class 0 OID 25322)
-- Dependencies: 225
-- Data for Name: proxrec; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proxrec (id_recibo, id_producto, pxr_cantidad, pxr_qty_recibida, estado_pxr) FROM stdin;
\.


--
-- TOC entry 5053 (class 0 OID 25317)
-- Dependencies: 224
-- Data for Name: recepciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recepciones (id_recibo, user_id, rec_descripcion, rec_fechahora, rec_num_produc, estado_rec) FROM stdin;
\.


--
-- TOC entry 5066 (class 0 OID 25443)
-- Dependencies: 237
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id_rol, rol_descripcion, estado_rol) FROM stdin;
C-ANALI	Analista de Compras                     	\N
C-COORD	Coordinador de Compras                  	\N
C-PROVE	Especialista en Proveedores             	\N
C-PLANI	Planificador de Inventario              	\N
B-SUPER	Supervisor de Almacén                   	\N
B-OPERA	Operador de Almacén                     	\N
B-COORD	Coordinador de Logística                	\N
B-ENCAR	Encargado de Inventarios                	\N
B-AUXIL	Auxiliar de Bodega                      	\N
V-REPRE	Representante de Ventas                 	\N
V-EJECU	Ejecutivo de Cuenta                     	\N
V-ASESO	Asesor Comercial                        	\N
V-COORD	Coordinador de Ventas                   	\N
V-ANALI	Analista de Ventas                      	\N
T-RECLU	Reclutador                              	\N
T-ESPEC	Especialista en Desarrollo              	\N
T-GENER	Generalista de Recursos Humanos         	\N
T-COORD	Coordinador de Bienestar                	\N
T-NOMIN	Analista de Compensaciones y Beneficios 	\N
CG-CONT	Contador General                        	\N
CG-AUXI	Auxiliar Contable                       	\N
S-CEO  	CEO Tecnologías Sistemas                	\N
S-GER  	Gerente de Sistemas                     	\N
S-DBA  	DBA Data Base Administrator             	\N
S-AUX  	Auxiliar de Sistemas                    	\N
S-DES  	Desarrollador de Sistemas               	\N
S-PGM  	Programador de Sistemas                 	\N
\.


--
-- TOC entry 5061 (class 0 OID 25402)
-- Dependencies: 232
-- Data for Name: tipo_cuenta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_cuenta (id_tipo_cta, tip_descripcion) FROM stdin;
MAY	Mayor  
DET	Detalle
\.


--
-- TOC entry 5049 (class 0 OID 25272)
-- Dependencies: 220
-- Data for Name: unidades_medidas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.unidades_medidas (id_unidad_medida, um_descripcion) FROM stdin;
UND	Unidad              
KG 	Kilogramo           
GR 	Gramo               
LT 	Litro               
ML 	Mililitro           
CM 	Centímetro          
M  	Metro               
MM 	Milímetro           
IN 	Pulgada             
FT 	Pie                 
GL 	Galón               
LB 	Libra               
OZ 	Onza                
PK 	Paquete             
CJ 	Caja                
ROL	Rollo               
PAR	Par                 
DZA	Docena              
CJA	Caja Grande         
BLL	Botella             
\.


--
-- TOC entry 5081 (class 0 OID 0)
-- Dependencies: 246
-- Name: seq_id_empleado; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seq_id_empleado', 153, true);


--
-- TOC entry 4827 (class 2606 OID 25341)
-- Name: ajustes ajustes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ajustes
    ADD CONSTRAINT ajustes_pkey PRIMARY KEY (id_ajuste);


--
-- TOC entry 4843 (class 2606 OID 25421)
-- Name: asientos asientos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asientos
    ADD CONSTRAINT asientos_pkey PRIMARY KEY (id_asiento);


--
-- TOC entry 4863 (class 2606 OID 25501)
-- Name: bonificaciones bonificaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bonificaciones
    ADD CONSTRAINT bonificaciones_pkey PRIMARY KEY (id_bonificacion);


--
-- TOC entry 4865 (class 2606 OID 25506)
-- Name: bonxempxpag bonxempxpag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bonxempxpag
    ADD CONSTRAINT bonxempxpag_pkey PRIMARY KEY (id_bonificacion, id_empleado, id_pago);


--
-- TOC entry 4855 (class 2606 OID 25471)
-- Name: cargas cargas_car_cedula_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cargas
    ADD CONSTRAINT cargas_car_cedula_key UNIQUE (car_cedula);


--
-- TOC entry 4857 (class 2606 OID 25469)
-- Name: cargas cargas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cargas
    ADD CONSTRAINT cargas_pkey PRIMARY KEY (id_carga);


--
-- TOC entry 4809 (class 2606 OID 25251)
-- Name: ciudades ciudades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudades
    ADD CONSTRAINT ciudades_pkey PRIMARY KEY (id_ciudad);


--
-- TOC entry 4813 (class 2606 OID 25266)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 4819 (class 2606 OID 25296)
-- Name: compras compras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_pkey PRIMARY KEY (id_compra);


--
-- TOC entry 4845 (class 2606 OID 25426)
-- Name: ctaxasi ctaxasi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ctaxasi
    ADD CONSTRAINT ctaxasi_pkey PRIMARY KEY (id_asiento, id_cuenta);


--
-- TOC entry 4841 (class 2606 OID 25411)
-- Name: cuentas cuentas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas
    ADD CONSTRAINT cuentas_pkey PRIMARY KEY (id_cuenta);


--
-- TOC entry 4847 (class 2606 OID 25442)
-- Name: departamentos departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (id_departamento);


--
-- TOC entry 4867 (class 2606 OID 25526)
-- Name: descuentos descuentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.descuentos
    ADD CONSTRAINT descuentos_pkey PRIMARY KEY (id_descuento);


--
-- TOC entry 4869 (class 2606 OID 25531)
-- Name: desxempxpag desxempxpag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desxempxpag
    ADD CONSTRAINT desxempxpag_pkey PRIMARY KEY (id_descuento, id_empleado, id_pago);


--
-- TOC entry 4851 (class 2606 OID 25454)
-- Name: empleados empleados_emp_cedula_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_emp_cedula_key UNIQUE (emp_cedula);


--
-- TOC entry 4853 (class 2606 OID 25452)
-- Name: empleados empleados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (id_empleado);


--
-- TOC entry 4831 (class 2606 OID 25361)
-- Name: entregas entregas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entregas
    ADD CONSTRAINT entregas_pkey PRIMARY KEY (id_entrega);


--
-- TOC entry 4835 (class 2606 OID 25381)
-- Name: facturas facturas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT facturas_pkey PRIMARY KEY (id_factura);


--
-- TOC entry 4859 (class 2606 OID 25481)
-- Name: pagos pagos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_pkey PRIMARY KEY (id_pago);


--
-- TOC entry 4861 (class 2606 OID 25486)
-- Name: pagxemp pagxemp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagxemp
    ADD CONSTRAINT pagxemp_pkey PRIMARY KEY (id_pago, id_empleado);


--
-- TOC entry 4817 (class 2606 OID 25281)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id_producto);


--
-- TOC entry 4811 (class 2606 OID 25256)
-- Name: proveedores proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id_proveedor);


--
-- TOC entry 4829 (class 2606 OID 25346)
-- Name: proxaju proxaju_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proxaju
    ADD CONSTRAINT proxaju_pkey PRIMARY KEY (id_ajuste, id_producto);


--
-- TOC entry 4833 (class 2606 OID 25366)
-- Name: proxent proxent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proxent
    ADD CONSTRAINT proxent_pkey PRIMARY KEY (id_entrega, id_producto);


--
-- TOC entry 4837 (class 2606 OID 25391)
-- Name: proxfac proxfac_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proxfac
    ADD CONSTRAINT proxfac_pkey PRIMARY KEY (id_factura, id_producto);


--
-- TOC entry 4821 (class 2606 OID 25306)
-- Name: proxoc proxoc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proxoc
    ADD CONSTRAINT proxoc_pkey PRIMARY KEY (id_compra, id_producto);


--
-- TOC entry 4825 (class 2606 OID 25326)
-- Name: proxrec proxrec_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proxrec
    ADD CONSTRAINT proxrec_pkey PRIMARY KEY (id_recibo, id_producto);


--
-- TOC entry 4823 (class 2606 OID 25321)
-- Name: recepciones recepciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recepciones
    ADD CONSTRAINT recepciones_pkey PRIMARY KEY (id_recibo);


--
-- TOC entry 4849 (class 2606 OID 25447)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id_rol);


--
-- TOC entry 4839 (class 2606 OID 25406)
-- Name: tipo_cuenta tipo_cuenta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_cuenta
    ADD CONSTRAINT tipo_cuenta_pkey PRIMARY KEY (id_tipo_cta);


--
-- TOC entry 4815 (class 2606 OID 25276)
-- Name: unidades_medidas unidades_medidas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidades_medidas
    ADD CONSTRAINT unidades_medidas_pkey PRIMARY KEY (id_unidad_medida);


--
-- TOC entry 4900 (class 2620 OID 25550)
-- Name: empleados trigger_generar_id_empleado; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trigger_generar_id_empleado BEFORE INSERT ON public.empleados FOR EACH ROW WHEN ((new.id_empleado IS NULL)) EXECUTE FUNCTION public.generar_id_empleado();


--
-- TOC entry 4894 (class 2606 OID 25507)
-- Name: bonxempxpag bonxempxpag_id_bonificacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bonxempxpag
    ADD CONSTRAINT bonxempxpag_id_bonificacion_fkey FOREIGN KEY (id_bonificacion) REFERENCES public.bonificaciones(id_bonificacion);


--
-- TOC entry 4895 (class 2606 OID 25512)
-- Name: bonxempxpag bonxempxpag_id_empleado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bonxempxpag
    ADD CONSTRAINT bonxempxpag_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES public.empleados(id_empleado);


--
-- TOC entry 4896 (class 2606 OID 25517)
-- Name: bonxempxpag bonxempxpag_id_pago_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bonxempxpag
    ADD CONSTRAINT bonxempxpag_id_pago_fkey FOREIGN KEY (id_pago) REFERENCES public.pagos(id_pago);


--
-- TOC entry 4891 (class 2606 OID 25472)
-- Name: cargas cargas_id_empleado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cargas
    ADD CONSTRAINT cargas_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES public.empleados(id_empleado);


--
-- TOC entry 4871 (class 2606 OID 25267)
-- Name: clientes clientes_id_ciudad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_id_ciudad_fkey FOREIGN KEY (id_ciudad) REFERENCES public.ciudades(id_ciudad);


--
-- TOC entry 4874 (class 2606 OID 25297)
-- Name: compras compras_id_proveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_id_proveedor_fkey FOREIGN KEY (id_proveedor) REFERENCES public.proveedores(id_proveedor);


--
-- TOC entry 4887 (class 2606 OID 25427)
-- Name: ctaxasi ctaxasi_id_asiento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ctaxasi
    ADD CONSTRAINT ctaxasi_id_asiento_fkey FOREIGN KEY (id_asiento) REFERENCES public.asientos(id_asiento);


--
-- TOC entry 4888 (class 2606 OID 25432)
-- Name: ctaxasi ctaxasi_id_cuenta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ctaxasi
    ADD CONSTRAINT ctaxasi_id_cuenta_fkey FOREIGN KEY (id_cuenta) REFERENCES public.cuentas(id_cuenta);


--
-- TOC entry 4886 (class 2606 OID 25412)
-- Name: cuentas cuentas_cue_tipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cuentas
    ADD CONSTRAINT cuentas_cue_tipo_fkey FOREIGN KEY (cue_tipo) REFERENCES public.tipo_cuenta(id_tipo_cta);


--
-- TOC entry 4897 (class 2606 OID 25532)
-- Name: desxempxpag desxempxpag_id_descuento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desxempxpag
    ADD CONSTRAINT desxempxpag_id_descuento_fkey FOREIGN KEY (id_descuento) REFERENCES public.descuentos(id_descuento);


--
-- TOC entry 4898 (class 2606 OID 25537)
-- Name: desxempxpag desxempxpag_id_empleado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desxempxpag
    ADD CONSTRAINT desxempxpag_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES public.empleados(id_empleado);


--
-- TOC entry 4899 (class 2606 OID 25542)
-- Name: desxempxpag desxempxpag_id_pago_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desxempxpag
    ADD CONSTRAINT desxempxpag_id_pago_fkey FOREIGN KEY (id_pago) REFERENCES public.pagos(id_pago);


--
-- TOC entry 4889 (class 2606 OID 25455)
-- Name: empleados empleados_id_departamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_id_departamento_fkey FOREIGN KEY (id_departamento) REFERENCES public.departamentos(id_departamento);


--
-- TOC entry 4890 (class 2606 OID 25460)
-- Name: empleados empleados_id_rol_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_id_rol_fkey FOREIGN KEY (id_rol) REFERENCES public.roles(id_rol);


--
-- TOC entry 4883 (class 2606 OID 25382)
-- Name: facturas facturas_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facturas
    ADD CONSTRAINT facturas_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente);


--
-- TOC entry 4892 (class 2606 OID 25492)
-- Name: pagxemp pagxemp_id_empleado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagxemp
    ADD CONSTRAINT pagxemp_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES public.empleados(id_empleado);


--
-- TOC entry 4893 (class 2606 OID 25487)
-- Name: pagxemp pagxemp_id_pago_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pagxemp
    ADD CONSTRAINT pagxemp_id_pago_fkey FOREIGN KEY (id_pago) REFERENCES public.pagos(id_pago);


--
-- TOC entry 4872 (class 2606 OID 25282)
-- Name: productos productos_pro_um_compra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pro_um_compra_fkey FOREIGN KEY (pro_um_compra) REFERENCES public.unidades_medidas(id_unidad_medida);


--
-- TOC entry 4873 (class 2606 OID 25287)
-- Name: productos productos_pro_um_venta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pro_um_venta_fkey FOREIGN KEY (pro_um_venta) REFERENCES public.unidades_medidas(id_unidad_medida);


--
-- TOC entry 4870 (class 2606 OID 25257)
-- Name: proveedores proveedores_id_ciudad_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_id_ciudad_fkey FOREIGN KEY (id_ciudad) REFERENCES public.ciudades(id_ciudad);


--
-- TOC entry 4879 (class 2606 OID 25347)
-- Name: proxaju proxaju_id_ajuste_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proxaju
    ADD CONSTRAINT proxaju_id_ajuste_fkey FOREIGN KEY (id_ajuste) REFERENCES public.ajustes(id_ajuste);


--
-- TOC entry 4880 (class 2606 OID 25352)
-- Name: proxaju proxaju_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proxaju
    ADD CONSTRAINT proxaju_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto);


--
-- TOC entry 4881 (class 2606 OID 25367)
-- Name: proxent proxent_id_entrega_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proxent
    ADD CONSTRAINT proxent_id_entrega_fkey FOREIGN KEY (id_entrega) REFERENCES public.entregas(id_entrega);


--
-- TOC entry 4882 (class 2606 OID 25372)
-- Name: proxent proxent_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proxent
    ADD CONSTRAINT proxent_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto);


--
-- TOC entry 4884 (class 2606 OID 25392)
-- Name: proxfac proxfac_id_factura_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proxfac
    ADD CONSTRAINT proxfac_id_factura_fkey FOREIGN KEY (id_factura) REFERENCES public.facturas(id_factura);


--
-- TOC entry 4885 (class 2606 OID 25397)
-- Name: proxfac proxfac_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proxfac
    ADD CONSTRAINT proxfac_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto);


--
-- TOC entry 4875 (class 2606 OID 25307)
-- Name: proxoc proxoc_id_compra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proxoc
    ADD CONSTRAINT proxoc_id_compra_fkey FOREIGN KEY (id_compra) REFERENCES public.compras(id_compra);


--
-- TOC entry 4876 (class 2606 OID 25312)
-- Name: proxoc proxoc_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proxoc
    ADD CONSTRAINT proxoc_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto);


--
-- TOC entry 4877 (class 2606 OID 25332)
-- Name: proxrec proxrec_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proxrec
    ADD CONSTRAINT proxrec_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto);


--
-- TOC entry 4878 (class 2606 OID 25327)
-- Name: proxrec proxrec_id_recibo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proxrec
    ADD CONSTRAINT proxrec_id_recibo_fkey FOREIGN KEY (id_recibo) REFERENCES public.recepciones(id_recibo);


-- Completed on 2025-06-10 18:59:42

--
-- PostgreSQL database dump complete
--

