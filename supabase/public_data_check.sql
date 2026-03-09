SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict WEG1w2gMb1g7OuvGpMZGzIRMzeF0XCvumf3juOYa9yICIAX0ZtixsuTt4SM39n2

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

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
-- Data for Name: account_deletion_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."account_deletion_requests" ("id", "email", "requested_at", "status", "processed_at", "processed_by", "notes", "user_id", "request_type", "requested_via", "execute_after", "canceled_at", "completed_at", "confirmation", "error_message") FROM stdin;
af543e25-baf0-4741-bd11-7b45c15c68ac	dev.ventogroup@gmail.com	2026-02-13 13:57:18.818+00	completed	\N	\N	\N	\N	full_account	in_app	2026-02-13 13:57:18.818+00	\N	2026-02-13 13:57:18.818+00	{"otp_verified": true, "phrase_verified": true, "immediate_execution": true}	\N
5ac16ec9-2408-4174-b860-0be247e0e22b	dev.ventogroup@gmail.com	2026-02-13 13:50:47.281+00	completed	\N	\N	\N	\N	data_cleanup	in_app	\N	\N	2026-02-13 13:50:47.281+00	{"source": "user_request"}	\N
d3f64bd0-e835-4c4f-9672-7d58b1bbe69e	dev.ventogroup@gmail.com	2026-02-11 16:18:55.197+00	pending	\N	\N	\N	\N	full_account	in_app	2026-03-13 16:18:55.197+00	\N	\N	{"otp_verified": true, "phrase_verified": true}	\N
d12ae9a0-6403-434c-aa9b-d8f0f83fe979	test@ventogroup.com	2026-02-25 17:02:20.807+00	completed	\N	\N	\N	3456e710-6211-42bf-9632-3aefa8eefa32	data_cleanup	in_app	\N	\N	2026-02-25 17:02:20.807+00	{"source": "user_request"}	\N
\.


--
-- Data for Name: announcements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."announcements" ("id", "title", "body", "tag", "published_at", "is_active", "display_order", "created_by", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: app_content_blocks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."app_content_blocks" ("id", "app_key", "screen_key", "section_key", "locale", "payload", "sort_order", "is_enabled", "created_at", "updated_at") FROM stdin;
bc0feef2-eca5-495c-867e-5696f7389980	vento_pass	home	club_entry	es-CO	{"tag": "BETA PRIVADA", "title": "Vento Club", "description": "Activa tu membresia premium y gana cashback booster sobre tus compras."}	10	t	2026-03-07 14:41:33.896861+00	2026-03-07 14:41:33.896861+00
dd1be1f5-d607-4161-919b-09fa589a2f21	vento_pass	home	primary_cta	es-CO	{"label": "Escanear ID"}	20	t	2026-03-07 14:41:33.896861+00	2026-03-07 14:41:33.896861+00
3f6fab8e-c89f-44f0-970e-da5bc294f502	vento_pass	home	secondary_cta	es-CO	{"label": "Mis pedidos"}	30	t	2026-03-07 14:41:33.896861+00	2026-03-07 14:41:33.896861+00
d9774614-e406-48bf-a5cc-e3114b7625f9	vento_pass	home	sections	es-CO	{"experiences_title": "Experiencias"}	40	t	2026-03-07 14:41:33.896861+00	2026-03-07 14:41:33.896861+00
f34a69fd-5553-4aba-83e4-3795463e3e0a	vento_pass	my_orders	header	es-CO	{"title": "Mis pedidos", "eyebrow": "PEDIDOS", "subtitle": "Aqui veras el estado de tus compras y, cuando aplique, el avance del domicilio."}	10	t	2026-03-07 14:41:33.896861+00	2026-03-07 14:41:33.896861+00
5436d2f5-2bce-41e7-9fa9-3e332b682efe	vento_pass	my_orders	hero	es-CO	{"title": "Pedidos y domicilios", "description": "Esta base ya queda lista para pickup y delivery manual o semimanual desde la misma app."}	20	t	2026-03-07 14:41:33.896861+00	2026-03-07 14:41:33.896861+00
6164a327-a59f-4894-aa1a-f9f39b8f7b43	vento_pass	my_orders	empty_state	es-CO	{"title": "Todavia no tienes pedidos", "description": "Cuando activemos el checkout de compras, aqui apareceran tus pedidos de pickup y domicilio."}	30	t	2026-03-07 14:41:33.896861+00	2026-03-07 14:41:33.896861+00
9f1eaf2f-6f4c-4ad2-9afe-a2681e5a395e	vento_pass	my_orders	status_catalog	es-CO	{"pending": {"label": "Pendiente"}, "cancelled": {"label": "Cancelado"}, "confirmed": {"label": "Confirmado"}, "delivered": {"label": "Entregado"}, "preparing": {"label": "Preparando"}, "on_the_way": {"label": "En camino"}, "ready_for_dispatch": {"label": "Listo para despacho"}}	40	t	2026-03-07 14:41:33.896861+00	2026-03-07 14:41:33.896861+00
c117bd15-8d93-4843-b661-c439a81f4250	vento_pass	my_orders	fulfillment_catalog	es-CO	{"pickup": {"label": "Recoger"}, "delivery": {"label": "Domicilio"}, "on_premise": {"label": "En sitio"}}	50	t	2026-03-07 14:41:33.896861+00	2026-03-07 14:41:33.896861+00
\.


--
-- Data for Name: apps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."apps" ("id", "code", "name", "description", "is_active", "created_at", "updated_at") FROM stdin;
9016e5a7-af93-4e8b-ba37-5364cb15c626	shell	Vento OS	Hub y SSO	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
87627436-2888-47be-b08c-b77a2756ed76	nexo	NEXO	Inventario y logistica	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
416aefae-0d3d-43af-9869-8244f1dfa4b2	pass	Vento Pass	Fidelizacion	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
0d8985b9-48a2-4520-83b7-1c35910f0e1d	anima	ANIMA	Asistencia	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
d47df01e-a69a-4702-9fae-503571f11b91	fogo	FOGO	Produccion	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
dc240f88-d027-40aa-b8eb-60adfd2af9b9	pulso	PULSO	POS	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
512de8ee-75dd-416e-98da-f93153e90423	viso	VISO	Gerencia	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
49c30175-24a4-4cce-94d3-c3a955ee8fc8	origo	ORIGO	Compras	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
14f2aa5e-1b66-4fa0-b030-550771829578	aura	AURA	Marketing	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
\.


--
-- Data for Name: app_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."app_permissions" ("id", "app_id", "code", "name", "description", "is_active", "created_at", "updated_at") FROM stdin;
02f44bfe-0232-4104-9c94-c62fff4c0c07	9016e5a7-af93-4e8b-ba37-5364cb15c626	access	Access	Acceso base a la app	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
d4aca4fa-da1a-4087-a26c-e550d9686c09	87627436-2888-47be-b08c-b77a2756ed76	access	Access	Acceso base a la app	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
3c9feb20-7cee-439b-95bb-e67447e2237b	416aefae-0d3d-43af-9869-8244f1dfa4b2	access	Access	Acceso base a la app	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
18cb2439-9f01-43a4-8293-2ab075277640	0d8985b9-48a2-4520-83b7-1c35910f0e1d	access	Access	Acceso base a la app	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
34c4e840-af96-43fc-8641-3fa640b97899	d47df01e-a69a-4702-9fae-503571f11b91	access	Access	Acceso base a la app	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
c2c71b44-2771-4778-b958-39f24ed2f3a6	dc240f88-d027-40aa-b8eb-60adfd2af9b9	access	Access	Acceso base a la app	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
87c8bdbd-816c-4c9f-8f61-4f59ec59c905	512de8ee-75dd-416e-98da-f93153e90423	access	Access	Acceso base a la app	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
3cb8509a-b18a-4d4c-b95e-34f14b9288b2	49c30175-24a4-4cce-94d3-c3a955ee8fc8	access	Access	Acceso base a la app	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
aeddf737-76b4-433f-92d6-593539dba600	14f2aa5e-1b66-4fa0-b030-550771829578	access	Access	Acceso base a la app	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
c12f12c3-ac0d-49d0-abe6-01a20f7cb3ac	87627436-2888-47be-b08c-b77a2756ed76	inventory.stock	Stock	Vista de stock por sede	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
22935557-ae7f-4c2e-aacb-aa0fa77c9080	87627436-2888-47be-b08c-b77a2756ed76	inventory.movements	Movimientos	Ledger de movimientos	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
ac739689-b0d0-46c4-8794-951ba8108ca2	87627436-2888-47be-b08c-b77a2756ed76	inventory.locations	LOCs	Ubicaciones de inventario	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
3bfd6c64-e166-47f5-8913-054bef399ae0	87627436-2888-47be-b08c-b77a2756ed76	inventory.lpns	LPNs	Contenedores LPN y contenido	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
2cbf4624-239b-4b3a-a7c4-8163fcdb544f	87627436-2888-47be-b08c-b77a2756ed76	inventory.counts	Conteos	Conteos y ajustes derivados	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
69be7320-2936-4a4b-a6db-f05f5d83097e	87627436-2888-47be-b08c-b77a2756ed76	inventory.adjustments	Ajustes	Ajustes manuales controlados	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
cea9689b-3362-4ff4-9db1-821790df6d20	87627436-2888-47be-b08c-b77a2756ed76	inventory.remissions	Remisiones	Solicitudes y remisiones internas	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
8086ddb7-950a-4f76-9a53-eaa5a4410c6e	d47df01e-a69a-4702-9fae-503571f11b91	production.recipes	Recetas	Consulta de recetas	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
25da0a2f-0b8b-46f5-b744-c83f9ce3e8c5	d47df01e-a69a-4702-9fae-503571f11b91	production.orders	Ordenes	Ordenes de produccion	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
20ff1032-e248-4ed3-b033-e4b7bb97b4b4	dc240f88-d027-40aa-b8eb-60adfd2af9b9	pos.main	POS	Operacion de punto de venta	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
467e3dd4-053f-4aac-b61a-9ee5e6481b5f	87627436-2888-47be-b08c-b77a2756ed76	inventory.production_batches	Produccion manual	Lotes de produccion manual	t	2026-01-18 23:41:51.223018+00	2026-01-18 23:41:51.223018+00
16d64dc1-84e5-4365-b810-2a0e1a2ef741	87627436-2888-47be-b08c-b77a2756ed76	inventory.remissions.request	Remisiones - Solicitar	Solicitar remisiones desde sedes satelite	t	2026-01-19 01:19:02.457958+00	2026-01-19 01:19:02.457958+00
65e35395-ad98-4ce4-9aa2-37d166660e7f	87627436-2888-47be-b08c-b77a2756ed76	inventory.remissions.prepare	Remisiones - Preparar	Preparar remisiones en centros de produccion	t	2026-01-19 01:19:02.457958+00	2026-01-19 01:19:02.457958+00
c4db24a3-f071-4c5c-a160-a5b87628ffb0	87627436-2888-47be-b08c-b77a2756ed76	inventory.remissions.receive	Remisiones - Recibir	Recibir remisiones en sedes satelite	t	2026-01-19 01:19:02.457958+00	2026-01-19 01:19:02.457958+00
c0a569d6-6ccd-4089-a4df-198ca1172a81	87627436-2888-47be-b08c-b77a2756ed76	inventory.remissions.cancel	Remisiones - Cancelar	Cancelar solicitudes de remision	t	2026-01-19 01:19:02.457958+00	2026-01-19 01:19:02.457958+00
68313f31-be99-4260-a2ff-679590c2f98e	87627436-2888-47be-b08c-b77a2756ed76	inventory.remissions.all_sites	Remisiones - Ver todas las sedes	Permite vista global de remisiones	t	2026-01-19 01:19:02.457958+00	2026-01-19 01:19:02.457958+00
47bcf8a0-a5dd-4b0b-9922-3ed4347a2780	87627436-2888-47be-b08c-b77a2756ed76	inventory.entries	Entradas	Recepcion de insumos	t	2026-01-31 20:51:15.881831+00	2026-01-31 20:51:15.881831+00
eaba19a5-c16e-4aaa-a8f7-e6c980d34241	87627436-2888-47be-b08c-b77a2756ed76	inventory.transfers	Traslados internos	Movimientos internos entre LOCs	t	2026-01-31 20:57:36.301032+00	2026-01-31 20:57:36.301032+00
fe9c6157-2a2f-4a2b-b4c1-0ba8f814ecf3	87627436-2888-47be-b08c-b77a2756ed76	inventory.withdraw	Retiros LOC	Registrar consumo desde ubicación (QR)	t	2026-02-09 21:10:26.7374+00	2026-02-09 21:10:26.7374+00
62e26f14-8437-4dfb-a0ec-58f621bc4cf8	49c30175-24a4-4cce-94d3-c3a955ee8fc8	procurement.receipts	Recepciones	Registrar recepciones con impacto en inventario	t	2026-02-19 13:40:42.93701+00	2026-02-19 13:40:42.93701+00
8b52f5f0-be2f-4669-ade8-f40c81cd0b4b	87627436-2888-47be-b08c-b77a2756ed76	inventory.entries_emergency	Entrada de emergencia	Recepcion excepcional desde NEXO	t	2026-02-19 13:40:42.93701+00	2026-02-19 13:40:42.93701+00
ee7e2c51-e5e6-4fa4-b104-915230b5deb2	d47df01e-a69a-4702-9fae-503571f11b91	production.batches	Lotes de produccion	Produccion y consumo automatico por receta	t	2026-02-19 13:40:42.93701+00	2026-02-19 13:40:42.93701+00
\.


--
-- Data for Name: app_update_policies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."app_update_policies" ("id", "app_key", "platform", "min_version", "latest_version", "force_update", "store_url", "title", "message", "is_enabled", "created_at", "updated_at") FROM stdin;
7d7a3908-2a4d-4e3a-aa1d-c5b1365b0fdf	vento_pass	ios	1.0.1	1.0.1	f	https://apps.apple.com/app/idXXXXXXXXXX	Actualización disponible	Hay una nueva versión disponible.	t	2026-02-26 21:07:23.869409+00	2026-02-26 21:07:23.869409+00
36637021-ca4c-4fd1-91ff-076d4d6696fe	vento_pass	android	1.0.1	1.0.1	f	https://play.google.com/store/apps/details?id=com.ventogroup.ventopass	Actualización disponible	Hay una nueva versión disponible.	t	2026-02-26 21:07:23.869409+00	2026-02-26 21:07:23.869409+00
0fc30dab-e5c1-4b21-b071-22a850d58d80	vento_anima_dev	ios	0.0.0	\N	f	\N	Build de desarrollo	Política de actualización desactivada para build dev.	f	2026-03-06 14:24:00.827427+00	2026-03-06 14:24:00.827427+00
48e7c7c8-17a0-4c0a-926d-004b5f5e7193	vento_anima_dev	android	0.0.0	\N	f	\N	Build de desarrollo	Política de actualización desactivada para build dev.	f	2026-03-06 14:24:00.827427+00	2026-03-06 14:24:00.827427+00
c2a9a920-5687-42a3-9a1f-6317d1e442a7	vento_anima	android	1.1.1	1.1.1	t	https://play.google.com/store/apps/details?id=com.vento.anima	Actualización obligatoria	Debes actualizar ANIMA para continuar.	t	2026-02-26 21:07:23.869409+00	2026-03-06 14:34:55.713252+00
f913effb-8323-488f-98f9-57d460746b4b	vento_anima	ios	1.1.1	1.1.1	t	https://apps.apple.com/app/idXXXXXXXXXX	Actualización obligatoria	Debes actualizar ANIMA para continuar.	t	2026-02-26 21:07:23.869409+00	2026-03-06 14:34:55.713252+00
\.


--
-- Data for Name: area_kinds; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."area_kinds" ("code", "name", "description", "is_active", "created_at", "updated_at") FROM stdin;
contabilidad	Contabilidad	Contabilidad y finanzas	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
panaderia	Panaderia	Panaderia	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
bar	Bar	Bar y bebidas	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
cocina_bar	Cocina Bar	Cocina de bar	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
caja	Caja	Caja	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
mostrador	Mostrador	Mostrador	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
general	General	Area generica	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
cocina	Cocina	Cocina	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
cocina_caliente	Cocina Caliente	Cocina caliente	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
liderazgo	Liderazgo	Liderazgo	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
logistica	Logistica	Logistica	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
gerencia	Gerencia	Gerencia	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
marketing	Marketing	Marketing	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
reposteria	Reposteria	Reposteria/Pasteleria	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
salon	Salon	Salon y servicio	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
bodega	Bodega	Bodega y almacenamiento	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
\.


--
-- Data for Name: sites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."sites" ("id", "code", "name", "type", "is_active", "created_at", "latitude", "longitude", "address", "site_type", "site_kind", "checkin_radius_meters", "is_public") FROM stdin;
e8823211-100a-49b9-bb55-bbff432de43c	APP-REVIEW	App Review (Demo)	vento_group	t	2026-02-06 15:13:37.088521+00	\N	\N	\N	admin	demo	\N	f
407ccca3-bc35-4252-8998-7280623de78f	CENTRO_PROD	Centro de Producción	centro_produccion	t	2025-12-02 23:42:22.027509+00	7.89175513	-72.48343788	Av. 3 #14 - 22, San Luis, Cúcuta, Norte de Santander	production_center	satellite	30	t
59de8039-239a-4791-a20c-c2e7fe2344d3	VENTO_GROUP	Vento Group	vento_group	t	2025-12-19 14:31:01.95329+00	\N	\N	Av. 10 Este #8 - 08 Local 1, Cúcuta, Norte de Santander	admin	hq	30	t
7da218c3-fbf2-4f5d-b033-2fa9a40f767c	VENTO_CAFE	Vento Café	operacional	t	2025-12-02 23:41:27+00	7.89132561	-72.49008642	Av. 10 Este #8 - 08 Local 1, Cúcuta, Norte de Santander	satellite	store	30	t
58362682-4ea3-4718-bd83-b4f311f885cd	SAUDO	Saudo	operacional	t	2025-12-02 23:41:54+00	7.89585061	-72.49451878	Av. 7 Este #2 - 48 Local 4, Barrio La ceiba, Cúcuta, Norte de Santander	satellite	store	20	t
fa679b86-397a-4155-8336-9bd3245ef1ce	MOLKA_PRINCIPAL	Molka Principal	operacional	t	2026-02-27 20:20:28.555711+00	7.89299527	-72.48311237	Av. 3 #12-72, San Luis, Cúcuta, Norte de Santander	satellite	store	50	t
\.


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."areas" ("id", "site_id", "code", "name", "kind", "is_active", "created_at") FROM stdin;
ecfd5835-6a19-4f49-9b4e-6f96eadacb58	407ccca3-bc35-4252-8998-7280623de78f	PANADERIA	Panadería	panaderia	t	2025-12-02 23:45:17.616941+00
9e73ffd6-7191-46ee-a644-134ec0bb6015	407ccca3-bc35-4252-8998-7280623de78f	REPOSTERIA	Repostería	reposteria	t	2025-12-02 23:45:37.076339+00
34ffca0c-b747-44e6-ab73-4f7a84c57d6b	407ccca3-bc35-4252-8998-7280623de78f	COCINA_CALIENTE	Cocina caliente	cocina_caliente	t	2025-12-02 23:45:55.819773+00
1c013f8f-2020-4fa3-b8a9-33e055842209	407ccca3-bc35-4252-8998-7280623de78f	BODEGA	Bodega	bodega	t	2025-12-02 23:46:13.350917+00
94eb19b4-ef3a-4df2-887c-d9d06b03ca02	59de8039-239a-4791-a20c-c2e7fe2344d3	GERENCIA_GENERAL	Gerencia General	gerencia	t	2026-01-09 13:47:13.27221+00
99f9c151-fcd1-4e97-9c6d-03cd58565823	59de8039-239a-4791-a20c-c2e7fe2344d3	CONTABILIDAD	Contabilidad	contabilidad	t	2025-12-31 14:45:00.570485+00
96afcf8a-b638-48f0-96b6-8295ba8419e2	59de8039-239a-4791-a20c-c2e7fe2344d3	DIRECCION	Dirección	liderazgo	t	2025-12-31 14:45:00.570485+00
57993559-0f55-4d6a-a1e3-e7c9721d7f40	59de8039-239a-4791-a20c-c2e7fe2344d3	MARKETING	Marketing	marketing	t	2026-01-13 23:46:40.432379+00
9aa70d16-4bf5-498a-9b26-126eb49c3c12	59de8039-239a-4791-a20c-c2e7fe2344d3	CONDUCTOR	Conductor	logistica	t	2026-01-13 23:46:40.432379+00
2ac36aff-b87b-4260-a32a-9c710ec4a124	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	BARRA	Barra	bar	t	2025-12-02 23:43:49.838875+00
3215396a-dfc5-44b7-924b-b27260cc455d	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	CAJA	Caja	caja	t	2025-12-02 23:44:10.538269+00
31437887-3357-4ccb-aae2-747cc7802453	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	COCINA	Cocina	cocina	t	2025-12-02 23:43:28.467426+00
7d1e1556-1f53-48be-bf1b-8e060926eb78	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	MOSTRADOR	Mostrador	mostrador	t	2025-12-02 23:43:04.981278+00
12b3aeac-3b44-4528-a1ce-0a1a3057751a	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	SALON	Salón	salon	t	2025-12-31 14:45:00.570485+00
891a9d67-dc0e-4943-9eef-558b580efb37	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	GENERAL	General	general	t	2025-12-31 14:45:00.570485+00
07380165-7819-4d1f-8295-6e9ed9b615a8	58362682-4ea3-4718-bd83-b4f311f885cd	COCINA_BARRA	Cocina / Barra	cocina_bar	t	2025-12-02 23:44:42.939248+00
abc554c3-cb48-4a43-8761-4a9e9e863614	58362682-4ea3-4718-bd83-b4f311f885cd	CAJA	Caja	caja	t	2025-12-02 23:44:57.3212+00
3ecfd3c7-235f-45d7-b607-704ccb862c83	58362682-4ea3-4718-bd83-b4f311f885cd	SALON	Salón	salon	t	2025-12-31 14:45:00.570485+00
2fce4815-fc38-41f6-8870-c19d415f61a8	58362682-4ea3-4718-bd83-b4f311f885cd	GENERAL	General	general	t	2025-12-31 14:45:00.570485+00
\.


--
-- Data for Name: asistencia_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."asistencia_logs" ("id", "empleado_nombre", "empleado_id", "fecha_hora", "sucursal", "created_at") FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."roles" ("code", "name", "description", "is_active", "created_at", "updated_at") FROM stdin;
propietario	Propietario	Dueno y gerente general	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
gerente_general	Gerente General	Gerencia global multi-sede	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
gerente	Gerente	Gerente de sede	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
bodeguero	Bodeguero	Bodega e inventario	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
conductor	Conductor	Transporte y remisiones	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
cajero	Cajero	Caja y cobros	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
mesero	Mesero	Servicio en sala	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
barista	Barista	Barista	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
cocinero	Cocinero	Cocina	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
panadero	Panadero	Panaderia	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
repostero	Repostero	Reposteria	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
pastelero	Pastelero	Pasteleria	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
contador	Contador	Finanzas y contabilidad	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
marketing	Marketing	Marketing y growth	t	2026-01-18 17:10:40.064109+00	2026-01-18 17:10:40.064109+00
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."employees" ("id", "site_id", "role", "permissions", "full_name", "alias", "pin_code", "is_active", "joined_at", "updated_at", "area_id") FROM stdin;
21c92791-e683-4157-a98e-4ca692ee8ce8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	mesero	{}	Yoli Carolina Rojas Contreras	\N	\N	t	2026-02-23 22:22:18.588+00	2026-02-23 22:22:18.588+00	\N
ca3db823-72fd-46b1-946e-8c10bb1b9eb8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	cajero	{}	Claudia Paola Villamediana calderon	\N	\N	t	2026-02-23 22:22:47.499+00	2026-02-23 22:22:47.499+00	\N
ad3e2c03-6ad3-4476-a2fa-30c74e96fea8	407ccca3-bc35-4252-8998-7280623de78f	panadero	{}	Mauricio Vallejo	\N	\N	t	2026-02-23 22:25:15.046+00	2026-02-23 22:25:15.046+00	\N
ea80aafc-2568-43e1-abbe-eeb2ef1cafad	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	mesero	{}	Daniela Fernanda Rincón Ascanio	\N	\N	t	2026-02-23 22:45:54.604+00	2026-02-23 22:45:54.604+00	\N
4d03b153-c466-4d6b-8fef-d42b80b55ca1	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	barista	{}	Elizabeth Contreras	\N	\N	t	2026-02-23 22:54:17.71+00	2026-02-23 22:54:17.71+00	\N
12f6a510-3ae9-40de-ad9f-95ce7bf86823	58362682-4ea3-4718-bd83-b4f311f885cd	cocinero	{}	James Rodriguez	\N	\N	t	2026-02-23 22:54:44.325+00	2026-02-23 22:54:44.325+00	\N
178878fb-2d72-417d-8740-e9e2543a02fd	407ccca3-bc35-4252-8998-7280623de78f	repostero	{}	Angelica Nuñez	\N	\N	t	2026-02-23 23:25:49.371+00	2026-02-23 23:25:49.371+00	\N
ba9733fb-acda-4848-8717-c423698bc006	58362682-4ea3-4718-bd83-b4f311f885cd	cajero	{}	Carlos Romero	\N	\N	t	2026-02-24 15:11:28.091+00	2026-02-24 15:11:28.091+00	\N
a370641b-d5ad-4d57-8245-d1fbc0de3cc9	58362682-4ea3-4718-bd83-b4f311f885cd	mesero	{}	Ferney	\N	\N	t	2026-02-24 15:13:45.514+00	2026-02-24 15:13:45.514+00	\N
5b930b57-2934-4c11-bbc5-9b8e8e67d5ac	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	cocinero	{}	Sandra Parada	\N	\N	t	2026-02-24 16:11:19.542+00	2026-02-24 16:11:19.542+00	\N
18e90fdd-3042-47a2-aac3-e02bb1752278	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	cocinero	{}	Valentina velandia Hernández	\N	\N	t	2026-02-24 16:14:33.632+00	2026-02-24 16:14:33.632+00	\N
2931cc46-273a-4ace-bb5f-baac00365462	407ccca3-bc35-4252-8998-7280623de78f	panadero	{}	Michael Quintero	\N	\N	t	2026-02-24 22:45:22.696+00	2026-02-24 22:45:22.696+00	\N
3456e710-6211-42bf-9632-3aefa8eefa32	e8823211-100a-49b9-bb55-bbff432de43c	propietario	{}	App Review (Apple/Google)	\N	\N	t	2026-02-03 15:33:57.121468+00	2026-02-06 15:13:37.088521+00	\N
a95939bb-6f36-4826-8101-237e358bb12d	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	barista	{}	Anthony Ramirez	\N	\N	t	2026-02-27 17:33:11.501+00	2026-02-27 17:33:11.501+00	\N
88d82db7-7da3-4c83-ad91-69306e0ebe4c	407ccca3-bc35-4252-8998-7280623de78f	repostero	{}	Aris junior padilla Motta	\N	\N	t	2026-02-27 18:21:11.793+00	2026-02-27 18:21:11.793+00	\N
a2b3e826-faa4-4c45-82e1-cdcacbf177f2	407ccca3-bc35-4252-8998-7280623de78f	bodeguero	{}	Monica alexandra maldonado villamizar	\N	\N	t	2026-03-01 22:51:52.049+00	2026-03-01 22:51:52.049+00	\N
2ba2357d-4b66-4145-b62f-73587f82af6f	59de8039-239a-4791-a20c-c2e7fe2344d3	gerente_general	{}	Juliandy garabito	\N	\N	t	2026-02-13 22:10:29.814+00	2026-02-13 22:10:29.814+00	\N
c43c5eeb-6ed9-4808-b174-fe0fbfc738d6	407ccca3-bc35-4252-8998-7280623de78f	cocinero	{}	Angela Bueno	\N	\N	t	2026-03-02 18:59:18.267+00	2026-03-02 18:59:18.267+00	\N
194649ee-3f1c-42ea-a44a-2abd87053c46	59de8039-239a-4791-a20c-c2e7fe2344d3	propietario	{}	Carlos Alejandro Ibarra Ariza	\N	9053	t	2025-12-28 02:49:13.82523+00	2026-03-06 15:34:53.485+00	\N
0857f8d1-0fc8-4c63-a8d2-d74333e90a9d	59de8039-239a-4791-a20c-c2e7fe2344d3	propietario	{}	Nathalia Carolina Ibarra Ariza	\N	\N	t	2026-02-08 19:27:43.348215+00	2026-02-17 21:03:36.763+00	\N
5fcd8cf0-da6b-4116-90b4-552ec9d3593b	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	cajero	{}	Chelsea Barbosa	\N	\N	t	2026-02-21 16:27:22.347+00	2026-02-21 16:27:22.347+00	\N
9b75f26e-cc61-43b6-bde1-d248c3caf0ad	407ccca3-bc35-4252-8998-7280623de78f	bodeguero	{}	Esneider Garabito	\N	\N	t	2026-02-21 16:40:43.83+00	2026-02-21 16:40:43.83+00	\N
549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	mesero	{}	Maria Alexandra Arias Diaz	\N	\N	t	2026-02-21 16:49:16.014+00	2026-02-21 16:49:16.014+00	\N
ce157dc6-3528-4826-a3c5-a6c415c429f0	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	cocinero	{}	Nicol Sebastian Rojas Velandia	\N	\N	t	2026-02-21 16:50:47.064+00	2026-02-21 16:50:47.064+00	\N
912ba8a9-b5bf-4cc6-9252-9aefb3780c53	407ccca3-bc35-4252-8998-7280623de78f	pastelero	{}	Chelsy Ashley Sánchez	\N	\N	t	2026-02-21 16:32:38.399+00	2026-02-21 16:51:03.228+00	\N
71e4d936-7821-4d41-8e5e-9a5a41a9bf09	407ccca3-bc35-4252-8998-7280623de78f	cocinero	{}	Angie Tabarez	\N	\N	t	2026-02-21 16:52:55.48+00	2026-02-21 16:52:55.48+00	\N
f526fbf0-90f4-4b75-b06e-2c12f692f7f9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	cocinero	{}	Angie Paola Alvarez	\N	\N	t	2026-02-21 16:26:20.124+00	2026-02-23 21:22:20.214+00	\N
80324888-621d-4c41-bd59-d42db17e1ea8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	barista	{}	Juliana Rangel	\N	\N	t	2026-02-23 21:33:10.149+00	2026-02-23 21:33:10.149+00	\N
127bb6ba-aec8-44f5-bbd3-825fdd6599a9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	cocinero	{}	David Becerra	\N	\N	t	2026-02-23 21:35:24.951+00	2026-02-23 21:35:24.951+00	\N
1db7df08-40c0-44c7-b117-57ce027e79bc	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	mesero	{}	Angie Viviana Leal	\N	\N	t	2026-02-23 21:58:13.732+00	2026-02-23 21:58:13.732+00	\N
cd4883c8-8894-4d94-8e7b-588d3dbab380	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	mesero	{}	Andrea Valentina Sarmiento	\N	\N	t	2026-02-23 22:16:42.257+00	2026-02-23 22:16:42.257+00	\N
\.


--
-- Data for Name: attendance_breaks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."attendance_breaks" ("id", "employee_id", "site_id", "started_at", "ended_at", "start_source", "end_source", "start_notes", "end_notes", "created_at", "updated_at") FROM stdin;
808f7579-d0c7-4b7e-92c1-77c490aa3007	194649ee-3f1c-42ea-a44a-2abd87053c46	59de8039-239a-4791-a20c-c2e7fe2344d3	2026-02-25 16:28:57.328677+00	2026-02-25 16:30:04.887018+00	mobile	mobile	\N	\N	2026-02-25 16:28:57.328677+00	2026-02-25 16:30:04.887018+00
9a176e53-16c3-4471-8edf-ad527515e51a	80324888-621d-4c41-bd59-d42db17e1ea8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	2026-03-02 20:09:02.487237+00	\N	mobile	\N	\N	\N	2026-03-02 20:09:02.487237+00	2026-03-02 20:09:02.487237+00
1a060bd6-8f05-4d68-95b2-c6df43da71c9	ba9733fb-acda-4848-8717-c423698bc006	58362682-4ea3-4718-bd83-b4f311f885cd	2026-03-06 03:19:00.139207+00	2026-03-06 03:19:02.951409+00	mobile	mobile	\N	\N	2026-03-06 03:19:00.139207+00	2026-03-06 03:19:02.951409+00
d11bf45a-89cb-4854-99ae-64194fbe64f2	194649ee-3f1c-42ea-a44a-2abd87053c46	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	2026-03-06 15:30:47.059885+00	2026-03-06 15:30:50.578859+00	mobile	mobile	{"clientEventId":"break_start_1772811046868_tv38v6"}	{"clientEventId":"break_end_1772811050409_i8gjza"}	2026-03-06 15:30:47.059885+00	2026-03-06 15:30:50.578859+00
\.


--
-- Data for Name: attendance_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."attendance_logs" ("id", "employee_id", "site_id", "action", "source", "occurred_at", "latitude", "longitude", "accuracy_meters", "device_info", "notes", "created_at", "client_event_id") FROM stdin;
611337d2-e6cf-42f7-9481-cb22fa7dbc6c	194649ee-3f1c-42ea-a44a-2abd87053c46	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-01-29 21:17:11.087475+00	7.8958599	-72.4944945	9.2	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 3, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.2", "validationWarnings": []}	\N	2026-01-29 21:17:11.087475+00	\N
36636775-abaa-400a-b669-5f055d662282	194649ee-3f1c-42ea-a44a-2abd87053c46	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-01-29 21:18:08.1646+00	7.8958684	-72.4945289	4.8	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 2, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.2", "validationWarnings": []}	\N	2026-01-29 21:18:08.1646+00	\N
69ba18d0-0b4c-493c-bf28-680011d80734	194649ee-3f1c-42ea-a44a-2abd87053c46	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-02-01 22:22:53.932137+00	7.8958727	-72.4944808	3.5	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.2", "validationWarnings": []}	\N	2026-02-01 22:22:53.932137+00	\N
88dad8ac-d389-4cba-902a-b500194d123f	194649ee-3f1c-42ea-a44a-2abd87053c46	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-02-01 22:23:19.112856+00	7.8958760	-72.4944766	4.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.2", "validationWarnings": []}	\N	2026-02-01 22:23:19.112856+00	\N
292b6a37-f0ca-42d5-a3be-70305e9b9baa	194649ee-3f1c-42ea-a44a-2abd87053c46	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-02-01 22:27:57.120761+00	7.8958436	-72.4944617	7.2	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.2", "validationWarnings": []}	\N	2026-02-01 22:27:57.120761+00	\N
494b1a54-ab9a-4fa2-aa73-d088dbc74659	194649ee-3f1c-42ea-a44a-2abd87053c46	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	system	2026-02-02 04:59:59+00	7.8958506	-72.4945188	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-02-02 04:59:00.168971+00	\N
0206442e-3b33-4931-97e1-5b213c579dbc	194649ee-3f1c-42ea-a44a-2abd87053c46	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-11 16:57:00.772623+00	7.8918098	-72.4835101	8.4	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.2", "validationWarnings": []}	\N	2026-02-11 16:57:00.772623+00	\N
e0193d2e-84da-47da-b9c4-a690ca301b97	194649ee-3f1c-42ea-a44a-2abd87053c46	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-02-11 16:57:10.447812+00	7.8918291	-72.4835445	3.3	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 14, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.2", "validationWarnings": []}	\N	2026-02-11 16:57:10.447812+00	\N
4d81f67f-57eb-4cdd-839c-2becfa2f6c82	2ba2357d-4b66-4145-b62f-73587f82af6f	59de8039-239a-4791-a20c-c2e7fe2344d3	check_in	mobile	2026-02-13 22:11:42.217426+00	\N	\N	\N	\N	\N	2026-02-13 22:11:42.217426+00	\N
a16cbf52-bf30-44d3-b438-a92400f20833	2ba2357d-4b66-4145-b62f-73587f82af6f	59de8039-239a-4791-a20c-c2e7fe2344d3	check_out	mobile	2026-02-13 23:04:45.127601+00	\N	\N	\N	\N	\N	2026-02-13 23:04:45.127601+00	\N
c308f5f4-d15b-4c6b-a49c-b4ad631e2c6f	194649ee-3f1c-42ea-a44a-2abd87053c46	59de8039-239a-4791-a20c-c2e7fe2344d3	check_in	mobile	2026-02-14 13:15:40.14936+00	\N	\N	\N	\N	\N	2026-02-14 13:15:40.14936+00	\N
2fbf0a32-9610-4f2a-9ca2-57bd2d1cd932	194649ee-3f1c-42ea-a44a-2abd87053c46	59de8039-239a-4791-a20c-c2e7fe2344d3	check_out	system	2026-02-15 04:59:59+00	\N	\N	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-02-15 04:59:00.155703+00	\N
b0f2565c-61f1-42e8-9d0b-55532df7fb0e	3456e710-6211-42bf-9632-3aefa8eefa32	e8823211-100a-49b9-bb55-bbff432de43c	check_in	mobile	2026-02-21 03:00:18.713305+00	\N	\N	\N	\N	\N	2026-02-21 03:00:18.713305+00	\N
669942f2-db1a-4b89-84d3-c114dbdf4f53	3456e710-6211-42bf-9632-3aefa8eefa32	e8823211-100a-49b9-bb55-bbff432de43c	check_out	mobile	2026-02-21 03:00:22.881933+00	\N	\N	\N	\N	\N	2026-02-21 03:00:22.881933+00	\N
23b6af1d-19b0-414f-b625-e4733bc7ca19	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-21 19:07:43.686086+00	7.8914102	-72.4899749	5.3	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-02-21 19:07:43.686086+00	\N
20f95786-fb9f-4c95-98db-aae282427634	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-22 02:48:46.195157+00	7.8913876	-72.4899998	11.5	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-02-22 02:48:46.195157+00	\N
8024b81a-c914-4887-b67d-287f7f469abb	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-22 12:03:45.864809+00	7.8913775	-72.4900223	10.2	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 4, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-02-22 12:03:45.864809+00	\N
10e127b5-dd5c-45c9-b72d-671e30a26694	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-22 19:11:53.169279+00	7.8914006	-72.4900146	10.5	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-02-22 19:11:53.169279+00	\N
e57f35a3-ebed-4e3b-90ab-aa89ae6b4fab	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-23 19:06:09.226993+00	7.8913911	-72.4900288	11.5	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-02-23 19:06:09.226993+00	\N
8f2d69dc-160f-47d1-a7dc-48c8487d2509	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-24 03:05:48.219809+00	7.8913954	-72.4900278	11.5	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-02-24 03:05:48.219809+00	\N
7ecb3703-0ad8-46ea-b8c7-49461b7fa09b	ad3e2c03-6ad3-4476-a2fa-30c74e96fea8	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-24 10:54:27.492056+00	7.8917721	-72.4834548	9.6	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 3, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14", "osVersion": "18.5", "validationWarnings": []}	\N	2026-02-24 10:54:27.492056+00	\N
96de4748-92a1-4d90-abb9-f54da71659cf	9b75f26e-cc61-43b6-bde1-d248c3caf0ad	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-24 10:54:40.168325+00	7.8917741	-72.4834880	3.8	{"brand": "HONOR", "osName": "Android", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "LGN-NX3", "osVersion": "15", "validationWarnings": []}	\N	2026-02-24 10:54:40.168325+00	\N
80c885b3-aa17-463a-873d-b22a1baca1a9	4d03b153-c466-4d6b-8fef-d42b80b55ca1	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-24 11:29:46.896749+00	7.8914166	-72.4900345	9.9	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.2.1", "validationWarnings": []}	\N	2026-02-24 11:29:46.896749+00	\N
a2c24d2f-6453-40f1-90a9-1ce98f34bb14	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-24 11:34:41.915252+00	7.8914063	-72.4899720	5.8	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-02-24 11:34:41.915252+00	\N
5e5081e7-e03e-4031-8178-d654b18011e4	912ba8a9-b5bf-4cc6-9252-9aefb3780c53	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-24 12:56:12.248697+00	7.8917642	-72.4834738	10.6	{"brand": "samsung", "osName": "samsung/a25xdxx/a25x:16/BP2A.250605.031.A3/A256EXXU8DYI8:user/release-keys", "geofence": {"distanceMeters": 4, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "SM-A256E", "osVersion": "16", "validationWarnings": []}	\N	2026-02-24 12:56:12.248697+00	\N
33c31e71-4a7d-4983-975a-571e71422cc4	71e4d936-7821-4d41-8e5e-9a5a41a9bf09	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-24 13:02:00.193272+00	7.8917397	-72.4835002	6.7	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:15/AP3A.240905.015.A2/A556EXXU7BYDB:user/release-keys", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "15", "validationWarnings": []}	\N	2026-02-24 13:02:00.193272+00	\N
7ecd4adf-bc4d-459f-89e2-4d73799e3537	178878fb-2d72-417d-8740-e9e2543a02fd	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-24 13:19:10.76361+00	7.8917894	-72.4834440	10.0	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 4, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16 Pro Max", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-24 13:19:10.76361+00	\N
1c625168-cc90-4f4e-a9fa-14cdae4b0802	ba9733fb-acda-4848-8717-c423698bc006	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-02-24 15:12:41.071002+00	7.8958859	-72.4945232	5.6	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 4, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "18.6.2", "validationWarnings": []}	\N	2026-02-24 15:12:41.071002+00	\N
05f62bf6-2cb2-4f9e-959b-5a9b59d8b424	a370641b-d5ad-4d57-8245-d1fbc0de3cc9	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-02-24 15:15:23.552953+00	7.8958582	-72.4944856	4.4	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 4, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 15", "osVersion": "18.5", "validationWarnings": []}	\N	2026-02-24 15:15:23.552953+00	\N
d639cfc5-31c2-4408-8efa-28f82a73c7d0	12f6a510-3ae9-40de-ad9f-95ce7bf86823	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-02-24 15:18:09.37484+00	7.8958271	-72.4945815	10.1	{"brand": "Redmi", "osName": "Android", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-02-24 15:18:09.37484+00	\N
a6ae3ef8-a531-476c-a3ef-77d9f54e4b49	ce157dc6-3528-4826-a3c5-a6c415c429f0	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-24 18:49:03.009877+00	7.8914062	-72.4899893	7.4	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 8, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14 Pro", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-24 18:49:03.009877+00	\N
ad35aed2-55f8-45d8-9386-196c574cf2ae	127bb6ba-aec8-44f5-bbd3-825fdd6599a9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-24 19:26:03.786896+00	7.8913616	-72.4900345	11.5	{"brand": "Redmi", "osName": "Redmi/ocean_global/ocean:15/AP3A.240905.015.A2/OS2.0.202.0.VHZLMCR:user/release-keys", "geofence": {"distanceMeters": 1, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "2303ERA42L", "osVersion": "15", "validationWarnings": []}	\N	2026-02-24 19:26:03.786896+00	\N
35f233ff-33f5-4a93-a9f8-2bb86f3ab7b5	4d03b153-c466-4d6b-8fef-d42b80b55ca1	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-24 19:37:40.624764+00	7.8914155	-72.4900477	9.3	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.2.1", "validationWarnings": []}	\N	2026-02-24 19:37:40.624764+00	\N
caf7d277-d522-4913-a32b-f19cd51208ac	ea80aafc-2568-43e1-abbe-eeb2ef1cafad	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-24 20:03:50.948557+00	7.8914352	-72.4899483	4.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 14, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16", "osVersion": "26.2", "validationWarnings": []}	\N	2026-02-24 20:03:50.948557+00	\N
d752add1-a62d-452e-a08d-61d21179a364	ca3db823-72fd-46b1-946e-8c10bb1b9eb8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-24 20:04:28.943874+00	7.8913802	-72.4900429	9.3	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 3, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-24 20:04:28.943874+00	\N
1e361695-8305-4aaf-b9e4-1f37bd41c8fd	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-24 20:09:54.590555+00	7.8913913	-72.4900160	11.5	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-02-24 20:09:54.590555+00	\N
e5baeb89-8684-49fb-81b1-7688b31752b5	71e4d936-7821-4d41-8e5e-9a5a41a9bf09	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-02-24 21:12:48.045724+00	7.8917717	-72.4834985	17.9	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:15/AP3A.240905.015.A2/A556EXXU7BYDB:user/release-keys", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "15", "validationWarnings": []}	\N	2026-02-24 21:12:48.045724+00	\N
6113d53f-8856-4e14-b338-4598faf367e0	9b75f26e-cc61-43b6-bde1-d248c3caf0ad	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-02-24 21:43:56.645607+00	7.8917736	-72.4834922	11.5	{"brand": "HONOR", "osName": "Android", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "LGN-NX3", "osVersion": "15", "validationWarnings": []}	\N	2026-02-24 21:43:56.645607+00	\N
71bc75bb-db2d-4fe6-a162-9ff28dd62479	0857f8d1-0fc8-4c63-a8d2-d74333e90a9d	59de8039-239a-4791-a20c-c2e7fe2344d3	check_in	mobile	2026-02-24 23:18:16.589094+00	\N	\N	\N	\N	\N	2026-02-24 23:18:16.589094+00	\N
185e25bb-a142-49f5-b8a3-df8578577b3e	0857f8d1-0fc8-4c63-a8d2-d74333e90a9d	59de8039-239a-4791-a20c-c2e7fe2344d3	check_out	mobile	2026-02-24 23:18:31.324713+00	\N	\N	\N	\N	\N	2026-02-24 23:18:31.324713+00	\N
6e7c24f0-85f5-4530-a786-62707b5e469a	178878fb-2d72-417d-8740-e9e2543a02fd	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-02-24 23:19:12.711491+00	7.8916930	-72.4834277	10.0	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16 Pro Max", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-24 23:19:12.711491+00	\N
48d7392e-7172-4cda-b84b-e02361dfac9d	912ba8a9-b5bf-4cc6-9252-9aefb3780c53	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-02-24 23:19:28.185369+00	7.8918164	-72.4834068	9.3	{"brand": "samsung", "osName": "samsung/a25xdxx/a25x:16/BP2A.250605.031.A3/A256EXXU8DYI8:user/release-keys", "geofence": {"distanceMeters": 8, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A256E", "osVersion": "16", "validationWarnings": []}	\N	2026-02-24 23:19:28.185369+00	\N
e8049d52-5c60-4326-a6e3-f1a55219a4ad	ad3e2c03-6ad3-4476-a2fa-30c74e96fea8	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-02-24 23:19:30.999665+00	7.8918415	-72.4834275	3.6	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14", "osVersion": "18.5", "validationWarnings": []}	\N	2026-02-24 23:19:30.999665+00	\N
9f63da9e-c86f-4cd4-bd39-acc2e95154f6	ba9733fb-acda-4848-8717-c423698bc006	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-02-25 02:51:23.780153+00	7.8958856	-72.4946025	9.9	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "18.6.2", "validationWarnings": []}	\N	2026-02-25 02:51:23.780153+00	\N
714b11cf-4f28-4baa-8dc6-5eae52c4438b	12f6a510-3ae9-40de-ad9f-95ce7bf86823	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-02-25 02:52:09.49766+00	7.8958501	-72.4944483	19.8	{"brand": "Redmi", "osName": "Android", "geofence": {"distanceMeters": 8, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-02-25 02:52:09.49766+00	\N
da096bac-34a4-4133-a719-1d75e2c96258	a370641b-d5ad-4d57-8245-d1fbc0de3cc9	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-02-25 02:52:44.425672+00	7.8958964	-72.4944435	4.5	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 15", "osVersion": "18.5", "validationWarnings": []}	\N	2026-02-25 02:52:44.425672+00	\N
e0867827-2335-4644-8e07-035cf5284195	127bb6ba-aec8-44f5-bbd3-825fdd6599a9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-25 03:03:43.482367+00	7.8914208	-72.4899972	5.9	{"brand": "Redmi", "osName": "Redmi/ocean_global/ocean:15/AP3A.240905.015.A2/OS2.0.202.0.VHZLMCR:user/release-keys", "geofence": {"distanceMeters": 9, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "2303ERA42L", "osVersion": "15", "validationWarnings": []}	\N	2026-02-25 03:03:43.482367+00	\N
a2f98f66-c5e9-4d2a-8d0b-6d170e8c5e55	ca3db823-72fd-46b1-946e-8c10bb1b9eb8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-25 03:20:43.695645+00	7.8914456	-72.4900558	4.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 11, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-25 03:20:43.695645+00	\N
70211b8d-6d22-43e3-8919-7379eb1da2ec	ea80aafc-2568-43e1-abbe-eeb2ef1cafad	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-25 03:21:00.202847+00	7.8914069	-72.4899250	6.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 14, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16", "osVersion": "26.2", "validationWarnings": []}	\N	2026-02-25 03:21:00.202847+00	\N
b7b8c2e2-8688-40bf-835c-26adbec512a1	ce157dc6-3528-4826-a3c5-a6c415c429f0	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	system	2026-02-25 04:59:59+00	7.8913493	-72.4900376	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-02-25 04:59:00.162433+00	\N
7bee1041-2a14-4c15-b0ff-dfae6fca46c6	9b75f26e-cc61-43b6-bde1-d248c3caf0ad	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-25 10:45:55.94057+00	7.8917651	-72.4834697	10.2	{"brand": "HONOR", "osName": "Android", "geofence": {"distanceMeters": 4, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "LGN-NX3", "osVersion": "15", "validationWarnings": []}	\N	2026-02-25 10:45:55.94057+00	\N
1ec8ada6-7d27-4817-8d80-7c65fad3c843	ad3e2c03-6ad3-4476-a2fa-30c74e96fea8	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-25 11:00:01.71377+00	7.8917369	-72.4835182	4.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 9, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14", "osVersion": "18.5", "validationWarnings": []}	\N	2026-02-25 11:00:01.71377+00	\N
6ab9a047-848c-4e59-ac14-a65726b98a0b	18e90fdd-3042-47a2-aac3-e02bb1752278	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-25 11:00:06.195907+00	7.8913923	-72.4899900	12.3	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:16/BP2A.250605.031.A3/A556EXXUACYIA:user/release-keys", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "16", "validationWarnings": []}	\N	2026-02-25 11:00:06.195907+00	\N
f24f41c6-5a92-4c3a-ad72-972637ce8409	912ba8a9-b5bf-4cc6-9252-9aefb3780c53	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-25 11:07:18.256787+00	7.8917495	-72.4835304	4.7	{"brand": "samsung", "osName": "samsung/a25xdxx/a25x:16/BP2A.250605.031.A3/A256EXXU8DYI8:user/release-keys", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "SM-A256E", "osVersion": "16", "validationWarnings": []}	\N	2026-02-25 11:07:18.256787+00	\N
8e61752e-e988-49ee-bcd2-bc83ece570f0	178878fb-2d72-417d-8740-e9e2543a02fd	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-25 11:09:31.403449+00	7.8917493	-72.4834879	3.3	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16 Pro Max", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-25 11:09:31.403449+00	\N
44f3ef81-1ddb-470d-9a61-8abe4e181d00	2931cc46-273a-4ace-bb5f-baac00365462	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-25 11:10:56.840096+00	7.8916939	-72.4834522	7.3	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14 Pro", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-25 11:10:56.840096+00	\N
2480aa9f-3c6a-41ed-83e9-9859450d89c0	21c92791-e683-4157-a98e-4ca692ee8ce8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-25 11:23:48.816796+00	7.8913381	-72.4900158	13.0	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:14/UP1A.231005.007/A556EXXU6AYB2:user/release-keys", "geofence": {"distanceMeters": 3, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "14", "validationWarnings": []}	\N	2026-02-25 11:23:48.816796+00	\N
bb973926-1ebf-4f7e-9ee9-1eb74df0b0c4	f526fbf0-90f4-4b75-b06e-2c12f692f7f9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-25 11:27:18.133435+00	7.8914001	-72.4899839	5.5	{"brand": "vivo", "osName": "Android", "geofence": {"distanceMeters": 8, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "V2247", "osVersion": "15", "validationWarnings": []}	\N	2026-02-25 11:27:18.133435+00	\N
d62c8897-5595-4658-8759-b7a1c2a34798	4d03b153-c466-4d6b-8fef-d42b80b55ca1	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-25 11:30:24.186834+00	7.8914162	-72.4900328	9.3	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.2.1", "validationWarnings": []}	\N	2026-02-25 11:30:24.186834+00	\N
92555485-4de5-461d-ac58-3081ed69922f	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-25 11:38:07.396413+00	7.8913779	-72.4900087	7.0	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 4, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-02-25 11:38:07.396413+00	\N
01a9e50e-22c7-40b0-8f39-314da050c2b6	71e4d936-7821-4d41-8e5e-9a5a41a9bf09	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-25 13:05:09.442815+00	7.8917232	-72.4834901	9.1	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:15/AP3A.240905.015.A2/A556EXXU7BYDB:user/release-keys", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "15", "validationWarnings": []}	\N	2026-02-25 13:05:09.442815+00	\N
d96183ed-83b7-492c-a563-0f47791a80aa	2ba2357d-4b66-4145-b62f-73587f82af6f	59de8039-239a-4791-a20c-c2e7fe2344d3	check_in	mobile	2026-02-25 13:45:02.369852+00	\N	\N	\N	\N	\N	2026-02-25 13:45:02.369852+00	\N
0813d75a-6047-49ff-b29a-03de8642b800	ba9733fb-acda-4848-8717-c423698bc006	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-02-25 16:00:42.013751+00	7.8958509	-72.4945669	9.0	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "18.6.2", "validationWarnings": []}	\N	2026-02-25 16:00:42.013751+00	\N
d2f66adb-01a0-4ad9-9288-5efc3c33ac18	12f6a510-3ae9-40de-ad9f-95ce7bf86823	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-02-25 16:03:27.20729+00	7.8958520	-72.4945177	4.1	{"brand": "Redmi", "osName": "Android", "geofence": {"distanceMeters": 0, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-02-25 16:03:27.20729+00	\N
5415a9ea-26b3-4895-b94d-f719497e81f0	194649ee-3f1c-42ea-a44a-2abd87053c46	59de8039-239a-4791-a20c-c2e7fe2344d3	check_in	mobile	2026-02-25 16:25:58.866329+00	\N	\N	\N	\N	\N	2026-02-25 16:25:58.866329+00	\N
2c60d843-02ca-44ad-b0e1-e234793d9a17	194649ee-3f1c-42ea-a44a-2abd87053c46	59de8039-239a-4791-a20c-c2e7fe2344d3	check_out	mobile	2026-02-25 16:30:12.534254+00	\N	\N	\N	\N	\N	2026-02-25 16:30:12.534254+00	\N
5f244604-3797-4fd3-a6c1-789902c10995	ce157dc6-3528-4826-a3c5-a6c415c429f0	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-25 18:59:21.33911+00	7.8913982	-72.4900323	6.5	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14 Pro", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-25 18:59:21.33911+00	\N
ebe534de-a955-43dd-bf63-e51875359c8b	5b930b57-2934-4c11-bbc5-9b8e8e67d5ac	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-25 19:02:02.858613+00	7.8912743	-72.4901117	7.9	{"brand": "OPPO", "osName": "Android", "geofence": {"distanceMeters": 12, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "CPH2577", "osVersion": "15", "validationWarnings": []}	\N	2026-02-25 19:02:02.858613+00	\N
4da5f4aa-d94b-47dd-ab3b-c98d6f48139e	2931cc46-273a-4ace-bb5f-baac00365462	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-02-25 19:12:09.681992+00	7.8917768	-72.4835186	5.2	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 9, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14 Pro", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-25 19:12:09.681992+00	\N
3f03779a-dedc-4eae-8e3c-63b8c24b2079	18e90fdd-3042-47a2-aac3-e02bb1752278	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-25 19:25:04.199921+00	7.8913695	-72.4898691	8.7	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:16/BP2A.250605.031.A3/A556EXXUACYIA:user/release-keys", "geofence": {"distanceMeters": 19, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "16", "validationWarnings": []}	\N	2026-02-25 19:25:04.199921+00	\N
532ce672-9f4a-49b0-b7c2-6af26fcaa88e	4d03b153-c466-4d6b-8fef-d42b80b55ca1	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-25 19:53:04.410073+00	7.8914154	-72.4900369	9.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.2.1", "validationWarnings": []}	\N	2026-02-25 19:53:04.410073+00	\N
412ca65e-eeb5-415d-bf9b-82e5b545c860	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-25 19:57:26.140368+00	7.8913926	-72.4900360	11.5	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-02-25 19:57:26.140368+00	\N
71961e2a-8cdb-4ca5-8d8a-8044bb99bef3	f526fbf0-90f4-4b75-b06e-2c12f692f7f9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-25 20:10:33.206318+00	7.8913629	-72.4900143	19.7	{"brand": "vivo", "osName": "Android", "geofence": {"distanceMeters": 3, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "V2247", "osVersion": "15", "validationWarnings": []}	\N	2026-02-25 20:10:33.206318+00	\N
efc62ec4-be9f-45c0-b83d-dde47ac2d6d3	a370641b-d5ad-4d57-8245-d1fbc0de3cc9	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-02-25 20:52:12.013098+00	7.8959821	-72.4945366	4.0	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 15, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 15", "osVersion": "18.5", "validationWarnings": []}	\N	2026-02-25 20:52:12.013098+00	\N
360e083e-b292-4c5a-af5a-f712fe2a3ad9	71e4d936-7821-4d41-8e5e-9a5a41a9bf09	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-02-25 21:09:33.095062+00	7.8917365	-72.4834846	12.9	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:15/AP3A.240905.015.A2/A556EXXU7BYDB:user/release-keys", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "15", "validationWarnings": []}	\N	2026-02-25 21:09:33.095062+00	\N
28d2553d-1352-4711-ac0c-304fe9a0fd3d	5fcd8cf0-da6b-4116-90b4-552ec9d3593b	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-25 21:17:07.837586+00	7.8913385	-72.4901353	8.0	{"brand": "samsung", "osName": "samsung/a35xjvxx/a35x:16/BP2A.250605.031.A3/A356EXXU5CYI8:user/release-keys", "geofence": {"distanceMeters": 11, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "SM-A356E", "osVersion": "16", "validationWarnings": []}	\N	2026-02-25 21:17:07.837586+00	\N
8f4955f7-bcff-4c50-a938-50d42c88bdc9	9b75f26e-cc61-43b6-bde1-d248c3caf0ad	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-02-25 21:58:23.602754+00	7.8917103	-72.4835825	8.6	{"brand": "HONOR", "osName": "Android", "geofence": {"distanceMeters": 17, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "LGN-NX3", "osVersion": "15", "validationWarnings": []}	\N	2026-02-25 21:58:23.602754+00	\N
c2decbb9-845f-43cc-a605-d4444e4c79f2	a370641b-d5ad-4d57-8245-d1fbc0de3cc9	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-02-26 02:48:46.260132+00	7.8958881	-72.4944907	3.2	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 15", "osVersion": "18.5", "validationWarnings": []}	\N	2026-02-26 02:48:46.260132+00	\N
fdb253a0-0e4f-4b6f-88bb-53c5fb3d2545	ba9733fb-acda-4848-8717-c423698bc006	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-02-26 02:50:07.112592+00	7.8958353	-72.4944442	9.4	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 8, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "18.6.2", "validationWarnings": []}	\N	2026-02-26 02:50:07.112592+00	\N
3923036f-75c9-4a7e-8ac8-7ef2c79f1b16	12f6a510-3ae9-40de-ad9f-95ce7bf86823	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-02-26 02:51:39.524289+00	7.8958637	-72.4944653	5.3	{"brand": "Redmi", "osName": "Android", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-02-26 02:51:39.524289+00	\N
76f576b2-8022-4386-94f4-00d5f681f6c1	ce157dc6-3528-4826-a3c5-a6c415c429f0	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-26 03:10:08.119801+00	7.8914090	-72.4899917	9.8	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 8, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14 Pro", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-26 03:10:08.119801+00	\N
c9cd0fa1-4772-43de-8692-dfe3a227fafb	5b930b57-2934-4c11-bbc5-9b8e8e67d5ac	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-26 03:10:24.615537+00	7.8914660	-72.4899968	2.7	{"brand": "OPPO", "osName": "Android", "geofence": {"distanceMeters": 14, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "CPH2577", "osVersion": "15", "validationWarnings": []}	\N	2026-02-26 03:10:24.615537+00	\N
b6627d5a-316e-4b61-a985-3d39b13b4a0c	178878fb-2d72-417d-8740-e9e2543a02fd	407ccca3-bc35-4252-8998-7280623de78f	check_out	system	2026-02-26 04:59:59+00	7.8917551	-72.4834379	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-02-26 04:59:00.148829+00	\N
ca79057e-6253-4221-b840-5d9823d5a075	21c92791-e683-4157-a98e-4ca692ee8ce8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	system	2026-02-26 04:59:59+00	7.8913493	-72.4900376	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-02-26 04:59:00.148829+00	\N
26d86536-fe2b-41ba-b435-186fbd9ac4bb	2ba2357d-4b66-4145-b62f-73587f82af6f	59de8039-239a-4791-a20c-c2e7fe2344d3	check_out	system	2026-02-26 04:59:59+00	\N	\N	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-02-26 04:59:00.148829+00	\N
acf64f64-6b84-44ed-ac57-47c58cd11d79	5fcd8cf0-da6b-4116-90b4-552ec9d3593b	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	system	2026-02-26 04:59:59+00	7.8913493	-72.4900376	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-02-26 04:59:00.148829+00	\N
a842b124-6976-43a9-8faa-ecc91d04d748	912ba8a9-b5bf-4cc6-9252-9aefb3780c53	407ccca3-bc35-4252-8998-7280623de78f	check_out	system	2026-02-26 04:59:59+00	7.8917551	-72.4834379	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-02-26 04:59:00.148829+00	\N
1723015d-d39c-48d6-9ad8-7d2ed271cdbf	ad3e2c03-6ad3-4476-a2fa-30c74e96fea8	407ccca3-bc35-4252-8998-7280623de78f	check_out	system	2026-02-26 04:59:59+00	7.8917551	-72.4834379	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-02-26 04:59:00.148829+00	\N
d662d100-2102-4535-bcdf-3046e5820f90	f526fbf0-90f4-4b75-b06e-2c12f692f7f9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-26 11:04:11.219168+00	7.8913886	-72.4900383	12.4	{"brand": "vivo", "osName": "Android", "geofence": {"distanceMeters": 4, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "V2247", "osVersion": "15", "validationWarnings": []}	\N	2026-02-26 11:04:11.219168+00	\N
db58e41c-b374-47d6-a238-4b53fa654b30	ad3e2c03-6ad3-4476-a2fa-30c74e96fea8	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-26 11:05:42.185435+00	7.8917869	-72.4833900	3.5	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14", "osVersion": "18.5", "validationWarnings": []}	\N	2026-02-26 11:05:42.185435+00	\N
f091e99d-9560-4bad-8185-dc016868f645	912ba8a9-b5bf-4cc6-9252-9aefb3780c53	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-26 11:06:32.190287+00	7.8917550	-72.4834002	5.7	{"brand": "samsung", "osName": "samsung/a25xdxx/a25x:16/BP2A.250605.031.A3/A256EXXU8DYI8:user/release-keys", "geofence": {"distanceMeters": 4, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "SM-A256E", "osVersion": "16", "validationWarnings": []}	\N	2026-02-26 11:06:32.190287+00	\N
c1c366f6-cf71-4b0b-a6ab-10678048220a	2931cc46-273a-4ace-bb5f-baac00365462	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-26 11:13:35.621478+00	7.8917675	-72.4834224	3.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 2, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14 Pro", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-26 11:13:35.621478+00	\N
fac16d8c-11b1-4b53-9cb0-b49c13e2f0f0	178878fb-2d72-417d-8740-e9e2543a02fd	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-26 11:20:51.729674+00	7.8917769	-72.4834540	9.4	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 3, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16 Pro Max", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-26 11:20:51.729674+00	\N
f03d4bdd-6c37-43b8-8d59-a59648f9142f	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-26 11:33:08.404695+00	7.8913943	-72.4899529	4.9	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 11, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-02-26 11:33:08.404695+00	\N
627ec41b-600a-4ccd-b510-ed334d6ea900	ca3db823-72fd-46b1-946e-8c10bb1b9eb8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-26 11:38:03.160804+00	7.8914047	-72.4899857	10.0	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 8, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-26 11:38:03.160804+00	\N
10117d2c-8d73-451b-a093-78435ad39280	9b75f26e-cc61-43b6-bde1-d248c3caf0ad	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-26 12:00:25.049445+00	7.8917785	-72.4835015	10.5	{"brand": "HONOR", "osName": "Android", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "LGN-NX3", "osVersion": "15", "validationWarnings": []}	\N	2026-02-26 12:00:25.049445+00	\N
c0bb3fbf-3135-4f56-a2f5-ca0dbc254709	18e90fdd-3042-47a2-aac3-e02bb1752278	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-26 12:55:29.218746+00	7.8913617	-72.4899464	7.2	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:16/BP2A.250605.031.A3/A556EXXUACYIA:user/release-keys", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "16", "validationWarnings": []}	\N	2026-02-26 12:55:29.218746+00	\N
386f9d07-2ea8-4f4d-9913-5c87a2a4e29e	71e4d936-7821-4d41-8e5e-9a5a41a9bf09	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-26 13:00:35.811077+00	7.8917959	-72.4834253	14.3	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:15/AP3A.240905.015.A2/A556EXXU7BYDB:user/release-keys", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "15", "validationWarnings": []}	\N	2026-02-26 13:00:35.811077+00	\N
3706deb1-16ab-4856-adff-46d15aca65f2	a370641b-d5ad-4d57-8245-d1fbc0de3cc9	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-02-26 15:58:21.591697+00	7.8958489	-72.4945007	4.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 2, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 15", "osVersion": "18.5", "validationWarnings": []}	\N	2026-02-26 15:58:21.591697+00	\N
4f5d95a8-6f16-4ef5-9546-4fdb57b74ce5	12f6a510-3ae9-40de-ad9f-95ce7bf86823	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-02-26 16:15:54.787894+00	7.8958609	-72.4944666	3.8	{"brand": "Redmi", "osName": "Android", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-02-26 16:15:54.787894+00	\N
e13762a7-04f3-425d-aca2-007a7a3924b9	ce157dc6-3528-4826-a3c5-a6c415c429f0	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-26 18:52:22.897466+00	7.8914625	-72.4899732	6.5	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 14, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14 Pro", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-26 18:52:22.897466+00	\N
178851cb-1f0b-48ba-8cff-7b67b5949016	127bb6ba-aec8-44f5-bbd3-825fdd6599a9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-26 19:00:06.16668+00	7.8913935	-72.4900339	11.5	{"brand": "Redmi", "osName": "Redmi/ocean_global/ocean:15/AP3A.240905.015.A2/OS2.0.202.0.VHZLMCR:user/release-keys", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "2303ERA42L", "osVersion": "15", "validationWarnings": []}	\N	2026-02-26 19:00:06.16668+00	\N
c8e222f4-fdae-4cf0-8875-a58a60c978c3	ea80aafc-2568-43e1-abbe-eeb2ef1cafad	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-26 19:07:56.263937+00	7.8914366	-72.4899683	7.4	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 12, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16", "osVersion": "26.2", "validationWarnings": []}	\N	2026-02-26 19:07:56.263937+00	\N
4dc0f886-b073-4f64-8368-2c0b22a7d28f	21c92791-e683-4157-a98e-4ca692ee8ce8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-26 19:08:04.088983+00	7.8914024	-72.4900338	11.5	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:14/UP1A.231005.007/A556EXXU6AYB2:user/release-keys", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "14", "validationWarnings": []}	\N	2026-02-26 19:08:04.088983+00	\N
6825ab80-71de-4c91-b97c-763d1304e137	2931cc46-273a-4ace-bb5f-baac00365462	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-02-26 19:15:46.957085+00	7.8917738	-72.4834735	9.6	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 4, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14 Pro", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-26 19:15:46.957085+00	\N
4d7da326-eef9-4aa0-acb6-2e673a484c36	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-26 19:34:50.173687+00	7.8914016	-72.4900271	11.5	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-02-26 19:34:50.173687+00	\N
e25d97aa-5e6d-429c-af78-9af32050995f	9b75f26e-cc61-43b6-bde1-d248c3caf0ad	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-02-26 19:39:44.996398+00	7.8917829	-72.4835026	11.5	{"brand": "HONOR", "osName": "Android", "geofence": {"distanceMeters": 8, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "LGN-NX3", "osVersion": "15", "validationWarnings": []}	\N	2026-02-26 19:39:44.996398+00	\N
fcd94818-99c1-440d-99fe-1d60ddfe74a7	80324888-621d-4c41-bd59-d42db17e1ea8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-26 19:39:59.188751+00	7.8913687	-72.4899765	10.3	{"brand": "motorola", "osName": "motorola/cusco_g/cusco:16/W1UU36H.21-14-4-1/7a1802-3172a:user/release-keys", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "motorola edge 50 fusion", "osVersion": "16", "validationWarnings": []}	\N	2026-02-26 19:39:59.188751+00	\N
f1d326bb-9355-4123-a2f0-a6287bd74f19	f526fbf0-90f4-4b75-b06e-2c12f692f7f9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-26 19:49:15.269897+00	7.8913923	-72.4900031	17.1	{"brand": "vivo", "osName": "Android", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "V2247", "osVersion": "15", "validationWarnings": []}	\N	2026-02-26 19:49:15.269897+00	\N
3084addc-718a-465d-86aa-567016397d5f	ca3db823-72fd-46b1-946e-8c10bb1b9eb8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-26 20:10:59.20951+00	7.8914333	-72.4900216	3.5	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-26 20:10:59.20951+00	\N
07757737-3cfa-418c-8eac-c1c5ebd490f2	ba9733fb-acda-4848-8717-c423698bc006	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-02-26 20:58:23.308984+00	7.8959184	-72.4944768	3.3	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 9, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "18.6.2", "validationWarnings": []}	\N	2026-02-26 20:58:23.308984+00	\N
f00eb651-1977-4c08-8f2d-1c69df1ddda3	18e90fdd-3042-47a2-aac3-e02bb1752278	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-26 21:02:11.130153+00	7.8913623	-72.4900215	11.5	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:16/BP2A.250605.031.A3/A556EXXUACYIA:user/release-keys", "geofence": {"distanceMeters": 2, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "16", "validationWarnings": []}	\N	2026-02-26 21:02:11.130153+00	\N
161655a7-7490-43df-9e6a-7a9bf53948b8	71e4d936-7821-4d41-8e5e-9a5a41a9bf09	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-02-26 22:31:38.89038+00	7.8917589	-72.4834812	13.0	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:15/AP3A.240905.015.A2/A556EXXU7BYDB:user/release-keys", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "15", "validationWarnings": []}	\N	2026-02-26 22:31:38.89038+00	\N
052c286d-5913-43ab-84f8-41bc00d7b5e2	80324888-621d-4c41-bd59-d42db17e1ea8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-27 02:45:40.200018+00	7.8914523	-72.4899056	4.6	{"brand": "motorola", "osName": "motorola/cusco_g/cusco:16/W1UU36H.21-14-4-1/7a1802-3172a:user/release-keys", "geofence": {"distanceMeters": 19, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "motorola edge 50 fusion", "osVersion": "16", "validationWarnings": []}	\N	2026-02-27 02:45:40.200018+00	\N
bc8667b2-4d17-448a-8f7c-e2f50dd49ad7	127bb6ba-aec8-44f5-bbd3-825fdd6599a9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-27 02:47:36.549302+00	7.8914052	-72.4900149	11.5	{"brand": "Redmi", "osName": "Redmi/ocean_global/ocean:15/AP3A.240905.015.A2/OS2.0.202.0.VHZLMCR:user/release-keys", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "2303ERA42L", "osVersion": "15", "validationWarnings": []}	\N	2026-02-27 02:47:36.549302+00	\N
e3316391-7373-41f5-a055-3e30d8740456	ce157dc6-3528-4826-a3c5-a6c415c429f0	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-27 02:48:19.622071+00	7.8914123	-72.4899565	8.6	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 11, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14 Pro", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-27 02:48:19.622071+00	\N
cd769311-d495-4a49-9790-50a38a624d69	ea80aafc-2568-43e1-abbe-eeb2ef1cafad	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-27 02:48:26.061515+00	7.8914300	-72.4900067	8.5	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16", "osVersion": "26.2", "validationWarnings": []}	\N	2026-02-27 02:48:26.061515+00	\N
47dda2c8-c8c4-4ced-adde-12f16816b90c	21c92791-e683-4157-a98e-4ca692ee8ce8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-27 02:48:47.893158+00	7.8914570	-72.4899429	4.7	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:14/UP1A.231005.007/A556EXXU6AYB2:user/release-keys", "geofence": {"distanceMeters": 16, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "14", "validationWarnings": []}	\N	2026-02-27 02:48:47.893158+00	\N
198b4471-07e7-41a7-9623-825898da3e8a	ba9733fb-acda-4848-8717-c423698bc006	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-02-27 03:24:29.782141+00	7.8959429	-72.4945917	5.3	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 13, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "18.6.2", "validationWarnings": []}	\N	2026-02-27 03:24:29.782141+00	\N
a712a730-6140-4dd0-a1cf-d2b49eecbe84	12f6a510-3ae9-40de-ad9f-95ce7bf86823	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-02-27 03:26:53.079096+00	7.8958450	-72.4944816	4.6	{"brand": "Redmi", "osName": "Android", "geofence": {"distanceMeters": 4, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-02-27 03:26:53.079096+00	\N
a3791e1b-2fea-4940-ad14-c4070e534ed7	a370641b-d5ad-4d57-8245-d1fbc0de3cc9	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-02-27 03:27:17.893809+00	7.8958720	-72.4944448	3.4	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 8, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 15", "osVersion": "18.5", "validationWarnings": []}	\N	2026-02-27 03:27:17.893809+00	\N
26b52a1f-8a35-44dd-8a08-f00f5f3005ec	178878fb-2d72-417d-8740-e9e2543a02fd	407ccca3-bc35-4252-8998-7280623de78f	check_out	system	2026-02-27 04:59:59+00	7.8917551	-72.4834379	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-02-27 04:59:00.140028+00	\N
b4900824-7bcb-422b-a2d3-248b89258f76	912ba8a9-b5bf-4cc6-9252-9aefb3780c53	407ccca3-bc35-4252-8998-7280623de78f	check_out	system	2026-02-27 04:59:59+00	7.8917551	-72.4834379	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-02-27 04:59:00.140028+00	\N
f4d8ccb8-e97a-4d5d-bd89-54cdce1c78ca	ad3e2c03-6ad3-4476-a2fa-30c74e96fea8	407ccca3-bc35-4252-8998-7280623de78f	check_out	system	2026-02-27 04:59:59+00	7.8917551	-72.4834379	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-02-27 04:59:00.140028+00	\N
6131c3c8-27f5-45f0-a119-7c20233f9d35	5b930b57-2934-4c11-bbc5-9b8e8e67d5ac	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-27 10:48:05.52168+00	7.8913932	-72.4900205	11.5	{"brand": "OPPO", "osName": "Android", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "CPH2577", "osVersion": "15", "validationWarnings": []}	\N	2026-02-27 10:48:05.52168+00	\N
4bffc3e1-6df7-45ce-8a1d-d0af6f5bc344	18e90fdd-3042-47a2-aac3-e02bb1752278	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-27 10:59:36.154345+00	7.8913911	-72.4899772	6.7	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:16/BP2A.250605.031.A3/A556EXXUACYIA:user/release-keys", "geofence": {"distanceMeters": 8, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "16", "validationWarnings": []}	\N	2026-02-27 10:59:36.154345+00	\N
cb9fa5a8-bb81-4fa0-af4a-cec18029a79a	912ba8a9-b5bf-4cc6-9252-9aefb3780c53	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-27 11:04:59.735142+00	7.8917522	-72.4834296	11.8	{"brand": "samsung", "osName": "samsung/a25xdxx/a25x:16/BP2A.250605.031.A3/A256EXXU8DYI8:user/release-keys", "geofence": {"distanceMeters": 1, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A256E", "osVersion": "16", "validationWarnings": []}	\N	2026-02-27 11:04:59.735142+00	\N
6a700223-a46f-4352-a7ff-9cdb6e4297f6	9b75f26e-cc61-43b6-bde1-d248c3caf0ad	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-27 11:05:41.037557+00	7.8917285	-72.4834966	10.0	{"brand": "HONOR", "osName": "Android", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "LGN-NX3", "osVersion": "15", "validationWarnings": []}	\N	2026-02-27 11:05:41.037557+00	\N
c5b2825a-3a15-48ab-8e87-1e9eac30ff2d	178878fb-2d72-417d-8740-e9e2543a02fd	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-27 11:07:14.554965+00	7.8917529	-72.4835295	8.8	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16 Pro Max", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-27 11:07:14.554965+00	\N
9062a206-d37f-4a14-82ff-ac284b2dd2a6	ad3e2c03-6ad3-4476-a2fa-30c74e96fea8	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-27 11:11:39.224243+00	7.8918101	-72.4835016	8.8	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 9, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14", "osVersion": "18.5", "validationWarnings": []}	\N	2026-02-27 11:11:39.224243+00	\N
897ce997-28b3-4943-b6af-9fc142350b21	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-27 11:37:50.394561+00	7.8913865	-72.4900100	11.5	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-02-27 11:37:50.394561+00	\N
c5c26840-08ac-4656-b778-99047278bae7	ca3db823-72fd-46b1-946e-8c10bb1b9eb8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-27 11:41:22.145337+00	7.8913442	-72.4900262	4.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 1, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-27 11:41:22.145337+00	\N
2d5a2956-326d-4763-83ff-7b7770a204ad	71e4d936-7821-4d41-8e5e-9a5a41a9bf09	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-27 12:24:49.280294+00	7.8917012	-72.4834972	4.7	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:15/AP3A.240905.015.A2/A556EXXU7BYDB:user/release-keys", "geofence": {"distanceMeters": 9, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "15", "validationWarnings": []}	\N	2026-02-27 12:24:49.280294+00	\N
94373a23-fa47-49ab-b2fa-d24696bb54e3	f526fbf0-90f4-4b75-b06e-2c12f692f7f9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-27 12:59:06.170252+00	7.8912343	-72.4900317	11.8	{"brand": "vivo", "osName": "Android", "geofence": {"distanceMeters": 13, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "V2247", "osVersion": "15", "validationWarnings": []}	\N	2026-02-27 12:59:06.170252+00	\N
61e9119e-828e-4169-b909-067806272dd8	80324888-621d-4c41-bd59-d42db17e1ea8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-27 13:05:32.640557+00	7.8914073	-72.4899959	3.9	{"brand": "motorola", "osName": "motorola/cusco_g/cusco:16/W1UU36H.21-14-4-1/7a1802-3172a:user/release-keys", "geofence": {"distanceMeters": 8, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "motorola edge 50 fusion", "osVersion": "16", "validationWarnings": []}	\N	2026-02-27 13:05:32.640557+00	\N
6c33a85d-28cb-4cac-8577-bc3cb36bea14	ba9733fb-acda-4848-8717-c423698bc006	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-02-27 16:00:25.226788+00	7.8958360	-72.4944887	4.6	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 4, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "18.6.2", "validationWarnings": []}	\N	2026-02-27 16:00:25.226788+00	\N
9410b7b9-069a-4719-b040-505d2249af88	12f6a510-3ae9-40de-ad9f-95ce7bf86823	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-02-27 16:07:29.86481+00	7.8958255	-72.4944419	8.3	{"brand": "Redmi", "osName": "Android", "geofence": {"distanceMeters": 9, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-02-27 16:07:29.86481+00	\N
a03fcea1-218d-496b-9608-e16ba1e33579	80324888-621d-4c41-bd59-d42db17e1ea8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-27 16:15:38.880429+00	7.8913940	-72.4900180	20.3	{"brand": "motorola", "osName": "motorola/cusco_g/cusco:16/W1UU36H.21-14-4-1/7a1802-3172a:user/release-keys", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "motorola edge 50 fusion", "osVersion": "16", "validationWarnings": []}	\N	2026-02-27 16:15:38.880429+00	\N
8c3168a1-77db-43c0-ab27-b39867c32409	ce157dc6-3528-4826-a3c5-a6c415c429f0	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-27 18:54:01.753008+00	7.8914410	-72.4899659	4.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 13, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14 Pro", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-27 18:54:01.753008+00	\N
0d4c2440-0a83-4f9e-aed5-b374dd8d511a	127bb6ba-aec8-44f5-bbd3-825fdd6599a9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-27 19:00:27.455008+00	7.8913966	-72.4900313	11.5	{"brand": "Redmi", "osName": "Redmi/ocean_global/ocean:15/AP3A.240905.015.A2/OS2.0.202.0.VHZLMCR:user/release-keys", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "2303ERA42L", "osVersion": "15", "validationWarnings": []}	\N	2026-02-27 19:00:27.455008+00	\N
904d8be2-3a9d-4b5e-a3f8-6921e20c4cf0	21c92791-e683-4157-a98e-4ca692ee8ce8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-27 19:06:16.214308+00	7.8913883	-72.4900416	11.5	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:14/UP1A.231005.007/A556EXXU6AYB2:user/release-keys", "geofence": {"distanceMeters": 4, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "14", "validationWarnings": []}	\N	2026-02-27 19:06:16.214308+00	\N
aa336a97-84c7-49c5-aa85-9746df572323	f526fbf0-90f4-4b75-b06e-2c12f692f7f9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-27 19:17:27.314734+00	7.8913938	-72.4900154	18.8	{"brand": "vivo", "osName": "Android", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "V2247", "osVersion": "15", "validationWarnings": []}	\N	2026-02-27 19:17:27.314734+00	\N
d87cbfcc-f3e2-4487-a0d0-b679e10052f9	4d03b153-c466-4d6b-8fef-d42b80b55ca1	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-27 19:30:32.173781+00	7.8914262	-72.4900462	9.8	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 9, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.2.1", "validationWarnings": []}	\N	2026-02-27 19:30:32.173781+00	\N
f5b56cdf-f294-425f-af2b-5c8c789ecc8c	18e90fdd-3042-47a2-aac3-e02bb1752278	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-27 19:33:11.205366+00	7.8913897	-72.4900031	17.3	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:16/BP2A.250605.031.A3/A556EXXUACYIA:user/release-keys", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "16", "validationWarnings": []}	\N	2026-02-27 19:33:11.205366+00	\N
98c1ed79-44f3-4294-a83d-c543c82e5fca	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-27 19:38:07.893599+00	7.8913626	-72.4900543	8.3	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 2, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-02-27 19:38:07.893599+00	\N
4e62c6d3-9220-4fa0-92fb-5740c98bf595	5b930b57-2934-4c11-bbc5-9b8e8e67d5ac	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-27 19:47:27.308631+00	7.8914233	-72.4900717	3.7	{"brand": "OPPO", "osName": "Android", "geofence": {"distanceMeters": 9, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "CPH2577", "osVersion": "15", "validationWarnings": []}	\N	2026-02-27 19:47:27.308631+00	\N
e5c104a4-33fb-4e8b-9bd5-e9a7dbd51bf7	ca3db823-72fd-46b1-946e-8c10bb1b9eb8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-27 20:10:35.122621+00	7.8914559	-72.4900021	9.1	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 12, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-27 20:10:35.122621+00	\N
7a6a3fe0-d9c2-4ca0-8b9a-68b8c3a154ea	71e4d936-7821-4d41-8e5e-9a5a41a9bf09	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-02-27 20:51:11.378509+00	7.8917580	-72.4835165	6.7	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:15/AP3A.240905.015.A2/A556EXXU7BYDB:user/release-keys", "geofence": {"distanceMeters": 9, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "15", "validationWarnings": []}	\N	2026-02-27 20:51:11.378509+00	\N
882ccb02-94d4-483e-b270-ac8ff8e3167f	a370641b-d5ad-4d57-8245-d1fbc0de3cc9	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-02-27 21:06:01.159022+00	7.8959029	-72.4945629	7.4	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 8, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 15", "osVersion": "18.5", "validationWarnings": []}	\N	2026-02-27 21:06:01.159022+00	\N
89caaafe-168f-4e78-b31e-b51df7fa59dd	80324888-621d-4c41-bd59-d42db17e1ea8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-27 21:09:11.166489+00	7.8913896	-72.4900222	6.4	{"brand": "motorola", "osName": "motorola/cusco_g/cusco:16/W1UU36H.21-14-4-1/7a1802-3172a:user/release-keys", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "motorola edge 50 fusion", "osVersion": "16", "validationWarnings": []}	\N	2026-02-27 21:09:11.166489+00	\N
cbb3e65a-ecb5-4487-9181-08d016c12347	912ba8a9-b5bf-4cc6-9252-9aefb3780c53	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-02-28 00:00:48.222413+00	7.8917684	-72.4835193	11.4	{"brand": "samsung", "osName": "samsung/a25xdxx/a25x:16/BP2A.250605.031.A3/A256EXXU8DYI8:user/release-keys", "geofence": {"distanceMeters": 9, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A256E", "osVersion": "16", "validationWarnings": []}	\N	2026-02-28 00:00:48.222413+00	\N
94d16a7f-8804-44c6-91ea-b08d1d3a0306	178878fb-2d72-417d-8740-e9e2543a02fd	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-02-28 00:00:58.68167+00	7.8917212	-72.4835124	8.4	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 9, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16 Pro Max", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-28 00:00:58.68167+00	\N
9ffeb920-ab6f-4e13-aa4a-3a0b73f93e3d	ad3e2c03-6ad3-4476-a2fa-30c74e96fea8	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-02-28 00:01:13.168808+00	7.8918021	-72.4835009	9.5	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 9, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14", "osVersion": "18.5", "validationWarnings": []}	\N	2026-02-28 00:01:13.168808+00	\N
b702950e-a17a-43c2-b627-96a6bac009e2	80324888-621d-4c41-bd59-d42db17e1ea8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-28 02:56:09.734961+00	7.8913939	-72.4900051	11.5	{"brand": "motorola", "osName": "motorola/cusco_g/cusco:16/W1UU36H.21-14-4-1/7a1802-3172a:user/release-keys", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "motorola edge 50 fusion", "osVersion": "16", "validationWarnings": []}	\N	2026-02-28 02:56:09.734961+00	\N
5e3851a7-513d-41ce-8d0c-7dea10ef83f8	21c92791-e683-4157-a98e-4ca692ee8ce8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-28 02:59:36.120925+00	7.8914528	-72.4899672	5.0	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:14/UP1A.231005.007/A556EXXU6AYB2:user/release-keys", "geofence": {"distanceMeters": 14, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "14", "validationWarnings": []}	\N	2026-02-28 02:59:36.120925+00	\N
99ac7d50-0212-4cea-92f6-d4538d5e1d20	4d03b153-c466-4d6b-8fef-d42b80b55ca1	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-28 03:00:25.857765+00	7.8914511	-72.4899850	3.5	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 13, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.2.1", "validationWarnings": []}	\N	2026-02-28 03:00:25.857765+00	\N
392c3a2c-859b-4dec-954d-36f2f5e5d124	127bb6ba-aec8-44f5-bbd3-825fdd6599a9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-28 03:07:32.728403+00	7.8913908	-72.4900248	11.3	{"brand": "Redmi", "osName": "Redmi/ocean_global/ocean:15/AP3A.240905.015.A2/OS2.0.202.0.VHZLMCR:user/release-keys", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "2303ERA42L", "osVersion": "15", "validationWarnings": []}	\N	2026-02-28 03:07:32.728403+00	\N
5931b8e8-1685-4b47-bb59-3b74bccf37bd	ce157dc6-3528-4826-a3c5-a6c415c429f0	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-28 03:08:00.073157+00	7.8914083	-72.4900143	9.0	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14 Pro", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-28 03:08:00.073157+00	\N
a151b403-a84a-4ee7-9e1e-b09ff2693e29	a370641b-d5ad-4d57-8245-d1fbc0de3cc9	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-02-28 04:15:38.788735+00	7.8958283	-72.4944581	3.2	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 15", "osVersion": "18.5", "validationWarnings": []}	\N	2026-02-28 04:15:38.788735+00	\N
3722cea9-86e5-4d0e-8543-c534dee14353	ba9733fb-acda-4848-8717-c423698bc006	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-02-28 04:15:40.057806+00	7.8958496	-72.4944660	4.5	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "18.6.2", "validationWarnings": []}	\N	2026-02-28 04:15:40.057806+00	\N
b93aef8b-b6d6-4668-a36d-c731f83eaf01	12f6a510-3ae9-40de-ad9f-95ce7bf86823	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-02-28 04:16:27.121542+00	7.8958701	-72.4945682	7.1	{"brand": "Redmi", "osName": "Android", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-02-28 04:16:27.121542+00	\N
37537a87-edcc-4e88-8877-10d1e32fa3a4	9b75f26e-cc61-43b6-bde1-d248c3caf0ad	407ccca3-bc35-4252-8998-7280623de78f	check_out	system	2026-02-28 04:59:59+00	7.8917551	-72.4834379	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-02-28 04:59:00.169825+00	\N
561b9dce-c0c8-431d-b316-19798d68208e	5b930b57-2934-4c11-bbc5-9b8e8e67d5ac	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-28 10:59:46.047076+00	7.8913743	-72.4900263	11.5	{"brand": "OPPO", "osName": "Android", "geofence": {"distanceMeters": 3, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "CPH2577", "osVersion": "15", "validationWarnings": []}	\N	2026-02-28 10:59:46.047076+00	\N
ea7190f3-4255-453d-8e33-25fa8486cb99	18e90fdd-3042-47a2-aac3-e02bb1752278	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-28 11:03:12.761943+00	7.8913716	-72.4899804	7.8	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:16/BP2A.250605.031.A3/A556EXXUACYIA:user/release-keys", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "16", "validationWarnings": []}	\N	2026-02-28 11:03:12.761943+00	\N
73fa32d8-1c0d-45d5-a600-bd4ea7a0c842	178878fb-2d72-417d-8740-e9e2543a02fd	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-28 11:16:22.934806+00	7.8917689	-72.4835023	8.2	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16 Pro Max", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-28 11:16:22.934806+00	\N
e0b2a9af-b7f8-4abb-a993-9b847454c39a	ad3e2c03-6ad3-4476-a2fa-30c74e96fea8	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-28 11:19:03.964055+00	7.8917072	-72.4835249	5.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 11, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14", "osVersion": "18.5", "validationWarnings": []}	\N	2026-02-28 11:19:03.964055+00	\N
65a446da-4515-47ef-a4b8-b9f25fcdd3a1	ca3db823-72fd-46b1-946e-8c10bb1b9eb8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-28 11:44:40.017352+00	7.8913826	-72.4899959	3.8	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-28 11:44:40.017352+00	\N
9fed912a-5745-49b9-bf9e-8a60bc4cbf00	71e4d936-7821-4d41-8e5e-9a5a41a9bf09	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-02-28 11:49:18.290573+00	7.8917304	-72.4834401	8.0	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:15/AP3A.240905.015.A2/A556EXXU7BYDB:user/release-keys", "geofence": {"distanceMeters": 3, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "15", "validationWarnings": []}	\N	2026-02-28 11:49:18.290573+00	\N
cbcdebaa-e389-4e85-b188-d9209143e0e4	2ba2357d-4b66-4145-b62f-73587f82af6f	59de8039-239a-4791-a20c-c2e7fe2344d3	check_in	mobile	2026-02-28 12:15:57.829447+00	\N	\N	\N	\N	\N	2026-02-28 12:15:57.829447+00	\N
beed8260-50fb-4ca5-9874-c0b51649088d	a370641b-d5ad-4d57-8245-d1fbc0de3cc9	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-02-28 15:56:55.772791+00	7.8958823	-72.4945324	5.0	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 4, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 15", "osVersion": "18.5", "validationWarnings": []}	\N	2026-02-28 15:56:55.772791+00	\N
11f4636b-da9a-4808-bf32-55f88173e428	ba9733fb-acda-4848-8717-c423698bc006	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-02-28 17:04:53.95103+00	7.8959390	-72.4945435	4.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "18.6.2", "validationWarnings": []}	\N	2026-02-28 17:04:53.95103+00	\N
934355dc-52a0-4fcb-a448-47e29f8550f4	12f6a510-3ae9-40de-ad9f-95ce7bf86823	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-02-28 17:05:19.405753+00	7.8958326	-72.4944668	8.1	{"brand": "Redmi", "osName": "Android", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-02-28 17:05:19.405753+00	\N
5cdf925f-e5c3-430e-98d0-d54dbc7a93f8	ce157dc6-3528-4826-a3c5-a6c415c429f0	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-28 18:55:03.42173+00	7.8914159	-72.4899818	3.6	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14 Pro", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-28 18:55:03.42173+00	\N
0a7f39b8-e714-490a-8918-72f4fe224ed0	127bb6ba-aec8-44f5-bbd3-825fdd6599a9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-28 18:59:11.611075+00	7.8913834	-72.4900316	11.4	{"brand": "Redmi", "osName": "Redmi/ocean_global/ocean:15/AP3A.240905.015.A2/OS2.0.202.0.VHZLMCR:user/release-keys", "geofence": {"distanceMeters": 4, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "2303ERA42L", "osVersion": "15", "validationWarnings": []}	\N	2026-02-28 18:59:11.611075+00	\N
0778016c-0586-4cd3-a737-cb99a14abb0e	21c92791-e683-4157-a98e-4ca692ee8ce8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-28 19:00:18.89+00	7.8914050	-72.4900423	11.4	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:14/UP1A.231005.007/A556EXXU6AYB2:user/release-keys", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "14", "validationWarnings": []}	\N	2026-02-28 19:00:18.89+00	\N
25150a64-e8a3-4fc6-b1aa-844d91e1e0ac	18e90fdd-3042-47a2-aac3-e02bb1752278	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-28 19:13:01.61827+00	7.8914040	-72.4900495	11.3	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:16/BP2A.250605.031.A3/A556EXXUACYIA:user/release-keys", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "16", "validationWarnings": []}	\N	2026-02-28 19:13:01.61827+00	\N
b68b37c9-3cb5-43cf-8561-7e16d8f506bc	5b930b57-2934-4c11-bbc5-9b8e8e67d5ac	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-28 19:24:21.793405+00	7.8913795	-72.4900339	11.1	{"brand": "OPPO", "osName": "Android", "geofence": {"distanceMeters": 3, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "CPH2577", "osVersion": "15", "validationWarnings": []}	\N	2026-02-28 19:24:21.793405+00	\N
5d750ce1-7db3-40f8-875a-d51e7c908f7a	80324888-621d-4c41-bd59-d42db17e1ea8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-02-28 19:33:25.619371+00	7.8914059	-72.4900163	8.5	{"brand": "motorola", "osName": "motorola/cusco_g/cusco:16/W1UU36H.21-14-4-1/7a1802-3172a:user/release-keys", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "motorola edge 50 fusion", "osVersion": "16", "validationWarnings": []}	\N	2026-02-28 19:33:25.619371+00	\N
46d264bc-914d-43c0-a8fa-bf5a4f402b98	71e4d936-7821-4d41-8e5e-9a5a41a9bf09	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-02-28 20:16:14.015819+00	7.8917826	-72.4835066	13.5	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:15/AP3A.240905.015.A2/A556EXXU7BYDB:user/release-keys", "geofence": {"distanceMeters": 8, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "15", "validationWarnings": []}	\N	2026-02-28 20:16:14.015819+00	\N
93fb6195-2386-4cec-9f69-2fb3d5acb36e	178878fb-2d72-417d-8740-e9e2543a02fd	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-02-28 20:17:36.192716+00	7.8918355	-72.4836140	8.2	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 21, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16 Pro Max", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-28 20:17:36.192716+00	\N
cb867133-7fc6-4607-9c85-9263513e580f	ca3db823-72fd-46b1-946e-8c10bb1b9eb8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-02-28 20:24:15.859046+00	7.8914118	-72.4899993	4.1	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 8, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16", "osVersion": "26.3", "validationWarnings": []}	\N	2026-02-28 20:24:15.859046+00	\N
c8d42daa-ace8-49dd-aaa6-32691918a2c3	f526fbf0-90f4-4b75-b06e-2c12f692f7f9	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-02-28 22:10:55.472681+00	7.8958995	-72.4944817	5.0	{"brand": "vivo", "osName": "Android", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "V2247", "osVersion": "15", "validationWarnings": []}	\N	2026-02-28 22:10:55.472681+00	\N
b4e03ae5-0371-44df-962c-e4922f10e3a2	80324888-621d-4c41-bd59-d42db17e1ea8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-01 02:48:44.825085+00	7.8915133	-72.4899493	6.0	{"brand": "motorola", "osName": "motorola/cusco_g/cusco:16/W1UU36H.21-14-4-1/7a1802-3172a:user/release-keys", "geofence": {"distanceMeters": 21, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "motorola edge 50 fusion", "osVersion": "16", "validationWarnings": []}	\N	2026-03-01 02:48:44.825085+00	\N
342a792b-92eb-4d89-bc85-070e15249102	21c92791-e683-4157-a98e-4ca692ee8ce8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-01 03:02:01.183293+00	7.8913900	-72.4900312	11.4	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:14/UP1A.231005.007/A556EXXU6AYB2:user/release-keys", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "14", "validationWarnings": []}	\N	2026-03-01 03:02:01.183293+00	\N
d23788bf-3073-40b7-9d9f-145f895a1efc	127bb6ba-aec8-44f5-bbd3-825fdd6599a9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-01 03:27:19.455744+00	7.8913994	-72.4900220	11.4	{"brand": "Redmi", "osName": "Redmi/ocean_global/ocean:15/AP3A.240905.015.A2/OS2.0.202.0.VHZLMCR:user/release-keys", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "2303ERA42L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-01 03:27:19.455744+00	\N
2815430d-7197-4001-9675-bea106626f27	ce157dc6-3528-4826-a3c5-a6c415c429f0	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-01 03:38:19.920625+00	7.8913928	-72.4899493	3.9	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 11, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14 Pro", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-01 03:38:19.920625+00	\N
2ad9d390-4296-4547-8720-d85f2e9532bf	a370641b-d5ad-4d57-8245-d1fbc0de3cc9	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-03-01 04:07:03.949061+00	7.8958532	-72.4944289	3.5	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 15", "osVersion": "18.5", "validationWarnings": []}	\N	2026-03-01 04:07:03.949061+00	\N
85d8e2bc-cd4d-4a9b-a474-43610e5277a2	f526fbf0-90f4-4b75-b06e-2c12f692f7f9	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-03-01 04:11:09.097438+00	7.8958644	-72.4944529	7.2	{"brand": "vivo", "osName": "Android", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "V2247", "osVersion": "15", "validationWarnings": []}	\N	2026-03-01 04:11:09.097438+00	\N
c779902d-a086-4553-8fa5-31dd0c7658ab	f526fbf0-90f4-4b75-b06e-2c12f692f7f9	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-03-01 04:11:28.447443+00	7.8958804	-72.4944493	3.8	{"brand": "vivo", "osName": "Android", "geofence": {"distanceMeters": 8, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "V2247", "osVersion": "15", "validationWarnings": []}	\N	2026-03-01 04:11:28.447443+00	\N
22d63f08-f797-415d-8094-7849216931af	ba9733fb-acda-4848-8717-c423698bc006	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-03-01 04:13:03.711529+00	7.8958549	-72.4944460	4.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 8, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "18.6.2", "validationWarnings": []}	\N	2026-03-01 04:13:03.711529+00	\N
5dff75ee-0f01-4b54-a163-31256a481122	12f6a510-3ae9-40de-ad9f-95ce7bf86823	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-03-01 04:13:46.195862+00	7.8958341	-72.4944590	12.1	{"brand": "Redmi", "osName": "Android", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-01 04:13:46.195862+00	\N
e34451c7-74c1-452f-bd25-a2afa7870101	2ba2357d-4b66-4145-b62f-73587f82af6f	59de8039-239a-4791-a20c-c2e7fe2344d3	check_out	system	2026-03-01 04:59:59+00	\N	\N	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-01 04:59:00.164955+00	\N
70a4dc1c-01b3-438a-bc58-1bbb05183379	ad3e2c03-6ad3-4476-a2fa-30c74e96fea8	407ccca3-bc35-4252-8998-7280623de78f	check_out	system	2026-03-01 04:59:59+00	7.8917551	-72.4834379	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-01 04:59:00.164955+00	\N
b697e8d1-4056-47d5-a75d-6d7dc65859a2	f526fbf0-90f4-4b75-b06e-2c12f692f7f9	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	system	2026-03-01 04:59:59+00	7.8958506	-72.4945188	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-01 04:59:00.164955+00	\N
caf5a0a1-0520-4abc-8165-1a6c7d236d54	5b930b57-2934-4c11-bbc5-9b8e8e67d5ac	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-01 11:57:14.472516+00	7.8913889	-72.4900288	11.5	{"brand": "OPPO", "osName": "Android", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "CPH2577", "osVersion": "15", "validationWarnings": []}	\N	2026-03-01 11:57:14.472516+00	\N
9148fc5f-0864-44fe-aa8d-1b4e6446de11	18e90fdd-3042-47a2-aac3-e02bb1752278	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-01 11:59:49.241051+00	7.8912994	-72.4899698	17.6	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:16/BP2A.250605.031.A3/A556EXXUACYIA:user/release-keys", "geofence": {"distanceMeters": 9, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "16", "validationWarnings": []}	\N	2026-03-01 11:59:49.241051+00	\N
6d8a7d7b-fd27-4fd8-9325-1336bd4ee48f	4d03b153-c466-4d6b-8fef-d42b80b55ca1	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-01 12:00:26.069198+00	7.8914386	-72.4899911	7.5	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 11, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.2.1", "validationWarnings": []}	\N	2026-03-01 12:00:26.069198+00	\N
d207c558-80c0-4dde-8152-0daab9144209	ca3db823-72fd-46b1-946e-8c10bb1b9eb8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-01 12:00:44.057449+00	7.8913919	-72.4899744	3.5	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 8, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-01 12:00:44.057449+00	\N
331bdc5c-050c-4245-bd0c-cc67a75a5daf	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-01 12:05:52.217321+00	7.8915400	-72.4898950	1.9	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 26, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-03-01 12:05:52.217321+00	\N
ebe042da-a0d2-42fc-a73e-83a599a01e85	f526fbf0-90f4-4b75-b06e-2c12f692f7f9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-01 13:08:29.198367+00	7.8913561	-72.4900212	14.2	{"brand": "vivo", "osName": "Android", "geofence": {"distanceMeters": 2, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "V2247", "osVersion": "15", "validationWarnings": []}	\N	2026-03-01 13:08:29.198367+00	\N
1cdc1033-b6e3-4460-8001-5a34c995d423	12f6a510-3ae9-40de-ad9f-95ce7bf86823	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-03-01 16:38:43.928222+00	7.8958310	-72.4944646	9.3	{"brand": "Redmi", "osName": "Android", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-01 16:38:43.928222+00	\N
cf2e9eec-ef39-4dc8-ab60-01722fab72e5	ba9733fb-acda-4848-8717-c423698bc006	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-03-01 17:18:39.206808+00	7.8958940	-72.4945149	5.9	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "18.6.2", "validationWarnings": []}	\N	2026-03-01 17:18:39.206808+00	\N
1ee33e77-a37e-41ba-b76c-04ef4cd882c2	21c92791-e683-4157-a98e-4ca692ee8ce8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-01 18:00:16.544568+00	7.8913944	-72.4900410	11.5	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:14/UP1A.231005.007/A556EXXU6AYB2:user/release-keys", "geofence": {"distanceMeters": 9, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "14", "validationWarnings": []}	\N	2026-03-01 18:00:16.544568+00	\N
839cecfa-3522-439b-a2f6-f2f511fc82a9	ce157dc6-3528-4826-a3c5-a6c415c429f0	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-01 18:51:45.973303+00	7.8915149	-72.4899674	2.6	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 25, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14 Pro", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-01 18:51:45.973303+00	\N
2d003564-ca86-491c-b899-5d3dd5e16f50	127bb6ba-aec8-44f5-bbd3-825fdd6599a9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-01 19:01:18.565659+00	7.8913919	-72.4900208	11.4	{"brand": "Redmi", "osName": "Redmi/ocean_global/ocean:15/AP3A.240905.015.A2/OS2.0.202.0.VHZLMCR:user/release-keys", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "2303ERA42L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-01 19:01:18.565659+00	\N
8c3e2fd2-eadb-4fc5-addd-66e84ff54458	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-01 19:05:54.612968+00	7.8913901	-72.4900053	11.5	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 11, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-03-01 19:05:54.612968+00	\N
b1fadaa6-a9f0-4cda-a3da-8094cf1ef2ef	f526fbf0-90f4-4b75-b06e-2c12f692f7f9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-01 19:24:30.219926+00	7.8914304	-72.4899549	5.5	{"brand": "vivo", "osName": "Android", "geofence": {"distanceMeters": 19, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "V2247", "osVersion": "15", "validationWarnings": []}	\N	2026-03-01 19:24:30.219926+00	\N
cd9c8d76-619d-41e8-9d7e-b6b44f83fc4e	ca3db823-72fd-46b1-946e-8c10bb1b9eb8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-01 19:27:30.428231+00	7.8914645	-72.4899916	4.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 19, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-01 19:27:30.428231+00	\N
3356a500-d44b-4e49-9f6e-13f846ad4f00	5b930b57-2934-4c11-bbc5-9b8e8e67d5ac	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-01 19:46:41.327254+00	7.8915014	-72.4900155	2.2	{"brand": "OPPO", "osName": "Android", "geofence": {"distanceMeters": 21, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "CPH2577", "osVersion": "15", "validationWarnings": []}	\N	2026-03-01 19:46:41.327254+00	\N
c69f49e6-fad7-47dc-8363-0a345ef8ee12	a370641b-d5ad-4d57-8245-d1fbc0de3cc9	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-03-01 21:03:47.794353+00	7.8959795	-72.4945476	4.9	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 15, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 15", "osVersion": "18.5", "validationWarnings": []}	\N	2026-03-01 21:03:47.794353+00	\N
9fbfda41-3c18-4297-a7e4-d8174f91cc39	f526fbf0-90f4-4b75-b06e-2c12f692f7f9	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-03-01 23:00:13.148961+00	7.8958566	-72.4945205	8.5	{"brand": "vivo", "osName": "Android", "geofence": {"distanceMeters": 1, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "V2247", "osVersion": "15", "validationWarnings": []}	\N	2026-03-01 23:00:13.148961+00	\N
e0098c9a-87a0-4f1f-9091-c48e268a63f0	21c92791-e683-4157-a98e-4ca692ee8ce8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-02 02:00:22.41595+00	7.8913729	-72.4899821	13.3	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:14/UP1A.231005.007/A556EXXU6AYB2:user/release-keys", "geofence": {"distanceMeters": 13, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "14", "validationWarnings": []}	\N	2026-03-02 02:00:22.41595+00	\N
818d2d01-2b08-4211-825c-54ba76838204	127bb6ba-aec8-44f5-bbd3-825fdd6599a9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-02 02:05:48.551661+00	7.8914020	-72.4899986	11.5	{"brand": "Redmi", "osName": "Redmi/ocean_global/ocean:15/AP3A.240905.015.A2/OS2.0.202.0.VHZLMCR:user/release-keys", "geofence": {"distanceMeters": 13, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "2303ERA42L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-02 02:05:48.551661+00	\N
bf9f5e25-9035-4b8c-bded-37e5cdf6dea3	a370641b-d5ad-4d57-8245-d1fbc0de3cc9	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-03-02 02:45:29.135431+00	7.8958479	-72.4944903	4.4	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 3, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 15", "osVersion": "18.5", "validationWarnings": []}	\N	2026-03-02 02:45:29.135431+00	\N
28ec14cd-3a25-4593-a6de-43850b999d26	f526fbf0-90f4-4b75-b06e-2c12f692f7f9	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-03-02 02:54:25.611183+00	7.8958581	-72.4945291	14.9	{"brand": "vivo", "osName": "Android", "geofence": {"distanceMeters": 1, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "V2247", "osVersion": "15", "validationWarnings": []}	\N	2026-03-02 02:54:25.611183+00	\N
d1956d8a-4f90-4aad-8e22-eecec9d948a0	ba9733fb-acda-4848-8717-c423698bc006	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-03-02 03:11:20.192288+00	7.8958537	-72.4946098	9.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-02 03:11:20.192288+00	\N
becd2de7-eea5-4077-b2c1-93c6cffb4eaa	12f6a510-3ae9-40de-ad9f-95ce7bf86823	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-03-02 03:16:56.846136+00	7.8958467	-72.4944433	11.5	{"brand": "Redmi", "osName": "Android", "geofence": {"distanceMeters": 8, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-02 03:16:56.846136+00	\N
8c7c0526-3618-4a72-a4bc-ef63b2cd7462	18e90fdd-3042-47a2-aac3-e02bb1752278	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	system	2026-03-02 04:59:59+00	7.8913256	-72.4900864	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-02 04:59:00.166678+00	\N
ead7fb7d-c2f5-420f-8888-497abd1de9df	4d03b153-c466-4d6b-8fef-d42b80b55ca1	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	system	2026-03-02 04:59:59+00	7.8913256	-72.4900864	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-02 04:59:00.166678+00	\N
4fae7cfc-1976-4c03-8413-1cfc4b71c11c	ce157dc6-3528-4826-a3c5-a6c415c429f0	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	system	2026-03-02 04:59:59+00	7.8913256	-72.4900864	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-02 04:59:00.166678+00	\N
14da7f4e-0fd1-4e1a-a176-42112db74cd2	5b930b57-2934-4c11-bbc5-9b8e8e67d5ac	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-02 10:55:06.938776+00	7.8913668	-72.4900370	11.5	{"brand": "OPPO", "osName": "Android", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "CPH2577", "osVersion": "15", "validationWarnings": []}	\N	2026-03-02 10:55:06.938776+00	\N
a738e606-31ec-443b-8714-71b292bff46c	912ba8a9-b5bf-4cc6-9252-9aefb3780c53	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-02 11:04:08.281867+00	7.8917185	-72.4834564	4.0	{"brand": "samsung", "osName": "samsung/a25xdxx/a25x:16/BP2A.250605.031.A3/A256EXXU8DYI8:user/release-keys", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A256E", "osVersion": "16", "validationWarnings": []}	\N	2026-03-02 11:04:08.281867+00	\N
683f7494-d343-403a-b04f-96d1cb3a2885	ad3e2c03-6ad3-4476-a2fa-30c74e96fea8	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-02 11:15:53.873783+00	7.8916115	-72.4835010	9.2	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 17, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14", "osVersion": "18.5", "validationWarnings": []}	\N	2026-03-02 11:15:53.873783+00	\N
dbe7957f-2a37-41c9-9e94-bef58ad75e51	178878fb-2d72-417d-8740-e9e2543a02fd	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-02 11:21:39.657809+00	7.8917762	-72.4834641	7.3	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 4, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16 Pro Max", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-02 11:21:39.657809+00	\N
b87fa176-e594-41d8-9b31-965aabda85b3	21c92791-e683-4157-a98e-4ca692ee8ce8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-02 11:25:40.83136+00	7.8913803	-72.4899953	12.2	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:14/UP1A.231005.007/A556EXXU6AYB2:user/release-keys", "geofence": {"distanceMeters": 12, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "14", "validationWarnings": []}	\N	2026-03-02 11:25:40.83136+00	\N
9986f00b-4e70-409b-ae08-1394f9d742f0	80324888-621d-4c41-bd59-d42db17e1ea8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-02 11:30:22.896602+00	7.8913832	-72.4899779	4.4	{"brand": "motorola", "osName": "motorola/cusco_g/cusco:16/W1UU36H.21-14-4-1/7a1802-3172a:user/release-keys", "geofence": {"distanceMeters": 14, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "motorola edge 50 fusion", "osVersion": "16", "validationWarnings": []}	\N	2026-03-02 11:30:22.896602+00	\N
e599d93c-76d1-4acd-a29d-15f2e98d0130	ca3db823-72fd-46b1-946e-8c10bb1b9eb8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-02 11:55:12.012208+00	7.8914090	-72.4899917	6.6	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 14, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-02 11:55:12.012208+00	\N
a8f84b4a-7807-461e-9af3-a8051062abb5	a2b3e826-faa4-4c45-82e1-cdcacbf177f2	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-02 12:58:35.284339+00	7.8916735	-72.4833936	16.8	{"brand": "samsung", "osName": "samsung/r12sxxx/r12s:16/BP2A.250605.031.A3/S721BXXU7CYI5:user/release-keys", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-S721B", "osVersion": "16", "validationWarnings": []}	\N	2026-03-02 12:58:35.284339+00	\N
446dea1c-2528-4c83-b431-c3c3719a534d	71e4d936-7821-4d41-8e5e-9a5a41a9bf09	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-02 13:06:35.188526+00	7.8917429	-72.4835048	6.4	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:15/AP3A.240905.015.A2/A556EXXU7BYDB:user/release-keys", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "15", "validationWarnings": []}	\N	2026-03-02 13:06:35.188526+00	\N
f8a91b80-cf15-4bb6-92e8-aa76adf937fa	127bb6ba-aec8-44f5-bbd3-825fdd6599a9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-02 19:00:28.659938+00	7.8913757	-72.4900259	11.1	{"brand": "Redmi", "osName": "Redmi/ocean_global/ocean:15/AP3A.240905.015.A2/OS2.0.202.0.VHZLMCR:user/release-keys", "geofence": {"distanceMeters": 9, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "2303ERA42L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-02 19:00:28.659938+00	\N
ab6f2046-7ed2-4f5b-af5b-2f3217c31b22	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-02 19:12:48.472665+00	7.8914201	-72.4899777	5.0	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 16, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-03-02 19:12:48.472665+00	\N
f5bf0b49-fe23-4fe4-8c10-c9f1f97d4dd6	4d03b153-c466-4d6b-8fef-d42b80b55ca1	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-02 19:45:08.145777+00	7.8914380	-72.4899924	7.5	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 16, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.2.1", "validationWarnings": []}	\N	2026-03-02 19:45:08.145777+00	\N
353a8599-3533-47d0-8690-2c65b5d65103	5b930b57-2934-4c11-bbc5-9b8e8e67d5ac	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-02 19:46:13.201275+00	7.8914198	-72.4899730	10.8	{"brand": "OPPO", "osName": "Android", "geofence": {"distanceMeters": 16, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "CPH2577", "osVersion": "15", "validationWarnings": []}	\N	2026-03-02 19:46:13.201275+00	\N
1678dd5e-d459-486d-b599-742b78baa551	ca3db823-72fd-46b1-946e-8c10bb1b9eb8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-02 20:08:44.328873+00	7.8914090	-72.4899917	9.8	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 14, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-02 20:08:44.328873+00	\N
56ca9284-082e-41b9-a592-a1324351ee26	912ba8a9-b5bf-4cc6-9252-9aefb3780c53	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-03-02 20:39:03.240682+00	7.8917998	-72.4834350	23.3	{"brand": "samsung", "osName": "samsung/a25xdxx/a25x:16/BP2A.250605.031.A3/A256EXXU8DYI8:user/release-keys", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A256E", "osVersion": "16", "validationWarnings": []}	\N	2026-03-02 20:39:03.240682+00	\N
164b09b4-85f2-444b-ab1f-e8f9ede4f84c	178878fb-2d72-417d-8740-e9e2543a02fd	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-03-02 20:39:08.42579+00	7.8917861	-72.4834748	5.9	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16 Pro Max", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-02 20:39:08.42579+00	\N
0f7f3b9d-c73b-481e-aa82-cf6691057313	ad3e2c03-6ad3-4476-a2fa-30c74e96fea8	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-03-02 20:39:29.162359+00	7.8917493	-72.4835598	3.6	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 13, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14", "osVersion": "18.5", "validationWarnings": []}	\N	2026-03-02 20:39:29.162359+00	\N
e2502fd0-60e2-4794-8b13-5d8ac54c630d	a2b3e826-faa4-4c45-82e1-cdcacbf177f2	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-03-02 21:32:01.59055+00	7.8918126	-72.4834687	11.1	{"brand": "samsung", "osName": "samsung/r12sxxx/r12s:16/BP2A.250605.031.A3/S721BXXU7CYI5:user/release-keys", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-S721B", "osVersion": "16", "validationWarnings": []}	\N	2026-03-02 21:32:01.59055+00	\N
a3235999-6830-4260-81ff-046e3980037d	71e4d936-7821-4d41-8e5e-9a5a41a9bf09	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-03-02 21:32:26.577692+00	7.8918551	-72.4835023	14.5	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:15/AP3A.240905.015.A2/A556EXXU7BYDB:user/release-keys", "geofence": {"distanceMeters": 13, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "15", "validationWarnings": []}	\N	2026-03-02 21:32:26.577692+00	\N
f916b115-a7e6-43c2-bc68-a56e8ab0a06d	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-03 03:07:37.643981+00	7.8914733	-72.4900400	7.6	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 17, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-03-03 03:07:37.643981+00	\N
e266de4a-b130-4ec7-8f74-e7d65676cd31	127bb6ba-aec8-44f5-bbd3-825fdd6599a9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-03 03:17:08.629262+00	7.8913973	-72.4900227	11.5	{"brand": "Redmi", "osName": "Redmi/ocean_global/ocean:15/AP3A.240905.015.A2/OS2.0.202.0.VHZLMCR:user/release-keys", "geofence": {"distanceMeters": 11, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "2303ERA42L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-03 03:17:08.629262+00	\N
2a396f69-b801-4228-a35c-80d359056a22	21c92791-e683-4157-a98e-4ca692ee8ce8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	system	2026-03-03 04:59:59+00	7.8913256	-72.4900864	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-03 04:59:00.220212+00	\N
7ab41d28-b851-4a17-801e-eb48bd7805ab	4d03b153-c466-4d6b-8fef-d42b80b55ca1	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	system	2026-03-03 04:59:59+00	7.8913256	-72.4900864	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-03 04:59:00.220212+00	\N
3fde54f4-fac1-4c7c-9a0e-7d731ed34d0d	80324888-621d-4c41-bd59-d42db17e1ea8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	system	2026-03-03 04:59:59+00	7.8913256	-72.4900864	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-03 04:59:00.220212+00	\N
9867b5ca-ae0d-44d8-bc9d-d7a493dcc584	5b930b57-2934-4c11-bbc5-9b8e8e67d5ac	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-03 10:59:16.036516+00	7.8913433	-72.4900650	7.2	{"brand": "OPPO", "osName": "Android", "geofence": {"distanceMeters": 3, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "CPH2577", "osVersion": "15", "validationWarnings": []}	\N	2026-03-03 10:59:16.036516+00	\N
b30718b6-3364-4e9e-913b-4c5a7b98cf82	18e90fdd-3042-47a2-aac3-e02bb1752278	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-03 11:02:47.223139+00	7.8913869	-72.4899967	4.7	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:16/BP2A.250605.031.A3/A556EXXUACYIA:user/release-keys", "geofence": {"distanceMeters": 12, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "16", "validationWarnings": []}	\N	2026-03-03 11:02:47.223139+00	\N
6c27da29-fbba-4dc7-96f2-730e2422a6a6	912ba8a9-b5bf-4cc6-9252-9aefb3780c53	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-03 11:04:32.997083+00	7.8917107	-72.4835125	7.5	{"brand": "samsung", "osName": "samsung/a25xdxx/a25x:16/BP2A.250605.031.A3/A256EXXU8DYI8:user/release-keys", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A256E", "osVersion": "16", "validationWarnings": []}	\N	2026-03-03 11:04:32.997083+00	\N
f2610c23-dc34-4af3-91b9-1d692c4142ca	ad3e2c03-6ad3-4476-a2fa-30c74e96fea8	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-03 11:13:49.195538+00	7.8917515	-72.4835335	4.4	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 11, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14", "osVersion": "18.5", "validationWarnings": []}	\N	2026-03-03 11:13:49.195538+00	\N
d111db87-ac65-49c7-a513-c7ba07a3e554	178878fb-2d72-417d-8740-e9e2543a02fd	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-03 11:19:08.328967+00	7.8917627	-72.4834660	9.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 3, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16 Pro Max", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-03 11:19:08.328967+00	\N
9cd020cc-ce3e-47ce-a274-93262930e92d	21c92791-e683-4157-a98e-4ca692ee8ce8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-03 11:30:56.455144+00	7.8913894	-72.4900243	11.5	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:14/UP1A.231005.007/A556EXXU6AYB2:user/release-keys", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "14", "validationWarnings": []}	\N	2026-03-03 11:30:56.455144+00	\N
a3569479-f775-4ab4-b305-b011756cb491	a95939bb-6f36-4826-8101-237e358bb12d	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-03 11:37:25.494924+00	7.8913924	-72.4900168	7.4	{"brand": "vivo", "osName": "Android", "geofence": {"distanceMeters": 11, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "V2436", "osVersion": "15", "validationWarnings": []}	\N	2026-03-03 11:37:25.494924+00	\N
0947328c-692f-4867-84b6-07feb0240f0e	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-03 11:46:53.251702+00	7.8913882	-72.4899665	6.3	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 15, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-03-03 11:46:53.251702+00	\N
90c532a8-a1fe-4593-8ea2-35c37eaebdb3	a2b3e826-faa4-4c45-82e1-cdcacbf177f2	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-03 12:58:51.217808+00	7.8917908	-72.4834475	9.7	{"brand": "samsung", "osName": "samsung/r12sxxx/r12s:16/BP2A.250605.031.A3/S721BXXU7CYI5:user/release-keys", "geofence": {"distanceMeters": 4, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-S721B", "osVersion": "16", "validationWarnings": []}	\N	2026-03-03 12:58:51.217808+00	\N
608291f4-0550-4007-830c-3bbe201b4139	c43c5eeb-6ed9-4808-b174-fe0fbfc738d6	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-03 13:06:44.124728+00	7.8916911	-72.4835034	3.8	{"brand": "Redmi", "osName": "Android", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-03 13:06:44.124728+00	\N
ceebd257-54a9-46ea-a8a1-1c78cbba1f53	ba9733fb-acda-4848-8717-c423698bc006	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-03-03 15:33:36.3649+00	7.8958629	-72.4945452	10.0	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 3, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-03 15:33:36.3649+00	\N
1bae10b5-561c-4225-94aa-9df1dcdd03aa	12f6a510-3ae9-40de-ad9f-95ce7bf86823	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-03-03 15:34:48.55382+00	7.8958372	-72.4944551	10.2	{"brand": "Redmi", "osName": "Android", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-03 15:34:48.55382+00	\N
fd8e94bd-ad51-4a4a-bd9f-e816abc75a26	71e4d936-7821-4d41-8e5e-9a5a41a9bf09	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-03 15:36:25.212447+00	7.8917718	-72.4835364	10.3	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:15/AP3A.240905.015.A2/A556EXXU7BYDB:user/release-keys", "geofence": {"distanceMeters": 11, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "15", "validationWarnings": []}	\N	2026-03-03 15:36:25.212447+00	\N
db1e813c-65a0-4634-9f47-7c5ffce5cad9	ce157dc6-3528-4826-a3c5-a6c415c429f0	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-03 18:52:14.835433+00	7.8914439	-72.4900241	5.8	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 15, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14 Pro", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-03 18:52:14.835433+00	\N
c6ac0a3b-ea2e-4716-b7e1-7d82882edbf8	127bb6ba-aec8-44f5-bbd3-825fdd6599a9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-03 19:00:53.918143+00	7.8913992	-72.4900297	11.5	{"brand": "Redmi", "osName": "Redmi/ocean_global/ocean:15/AP3A.240905.015.A2/OS2.0.202.0.VHZLMCR:user/release-keys", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "2303ERA42L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-03 19:00:53.918143+00	\N
1d64a80a-eec4-4b52-a9ff-b5ccd202a5ab	18e90fdd-3042-47a2-aac3-e02bb1752278	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-03 19:05:30.9969+00	7.8913532	-72.4900068	11.5	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:16/BP2A.250605.031.A3/A556EXXUACYIA:user/release-keys", "geofence": {"distanceMeters": 9, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "16", "validationWarnings": []}	\N	2026-03-03 19:05:30.9969+00	\N
e86267d4-fe3f-453a-9e49-044580bac8ec	5b930b57-2934-4c11-bbc5-9b8e8e67d5ac	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-03 19:26:44.257341+00	7.8913879	-72.4900307	11.5	{"brand": "OPPO", "osName": "Android", "geofence": {"distanceMeters": 9, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "CPH2577", "osVersion": "15", "validationWarnings": []}	\N	2026-03-03 19:26:44.257341+00	\N
d253743d-41e0-46e5-a584-24f9251a906a	4d03b153-c466-4d6b-8fef-d42b80b55ca1	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-03 19:36:31.080335+00	7.8914377	-72.4899933	7.4	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 16, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.2.1", "validationWarnings": []}	\N	2026-03-03 19:36:31.080335+00	\N
4b047b45-68ba-4509-a8d1-d1abeee0539b	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-03 20:24:20.920676+00	7.8913918	-72.4899927	11.5	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 13, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-03-03 20:24:20.920676+00	\N
c29e1420-3dcd-41bf-b4d9-a714bc199ef4	c43c5eeb-6ed9-4808-b174-fe0fbfc738d6	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-03-03 21:34:33.808979+00	7.8917928	-72.4835134	11.2	{"brand": "Redmi", "osName": "Android", "geofence": {"distanceMeters": 9, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-03 21:34:33.808979+00	\N
f72b9a3b-cc03-46f9-819a-bea78ea7f4fb	a2b3e826-faa4-4c45-82e1-cdcacbf177f2	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-03-03 21:52:40.364695+00	7.8918166	-72.4834564	13.8	{"brand": "samsung", "osName": "samsung/r12sxxx/r12s:16/BP2A.250605.031.A3/S721BXXU7CYI5:user/release-keys", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-S721B", "osVersion": "16", "validationWarnings": []}	\N	2026-03-03 21:52:40.364695+00	\N
17ff31c1-a44d-413d-99fc-45846374d845	71e4d936-7821-4d41-8e5e-9a5a41a9bf09	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-03-04 00:00:20.305483+00	7.8917938	-72.4833771	7.6	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:15/AP3A.240905.015.A2/A556EXXU7BYDB:user/release-keys", "geofence": {"distanceMeters": 8, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "15", "validationWarnings": []}	\N	2026-03-04 00:00:20.305483+00	\N
f6cc6dc2-e24e-4849-b84a-a3965c9e844d	ba9733fb-acda-4848-8717-c423698bc006	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-03-04 02:53:47.173669+00	7.8959232	-72.4944964	4.6	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 8, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-04 02:53:47.173669+00	\N
fda6483e-c3e2-47d4-b9de-e2d1d7161f8d	12f6a510-3ae9-40de-ad9f-95ce7bf86823	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-03-04 02:53:59.116276+00	7.8959043	-72.4945005	9.2	{"brand": "Redmi", "osName": "Android", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-04 02:53:59.116276+00	\N
42beb6e9-aac5-4f0b-ac6f-32f217edbdf1	ca3db823-72fd-46b1-946e-8c10bb1b9eb8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-04 03:06:39.304709+00	7.8914944	-72.4900497	9.9	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 19, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-04 03:06:39.304709+00	\N
32a57de1-318c-48ac-a497-194ab3790ec8	ca3db823-72fd-46b1-946e-8c10bb1b9eb8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-04 03:06:46.417593+00	7.8915212	-72.4899869	3.5	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 24, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-04 03:06:46.417593+00	\N
14217aba-0dbb-49ca-8499-be4bbb5e4f70	127bb6ba-aec8-44f5-bbd3-825fdd6599a9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-04 03:11:01.69381+00	7.8914021	-72.4900135	11.4	{"brand": "Redmi", "osName": "Redmi/ocean_global/ocean:15/AP3A.240905.015.A2/OS2.0.202.0.VHZLMCR:user/release-keys", "geofence": {"distanceMeters": 12, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "2303ERA42L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-04 03:11:01.69381+00	\N
aca1378c-1b58-488c-a4b7-de7f874c7d4b	ce157dc6-3528-4826-a3c5-a6c415c429f0	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-04 03:11:13.423954+00	7.8914029	-72.4899034	7.9	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 22, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14 Pro", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-04 03:11:13.423954+00	\N
35b851a0-b75b-4c14-9bb8-18c02c920b32	178878fb-2d72-417d-8740-e9e2543a02fd	407ccca3-bc35-4252-8998-7280623de78f	check_out	system	2026-03-04 04:59:59+00	7.8917551	-72.4834379	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-04 04:59:00.19736+00	\N
e246d489-07b2-4f8a-81a7-3d01189ef26f	21c92791-e683-4157-a98e-4ca692ee8ce8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	system	2026-03-04 04:59:59+00	7.8913256	-72.4900864	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-04 04:59:00.19736+00	\N
40c44337-a1cb-4a04-b381-ecf5e623cf30	4d03b153-c466-4d6b-8fef-d42b80b55ca1	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	system	2026-03-04 04:59:59+00	7.8913256	-72.4900864	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-04 04:59:00.19736+00	\N
5558bbe4-362f-4d7a-8a3d-e0a1e69795b2	912ba8a9-b5bf-4cc6-9252-9aefb3780c53	407ccca3-bc35-4252-8998-7280623de78f	check_out	system	2026-03-04 04:59:59+00	7.8917551	-72.4834379	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-04 04:59:00.19736+00	\N
6649c312-e3f5-4b65-8949-bf82adfc7f6f	a95939bb-6f36-4826-8101-237e358bb12d	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	system	2026-03-04 04:59:59+00	7.8913256	-72.4900864	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-04 04:59:00.19736+00	\N
c9008cb9-2d81-4922-9c4d-bf71f4eaa001	ad3e2c03-6ad3-4476-a2fa-30c74e96fea8	407ccca3-bc35-4252-8998-7280623de78f	check_out	system	2026-03-04 04:59:59+00	7.8917551	-72.4834379	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-04 04:59:00.19736+00	\N
e79fbe48-abc5-4c45-9456-c974952d088c	18e90fdd-3042-47a2-aac3-e02bb1752278	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-04 11:03:16.193475+00	7.8913402	-72.4899760	8.7	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:16/BP2A.250605.031.A3/A556EXXUACYIA:user/release-keys", "geofence": {"distanceMeters": 12, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "16", "validationWarnings": []}	\N	2026-03-04 11:03:16.193475+00	\N
4f43e48a-4af8-460c-a663-a4cb736cb21b	ad3e2c03-6ad3-4476-a2fa-30c74e96fea8	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-04 11:05:29.079344+00	7.8917552	-72.4834983	9.9	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14", "osVersion": "18.5", "validationWarnings": []}	\N	2026-03-04 11:05:29.079344+00	\N
9a1fd2a6-65cb-42c6-8e1d-5bea071e44d9	f526fbf0-90f4-4b75-b06e-2c12f692f7f9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-04 11:06:12.697255+00	7.8913705	-72.4899725	5.5	{"brand": "vivo", "osName": "Android", "geofence": {"distanceMeters": 14, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "V2247", "osVersion": "15", "validationWarnings": []}	\N	2026-03-04 11:06:12.697255+00	\N
dbc5567c-4351-4e93-9702-38a596d1ef27	21c92791-e683-4157-a98e-4ca692ee8ce8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-04 11:20:55.142801+00	7.8913482	-72.4899473	5.4	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:14/UP1A.231005.007/A556EXXU6AYB2:user/release-keys", "geofence": {"distanceMeters": 16, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "14", "validationWarnings": []}	\N	2026-03-04 11:20:55.142801+00	\N
3c623a07-9a58-4b8e-b32b-fd4f9cdb2f8f	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-04 11:39:46.258918+00	7.8913683	-72.4899750	2.6	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 13, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-03-04 11:39:46.258918+00	\N
3978ec44-90fc-42c6-88dd-667f7ebcc8e7	80324888-621d-4c41-bd59-d42db17e1ea8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-04 11:39:50.954515+00	7.8913976	-72.4900200	13.4	{"brand": "motorola", "osName": "motorola/cusco_g/cusco:16/W1UU36H.21-14-4-1/7a1802-3172a:user/release-keys", "geofence": {"distanceMeters": 11, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "motorola edge 50 fusion", "osVersion": "16", "validationWarnings": []}	\N	2026-03-04 11:39:50.954515+00	\N
854c43af-c999-45be-b364-e876aa3bb2ca	a2b3e826-faa4-4c45-82e1-cdcacbf177f2	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-04 12:59:40.325856+00	7.8918729	-72.4835096	13.6	{"brand": "samsung", "osName": "samsung/r12sxxx/r12s:16/BP2A.250605.031.A3/S721BXXU7CYI5:user/release-keys", "geofence": {"distanceMeters": 15, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-S721B", "osVersion": "16", "validationWarnings": []}	\N	2026-03-04 12:59:40.325856+00	\N
e664114c-8298-4d0d-80d0-dea62b654d1d	71e4d936-7821-4d41-8e5e-9a5a41a9bf09	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-04 13:00:34.290244+00	7.8916851	-72.4834978	12.2	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:15/AP3A.240905.015.A2/A556EXXU7BYDB:user/release-keys", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "15", "validationWarnings": []}	\N	2026-03-04 13:00:34.290244+00	\N
e9f01775-e92a-48e7-bf8d-ba60f7361590	c43c5eeb-6ed9-4808-b174-fe0fbfc738d6	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-04 13:01:58.014193+00	7.8917223	-72.4834900	3.8	{"brand": "Redmi", "osName": "Android", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-04 13:01:58.014193+00	\N
85b1ac54-3b8d-4ef7-b973-b1ae97a4ba7f	a370641b-d5ad-4d57-8245-d1fbc0de3cc9	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-03-04 16:02:19.534617+00	7.8959588	-72.4945455	4.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 12, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 15", "osVersion": "18.5", "validationWarnings": []}	\N	2026-03-04 16:02:19.534617+00	\N
1baf9214-02b0-4189-bb10-9e7118da32aa	5b930b57-2934-4c11-bbc5-9b8e8e67d5ac	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-04 18:55:55.896672+00	7.8913910	-72.4900172	12.4	{"brand": "OPPO", "osName": "Android", "geofence": {"distanceMeters": 11, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "CPH2577", "osVersion": "15", "validationWarnings": []}	\N	2026-03-04 18:55:55.896672+00	\N
e35eb2cc-8c4d-401e-92c9-0fb901920ba3	ce157dc6-3528-4826-a3c5-a6c415c429f0	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-04 19:00:21.89384+00	7.8914918	-72.4899653	3.9	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 23, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14 Pro", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-04 19:00:21.89384+00	\N
13e228b2-a642-49ed-a109-127858a05f83	a95939bb-6f36-4826-8101-237e358bb12d	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-04 19:05:11.256319+00	7.8913852	-72.4900197	12.4	{"brand": "vivo", "osName": "Android", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "V2436", "osVersion": "15", "validationWarnings": []}	\N	2026-03-04 19:05:11.256319+00	\N
8c8abb47-1bc7-445c-a3d7-28ddd5a96ee4	21c92791-e683-4157-a98e-4ca692ee8ce8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-04 19:28:38.429289+00	7.8913912	-72.4899948	11.7	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:14/UP1A.231005.007/A556EXXU6AYB2:user/release-keys", "geofence": {"distanceMeters": 12, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "14", "validationWarnings": []}	\N	2026-03-04 19:28:38.429289+00	\N
ed4c3eda-360e-41b1-8382-671f3b98694f	18e90fdd-3042-47a2-aac3-e02bb1752278	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-04 19:34:10.374462+00	7.8913915	-72.4900253	11.4	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:16/BP2A.250605.031.A3/A556EXXUACYIA:user/release-keys", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "16", "validationWarnings": []}	\N	2026-03-04 19:34:10.374462+00	\N
2b69b87a-c0e2-4a6c-bfdf-73a5b2f7d2ad	f526fbf0-90f4-4b75-b06e-2c12f692f7f9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-04 19:51:55.52637+00	7.8913960	-72.4899987	11.5	{"brand": "vivo", "osName": "Android", "geofence": {"distanceMeters": 12, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "V2247", "osVersion": "15", "validationWarnings": []}	\N	2026-03-04 19:51:55.52637+00	\N
1efb9e07-041b-4cb7-bbaa-fabb57ff5d9e	ba9733fb-acda-4848-8717-c423698bc006	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-03-04 20:59:34.177214+00	7.8959108	-72.4945070	9.8	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-04 20:59:34.177214+00	\N
836c1bc8-7691-48e9-a63d-c16a4eef32b4	12f6a510-3ae9-40de-ad9f-95ce7bf86823	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-03-04 21:04:54.591973+00	7.8958433	-72.4944532	11.4	{"brand": "Redmi", "osName": "Redmi/tapas_global/tapas:15/AQ3A.240829.003/OS2.0.204.0.VMTMIXM:user/release-keys", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-04 21:04:54.591973+00	\N
38bdc6c8-e848-4818-a10f-7558d01340f9	a2b3e826-faa4-4c45-82e1-cdcacbf177f2	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-03-04 21:56:07.391713+00	7.8918278	-72.4834496	10.0	{"brand": "samsung", "osName": "samsung/r12sxxx/r12s:16/BP2A.250605.031.A3/S721BXXU7CYI5:user/release-keys", "geofence": {"distanceMeters": 8, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-S721B", "osVersion": "16", "validationWarnings": []}	\N	2026-03-04 21:56:07.391713+00	\N
80e3fcd6-c098-49e2-817d-622dd15c2e12	ad3e2c03-6ad3-4476-a2fa-30c74e96fea8	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-03-05 00:36:02.822946+00	7.8918055	-72.4835278	4.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 11, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14", "osVersion": "18.5", "validationWarnings": []}	\N	2026-03-05 00:36:02.822946+00	\N
9f01ed42-66a2-4dce-9cbf-c002b48a0a3e	178878fb-2d72-417d-8740-e9e2543a02fd	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-05 00:36:34.328534+00	7.8918192	-72.4835576	4.6	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 15, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16 Pro Max", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-05 00:36:34.328534+00	\N
be1ca779-bea2-4a5c-a835-b5707c310732	178878fb-2d72-417d-8740-e9e2543a02fd	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-03-05 00:36:36.01591+00	7.8918168	-72.4835594	4.5	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 15, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16 Pro Max", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-05 00:36:36.01591+00	\N
9b2bd336-6b11-46a9-b025-5d6641b19395	ba9733fb-acda-4848-8717-c423698bc006	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-03-05 02:46:45.240084+00	7.8958920	-72.4944411	9.4	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-05 02:46:45.240084+00	\N
989ba72d-a103-4e77-8482-ee1b9484a18a	a370641b-d5ad-4d57-8245-d1fbc0de3cc9	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-03-05 02:46:56.321072+00	7.8959285	-72.4944821	4.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 15", "osVersion": "18.5", "validationWarnings": []}	\N	2026-03-05 02:46:56.321072+00	\N
0e20aece-0afd-45d5-a390-fe9d5b18f79a	12f6a510-3ae9-40de-ad9f-95ce7bf86823	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-03-05 02:47:50.57662+00	7.8958453	-72.4944612	5.1	{"brand": "Redmi", "osName": "Redmi/tapas_global/tapas:15/AQ3A.240829.003/OS2.0.204.0.VMTMIXM:user/release-keys", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-05 02:47:50.57662+00	\N
fef3be5d-40bd-411e-ba3a-bf8462c51c75	ce157dc6-3528-4826-a3c5-a6c415c429f0	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-05 02:54:58.091099+00	7.8914827	-72.4899992	9.0	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 20, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14 Pro", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-05 02:54:58.091099+00	\N
db0d4c02-5b5e-40c3-aadf-60e6eeff947a	5b930b57-2934-4c11-bbc5-9b8e8e67d5ac	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-05 02:58:20.138286+00	7.8914729	-72.4900265	3.7	{"brand": "OPPO", "osName": "Android", "geofence": {"distanceMeters": 18, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "CPH2577", "osVersion": "15", "validationWarnings": []}	\N	2026-03-05 02:58:20.138286+00	\N
91175be5-b6e0-46ff-b81b-4b1a7136db65	a95939bb-6f36-4826-8101-237e358bb12d	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-05 02:59:25.549901+00	7.8913965	-72.4900290	11.0	{"brand": "vivo", "osName": "Android", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "V2436", "osVersion": "15", "validationWarnings": []}	\N	2026-03-05 02:59:25.549901+00	\N
f85a21a3-77fe-4706-b321-cc7f1ae4ae0b	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	system	2026-03-05 04:59:59+00	7.8913256	-72.4900864	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-05 04:59:00.200889+00	\N
a2e72728-426e-4a7f-8c12-db4a6f18c5a6	71e4d936-7821-4d41-8e5e-9a5a41a9bf09	407ccca3-bc35-4252-8998-7280623de78f	check_out	system	2026-03-05 04:59:59+00	7.8917551	-72.4834379	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-05 04:59:00.200889+00	\N
439e05cd-32bc-4a8f-97e6-36366dbce009	80324888-621d-4c41-bd59-d42db17e1ea8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	system	2026-03-05 04:59:59+00	7.8913256	-72.4900864	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-05 04:59:00.200889+00	\N
4ed845e0-064a-4597-b869-e4731d6cea05	c43c5eeb-6ed9-4808-b174-fe0fbfc738d6	407ccca3-bc35-4252-8998-7280623de78f	check_out	system	2026-03-05 04:59:59+00	7.8917551	-72.4834379	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-05 04:59:00.200889+00	\N
6b65ed74-f14e-46a6-b416-3b63416262d9	cd4883c8-8894-4d94-8e7b-588d3dbab380	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-05 11:02:01.308902+00	7.8914006	-72.4899999	8.4	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 13, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 11", "osVersion": "18.6.2", "validationWarnings": []}	\N	2026-03-05 11:02:01.308902+00	\N
890436ec-31c9-45c2-bc0c-dc934511d573	18e90fdd-3042-47a2-aac3-e02bb1752278	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-05 11:04:48.608006+00	7.8913900	-72.4900107	11.5	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:16/BP2A.250605.031.A3/A556EXXUACYIA:user/release-keys", "geofence": {"distanceMeters": 11, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "16", "validationWarnings": []}	\N	2026-03-05 11:04:48.608006+00	\N
29df82ff-c66d-40f4-aa76-2955ff2494f8	912ba8a9-b5bf-4cc6-9252-9aefb3780c53	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-05 11:05:59.692301+00	7.8917773	-72.4835411	18.1	{"brand": "samsung", "osName": "samsung/a25xdxx/a25x:16/BP2A.250605.031.A3/A256EXXU8DYI8:user/release-keys", "geofence": {"distanceMeters": 12, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A256E", "osVersion": "16", "validationWarnings": []}	\N	2026-03-05 11:05:59.692301+00	\N
f4ae3c44-b47c-49de-a654-78287e7cd0ee	f526fbf0-90f4-4b75-b06e-2c12f692f7f9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-05 11:06:03.193596+00	7.8913567	-72.4900012	9.2	{"brand": "vivo", "osName": "Android", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "V2247", "osVersion": "15", "validationWarnings": []}	\N	2026-03-05 11:06:03.193596+00	\N
db69241e-1edb-4e2e-aeb2-f4e612d269d2	ad3e2c03-6ad3-4476-a2fa-30c74e96fea8	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-05 11:19:50.952528+00	7.8917441	-72.4835335	10.0	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 11, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14", "osVersion": "18.5", "validationWarnings": []}	\N	2026-03-05 11:19:50.952528+00	\N
38bf2b20-9fa2-4a2c-8e9c-632bcfaabcbe	21c92791-e683-4157-a98e-4ca692ee8ce8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-05 11:22:03.100301+00	7.8913911	-72.4900277	8.7	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:14/UP1A.231005.007/A556EXXU6AYB2:user/release-keys", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "14", "validationWarnings": []}	\N	2026-03-05 11:22:03.100301+00	\N
5fa695a6-d22e-4298-bea4-3021d6641b4e	178878fb-2d72-417d-8740-e9e2543a02fd	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-05 11:52:27.486656+00	7.8917580	-72.4835021	2.2	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16 Pro Max", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-05 11:52:27.486656+00	\N
b45b8423-4bf5-4720-8e53-41cf1b550d04	80324888-621d-4c41-bd59-d42db17e1ea8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-05 12:48:57.379249+00	7.8913961	-72.4900346	11.5	{"brand": "motorola", "osName": "motorola/cusco_g/cusco:16/W1UU36H.21-14-4-1/7a1802-3172a:user/release-keys", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "motorola edge 50 fusion", "osVersion": "16", "validationWarnings": []}	\N	2026-03-05 12:48:57.379249+00	\N
aba3ecfb-c185-4c0c-a51b-c6ffffb19d37	a2b3e826-faa4-4c45-82e1-cdcacbf177f2	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-05 12:58:33.805777+00	7.8917364	-72.4834789	3.5	{"brand": "samsung", "osName": "samsung/r12sxxx/r12s:16/BP2A.250605.031.A3/S721BXXU7CYI5:user/release-keys", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-S721B", "osVersion": "16", "validationWarnings": []}	\N	2026-03-05 12:58:33.805777+00	\N
e25b6379-7b7b-4ab6-a5fd-c600b9997e84	71e4d936-7821-4d41-8e5e-9a5a41a9bf09	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-05 13:06:09.94271+00	7.8918184	-72.4834584	10.5	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:15/AP3A.240905.015.A2/A556EXXU7BYDB:user/release-keys", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "15", "validationWarnings": []}	\N	2026-03-05 13:06:09.94271+00	\N
b352932f-27e3-4c2e-8655-52a1ae0bad38	c43c5eeb-6ed9-4808-b174-fe0fbfc738d6	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-05 13:06:31.362189+00	7.8918279	-72.4833873	10.2	{"brand": "Redmi", "osName": "Android", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-05 13:06:31.362189+00	\N
0edef753-86f3-4228-a85f-5c805d454628	a370641b-d5ad-4d57-8245-d1fbc0de3cc9	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-03-05 16:04:06.394887+00	7.8958629	-72.4944639	4.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 15", "osVersion": "18.5", "validationWarnings": []}	\N	2026-03-05 16:04:06.394887+00	\N
d6e6bb05-9936-4639-b143-c2ad87029e54	4d03b153-c466-4d6b-8fef-d42b80b55ca1	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-05 18:20:11.120787+00	7.8914347	-72.4900233	9.2	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 14, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.2.1", "validationWarnings": []}	\N	2026-03-05 18:20:11.120787+00	\N
4a234784-93fc-4d9b-bd1b-9f9d10c6b73a	127bb6ba-aec8-44f5-bbd3-825fdd6599a9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-05 19:01:10.631929+00	7.8913982	-72.4900237	11.5	{"brand": "Redmi", "osName": "Redmi/ocean_global/ocean:15/AP3A.240905.015.A2/OS2.0.202.0.VHZLMCR:user/release-keys", "geofence": {"distanceMeters": 11, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "2303ERA42L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-05 19:01:10.631929+00	\N
21c0063a-785b-42c8-969b-243dff3501af	ce157dc6-3528-4826-a3c5-a6c415c429f0	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-05 19:01:34.337385+00	7.8914874	-72.4899483	4.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 24, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14 Pro", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-05 19:01:34.337385+00	\N
4d0dd11b-cd03-4886-95ef-07aebdb856a5	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-05 19:06:56.58242+00	7.8914439	-72.4899331	4.5	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 21, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-03-05 19:06:56.58242+00	\N
a980b993-97a3-4d3e-b1cf-dfd12878f3cf	cd4883c8-8894-4d94-8e7b-588d3dbab380	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-05 19:07:31.080848+00	7.8914669	-72.4899591	5.5	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 21, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 11", "osVersion": "18.6.2", "validationWarnings": []}	\N	2026-03-05 19:07:31.080848+00	\N
822e0e54-795e-4402-8383-e1b664379cec	f526fbf0-90f4-4b75-b06e-2c12f692f7f9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-05 19:08:06.919571+00	7.8913872	-72.4900225	7.2	{"brand": "vivo", "osName": "Android", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "V2247", "osVersion": "15", "validationWarnings": []}	\N	2026-03-05 19:08:06.919571+00	\N
fe7c7907-452f-46a5-b3fd-631abdaf6ee9	21c92791-e683-4157-a98e-4ca692ee8ce8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-05 19:22:18.669001+00	7.8914031	-72.4900586	19.9	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:14/UP1A.231005.007/A556EXXU6AYB2:user/release-keys", "geofence": {"distanceMeters": 9, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "14", "validationWarnings": []}	\N	2026-03-05 19:22:18.669001+00	\N
eb97a4cc-6221-473e-acb1-40e01aa7d969	ca3db823-72fd-46b1-946e-8c10bb1b9eb8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-05 19:33:48.938105+00	7.8914608	-72.4899115	3.9	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 24, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-05 19:33:48.938105+00	\N
1f421d96-a61d-42b3-9402-1b8ebe6d4a14	ba9733fb-acda-4848-8717-c423698bc006	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-03-05 20:04:24.657135+00	7.8958549	-72.4944264	4.0	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-05 20:04:24.657135+00	\N
eb3690a3-ac74-4d0d-82c7-7d5c5de15409	12f6a510-3ae9-40de-ad9f-95ce7bf86823	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-03-05 21:14:28.101243+00	7.8958673	-72.4944840	10.0	{"brand": "Redmi", "osName": "Redmi/tapas_global/tapas:15/AQ3A.240829.003/OS2.0.204.0.VMTMIXM:user/release-keys", "geofence": {"distanceMeters": 4, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-05 21:14:28.101243+00	\N
274930f1-9ac8-449b-9546-9ba5e3c390c1	c43c5eeb-6ed9-4808-b174-fe0fbfc738d6	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-03-05 21:17:46.790144+00	7.8917239	-72.4835377	7.0	{"brand": "Redmi", "osName": "Android", "geofence": {"distanceMeters": 12, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-05 21:17:46.790144+00	\N
74b44634-6b07-4181-8229-183922bc34d3	71e4d936-7821-4d41-8e5e-9a5a41a9bf09	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-03-05 21:18:26.184151+00	7.8917680	-72.4834810	14.0	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:15/AP3A.240905.015.A2/A556EXXU7BYDB:user/release-keys", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "15", "validationWarnings": []}	\N	2026-03-05 21:18:26.184151+00	\N
506aa189-63e9-4d46-96bf-8547d4c1f398	a2b3e826-faa4-4c45-82e1-cdcacbf177f2	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-03-05 21:55:44.175842+00	7.8917826	-72.4834237	10.4	{"brand": "samsung", "osName": "samsung/r12sxxx/r12s:16/BP2A.250605.031.A3/S721BXXU7CYI5:user/release-keys", "geofence": {"distanceMeters": 3, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-S721B", "osVersion": "16", "validationWarnings": []}	\N	2026-03-05 21:55:44.175842+00	\N
35b6b417-b690-4268-bc2f-c0ee4cd7732d	ad3e2c03-6ad3-4476-a2fa-30c74e96fea8	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-03-06 00:37:40.042967+00	7.8918338	-72.4835323	4.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 14, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14", "osVersion": "18.5", "validationWarnings": []}	\N	2026-03-06 00:37:40.042967+00	\N
cc9ef14c-d1e5-4e74-96c2-2543e979be5f	912ba8a9-b5bf-4cc6-9252-9aefb3780c53	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-03-06 00:38:51.20817+00	7.8917389	-72.4833984	12.5	{"brand": "samsung", "osName": "samsung/a25xdxx/a25x:16/BP2A.250605.031.A3/A256EXXU8DYI8:user/release-keys", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A256E", "osVersion": "16", "validationWarnings": []}	\N	2026-03-06 00:38:51.20817+00	\N
52cc7525-2100-4b22-b2eb-943ba909c34f	178878fb-2d72-417d-8740-e9e2543a02fd	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-03-06 00:38:59.525552+00	7.8917840	-72.4834182	8.6	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 4, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16 Pro Max", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-06 00:38:59.525552+00	\N
349d9ee7-c1dd-418d-98e0-8f50ee7760b7	127bb6ba-aec8-44f5-bbd3-825fdd6599a9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-06 02:58:38.273303+00	7.8913673	-72.4900064	11.7	{"brand": "Redmi", "osName": "Redmi/ocean_global/ocean:15/AP3A.240905.015.A2/OS2.0.202.0.VHZLMCR:user/release-keys", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "2303ERA42L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-06 02:58:38.273303+00	\N
e939a520-9ca1-40e3-842d-a96b56ef29b6	a370641b-d5ad-4d57-8245-d1fbc0de3cc9	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-03-06 03:00:23.156778+00	7.8958846	-72.4944503	3.5	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 8, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 15", "osVersion": "18.5", "validationWarnings": []}	\N	2026-03-06 03:00:23.156778+00	\N
d1efba52-b51b-4cdd-8168-261080866374	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-06 03:03:14.90066+00	7.8914367	-72.4899667	2.1	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 18, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-03-06 03:03:14.90066+00	\N
0b656c1c-4560-41e6-a809-3da1bb204d9b	ce157dc6-3528-4826-a3c5-a6c415c429f0	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-06 03:04:07.723832+00	7.8913978	-72.4899722	9.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 15, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14 Pro", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-06 03:04:07.723832+00	\N
de784c85-28fc-4010-ae3c-f65cf96df88a	ca3db823-72fd-46b1-946e-8c10bb1b9eb8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-06 03:05:10.155045+00	7.8914328	-72.4899767	10.0	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 17, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-06 03:05:10.155045+00	\N
4f14f29c-b341-456b-af95-bae1f000f65e	12f6a510-3ae9-40de-ad9f-95ce7bf86823	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-03-06 03:34:03.582482+00	7.8958538	-72.4944814	4.3	{"brand": "Redmi", "osName": "Redmi/tapas_global/tapas:15/AQ3A.240829.003/OS2.0.204.0.VMTMIXM:user/release-keys", "geofence": {"distanceMeters": 4, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-06 03:34:03.582482+00	\N
e1a3ff9c-0e4f-48f6-98b8-ff03e44858a7	18e90fdd-3042-47a2-aac3-e02bb1752278	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	system	2026-03-06 04:59:59+00	7.8913256	-72.4900864	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-06 04:59:00.187414+00	\N
6c8f7fce-e0dc-4681-b1ff-775d202760ca	4d03b153-c466-4d6b-8fef-d42b80b55ca1	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	system	2026-03-06 04:59:59+00	7.8913256	-72.4900864	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-06 04:59:00.187414+00	\N
b7eb1356-07c5-4191-bde2-b9d03df1aba5	80324888-621d-4c41-bd59-d42db17e1ea8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	system	2026-03-06 04:59:59+00	7.8913256	-72.4900864	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-06 04:59:00.187414+00	\N
d89a96de-c389-460e-847d-fdfcbbbed29b	ba9733fb-acda-4848-8717-c423698bc006	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	system	2026-03-06 04:59:59+00	7.8958506	-72.4945188	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-06 04:59:00.187414+00	\N
51034dc9-d7fd-42a7-9564-5ada6e645176	5b930b57-2934-4c11-bbc5-9b8e8e67d5ac	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-06 10:51:06.32722+00	7.8913811	-72.4900111	11.7	{"brand": "OPPO", "osName": "Android", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "CPH2577", "osVersion": "15", "validationWarnings": []}	\N	2026-03-06 10:51:06.32722+00	\N
b4fc7fef-6b11-4775-9d71-87928ff99533	18e90fdd-3042-47a2-aac3-e02bb1752278	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-06 11:00:41.580252+00	7.8913633	-72.4900345	12.7	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:16/BP2A.250605.031.A3/A556EXXUACYIA:user/release-keys", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "16", "validationWarnings": []}	\N	2026-03-06 11:00:41.580252+00	\N
85666693-2be9-4c7e-93ef-fe773b32c432	912ba8a9-b5bf-4cc6-9252-9aefb3780c53	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-06 11:07:46.20856+00	7.8916999	-72.4835180	11.3	{"brand": "samsung", "osName": "samsung/a25xdxx/a25x:16/BP2A.250605.031.A3/A256EXXU8DYI8:user/release-keys", "geofence": {"distanceMeters": 11, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A256E", "osVersion": "16", "validationWarnings": []}	\N	2026-03-06 11:07:46.20856+00	\N
af78066d-5f57-497e-b524-0e492b00edd8	ad3e2c03-6ad3-4476-a2fa-30c74e96fea8	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-06 11:26:30.139376+00	7.8917363	-72.4834783	3.5	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14", "osVersion": "18.5", "validationWarnings": []}	\N	2026-03-06 11:26:30.139376+00	\N
5dd02cc1-4ada-4348-8385-4338bcda4a71	ca3db823-72fd-46b1-946e-8c10bb1b9eb8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-06 11:37:40.147765+00	7.8913554	-72.4900014	4.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-06 11:37:40.147765+00	\N
c07c78c8-e8b7-4386-b557-b27da096dd2b	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-06 11:43:48.561971+00	7.8914005	-72.4899780	11.2	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 15, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-03-06 11:43:48.561971+00	\N
056dd74a-948a-452d-a72f-f5f4c8122517	178878fb-2d72-417d-8740-e9e2543a02fd	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-06 11:44:38.362144+00	7.8917548	-72.4835090	9.4	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 8, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16 Pro Max", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-06 11:44:38.362144+00	\N
f4b31f52-53e4-40cd-b2c1-7a0632b877f4	c43c5eeb-6ed9-4808-b174-fe0fbfc738d6	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-06 12:58:05.455376+00	7.8917868	-72.4834012	10.0	{"brand": "Redmi", "osName": "Android", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-06 12:58:05.455376+00	\N
ec6b8206-0d8f-4b83-9384-8d258186c937	a2b3e826-faa4-4c45-82e1-cdcacbf177f2	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-06 12:59:35.585591+00	7.8917311	-72.4834882	3.9	{"brand": "samsung", "osName": "samsung/r12sxxx/r12s:16/BP2A.250605.031.A3/S721BXXU7CYI5:user/release-keys", "geofence": {"distanceMeters": 6, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-S721B", "osVersion": "16", "validationWarnings": []}	\N	2026-03-06 12:59:35.585591+00	\N
a1bb0af5-c5b7-441a-af60-16049a6a0ef0	71e4d936-7821-4d41-8e5e-9a5a41a9bf09	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-06 13:08:09.326653+00	7.8917083	-72.4835133	19.8	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:15/AP3A.240905.015.A2/A556EXXU7BYDB:user/release-keys", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "15", "validationWarnings": []}	\N	2026-03-06 13:08:09.326653+00	\N
95d201c6-23f7-4a5f-a2d6-5ded57b8682d	194649ee-3f1c-42ea-a44a-2abd87053c46	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-06 15:30:30.073133+00	7.8912999	-72.4900475	4.3	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.3", "clientEventId": "check_in_1772811029903_86pv4g", "validationWarnings": []}	\N	2026-03-06 15:30:30.073133+00	\N
833e58bc-b480-4ece-979b-d1c00ff4fa34	194649ee-3f1c-42ea-a44a-2abd87053c46	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-06 15:30:51.874944+00	7.8913458	-72.4900220	10.0	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.3", "clientEventId": "check_out_1772811051742_724hlt", "validationWarnings": []}	\N	2026-03-06 15:30:51.874944+00	\N
f29b50c1-89b3-4a5b-a576-50f35a5f5994	a370641b-d5ad-4d57-8245-d1fbc0de3cc9	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-03-06 16:06:31.589926+00	7.8958496	-72.4944731	4.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 15", "osVersion": "18.5", "validationWarnings": []}	\N	2026-03-06 16:06:31.589926+00	\N
c49d0744-dc69-4aae-b211-2a4704f35d8a	12f6a510-3ae9-40de-ad9f-95ce7bf86823	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-03-06 16:19:58.412426+00	7.8958716	-72.4944974	14.5	{"brand": "Redmi", "osName": "Redmi/tapas_global/tapas:15/AQ3A.240829.003/OS2.0.204.0.VMTMIXM:user/release-keys", "geofence": {"distanceMeters": 3, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-06 16:19:58.412426+00	\N
26bd680f-b3b1-4ac3-a41d-ab297ade17b7	21c92791-e683-4157-a98e-4ca692ee8ce8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-06 18:59:03.600791+00	7.8913899	-72.4900287	5.9	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:14/UP1A.231005.007/A556EXXU6AYB2:user/release-keys", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "14", "validationWarnings": []}	\N	2026-03-06 18:59:03.600791+00	\N
f2433e98-ae55-4935-86b7-989385c8637d	ce157dc6-3528-4826-a3c5-a6c415c429f0	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-06 18:59:09.265853+00	7.8914356	-72.4899969	5.4	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 16, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14 Pro", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-06 18:59:09.265853+00	\N
2142e58b-afd7-4045-92de-cd7d984b94aa	127bb6ba-aec8-44f5-bbd3-825fdd6599a9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-06 19:01:43.62441+00	7.8913623	-72.4900271	12.9	{"brand": "Redmi", "osName": "Redmi/ocean_global/ocean:15/AP3A.240905.015.A2/OS2.0.202.0.VHZLMCR:user/release-keys", "geofence": {"distanceMeters": 8, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "2303ERA42L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-06 19:01:43.62441+00	\N
746bc0b7-5e14-43ad-a1fa-e63510d34ff8	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-06 19:45:06.728915+00	7.8913982	-72.4900026	13.5	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 12, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-03-06 19:45:06.728915+00	\N
97df50c0-7e8d-4c8f-bb9b-03716b8b692c	18e90fdd-3042-47a2-aac3-e02bb1752278	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-06 19:48:09.719827+00	7.8913247	-72.4900935	12.5	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:16/BP2A.250605.031.A3/A556EXXUACYIA:user/release-keys", "geofence": {"distanceMeters": 1, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "16", "validationWarnings": []}	\N	2026-03-06 19:48:09.719827+00	\N
acbcaac0-35ea-4896-ae10-afa1548468df	5b930b57-2934-4c11-bbc5-9b8e8e67d5ac	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-06 19:50:57.095842+00	7.8913197	-72.4899892	7.6	{"brand": "OPPO", "osName": "Android", "geofence": {"distanceMeters": 11, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "CPH2577", "osVersion": "15", "validationWarnings": []}	\N	2026-03-06 19:50:57.095842+00	\N
890c0bd9-fa52-465d-b485-fcf9e1b43145	ba9733fb-acda-4848-8717-c423698bc006	58362682-4ea3-4718-bd83-b4f311f885cd	check_in	mobile	2026-03-06 20:59:15.272+00	7.8958785	-72.4944426	3.6	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 9, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-06 20:59:15.272+00	\N
cad58e51-8103-4244-9a04-9c9b57259b75	ca3db823-72fd-46b1-946e-8c10bb1b9eb8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-06 21:11:47.326073+00	7.8914605	-72.4899893	3.7	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 18, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-06 21:11:47.326073+00	\N
6047dea5-882a-4876-971b-1c7b319f2e51	71e4d936-7821-4d41-8e5e-9a5a41a9bf09	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-03-06 23:10:37.208537+00	7.8918402	-72.4835872	3.5	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:15/AP3A.240905.015.A2/A556EXXU7BYDB:user/release-keys", "geofence": {"distanceMeters": 19, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "15", "validationWarnings": []}	\N	2026-03-06 23:10:37.208537+00	\N
be536159-8349-4c5c-8390-8822be8d23c7	c43c5eeb-6ed9-4808-b174-fe0fbfc738d6	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-03-06 23:11:09.280035+00	7.8917785	-72.4834951	11.4	{"brand": "Redmi", "osName": "Android", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-06 23:11:09.280035+00	\N
65b818ce-0287-49c1-80f7-5ad4264ae53c	912ba8a9-b5bf-4cc6-9252-9aefb3780c53	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-03-07 01:49:47.307325+00	7.8917762	-72.4833426	11.6	{"brand": "samsung", "osName": "samsung/a25xdxx/a25x:16/BP2A.250605.031.A3/A256EXXU8DYI8:user/release-keys", "geofence": {"distanceMeters": 11, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A256E", "osVersion": "16", "validationWarnings": []}	\N	2026-03-07 01:49:47.307325+00	\N
0305d4e2-65c5-4f36-a021-03dca6574dba	178878fb-2d72-417d-8740-e9e2543a02fd	407ccca3-bc35-4252-8998-7280623de78f	check_out	mobile	2026-03-07 01:50:05.996779+00	7.8918606	-72.4835902	8.2	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 20, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 16 Pro Max", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-07 01:50:05.996779+00	\N
ec39215c-b1da-4b0f-a3e2-1a78ffe44921	12f6a510-3ae9-40de-ad9f-95ce7bf86823	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-03-07 02:17:38.704872+00	7.8958222	-72.4945489	8.3	{"brand": "Redmi", "osName": "Redmi/tapas_global/tapas:15/AQ3A.240829.003/OS2.0.204.0.VMTMIXM:user/release-keys", "geofence": {"distanceMeters": 5, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-07 02:17:38.704872+00	\N
5d56653d-e6d9-4c07-9e7e-e87a7f507b04	21c92791-e683-4157-a98e-4ca692ee8ce8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-07 02:58:05.789674+00	7.8914582	-72.4899858	8.3	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:14/UP1A.231005.007/A556EXXU6AYB2:user/release-keys", "geofence": {"distanceMeters": 18, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "14", "validationWarnings": []}	\N	2026-03-07 02:58:05.789674+00	\N
1f9ba050-0c37-4dfa-a74e-e9e12b1a3206	ce157dc6-3528-4826-a3c5-a6c415c429f0	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-07 03:30:29.255818+00	7.8913165	-72.4901531	9.1	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 14 Pro", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-07 03:30:29.255818+00	\N
f44fb807-3649-4d98-8564-95e7bf00c3f2	127bb6ba-aec8-44f5-bbd3-825fdd6599a9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_out	mobile	2026-03-07 03:30:41.26587+00	7.8913897	-72.4900423	19.3	{"brand": "Redmi", "osName": "Redmi/ocean_global/ocean:15/AP3A.240905.015.A2/OS2.0.202.0.VHZLMCR:user/release-keys", "geofence": {"distanceMeters": 9, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "2303ERA42L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-07 03:30:41.26587+00	\N
4c7d789f-24bb-48a1-b54d-36eb0ac3a061	ba9733fb-acda-4848-8717-c423698bc006	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	mobile	2026-03-07 04:46:10.670576+00	7.8958531	-72.4944093	5.3	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 12, "maxAccuracyMeters": 25, "effectiveRadiusMeters": 20}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.3", "validationWarnings": []}	\N	2026-03-07 04:46:10.670576+00	\N
10940495-45e6-47fc-91d4-af5ca6dea050	a2b3e826-faa4-4c45-82e1-cdcacbf177f2	407ccca3-bc35-4252-8998-7280623de78f	check_out	system	2026-03-07 04:59:59+00	7.8917551	-72.4834379	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-07 04:59:00.181724+00	\N
430d771d-1d70-46c2-a93f-928610e09fb0	a370641b-d5ad-4d57-8245-d1fbc0de3cc9	58362682-4ea3-4718-bd83-b4f311f885cd	check_out	system	2026-03-07 04:59:59+00	7.8958506	-72.4945188	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-07 04:59:00.181724+00	\N
0794ba1a-5ecd-4d08-b674-8f9fbc41a88b	ad3e2c03-6ad3-4476-a2fa-30c74e96fea8	407ccca3-bc35-4252-8998-7280623de78f	check_out	system	2026-03-07 04:59:59+00	7.8917551	-72.4834379	0.0	{"reason": "day_end", "auto_close": true}	Cierre automatico: turno abierto cerrado por el sistema a las 23:59	2026-03-07 04:59:00.181724+00	\N
f6a496da-2b3f-4b6f-88c5-660298b7a73e	71e4d936-7821-4d41-8e5e-9a5a41a9bf09	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-07 09:49:50.058146+00	7.8917412	-72.4834695	18.6	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:15/AP3A.240905.015.A2/A556EXXU7BYDB:user/release-keys", "geofence": {"distanceMeters": 4, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "15", "validationWarnings": []}	\N	2026-03-07 09:49:50.058146+00	\N
8f592d90-bd0e-426a-9d1f-e293bcee1e65	c43c5eeb-6ed9-4808-b174-fe0fbfc738d6	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-07 09:51:18.543706+00	7.8917540	-72.4835705	3.8	{"brand": "Redmi", "osName": "Android", "geofence": {"distanceMeters": 15, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "23028RA60L", "osVersion": "15", "validationWarnings": []}	\N	2026-03-07 09:51:18.543706+00	\N
881ce41b-b18f-403c-beba-2b449d457c7d	912ba8a9-b5bf-4cc6-9252-9aefb3780c53	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-07 10:16:24.244243+00	7.8917401	-72.4835138	6.8	{"brand": "samsung", "osName": "samsung/a25xdxx/a25x:16/BP2A.250605.031.A3/A256EXXU8DYI8:user/release-keys", "geofence": {"distanceMeters": 9, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A256E", "osVersion": "16", "validationWarnings": []}	\N	2026-03-07 10:16:24.244243+00	\N
9157512f-12ea-4972-8163-802792e319ba	5b930b57-2934-4c11-bbc5-9b8e8e67d5ac	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-07 10:58:45.372623+00	7.8913948	-72.4900303	19.0	{"brand": "OPPO", "osName": "Android", "geofence": {"distanceMeters": 10, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "CPH2577", "osVersion": "15", "validationWarnings": []}	\N	2026-03-07 10:58:45.372623+00	\N
2cd37f5b-e8d3-467e-8a94-52048b7f71b1	18e90fdd-3042-47a2-aac3-e02bb1752278	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-07 11:00:18.513114+00	7.8913307	-72.4900247	13.0	{"brand": "samsung", "osName": "samsung/a55xnsxx/a55x:16/BP2A.250605.031.A3/A556EXXUACYIA:user/release-keys", "geofence": {"distanceMeters": 7, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-A556E", "osVersion": "16", "validationWarnings": []}	\N	2026-03-07 11:00:18.513114+00	\N
740c4cfc-b111-4600-af5d-8d6befdaedf9	549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-07 11:41:10.799029+00	7.8913854	-72.4900035	13.1	{"brand": "Redmi", "osName": "Redmi/citrine_global/citrine:15/AP3A.240905.015.A2/OS2.0.206.0.VOQMIDC:user/release-keys", "geofence": {"distanceMeters": 11, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "24094RAD4G", "osVersion": "15", "validationWarnings": []}	\N	2026-03-07 11:41:10.799029+00	\N
32b70995-7a95-403e-846e-b61e3429fc6e	a2b3e826-faa4-4c45-82e1-cdcacbf177f2	407ccca3-bc35-4252-8998-7280623de78f	check_in	mobile	2026-03-07 11:55:32.226784+00	7.8917491	-72.4834410	3.1	{"brand": "samsung", "osName": "samsung/r12sxxx/r12s:16/BP2A.250605.031.A3/S721BXXU7CYI5:user/release-keys", "geofence": {"distanceMeters": 1, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "android", "modelName": "SM-S721B", "osVersion": "16", "validationWarnings": []}	\N	2026-03-07 11:55:32.226784+00	\N
6bbe0a85-93a2-4fe7-952c-7938370a2f71	4d03b153-c466-4d6b-8fef-d42b80b55ca1	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	check_in	mobile	2026-03-07 13:03:09.514482+00	7.8914142	-72.4900430	9.4	{"brand": "Apple", "osName": "iOS", "geofence": {"distanceMeters": 11, "maxAccuracyMeters": 20, "effectiveRadiusMeters": 30}, "isDevice": true, "platform": "ios", "modelName": "iPhone 13", "osVersion": "26.2.1", "validationWarnings": []}	\N	2026-03-07 13:03:09.514482+00	\N
\.


--
-- Data for Name: attendance_shift_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."attendance_shift_events" ("id", "employee_id", "site_id", "shift_start_at", "event_type", "occurred_at", "distance_meters", "accuracy_meters", "source", "notes", "created_at", "updated_at") FROM stdin;
2d754994-fd01-4625-aa31-bfaba42cf900	ce157dc6-3528-4826-a3c5-a6c415c429f0	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	2026-03-01 18:51:45.973303+00	left_site_open_shift	2026-03-02 02:35:12.999+00	325	13	mobile	\N	2026-03-02 02:35:14.153448+00	2026-03-02 02:35:14.153448+00
529c8865-8feb-4ed7-9aa7-9a11c53db50d	21c92791-e683-4157-a98e-4ca692ee8ce8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	2026-03-02 11:25:40.83136+00	left_site_open_shift	2026-03-02 22:07:52.37+00	3173	13	mobile	\N	2026-03-02 22:07:52.119802+00	2026-03-02 22:07:52.119802+00
0acb21c4-076b-4ccf-97f9-54b379ca4e24	178878fb-2d72-417d-8740-e9e2543a02fd	407ccca3-bc35-4252-8998-7280623de78f	2026-03-03 11:19:08.328967+00	left_site_open_shift	2026-03-03 21:05:23.342+00	711	22	mobile	\N	2026-03-03 21:05:24.583874+00	2026-03-03 21:05:24.583874+00
4f764ba0-5db3-43f5-ad41-5db12be230bd	71e4d936-7821-4d41-8e5e-9a5a41a9bf09	407ccca3-bc35-4252-8998-7280623de78f	2026-03-04 13:00:34.290244+00	left_site_open_shift	2026-03-04 21:54:03.71+00	730	12	mobile	\N	2026-03-04 21:56:19.880853+00	2026-03-04 21:56:19.880853+00
d5ab8145-31ea-422c-939b-3d14c5fa88e4	18e90fdd-3042-47a2-aac3-e02bb1752278	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	2026-03-05 11:04:48.608006+00	left_site_open_shift	2026-03-05 19:42:50.036+00	3447	19	mobile	\N	2026-03-05 19:42:50.893064+00	2026-03-05 19:42:50.893064+00
0098a6db-be20-48a9-9b20-a36ea4609405	a370641b-d5ad-4d57-8245-d1fbc0de3cc9	58362682-4ea3-4718-bd83-b4f311f885cd	2026-03-05 16:04:06.394887+00	left_site_open_shift	2026-03-05 23:49:15.523+00	3330	20	mobile	\N	2026-03-05 23:49:16.70747+00	2026-03-05 23:49:16.70747+00
d4125faa-ab1d-4a1d-95cc-6cffa23bf1c2	ba9733fb-acda-4848-8717-c423698bc006	58362682-4ea3-4718-bd83-b4f311f885cd	2026-03-05 20:04:24.657135+00	left_site_open_shift	2026-03-06 03:18:47.182+00	566	30	mobile	\N	2026-03-06 03:18:48.375866+00	2026-03-06 03:18:48.375866+00
\.


--
-- Data for Name: attendance_sync_conflicts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."attendance_sync_conflicts" ("id", "employee_id", "event_id", "event_type", "site_id", "occurred_at", "reason", "payload", "created_at") FROM stdin;
\.


--
-- Data for Name: cost_centers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."cost_centers" ("id", "site_id", "name", "monthly_budget", "current_month_spend", "created_at", "is_active") FROM stdin;
\.


--
-- Data for Name: document_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."document_types" ("id", "name", "scope", "requires_expiry", "validity_months", "reminder_days", "is_active", "created_at", "updated_at", "display_order") FROM stdin;
e0c9f556-74f7-47fd-aaf4-83f9df25cdea	Exámenes periódicos de salud	employee	t	6	7	t	2026-01-27 11:53:12.486498+00	2026-01-28 14:46:21.30731+00	3
a90c3323-1956-4877-8bb3-fdc5ad926dee	Certificado de manipulación de alimentos	employee	t	12	7	t	2026-01-27 11:53:12.486498+00	2026-01-28 14:46:21.30731+00	4
6cf0d0fd-6dec-4f8f-a004-34c47170d718	Dotación	employee	t	6	7	t	2026-01-27 11:53:12.486498+00	2026-01-28 14:46:21.30731+00	5
e2e36098-0fa5-4042-a846-506c15108665	Para saber si requiere contrato	employee	f	\N	7	f	2026-01-27 11:53:12.486498+00	2026-01-28 16:03:17.992304+00	999
da92cbd7-0824-4d96-aab7-dea9c9e93687	Fecha de ingreso	employee	f	\N	7	f	2026-01-27 11:53:12.486498+00	2026-01-28 16:03:17.992304+00	2
9263e969-19fb-4ed4-8e88-8b695d6eb512	Contrato laboral	employee	t	3	7	t	2026-01-27 11:53:12.486498+00	2026-01-28 17:46:46.278677+00	1
\.


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."documents" ("id", "scope", "owner_employee_id", "target_employee_id", "site_id", "title", "description", "status", "approved_by", "approved_at", "rejected_reason", "storage_path", "file_name", "file_size_bytes", "file_mime", "expiry_date", "created_at", "updated_at", "document_type_id", "issue_date") FROM stdin;
\.


--
-- Data for Name: employee_areas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."employee_areas" ("employee_id", "area_id", "is_primary", "is_active", "created_at") FROM stdin;
194649ee-3f1c-42ea-a44a-2abd87053c46	96afcf8a-b638-48f0-96b6-8295ba8419e2	t	t	2025-12-31 14:45:22.923849+00
\.


--
-- Data for Name: employee_devices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."employee_devices" ("id", "employee_id", "expo_push_token", "platform", "device_label", "is_active", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: employee_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."employee_permissions" ("id", "employee_id", "permission_id", "is_allowed", "scope_type", "scope_site_id", "scope_area_id", "scope_site_type", "scope_area_kind", "created_at") FROM stdin;
\.


--
-- Data for Name: employee_push_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."employee_push_tokens" ("id", "employee_id", "token", "platform", "device_id", "is_active", "last_seen", "created_at", "updated_at") FROM stdin;
e434d2b0-7a5c-495e-9a33-8e7035835d13	ce157dc6-3528-4826-a3c5-a6c415c429f0	ExponentPushToken[7UxBesAuN8jRWxxTn66XEf]	ios	\N	t	2026-03-07 03:30:28.704+00	2026-02-23 21:22:54.195729+00	2026-03-07 03:30:28.728796+00
397f9a02-4c51-4aed-b642-8c472345e7c5	ba9733fb-acda-4848-8717-c423698bc006	ExponentPushToken[YtG6wEC8l_KvrH7AJ41apy]	ios	\N	t	2026-03-07 04:45:20.657+00	2026-02-24 15:12:38.84002+00	2026-03-07 04:45:20.720595+00
0fb505b5-65e3-46b4-baf7-33537d46a9c2	ad3e2c03-6ad3-4476-a2fa-30c74e96fea8	ExponentPushToken[ldkK0lKY4LIHcN1bM54GHW]	ios	\N	t	2026-03-06 11:26:30.046+00	2026-02-24 01:21:35.548966+00	2026-03-06 11:26:30.0828+00
5b2f2cc5-d71e-465f-8448-a61b4e3c8d08	4d03b153-c466-4d6b-8fef-d42b80b55ca1	ExponentPushToken[zxmKOmNOEty_d-f1UJQhic]	ios	\N	t	2026-03-07 13:02:20.959+00	2026-02-23 23:16:20.856483+00	2026-03-07 13:02:20.987788+00
95264357-87d7-45b5-a1bf-21b8492edbd2	2931cc46-273a-4ace-bb5f-baac00365462	ExponentPushToken[02s58hML_8hAwIyBTkh8GV]	ios	\N	t	2026-02-27 18:11:36.028+00	2026-02-24 22:48:40.586586+00	2026-02-27 18:11:36.107813+00
f32fc545-b8ce-46c1-b835-86ea9d110c36	194649ee-3f1c-42ea-a44a-2abd87053c46	ExponentPushToken[2EYgRwEEzdAxPebI9iy7Ll]	ios	\N	t	2026-03-06 15:51:22.561+00	2026-03-06 15:25:32.654955+00	2026-03-06 15:51:22.606789+00
8d9c0723-50b3-4108-8c46-54dc526fac0f	a370641b-d5ad-4d57-8245-d1fbc0de3cc9	ExponentPushToken[ISXD2DGJocPeBpdq_oNsGt]	ios	\N	t	2026-03-06 16:06:13.458+00	2026-02-24 15:15:14.815905+00	2026-03-06 16:06:13.49385+00
a96fe701-3a37-45af-b5d3-21e987cdf5ce	cd4883c8-8894-4d94-8e7b-588d3dbab380	ExponentPushToken[Phh50hANHGIQkoVw5KUaQO]	ios	\N	t	2026-03-05 23:01:08.689+00	2026-02-23 22:31:07.149332+00	2026-03-05 23:01:08.728778+00
9bcb0850-c202-482e-9abd-03ce8a1184f1	2ba2357d-4b66-4145-b62f-73587f82af6f	ExponentPushToken[Wly4FcA0cwJyi_jw6KJlOX]	ios	\N	t	2026-03-06 19:22:31.144+00	2026-02-25 13:42:09.876999+00	2026-03-06 19:22:31.221432+00
52ff35bc-64af-4487-9b93-dd31a02b56df	194649ee-3f1c-42ea-a44a-2abd87053c46	ExponentPushToken[JcWwgaDvyxRwp8hrIR4TRl]	ios	\N	t	2026-02-25 16:49:02.136+00	2026-01-29 15:12:37.280041+00	2026-02-25 16:49:02.19651+00
b782ee34-2b1f-4cea-a8f3-c267bd07ca33	ea80aafc-2568-43e1-abbe-eeb2ef1cafad	ExponentPushToken[oS1DPKODqfkxAYBxVzJovI]	ios	\N	t	2026-02-27 02:48:17.065+00	2026-02-23 22:48:14.547953+00	2026-02-27 02:48:17.129894+00
26fa9478-13ba-4391-8f55-c04cf9d567d0	ca3db823-72fd-46b1-946e-8c10bb1b9eb8	ExponentPushToken[ClH43ZM_6bGbtKZMA4atDh]	ios	\N	t	2026-03-06 21:11:40.118+00	2026-02-23 22:32:03.57548+00	2026-03-06 21:11:40.190436+00
6fd7c281-dc05-4ca7-b33f-485f76d716ff	0857f8d1-0fc8-4c63-a8d2-d74333e90a9d	ExponentPushToken[aQU4NzO_yDk-nuaOCAD9bl]	ios	\N	t	2026-03-05 00:41:47.93+00	2026-02-17 21:02:57.695982+00	2026-03-05 00:41:47.9772+00
630864dc-0df3-4b33-8ca5-b97f43653880	194649ee-3f1c-42ea-a44a-2abd87053c46	ExponentPushToken[A80JJpCr0AE3cLCBjtGSi7]	ios	\N	t	2026-03-06 23:30:54.677+00	2026-01-28 11:29:14.834865+00	2026-03-06 23:30:54.750995+00
b7746ef8-bf42-4016-bbf1-927a8c35f705	178878fb-2d72-417d-8740-e9e2543a02fd	ExponentPushToken[m_JnDFBe54iiXhVHQOhljc]	ios	\N	t	2026-03-07 01:49:52.445+00	2026-02-24 13:19:00.655774+00	2026-03-07 01:49:52.4783+00
\.


--
-- Data for Name: employee_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."employee_settings" ("employee_id", "selected_site_id", "selected_area_id", "updated_at") FROM stdin;
f526fbf0-90f4-4b75-b06e-2c12f692f7f9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	\N	2026-03-04 11:05:46.95+00
194649ee-3f1c-42ea-a44a-2abd87053c46	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	\N	2026-03-06 23:01:44.927+00
\.


--
-- Data for Name: employee_shifts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."employee_shifts" ("id", "employee_id", "site_id", "shift_date", "start_time", "end_time", "break_minutes", "notes", "status", "created_by", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: employee_sites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."employee_sites" ("employee_id", "site_id", "is_primary", "is_active", "created_at") FROM stdin;
3456e710-6211-42bf-9632-3aefa8eefa32	e8823211-100a-49b9-bb55-bbff432de43c	t	t	2026-02-06 15:13:37.088521+00
2ba2357d-4b66-4145-b62f-73587f82af6f	59de8039-239a-4791-a20c-c2e7fe2344d3	t	t	2026-02-13 22:10:29.937191+00
0857f8d1-0fc8-4c63-a8d2-d74333e90a9d	59de8039-239a-4791-a20c-c2e7fe2344d3	t	t	2026-02-17 21:03:37.500497+00
5fcd8cf0-da6b-4116-90b4-552ec9d3593b	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	t	t	2026-02-21 16:27:22.444506+00
9b75f26e-cc61-43b6-bde1-d248c3caf0ad	407ccca3-bc35-4252-8998-7280623de78f	t	t	2026-02-21 16:40:43.968041+00
549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	t	t	2026-02-21 16:49:16.142315+00
ce157dc6-3528-4826-a3c5-a6c415c429f0	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	t	t	2026-02-21 16:50:47.163587+00
912ba8a9-b5bf-4cc6-9252-9aefb3780c53	407ccca3-bc35-4252-8998-7280623de78f	t	t	2026-02-21 16:32:38.54199+00
71e4d936-7821-4d41-8e5e-9a5a41a9bf09	407ccca3-bc35-4252-8998-7280623de78f	t	t	2026-02-21 16:52:55.557887+00
f526fbf0-90f4-4b75-b06e-2c12f692f7f9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	t	t	2026-02-21 16:26:20.261357+00
f526fbf0-90f4-4b75-b06e-2c12f692f7f9	58362682-4ea3-4718-bd83-b4f311f885cd	f	t	2026-02-23 21:22:21.195468+00
80324888-621d-4c41-bd59-d42db17e1ea8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	t	t	2026-02-23 21:33:10.336017+00
127bb6ba-aec8-44f5-bbd3-825fdd6599a9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	t	t	2026-02-23 21:35:25.066272+00
1db7df08-40c0-44c7-b117-57ce027e79bc	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	t	t	2026-02-23 21:58:13.863077+00
cd4883c8-8894-4d94-8e7b-588d3dbab380	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	t	t	2026-02-23 22:16:42.462385+00
21c92791-e683-4157-a98e-4ca692ee8ce8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	t	t	2026-02-23 22:22:18.691454+00
ca3db823-72fd-46b1-946e-8c10bb1b9eb8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	t	t	2026-02-23 22:22:47.586871+00
ad3e2c03-6ad3-4476-a2fa-30c74e96fea8	407ccca3-bc35-4252-8998-7280623de78f	t	t	2026-02-23 22:25:15.179144+00
ea80aafc-2568-43e1-abbe-eeb2ef1cafad	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	t	t	2026-02-23 22:45:54.683311+00
4d03b153-c466-4d6b-8fef-d42b80b55ca1	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	t	t	2026-02-23 22:54:17.82738+00
12f6a510-3ae9-40de-ad9f-95ce7bf86823	58362682-4ea3-4718-bd83-b4f311f885cd	t	t	2026-02-23 22:54:44.453763+00
178878fb-2d72-417d-8740-e9e2543a02fd	407ccca3-bc35-4252-8998-7280623de78f	t	t	2026-02-23 23:25:49.465327+00
ba9733fb-acda-4848-8717-c423698bc006	58362682-4ea3-4718-bd83-b4f311f885cd	t	t	2026-02-24 15:11:28.218213+00
a370641b-d5ad-4d57-8245-d1fbc0de3cc9	58362682-4ea3-4718-bd83-b4f311f885cd	t	t	2026-02-24 15:13:45.654206+00
5b930b57-2934-4c11-bbc5-9b8e8e67d5ac	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	t	t	2026-02-24 16:11:19.648269+00
18e90fdd-3042-47a2-aac3-e02bb1752278	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	t	t	2026-02-24 16:14:33.780311+00
2931cc46-273a-4ace-bb5f-baac00365462	407ccca3-bc35-4252-8998-7280623de78f	t	t	2026-02-24 22:45:22.868959+00
a95939bb-6f36-4826-8101-237e358bb12d	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	t	t	2026-02-27 17:33:11.612381+00
88d82db7-7da3-4c83-ad91-69306e0ebe4c	407ccca3-bc35-4252-8998-7280623de78f	t	t	2026-02-27 18:21:11.938386+00
a2b3e826-faa4-4c45-82e1-cdcacbf177f2	407ccca3-bc35-4252-8998-7280623de78f	t	t	2026-03-01 22:51:52.211625+00
c43c5eeb-6ed9-4808-b174-fe0fbfc738d6	407ccca3-bc35-4252-8998-7280623de78f	t	t	2026-03-02 18:59:18.396749+00
194649ee-3f1c-42ea-a44a-2abd87053c46	58362682-4ea3-4718-bd83-b4f311f885cd	f	t	2026-02-17 14:51:43.713723+00
194649ee-3f1c-42ea-a44a-2abd87053c46	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	f	t	2026-02-17 14:51:43.713723+00
194649ee-3f1c-42ea-a44a-2abd87053c46	407ccca3-bc35-4252-8998-7280623de78f	f	t	2026-02-17 14:51:43.713723+00
194649ee-3f1c-42ea-a44a-2abd87053c46	59de8039-239a-4791-a20c-c2e7fe2344d3	t	t	2025-12-31 14:45:08.687562+00
194649ee-3f1c-42ea-a44a-2abd87053c46	fa679b86-397a-4155-8336-9bd3245ef1ce	f	t	2026-03-06 15:34:54.331798+00
\.


--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."suppliers" ("id", "name", "tax_id", "contact_name", "phone", "email", "address", "notes", "is_active", "created_at", "updated_at") FROM stdin;
ad8088fe-db2b-455c-89cf-46a8b2f55441	BARTENDING	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
1291c2c9-2b31-4642-ade3-7afbf1ce71db	ACTIVA INDUSTRIA SAS	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
d0dab52e-1d16-4019-bf60-d74f95269bbd	AGROPECUARIA ALIAR SA	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
56fdb21c-1391-4495-828e-add400a14458	ALACENA DEL CHEF	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
4e9b0706-29d6-456e-995a-c8408cf3a572	ALIMENTOS NATUVID	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
562e59a9-4f38-4906-b991-e3fe7411aa2e	ALMACENES ÉXITO	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
ce72c4f7-e160-4e8f-abae-091d8803bd87	APORTER GOURMET	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
04f90ee2-0fd4-46d1-8a9f-fde6f8bc3095	ASERALIMENTOS SAS	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
c1d57216-ef5f-47cf-96b4-bbb0eeb37dd4	ATLANTIC FC SAS	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
79e1fb71-413f-477e-9e18-9822ccfd72a4	AVSA SAS	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
e71a1526-bd7c-4268-966c-0d7509925c4e	AXTRAL	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
36947d0b-1b3d-4cfa-a321-80103a50f509	BETMAN SAS	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
3487f648-87be-4858-bf56-f314508f8d22	BODEGA ALEX	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
327f8bba-0fd8-4a3b-962d-1cde316a6a48	BODEGA PANIFICADOR	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
4f783d75-1c08-48ab-af8a-8d99919d3b53	CARNES EL NOVILLON	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
be00d563-a3ad-4653-970a-3abcd41b7ca6	CASA LUKER	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
ec384bf3-4a4a-45cc-afba-2808fb451212	CENABASTOS	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
3df40df7-f01d-4846-8dcc-a749b2bda56d	CENTRO	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
4ee7e60b-f0cb-4080-85a0-2628272ce60a	CHAMPIÑONES VILLAMIL	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
239d1264-8029-4834-b968-e4fcb73ac1d3	CHARCUTERIA LA RICCOTA	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
d7b2a5e6-ad78-436c-96d7-5fdfe7a8a5c5	CHARCUTERIA PASCUALI	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
4117e5d1-2ccf-4ce2-9352-cd52dff001f5	CHARCUTERIA VILLANUEVA	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
2dbe12fe-3c4b-4800-b923-8d1bc09e9b20	COCA COLA	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
6240e432-8854-482a-bbd0-7413319ebecb	COLANTA	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
05e4002a-6f92-4ba0-9412-9b2a5508df57	COMORIENTE	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
392b6cc2-9e27-4c7d-8c32-e4802be67cc9	D1	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
3b62cce0-50d1-47d5-966c-5d48e7c41b90	DISTRIHUYRO	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
24366fae-eae6-4486-8a60-e4671c073f67	DOLLAR CITY	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
bc4fcdcb-d940-4f1d-be54-491c03d6844e	EDGAR RAMIREZ LUNA	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
bf2e5ffe-c898-464c-9a4b-eac60b1444ce	EMILIA	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
977e2167-2363-46f3-bcb2-a5a0a538c0cb	EVOTIENDAS	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
bae6fcf5-e884-4346-a8d3-f153f0079db0	FENICE	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
03bac072-7fd2-476d-816b-72d733df883b	FRESKALECHE	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
a47b892a-e024-4167-86f3-396af049ed17	FRUTOSOL	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
b3af135b-5d08-483c-97bb-61eeb357d35a	GALAXIA DEL PLASTICO	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
b6e60644-e28b-4079-8c65-d7710450dfaf	GRANJA VILLA MARIANA	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
4f4b0b60-9d55-4f06-bccd-ef910f378917	HIELOS CUCUTA	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
877c9e69-2d3b-4e5b-a88b-414878e80f35	JAIME VELANDIA	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
edb738f7-bfaf-46c7-b19e-7a2006e763f1	KANALOA	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
8c02c31e-8cce-483e-b060-35cabdfc3905	LA COPA	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
87bfc224-b030-484e-81ed-d4f6a014cbc9	LA RECETTA	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
3fccc235-6b90-4c4b-9468-0daef19762d7	LAVAMAX	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
252b83b2-d959-48fa-9774-b14376fccb9c	LOS MONTES	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
bec420e5-d45f-4e8d-bc5e-53d22cbcf9e4	MAKRO	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
b53380dd-7d16-4bb7-a311-1ccca31bbc5e	MARRANITOS	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
8fd69c3e-a508-43fc-af98-119a9b9a37e1	MEICO	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
76318e25-06f0-46c7-a954-eeda9f868333	MERCADOLIBRE	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
4aca6cc8-77a3-402f-bdd7-ba23f5b9a474	NICOSPAN	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
88f9e9f0-ec1c-455c-be85-e26e4bdac595	ORQUIDEA	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
f7835029-a1c3-49f1-85ee-0b7b63759f62	OSCAR SANTOS	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
71fdf7e8-67b9-4693-8ea9-6d923cb6b33e	PAPELERIA GRADYMAR	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
225b9865-aa15-4708-af4a-53b3ad3ba7c0	PESQUERA DEL MAR	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
fbe36960-f329-4f7a-98b5-4862b09b3031	POSTOBON	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
08f8b1b4-a90b-4a9c-8b56-6a32131efaee	PREGEL	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
701c0ad2-f972-44ce-b067-2eab0ecb28cb	PRICESMART	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
43f0c737-f6ff-4aa6-8f47-f343c284e3b6	REINALDO ALBA ROMAN	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
395d12f1-46e8-495d-ba0c-c7d97ba9c479	SENSAFRUID	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
6ce20f84-db13-4be0-a3bb-94ba6cebf339	SHALOM	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
a3c79722-c00f-4032-aa2b-e8f7a69b56f7	SUMINISTROS AMCA	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
5ca2360e-0f83-48e6-9961-8f65fe00acdb	SUPER C	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
6013de0f-3ac2-408e-af67-90e3a0d80516	SURTIDORA	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
5d63c343-a2fe-40f9-8c2b-3306c8c4b0d3	TECNAS	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
58cd72ce-96c6-4485-9397-4fb290883683	TRINOS SAS	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
9b3b667f-56e8-499e-b203-042b66565c7c	UMAN	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
aca2efb3-f293-41fd-b4f0-99adf7852472	UNIVERSO CREACIONES	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
d68b394a-e7e7-48e3-af9a-973444899543	UNIVERSO MERCANTIL	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
05e9e0cb-5a4a-4456-868a-e886f66b6094	VENTO GROUP	\N	\N	\N	\N	\N	\N	t	2025-12-03 21:10:12.208157+00	\N
881cc9f8-076d-4cf8-8ed5-b9c77f23f7f7	ASERALIMENTOS SAS	\N	\N	\N	\N	\N	\N	t	2025-12-30 23:56:51.703295+00	\N
c4805910-675a-4d9b-bc58-bde92cd9b203	BARTEDING	\N	\N	\N	\N	\N	\N	t	2025-12-30 23:56:51.703295+00	\N
3f01ec6a-7054-4202-a4f4-eebe141a39af	CENABASTOS ACEITE IDEAL	\N	\N	\N	\N	\N	\N	t	2025-12-30 23:56:51.703295+00	\N
dc776684-c662-4c3c-b175-267ab5c73783	DISTRILACTEOS LTDA	800094923-8	\N	\N	\N	\N	\N	t	2026-02-19 14:57:02.930063+00	\N
b14f7ba3-36be-49c6-9b3d-3b5f0fedd21d	CASA ITALIA	900763216-2	\N	\N	\N	\N	\N	t	2026-02-19 15:20:46.037071+00	\N
dc2684ae-ca7d-4cac-aa7c-63c44e799cea	NARDI SAS	\N	\N	\N	\N	\N	\N	t	2026-02-19 16:11:38.140799+00	\N
c2fb5bb2-9401-4779-9433-938136ed7f73	MIS TRES AMORES	60315857-6	\N	\N	\N	\N	\N	t	2026-02-20 21:03:59.813351+00	\N
44842ef8-3259-4a31-a745-1a522f4bf11b	LA MEJOR	\N	\N	\N	\N	\N	\N	t	2026-02-20 20:35:13.747831+00	2026-02-21 17:40:56.422+00
b5d5e4fc-717e-4df9-9f8f-34e57938d9a1	NATUVID	\N	\N	\N	\N	\N	\N	t	2026-02-20 17:31:27.258184+00	2026-02-21 17:41:33.613+00
79241128-bc9c-487a-8cc1-65269655644d	BODEGA PORTILLA	\N	\N	\N	\N	\N	\N	t	2026-02-23 16:37:28.814178+00	\N
39d2425b-47bb-4b22-be25-18bccd9caede	MAC POLLO	890201881-4	\N	\N	\N	\N	\N	t	2026-02-23 21:05:47.185137+00	\N
\.


--
-- Data for Name: inventory_ai_ingestions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."inventory_ai_ingestions" ("id", "site_id", "supplier_id", "flow_type", "source_type", "source_filename", "source_mime", "source_size_bytes", "source_document_sha256", "source_storage_path", "status", "error_message", "raw_extraction", "parsed_document", "created_by", "created_at", "updated_at") FROM stdin;
ea236ced-dc37-44d2-a0bc-7c55b3c20468	59de8039-239a-4791-a20c-c2e7fe2344d3	\N	catalog_create	image	WhatsApp Image 2026-03-06 at 11.36.41 AM.jpeg	image/jpeg	312532	9be0e63a628100421af44a597ad9ec6024bd9d471d1d48e63101a21744e0c4be	59de8039-239a-4791-a20c-c2e7fe2344d3/9be0e63a628100421af44a597ad9ec6024bd9d471d1d48e63101a21744e0c4be.jpg	failed	OpenAI error: 429 {\n  "error": {\n    "message": "You exceeded your current quota, please check your plan and billing details. For more information on this error, read the docs: https://platform.openai.com/docs/guides/error-codes/api-errors.",\n    "type": "insufficient_quota",\n    "param": null,\n    "code": "insufficient_quota"\n  }\n}	{}	{}	194649ee-3f1c-42ea-a44a-2abd87053c46	2026-03-06 16:37:02.937863+00	2026-03-06 16:37:11.44491+00
\.


--
-- Data for Name: inventory_ai_ingestion_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."inventory_ai_ingestion_items" ("id", "ingestion_id", "line_no", "raw_payload", "normalized_payload", "match_status", "confidence", "review_status", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: inventory_ai_ingestion_actions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."inventory_ai_ingestion_actions" ("id", "ingestion_id", "item_id", "action_type", "approved_by", "approved_at", "audit_payload", "created_at") FROM stdin;
\.


--
-- Data for Name: inventory_units; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."inventory_units" ("code", "name", "family", "factor_to_base", "symbol", "display_decimals", "is_active", "created_at", "updated_at") FROM stdin;
ml	Mililitro	volume	1	ml	2	t	2026-02-13 16:02:30.746773+00	2026-02-13 16:02:30.746773+00
l	Litro	volume	1000	L	3	t	2026-02-13 16:02:30.746773+00	2026-02-13 16:02:30.746773+00
g	Gramo	mass	1	g	2	t	2026-02-13 16:02:30.746773+00	2026-02-13 16:02:30.746773+00
kg	Kilogramo	mass	1000	kg	3	t	2026-02-13 16:02:30.746773+00	2026-02-13 16:02:30.746773+00
un	Unidad	count	1	un	0	t	2026-02-13 16:02:30.746773+00	2026-02-13 16:02:30.746773+00
dz	Docena	count	12	dz	2	t	2026-02-13 16:02:30.746773+00	2026-02-13 16:02:30.746773+00
\.


--
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."product_categories" ("id", "name", "slug", "description", "display_order", "is_active", "created_at", "domain", "parent_id", "updated_at", "site_id", "applies_to_kinds") FROM stdin;
da570f9e-6a6c-4ccc-b2aa-9356e334d25a	Maquinaria y Equipos	maquinaria-y-equipos	Categoria orientativa para Maquinaria y Equipos. Puede incluir utensilios, herramientas y activos operativos.	450	t	2026-01-02 21:17:51.381179+00	\N	13043af3-f893-ac45-5b39-a68aeec5197c	2026-02-15 23:12:28.565594+00	\N	{equipo}
023ac8b9-632e-4cbb-a55e-b98e47de14df	Insumos Especializados de Repostería y Panadería	insumos-especializados-de-reposteria-y-panaderia	Categoria orientativa para Insumos Especializados de Repostería y Panadería. Puede incluir materias primas, insumos de uso diario y consumibles.	150	t	2025-12-29 15:17:55.588779+00	\N	0856ba7b-e67b-9859-41b4-82d361a94f1c	2026-02-15 23:12:28.565594+00	\N	{insumo}
6bf9b40e-7b5b-9424-95bb-724906bcec90	Químicos	quimicos	Categoria orientativa para Químicos. Puede incluir materias primas, insumos de uso diario y consumibles.	310	t	2025-12-29 15:17:55.588779+00	\N	eabe4da6-c56c-21e8-4025-b00254b11f27	2026-02-15 23:12:28.565594+00	\N	{insumo}
6924f022-c5f5-4de6-9f83-5cdd4e1a4ec2	Mobiliario	mobiliario	Categoria orientativa para Mobiliario. Puede incluir utensilios, herramientas y activos operativos.	440	t	2026-01-02 21:17:51.381179+00	\N	13043af3-f893-ac45-5b39-a68aeec5197c	2026-02-15 23:12:28.565594+00	\N	{equipo}
b2faf4ca-66a1-4510-adcb-ec5b10e065b4	Fermentos	fermentos	Masa Madre activa (si la gestionan por peso), Prefermentos (Biga/Poolish).	513	t	2025-12-04 22:43:11.676236+00	\N	329fab3b-da6d-186f-4ed9-610dc1973c3f	2026-02-15 22:22:07.994371+00	\N	{preparacion}
1c1b82ab-8193-48b4-a46a-84e5a9b1e0c0	Masas Crudas	masas-crudas	Masa de Pizza (por Kilo o por Bloque fermentado), Masa de Focaccia, Masa de Hojaldre, Masa de Galleta (cruda/congelada).	511	t	2025-12-04 22:42:34.469514+00	\N	329fab3b-da6d-186f-4ed9-610dc1973c3f	2026-02-15 22:22:32.150203+00	\N	{preparacion}
0bb260b0-7449-4504-aaf7-0246f57f24c6	Panadería Pre-cocida	panaderia-pre-cocida	Panes para sándwich (si los hornean en el centro y los envían a los locales), Paninis precocidos, Croissants congelados (sin hornear).	512	t	2025-12-04 22:42:51.655049+00	\N	329fab3b-da6d-186f-4ed9-610dc1973c3f	2026-02-15 22:22:54.126204+00	\N	{preparacion}
b4eb9d6d-a51c-3c72-2d23-53280bb3e5f5	Perecederos: Frutas y Verduras (Fruver)	perecederos-frutas-y-verduras-fruver	Categoria orientativa para Perecederos: Frutas y Verduras (Fruver). Puede incluir materias primas, insumos de uso diario y consumibles.	120	t	2025-12-29 15:17:55.588779+00	\N	0856ba7b-e67b-9859-41b4-82d361a94f1c	2026-02-15 23:12:28.565594+00	\N	{insumo}
4c6d37fb-fa3c-c89b-4622-b47529060f7a	Perecederos: Proteínas	perecederos-proteinas	Categoria orientativa para Perecederos: Proteínas. Puede incluir materias primas, insumos de uso diario y consumibles.	130	t	2025-12-29 15:17:55.588779+00	\N	0856ba7b-e67b-9859-41b4-82d361a94f1c	2026-02-15 23:12:28.565594+00	\N	{insumo}
2618bca2-95c9-1871-1327-772a631d1f65	Bases de Repostería y Rellenos	bases-de-reposteria-y-rellenos	Categoria orientativa para Bases de Repostería y Rellenos. Puede incluir bases, premezclas, salsas y mise en place.	550	t	2025-12-29 15:17:55.588779+00	\N	0da47ff8-6828-4c92-7a65-66594fb1a08e	2026-02-15 23:12:28.565594+00	\N	{preparacion}
35c623d9-9b6f-126c-d7a5-a3069e0dc0bc	Proteínas Procesadas (Mise en Place)	proteinas-procesadas-mise-en-place	Categoria orientativa para Proteínas Procesadas (Mise en Place). Puede incluir bases, premezclas, salsas y mise en place.	530	t	2025-12-29 15:17:55.588779+00	\N	0da47ff8-6828-4c92-7a65-66594fb1a08e	2026-02-15 23:12:28.565594+00	\N	{preparacion}
e3b64f52-79a4-4611-98c1-a8075b9506f6	Salsas Blancas/Cremosas	salsas-blancas-cremosas	Salsa Bechamel, Salsa Alfredo, Crema de Leche reducida.	522	t	2025-12-04 22:43:45.46549+00	\N	a10fe34c-ee53-56a9-d433-6ed29d15bee6	2026-02-15 23:35:28.898735+00	\N	{preparacion}
fbf0d124-f22f-4d49-9d21-bfe23afcdf0e	Salsas Rojas	salsas-rojas	Salsa Napolitana Base (por Litro - vital para la pizzería), Salsa Pomodoro, Salsa Boloñesa.	521	t	2025-12-04 22:43:27.926712+00	\N	a10fe34c-ee53-56a9-d433-6ed29d15bee6	2026-02-15 23:35:38.538521+00	\N	{preparacion}
4feb9e81-223f-1ebc-3f1b-edd5250b9df4	Vegetales Procesados (Cortes y Cocciones)	vegetales-procesados-cortes-y-cocciones	Categoria orientativa para Vegetales Procesados (Cortes y Cocciones). Puede incluir bases, premezclas, salsas y mise en place.	540	t	2025-12-29 15:17:55.588779+00	\N	0da47ff8-6828-4c92-7a65-66594fb1a08e	2026-02-15 23:35:49.891002+00	\N	{preparacion}
780e0846-8a19-473c-ae67-bcd826f68a8e	Papeles	papeles	Papel parafinado (base pizza/sándwich), papel chicle/film (vinipel), papel aluminio, papel de horno (siliconado).	231	t	2025-12-04 22:26:40.101431+00	\N	fb0cf648-98e2-0bb7-ff7e-9aac2fd8d075	2026-02-15 22:18:38.014715+00	\N	{insumo}
29d6ae04-e30b-45b1-97b9-08896888d5eb	Varios	varios	Palillos de dientes, pinchos de bambú, guantes desechables (nitrilo/látex/plástico), mallas para el pelo.	232	t	2025-12-04 22:26:50.567443+00	\N	fb0cf648-98e2-0bb7-ff7e-9aac2fd8d075	2026-02-15 22:19:04.013058+00	\N	{insumo}
adf3dd5b-af91-4ffc-9c1b-23be98d2787d	Cremas	cremas	Crema Pastelera, Crema Chantilly batida, Ganache de chocolate, Merengue.	551	t	2025-12-04 22:45:58.079788+00	\N	2618bca2-95c9-1871-1327-772a631d1f65	2026-02-15 22:23:18.621951+00	\N	{preparacion}
fd7b3d34-6978-4650-aae2-c64a8fbec149	Jarabes	jarabes	Almíbar (para mojar tortas).	553	t	2025-12-04 22:46:34.528575+00	\N	2618bca2-95c9-1871-1327-772a631d1f65	2026-02-15 22:23:27.365221+00	\N	{preparacion}
dee326cf-5677-43b4-be6d-681660235c25	Carnes	carnes	Carne molida sazonada (para lasaña o pizza), Albóndigas crudas, Roast beef horneado (pieza entera para rebanar).	531	t	2025-12-04 22:44:51.099846+00	\N	35c623d9-9b6f-126c-d7a5-a3069e0dc0bc	2026-02-15 22:24:02.899713+00	\N	{preparacion}
86faeb53-2b2d-5f20-ef9f-ad92525e9e84	SANDWICH	sandwich	\N	280	t	2025-12-29 15:40:23.77706+00	MENU	133eb780-0f27-98c8-48cf-d6d590a72a42	2026-02-13 20:30:26.715454+00	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	{venta}
45337691-7885-421f-8938-75b1a0fb5ebd	PIZZAS	pizzas-saudo	\N	401	t	2026-01-06 14:34:02.798818+00	MENU	\N	2026-02-13 20:30:26.715454+00	58362682-4ea3-4718-bd83-b4f311f885cd	{venta}
9ac97e35-4929-4e1f-a13e-b5bb302de847	BIKINIS	bikinis-saudo	\N	402	t	2026-01-06 14:34:02.798818+00	MENU	\N	2026-02-13 20:30:26.715454+00	58362682-4ea3-4718-bd83-b4f311f885cd	{venta}
13b2ddd0-6a62-488b-98d6-0a56cf456bc5	PAN & BRUNCH	pan-brunch-saudo	\N	403	t	2026-01-06 14:34:02.798818+00	MENU	\N	2026-02-13 20:30:26.715454+00	58362682-4ea3-4718-bd83-b4f311f885cd	{venta}
a11c38aa-d984-4fa7-9c79-7094f08808ac	Cerdos	cerdos	Tocineta crocante (picada o en tiras), Chorizo precocido/desmenuzado.	533	t	2025-12-04 22:45:07.201687+00	\N	35c623d9-9b6f-126c-d7a5-a3069e0dc0bc	2026-02-15 22:24:12.277718+00	\N	{preparacion}
d381cd0b-489f-414b-ac8b-9939b795f79a	Aderezos Fríos	aderezos-frios	Pesto (por Kilo/Litro), Vinagreta de la casa, Mayonesa de ajo/especial, Miel mostaza, Reducción de balsámico.	523	t	2025-12-04 22:44:01.084107+00	\N	a10fe34c-ee53-56a9-d433-6ed29d15bee6	2026-02-15 23:35:17.458621+00	\N	{preparacion}
3dc19eab-53ec-64e2-5adc-9da13fa649a0	Lácteos y Refrigerados	lacteos-y-refrigerados	Categoria orientativa para Lácteos y Refrigerados. Puede incluir materias primas, insumos de uso diario y consumibles.	140	t	2025-12-29 15:17:55.588779+00	\N	0856ba7b-e67b-9859-41b4-82d361a94f1c	2026-02-15 23:12:28.565594+00	\N	{insumo}
a2cf02df-1fac-4912-a541-8d0b283cc9df	Pollo	pollo	Pechuga de pollo cocida y desmechada, Pollo en cubos marinado.	532	t	2025-12-04 22:44:33.736864+00	\N	35c623d9-9b6f-126c-d7a5-a3069e0dc0bc	2026-02-15 23:33:33.114674+00	\N	{preparacion}
0da47ff8-6828-4c92-7a65-66594fb1a08e	PREPARACIONES / SEMI-ELABORADOS (Work In Progress - WIP)	preparaciones-semi-elaborados-work-in-progress-wip	Categoria orientativa para PREPARACIONES / SEMI-ELABORADOS (Work In Progress - WIP). Puede incluir bases, premezclas, salsas y mise en place.	500	t	2025-12-29 15:14:10.595186+00	\N	\N	2026-02-15 23:34:42.364411+00	\N	{preparacion}
98e23232-eeca-41cc-903a-82aacfead4bf	Vegetales Cocidos	vegetales-cocidos	Cebolla caramelizada, Champiñones salteados/confitados, Pimentones asados (escalivada), Tomate confitado.	541	t	2025-12-04 22:45:22.63367+00	\N	4feb9e81-223f-1ebc-3f1b-edd5250b9df4	2026-02-15 23:36:25.316256+00	\N	{preparacion}
4e5a9748-ce9c-4fca-a0a2-e0aa68d04e39	Decoración Comestible	decoracion-comestible	Grageas, sprinkles, flores comestibles, láminas de oro, fondants.	154	t	2025-12-04 22:15:59.220813+00	\N	023ac8b9-632e-4cbb-a55e-b98e47de14df	2026-02-15 20:03:11.600613+00	\N	{insumo}
772f4ea7-7861-43c1-9e12-4abec65ebd1a	Rellenos Industriales	rellenos-industriales	Arequipe/Dulce de leche, mermeladas industriales, brillos neutros.	155	t	2025-12-04 22:16:11.060365+00	\N	023ac8b9-632e-4cbb-a55e-b98e47de14df	2026-02-15 20:03:40.886677+00	\N	{insumo}
27400416-3e34-4f58-b68f-c27ee34f4b3a	Huevos	huevos	Huevos AA, claras pasteurizadas (si aplica).	144	t	2025-12-04 22:15:19.510733+00	\N	3dc19eab-53ec-64e2-5adc-9da13fa649a0	2026-02-15 20:04:37.593+00	\N	{insumo}
1b9e5159-f23f-481b-8e0f-490d8c3204a6	Leches y Cremas	leches-y-cremas	Leche entera/deslactosada, crema de leche, leche condensada, yogurt.	143	t	2025-12-04 22:15:14.21936+00	\N	3dc19eab-53ec-64e2-5adc-9da13fa649a0	2026-02-15 20:04:50.06375+00	\N	{insumo}
bf53f6e2-5733-4372-9bed-54b59356993e	Quesos Frescos/Blandos	quesos-frescos-blandos	Mozzarella (bloque/rallado - crítico), queso crema, ricota, campesino/doble crema.	141	t	2025-12-04 22:15:02.70315+00	\N	3dc19eab-53ec-64e2-5adc-9da13fa649a0	2026-02-15 20:05:03.436028+00	\N	{insumo}
8a7c8558-7bf3-425b-8f0e-e530d14d6593	Quesos Maduros/Duros	quesos-maduros-duros	Parmesano, pecorino, azul/roquefort, provolone, cheddar.	142	t	2025-12-04 22:15:08.683736+00	\N	3dc19eab-53ec-64e2-5adc-9da13fa649a0	2026-02-15 20:05:15.170979+00	\N	{insumo}
3a14951c-aabf-4c54-9677-c835759519c0	Aves	aves	Pechuga de pollo (cruda), pollo precocido/desmechado.	132	t	2025-12-04 22:14:02.627111+00	\N	4c6d37fb-fa3c-c89b-4622-b47529060f7a	2026-02-15 20:06:40.090845+00	\N	{insumo}
60ab14fb-b415-4acd-a3d9-67cce6b98c42	Carnes Rojas	carnes-rojas	Carne molida, lomo, cortes para sándwiches (roast beef).	131	t	2025-12-04 22:13:53.990979+00	\N	4c6d37fb-fa3c-c89b-4622-b47529060f7a	2026-02-15 20:06:52.886309+00	\N	{insumo}
91fa5a69-a47b-4be5-85b7-e86b0531e575	Charcutería y Embutidos (Pizzería/Sandwichería)	charcuteria-y-embutidos-pizzeria-sandwicheria	Jamón cocido, jamón serrano/prosciutto, pepperoni, salami, tocineta/bacon, salchichas, chorizos.	133	t	2025-12-04 22:14:10.56951+00	\N	4c6d37fb-fa3c-c89b-4622-b47529060f7a	2026-02-15 20:11:45.19194+00	\N	{insumo}
33c7d7d9-47a7-4c8d-bee5-d15438148440	Pescados y Mariscos	pescados-y-mariscos	Camarones, salmón (fresco/ahumado).	134	t	2025-12-04 22:14:17.610833+00	\N	4c6d37fb-fa3c-c89b-4622-b47529060f7a	2026-02-15 20:11:57.852434+00	\N	{insumo}
675783a3-f0b9-44b5-8e36-87dd8267ade9	Herramientas	herramientas	Escobas, recogedores, baldes, cepillos de cerdas duras, esponjas/fibras abrasivas (bombril).	322	t	2025-12-04 22:38:06.173993+00	\N	b4aeadc5-c7de-2b06-8cec-ea105dd49a88	2026-02-15 20:14:19.721952+00	\N	{insumo}
01f858dd-cdb3-4ee7-8b76-25153a24e3ef	Textiles	textiles	Paños de microfibra, limpiones, traperos/mopas.	321	t	2025-12-04 22:37:56.654106+00	\N	b4aeadc5-c7de-2b06-8cec-ea105dd49a88	2026-02-15 20:14:30.698909+00	\N	{insumo}
3b1053d9-a3d6-46a5-b8d5-a3fedfa64390	Cocina	cocina	Desengrasante industrial, jabón lavaloza, desinfectante de verduras, hipoclorito/cloro.	311	t	2025-12-04 22:37:13.512999+00	\N	6bf9b40e-7b5b-9424-95bb-724906bcec90	2026-02-15 20:14:55.36991+00	\N	{insumo}
b840c26f-c52f-42d8-a402-a0f8431c8169	General	general	Limpiavidrios, limpiapisos, ambientadores, jabón de manos.	312	t	2025-12-04 22:37:30.235708+00	\N	6bf9b40e-7b5b-9424-95bb-724906bcec90	2026-02-15 20:15:09.891713+00	\N	{insumo}
289c538d-601a-4b32-b9c4-97add71ad4c1	Bebidas Listas (RTD)	bebidas-listas-rtd	Gaseosas (Coca-Cola, etc.), aguas (con/sin gas), jugos en botella, cervezas (nacionales/importadas/artesanales).	164	t	2025-12-04 22:21:12.396672+00	MENU	48a21981-00aa-be91-a106-01885437384f	2026-02-15 20:15:30.040989+00	\N	{venta}
f6f25951-6be8-402f-899a-44a8f2a32db7	CON ALCOHOL	con-alcohol	\N	175	t	2026-01-06 14:33:47.429741+00	VCF	5fb77038-90d8-53ef-ad9a-30ed659a2592	2026-02-15 20:29:13.548794+00	\N	{venta}
bc85ed2f-f2d8-40a6-93ae-03009c5ece6f	Aceites y Grasas	aceites-y-grasas	Aceite de oliva virgen extra, aceite vegetal (freír), mantequilla con/sin sal, margarina industrial, manteca de cerdo/vegetal.	113	t	2025-12-04 22:09:21.18399+00	\N	dd3ffe62-d767-72bf-3570-65a472d0c17c	2026-02-15 19:26:36.139767+00	\N	{insumo}
a61441c7-96e2-4f96-9dd4-17764dc3201a	Azúcares y Edulcorantes	azucares-y-edulcorantes	Azúcar blanca, morena, glass (pulverizada), miel, glucosa, stevia, jarabes de maíz.	112	t	2025-12-04 22:08:52.680607+00	\N	dd3ffe62-d767-72bf-3570-65a472d0c17c	2026-02-15 19:26:52.395456+00	\N	{insumo}
e37b26a4-ffc9-4d55-896b-a7755d10e4f7	Enlatados y Conservas	enlatados-y-conservas	Tomate pelado (base pizza), aceitunas (negras/verdes), alcaparras, maizitos, piña en almíbar, atún, anchoas, alcachofas.	116	t	2025-12-04 22:10:09.726426+00	\N	dd3ffe62-d767-72bf-3570-65a472d0c17c	2026-02-15 19:58:20.506927+00	\N	{insumo}
aaee8614-1f28-40ea-a270-74d8ea158954	Especias y Condimentos Secos	especias-y-condimentos-secos	Sal (fina/gruesa), pimienta, orégano, paprika, canela, nuez moscada, colorantes alimenticios.	117	t	2025-12-04 22:10:16.925918+00	\N	dd3ffe62-d767-72bf-3570-65a472d0c17c	2026-02-15 19:58:34.846162+00	\N	{insumo}
95c5f953-8218-4299-9a21-d36917806e59	Harinas y Derivados	harinas-y-derivados	Harina de fuerza (pizza), harina pastelera (repostería), harina integral, maicena, polvos de hornear, levadura seca.	111	t	2025-12-04 22:08:36.178305+00	\N	dd3ffe62-d767-72bf-3570-65a472d0c17c	2026-02-15 19:59:19.903293+00	\N	{insumo}
be672e96-fe98-4452-b24b-8a4f6a4708ef	Infusiones	infusiones	Té negro, verde, aromáticas, chai.	162	t	2025-12-04 22:20:45.718903+00	\N	48a21981-00aa-be91-a106-01885437384f	2026-02-15 20:00:04.16223+00	\N	{insumo}
95003309-1820-48cf-a269-83f8e3de4a0f	Saborizantes y Extractos	saborizantes-y-extractos	Esencia de vainilla, pastas de frutas, licores para cocina (ron, brandy).	153	t	2025-12-04 22:15:52.027564+00	\N	023ac8b9-632e-4cbb-a55e-b98e47de14df	2026-02-15 20:04:10.28139+00	\N	{insumo}
d7496092-d0c4-422f-a6f0-70cc454b24d2	Frutas Frescas	frutas-frescas	Limones, fresas, bananos, aguacates (delicados), frutas para jugos/decoración.	123	t	2025-12-04 22:10:54.950742+00	\N	b4eb9d6d-a51c-3c72-2d23-53280bb3e5f5	2026-02-15 20:05:38.056722+00	\N	{insumo}
52e56c81-aa5a-96ed-21f5-d5a4b907c676	FRÍAS	frias	\N	115	t	2025-12-29 15:40:23.77706+00	VCF	5fb77038-90d8-53ef-ad9a-30ed659a2592	2026-02-15 20:29:25.46486+00	\N	{venta}
8727ec9d-d713-419b-b895-e84fa1b9473f	Rellenos de Fruta	rellenos-de-fruta	Coulis de fresa/frutos rojos, Compota de manzana.	552	t	2025-12-04 22:46:11.815667+00	\N	2618bca2-95c9-1871-1327-772a631d1f65	2026-02-15 22:23:36.435671+00	\N	{preparacion}
2f34de93-f2aa-44c2-8b73-38b48377afea	Licores y Destilados	licores-y-destilados	Categoria orientativa para Licores y Destilados. Puede incluir materias primas, insumos de uso diario y consumibles.	166	t	2025-12-13 15:10:19.58179+00	\N	48a21981-00aa-be91-a106-01885437384f	2026-02-15 23:12:28.565594+00	\N	{insumo}
c2215e5f-afdc-b566-3bec-f7a39b3100e2	Consumibles de Servicio	consumibles-de-servicio	Categoria orientativa para Consumibles de Servicio. Puede incluir materias primas, insumos de uso diario y consumibles.	220	t	2025-12-29 15:17:55.588779+00	\N	f9b30d66-aa10-bf8c-630c-b9098d78f340	2026-02-15 23:12:28.565594+00	\N	{insumo}
3f6f43ba-d670-a160-cf9d-6c36af688a7b	Empaques para Delivery/Llevar	empaques-para-delivery-llevar	Categoria orientativa para Empaques para Delivery/Llevar. Puede incluir materias primas, insumos de uso diario y consumibles.	210	t	2025-12-29 15:17:55.588779+00	\N	f9b30d66-aa10-bf8c-630c-b9098d78f340	2026-02-15 23:12:28.565594+00	\N	{insumo}
309cbe6a-1c2f-49b3-b4d7-39e4c4b6f4a2	Cortes Listos (IV Gama)	cortes-listos-iv-gama	Mix de lechugas lavado y desinfectado, Piña calada/en cubos, Verduras en julianas para sándwich.	542	t	2025-12-04 22:45:39.521332+00	\N	4feb9e81-223f-1ebc-3f1b-edd5250b9df4	2026-02-15 23:36:00.416485+00	\N	{preparacion}
fc03b920-984d-fd17-5b7f-32cc3c066540	CALIENTES	calientes	\N	105	t	2025-12-29 15:40:23.77706+00	VCF	5fb77038-90d8-53ef-ad9a-30ed659a2592	2026-02-15 23:37:02.60452+00	\N	{venta}
48c3774f-7ad1-4622-ac65-d3668ab0028d	Insumos Bebidas	insumos-bebidas	Hielo, bases para granizados/frappés.	165	t	2025-12-04 22:21:24.788768+00	\N	48a21981-00aa-be91-a106-01885437384f	2026-02-15 20:00:17.101749+00	\N	{insumo}
ca549277-21a8-4d95-81b3-5cfb73a28744	Jarabes y Siropes (Syrups)	jarabes-y-siropes-syrups	Vainilla, caramelo, avellana (marcas tipo Monin/1883).	163	t	2025-12-04 22:20:58.248468+00	\N	48a21981-00aa-be91-a106-01885437384f	2026-02-15 20:00:28.8694+00	\N	{insumo}
daeeb296-11d8-4c61-a26d-ad32a46153e3	Chocolatería	chocolateria	Cobertura de chocolate (negro, leche, blanco), cacao en polvo, chips de chocolate, nibs.	151	t	2025-12-04 22:15:38.11589+00	\N	023ac8b9-632e-4cbb-a55e-b98e47de14df	2026-02-15 20:02:55.033697+00	\N	{insumo}
a0e8159b-4c01-4cf5-aada-5539d14dfd8a	Frutos Secos y Semillas	frutos-secos-y-semillas	Almendras (enteras/harina), nueces, pistachos, maní, semillas de amapola/chía.	152	t	2025-12-04 22:15:44.83892+00	\N	023ac8b9-632e-4cbb-a55e-b98e47de14df	2026-02-15 20:03:25.216975+00	\N	{insumo}
05fc0877-e2df-477d-818f-84eea92c9069	Bolsas	bolsas	Bolsas de papel kraft (con/sin asa), bolsas plásticas, bolsas de vacío (producción).	213	t	2025-12-04 22:22:40.478679+00	\N	3f6f43ba-d670-a160-cf9d-6c36af688a7b	2026-02-15 22:17:51.094372+00	\N	{insumo}
133eb780-0f27-98c8-48cf-d6d590a72a42	Comida	comida	\N	200	t	2025-12-29 15:40:23.77706+00	MENU	\N	2026-02-13 20:30:26.715454+00	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	{venta}
5ddaaeda-b2e6-629a-03ca-3e75976c5931	Postres	postres	\N	300	t	2025-12-29 15:40:23.77706+00	MENU	\N	2026-02-13 20:30:26.715454+00	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	{venta}
aa507a2d-c350-7b8f-7ee2-cd26c8119ff0	Otros	otros	\N	400	t	2025-12-29 15:40:23.77706+00	MENU	\N	2026-02-13 20:30:26.715454+00	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	{venta}
6490b326-3855-3f79-6d61-92f06defe59f	FUERTES	fuertes	\N	299	t	2025-12-29 15:40:23.77706+00	MENU	133eb780-0f27-98c8-48cf-d6d590a72a42	2026-02-13 20:30:26.715454+00	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	{venta}
0fd68299-352e-239c-9dc4-b17366d003fe	DESAYUNOS	desayunos	\N	210	t	2025-12-29 15:40:23.77706+00	MENU	133eb780-0f27-98c8-48cf-d6d590a72a42	2026-02-13 20:30:26.715454+00	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	{venta}
2226befc-3cdf-4b59-823c-f58a65dad7b5	BOWLS	bowls	\N	270	t	2025-12-29 15:40:23.77706+00	MENU	133eb780-0f27-98c8-48cf-d6d590a72a42	2026-02-13 20:30:26.715454+00	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	{venta}
7a6e5740-a406-b233-a37d-e8c3f2ace5a2	PARA COMPARTIR	para-compartir	\N	250	t	2025-12-29 15:40:23.77706+00	MENU	133eb780-0f27-98c8-48cf-d6d590a72a42	2026-02-13 20:30:26.715454+00	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	{venta}
dc743c05-f591-12f5-e58f-65bd88a6d1b0	ENTRADAS	entradas	\N	240	t	2025-12-29 15:40:23.77706+00	MENU	133eb780-0f27-98c8-48cf-d6d590a72a42	2026-02-13 20:30:26.715454+00	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	{venta}
6be26077-712a-415c-84e6-09c901a55541	PANCAKES & WAFFLES	pancakes-waffles	\N	220	t	2025-12-29 15:40:23.77706+00	MENU	133eb780-0f27-98c8-48cf-d6d590a72a42	2026-02-13 20:30:26.715454+00	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	{venta}
e424da27-9d4b-b7c1-a15a-b2ceb829409e	TOSTADAS	tostadas	\N	230	t	2025-12-29 15:40:23.77706+00	MENU	133eb780-0f27-98c8-48cf-d6d590a72a42	2026-02-13 20:30:26.715454+00	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	{venta}
e215fa89-7f8a-6868-5b58-3ea57fbad2e2	SOPAS	sopas	\N	290	t	2025-12-29 15:40:23.77706+00	MENU	133eb780-0f27-98c8-48cf-d6d590a72a42	2026-02-13 20:30:26.715454+00	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	{venta}
304a38c9-4f56-40bf-a0e3-391ef336997a	Cajas	cajas	Cajas de pizza (diferentes tamaños), cajas para pastelería, cajas para sándwiches.	211	t	2025-12-04 22:22:17.330306+00	\N	3f6f43ba-d670-a160-cf9d-6c36af688a7b	2026-02-15 22:18:03.250938+00	\N	{insumo}
b26ad14a-c6ce-4e49-86a8-beb37c798f79	Contenedores	contenedores	Envases de aluminio, bowls (papel/plástico) para ensaladas, recipientes para salsas (1oz, 2oz) con tapa.	212	t	2025-12-04 22:22:29.139838+00	\N	3f6f43ba-d670-a160-cf9d-6c36af688a7b	2026-02-15 22:18:14.312699+00	\N	{insumo}
a10fe34c-ee53-56a9-d433-6ed29d15bee6	Salsas Madre y Aderezos (Batch)	salsas-madre-y-aderezos-batch	Categoria orientativa para Salsas Madre y Aderezos (Batch). Puede incluir bases, premezclas, salsas y mise en place.	520	t	2025-12-29 15:17:55.588779+00	\N	0da47ff8-6828-4c92-7a65-66594fb1a08e	2026-02-15 23:35:03.319831+00	\N	{preparacion}
fb0cf648-98e2-0bb7-ff7e-9aac2fd8d075	Papeles y Plásticos de Cocina (Insumos Operativos)	papeles-y-plasticos-de-cocina-insumos-operativos	Categoria orientativa para Papeles y Plásticos de Cocina (Insumos Operativos). Puede incluir materias primas, insumos de uso diario y consumibles.	230	t	2025-12-29 15:17:55.588779+00	\N	f9b30d66-aa10-bf8c-630c-b9098d78f340	2026-02-15 23:12:28.565594+00	\N	{insumo}
329fab3b-da6d-186f-4ed9-610dc1973c3f	Bases de Masa y Panadería (Crítico para Saudo y Vento Café)	bases-de-masa-y-panaderia-critico-para-saudo-y-vento-cafe	Categoria orientativa para Bases de Masa y Panadería (Crítico para Saudo y Vento Café). Puede incluir bases, premezclas, salsas y mise en place.	510	t	2025-12-29 15:17:55.588779+00	\N	0da47ff8-6828-4c92-7a65-66594fb1a08e	2026-02-15 23:12:28.565594+00	\N	{preparacion}
76f79745-6d08-c308-3c61-5d88b57bb815	ENSALADAS	ensaladas	\N	260	t	2025-12-29 15:40:23.77706+00	MENU	133eb780-0f27-98c8-48cf-d6d590a72a42	2026-02-13 20:30:26.715454+00	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	{venta}
b4aeadc5-c7de-2b06-8cec-ea105dd49a88	Implementos de Aseo	implementos-de-aseo	Categoria orientativa para Implementos de Aseo. Puede incluir materias primas, insumos de uso diario y consumibles.	320	t	2025-12-29 15:17:55.588779+00	\N	eabe4da6-c56c-21e8-4025-b00254b11f27	2026-02-15 23:12:28.565594+00	\N	{insumo}
5fb77038-90d8-53ef-ad9a-30ed659a2592	Bebidas	bebidas	\N	100	t	2025-12-29 15:40:23.77706+00	VCF	\N	2026-02-15 23:36:56.760521+00	\N	{venta}
0d428e6e-5406-48f9-a7ae-2f1cc4b0772c	Baños	banos	Papel higiénico (jumbo), toallas de manos (intercaladas/rollo).	323	t	2025-12-04 22:38:17.655694+00	\N	b4aeadc5-c7de-2b06-8cec-ea105dd49a88	2026-02-15 20:12:37.098226+00	\N	{insumo}
6c0a0211-cc09-c2ba-62c4-47ea40b85524	HELADOS	helados	\N	199	t	2025-12-29 15:40:23.77706+00	VCF	5fb77038-90d8-53ef-ad9a-30ed659a2592	2026-02-15 20:29:37.237544+00	\N	{venta}
6f37217d-a9be-a44c-f5a7-d5dec0e8ca40	MALTEADAS	malteadas	\N	160	t	2025-12-29 15:40:23.77706+00	VCF	5fb77038-90d8-53ef-ad9a-30ed659a2592	2026-02-15 22:05:04.026637+00	\N	{venta}
eca5a77d-68be-a9dc-d0bd-00d579c647b7	OTROS	otros	\N	195	t	2025-12-29 15:40:23.77706+00	VCF	5fb77038-90d8-53ef-ad9a-30ed659a2592	2026-02-15 22:05:20.610232+00	\N	{venta}
e6df2480-5ba3-4dfb-8649-737289ce500c	Cubiertos Desechables	cubiertos-desechables	Tenedores, cuchillos, cucharas (plástico o madera).	223	t	2025-12-04 22:26:12.197585+00	\N	c2215e5f-afdc-b566-3bec-f7a39b3100e2	2026-02-15 22:17:06.762677+00	\N	{insumo}
5cdeda76-9a26-475e-9149-4ca19d36cfe2	Mesa	mesa	Servilletas (básicas/lujo), individuales de papel, pitillos/pajillas (plástico/papel/biodegradable), mezcladores/agitadores.	222	t	2025-12-04 22:26:03.146226+00	\N	c2215e5f-afdc-b566-3bec-f7a39b3100e2	2026-02-15 22:17:18.159655+00	\N	{insumo}
5205cb6f-85e5-4e33-8ea7-9d3e8ddad9b3	Vasos y empaques para bebidas	vasos-y-empaques-para-bebidas	Vasos de cartón (bebidas calientes 4oz, 8oz, 12oz), vasos plásticos (bebidas frías), tapas para vasos, portavasos, fajillas (mangas de cartón).	221	t	2025-12-04 22:25:52.103529+00	\N	c2215e5f-afdc-b566-3bec-f7a39b3100e2	2026-02-15 22:17:28.566327+00	\N	{insumo}
13043af3-f893-ac45-5b39-a68aeec5197c	ACTIVOS MENORES Y MENAJE (Smallwares)	activos-menores-y-menaje-smallwares	Categoria orientativa para ACTIVOS MENORES Y MENAJE (Smallwares). Puede incluir utensilios, herramientas y activos operativos.	400	t	2025-12-29 15:14:10.595186+00	\N	\N	2026-02-15 23:12:28.565594+00	\N	{equipo}
0856ba7b-e67b-9859-41b4-82d361a94f1c	ALIMENTOS Y BEBIDAS (Materias Primas / Insumos)	alimentos-y-bebidas-materias-primas-insumos	Categoria orientativa para ALIMENTOS Y BEBIDAS (Materias Primas / Insumos). Puede incluir materias primas, insumos de uso diario y consumibles.	100	t	2025-12-29 15:14:10.595186+00	\N	\N	2026-02-15 23:12:28.565594+00	\N	{insumo}
48a21981-00aa-be91-a106-01885437384f	Insumos Barista y Bebidas (Bar)	insumos-barista-y-bebidas-bar	Categoria orientativa para Insumos Barista y Bebidas (Bar). Puede incluir materias primas, insumos de uso diario y consumibles.	160	t	2025-12-29 15:17:55.588779+00	\N	0856ba7b-e67b-9859-41b4-82d361a94f1c	2026-02-15 23:12:28.565594+00	\N	{insumo}
dd3ffe62-d767-72bf-3570-65a472d0c17c	Abarrotes y Despensa (Secos)	abarrotes-y-despensa-secos	Categoria orientativa para Abarrotes y Despensa (Secos). Puede incluir materias primas, insumos de uso diario y consumibles.	110	t	2025-12-29 15:17:55.588779+00	\N	0856ba7b-e67b-9859-41b4-82d361a94f1c	2026-02-15 23:12:28.565594+00	\N	{insumo}
eabe4da6-c56c-21e8-4025-b00254b11f27	ASEO, LIMPIEZA Y SEGURIDAD	aseo-limpieza-y-seguridad	Categoria orientativa para ASEO, LIMPIEZA Y SEGURIDAD. Puede incluir materias primas, insumos de uso diario y consumibles.	300	t	2025-12-29 15:14:10.595186+00	\N	\N	2026-02-15 23:12:28.565594+00	\N	{insumo}
f9b30d66-aa10-bf8c-630c-b9098d78f340	EMPAQUES Y DESECHABLES (Non-Food)	empaques-y-desechables-non-food	Categoria orientativa para EMPAQUES Y DESECHABLES (Non-Food). Puede incluir materias primas, insumos de uso diario y consumibles.	200	t	2025-12-29 15:14:10.595186+00	\N	\N	2026-02-15 23:12:28.565594+00	\N	{insumo}
710b8e2e-11b2-49b5-87f5-2ed3b34458f0	Servicio a la Mesa (Vajilla)	servicio-a-la-mesa-vajilla	Platos (base, postre, hondo), cubiertos (metal), cristalería (vasos, copas), tazas de café/platos.	420	t	2025-12-04 22:41:05.749688+00	\N	13043af3-f893-ac45-5b39-a68aeec5197c	2026-02-13 21:17:40.885698+00	\N	{equipo}
5a1065c6-ccc5-4c34-9543-66e5d7adb5ef	Barismo	barismo	Jarras de leche, tampers, gomas para la máquina.	430	t	2025-12-04 22:41:24.088894+00	\N	13043af3-f893-ac45-5b39-a68aeec5197c	2026-02-15 13:32:46.672707+00	\N	{equipo}
5984640e-010a-40ba-ba6e-91af39a01b92	Cocina Caliente/Producción	cocina-caliente-produccion	Sartenes, ollas, gastronorms (azafates de acero/policarbonato), cuchillos profesionales, tablas de corte (códigos de color), batidores, espátulas, mangas pasteleras, boquillas, moldes.	410	t	2025-12-04 22:40:45.129533+00	\N	13043af3-f893-ac45-5b39-a68aeec5197c	2026-02-15 13:33:00.102104+00	\N	{equipo}
1be27a87-9eaa-40e3-9caa-c8197ccb3fa7	Salsas y Condimentos Líquidos	salsas-y-condimentos-liquidos	Salsa de soya, inglesa, vinagres (balsámico, blanco, manzana), mayonesa base, mostaza, ketchup.	115	t	2025-12-04 22:10:01.113426+00	\N	dd3ffe62-d767-72bf-3570-65a472d0c17c	2026-02-15 19:59:35.410799+00	\N	{insumo}
6c9ea1c8-c3cb-4f78-b912-d3d53d7e78db	Granos y Cereales	granos-y-cereales	Arroz, avena, granola, quinoa.	114	t	2025-12-04 22:09:44.700894+00	\N	dd3ffe62-d767-72bf-3570-65a472d0c17c	2026-02-15 19:58:46.675228+00	\N	{insumo}
8f3d4085-ba82-473f-ab53-b209de0781a1	Café	cafe	Café en grano (tostión media/alta), café molido.	161	t	2025-12-04 22:20:34.585516+00	\N	48a21981-00aa-be91-a106-01885437384f	2026-02-15 19:59:50.30898+00	\N	{insumo}
5a9cbecf-82f3-49ab-888a-6434a9cd6f0d	Hierbas Frescas	hierbas-frescas	Romero, tomillo, perejil, cilantro, menta/hierbabuena.	124	t	2025-12-04 22:11:03.244581+00	\N	b4eb9d6d-a51c-3c72-2d23-53280bb3e5f5	2026-02-15 20:05:51.311538+00	\N	{insumo}
6fa3df53-dc2a-49e3-8640-f4f1108d3f75	Hojas Verdes	hojas-verdes	Lechuga (crespa/romana), rúcula (vital pizzería), espinaca, albahaca fresca (vital pesto/pizza).	122	t	2025-12-04 22:10:47.646379+00	\N	b4eb9d6d-a51c-3c72-2d23-53280bb3e5f5	2026-02-15 20:06:03.049314+00	\N	{insumo}
2bd01a9d-5b50-4389-a072-0093951adfe7	Verduras Base	verduras-base	Cebollas (blanca/roja), tomates (larga vida/chonto), ajos, pimentones, zanahorias.	121	t	2025-12-04 22:10:40.360684+00	\N	b4eb9d6d-a51c-3c72-2d23-53280bb3e5f5	2026-02-15 20:06:15.585377+00	\N	{insumo}
94d617b1-61c9-e33e-33cd-6395ba254e59	COCTELES	cocteles	\N	180	t	2025-12-29 15:40:23.77706+00	VCF	5fb77038-90d8-53ef-ad9a-30ed659a2592	2026-02-15 20:28:49.815662+00	\N	{venta}
47c01b43-01e5-51be-d522-4dcb42b317e4	JUGOS	jugos	\N	130	t	2025-12-29 15:40:23.77706+00	VCF	5fb77038-90d8-53ef-ad9a-30ed659a2592	2026-02-15 20:29:52.312969+00	\N	{venta}
1f28e287-0df5-5810-db2a-57685b9ca5a0	LIMONADAS	limonadas	\N	140	t	2025-12-29 15:40:23.77706+00	VCF	5fb77038-90d8-53ef-ad9a-30ed659a2592	2026-02-15 20:30:06.923183+00	\N	{venta}
e9ed5794-efab-b7bd-e5af-14928c9b6cf5	SMOOTHIE	smoothie	\N	150	t	2025-12-29 15:40:23.77706+00	VCF	5fb77038-90d8-53ef-ad9a-30ed659a2592	2026-02-15 22:05:35.415687+00	\N	{venta}
bf2d34b5-dddd-c010-95b9-0e6ff4444fce	SODAS	sodas	\N	170	t	2025-12-29 15:40:23.77706+00	VCF	5fb77038-90d8-53ef-ad9a-30ed659a2592	2026-02-15 22:05:51.95317+00	\N	{venta}
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."products" ("id", "name", "description", "sku", "price", "cost", "is_active", "created_at", "updated_at", "product_type", "category_id", "unit", "cost_original", "production_area_kind", "image_url", "catalog_image_url", "stock_unit_code") FROM stdin;
b322762d-9cc1-43d8-832e-66659eb63e74	Soda Hatsu Frambuesas	\N	VEN-SODAHA-000009	7500	2500	t	2026-02-18 13:47:10.698941+00	2026-02-25 20:36:54.381+00	venta	289c538d-601a-4b32-b9c4-97add71ad4c1	un	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/draft-reventa/product-1771422172480.png	\N	un
0515038c-0444-4dc1-92bf-4871f1ca2852	Guanciale	\N	INS-GUANCI-000015	\N	64.6	t	2026-02-19 16:18:33.223325+00	2026-02-19 20:18:28.071+00	insumo	60ab14fb-b415-4acd-a3d9-67cce6b98c42	g	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/draft-insumo/product-1771517879266.jpg	\N	g
0f839b07-be3a-46b3-bee2-582fb52a59b1	Soda Hatsu Sandia	\N	VEN-SODAHA-000008	7500	2500	t	2026-02-18 13:47:07.792412+00	2026-02-25 20:37:15.428+00	venta	289c538d-601a-4b32-b9c4-97add71ad4c1	un	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/draft-reventa/product-1771422172480.png	\N	un
f2c0bc54-d9d2-4c0e-9192-99bdd5cd86e6	Jugo de Naranja	\N	INS-JUGODE-000003	\N	5.99	t	2026-02-17 21:37:55.929856+00	2026-02-19 20:18:49.026+00	insumo	48c3774f-7ad1-4622-ac65-d3668ab0028d	ml	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/draft-insumo/product-1771364051008.png	\N	ml
209443bd-1d3f-4c92-82e4-833dfbae26d0	Base Roja Pizza	\N	PRE-BASERO-000022	\N	12.404896	t	2026-02-20 17:12:10.521667+00	2026-02-26 20:45:43.508+00	preparacion	fbf0d124-f22f-4d49-9d21-bfe23afcdf0e	g	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/draft-preparacion/product-1771607501026.jpg	\N	g
13d47350-ec1c-477a-afba-4146d0d0e9e0	Queso Crema Kraft	\N	INS-QUESOC-000019	\N	26.397059	t	2026-02-20 16:28:56.04135+00	2026-02-20 16:31:45.74+00	insumo	1b9e5159-f23f-481b-8e0f-490d8c3204a6	g	\N	general	\N	\N	g
28cd5694-b9d5-4c84-9d6c-9befd57b5846	Queso Suizo	\N	INS-QUESOS-000001	\N	830	t	2026-02-17 11:28:59.863652+00	2026-02-19 20:21:45.661+00	insumo	8a7c8558-7bf3-425b-8f0e-e530d14d6593	un	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/28cd5694-b9d5-4c84-9d6c-9befd57b5846/product-1771332577088.png	\N	un
334198ae-c394-48f2-83f5-af515905200b	Leche Entera	\N	INS-LECHEE-000011	\N	4.4	t	2026-02-19 15:04:46.662827+00	2026-02-19 20:20:13.998+00	insumo	1b9e5159-f23f-481b-8e0f-490d8c3204a6	ml	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/draft-insumo/product-1771513399076.png	\N	ml
54910231-e9b6-4a84-9739-9831bcc5f4a8	Leche Deslactosada	\N	INS-LECHED-000025	\N	3.727273	t	2026-02-20 19:57:20.244575+00	2026-02-20 19:58:12.584+00	insumo	1b9e5159-f23f-481b-8e0f-490d8c3204a6	ml	\N	general	\N	\N	ml
8ef62af2-c488-4e60-8279-2e68682eea38	Coca Cola Original	\N	VEN-COCACO-000005	7000	2500	t	2026-02-17 22:42:29.102138+00	2026-02-25 21:24:27.867+00	venta	289c538d-601a-4b32-b9c4-97add71ad4c1	un	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/draft-reventa/product-1771368134512.png	\N	un
c29cd6ec-3bdb-4495-aebc-6ed5d6051ad4	Coca Cola Zero	\N	VEN-COCACO-000006	7000	2500	t	2026-02-17 22:45:31.351243+00	2026-02-25 20:36:19.458+00	venta	289c538d-601a-4b32-b9c4-97add71ad4c1	un	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/draft-reventa/product-1771368313153.png	\N	un
ce7063ef-c60d-48ad-b253-346d9a99368a	Pepperoni	\N	INS-PEPPER-000016	\N	201.6	t	2026-02-19 16:22:19.30276+00	2026-02-19 20:20:29.651+00	insumo	91fa5a69-a47b-4be5-85b7-e86b0531e575	un	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/draft-insumo/product-1771518064505.jpg	\N	un
19ef7b56-03fe-4218-8fc0-a7c51f2ba7c6	Ensalada Baby Mix	\N	INS-ENSALA-000014	\N	80	t	2026-02-19 15:41:36.865086+00	2026-02-19 15:41:53.293+00	insumo	6fa3df53-dc2a-49e3-8640-f4f1108d3f75	g	\N	general	\N	\N	g
5bf72eab-09b1-43f6-aa65-11d888d92f9e	Queso Parmesano Rallado	\N	INS-QUESOP-000020	\N	58.55	t	2026-02-20 16:39:39.280796+00	2026-02-20 16:40:07.13+00	insumo	bf53f6e2-5733-4372-9bed-54b59356993e	g	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/draft-insumo/product-1771605512530.png	\N	g
6020f9ef-9bc0-4a65-87f6-c4d84f601f4b	Azucar Blanca	\N	INS-AZUCAR-000017	\N	3.2	t	2026-02-19 20:36:42.156601+00	2026-02-19 20:37:29.511+00	insumo	a61441c7-96e2-4f96-9dd4-17764dc3201a	g	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/draft-insumo/product-1771533330167.png	\N	g
575ced55-ca85-4c27-b3a9-abe2bac272cd	Crema de Leche	\N	INS-CREMAD-000012	\N	18.850575	t	2026-02-19 15:25:28.72055+00	2026-02-19 20:17:13.007+00	insumo	1b9e5159-f23f-481b-8e0f-490d8c3204a6	g	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/draft-insumo/product-1771514676154.png	\N	g
c80ed0d2-010f-4643-aed1-45ba8cf0e911	Queso Gouda	\N	INS-QUESOG-000002	\N	830	t	2026-02-17 11:31:25.544041+00	2026-02-19 20:20:48.413+00	insumo	8a7c8558-7bf3-425b-8f0e-e530d14d6593	un	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/c80ed0d2-010f-4643-aed1-45ba8cf0e911/product-1771332502266.png	\N	un
5db9eeab-548f-4989-80b0-9611ff918dad	Chorizo Santarrozano	\N	INS-CHORIZ-000013	\N	1990	t	2026-02-19 15:32:42.454883+00	2026-02-19 20:17:37.479+00	insumo	91fa5a69-a47b-4be5-85b7-e86b0531e575	un	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/draft-insumo/product-1771515141320.png	\N	un
318df1ec-d831-4fe7-ba6c-554ca0c78a5c	Queso Mozzarella Pizza	\N	INS-QUESOM-000010	\N	7600	t	2026-02-18 16:22:13.55361+00	2026-02-26 14:20:22.19+00	insumo	bf53f6e2-5733-4372-9bed-54b59356993e	kg	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/draft-insumo/product-1771431715485.png	\N	kg
cf3c5e31-17c4-4aaf-b456-b69efc6e8f1a	Coca Cola Pet	\N	INS-COCACO-000007	\N	7.75	t	2026-02-17 22:56:34.965252+00	2026-02-19 20:18:11.077+00	insumo	48c3774f-7ad1-4622-ac65-d3668ab0028d	ml	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/draft-insumo/product-1771368953846.png	\N	ml
edb369a7-b937-42b9-9e3d-4e0ae6466070	Oregano	\N	INS-OREGAN-000023	\N	33.615	t	2026-02-20 17:32:48.680633+00	2026-02-26 14:36:44.127+00	insumo	5a9cbecf-82f3-49ab-888a-6434a9cd6f0d	g	\N	general	\N	\N	g
ce0e5301-6d13-46d6-984b-7446639809e5	Aceite de Ajo Saudo	\N	PRE-ACEITE-000035	\N	3600	t	2026-02-20 21:02:11.882391+00	2026-02-20 21:05:22.939+00	preparacion	d381cd0b-489f-414b-ac8b-9939b795f79a	l	\N	general	\N	\N	l
37313d68-3e52-4509-80ef-a7fd3647f6da	Sal	\N	INS-SAL-000021	\N	2.7	t	2026-02-20 16:57:59.301825+00	2026-02-20 16:58:11.48+00	insumo	a61441c7-96e2-4f96-9dd4-17764dc3201a	g	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/draft-insumo/product-1771606656295.png	\N	g
5cc0d070-c4ec-4552-b35c-c7d03492a39f	Salmón Ahumado	\N	INS-SALMON-000024	\N	141	t	2026-02-20 19:55:44.854285+00	2026-02-20 19:55:45.228+00	insumo	33c7d7d9-47a7-4c8d-bee5-d15438148440	g	\N	general	\N	\N	g
786c4d51-fa92-4a99-ba68-9bc5b1b01bf1	Panko	\N	INS-PANKO-000026	\N	21	t	2026-02-20 19:59:55.961617+00	2026-02-20 19:59:56.317+00	insumo	95c5f953-8218-4299-9a21-d36917806e59	g	\N	general	\N	\N	g
acd24ce9-d4ae-4208-88f7-0bbc1d05bf23	Queso Azul Cuña	\N	INS-QUESOA-000027	\N	183.538889	t	2026-02-20 20:05:13.32446+00	2026-02-20 20:05:13.734+00	insumo	8a7c8558-7bf3-425b-8f0e-e530d14d6593	g	\N	general	\N	\N	g
ea45d1b3-4b3c-4c82-8cb6-dd12a5b4de73	Yogurt Finesse	\N	INS-YOGURT-000028	\N	10.9	t	2026-02-20 20:07:10.705797+00	2026-02-20 20:07:11.218+00	insumo	1b9e5159-f23f-481b-8e0f-490d8c3204a6	g	\N	general	\N	\N	g
17b89c99-fa06-46df-9b7a-4b12bdf7aab5	Mantequilla Alpina	\N	INS-MANTEQ-000030	\N	46.9752	t	2026-02-20 20:22:28.442186+00	2026-02-20 20:22:35.832+00	insumo	bc85ed2f-f2d8-40a6-93ae-03009c5ece6f	g	\N	general	\N	\N	g
e365bf9f-5b7b-4b1e-af42-5fadfdb909cb	Yogurt Griego	\N	INS-YOGURT-000029	\N	21.9	t	2026-02-20 20:08:21.976792+00	2026-02-20 20:20:13.074+00	insumo	1b9e5159-f23f-481b-8e0f-490d8c3204a6	g	\N	general	\N	\N	g
47b00115-54fe-403b-9724-a0f07f82016e	Pomodoro Pizza	\N	INS-POMODO-000031	\N	11.38	t	2026-02-20 20:28:56.891863+00	2026-02-20 20:28:57.239+00	insumo	e37b26a4-ffc9-4d55-896b-a7755d10e4f7	g	\N	general	\N	\N	g
914a9973-d465-4060-9edd-62e62212b4c5	Huevos AA	\N	INS-HUEVOS-000032	\N	416.666667	t	2026-02-20 20:33:05.292005+00	2026-02-20 20:33:21.543+00	insumo	27400416-3e34-4f58-b68f-c27ee34f4b3a	un	\N	general	\N	\N	un
cc5ae544-8255-4c02-a38d-a829fb36e8da	Queso Mozzarella Tajado	\N	INS-QUESOM-000033	\N	795.180723	t	2026-02-20 20:35:26.24773+00	2026-02-20 20:36:55.788+00	insumo	bf53f6e2-5733-4372-9bed-54b59356993e	un	\N	general	\N	\N	un
6244e86d-22b2-4d52-83fc-882899ddb943	Queso Paisa	\N	INS-QUESOP-000034	\N	24	t	2026-02-20 20:38:35.209973+00	2026-02-20 20:38:35.66+00	insumo	8a7c8558-7bf3-425b-8f0e-e530d14d6593	g	\N	general	\N	\N	g
d8f89235-55c7-4c43-a826-8b4713781146	Agua	\N	INS-AGUA-000018	\N	\N	t	2026-02-19 20:38:50.055808+00	2026-02-19 20:38:50.055808+00	insumo	48c3774f-7ad1-4622-ac65-d3668ab0028d	ml	\N	general	\N	\N	ml
92708031-37ba-4d0f-bbb5-0e5f3c3ac8b5	Ajo Pelado	\N	INS-AJOPEL-000036	\N	18	t	2026-02-20 21:04:45.112502+00	2026-02-20 21:04:45.374+00	insumo	2bd01a9d-5b50-4389-a072-0093951adfe7	g	\N	general	\N	\N	g
4a8426e1-7a26-4403-9649-3dc460da096c	Queso Provolone	\N	INS-QUESOP-000004	\N	830	t	2026-02-17 22:18:24.085513+00	2026-02-23 16:32:16.791+00	insumo	8a7c8558-7bf3-425b-8f0e-e530d14d6593	un	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/draft-insumo/product-1771366677278.png	\N	un
7c757e78-68ab-47a8-aff7-be53ccc89c77	Ginger Canada Dry Vidrio	\N	VEN-GINGER-000061	6000	2287.5	t	2026-02-25 21:34:10.586177+00	2026-02-25 21:34:23.562+00	venta	289c538d-601a-4b32-b9c4-97add71ad4c1	un	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/draft-reventa/product-1772055225998.png	\N	un
382b35f2-e12c-4ba7-afc0-bb944fb65e5b	Reducción de Vinagre Balsámico	\N	PRE-REDUCC-000043	\N	27.709951	t	2026-02-23 20:46:08.269006+00	2026-02-23 20:49:17.469+00	preparacion	d381cd0b-489f-414b-ac8b-9939b795f79a	g	\N	general	\N	\N	g
008d61d5-18a1-41db-8ff4-e6afd342b615	Soda Bretaña	\N	VEN-SODABR-000059	7000	2287.5	t	2026-02-25 21:02:02.584134+00	2026-02-25 21:02:41.031+00	venta	289c538d-601a-4b32-b9c4-97add71ad4c1	un	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/draft-reventa/product-1772053062969.png	\N	un
f80f232e-46e1-4e5a-a404-4579a1b72c44	Pechuga	\N	INS-PECHUG-000044	\N	18300	t	2026-02-23 21:07:32.430623+00	2026-02-23 21:07:51.879+00	insumo	3a14951c-aabf-4c54-9677-c835759519c0	kg	\N	general	\N	\N	kg
66a1ee94-ec4a-4530-bddf-d3824f85fd08	Cebolla Blanca	\N	INS-CEBOLL-000045	\N	3	t	2026-02-23 22:30:33.591776+00	2026-02-23 22:30:33.997+00	insumo	2bd01a9d-5b50-4389-a072-0093951adfe7	g	\N	general	\N	\N	g
93a22bf1-3646-44ef-b240-81c769fe92ea	Cebolla Roja	\N	INS-CEBOLL-000046	\N	5	t	2026-02-23 22:31:10.932056+00	2026-02-23 22:31:11.215+00	insumo	2bd01a9d-5b50-4389-a072-0093951adfe7	g	\N	general	\N	\N	g
0f9e4a4f-aa26-4267-9127-7c8d22997eb2	Salsa Base blanca	\N	PRE-SALSAB-000038	\N	23.302847	t	2026-02-23 16:40:49.442938+00	2026-02-23 19:58:03.159+00	preparacion	e3b64f52-79a4-4611-98c1-a8075b9506f6	g	\N	general	\N	\N	g
fa74b543-e07e-43e3-84a6-ea987ffeeb06	Jengibre	\N	INS-JENGIB-000047	\N	20	t	2026-02-23 22:34:32.597208+00	2026-02-23 22:34:32.963+00	insumo	5a9cbecf-82f3-49ab-888a-6434a9cd6f0d	g	\N	general	\N	\N	g
520b9e6a-0b15-4102-bebe-7ed4c33e5fea	Miel	\N	INS-MIEL-000040	\N	9.75	t	2026-02-23 20:24:11.679648+00	2026-02-23 20:24:39.617+00	insumo	a61441c7-96e2-4f96-9dd4-17764dc3201a	g	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/draft-insumo/product-1771878231053.png	\N	g
4437740c-2f53-43c7-ae41-0e8e82983f64	Perejil Crespo	\N	INS-PEREJI-000048	\N	15	t	2026-02-23 22:35:24.17027+00	2026-02-23 22:35:24.595+00	insumo	6fa3df53-dc2a-49e3-8640-f4f1108d3f75	g	\N	general	\N	\N	g
15d4a6f8-67fc-41ad-9c5e-2622e0a0cbbb	Banano	\N	INS-BANANO-000049	\N	4.99999	t	2026-02-23 22:36:12.294994+00	2026-02-23 22:36:12.75+00	insumo	d7496092-d0c4-422f-a6f0-70cc454b24d2	g	\N	general	\N	\N	g
ae75c0f7-ece7-46d5-ab70-0f7c44c7c4e2	Ají en Escamas	\N	INS-AJIENE-000041	\N	87.595532	t	2026-02-23 20:29:20.365545+00	2026-02-23 20:30:09.337+00	insumo	aaee8614-1f28-40ea-a270-74d8ea158954	g	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/draft-insumo/product-1771878551617.png	\N	g
2832b193-af6e-46f5-8d73-1b7051e6c105	Coco	\N	INS-COCO-000050	\N	7	t	2026-02-23 22:36:50.034795+00	2026-02-23 22:36:50.437+00	insumo	d7496092-d0c4-422f-a6f0-70cc454b24d2	g	\N	general	\N	\N	g
7f28b4fa-5510-4e0d-8426-b62c3b0a2cd7	Miel Peperoncino	\N	PRE-MIELPE-000039	\N	11.185216	t	2026-02-23 20:20:04.418044+00	2026-02-23 20:34:32.232+00	preparacion	d381cd0b-489f-414b-ac8b-9939b795f79a	g	\N	general	\N	\N	g
449a2b73-0c98-4e48-8269-c298519bf429	Duraznos	\N	INS-DURAZN-000051	\N	10	t	2026-02-23 22:37:47.641293+00	2026-02-23 22:37:47.924+00	insumo	d7496092-d0c4-422f-a6f0-70cc454b24d2	g	\N	general	\N	\N	g
a420c821-edee-44b7-9276-37fb195f8252	Vinagre Balsámico	\N	INS-VINAGR-000042	\N	26	t	2026-02-23 20:38:57.632052+00	2026-02-23 20:39:03.54+00	insumo	1be27a87-9eaa-40e3-9caa-c8197ccb3fa7	ml	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/draft-insumo/product-1771879129895.png	\N	ml
743a7513-4507-411a-9bb8-327526e8323a	Fresa	\N	INS-FRESA-000052	\N	16	t	2026-02-23 22:38:29.663581+00	2026-02-23 22:38:29.952+00	insumo	d7496092-d0c4-422f-a6f0-70cc454b24d2	g	\N	general	\N	\N	g
cff5ec9e-3ba6-4b7c-8125-1c4d347fb062	Limón Tahiti	\N	INS-LIMONT-000053	\N	3	t	2026-02-23 22:39:08.647966+00	2026-02-23 22:39:08.977+00	insumo	d7496092-d0c4-422f-a6f0-70cc454b24d2	g	\N	general	\N	\N	g
4042f395-e77d-4ca9-b06d-d111282076c9	Mango	\N	INS-MANGO-000054	\N	6	t	2026-02-23 22:40:36.402304+00	2026-02-23 22:40:36.862+00	insumo	d7496092-d0c4-422f-a6f0-70cc454b24d2	g	\N	general	\N	\N	g
3f7c5b37-beb2-4f97-bb1a-0ffab03d9d17	Manzana Verde	\N	INS-MANZAN-000055	\N	1700	t	2026-02-23 22:41:57.646538+00	2026-02-23 22:41:57.962+00	insumo	d7496092-d0c4-422f-a6f0-70cc454b24d2	un	\N	general	\N	\N	un
3e5ab6a2-e2c3-4477-a73c-d16787500800	Naranja Tangelo	\N	INS-NARANJ-000056	\N	9	t	2026-02-23 22:42:42.236948+00	2026-02-23 22:42:42.58+00	insumo	d7496092-d0c4-422f-a6f0-70cc454b24d2	g	\N	general	\N	\N	g
d064c496-2979-4433-a103-52d25723333c	Pera	\N	INS-PERA-000057	\N	2000	t	2026-02-23 22:43:18.478787+00	2026-02-23 22:43:18.713+00	insumo	d7496092-d0c4-422f-a6f0-70cc454b24d2	un	\N	general	\N	\N	un
485f1953-7644-4eeb-ad5c-595de849b3c5	Higos	\N	INS-HIGOS-000058	\N	8	t	2026-02-23 22:43:53.132368+00	2026-02-23 22:43:53.446+00	insumo	d7496092-d0c4-422f-a6f0-70cc454b24d2	g	\N	general	\N	\N	g
f9fdd102-1a36-45ea-8482-e4a1cdf2436a	Cerveza Heineken	\N	VEN-CERVEZ-000069	\N	1590.958333	t	2026-02-25 21:56:51.419848+00	2026-02-25 21:57:10.558+00	venta	289c538d-601a-4b32-b9c4-97add71ad4c1	un	\N	general	\N	\N	un
efb4f0b9-9fae-4116-a7b6-2a392611c2fb	Te Hatsu Blanco	\N	VEN-TEHATS-000064	7000	4166.666667	t	2026-02-25 21:44:40.002879+00	2026-02-25 21:44:53.028+00	venta	289c538d-601a-4b32-b9c4-97add71ad4c1	un	\N	general	\N	\N	un
d03ba8c8-661d-4e20-8211-6105a0a87032	Sémola de Trigo	\N	INS-SEMOLA-000037	\N	26	t	2026-02-23 16:39:40.855906+00	2026-02-25 21:25:46.999+00	insumo	95c5f953-8218-4299-9a21-d36917806e59	g	\N	general	\N	\N	g
349a0494-247a-4194-b3e8-6c604452fe8b	Ginger Canada Dry Pet	\N	INS-GINGER-000060	\N	2.777773	t	2026-02-25 21:36:37.608972+00	2026-02-25 21:38:34.658+00	insumo	48c3774f-7ad1-4622-ac65-d3668ab0028d	ml	\N	general	\N	\N	ml
3f4939ba-1afe-476d-9e61-039a7f6ffad4	Te Hatsu Amarillo	\N	VEN-TEHATS-000065	7000	4166.666667	t	2026-02-25 21:45:48.156008+00	2026-02-25 21:46:01.675+00	venta	289c538d-601a-4b32-b9c4-97add71ad4c1	un	\N	general	\N	\N	un
a0c40b80-ab43-44e5-8bf5-dc4177805443	Agua Hatsu	\N	VEN-AGUAHA-000067	\N	1770.833333	t	2026-02-25 21:48:23.823136+00	2026-02-25 21:50:03.08+00	venta	289c538d-601a-4b32-b9c4-97add71ad4c1	un	\N	general	\N	\N	un
42ad4143-2469-4ae0-8510-14507b614b6f	Te Hatsu Negro	\N	VEN-TEHATS-000063	7000	4166.666667	t	2026-02-25 21:39:23.500762+00	2026-02-25 21:41:48.304+00	venta	289c538d-601a-4b32-b9c4-97add71ad4c1	un	\N	general	\N	\N	un
f2f46cdd-497b-46e1-9085-a268fa56a43b	Cerveza Coronita	\N	VEN-CERVEZ-000072	\N	2900	t	2026-02-26 19:54:11.974525+00	2026-02-26 19:54:35.323+00	venta	289c538d-601a-4b32-b9c4-97add71ad4c1	un	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/draft-reventa/product-1772135645169.png	\N	un
db599e31-59ab-4ac3-9ea0-994ced46dc46	Te Hatsu Rojo	\N	VEN-TEHATS-000066	7000	4166.666667	t	2026-02-25 21:46:44.415964+00	2026-02-25 21:46:55.96+00	venta	289c538d-601a-4b32-b9c4-97add71ad4c1	un	\N	general	\N	\N	un
4f45a711-ae30-4188-be07-a0a94373fe64	Azúcar Morena	\N	INS-AZUCAR-000070	\N	4.3	t	2026-02-26 14:45:07.171312+00	2026-02-26 14:45:28.794+00	insumo	a61441c7-96e2-4f96-9dd4-17764dc3201a	g	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/draft-insumo/product-1772117094626.png	\N	g
2e08594c-6d0e-4ca0-ac81-06044d2723ea	Gaseosa Colombiana	\N	VEN-GASEOS-000068	\N	1792.708333	t	2026-02-25 21:52:13.922151+00	2026-02-25 21:52:25.822+00	venta	289c538d-601a-4b32-b9c4-97add71ad4c1	un	\N	general	\N	\N	un
2415f66a-330e-4dae-bf93-ebe941d8892a	Gaseosa Manzana	\N	VEN-GASEOS-000071	\N	1792.708333	t	2026-02-26 14:58:07.831631+00	2026-02-26 14:58:20.613+00	venta	289c538d-601a-4b32-b9c4-97add71ad4c1	un	\N	general	\N	\N	un
db59f493-f735-42f4-86ea-685c9d27eea6	Vino Blanco	\N	INS-VINOBL-000073	\N	30.7	t	2026-02-26 20:00:51.032731+00	2026-02-26 20:31:34.835+00	insumo	2f34de93-f2aa-44c2-8b73-38b48377afea	ml	\N	general	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/nexo-catalog-images/db59f493-f735-42f4-86ea-685c9d27eea6/product-1772137554510.png	\N	ml
cd7ff907-81b4-4890-a084-779188433ee3	Maggi	\N	INS-MAGGI-000074	\N	399	t	2026-02-26 20:35:06.881405+00	2026-02-26 20:35:24.284+00	insumo	aaee8614-1f28-40ea-a270-74d8ea158954	un	\N	general	\N	\N	un
84e0b57d-5343-4cab-83ed-19b5bc256d82	Cebolla Caramelizada	\N	PRE-CEBOLL-000075	\N	7.275015	t	2026-02-26 20:36:33.570983+00	2026-02-26 20:41:34.32+00	preparacion	98e23232-eeca-41cc-903a-82aacfead4bf	g	\N	general	\N	\N	g
d79d4bbe-bf38-4819-86ac-cf82c613351c	Papa Premium	\N	INS-PAPAPR-000076	\N	16.264	t	2026-03-02 13:51:51.055388+00	2026-03-02 13:52:01.43+00	insumo	2bd01a9d-5b50-4389-a072-0093951adfe7	g	\N	general	\N	\N	g
03f08229-33eb-411f-93d5-4591b7ced037	Papa Casco	\N	INS-PAPACA-000077	\N	17.155	t	2026-03-02 13:52:56.595343+00	2026-03-02 13:53:06.701+00	insumo	2bd01a9d-5b50-4389-a072-0093951adfe7	g	\N	general	\N	\N	g
27890c97-a0a2-4389-ac2d-f2b2a169415c	Mayonesa	\N	INS-MAYONE-000078	\N	22.27	t	2026-03-02 13:54:52.752679+00	2026-03-02 13:54:57.675+00	insumo	1be27a87-9eaa-40e3-9caa-c8197ccb3fa7	g	\N	general	\N	\N	g
292d8839-be37-4160-a5c2-b2abbbec0889	Queso Parmesano Cuña	\N	INS-QUESOP-000079	\N	85.443	t	2026-03-02 13:58:20.690115+00	2026-03-02 14:00:17.219+00	insumo	bf53f6e2-5733-4372-9bed-54b59356993e	g	\N	general	\N	\N	g
\.


--
-- Data for Name: inventory_ai_ingestion_matches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."inventory_ai_ingestion_matches" ("id", "item_id", "product_id_candidate", "score", "reason", "created_at") FROM stdin;
\.


--
-- Data for Name: inventory_cost_policies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."inventory_cost_policies" ("site_id", "cost_basis", "is_active", "updated_by", "updated_at") FROM stdin;
58362682-4ea3-4718-bd83-b4f311f885cd	net	t	\N	2026-02-16 14:23:56.244022+00
7da218c3-fbf2-4f5d-b033-2fa9a40f767c	net	t	\N	2026-02-16 14:23:56.244022+00
e8823211-100a-49b9-bb55-bbff432de43c	net	t	\N	2026-02-16 14:23:56.244022+00
407ccca3-bc35-4252-8998-7280623de78f	net	t	\N	2026-02-16 14:23:56.244022+00
59de8039-239a-4791-a20c-c2e7fe2344d3	net	t	\N	2026-02-16 14:23:56.244022+00
\.


--
-- Data for Name: inventory_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."inventory_locations" ("id", "site_id", "code", "zone", "aisle", "level", "description", "is_active", "capacity_units", "location_type", "created_at", "updated_at", "parent_location_id") FROM stdin;
145b6897-bbb2-4fd0-81c2-bd468158dd47	407ccca3-bc35-4252-8998-7280623de78f	LOC-CP-BOD-MAIN	BOD	MAIN	\N	\N	t	\N	storage	2026-02-06 21:34:32.183249+00	2026-02-06 21:34:32.183249+00	\N
8873b47f-1216-4860-9916-23a2f150b223	407ccca3-bc35-4252-8998-7280623de78f	LOC-CP-FRIO-MAIN	FRIO	MAIN	\N	\N	t	\N	storage	2026-02-06 21:35:00.401678+00	2026-02-06 21:35:00.401678+00	\N
a8e784f5-49c7-441a-9e38-252b5a3f0602	407ccca3-bc35-4252-8998-7280623de78f	LOC-CP-CONG-MAIN	CONG	MAIN	\N	\N	t	\N	storage	2026-02-06 21:35:07.938968+00	2026-02-06 21:35:07.938968+00	\N
eaf1b21b-92cc-434d-9d43-de5a0baafa57	407ccca3-bc35-4252-8998-7280623de78f	LOC-CP-N2P-MAIN	N2P	MAIN	\N	\N	t	\N	storage	2026-02-06 21:35:14.027207+00	2026-02-06 21:35:14.027207+00	\N
691e0755-52ab-4dc6-b2da-3751d8fb3dc6	407ccca3-bc35-4252-8998-7280623de78f	LOC-CP-N3P-MAIN	N3P	MAIN	\N	\N	t	\N	storage	2026-02-06 21:35:19.840648+00	2026-02-06 21:35:19.840648+00	\N
5638e990-4a99-4413-a223-3bf4572066ab	407ccca3-bc35-4252-8998-7280623de78f	LOC-CP-SECOS1-MAIN	SECOS1	MAIN	\N	\N	t	\N	storage	2026-02-06 21:35:28.739581+00	2026-02-06 21:35:28.739581+00	\N
\.


--
-- Data for Name: inventory_count_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."inventory_count_sessions" ("id", "site_id", "status", "scope_type", "scope_zone", "scope_location_id", "name", "created_at", "created_by", "closed_at", "closed_by") FROM stdin;
\.


--
-- Data for Name: inventory_count_lines; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."inventory_count_lines" ("id", "session_id", "product_id", "quantity_counted", "current_qty_at_close", "quantity_delta", "adjustment_applied_at") FROM stdin;
\.


--
-- Data for Name: purchase_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."purchase_orders" ("id", "supplier_id", "site_id", "status", "created_at", "expected_at", "received_at", "total_amount", "currency", "notes", "cost_center_id", "approved_by", "approval_date", "created_by") FROM stdin;
\.


--
-- Data for Name: inventory_entries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."inventory_entries" ("id", "site_id", "supplier_name", "invoice_number", "received_at", "status", "notes", "created_by", "created_at", "updated_at", "supplier_id", "purchase_order_id", "source_app", "entry_mode", "emergency_reason") FROM stdin;
\.


--
-- Data for Name: purchase_order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."purchase_order_items" ("id", "purchase_order_id", "product_id", "quantity_ordered", "quantity_received", "unit_cost", "line_total", "unit", "created_at") FROM stdin;
\.


--
-- Data for Name: inventory_entry_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."inventory_entry_items" ("id", "entry_id", "product_id", "quantity_declared", "quantity_received", "unit", "notes", "created_at", "location_id", "input_qty", "input_unit_code", "conversion_factor_to_stock", "stock_unit_code", "input_unit_cost", "stock_unit_cost", "line_total_cost", "cost_source", "currency", "purchase_order_item_id", "tax_included", "tax_rate", "net_unit_cost", "gross_unit_cost") FROM stdin;
\.


--
-- Data for Name: inventory_form_drafts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."inventory_form_drafts" ("id", "user_id", "form_key", "entity_id", "site_id", "step_id", "payload_json", "created_at", "updated_at", "expires_at") FROM stdin;
\.


--
-- Data for Name: inventory_lpns; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."inventory_lpns" ("id", "site_id", "code", "location_id", "status", "container_type", "notes", "created_at", "updated_at", "created_by", "label") FROM stdin;
\.


--
-- Data for Name: inventory_lpn_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."inventory_lpn_items" ("id", "lpn_id", "product_id", "quantity", "unit", "lot_number", "expiry_date", "received_at", "cost_per_unit", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: inventory_movement_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."inventory_movement_types" ("code", "name", "description", "affects_stock", "is_active", "created_at") FROM stdin;
purchase_in	Entrada por compra	Ingreso de productos desde orden de compra	1	t	2026-01-05 20:31:21.378189+00
production_in	Entrada por producción	Ingreso de productos desde producción/recetas	1	t	2026-01-05 20:31:21.378189+00
production_out	Salida por producción	Consumo de ingredientes para producción	-1	t	2026-01-05 20:31:21.378189+00
restock_in	Entrada por reabastecimiento	Ingreso desde transferencia entre sedes	1	t	2026-01-05 20:31:21.378189+00
restock_out	Salida por reabastecimiento	Salida para transferencia a otra sede	-1	t	2026-01-05 20:31:21.378189+00
sale_out	Salida por venta	Consumo por venta directa	-1	t	2026-01-05 20:31:21.378189+00
adjustment	Ajuste de inventario	Corrección manual de inventario (+/-)	0	t	2026-01-05 20:31:21.378189+00
initial_count	Conteo inicial	Carga inicial de inventario	1	t	2026-01-05 20:31:21.378189+00
receipt_in	Entrada	Entrada de inventario por recepcion	1	t	2026-01-31 20:51:15.881831+00
transfer_internal	Traslado interno	Movimiento interno entre LOCs	0	t	2026-01-31 20:57:36.301032+00
count	Conteo	Conteo cíclico de inventario	1	t	2026-01-31 21:07:47.894051+00
\.


--
-- Data for Name: pos_zones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."pos_zones" ("id", "site_id", "name", "color", "display_order", "is_active", "created_at") FROM stdin;
f453a97b-b98f-48c0-806a-a4c4b5aa4664	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	Salón Principal	#00d4ff	1	t	2025-12-16 15:07:26.488399+00
733c13e2-1d38-4c97-bb8f-4d1b78433a6e	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	Terraza	#10b981	1	t	2025-12-16 15:07:11.309177+00
\.


--
-- Data for Name: pos_tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."pos_tables" ("id", "site_id", "zone_id", "name", "table_number", "shape", "capacity", "position_x", "position_y", "rotation", "width", "height", "is_active", "created_at", "updated_at") FROM stdin;
139a4ba8-f975-414b-9e12-fcd7c5c01452	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	f453a97b-b98f-48c0-806a-a4c4b5aa4664	Mesa 2	2	bar	2	50	50	\N	\N	\N	f	2025-12-16 15:07:54.052791+00	2025-12-16 15:07:54.052791+00
cba09ded-00c3-4fb9-a222-70fece15b961	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	f453a97b-b98f-48c0-806a-a4c4b5aa4664	Mesa 3	3	square	4	50	50	\N	\N	\N	f	2025-12-16 15:09:00.878064+00	2025-12-16 15:09:00.878064+00
268ea381-1bf1-461d-bbbb-0dab39faca9d	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	f453a97b-b98f-48c0-806a-a4c4b5aa4664	Mesa 6	6	booth	6	50	50	\N	\N	\N	f	2025-12-16 15:09:53.224525+00	2025-12-16 15:09:53.224525+00
fa0c51e7-ffe0-4e5d-9429-44a96c65cead	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	f453a97b-b98f-48c0-806a-a4c4b5aa4664	Mesa 3	3	rectangular	4	70	20	\N	\N	\N	t	2025-12-16 15:09:06.712243+00	2025-12-16 15:09:06.712243+00
23d54a25-54a3-4287-bc56-5ec02916e234	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	f453a97b-b98f-48c0-806a-a4c4b5aa4664	Mesa 9	9	square	4	25	85	\N	\N	\N	t	2025-12-16 15:10:31.690718+00	2025-12-16 15:10:31.690718+00
4353c826-8a8d-4378-a9f4-cd752527c118	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	f453a97b-b98f-48c0-806a-a4c4b5aa4664	Mesa 7	7	square	4	85	85	\N	\N	\N	t	2025-12-16 15:10:18.694208+00	2025-12-16 15:10:18.694208+00
da068595-cd00-4e71-ab32-60da85cfabcb	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	f453a97b-b98f-48c0-806a-a4c4b5aa4664	Mesa 6	6	square	4	85	50	\N	\N	\N	t	2025-12-16 15:10:13.265666+00	2025-12-16 15:10:13.265666+00
def73e66-b3c1-44e7-87a3-3ae3b972ca74	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	f453a97b-b98f-48c0-806a-a4c4b5aa4664	Mesa 5	5	rectangular	4	55	50	90	\N	\N	t	2025-12-16 15:09:51.873785+00	2025-12-16 15:09:51.873785+00
1e9281e0-08ef-4483-bd8c-c5f3cef5dbda	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	f453a97b-b98f-48c0-806a-a4c4b5aa4664	Mesa 4	4	rectangular	4	25	50	90	\N	\N	t	2025-12-16 15:09:32.434556+00	2025-12-16 15:09:32.434556+00
842ac2d8-25f7-44f7-bbb0-6e29473aec85	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	f453a97b-b98f-48c0-806a-a4c4b5aa4664	Mesa 8	8	square	4	55	85	\N	\N	\N	t	2025-12-16 15:10:26.741608+00	2025-12-16 15:10:26.741608+00
0aab50c9-107d-4d57-bb72-dc20009ebd24	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	f453a97b-b98f-48c0-806a-a4c4b5aa4664	Mesa 1	1	rectangular	4	10	20	\N	\N	\N	t	2025-12-16 15:07:46.975662+00	2025-12-16 15:07:46.975662+00
a1c4e6dc-6a77-4ff8-ade5-7b172fa46b21	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	f453a97b-b98f-48c0-806a-a4c4b5aa4664	Mesa 2	2	rectangular	4	40	20	\N	\N	\N	t	2025-12-16 15:08:20.514586+00	2025-12-16 15:08:20.514586+00
f5bc5aa9-9a0d-4ca2-a116-c8d442884bca	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	733c13e2-1d38-4c97-bb8f-4d1b78433a6e	Mesa 10	10	bar	2	50	50	\N	\N	\N	f	2025-12-16 21:48:20.447886+00	2025-12-16 21:48:20.447886+00
9e615f54-5d79-4a45-83c9-fdbb77234cef	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	733c13e2-1d38-4c97-bb8f-4d1b78433a6e	Mesa 10	10	square	4	50	50	\N	\N	\N	t	2025-12-16 21:48:30.227762+00	2025-12-16 21:48:30.227762+00
\.


--
-- Data for Name: pos_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."pos_sessions" ("id", "site_id", "table_id", "server_id", "status", "pax", "opened_at", "closed_at", "notes", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."users" ("id", "full_name", "document_id", "phone", "role", "is_active", "created_at", "updated_at", "loyalty_points", "email", "document_type", "birth_date", "is_client", "marketing_opt_in", "has_reviewed_google", "last_review_prompt_date") FROM stdin;
f55dc39b-b393-43ae-9716-f8b3027b8823	Sofia Caceres	1091356121	3023658911	client	t	2026-03-01 15:02:48.364607+00	2026-03-01 15:02:48.364607+00	0	sofiach.1711@gmail.com	\N	2005-11-17	t	f	f	\N
0beb74a5-4159-4f27-a698-6bf2024d3e8e	Jeo García	1094935283	3232390822	client	t	2026-01-05 16:14:33.555568+00	2026-01-05 16:14:33.555568+00	0	jeo.garcia.urrego@gmail.com	\N	1993-04-10	t	f	f	\N
194649ee-3f1c-42ea-a44a-2abd87053c46	Carlos Alejandro Ibarra Ariza	1015470066	3163972664	client	t	2025-12-28 02:45:52.380444+00	2026-02-25 13:37:29.594836+00	0	carlosaaibarra@gmail.com	\N	1997-06-10	t	f	t	2026-02-24 16:01:29.062+00
57cb9ce4-aec4-4d99-8d66-ee6c0e6632b8	Deleted User	\N	\N	client	f	2026-02-13 13:37:38.080309+00	2026-02-13 13:57:19.004092+00	0	deleted+57cb9ce4@deleted.local	\N	\N	f	f	f	\N
4410fb38-8802-4a9e-986c-50adc0346883		\N	\N	client	t	2026-02-17 13:51:02.832551+00	2026-02-17 13:51:02.832551+00	0	ryan.ek7yg5sq.paid@icloud.com	\N	\N	t	f	f	\N
a95939bb-6f36-4826-8101-237e358bb12d		\N	\N	client	t	2026-02-27 17:33:11.406951+00	2026-02-27 17:33:11.406951+00	0	thonyyr10@gmail.com	\N	\N	t	f	f	\N
5b930b57-2934-4c11-bbc5-9b8e8e67d5ac		\N	\N	client	t	2026-02-24 16:11:19.4382+00	2026-02-24 16:11:19.4382+00	0	sadraparada1978@gmail.com	\N	\N	t	f	f	\N
0de870c5-8429-41ae-917d-54b6143ae99b		\N	\N	client	t	2026-03-04 21:31:43.603922+00	2026-03-04 21:31:43.603922+00	0	carlosasibarra@gmail.com	\N	\N	t	f	f	\N
912ba8a9-b5bf-4cc6-9252-9aefb3780c53		\N	\N	client	t	2026-02-21 16:32:38.302348+00	2026-02-21 16:32:38.302348+00	0	chelsyashley@hotmail.com	\N	\N	t	f	f	\N
71e4d936-7821-4d41-8e5e-9a5a41a9bf09		\N	\N	client	t	2026-02-21 16:52:55.427792+00	2026-02-21 16:52:55.427792+00	0	ao405369@gmail.com	\N	\N	t	f	f	\N
1db7df08-40c0-44c7-b117-57ce027e79bc		\N	\N	client	t	2026-02-23 21:58:13.656972+00	2026-02-23 21:58:13.656972+00	0	lealangieviv@gmail.com	\N	\N	t	f	f	\N
ad3e2c03-6ad3-4476-a2fa-30c74e96fea8		\N	\N	client	t	2026-02-23 22:25:14.995541+00	2026-02-23 22:25:14.995541+00	0	mv1322250@gmail.com	\N	\N	t	f	f	\N
178878fb-2d72-417d-8740-e9e2543a02fd		\N	\N	client	t	2026-02-23 23:25:49.315982+00	2026-02-23 23:25:49.315982+00	0	angelicanunez840@gmail.com	\N	\N	t	f	f	\N
0857f8d1-0fc8-4c63-a8d2-d74333e90a9d	Nathalia Ibarra	1020797567	3165352667	client	t	2026-01-03 23:10:52.363733+00	2026-01-03 23:10:52.363733+00	0	ncibarraariza@gmail.com	\N	1994-10-01	t	f	f	\N
3456e710-6211-42bf-9632-3aefa8eefa32	Test Account	1111111111	3100000000	client	t	2026-02-02 15:55:45.93187+00	2026-02-25 17:02:20.494+00	0	test@ventogroup.com	\N	2000-01-01	t	f	f	\N
bb32bebd-3de6-4004-8d98-560bbc7f8ea5		\N	\N	client	t	2026-02-12 14:04:57.952351+00	2026-02-12 14:04:57.952351+00	0	carlos_ibari@hotmail.con	\N	\N	t	f	f	\N
918d6e53-91c0-4d05-acf0-e97194880f02		\N	\N	client	t	2026-02-13 13:57:45.026207+00	2026-02-13 13:57:45.026207+00	0	dev.ventogroup@gmail.com	\N	\N	t	f	f	\N
88d82db7-7da3-4c83-ad91-69306e0ebe4c		\N	\N	client	t	2026-02-27 18:21:11.677697+00	2026-02-27 18:21:11.677697+00	0	ajpm19@hotmail.com	\N	\N	t	f	f	\N
a2b3e826-faa4-4c45-82e1-cdcacbf177f2		\N	\N	client	t	2026-03-01 22:51:51.918723+00	2026-03-01 22:51:51.918723+00	0	alexandra11-05@hotmail.com	\N	\N	t	f	f	\N
f526fbf0-90f4-4b75-b06e-2c12f692f7f9	Angie Paola Alvarez Pineda	1093782961	3102468374	client	t	2026-02-21 16:26:20.027446+00	2026-02-21 16:26:20.027446+00	0	angiepaolaalvarez95@gmail.com	\N	1995-12-28	t	f	f	\N
9b75f26e-cc61-43b6-bde1-d248c3caf0ad		\N	\N	client	t	2026-02-21 16:40:43.762801+00	2026-02-21 16:40:43.762801+00	0	esneiderely@gmail.com	\N	\N	t	f	f	\N
80324888-621d-4c41-bd59-d42db17e1ea8		\N	\N	client	t	2026-02-23 21:33:10.06478+00	2026-02-23 21:33:10.06478+00	0	valejuliana2017@gmail.com	\N	\N	t	f	f	\N
cd4883c8-8894-4d94-8e7b-588d3dbab380		\N	\N	client	t	2026-02-23 22:16:42.175567+00	2026-02-23 22:16:42.175567+00	0	asarmientoobando10@gmail.com	\N	\N	t	f	f	\N
ea80aafc-2568-43e1-abbe-eeb2ef1cafad		\N	\N	client	t	2026-02-23 22:45:54.536514+00	2026-02-23 22:45:54.536514+00	0	danielafernandara@ufps.edu.co	\N	\N	t	f	f	\N
ba9733fb-acda-4848-8717-c423698bc006		\N	\N	client	t	2026-02-24 15:11:28.020143+00	2026-02-24 15:11:28.020143+00	0	carlosromeroflu@gmail.com	\N	\N	t	f	f	\N
a370641b-d5ad-4d57-8245-d1fbc0de3cc9		\N	\N	client	t	2026-02-24 15:13:45.482354+00	2026-02-24 15:13:45.482354+00	0	edgarferneynp@ufps.edu.co	\N	\N	t	f	f	\N
18e90fdd-3042-47a2-aac3-e02bb1752278		\N	\N	client	t	2026-02-24 16:14:33.584782+00	2026-02-24 16:14:33.584782+00	0	velandiahernandezvalentina@gmail.com	\N	\N	t	f	f	\N
5956c01b-e275-4b8d-8288-71ee612bcc5f	Carlos  Ibarra	13438846	3153832145	client	t	2026-01-09 20:54:55.905013+00	2026-01-09 20:54:55.905013+00	0	cajoibro@gmail.com	\N	1957-08-22	t	f	f	\N
faca7b1d-51bb-4ffc-9804-9d5a04e90c48	Angie Nuncira	1093594072	3006369497	client	t	2026-01-10 14:27:28.670307+00	2026-01-10 14:27:28.670307+00	0	angienatalianuncira@gmail.com	\N	2007-01-09	t	f	f	\N
ba2662a1-56ef-4edd-bc8f-e055448dfa6c	Yulian Cordoba	1004812193	3107954043	client	t	2026-01-09 15:55:47.487939+00	2026-01-09 15:55:47.487939+00	0	yulianstevencr@ufps.edu.co	\N	2003-09-25	t	f	f	\N
08005a34-284d-49ab-9354-166911023e78	Test	123456789	6693334215	client	t	2026-02-10 07:15:39.882213+00	2026-02-10 07:15:39.882213+00	0	nathannorth2005@gmail.com	\N	2023-01-01	t	f	f	\N
34b5c34f-4b7d-4775-bb0a-a45eccfa122b		\N	\N	client	t	2026-02-12 14:11:26.606739+00	2026-02-12 14:11:26.606739+00	0	carlos_ibari@hotmail.com	\N	\N	t	f	f	\N
2ba2357d-4b66-4145-b62f-73587f82af6f		\N	\N	client	t	2026-02-13 22:10:29.726561+00	2026-02-13 22:10:29.726561+00	0	juliandy@ventocafe.com	\N	\N	t	f	f	\N
5fcd8cf0-da6b-4116-90b4-552ec9d3593b		\N	\N	client	t	2026-02-21 16:27:22.315654+00	2026-02-21 16:27:22.315654+00	0	chelseabarbosaes@gmail.com	\N	\N	t	f	f	\N
549cf4fa-7d4a-46ea-ba5a-1357bc6f9a85		\N	\N	client	t	2026-02-21 16:49:15.963669+00	2026-02-21 16:49:15.963669+00	0	mariaalexandraariasdiaz@gmail.com	\N	\N	t	f	f	\N
ce157dc6-3528-4826-a3c5-a6c415c429f0		\N	\N	client	t	2026-02-21 16:50:47.039562+00	2026-02-21 16:50:47.039562+00	0	nicol_sebastian1997@outlook.es	\N	\N	t	f	f	\N
127bb6ba-aec8-44f5-bbd3-825fdd6599a9		\N	\N	client	t	2026-02-23 21:35:24.884654+00	2026-02-23 21:35:24.884654+00	0	davidbn223@gmail.com	\N	\N	t	f	f	\N
21c92791-e683-4157-a98e-4ca692ee8ce8		\N	\N	client	t	2026-02-23 22:22:18.541827+00	2026-02-23 22:22:18.541827+00	0	caritorojas943@gmail.com	\N	\N	t	f	f	\N
ca3db823-72fd-46b1-946e-8c10bb1b9eb8		\N	\N	client	t	2026-02-23 22:22:47.469928+00	2026-02-23 22:22:47.469928+00	0	cpvillamediana@gmail.com	\N	\N	t	f	f	\N
4d03b153-c466-4d6b-8fef-d42b80b55ca1		\N	\N	client	t	2026-02-23 22:54:17.637186+00	2026-02-23 22:54:17.637186+00	0	ortizyare394@gmail.com	\N	\N	t	f	f	\N
12f6a510-3ae9-40de-ad9f-95ce7bf86823		\N	\N	client	t	2026-02-23 22:54:44.254424+00	2026-02-23 22:54:44.254424+00	0	jamese101953@gmail.com	\N	\N	t	f	f	\N
3f84c651-65a1-4654-bb04-23647170d7ab	María Fernanda Pereira	1092525945	3224517318	client	t	2026-01-10 14:40:19.465138+00	2026-01-13 14:33:11.323775+00	0	mafer12pereira@gmail.com	\N	2004-10-07	t	f	f	\N
fa0bfc44-72b7-4d9f-98a2-ce5203335b3f	Maria Rozo	1090367214	3167734202	client	t	2026-02-24 15:23:07.988469+00	2026-02-24 15:23:07.988469+00	0	marrozo@outlook.es	\N	2004-04-23	t	f	f	\N
ed777c2c-2b30-484a-aa7a-b86a74ffacb5	Juan Andrés Paternina	1092941748	3224124884	client	t	2026-02-28 21:35:31.683446+00	2026-02-28 21:35:31.683446+00	0	ja861667@gmail.com	\N	\N	t	f	f	\N
c43c5eeb-6ed9-4808-b174-fe0fbfc738d6		\N	\N	client	t	2026-03-02 18:59:18.166041+00	2026-03-02 18:59:18.166041+00	0	astroangela1184@gmail.com	\N	\N	t	f	f	\N
2931cc46-273a-4ace-bb5f-baac00365462		\N	\N	client	t	2026-02-24 22:45:22.608049+00	2026-02-24 22:45:22.608049+00	0	qmichael727@gmail.com	\N	\N	t	f	f	\N
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."orders" ("id", "client_id", "order_type", "source", "table_number", "status", "payment_status", "total_amount", "notes", "created_at", "updated_at", "inventory_processed", "loyalty_processed", "loyalty_points_awarded", "guest_info", "site_id", "session_id", "server_id", "split_type", "discount_amount", "discount_reason", "voided_at", "voided_by", "void_reason", "fulfillment_type", "requested_for", "contact_phone", "delivery_address", "delivery_zone", "delivery_fee_amount", "dispatch_status", "dispatch_partner", "dispatch_reference", "confirmed_at", "ready_for_dispatch_at", "on_the_way_at", "delivered_at", "cancelled_at") FROM stdin;
\.


--
-- Data for Name: recipe_cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."recipe_cards" ("id", "product_id", "yield_qty", "yield_unit", "portion_size", "portion_unit", "prep_time_minutes", "shelf_life_days", "area", "difficulty", "is_active", "created_at", "updated_at", "site_id", "area_id", "recipe_description", "cover_image_path", "video_path", "status") FROM stdin;
d14d5755-8479-4827-a67c-5804700705a1	ce0e5301-6d13-46d6-984b-7446639809e5	1	l	\N	\N	\N	\N	\N	\N	t	2026-02-20 21:05:22.761176+00	2026-02-20 21:05:22.761176+00	407ccca3-bc35-4252-8998-7280623de78f	\N	\N	\N	\N	draft
c2867b83-b3d9-4e3d-bab7-44dd817fb357	0f9e4a4f-aa26-4267-9127-7c8d22997eb2	9	kg	1	kg	\N	\N	\N	\N	t	2026-02-23 16:49:11.111595+00	2026-02-23 16:49:11.111595+00	407ccca3-bc35-4252-8998-7280623de78f	\N	\N	\N	\N	draft
15135fdf-d062-46ce-9f11-795196ba9355	7f28b4fa-5510-4e0d-8426-b62c3b0a2cd7	1900	g	\N	\N	\N	\N	\N	\N	t	2026-02-23 20:20:39.854673+00	2026-02-23 20:20:39.854673+00	407ccca3-bc35-4252-8998-7280623de78f	\N	\N	\N	\N	draft
e933f2f4-a5dd-405a-a307-4122f4461b06	382b35f2-e12c-4ba7-afc0-bb944fb65e5b	4100	g	1000	g	\N	\N	\N	\N	t	2026-02-23 20:47:54.70557+00	2026-02-23 20:47:54.70557+00	407ccca3-bc35-4252-8998-7280623de78f	\N	\N	\N	\N	draft
f87e0e4b-098f-406f-952c-657382d72759	84e0b57d-5343-4cab-83ed-19b5bc256d82	6500	g	1	kg	\N	\N	\N	\N	t	2026-02-26 20:41:33.946911+00	2026-02-26 20:41:33.946911+00	59de8039-239a-4791-a20c-c2e7fe2344d3	\N	\N	\N	\N	draft
cb087955-4953-4de6-a5e0-cfec2da66655	209443bd-1d3f-4c92-82e4-833dfbae26d0	15000	g	1	kg	\N	\N	\N	\N	t	2026-02-20 17:37:32.312493+00	2026-02-20 17:37:32.312493+00	407ccca3-bc35-4252-8998-7280623de78f	\N	\N	\N	\N	draft
\.


--
-- Data for Name: production_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."production_batches" ("id", "site_id", "product_id", "recipe_card_id", "produced_qty", "produced_unit", "total_cost", "unit_cost", "status", "notes", "created_by", "created_at", "batch_code", "expires_at", "destination_location_id", "recipe_consumed") FROM stdin;
\.


--
-- Data for Name: production_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."production_requests" ("id", "created_at", "created_by", "from_location", "to_location", "status", "needed_for_date", "notes", "from_site_id", "to_site_id") FROM stdin;
\.


--
-- Data for Name: restock_requests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."restock_requests" ("id", "created_at", "created_by", "from_location", "to_location", "status", "expected_date", "notes", "from_site_id", "to_site_id", "pricing_mode", "pricing_status", "internal_supplier_site_id", "request_code", "requested_by_site_id", "status_updated_at", "prepared_at", "prepared_by", "in_transit_at", "in_transit_by", "received_at", "received_by", "cancelled_at", "closed_at", "priority", "request_type") FROM stdin;
21996bca-4c71-4e1b-b836-780f80893aa7	2026-02-19 19:15:42.045896+00	194649ee-3f1c-42ea-a44a-2abd87053c46	site:407ccca3-bc35-4252-8998-7280623de78f	site:58362682-4ea3-4718-bd83-b4f311f885cd	cancelled	2026-02-20	\N	407ccca3-bc35-4252-8998-7280623de78f	58362682-4ea3-4718-bd83-b4f311f885cd	none	draft	\N	\N	58362682-4ea3-4718-bd83-b4f311f885cd	2026-02-21 16:07:22.958+00	\N	\N	\N	\N	\N	\N	2026-02-21 16:07:22.958+00	\N	normal	internal
\.


--
-- Data for Name: inventory_movements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."inventory_movements" ("id", "site_id", "product_id", "movement_type", "quantity", "note", "related_order_id", "related_production_request_id", "related_restock_request_id", "created_at", "related_purchase_order_id", "unit_cost", "related_production_batch_id", "created_by", "input_qty", "input_unit_code", "conversion_factor_to_stock", "stock_unit_code", "stock_unit_cost", "line_total_cost") FROM stdin;
\.


--
-- Data for Name: inventory_stock_by_location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."inventory_stock_by_location" ("location_id", "product_id", "current_qty", "updated_at") FROM stdin;
\.


--
-- Data for Name: inventory_stock_by_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."inventory_stock_by_site" ("id", "site_id", "product_id", "current_qty", "min_qty", "max_qty", "updated_at", "avg_unit_cost") FROM stdin;
\.


--
-- Data for Name: inventory_supplier_aliases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."inventory_supplier_aliases" ("id", "supplier_id", "alias_text", "product_id", "supplier_sku", "confidence_boost", "is_active", "created_by", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: inventory_transfers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."inventory_transfers" ("id", "site_id", "from_loc_id", "to_loc_id", "status", "notes", "created_by", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: inventory_transfer_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."inventory_transfer_items" ("id", "transfer_id", "product_id", "quantity", "unit", "notes", "created_at", "input_qty", "input_unit_code", "conversion_factor_to_stock", "stock_unit_code") FROM stdin;
\.


--
-- Data for Name: inventory_unit_aliases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."inventory_unit_aliases" ("alias", "unit_code", "created_at") FROM stdin;
mililitro	ml	2026-02-13 16:02:30.746773+00
mililitros	ml	2026-02-13 16:02:30.746773+00
cc	ml	2026-02-13 16:02:30.746773+00
litro	l	2026-02-13 16:02:30.746773+00
litros	l	2026-02-13 16:02:30.746773+00
lt	l	2026-02-13 16:02:30.746773+00
lts	l	2026-02-13 16:02:30.746773+00
gramo	g	2026-02-13 16:02:30.746773+00
gramos	g	2026-02-13 16:02:30.746773+00
kilogramo	kg	2026-02-13 16:02:30.746773+00
kilogramos	kg	2026-02-13 16:02:30.746773+00
unidad	un	2026-02-13 16:02:30.746773+00
unidades	un	2026-02-13 16:02:30.746773+00
pza	un	2026-02-13 16:02:30.746773+00
pieza	un	2026-02-13 16:02:30.746773+00
docena	dz	2026-02-13 16:02:30.746773+00
\.


--
-- Data for Name: loyalty_transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."loyalty_transactions" ("id", "user_id", "order_id", "kind", "points_delta", "description", "metadata", "created_at") FROM stdin;
\.


--
-- Data for Name: loyalty_external_sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."loyalty_external_sales" ("id", "site_id", "user_id", "amount_cop", "points_awarded", "external_ref", "source_app", "awarded_by", "loyalty_transaction_id", "metadata", "created_at") FROM stdin;
\.


--
-- Data for Name: loyalty_rewards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."loyalty_rewards" ("id", "code", "name", "description", "points_cost", "is_active", "metadata", "created_at", "updated_at", "site_id") FROM stdin;
b5720b20-ef06-4209-bdda-00e145c2ae50	SAUDO-CAFE-CALIENTE-001	Café Caliente		120	t	{"category": "Bebidas", "image_url": "https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/product-images/cafe_caliente_sau.png"}	2026-01-12 19:12:19.77326+00	2026-01-12 19:12:19.77326+00	58362682-4ea3-4718-bd83-b4f311f885cd
3c17239e-8cf7-4142-af9b-fe75361460fb	VENTO-FRAPPE-CAFE-001	Frappé de Café	\N	300	t	{"category": "Bebidas", "image_url": "https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/product-images/frappe_de_cafe_vcf.png"}	2026-01-12 19:00:44.472726+00	2026-01-12 19:00:44.472726+00	7da218c3-fbf2-4f5d-b033-2fa9a40f767c
cff6cfdd-659c-482f-9edf-f209a8cd7b03	SAUDO-LUNA-001	Luna		240	t	{"category": "Panadería", "image_url": "https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/product-images/luna_sau.png"}	2026-01-12 19:14:37.582561+00	2026-01-12 19:14:37.582561+00	58362682-4ea3-4718-bd83-b4f311f885cd
e6496a9b-1baf-4f16-a300-2a20e612cf8f	SAUDO-PIZZA-001	Pizza de Pepperoni		650	t	{"category": "Pizzas", "image_url": "https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/product-images/pizza_peperoni_sau.png"}	2026-01-12 19:17:02.457111+00	2026-01-12 19:17:02.457111+00	58362682-4ea3-4718-bd83-b4f311f885cd
f8b2dfe3-6f0f-49e0-bb66-c1351437d097	SAUDO-PIZZA-002	Saudo Crush		750	t	{"category": "Pizzas", "image_url": "https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/product-images/saudo_crush_sau.png"}	2026-01-12 19:17:48.646931+00	2026-01-12 19:17:48.646931+00	58362682-4ea3-4718-bd83-b4f311f885cd
996a01fa-61a0-43e7-96a9-77966d953894	VENTO-CONO-HELADO-001	Cono de Helado	\N	140	t	{"category": "Postres", "image_url": "https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/product-images/cono_helado_vcf.png"}	2026-01-12 18:59:48.430075+00	2026-01-12 18:59:48.430075+00	7da218c3-fbf2-4f5d-b033-2fa9a40f767c
9fb59deb-0e34-4fcd-8aa3-9887e4c40412	VENTO-TORTA-BANANO-001	Torta de Banano	\N	320	t	{"category": "Pastelería", "image_url": "https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/product-images/torta_de_banano_vcf.png"}	2026-01-12 19:01:25.485131+00	2026-01-12 19:01:25.485131+00	7da218c3-fbf2-4f5d-b033-2fa9a40f767c
c916cce8-6518-4345-8265-da9e92484bae	VENTO-CAFE-CALIENTE-001	Café Caliente	\N	160	t	{"category": "Bebidas", "image_url": "https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/product-images/cafe_caliente_vcf.png"}	2026-01-12 18:57:24.178708+00	2026-01-12 18:57:24.178708+00	7da218c3-fbf2-4f5d-b033-2fa9a40f767c
89b71794-f35a-45f8-b1e0-5084a692cb00	SAUDO-TINTO-DE-VERANO-001	Tinto de Verano		400	t	{"category": "Bebidas", "image_url": "https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/product-images/tinto_de_verano_sau.png"}	2026-01-12 19:16:08.376801+00	2026-01-12 19:16:08.376801+00	58362682-4ea3-4718-bd83-b4f311f885cd
8e40bf8f-3c24-4dda-bde4-907261887fec	SAUDO-MATCHA-CALIENTE-001	Matcha Caliente		200	t	{"category": "Bebidas", "image_url": "https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/product-images/matcha_caliente_sau.png"}	2026-01-12 19:13:39.489462+00	2026-01-12 19:13:39.489462+00	58362682-4ea3-4718-bd83-b4f311f885cd
fdf5b74a-ded5-47a0-bfd1-caecbc1c7470	SAUDO-BIKINI-001	Bikini de Quesos		350	t	{"category": "Bikini", "image_url": "https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/product-images/bikini_de_quesos_sau.png"}	2026-01-12 19:15:22.16952+00	2026-01-12 19:15:22.16952+00	58362682-4ea3-4718-bd83-b4f311f885cd
8883f261-f4eb-4ed7-8f0c-5f8f62eab315	VENTO-MARRANITOS-001	Marranitos en Pijama	\N	440	f	{"category": "Entradas", "image_url": "https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/product-images/marranitos_en_pijama_vcf.png"}	2026-01-12 19:02:05.661413+00	2026-01-12 19:02:05.661413+00	7da218c3-fbf2-4f5d-b033-2fa9a40f767c
599a5800-9ff2-4c33-bac7-0aa5116e7842	VENTO-GALLETA-001	Galleta	\N	250	t	{"category": "Pastelería", "image_url": "https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/product-images/galleta_vcf.png"}	2025-12-18 19:22:28.027162+00	2025-12-18 19:22:28.027162+00	7da218c3-fbf2-4f5d-b033-2fa9a40f767c
eb70a00f-970b-498b-9690-d02c75f2e353	VENTO-SANDWICH-001	Sandwich de Albóndigas	\N	640	f	{"category": "Sandwich", "image_url": "https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/product-images/sandwich_de_albondigas_vcf.png"}	2026-01-13 15:14:00.309159+00	2026-01-13 15:14:00.309159+00	7da218c3-fbf2-4f5d-b033-2fa9a40f767c
4207d45e-b2fa-47c7-b558-2cdb6258459e	VENTO-ENTRADAS-001	Chorizitos Glaceados	\N	440	t	{"category": "Entradas", "image_url": "https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/product-images/chorizitos_vcf.jpeg"}	2026-02-24 15:23:16.881482+00	2026-02-24 15:23:16.881482+00	7da218c3-fbf2-4f5d-b033-2fa9a40f767c
df7f243a-3057-4159-b836-074a4ba8d2c8	VENTO-SANDWICH-002	Sandwich Pavo Club	\N	600	t	{"category": "Sandwich", "image_url": "https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/product-images/pavo_club_vcf.jpeg"}	2026-02-24 15:25:55.326889+00	2026-02-24 15:25:55.326889+00	7da218c3-fbf2-4f5d-b033-2fa9a40f767c
d7f2ff85-095e-4c8b-966f-41dad1339f15	VENTO-WAFFLES-001	Waffles Salados	\N	520	t	{"category": "Desayunos", "image_url": "https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/product-images/waffles_vcf.jpeg"}	2026-02-24 15:18:49.360058+00	2026-02-24 15:18:49.360058+00	7da218c3-fbf2-4f5d-b033-2fa9a40f767c
\.


--
-- Data for Name: loyalty_redemptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."loyalty_redemptions" ("id", "user_id", "order_id", "reward_id", "points_spent", "qr_code", "status", "metadata", "created_at", "validated_at", "site_id") FROM stdin;
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."order_items" ("id", "order_id", "product_id", "quantity", "unit_price", "total_amount", "notes", "created_at", "updated_at", "seat_number", "course", "status", "sent_at", "allergy_alert", "is_comped", "comp_reason") FROM stdin;
\.


--
-- Data for Name: pass_satellites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."pass_satellites" ("id", "code", "name", "subtitle", "tags", "site_id", "logo_url", "watermark_icon", "gradient_start", "gradient_end", "accent_color", "primary_color", "background_color", "text_color", "text_secondary_color", "card_color", "border_color", "indicator_color", "loading_color", "review_url", "maps_url", "address_override", "latitude_override", "longitude_override", "sort_order", "is_active", "created_at", "updated_at", "card_logo_url", "header_logo_url") FROM stdin;
5efe87da-e38e-4b71-b515-49feef097372	saudo	Pan & Pizza Masa Madre	Pizzas Napolitanas & Brunch	{"Pizzas Napolitanas",Bikinis,Vino}	58362682-4ea3-4718-bd83-b4f311f885cd	\N	pizza	#f2f2f2	#c7c7c7	#0739ad	#0739ad	#ededed	#1e293b	#989b9a	#faf3e3	#c8c9c4	#0739ad	#0739ad	\N	https://maps.app.goo.gl/UMjE4XmUP6vfoP4L6	Calle 3 #4e - 152 Local 4, Cúcuta, Norte de Santander	7.89585061	-72.49451878	20	t	2026-02-26 21:16:35.211228+00	2026-02-27 20:05:31.973074+00	\N	\N
f5e3cbc4-311e-41cd-b62a-02af229046c0	vento_cafe	Restaurante & Café	Desayunos, Fuertes & Bakery	{Brunch,Almuerzos,"Café & Pastelería"}	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	\N	utensils	#ecfeff	#e0f2fe	#2ec9c6	#1986a1	#fffbeb	#78350f	#a8a29e	#fef3c7	#fde68a	#2ec9c6	#2ec9c6	https://g.page/r/CRf3SZtHCgeUEBM/review	https://www.google.com/maps/place/Vento+Caf%C3%A9/@7.8913493,-72.4900376,17z/data=!3m1!4b1!4m6!3m5!1s0x8e664565772c2149:0x94070a479b49f717!8m2!3d7.8913493!4d-72.4900376!16s%2Fg%2F11l20qt4ps?entry=ttu	Colsag Frente al parque de la Clínica Santa Ana, Av. 10 Este #8 - 08 Local 1, Cúcuta, Norte de Santander	7.8913493	-72.4900376	10	t	2026-02-26 21:16:35.211228+00	2026-03-01 17:43:39.343433+00	\N	\N
687f62bf-8dad-4c19-ac46-097016972384	molka	Molka	\N	{"Amasijos Colombianos",Panadería,Pastelería}	fa679b86-397a-4155-8336-9bd3245ef1ce	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/pass-satellite-logos/molka/card-logo-1772388336727.png	cookie	#db9470	#ebfff7	#d35d22	#35594b	#ffffff	#000000	#ffffff	#ffffff	#d9d4be	#253c33	#d35d22	\N	\N	\N	\N	\N	40	t	2026-02-27 20:20:28.749031+00	2026-03-01 18:05:44.227956+00	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/pass-satellite-logos/molka/card-logo-1772388336727.png	https://clzdpinthhtknkmefsxx.supabase.co/storage/v1/object/public/pass-satellite-logos/molka/header-logo-1772388340889.png
\.


--
-- Data for Name: pos_cash_shifts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."pos_cash_shifts" ("id", "site_id", "employee_id", "status", "opened_at", "closed_at", "opening_amount", "expected_amount", "counted_amount", "difference", "notes", "created_at") FROM stdin;
\.


--
-- Data for Name: pos_cash_movements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."pos_cash_movements" ("id", "shift_id", "type", "amount", "payment_method", "reference", "description", "order_id", "created_by", "created_at") FROM stdin;
\.


--
-- Data for Name: pos_modifiers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."pos_modifiers" ("id", "site_id", "name", "type", "is_required", "min_selections", "max_selections", "display_order", "is_active", "created_at") FROM stdin;
\.


--
-- Data for Name: pos_modifier_options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."pos_modifier_options" ("id", "modifier_id", "name", "price_adjustment", "display_order", "is_default", "is_active", "created_at") FROM stdin;
\.


--
-- Data for Name: pos_order_item_modifiers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."pos_order_item_modifiers" ("id", "order_item_id", "modifier_id", "modifier_option_id", "price_adjustment", "created_at") FROM stdin;
\.


--
-- Data for Name: pos_payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."pos_payments" ("id", "order_id", "session_id", "shift_id", "payment_method", "amount", "tip_amount", "reference", "status", "processed_by", "created_at") FROM stdin;
\.


--
-- Data for Name: pos_product_modifiers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."pos_product_modifiers" ("id", "product_id", "modifier_id", "display_order", "created_at") FROM stdin;
\.


--
-- Data for Name: pos_session_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."pos_session_orders" ("id", "session_id", "order_id", "seat_number", "course", "course_status", "fired_at", "created_at") FROM stdin;
\.


--
-- Data for Name: procurement_agreed_prices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."procurement_agreed_prices" ("id", "supplier_id", "product_id", "agreed_price", "currency", "valid_from", "valid_until", "is_active") FROM stdin;
\.


--
-- Data for Name: procurement_receptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."procurement_receptions" ("id", "purchase_order_id", "received_by", "received_at", "site_id", "evidence_photo_url", "weight_source", "notes", "geolocation") FROM stdin;
\.


--
-- Data for Name: procurement_reception_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."procurement_reception_items" ("id", "reception_id", "product_id", "quantity_declared", "quantity_received") FROM stdin;
\.


--
-- Data for Name: product_cost_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."product_cost_events" ("id", "product_id", "site_id", "source", "source_entry_id", "source_adjust_movement_id", "qty_before", "qty_in", "cost_before", "cost_in", "cost_after", "basis", "created_at", "created_by") FROM stdin;
\.


--
-- Data for Name: product_inventory_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."product_inventory_profiles" ("product_id", "track_inventory", "inventory_kind", "default_unit", "lot_tracking", "expiry_tracking", "created_at", "updated_at", "unit_family", "costing_mode") FROM stdin;
92708031-37ba-4d0f-bbb5-0e5f3c3ac8b5	t	ingredient	g	f	f	2026-02-20 21:04:45.19389+00	2026-02-20 21:04:45.19389+00	mass	auto_primary_supplier
4a8426e1-7a26-4403-9649-3dc460da096c	t	ingredient	un	f	f	2026-02-17 22:18:24.170833+00	2026-02-23 16:32:16.348766+00	count	auto_primary_supplier
19ef7b56-03fe-4218-8fc0-a7c51f2ba7c6	t	ingredient	g	f	f	2026-02-19 15:41:36.950409+00	2026-02-19 15:41:52.929663+00	mass	auto_primary_supplier
2832b193-af6e-46f5-8d73-1b7051e6c105	t	ingredient	g	f	f	2026-02-23 22:36:50.126272+00	2026-02-23 22:36:50.126272+00	mass	auto_primary_supplier
449a2b73-0c98-4e48-8269-c298519bf429	t	ingredient	g	f	f	2026-02-23 22:37:47.708714+00	2026-02-23 22:37:47.708714+00	mass	auto_primary_supplier
743a7513-4507-411a-9bb8-327526e8323a	t	ingredient	g	f	f	2026-02-23 22:38:29.746951+00	2026-02-23 22:38:29.746951+00	mass	auto_primary_supplier
575ced55-ca85-4c27-b3a9-abe2bac272cd	t	ingredient	g	f	f	2026-02-19 15:25:28.797067+00	2026-02-19 20:17:12.571678+00	mass	auto_primary_supplier
5db9eeab-548f-4989-80b0-9611ff918dad	t	ingredient	un	f	f	2026-02-19 15:32:42.524364+00	2026-02-19 20:17:37.092425+00	count	auto_primary_supplier
cf3c5e31-17c4-4aaf-b456-b69efc6e8f1a	t	ingredient	ml	f	f	2026-02-17 22:56:35.101087+00	2026-02-19 20:18:10.650323+00	volume	auto_primary_supplier
0515038c-0444-4dc1-92bf-4871f1ca2852	t	ingredient	g	f	f	2026-02-19 16:18:33.339809+00	2026-02-19 20:18:27.813822+00	mass	auto_primary_supplier
f2c0bc54-d9d2-4c0e-9192-99bdd5cd86e6	t	ingredient	ml	f	f	2026-02-17 21:37:56.041722+00	2026-02-19 20:18:48.599847+00	volume	auto_primary_supplier
334198ae-c394-48f2-83f5-af515905200b	t	ingredient	l	f	f	2026-02-19 15:04:46.768787+00	2026-02-19 20:20:13.231065+00	volume	auto_primary_supplier
ce7063ef-c60d-48ad-b253-346d9a99368a	t	ingredient	un	f	f	2026-02-19 16:22:19.447411+00	2026-02-19 20:20:29.299721+00	count	auto_primary_supplier
c80ed0d2-010f-4643-aed1-45ba8cf0e911	t	ingredient	un	f	f	2026-02-17 11:31:25.618891+00	2026-02-19 20:20:48.035358+00	count	auto_primary_supplier
318df1ec-d831-4fe7-ba6c-554ca0c78a5c	t	ingredient	kg	f	f	2026-02-18 16:22:13.614497+00	2026-02-26 14:20:21.77275+00	mass	auto_primary_supplier
cff5ec9e-3ba6-4b7c-8125-1c4d347fb062	t	ingredient	g	f	f	2026-02-23 22:39:08.723444+00	2026-02-23 22:39:08.723444+00	mass	auto_primary_supplier
28cd5694-b9d5-4c84-9d6c-9befd57b5846	t	ingredient	un	f	f	2026-02-17 11:28:59.96368+00	2026-02-19 20:21:45.285489+00	count	auto_primary_supplier
6020f9ef-9bc0-4a65-87f6-c4d84f601f4b	t	ingredient	kg	f	f	2026-02-19 20:36:42.297644+00	2026-02-19 20:37:29.216553+00	mass	auto_primary_supplier
4042f395-e77d-4ca9-b06d-d111282076c9	t	ingredient	g	f	f	2026-02-23 22:40:36.525049+00	2026-02-23 22:40:36.525049+00	mass	auto_primary_supplier
13d47350-ec1c-477a-afba-4146d0d0e9e0	t	ingredient	g	f	f	2026-02-20 16:28:56.120069+00	2026-02-20 16:31:45.327544+00	mass	auto_primary_supplier
5bf72eab-09b1-43f6-aa65-11d888d92f9e	t	ingredient	g	f	f	2026-02-20 16:39:39.337253+00	2026-02-20 16:40:06.618188+00	mass	auto_primary_supplier
37313d68-3e52-4509-80ef-a7fd3647f6da	t	ingredient	g	f	f	2026-02-20 16:57:59.360985+00	2026-02-20 16:58:11.061371+00	mass	auto_primary_supplier
3f7c5b37-beb2-4f97-bb1a-0ffab03d9d17	t	ingredient	un	f	f	2026-02-23 22:41:57.719069+00	2026-02-23 22:41:57.719069+00	count	auto_primary_supplier
5cc0d070-c4ec-4552-b35c-c7d03492a39f	t	ingredient	g	f	f	2026-02-20 19:55:44.94062+00	2026-02-20 19:55:44.94062+00	mass	auto_primary_supplier
54910231-e9b6-4a84-9739-9831bcc5f4a8	t	ingredient	ml	f	f	2026-02-20 19:57:20.326363+00	2026-02-20 19:58:12.271779+00	volume	auto_primary_supplier
786c4d51-fa92-4a99-ba68-9bc5b1b01bf1	t	ingredient	g	f	f	2026-02-20 19:59:56.048557+00	2026-02-20 19:59:56.048557+00	mass	auto_primary_supplier
acd24ce9-d4ae-4208-88f7-0bbc1d05bf23	t	ingredient	g	f	f	2026-02-20 20:05:13.399814+00	2026-02-20 20:05:13.399814+00	mass	auto_primary_supplier
3e5ab6a2-e2c3-4477-a73c-d16787500800	t	ingredient	g	f	f	2026-02-23 22:42:42.312094+00	2026-02-23 22:42:42.312094+00	mass	auto_primary_supplier
d064c496-2979-4433-a103-52d25723333c	t	ingredient	un	f	f	2026-02-23 22:43:18.536938+00	2026-02-23 22:43:18.536938+00	count	auto_primary_supplier
ce0e5301-6d13-46d6-984b-7446639809e5	t	finished	l	f	f	2026-02-20 21:02:11.978648+00	2026-02-23 19:56:56.732686+00	volume	manual
485f1953-7644-4eeb-ad5c-595de849b3c5	t	ingredient	g	f	f	2026-02-23 22:43:53.180707+00	2026-02-23 22:43:53.180707+00	mass	auto_primary_supplier
d03ba8c8-661d-4e20-8211-6105a0a87032	t	ingredient	g	f	f	2026-02-23 16:39:40.915107+00	2026-02-25 21:25:46.581522+00	mass	auto_primary_supplier
ea45d1b3-4b3c-4c82-8cb6-dd12a5b4de73	t	ingredient	g	f	f	2026-02-20 20:07:10.778166+00	2026-02-20 20:07:10.778166+00	mass	auto_primary_supplier
0f9e4a4f-aa26-4267-9127-7c8d22997eb2	t	finished	kg	f	f	2026-02-23 16:40:49.524157+00	2026-02-23 19:58:53.638427+00	mass	manual
e365bf9f-5b7b-4b1e-af42-5fadfdb909cb	t	ingredient	g	f	f	2026-02-20 20:08:22.051873+00	2026-02-20 20:20:12.614701+00	mass	auto_primary_supplier
17b89c99-fa06-46df-9b7a-4b12bdf7aab5	t	ingredient	g	f	f	2026-02-20 20:22:28.514855+00	2026-02-20 20:22:35.574743+00	mass	auto_primary_supplier
47b00115-54fe-403b-9724-a0f07f82016e	t	ingredient	g	f	f	2026-02-20 20:28:56.979833+00	2026-02-20 20:28:56.979833+00	mass	auto_primary_supplier
914a9973-d465-4060-9edd-62e62212b4c5	t	ingredient	un	f	f	2026-02-20 20:33:05.372948+00	2026-02-20 20:33:21.174212+00	count	auto_primary_supplier
cc5ae544-8255-4c02-a38d-a829fb36e8da	t	ingredient	un	f	f	2026-02-20 20:35:26.304743+00	2026-02-20 20:36:55.331654+00	count	auto_primary_supplier
6244e86d-22b2-4d52-83fc-882899ddb943	t	ingredient	g	f	f	2026-02-20 20:38:35.303996+00	2026-02-20 20:38:35.303996+00	mass	auto_primary_supplier
520b9e6a-0b15-4102-bebe-7ed4c33e5fea	t	ingredient	g	f	f	2026-02-23 20:24:11.771367+00	2026-02-23 20:24:39.147909+00	mass	auto_primary_supplier
ae75c0f7-ece7-46d5-ab70-0f7c44c7c4e2	t	ingredient	g	f	f	2026-02-23 20:29:20.441694+00	2026-02-23 20:30:08.886207+00	mass	auto_primary_supplier
c29cd6ec-3bdb-4495-aebc-6ed5d6051ad4	t	resale	dz	f	f	2026-02-17 22:45:31.440768+00	2026-02-25 20:36:18.903934+00	count	auto_primary_supplier
7f28b4fa-5510-4e0d-8426-b62c3b0a2cd7	t	finished	g	f	f	2026-02-23 20:20:04.504348+00	2026-02-23 20:34:42.507321+00	mass	manual
a420c821-edee-44b7-9276-37fb195f8252	t	ingredient	ml	f	f	2026-02-23 20:38:57.730746+00	2026-02-23 20:39:03.179501+00	volume	auto_primary_supplier
d8f89235-55c7-4c43-a826-8b4713781146	t	ingredient	ml	f	f	2026-02-19 20:38:50.152926+00	2026-02-23 20:44:52.38775+00	volume	manual
382b35f2-e12c-4ba7-afc0-bb944fb65e5b	t	finished	g	f	f	2026-02-23 20:46:08.35091+00	2026-02-23 20:46:08.35091+00	mass	manual
f80f232e-46e1-4e5a-a404-4579a1b72c44	t	ingredient	kg	f	f	2026-02-23 21:07:32.562644+00	2026-02-23 21:07:51.575176+00	mass	auto_primary_supplier
66a1ee94-ec4a-4530-bddf-d3824f85fd08	t	ingredient	g	f	f	2026-02-23 22:30:33.712735+00	2026-02-23 22:30:33.712735+00	mass	auto_primary_supplier
93a22bf1-3646-44ef-b240-81c769fe92ea	t	ingredient	g	f	f	2026-02-23 22:31:10.987618+00	2026-02-23 22:31:10.987618+00	mass	auto_primary_supplier
fa74b543-e07e-43e3-84a6-ea987ffeeb06	t	ingredient	g	f	f	2026-02-23 22:34:32.686318+00	2026-02-23 22:34:32.686318+00	mass	auto_primary_supplier
4437740c-2f53-43c7-ae41-0e8e82983f64	t	ingredient	g	f	f	2026-02-23 22:35:24.265057+00	2026-02-23 22:35:24.265057+00	mass	auto_primary_supplier
15d4a6f8-67fc-41ad-9c5e-2622e0a0cbbb	t	ingredient	g	f	f	2026-02-23 22:36:12.456228+00	2026-02-23 22:36:12.456228+00	mass	auto_primary_supplier
b322762d-9cc1-43d8-832e-66659eb63e74	t	resale	un	f	f	2026-02-18 13:47:10.850934+00	2026-02-25 20:36:53.957509+00	count	auto_primary_supplier
0f839b07-be3a-46b3-bee2-582fb52a59b1	t	resale	un	f	f	2026-02-18 13:47:07.91782+00	2026-02-25 20:37:14.924886+00	count	auto_primary_supplier
008d61d5-18a1-41db-8ff4-e6afd342b615	t	resale	un	f	f	2026-02-25 21:02:02.660706+00	2026-02-25 21:02:40.272376+00	count	auto_primary_supplier
8ef62af2-c488-4e60-8279-2e68682eea38	t	resale	dz	f	f	2026-02-17 22:42:29.199444+00	2026-02-25 21:24:27.454181+00	count	auto_primary_supplier
7c757e78-68ab-47a8-aff7-be53ccc89c77	t	resale	un	f	f	2026-02-25 21:34:10.676063+00	2026-02-25 21:34:23.126053+00	count	auto_primary_supplier
349a0494-247a-4194-b3e8-6c604452fe8b	t	ingredient	ml	f	f	2026-02-25 21:36:37.703356+00	2026-02-25 21:38:34.359402+00	volume	auto_primary_supplier
42ad4143-2469-4ae0-8510-14507b614b6f	t	resale	un	f	f	2026-02-25 21:39:23.689588+00	2026-02-25 21:41:47.787423+00	count	auto_primary_supplier
efb4f0b9-9fae-4116-a7b6-2a392611c2fb	t	resale	un	f	f	2026-02-25 21:44:40.10543+00	2026-02-25 21:44:52.682251+00	count	auto_primary_supplier
3f4939ba-1afe-476d-9e61-039a7f6ffad4	t	resale	un	f	f	2026-02-25 21:45:48.244351+00	2026-02-25 21:46:01.23094+00	count	auto_primary_supplier
db599e31-59ab-4ac3-9ea0-994ced46dc46	t	resale	un	f	f	2026-02-25 21:46:44.543562+00	2026-02-25 21:46:55.584045+00	count	auto_primary_supplier
a0c40b80-ab43-44e5-8bf5-dc4177805443	t	resale	un	f	f	2026-02-25 21:48:23.909693+00	2026-02-25 21:50:02.617216+00	count	auto_primary_supplier
2e08594c-6d0e-4ca0-ac81-06044d2723ea	t	resale	un	f	f	2026-02-25 21:52:14.01236+00	2026-02-25 21:52:25.456725+00	count	auto_primary_supplier
f9fdd102-1a36-45ea-8482-e4a1cdf2436a	t	resale	un	f	f	2026-02-25 21:56:51.503654+00	2026-02-25 21:57:09.686752+00	count	auto_primary_supplier
edb369a7-b937-42b9-9e3d-4e0ae6466070	t	ingredient	g	f	f	2026-02-20 17:32:48.75324+00	2026-02-26 14:36:43.85005+00	mass	auto_primary_supplier
4f45a711-ae30-4188-be07-a0a94373fe64	t	ingredient	g	f	f	2026-02-26 14:45:07.265749+00	2026-02-26 14:45:28.469688+00	mass	auto_primary_supplier
2415f66a-330e-4dae-bf93-ebe941d8892a	t	resale	un	f	f	2026-02-26 14:58:07.926627+00	2026-02-26 14:58:20.009471+00	count	auto_primary_supplier
f2f46cdd-497b-46e1-9085-a268fa56a43b	t	resale	un	f	f	2026-02-26 19:54:12.077553+00	2026-02-26 19:54:34.889606+00	count	auto_primary_supplier
84e0b57d-5343-4cab-83ed-19b5bc256d82	t	finished	g	f	f	2026-02-26 20:36:33.683932+00	2026-02-26 20:36:33.683932+00	mass	manual
209443bd-1d3f-4c92-82e4-833dfbae26d0	t	finished	kg	f	f	2026-02-20 17:12:10.582548+00	2026-02-26 20:45:22.476272+00	mass	manual
db59f493-f735-42f4-86ea-685c9d27eea6	t	ingredient	ml	f	f	2026-02-26 20:00:51.146529+00	2026-02-26 20:31:34.405983+00	volume	auto_primary_supplier
cd7ff907-81b4-4890-a084-779188433ee3	t	ingredient	un	f	f	2026-02-26 20:35:06.957846+00	2026-02-26 20:35:23.963622+00	count	auto_primary_supplier
d79d4bbe-bf38-4819-86ac-cf82c613351c	t	ingredient	g	f	f	2026-03-02 13:51:51.148939+00	2026-03-02 13:52:00.9571+00	mass	auto_primary_supplier
03f08229-33eb-411f-93d5-4591b7ced037	t	ingredient	g	f	f	2026-03-02 13:52:56.715566+00	2026-03-02 13:53:06.372097+00	mass	auto_primary_supplier
27890c97-a0a2-4389-ac2d-f2b2a169415c	t	ingredient	g	f	f	2026-03-02 13:54:52.82393+00	2026-03-02 13:54:56.847805+00	mass	auto_primary_supplier
292d8839-be37-4160-a5c2-b2abbbec0889	t	ingredient	g	f	f	2026-03-02 13:58:20.776547+00	2026-03-02 14:00:16.713889+00	mass	auto_primary_supplier
\.


--
-- Data for Name: product_site_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."product_site_settings" ("id", "site_id", "product_id", "is_active", "created_at", "updated_at", "default_area_kind", "audience", "min_stock_qty", "min_stock_input_mode", "min_stock_purchase_qty", "min_stock_purchase_unit_code", "min_stock_purchase_to_base_factor") FROM stdin;
766fec78-e69e-40c9-a62e-cf569e55f8d8	58362682-4ea3-4718-bd83-b4f311f885cd	ce0e5301-6d13-46d6-984b-7446639809e5	t	2026-02-23 19:56:56.971938+00	2026-02-23 19:56:56.971938+00	\N	SAUDO	\N	base	\N	\N	\N
69947a24-a33a-4aa0-b501-78354b6ed711	407ccca3-bc35-4252-8998-7280623de78f	520b9e6a-0b15-4102-bebe-7ed4c33e5fea	t	2026-02-23 20:24:12.300838+00	2026-02-23 20:24:39.717167+00	\N	INTERNAL	\N	base	\N	\N	\N
70b4245a-bf31-48a1-9572-14b53a973c56	407ccca3-bc35-4252-8998-7280623de78f	a420c821-edee-44b7-9276-37fb195f8252	t	2026-02-23 20:38:58.174437+00	2026-02-23 20:39:03.638728+00	\N	INTERNAL	\N	base	\N	\N	\N
109a18fb-5bb8-4564-986f-f796ab541232	407ccca3-bc35-4252-8998-7280623de78f	f80f232e-46e1-4e5a-a404-4579a1b72c44	t	2026-02-23 21:07:33.449932+00	2026-02-23 21:07:51.998578+00	\N	INTERNAL	\N	base	\N	\N	\N
f90f592a-48d8-4350-aed5-ae0d1d4eae86	407ccca3-bc35-4252-8998-7280623de78f	fa74b543-e07e-43e3-84a6-ea987ffeeb06	t	2026-02-23 22:34:33.070327+00	2026-02-23 22:34:33.070327+00	\N	INTERNAL	\N	base	\N	\N	\N
c305bbb4-7207-4d25-b850-c6183a3afb84	407ccca3-bc35-4252-8998-7280623de78f	2832b193-af6e-46f5-8d73-1b7051e6c105	t	2026-02-23 22:36:50.536508+00	2026-02-23 22:36:50.536508+00	\N	INTERNAL	\N	base	\N	\N	\N
9e60757b-a5d4-4a78-bada-967c2b8f1cfa	407ccca3-bc35-4252-8998-7280623de78f	cff5ec9e-3ba6-4b7c-8125-1c4d347fb062	t	2026-02-23 22:39:09.091548+00	2026-02-23 22:39:09.091548+00	\N	INTERNAL	\N	base	\N	\N	\N
13d757bc-6bbd-4bb1-b38f-1ff2faedc84d	407ccca3-bc35-4252-8998-7280623de78f	3e5ab6a2-e2c3-4477-a73c-d16787500800	t	2026-02-23 22:42:42.684232+00	2026-02-23 22:42:42.684232+00	\N	INTERNAL	\N	base	\N	\N	\N
fe03a79b-e786-4d92-9c95-aa8b26d12623	407ccca3-bc35-4252-8998-7280623de78f	d064c496-2979-4433-a103-52d25723333c	t	2026-02-23 22:43:18.804548+00	2026-02-23 22:43:18.804548+00	\N	INTERNAL	\N	base	\N	\N	\N
ea32378d-6d7c-4a35-a839-1ec7f009bb13	58362682-4ea3-4718-bd83-b4f311f885cd	b322762d-9cc1-43d8-832e-66659eb63e74	t	2026-02-19 16:28:43.848857+00	2026-02-25 20:36:54.523939+00	\N	SAUDO	\N	base	\N	\N	\N
c80ae057-ac2a-4f46-bf37-ef63690e4a99	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	b322762d-9cc1-43d8-832e-66659eb63e74	t	2026-02-25 20:36:54.58095+00	2026-02-25 20:36:54.58095+00	\N	VCF	\N	base	\N	\N	\N
93deb8ca-640c-4e81-a926-31d478350d34	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	0f839b07-be3a-46b3-bee2-582fb52a59b1	t	2026-02-25 20:37:15.673049+00	2026-02-25 20:37:15.673049+00	\N	VCF	\N	base	\N	\N	\N
4ddbd133-11d6-46dd-8d86-c7286384c9c2	58362682-4ea3-4718-bd83-b4f311f885cd	008d61d5-18a1-41db-8ff4-e6afd342b615	t	2026-02-25 21:02:03.257565+00	2026-02-25 21:02:41.280437+00	\N	SAUDO	\N	base	\N	\N	\N
c256a6a1-b0a8-411d-98b6-5b9775113025	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	8ef62af2-c488-4e60-8279-2e68682eea38	t	2026-02-25 20:35:53.916724+00	2026-02-25 21:24:28.072451+00	\N	VCF	\N	base	\N	\N	\N
9e42069d-ba79-43f8-874d-4afaaf98a06e	58362682-4ea3-4718-bd83-b4f311f885cd	d03ba8c8-661d-4e20-8211-6105a0a87032	t	2026-02-25 21:25:47.1983+00	2026-02-25 21:25:47.1983+00	\N	SAUDO	\N	base	\N	\N	\N
66e07ec4-206e-47eb-bdc8-497ede0cd2b1	58362682-4ea3-4718-bd83-b4f311f885cd	7c757e78-68ab-47a8-aff7-be53ccc89c77	t	2026-02-25 21:34:11.230173+00	2026-02-25 21:34:23.738022+00	\N	SAUDO	\N	base	\N	\N	\N
2a945983-e9fe-49e6-8acc-a029a44c65bf	407ccca3-bc35-4252-8998-7280623de78f	2415f66a-330e-4dae-bf93-ebe941d8892a	t	2026-02-26 14:58:08.467136+00	2026-02-26 14:58:20.743634+00	\N	INTERNAL	48	purchase	2	un	24
17c081e9-6657-478d-8054-bb2bd40a3683	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	2415f66a-330e-4dae-bf93-ebe941d8892a	t	2026-02-26 14:58:08.594987+00	2026-02-26 14:58:20.905528+00	\N	VCF	\N	base	\N	\N	\N
c75a66c0-09fb-4dd5-be11-62a751fe109d	407ccca3-bc35-4252-8998-7280623de78f	349a0494-247a-4194-b3e8-6c604452fe8b	t	2026-02-25 21:36:38.204721+00	2026-02-25 21:38:34.770618+00	bodega	INTERNAL	5	base	\N	\N	\N
aa651c3c-e788-4741-8730-5d22935ab7b1	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	349a0494-247a-4194-b3e8-6c604452fe8b	t	2026-02-25 21:36:38.335273+00	2026-02-25 21:38:34.872913+00	\N	VCF	\N	base	\N	\N	\N
e2b18cc3-59dc-44b1-ae90-9a3044ca714a	58362682-4ea3-4718-bd83-b4f311f885cd	42ad4143-2469-4ae0-8510-14507b614b6f	t	2026-02-25 21:41:16.508428+00	2026-02-25 21:41:48.465861+00	\N	SAUDO	\N	base	\N	\N	\N
7468d580-87b5-4a97-ac71-2843bc33dc0a	407ccca3-bc35-4252-8998-7280623de78f	efb4f0b9-9fae-4116-a7b6-2a392611c2fb	t	2026-02-25 21:44:40.739624+00	2026-02-25 21:44:53.130826+00	\N	INTERNAL	12	purchase	2	un	6
b6a2a9c3-2b22-4e3a-922d-738dc703c269	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	efb4f0b9-9fae-4116-a7b6-2a392611c2fb	t	2026-02-25 21:44:40.865374+00	2026-02-25 21:44:53.239145+00	\N	VCF	\N	base	\N	\N	\N
5c20e188-620e-40e0-b962-7824220a672f	58362682-4ea3-4718-bd83-b4f311f885cd	3f4939ba-1afe-476d-9e61-039a7f6ffad4	t	2026-02-25 21:45:48.871439+00	2026-02-25 21:46:01.840557+00	\N	SAUDO	\N	base	\N	\N	\N
3150f651-6c50-4682-a607-5ba024679941	407ccca3-bc35-4252-8998-7280623de78f	db599e31-59ab-4ac3-9ea0-994ced46dc46	t	2026-02-25 21:46:45.050491+00	2026-02-25 21:46:56.061758+00	\N	INTERNAL	12	purchase	2	un	6
ae0e00c5-c678-4e9b-b96e-55334ae856d9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	db599e31-59ab-4ac3-9ea0-994ced46dc46	t	2026-02-25 21:46:45.14905+00	2026-02-25 21:46:56.172722+00	\N	VCF	\N	base	\N	\N	\N
ee20f10a-a1be-4364-9283-c79620398c36	58362682-4ea3-4718-bd83-b4f311f885cd	f2f46cdd-497b-46e1-9085-a268fa56a43b	t	2026-02-26 19:54:12.77191+00	2026-02-26 19:54:35.490874+00	\N	SAUDO	\N	base	\N	\N	\N
e7ee51c8-dbb3-47b1-ae29-5f2d14288b84	58362682-4ea3-4718-bd83-b4f311f885cd	a0c40b80-ab43-44e5-8bf5-dc4177805443	t	2026-02-25 21:48:24.416052+00	2026-02-25 21:50:03.288298+00	\N	SAUDO	\N	base	\N	\N	\N
1364f2db-1c24-4a72-a43b-2f351c1b93fb	407ccca3-bc35-4252-8998-7280623de78f	2e08594c-6d0e-4ca0-ac81-06044d2723ea	t	2026-02-25 21:52:14.520479+00	2026-02-25 21:52:25.913919+00	\N	INTERNAL	120	purchase	5	un	24
1e1b3081-c9b4-451a-b877-247047f046e9	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	2e08594c-6d0e-4ca0-ac81-06044d2723ea	t	2026-02-25 21:52:14.661429+00	2026-02-25 21:52:26.019654+00	\N	VCF	\N	base	\N	\N	\N
86201fdb-59f0-430c-8cb6-a496f21a44f2	58362682-4ea3-4718-bd83-b4f311f885cd	f9fdd102-1a36-45ea-8482-e4a1cdf2436a	t	2026-02-25 21:56:51.989158+00	2026-02-25 21:57:10.784822+00	\N	SAUDO	\N	base	\N	\N	\N
4c73ca22-a827-4376-a17a-744cc06651d8	407ccca3-bc35-4252-8998-7280623de78f	318df1ec-d831-4fe7-ba6c-554ca0c78a5c	t	2026-02-18 17:02:24.105318+00	2026-02-26 14:20:22.290095+00	bodega	INTERNAL	52.5	purchase	15	kg	3.5
5ceb8b67-3f07-467c-874f-140d99a777b3	407ccca3-bc35-4252-8998-7280623de78f	db59f493-f735-42f4-86ea-685c9d27eea6	t	2026-02-26 20:00:51.284787+00	2026-02-26 20:31:34.941691+00	\N	INTERNAL	\N	base	\N	\N	\N
e9d27dfa-5c1f-41ab-9eff-64468c6c2411	407ccca3-bc35-4252-8998-7280623de78f	84e0b57d-5343-4cab-83ed-19b5bc256d82	t	2026-02-26 20:36:33.758881+00	2026-02-26 20:36:33.758881+00	\N	INTERNAL	\N	base	\N	\N	\N
52345f99-4b2f-41bf-9958-7371e4e64604	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	84e0b57d-5343-4cab-83ed-19b5bc256d82	t	2026-02-26 20:36:33.945686+00	2026-02-26 20:36:33.945686+00	\N	VCF	\N	base	\N	\N	\N
b96c7de4-cfb3-4133-9fdd-391a427effa4	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	d79d4bbe-bf38-4819-86ac-cf82c613351c	t	2026-03-02 13:51:51.74443+00	2026-03-02 13:52:01.645671+00	\N	VCF	\N	base	\N	\N	\N
fe926ff8-3038-462f-bfb2-df3ade9f75c0	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	03f08229-33eb-411f-93d5-4591b7ced037	t	2026-03-02 13:52:57.518874+00	2026-03-02 13:53:06.852482+00	\N	VCF	\N	base	\N	\N	\N
6ff5cf43-7826-409d-9371-25912e5077cc	407ccca3-bc35-4252-8998-7280623de78f	292d8839-be37-4160-a5c2-b2abbbec0889	t	2026-03-02 13:58:21.328602+00	2026-03-02 14:00:17.364952+00	\N	INTERNAL	\N	base	\N	\N	\N
c9bb7f5a-0cdb-48d2-90c1-bff7a0cbc903	407ccca3-bc35-4252-8998-7280623de78f	ae75c0f7-ece7-46d5-ab70-0f7c44c7c4e2	t	2026-02-23 20:29:20.844071+00	2026-02-23 20:30:09.495004+00	\N	INTERNAL	\N	base	\N	\N	\N
be03da79-6246-4972-af90-b1667c7ef303	407ccca3-bc35-4252-8998-7280623de78f	66a1ee94-ec4a-4530-bddf-d3824f85fd08	t	2026-02-23 22:30:34.105432+00	2026-02-23 22:30:34.105432+00	\N	INTERNAL	\N	base	\N	\N	\N
abcc4834-9160-4941-9a03-452099847010	407ccca3-bc35-4252-8998-7280623de78f	7f28b4fa-5510-4e0d-8426-b62c3b0a2cd7	t	2026-02-23 20:20:04.646018+00	2026-02-23 20:34:42.666808+00	\N	INTERNAL	\N	base	\N	\N	\N
faa102e7-917c-455b-bf64-498fedead011	407ccca3-bc35-4252-8998-7280623de78f	d8f89235-55c7-4c43-a826-8b4713781146	t	2026-02-19 20:38:50.337464+00	2026-02-23 20:44:52.942442+00	\N	INTERNAL	\N	base	\N	\N	\N
2cd21fd7-d2b9-48f6-9b7d-c93a0671b1e0	407ccca3-bc35-4252-8998-7280623de78f	382b35f2-e12c-4ba7-afc0-bb944fb65e5b	t	2026-02-23 20:46:08.44391+00	2026-02-23 20:46:08.44391+00	\N	INTERNAL	\N	base	\N	\N	\N
405dba34-e567-4eb7-a0a5-fbbf862a7440	407ccca3-bc35-4252-8998-7280623de78f	4437740c-2f53-43c7-ae41-0e8e82983f64	t	2026-02-23 22:35:24.711522+00	2026-02-23 22:35:24.711522+00	\N	INTERNAL	\N	base	\N	\N	\N
9ad3cbc0-bf44-44c0-8a07-88a4a939bbb6	407ccca3-bc35-4252-8998-7280623de78f	449a2b73-0c98-4e48-8269-c298519bf429	t	2026-02-23 22:37:48.000494+00	2026-02-23 22:37:48.000494+00	\N	INTERNAL	\N	base	\N	\N	\N
f361d60e-4134-44e5-b300-b74765ae5442	58362682-4ea3-4718-bd83-b4f311f885cd	19ef7b56-03fe-4218-8fc0-a7c51f2ba7c6	t	2026-02-19 16:28:43.848857+00	2026-02-23 19:55:30.886521+00	\N	SAUDO	\N	base	\N	\N	\N
763c463b-a126-4f78-aa98-2ea1aba9341e	407ccca3-bc35-4252-8998-7280623de78f	575ced55-ca85-4c27-b3a9-abe2bac272cd	t	2026-02-19 15:25:29.240908+00	2026-02-23 19:55:30.886521+00	bodega	INTERNAL	8700	base	\N	\N	\N
d05bd206-a621-4e62-8e7d-cd543ac7e0ef	58362682-4ea3-4718-bd83-b4f311f885cd	575ced55-ca85-4c27-b3a9-abe2bac272cd	f	2026-02-19 16:28:43.848857+00	2026-02-23 19:55:30.886521+00	\N	SAUDO	\N	base	\N	\N	\N
6b068d26-732c-42c6-bc69-7d1f79d9e83a	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	575ced55-ca85-4c27-b3a9-abe2bac272cd	t	2026-02-19 20:17:13.24662+00	2026-02-23 19:55:30.886521+00	\N	VCF	\N	base	\N	\N	\N
4b8f185b-083d-4348-a503-b2d2e1533b85	407ccca3-bc35-4252-8998-7280623de78f	5db9eeab-548f-4989-80b0-9611ff918dad	t	2026-02-19 15:32:42.985598+00	2026-02-23 19:55:30.886521+00	bodega	INTERNAL	100	base	\N	\N	\N
40236bf3-525a-415a-a691-12fe71214a9a	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	5db9eeab-548f-4989-80b0-9611ff918dad	t	2026-02-19 20:17:37.654026+00	2026-02-23 19:55:30.886521+00	\N	VCF	\N	base	\N	\N	\N
cbe60e1c-3cb5-47a9-9e04-f166ec30f800	407ccca3-bc35-4252-8998-7280623de78f	cf3c5e31-17c4-4aaf-b456-b69efc6e8f1a	t	2026-02-17 22:56:35.622945+00	2026-02-23 19:55:30.886521+00	bodega	INTERNAL	\N	base	\N	\N	\N
cffa1c88-1158-4b0a-8527-278ba48f75e6	407ccca3-bc35-4252-8998-7280623de78f	0515038c-0444-4dc1-92bf-4871f1ca2852	t	2026-02-19 16:18:33.723534+00	2026-02-23 19:55:30.886521+00	bodega	INTERNAL	2	base	\N	\N	\N
86d739e5-00b1-40ed-b982-9f448e00826b	58362682-4ea3-4718-bd83-b4f311f885cd	0515038c-0444-4dc1-92bf-4871f1ca2852	f	2026-02-19 16:28:43.848857+00	2026-02-23 19:55:30.886521+00	\N	SAUDO	\N	base	\N	\N	\N
bb23b9b4-517f-4c11-b0c9-d1fcde6c5725	407ccca3-bc35-4252-8998-7280623de78f	f2c0bc54-d9d2-4c0e-9192-99bdd5cd86e6	t	2026-02-17 21:37:56.645553+00	2026-02-23 19:55:30.886521+00	bodega	INTERNAL	\N	base	\N	\N	\N
40eb7cb7-6e38-44ee-bfbf-7936af6eb96d	58362682-4ea3-4718-bd83-b4f311f885cd	f2c0bc54-d9d2-4c0e-9192-99bdd5cd86e6	t	2026-02-19 16:28:43.848857+00	2026-02-23 19:55:30.886521+00	\N	SAUDO	\N	base	\N	\N	\N
b0787535-6182-44e6-9957-0781858052c4	407ccca3-bc35-4252-8998-7280623de78f	6020f9ef-9bc0-4a65-87f6-c4d84f601f4b	t	2026-02-19 20:36:42.772467+00	2026-02-23 19:55:30.886521+00	\N	INTERNAL	30	base	\N	\N	\N
26096bb4-b609-457d-9a84-fe4ecc749f86	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	6020f9ef-9bc0-4a65-87f6-c4d84f601f4b	t	2026-02-19 20:36:42.826811+00	2026-02-23 19:55:30.886521+00	\N	VCF	\N	base	\N	\N	\N
3eefea5c-ed9b-4e18-8282-4a55f057fc94	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	f2c0bc54-d9d2-4c0e-9192-99bdd5cd86e6	t	2026-02-19 20:18:49.286547+00	2026-02-23 19:55:30.886521+00	\N	VCF	\N	base	\N	\N	\N
27212ee7-da24-4b90-afa6-1cbdbb6e9c6b	407ccca3-bc35-4252-8998-7280623de78f	19ef7b56-03fe-4218-8fc0-a7c51f2ba7c6	t	2026-02-19 15:41:37.457477+00	2026-02-23 19:55:30.886521+00	bodega	INTERNAL	1500	base	\N	\N	\N
d4b78390-5ddb-48fa-ab71-9507309d7768	407ccca3-bc35-4252-8998-7280623de78f	334198ae-c394-48f2-83f5-af515905200b	t	2026-02-19 15:04:47.307056+00	2026-02-23 19:55:30.886521+00	bodega	INTERNAL	\N	base	\N	\N	\N
c365b25b-becb-42ba-b173-d87bc0a13c03	58362682-4ea3-4718-bd83-b4f311f885cd	334198ae-c394-48f2-83f5-af515905200b	f	2026-02-19 16:28:43.848857+00	2026-02-23 19:55:30.886521+00	\N	SAUDO	\N	base	\N	\N	\N
2e799b14-f21a-4780-925c-a879ba7c14ea	407ccca3-bc35-4252-8998-7280623de78f	ce7063ef-c60d-48ad-b253-346d9a99368a	t	2026-02-19 16:22:20.022457+00	2026-02-23 19:55:30.886521+00	bodega	INTERNAL	1000	base	\N	\N	\N
a3d172c5-7b26-4471-a23f-685b79ef483f	58362682-4ea3-4718-bd83-b4f311f885cd	ce7063ef-c60d-48ad-b253-346d9a99368a	t	2026-02-19 16:28:43.848857+00	2026-02-23 19:55:30.886521+00	\N	SAUDO	\N	base	\N	\N	\N
671a0b0b-0048-4d11-9321-03081d127502	407ccca3-bc35-4252-8998-7280623de78f	c80ed0d2-010f-4643-aed1-45ba8cf0e911	t	2026-02-17 11:31:25.919054+00	2026-02-23 19:55:30.886521+00	bodega	INTERNAL	\N	base	\N	\N	\N
54bee110-c475-4e63-b7bd-dc2706adf1f3	58362682-4ea3-4718-bd83-b4f311f885cd	c80ed0d2-010f-4643-aed1-45ba8cf0e911	t	2026-02-19 16:28:43.848857+00	2026-02-23 19:55:30.886521+00	\N	SAUDO	\N	base	\N	\N	\N
a0fbf799-3c9b-41d2-9789-a1a85e8ecf7c	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	c80ed0d2-010f-4643-aed1-45ba8cf0e911	t	2026-02-19 20:20:48.62033+00	2026-02-23 19:55:30.886521+00	\N	VCF	\N	base	\N	\N	\N
b7ba3e8f-44da-44b4-94d5-7e1e7996bedb	407ccca3-bc35-4252-8998-7280623de78f	4a8426e1-7a26-4403-9649-3dc460da096c	t	2026-02-17 22:18:24.449801+00	2026-02-23 19:55:30.886521+00	bodega	INTERNAL	\N	base	\N	\N	\N
962b35db-0281-4a0d-9a37-8f29ec5777e2	58362682-4ea3-4718-bd83-b4f311f885cd	4a8426e1-7a26-4403-9649-3dc460da096c	f	2026-02-19 16:28:43.848857+00	2026-02-23 19:55:30.886521+00	\N	SAUDO	\N	base	\N	\N	\N
32072f3f-06b2-445a-8077-bbf2751ac7d8	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	4a8426e1-7a26-4403-9649-3dc460da096c	t	2026-02-19 20:21:31.08607+00	2026-02-23 19:55:30.886521+00	\N	VCF	\N	base	\N	\N	\N
53ebd25d-9c65-46d2-a8ce-ec768ce65127	407ccca3-bc35-4252-8998-7280623de78f	28cd5694-b9d5-4c84-9d6c-9befd57b5846	t	2026-02-17 11:29:00.111425+00	2026-02-23 19:55:30.886521+00	bodega	INTERNAL	\N	base	\N	\N	\N
67ddf243-535d-41ca-9c9b-e64ad997685c	58362682-4ea3-4718-bd83-b4f311f885cd	28cd5694-b9d5-4c84-9d6c-9befd57b5846	t	2026-02-19 16:28:43.848857+00	2026-02-23 19:55:30.886521+00	\N	SAUDO	\N	base	\N	\N	\N
328ba07b-c27e-4751-b586-911135acefc5	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	28cd5694-b9d5-4c84-9d6c-9befd57b5846	t	2026-02-19 20:21:45.886981+00	2026-02-23 19:55:30.886521+00	\N	VCF	\N	base	\N	\N	\N
44af7664-84c8-437e-bc61-7c63a764d8eb	407ccca3-bc35-4252-8998-7280623de78f	13d47350-ec1c-477a-afba-4146d0d0e9e0	t	2026-02-20 16:28:56.615926+00	2026-02-23 19:55:30.886521+00	bodega	INTERNAL	6800	base	\N	\N	\N
61bb62f3-994b-46a8-b33c-682624cf6f9c	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	13d47350-ec1c-477a-afba-4146d0d0e9e0	t	2026-02-20 16:28:56.684205+00	2026-02-23 19:55:30.886521+00	\N	VCF	\N	base	\N	\N	\N
6f022028-8962-464a-96f3-cb0675cbd9a1	407ccca3-bc35-4252-8998-7280623de78f	5bf72eab-09b1-43f6-aa65-11d888d92f9e	t	2026-02-20 16:39:39.687818+00	2026-02-23 19:55:30.886521+00	bodega	INTERNAL	8000	base	\N	\N	\N
7221acf7-9911-4a06-8b38-a005b25cac1d	407ccca3-bc35-4252-8998-7280623de78f	37313d68-3e52-4509-80ef-a7fd3647f6da	t	2026-02-20 16:57:59.837046+00	2026-02-23 19:55:30.886521+00	\N	INTERNAL	5000	base	\N	\N	\N
a35243d3-ad8f-4a64-9c7d-09e43671c83e	58362682-4ea3-4718-bd83-b4f311f885cd	37313d68-3e52-4509-80ef-a7fd3647f6da	t	2026-02-20 16:57:59.902606+00	2026-02-23 19:55:30.886521+00	\N	SAUDO	\N	base	\N	\N	\N
433cc384-b38a-4963-8560-7885c4ce6725	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	37313d68-3e52-4509-80ef-a7fd3647f6da	t	2026-02-20 16:57:59.962747+00	2026-02-23 19:55:30.886521+00	\N	VCF	\N	base	\N	\N	\N
7b37b048-4eb4-4808-9ac9-d510a294b16a	407ccca3-bc35-4252-8998-7280623de78f	acd24ce9-d4ae-4208-88f7-0bbc1d05bf23	t	2026-02-20 20:05:13.919443+00	2026-02-23 19:55:30.886521+00	\N	INTERNAL	\N	base	\N	\N	\N
5da86a51-f568-4978-8ce3-e8570a4f8ff4	407ccca3-bc35-4252-8998-7280623de78f	5cc0d070-c4ec-4552-b35c-c7d03492a39f	t	2026-02-20 19:55:45.331519+00	2026-02-23 19:55:30.886521+00	bodega	INTERNAL	\N	base	\N	\N	\N
5dc0c535-5848-48c9-a18d-ef256a67ed78	58362682-4ea3-4718-bd83-b4f311f885cd	5cc0d070-c4ec-4552-b35c-c7d03492a39f	t	2026-02-20 19:55:45.843458+00	2026-02-23 19:55:30.886521+00	\N	SAUDO	\N	base	\N	\N	\N
bd665f4d-9fa2-45b1-9df4-75bb15f164f2	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	5cc0d070-c4ec-4552-b35c-c7d03492a39f	t	2026-02-20 19:55:45.910807+00	2026-02-23 19:55:30.886521+00	\N	VCF	\N	base	\N	\N	\N
174c0c7f-4986-4ac5-9cd0-b41c7e59586d	407ccca3-bc35-4252-8998-7280623de78f	54910231-e9b6-4a84-9739-9831bcc5f4a8	t	2026-02-20 19:57:20.755669+00	2026-02-23 19:55:30.886521+00	\N	INTERNAL	\N	base	\N	\N	\N
56622ac0-7ab1-4a44-8991-6a6e1806daf2	58362682-4ea3-4718-bd83-b4f311f885cd	54910231-e9b6-4a84-9739-9831bcc5f4a8	t	2026-02-20 19:57:20.812256+00	2026-02-23 19:55:30.886521+00	\N	SAUDO	\N	base	\N	\N	\N
df7c4113-58e3-44ba-bc02-ad4b68ee379e	407ccca3-bc35-4252-8998-7280623de78f	17b89c99-fa06-46df-9b7a-4b12bdf7aab5	t	2026-02-20 20:22:28.886825+00	2026-02-23 19:55:30.886521+00	\N	INTERNAL	\N	base	\N	\N	\N
d4f4e518-5d1b-4db6-a929-4284b5890919	407ccca3-bc35-4252-8998-7280623de78f	47b00115-54fe-403b-9724-a0f07f82016e	t	2026-02-20 20:28:57.331048+00	2026-02-23 19:55:30.886521+00	\N	INTERNAL	\N	base	\N	\N	\N
82d9af7d-e001-4329-8e97-be53d05e4225	407ccca3-bc35-4252-8998-7280623de78f	4042f395-e77d-4ca9-b06d-d111282076c9	t	2026-02-23 22:40:36.975134+00	2026-02-23 22:40:36.975134+00	\N	INTERNAL	\N	base	\N	\N	\N
6626ce75-8991-4ba3-bf17-822393e0cc7d	407ccca3-bc35-4252-8998-7280623de78f	485f1953-7644-4eeb-ad5c-595de849b3c5	t	2026-02-23 22:43:53.538886+00	2026-02-23 22:43:53.538886+00	\N	INTERNAL	\N	base	\N	\N	\N
154255ed-5939-4419-bb24-eaaa35f95455	407ccca3-bc35-4252-8998-7280623de78f	c29cd6ec-3bdb-4495-aebc-6ed5d6051ad4	t	2026-02-17 22:45:31.832238+00	2026-02-25 20:36:19.54344+00	bodega	INTERNAL	60	purchase	5	un	12
c8c1d470-6282-43d4-afea-72c2b3867f64	58362682-4ea3-4718-bd83-b4f311f885cd	c29cd6ec-3bdb-4495-aebc-6ed5d6051ad4	t	2026-02-19 16:28:43.848857+00	2026-02-25 20:36:19.59745+00	\N	SAUDO	\N	base	\N	\N	\N
767be444-ea88-4af4-8b52-d14bd793d1d4	407ccca3-bc35-4252-8998-7280623de78f	b322762d-9cc1-43d8-832e-66659eb63e74	t	2026-02-18 13:47:11.290921+00	2026-02-25 20:36:54.471298+00	bodega	INTERNAL	48	purchase	2	un	24
d061944e-14d6-4af1-89f8-919f819b6d08	407ccca3-bc35-4252-8998-7280623de78f	0f839b07-be3a-46b3-bee2-582fb52a59b1	t	2026-02-18 13:47:08.505748+00	2026-02-25 20:37:15.531547+00	bodega	INTERNAL	48	purchase	2	un	24
efe113df-16fd-4e35-abd7-dbcc77d59a6b	58362682-4ea3-4718-bd83-b4f311f885cd	0f839b07-be3a-46b3-bee2-582fb52a59b1	t	2026-02-19 16:28:43.848857+00	2026-02-25 20:37:15.603126+00	\N	SAUDO	\N	base	\N	\N	\N
bbdc1f17-4ee3-4c61-a6c0-b948a80e6352	58362682-4ea3-4718-bd83-b4f311f885cd	8ef62af2-c488-4e60-8279-2e68682eea38	t	2026-02-19 16:28:43.848857+00	2026-02-25 21:24:28.028231+00	\N	SAUDO	\N	base	\N	\N	\N
1d8ef072-b04f-4097-96b1-ad09fd5c5812	407ccca3-bc35-4252-8998-7280623de78f	edb369a7-b937-42b9-9e3d-4e0ae6466070	t	2026-02-20 17:32:49.041138+00	2026-02-26 14:36:44.215026+00	\N	INTERNAL	\N	base	\N	\N	\N
93f0f597-49f0-44ae-820b-b996fcfca6fe	58362682-4ea3-4718-bd83-b4f311f885cd	318df1ec-d831-4fe7-ba6c-554ca0c78a5c	t	2026-02-19 16:28:43.848857+00	2026-02-26 14:20:22.347684+00	\N	SAUDO	\N	base	\N	\N	\N
73ffb5b5-2daf-4623-9a1f-47c9e25c00a8	407ccca3-bc35-4252-8998-7280623de78f	209443bd-1d3f-4c92-82e4-833dfbae26d0	t	2026-02-20 17:12:10.64049+00	2026-02-26 20:45:22.599451+00	\N	INTERNAL	6	base	\N	\N	\N
19b1f386-7be3-47c9-a0be-e49849d7d71e	58362682-4ea3-4718-bd83-b4f311f885cd	209443bd-1d3f-4c92-82e4-833dfbae26d0	t	2026-02-20 17:12:10.690929+00	2026-02-26 20:45:22.666587+00	\N	SAUDO	\N	base	\N	\N	\N
fefea5b7-eff7-4158-927a-874b5dc3e0cb	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	54910231-e9b6-4a84-9739-9831bcc5f4a8	t	2026-02-20 19:57:20.859484+00	2026-02-23 19:55:30.886521+00	\N	VCF	\N	base	\N	\N	\N
334b18e8-88d8-48e5-939c-cbd73c0ff363	407ccca3-bc35-4252-8998-7280623de78f	786c4d51-fa92-4a99-ba68-9bc5b1b01bf1	t	2026-02-20 19:59:56.400623+00	2026-02-23 19:55:30.886521+00	\N	INTERNAL	\N	base	\N	\N	\N
e9366bd4-cbe0-4890-a6aa-45ade589155b	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	786c4d51-fa92-4a99-ba68-9bc5b1b01bf1	t	2026-02-20 19:59:56.446581+00	2026-02-23 19:55:30.886521+00	\N	VCF	\N	base	\N	\N	\N
e91b3232-1ac8-4d0f-b5a7-11a9a2b5e3b8	58362682-4ea3-4718-bd83-b4f311f885cd	acd24ce9-d4ae-4208-88f7-0bbc1d05bf23	t	2026-02-20 20:05:13.996523+00	2026-02-23 19:55:30.886521+00	\N	SAUDO	\N	base	\N	\N	\N
ddfdae83-0f85-4047-9553-3b9dd36de94a	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	acd24ce9-d4ae-4208-88f7-0bbc1d05bf23	t	2026-02-20 20:05:14.068654+00	2026-02-23 19:55:30.886521+00	\N	VCF	\N	base	\N	\N	\N
eaf3c7e0-a43d-41c8-a2a6-785484f80e3f	407ccca3-bc35-4252-8998-7280623de78f	ea45d1b3-4b3c-4c82-8cb6-dd12a5b4de73	t	2026-02-20 20:07:11.307269+00	2026-02-23 19:55:30.886521+00	\N	INTERNAL	\N	base	\N	\N	\N
b044cca3-3cc2-4142-ae3e-e112ea9461b5	407ccca3-bc35-4252-8998-7280623de78f	e365bf9f-5b7b-4b1e-af42-5fadfdb909cb	t	2026-02-20 20:08:22.477753+00	2026-02-23 19:55:30.886521+00	\N	INTERNAL	\N	base	\N	\N	\N
5526d5b4-ca5d-4931-89e2-768369841f17	58362682-4ea3-4718-bd83-b4f311f885cd	e365bf9f-5b7b-4b1e-af42-5fadfdb909cb	t	2026-02-20 20:08:22.54437+00	2026-02-23 19:55:30.886521+00	\N	SAUDO	\N	base	\N	\N	\N
0b6732b3-1b44-41f2-bde6-499bc1f9bc49	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	e365bf9f-5b7b-4b1e-af42-5fadfdb909cb	t	2026-02-20 20:08:22.594551+00	2026-02-23 19:55:30.886521+00	\N	VCF	\N	base	\N	\N	\N
0ffd255b-091d-4de7-9df3-7a428ee91887	58362682-4ea3-4718-bd83-b4f311f885cd	17b89c99-fa06-46df-9b7a-4b12bdf7aab5	t	2026-02-20 20:22:28.938836+00	2026-02-23 19:55:30.886521+00	\N	SAUDO	\N	base	\N	\N	\N
57f60b83-80da-497e-a6e7-feeba3c89ce6	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	17b89c99-fa06-46df-9b7a-4b12bdf7aab5	t	2026-02-20 20:22:28.99959+00	2026-02-23 19:55:30.886521+00	\N	VCF	\N	base	\N	\N	\N
31138713-1b1c-4c6f-bc7e-67fa945c589b	407ccca3-bc35-4252-8998-7280623de78f	914a9973-d465-4060-9edd-62e62212b4c5	t	2026-02-20 20:33:05.807165+00	2026-02-23 19:55:30.886521+00	\N	INTERNAL	\N	base	\N	\N	\N
7882b50e-a4f7-4301-9544-8cca98943402	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	914a9973-d465-4060-9edd-62e62212b4c5	t	2026-02-20 20:33:05.859089+00	2026-02-23 19:55:30.886521+00	\N	VCF	\N	base	\N	\N	\N
25bdf9fb-deaf-4305-b889-d0f6c73d4d74	407ccca3-bc35-4252-8998-7280623de78f	cc5ae544-8255-4c02-a38d-a829fb36e8da	t	2026-02-20 20:35:26.351086+00	2026-02-23 19:55:30.886521+00	\N	INTERNAL	\N	base	\N	\N	\N
0f907fac-0a2f-450a-a89c-7336dc6b9e46	407ccca3-bc35-4252-8998-7280623de78f	6244e86d-22b2-4d52-83fc-882899ddb943	t	2026-02-20 20:38:35.775326+00	2026-02-23 19:55:30.886521+00	\N	INTERNAL	\N	base	\N	\N	\N
7729c43f-8099-4d8e-ad55-9cf360b368e5	407ccca3-bc35-4252-8998-7280623de78f	92708031-37ba-4d0f-bbb5-0e5f3c3ac8b5	t	2026-02-20 21:04:45.463996+00	2026-02-23 19:55:30.886521+00	\N	INTERNAL	\N	base	\N	\N	\N
15409950-d77e-4f44-9574-4ae34fe9cbaa	407ccca3-bc35-4252-8998-7280623de78f	ce0e5301-6d13-46d6-984b-7446639809e5	t	2026-02-20 21:02:12.055662+00	2026-02-23 19:56:56.876729+00	\N	INTERNAL	\N	base	\N	\N	\N
b89ba624-67ac-4ae2-8ec4-9d44a5b9c546	407ccca3-bc35-4252-8998-7280623de78f	3f4939ba-1afe-476d-9e61-039a7f6ffad4	t	2026-02-25 21:45:48.801229+00	2026-02-25 21:46:01.785932+00	\N	INTERNAL	12	purchase	2	un	6
67cad831-49e7-4e9b-b923-738f42080405	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	3f4939ba-1afe-476d-9e61-039a7f6ffad4	t	2026-02-25 21:45:48.941734+00	2026-02-25 21:46:01.893261+00	\N	VCF	\N	base	\N	\N	\N
9b1e065f-6a99-42f7-a06f-f72f58e06e6c	407ccca3-bc35-4252-8998-7280623de78f	0f9e4a4f-aa26-4267-9127-7c8d22997eb2	t	2026-02-23 19:56:07.308737+00	2026-02-23 19:58:53.771423+00	\N	INTERNAL	\N	base	\N	\N	\N
966c0db3-1afb-4783-b3b2-e5e9d6e66a3a	58362682-4ea3-4718-bd83-b4f311f885cd	0f9e4a4f-aa26-4267-9127-7c8d22997eb2	t	2026-02-23 19:56:07.374912+00	2026-02-23 19:58:53.839374+00	\N	SAUDO	\N	base	\N	\N	\N
ca6f757b-9f3a-4fe1-a9e3-b369467446cf	58362682-4ea3-4718-bd83-b4f311f885cd	ae75c0f7-ece7-46d5-ab70-0f7c44c7c4e2	t	2026-02-23 20:29:20.887401+00	2026-02-23 20:30:09.56836+00	\N	SAUDO	\N	base	\N	\N	\N
51815c84-63f3-47cf-895a-a7b3f9e09f3d	58362682-4ea3-4718-bd83-b4f311f885cd	7f28b4fa-5510-4e0d-8426-b62c3b0a2cd7	t	2026-02-23 20:20:04.7828+00	2026-02-23 20:34:42.758956+00	\N	SAUDO	\N	base	\N	\N	\N
8bb87b60-cce9-40c1-83ac-5d8f08a09b0e	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	382b35f2-e12c-4ba7-afc0-bb944fb65e5b	t	2026-02-23 20:46:08.534309+00	2026-02-23 20:46:08.534309+00	\N	VCF	\N	base	\N	\N	\N
b0e73bd4-51a7-4743-91e0-92bb617b478c	407ccca3-bc35-4252-8998-7280623de78f	93a22bf1-3646-44ef-b240-81c769fe92ea	t	2026-02-23 22:31:11.324434+00	2026-02-23 22:31:11.324434+00	\N	INTERNAL	\N	base	\N	\N	\N
a2a56f8c-056c-4965-b03c-fb14139461cc	407ccca3-bc35-4252-8998-7280623de78f	15d4a6f8-67fc-41ad-9c5e-2622e0a0cbbb	t	2026-02-23 22:36:12.857159+00	2026-02-23 22:36:12.857159+00	\N	INTERNAL	\N	base	\N	\N	\N
cf9172ce-9784-4970-a4bc-2ea79bde905c	407ccca3-bc35-4252-8998-7280623de78f	743a7513-4507-411a-9bb8-327526e8323a	t	2026-02-23 22:38:30.036879+00	2026-02-23 22:38:30.036879+00	\N	INTERNAL	\N	base	\N	\N	\N
03b7a02c-1290-4465-916b-366391d07bb3	407ccca3-bc35-4252-8998-7280623de78f	3f7c5b37-beb2-4f97-bb1a-0ffab03d9d17	t	2026-02-23 22:41:58.040269+00	2026-02-23 22:41:58.040269+00	\N	INTERNAL	\N	base	\N	\N	\N
becfeed4-8c7e-4f32-9183-b4a9dfd8f87a	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	c29cd6ec-3bdb-4495-aebc-6ed5d6051ad4	t	2026-02-25 20:36:19.652904+00	2026-02-25 20:36:19.652904+00	\N	VCF	\N	base	\N	\N	\N
8486f023-878c-4234-8e0d-bd5bc44e0073	407ccca3-bc35-4252-8998-7280623de78f	008d61d5-18a1-41db-8ff4-e6afd342b615	t	2026-02-25 21:02:03.17505+00	2026-02-25 21:02:41.191632+00	\N	INTERNAL	\N	base	\N	\N	\N
e1428848-2ee7-4312-ad33-76ba5db78170	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	008d61d5-18a1-41db-8ff4-e6afd342b615	t	2026-02-25 21:02:03.333272+00	2026-02-25 21:02:41.346522+00	\N	VCF	\N	base	\N	\N	\N
d7b684f0-f7d6-43de-b55e-190c46929f6c	58362682-4ea3-4718-bd83-b4f311f885cd	db599e31-59ab-4ac3-9ea0-994ced46dc46	t	2026-02-25 21:46:45.103881+00	2026-02-25 21:46:56.123547+00	\N	SAUDO	\N	base	\N	\N	\N
aa386deb-e1b7-4b2b-a919-aacf11b8b422	407ccca3-bc35-4252-8998-7280623de78f	8ef62af2-c488-4e60-8279-2e68682eea38	t	2026-02-17 22:42:29.593351+00	2026-02-25 21:24:27.970034+00	bodega	INTERNAL	48	purchase	4	un	12
6927da25-e006-41ab-be54-89cf68cf7b28	407ccca3-bc35-4252-8998-7280623de78f	d03ba8c8-661d-4e20-8211-6105a0a87032	t	2026-02-25 21:25:47.122923+00	2026-02-25 21:25:47.122923+00	\N	INTERNAL	\N	base	\N	\N	\N
f7769f1b-44c6-43fc-8280-77d1551f7d67	407ccca3-bc35-4252-8998-7280623de78f	7c757e78-68ab-47a8-aff7-be53ccc89c77	t	2026-02-25 21:34:11.162812+00	2026-02-25 21:34:23.681028+00	\N	INTERNAL	48	purchase	2	un	24
a6dada8e-9e29-44f4-b534-541a1bfe0f8a	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	7c757e78-68ab-47a8-aff7-be53ccc89c77	t	2026-02-25 21:34:11.304414+00	2026-02-25 21:34:23.793526+00	\N	VCF	\N	base	\N	\N	\N
443600e4-63b7-4e0b-b9c6-c872b6ba7805	58362682-4ea3-4718-bd83-b4f311f885cd	349a0494-247a-4194-b3e8-6c604452fe8b	t	2026-02-25 21:36:38.279409+00	2026-02-25 21:38:34.824066+00	\N	SAUDO	\N	base	\N	\N	\N
29cf86ff-6366-4129-8f68-a5437aa59143	407ccca3-bc35-4252-8998-7280623de78f	42ad4143-2469-4ae0-8510-14507b614b6f	t	2026-02-25 21:39:23.789879+00	2026-02-25 21:41:48.413109+00	\N	INTERNAL	12	purchase	2	un	6
ba616a8f-b55d-4211-b975-921a290c193f	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	42ad4143-2469-4ae0-8510-14507b614b6f	t	2026-02-25 21:41:16.557692+00	2026-02-25 21:41:48.535415+00	\N	VCF	\N	base	\N	\N	\N
87493940-3bc3-49b2-a3e6-8c843827e9f3	58362682-4ea3-4718-bd83-b4f311f885cd	efb4f0b9-9fae-4116-a7b6-2a392611c2fb	t	2026-02-25 21:44:40.808501+00	2026-02-25 21:44:53.18337+00	\N	SAUDO	\N	base	\N	\N	\N
b4287b8f-812f-4a67-bd2f-981a5f95e90e	407ccca3-bc35-4252-8998-7280623de78f	4f45a711-ae30-4188-be07-a0a94373fe64	t	2026-02-26 14:45:07.736251+00	2026-02-26 14:45:28.917012+00	\N	INTERNAL	5000	purchase	1	kg	5000
8f2fdafb-7415-4dbb-be7b-3e66a4672b8c	407ccca3-bc35-4252-8998-7280623de78f	a0c40b80-ab43-44e5-8bf5-dc4177805443	t	2026-02-25 21:48:24.373906+00	2026-02-25 21:50:03.220082+00	\N	INTERNAL	120	purchase	5	un	24
ec5526a8-b329-4e69-8e15-ab482fbd5c27	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	a0c40b80-ab43-44e5-8bf5-dc4177805443	t	2026-02-25 21:48:24.469099+00	2026-02-25 21:50:03.390473+00	\N	VCF	\N	base	\N	\N	\N
858c7022-24bc-48d1-af87-497d38e3b5b8	58362682-4ea3-4718-bd83-b4f311f885cd	2e08594c-6d0e-4ca0-ac81-06044d2723ea	t	2026-02-25 21:52:14.590245+00	2026-02-25 21:52:25.967004+00	\N	SAUDO	\N	base	\N	\N	\N
a348556e-b6bb-420d-8535-4287ac876a45	407ccca3-bc35-4252-8998-7280623de78f	f9fdd102-1a36-45ea-8482-e4a1cdf2436a	t	2026-02-25 21:56:51.921278+00	2026-02-25 21:57:10.684537+00	\N	INTERNAL	48	purchase	2	un	24
69d8f389-7726-472c-af9d-22224ade23b7	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	f9fdd102-1a36-45ea-8482-e4a1cdf2436a	t	2026-02-25 21:56:52.069338+00	2026-02-25 21:57:10.842728+00	\N	VCF	\N	base	\N	\N	\N
4ad42cf3-23fb-44f7-be78-f0a3ca1cb61b	58362682-4ea3-4718-bd83-b4f311f885cd	2415f66a-330e-4dae-bf93-ebe941d8892a	t	2026-02-26 14:58:08.532682+00	2026-02-26 14:58:20.827689+00	\N	SAUDO	\N	base	\N	\N	\N
29f69164-62ce-4109-bd01-f3cccb4f0fd5	407ccca3-bc35-4252-8998-7280623de78f	f2f46cdd-497b-46e1-9085-a268fa56a43b	t	2026-02-26 19:54:12.673728+00	2026-02-26 19:54:35.425883+00	\N	INTERNAL	30	purchase	5	un	6
209406c7-b118-4770-8a2d-f2f8ebbea8cc	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	f2f46cdd-497b-46e1-9085-a268fa56a43b	t	2026-02-26 19:54:12.832292+00	2026-02-26 19:54:35.563945+00	\N	VCF	\N	base	\N	\N	\N
c24c912c-74dc-4ad0-90f3-9cf42ced85b5	407ccca3-bc35-4252-8998-7280623de78f	cd7ff907-81b4-4890-a084-779188433ee3	t	2026-02-26 20:35:07.354961+00	2026-02-26 20:35:24.401558+00	\N	INTERNAL	\N	base	\N	\N	\N
4db1ac28-0727-4bf9-9119-6f5b65f1e7b9	58362682-4ea3-4718-bd83-b4f311f885cd	84e0b57d-5343-4cab-83ed-19b5bc256d82	t	2026-02-26 20:36:33.865164+00	2026-02-26 20:36:33.865164+00	\N	SAUDO	\N	base	\N	\N	\N
68906f92-40a0-4755-b415-3ec5f0ea75c3	407ccca3-bc35-4252-8998-7280623de78f	d79d4bbe-bf38-4819-86ac-cf82c613351c	t	2026-03-02 13:51:51.676477+00	2026-03-02 13:52:01.543521+00	\N	INTERNAL	\N	base	\N	\N	\N
1e1ef588-1229-4d65-96c5-34f9aa8e8c89	407ccca3-bc35-4252-8998-7280623de78f	03f08229-33eb-411f-93d5-4591b7ced037	t	2026-03-02 13:52:57.366593+00	2026-03-02 13:53:06.789443+00	\N	INTERNAL	\N	base	\N	\N	\N
7917d574-e80c-4717-9c4c-472e9b3ca368	407ccca3-bc35-4252-8998-7280623de78f	27890c97-a0a2-4389-ac2d-f2b2a169415c	t	2026-03-02 13:54:53.23378+00	2026-03-02 13:54:57.768854+00	\N	INTERNAL	\N	base	\N	\N	\N
1446d574-d5e9-4a25-8e64-d4516ba32738	58362682-4ea3-4718-bd83-b4f311f885cd	292d8839-be37-4160-a5c2-b2abbbec0889	t	2026-03-02 13:58:21.464564+00	2026-03-02 14:00:17.456397+00	\N	SAUDO	\N	base	\N	\N	\N
\.


--
-- Data for Name: product_sku_aliases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."product_sku_aliases" ("id", "product_id", "sku", "created_at") FROM stdin;
\.


--
-- Data for Name: product_sku_sequences; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."product_sku_sequences" ("brand_code", "type_code", "last_value", "updated_at") FROM stdin;
VCF	VEN	1	2026-01-07 19:17:48.041034+00
VGR	VEN	22	2026-01-07 19:26:20.03461+00
VGR	PRE	1	2026-01-07 19:19:25.614562+00
SAU	INS	5	2026-01-07 19:19:25.614562+00
VGR	INS	561	2026-01-07 19:19:25.614562+00
\.


--
-- Data for Name: product_suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."product_suppliers" ("id", "product_id", "supplier_id", "supplier_sku", "purchase_unit", "purchase_unit_size", "purchase_price", "currency", "lead_time_days", "min_order_qty", "is_primary", "created_at", "purchase_pack_qty", "purchase_pack_unit_code") FROM stdin;
37bfc7c2-0d78-48c2-a951-9f02c34a62b7	a0c40b80-ab43-44e5-8bf5-dc4177805443	fbe36960-f329-4f7a-98b5-4862b09b3031	\N	Caja	24	42500	COP	\N	\N	t	2026-02-25 21:50:02.801799+00	24	un
ddf18663-3f5e-4863-8ec9-478afbd6d68b	19ef7b56-03fe-4218-8fc0-a7c51f2ba7c6	bf2e5ffe-c898-464c-9a4b-eac60b1444ce	\N	Caja	150	12000	COP	\N	\N	t	2026-02-19 15:41:53.040767+00	150	g
2ad4c6c1-43f1-40ad-9977-194901c43c73	575ced55-ca85-4c27-b3a9-abe2bac272cd	dc776684-c662-4c3c-b175-267ab5c73783	\N	Bolsa	870	16400	COP	\N	\N	t	2026-02-19 20:17:12.696894+00	870	g
0ec49a02-2a78-4cfb-89b7-02c3fd0e1c66	5db9eeab-548f-4989-80b0-9611ff918dad	dc776684-c662-4c3c-b175-267ab5c73783	\N	Paquete	20	39800	COP	\N	\N	t	2026-02-19 20:17:37.224593+00	20	un
fe460b6f-80b7-4890-aacf-c3db19b09031	cf3c5e31-17c4-4aaf-b456-b69efc6e8f1a	2dbe12fe-3c4b-4800-b923-8d1bc09e9b20	\N	Bandeja	4800	37200	COP	\N	\N	t	2026-02-19 20:18:10.865258+00	4800	ml
a2fcf9fb-2541-46ed-a937-ebd195d2c26b	0515038c-0444-4dc1-92bf-4871f1ca2852	dc2684ae-ca7d-4cac-aa7c-63c44e799cea	\N	Paquete	1000	64600	COP	\N	\N	t	2026-02-19 20:18:27.925326+00	1	kg
d28d93b0-0953-4906-a736-a8f777658e68	f2c0bc54-d9d2-4c0e-9192-99bdd5cd86e6	392b6cc2-9e27-4c7d-8c32-e4802be67cc9	\N	Botella	1000	5990	COP	\N	\N	t	2026-02-19 20:18:48.765045+00	1	l
6f131fc0-6727-4ca4-9793-8aa52397adb9	334198ae-c394-48f2-83f5-af515905200b	dc776684-c662-4c3c-b175-267ab5c73783	\N	Paquete	6000	26400	COP	\N	\N	t	2026-02-19 20:20:13.488497+00	6	l
c5d52018-154f-45af-aa12-2138075e2897	ce7063ef-c60d-48ad-b253-346d9a99368a	dc2684ae-ca7d-4cac-aa7c-63c44e799cea	\N	Paquete	250	50400	COP	\N	\N	t	2026-02-19 20:20:29.4106+00	250	un
3c9726f2-d086-4f26-8975-6ab71cee1446	c80ed0d2-010f-4643-aed1-45ba8cf0e911	392b6cc2-9e27-4c7d-8c32-e4802be67cc9	\N	Empaque	10	8300	COP	\N	\N	t	2026-02-19 20:20:48.182259+00	10	un
c222f307-9c6f-410a-8cd1-77d328157617	28cd5694-b9d5-4c84-9d6c-9befd57b5846	392b6cc2-9e27-4c7d-8c32-e4802be67cc9	\N	Empaque	10	8300	COP	\N	\N	t	2026-02-19 20:21:45.39877+00	10	un
7c768b07-b54a-41f1-8646-813529de7578	6020f9ef-9bc0-4a65-87f6-c4d84f601f4b	bec420e5-d45f-4e8d-bc5e-53d22cbcf9e4	\N	Bulto	50000	160000	COP	\N	\N	t	2026-02-19 20:37:29.347267+00	50	kg
327704a7-e174-4319-b388-4bc0f630bae0	13d47350-ec1c-477a-afba-4146d0d0e9e0	c1d57216-ef5f-47cf-96b4-bbb0eeb37dd4	\N	Bloque	1360	35900	COP	\N	\N	t	2026-02-20 16:31:45.46656+00	1360	g
f959b58b-fbfb-4ab7-89cc-7bb0b7d1cda0	5bf72eab-09b1-43f6-aa65-11d888d92f9e	c1d57216-ef5f-47cf-96b4-bbb0eeb37dd4	\N	Bolsa	2000	117100	COP	\N	\N	t	2026-02-20 16:40:06.860153+00	2000	g
08228c9c-c91d-4122-83b7-4dc86a9287c3	37313d68-3e52-4509-80ef-a7fd3647f6da	392b6cc2-9e27-4c7d-8c32-e4802be67cc9	\N	Bolsa	1000	2700	COP	\N	\N	t	2026-02-20 16:58:11.18904+00	1000	g
1ca62f9d-6145-4adc-9a1a-9907ae31af09	5cc0d070-c4ec-4552-b35c-c7d03492a39f	c1d57216-ef5f-47cf-96b4-bbb0eeb37dd4	\N	Paquete	100	14100	COP	\N	\N	t	2026-02-20 19:55:45.004146+00	100	g
29a8a09e-7c9e-4494-820e-90affa01fe58	54910231-e9b6-4a84-9739-9831bcc5f4a8	c1d57216-ef5f-47cf-96b4-bbb0eeb37dd4	\N	Bolsa	1100	4100	COP	\N	\N	t	2026-02-20 19:58:12.399573+00	1100	ml
6391ffb2-efc8-4990-b7de-71f12032df25	786c4d51-fa92-4a99-ba68-9bc5b1b01bf1	c1d57216-ef5f-47cf-96b4-bbb0eeb37dd4	\N	Bolsa	1000	21000	COP	\N	\N	t	2026-02-20 19:59:56.113826+00	1	kg
eaf2a895-e372-4fa5-9935-c8fff13caf66	acd24ce9-d4ae-4208-88f7-0bbc1d05bf23	c1d57216-ef5f-47cf-96b4-bbb0eeb37dd4	\N	Cuña	180	33037	COP	\N	\N	t	2026-02-20 20:05:13.475944+00	180	g
6edf7291-39e8-446f-ae56-bcd2fa636f66	ea45d1b3-4b3c-4c82-8cb6-dd12a5b4de73	c1d57216-ef5f-47cf-96b4-bbb0eeb37dd4	\N	Botella	1000	10900	COP	\N	\N	t	2026-02-20 20:07:10.841553+00	1000	g
157ae5df-7cef-41a1-8653-0a5fce5012fb	e365bf9f-5b7b-4b1e-af42-5fadfdb909cb	c1d57216-ef5f-47cf-96b4-bbb0eeb37dd4	\N	Pote	1000	21900	COP	\N	\N	t	2026-02-20 20:20:12.800357+00	1000	g
205a189a-369e-4c33-9350-767a2cb480a5	17b89c99-fa06-46df-9b7a-4b12bdf7aab5	c1d57216-ef5f-47cf-96b4-bbb0eeb37dd4	\N	Caja	20000	939504	COP	\N	\N	t	2026-02-20 20:22:35.706488+00	20	kg
a9bb0f67-4806-4db3-b92a-16a608e8d0ce	47b00115-54fe-403b-9724-a0f07f82016e	b14f7ba3-36be-49c6-9b3d-3b5f0fedd21d	\N	Tarro	4000	45520	COP	\N	\N	t	2026-02-20 20:28:57.057194+00	4	kg
cf0239b6-debf-430a-aef3-1b7fcd3fa592	914a9973-d465-4060-9edd-62e62212b4c5	b6e60644-e28b-4079-8c65-d7710450dfaf	\N	Cartón	30	12500	COP	\N	\N	t	2026-02-20 20:33:21.285539+00	30	un
5377effc-d6eb-4a25-8d23-0a4f176acb20	cc5ae544-8255-4c02-a38d-a829fb36e8da	44842ef8-3259-4a31-a745-1a522f4bf11b	\N	Bloque	83	66000	COP	\N	\N	t	2026-02-20 20:36:55.518952+00	83	un
f524d0d4-c1a2-4220-bb69-02b5fb4ee361	6244e86d-22b2-4d52-83fc-882899ddb943	44842ef8-3259-4a31-a745-1a522f4bf11b	\N	Bloque	1000	24000	COP	\N	\N	t	2026-02-20 20:38:35.390659+00	1	kg
8f4387dc-362a-478e-8374-d53a01b7ca76	92708031-37ba-4d0f-bbb5-0e5f3c3ac8b5	c2fb5bb2-9401-4779-9433-938136ed7f73	\N	Bolsa	1000	18000	COP	\N	\N	t	2026-02-20 21:04:45.253707+00	1	kg
f3719345-8383-47b7-a574-8a0cf0c83363	4a8426e1-7a26-4403-9649-3dc460da096c	392b6cc2-9e27-4c7d-8c32-e4802be67cc9	\N	Paquete	10	8300	COP	\N	\N	t	2026-02-23 16:32:16.477364+00	10	un
15a8a4ea-565e-457d-9e7a-a337804d5b4f	520b9e6a-0b15-4102-bebe-7ed4c33e5fea	bec420e5-d45f-4e8d-bc5e-53d22cbcf9e4	\N	Pote	2800	27300	COP	\N	\N	t	2026-02-23 20:24:39.358288+00	2800	g
5dfb2bf5-0e82-4118-8b2a-b08c8ecebafe	ae75c0f7-ece7-46d5-ab70-0f7c44c7c4e2	bec420e5-d45f-4e8d-bc5e-53d22cbcf9e4	\N	Pote	340.2	29800	COP	\N	\N	t	2026-02-23 20:30:09.0516+00	340.2	g
9690e9f5-b40f-4cba-89ff-7f0ea073e193	a420c821-edee-44b7-9276-37fb195f8252	bec420e5-d45f-4e8d-bc5e-53d22cbcf9e4	\N	Pote	1000	26000	COP	\N	\N	t	2026-02-23 20:39:03.290343+00	1	l
2116a968-e8af-4623-94ae-29db6d140531	d8f89235-55c7-4c43-a826-8b4713781146	05e9e0cb-5a4a-4456-868a-e886f66b6094	\N	Costo	1	\N	COP	\N	\N	t	2026-02-23 20:44:52.595394+00	1	ml
905f90dd-8a7a-40ee-84d5-d2084e62f0fd	f80f232e-46e1-4e5a-a404-4579a1b72c44	39d2425b-47bb-4b22-be25-18bccd9caede	\N	Bolsa	1	18300	COP	\N	\N	t	2026-02-23 21:07:51.715265+00	1	kg
0cf5c561-141e-44ae-a779-c84f42ca00cf	66a1ee94-ec4a-4530-bddf-d3824f85fd08	c2fb5bb2-9401-4779-9433-938136ed7f73	\N	Bolsa	1000	3000	COP	\N	\N	t	2026-02-23 22:30:33.794258+00	1	kg
0d0e901b-6195-42e6-8a7a-95daae84987f	93a22bf1-3646-44ef-b240-81c769fe92ea	c2fb5bb2-9401-4779-9433-938136ed7f73	\N	Bolsa	1000	5000	COP	\N	\N	t	2026-02-23 22:31:11.068017+00	1	kg
5f357fd0-9e85-4503-ac14-8d9ebe08aaa6	fa74b543-e07e-43e3-84a6-ea987ffeeb06	c2fb5bb2-9401-4779-9433-938136ed7f73	\N	Bolsa	1000	20000	COP	\N	\N	t	2026-02-23 22:34:32.768377+00	1	kg
b1284f3f-6cb7-4008-b7b4-a4d24e7355c9	4437740c-2f53-43c7-ae41-0e8e82983f64	c2fb5bb2-9401-4779-9433-938136ed7f73	\N	Bolsa	1000	15000	COP	\N	\N	t	2026-02-23 22:35:24.357177+00	1	kg
2134efae-6eb2-4a65-b046-c3bae46c727b	15d4a6f8-67fc-41ad-9c5e-2622e0a0cbbb	c2fb5bb2-9401-4779-9433-938136ed7f73	\N	Bolsa	1000	4999.99	COP	\N	\N	t	2026-02-23 22:36:12.571949+00	1	kg
bda5d0b3-4567-49e6-9726-5026ce5ac56d	2832b193-af6e-46f5-8d73-1b7051e6c105	c2fb5bb2-9401-4779-9433-938136ed7f73	\N	Bolsa	1000	7000	COP	\N	\N	t	2026-02-23 22:36:50.211188+00	1	kg
4fae6076-7b91-4cea-bda8-220b0484facc	449a2b73-0c98-4e48-8269-c298519bf429	c2fb5bb2-9401-4779-9433-938136ed7f73	\N	Bolsa	1000	10000	COP	\N	\N	t	2026-02-23 22:37:47.770224+00	1	kg
068a61b8-2474-4ea6-922a-239aff6af40e	743a7513-4507-411a-9bb8-327526e8323a	c2fb5bb2-9401-4779-9433-938136ed7f73	\N	Bolsa	1000	16000	COP	\N	\N	t	2026-02-23 22:38:29.806384+00	1	kg
9329d8d8-9050-4380-a106-8035b0b54420	cff5ec9e-3ba6-4b7c-8125-1c4d347fb062	c2fb5bb2-9401-4779-9433-938136ed7f73	\N	Bolsa	1000	3000	COP	\N	\N	t	2026-02-23 22:39:08.798977+00	1	kg
d94d52b9-6fa8-431c-8de9-61ba38f26a10	4042f395-e77d-4ca9-b06d-d111282076c9	c2fb5bb2-9401-4779-9433-938136ed7f73	\N	Bolsa	1000	6000	COP	\N	\N	t	2026-02-23 22:40:36.633381+00	1	kg
ca395fce-ee57-4ac3-88ec-68d444a8fb6f	3f7c5b37-beb2-4f97-bb1a-0ffab03d9d17	c2fb5bb2-9401-4779-9433-938136ed7f73	\N	Bolsa	1	1700	COP	\N	\N	t	2026-02-23 22:41:57.787636+00	1	un
77460330-2da0-4888-9780-b7b7ea0b4921	3e5ab6a2-e2c3-4477-a73c-d16787500800	c2fb5bb2-9401-4779-9433-938136ed7f73	\N	Bolsa	1000	9000	COP	\N	\N	t	2026-02-23 22:42:42.387384+00	1	kg
c8736196-790f-4b8a-975e-a8446c391438	d064c496-2979-4433-a103-52d25723333c	c2fb5bb2-9401-4779-9433-938136ed7f73	\N	Bolsa	1	2000	COP	\N	\N	t	2026-02-23 22:43:18.590733+00	1	un
12465e74-59ba-4be4-93c7-229309946d09	485f1953-7644-4eeb-ad5c-595de849b3c5	c2fb5bb2-9401-4779-9433-938136ed7f73	\N	Bolsa	1000	8000	COP	\N	\N	t	2026-02-23 22:43:53.2486+00	1	kg
22dd02ac-370f-4762-b3d4-a2650ce71791	c29cd6ec-3bdb-4495-aebc-6ed5d6051ad4	2dbe12fe-3c4b-4800-b923-8d1bc09e9b20	\N	Bandeja	12	30000	COP	\N	\N	t	2026-02-25 20:36:19.095504+00	12	un
acc55c35-e53b-4f44-87a6-dc398a319a43	b322762d-9cc1-43d8-832e-66659eb63e74	fbe36960-f329-4f7a-98b5-4862b09b3031	\N	Bandeja	24	60000	COP	\N	\N	t	2026-02-25 20:36:54.0763+00	24	un
e71f9f83-5b10-493e-aac1-10998bf176e8	0f839b07-be3a-46b3-bee2-582fb52a59b1	fbe36960-f329-4f7a-98b5-4862b09b3031	\N	Bandeja	24	60000	COP	\N	\N	t	2026-02-25 20:37:15.116312+00	24	un
4ae5e004-dfa0-4fac-a1d5-1701835bbc0d	008d61d5-18a1-41db-8ff4-e6afd342b615	fbe36960-f329-4f7a-98b5-4862b09b3031	\N	Bandeja	24	54900	COP	\N	\N	t	2026-02-25 21:02:40.4447+00	24	un
ed3d0a3f-2498-4e43-bd70-61e7abe35051	8ef62af2-c488-4e60-8279-2e68682eea38	2dbe12fe-3c4b-4800-b923-8d1bc09e9b20	\N	Bandeja	12	30000	COP	\N	\N	t	2026-02-25 21:24:27.576373+00	12	un
6e0efac4-7e98-4cd3-8257-ae3522aa3f80	d03ba8c8-661d-4e20-8211-6105a0a87032	79241128-bc9c-487a-8cc1-65269655644d	\N	Bolsa	1000	26000	COP	\N	\N	t	2026-02-25 21:25:46.701856+00	1000	g
bbe7dd5f-1363-4fa7-ae16-aba352dd4fd3	7c757e78-68ab-47a8-aff7-be53ccc89c77	fbe36960-f329-4f7a-98b5-4862b09b3031	\N	Bandeja	24	54900	COP	\N	\N	t	2026-02-25 21:34:23.279243+00	24	un
9332b786-181f-459b-978a-5580958866c1	349a0494-247a-4194-b3e8-6c604452fe8b	fbe36960-f329-4f7a-98b5-4862b09b3031	\N	Botella	1500	4166.66	COP	\N	\N	t	2026-02-25 21:38:34.456352+00	1500	ml
284d3d73-dfa3-4650-a8e2-33480c2eff18	42ad4143-2469-4ae0-8510-14507b614b6f	fbe36960-f329-4f7a-98b5-4862b09b3031	\N	Caja	6	25000	COP	\N	\N	t	2026-02-25 21:41:48.015814+00	6	un
55a4197d-4ebd-43b8-a611-ce3e42b7db49	efb4f0b9-9fae-4116-a7b6-2a392611c2fb	fbe36960-f329-4f7a-98b5-4862b09b3031	\N	Caja	6	25000	COP	\N	\N	t	2026-02-25 21:44:52.787434+00	6	un
968610af-fbed-46d6-b770-93c7346d3730	3f4939ba-1afe-476d-9e61-039a7f6ffad4	fbe36960-f329-4f7a-98b5-4862b09b3031	\N	Caja	6	25000	COP	\N	\N	t	2026-02-25 21:46:01.374112+00	6	un
60514a54-63dd-4f04-a66d-22ec90f575ea	db599e31-59ab-4ac3-9ea0-994ced46dc46	fbe36960-f329-4f7a-98b5-4862b09b3031	\N	Caja	6	25000	COP	\N	\N	t	2026-02-25 21:46:55.71742+00	6	un
80a60dbd-c311-47fe-b75f-618f15aa4e59	2e08594c-6d0e-4ca0-ac81-06044d2723ea	fbe36960-f329-4f7a-98b5-4862b09b3031	\N	Bandeja	24	43025	COP	\N	\N	t	2026-02-25 21:52:25.563064+00	24	un
40d97b07-b46c-49d6-8f13-90ce0a81207b	f9fdd102-1a36-45ea-8482-e4a1cdf2436a	fbe36960-f329-4f7a-98b5-4862b09b3031	\N	Bandeja	24	38183	COP	\N	\N	t	2026-02-25 21:57:09.805978+00	24	un
ddddf734-e23c-4659-8665-7dc72383ad69	318df1ec-d831-4fe7-ba6c-554ca0c78a5c	c1d57216-ef5f-47cf-96b4-bbb0eeb37dd4	\N	Bloque	3.5	26600	COP	\N	\N	t	2026-02-26 14:20:21.884115+00	3.5	kg
0840f561-4de8-47b6-8feb-5255ae7601c3	edb369a7-b937-42b9-9e3d-4e0ae6466070	b5d5e4fc-717e-4df9-9f8f-34e57938d9a1	\N	Bolsa	100	3361.5	COP	\N	\N	t	2026-02-26 14:36:43.984527+00	100	g
b8217c2f-fa08-4e37-8848-6f94f06fb6f3	4f45a711-ae30-4188-be07-a0a94373fe64	bec420e5-d45f-4e8d-bc5e-53d22cbcf9e4	\N	Bulto	5000	21500	COP	\N	\N	t	2026-02-26 14:45:28.607214+00	5	kg
7248d2a7-a7c9-46ec-a07c-7c9e8fc55988	2415f66a-330e-4dae-bf93-ebe941d8892a	fbe36960-f329-4f7a-98b5-4862b09b3031	\N	Bandeja	24	43025	COP	\N	\N	t	2026-02-26 14:58:20.230905+00	24	un
93ebfb43-e250-4fae-9341-6a2370e5ea5e	f2f46cdd-497b-46e1-9085-a268fa56a43b	392b6cc2-9e27-4c7d-8c32-e4802be67cc9	\N	Six Pack	6	17400	COP	\N	\N	t	2026-02-26 19:54:35.049907+00	6	un
f9aee9f7-66b4-4e5b-84bc-5e4fc050498f	db59f493-f735-42f4-86ea-685c9d27eea6	8fd69c3e-a508-43fc-af98-119a9b9a37e1	\N	Caja	1000	30700	COP	\N	\N	t	2026-02-26 20:31:34.551544+00	1	l
c6f9d233-6315-4bae-8469-3d158d16d0a0	cd7ff907-81b4-4890-a084-779188433ee3	392b6cc2-9e27-4c7d-8c32-e4802be67cc9	\N	Caja	10	3990	COP	\N	\N	t	2026-02-26 20:35:24.117768+00	10	un
c02cc586-4fab-4432-be37-13dd19ac9623	d79d4bbe-bf38-4819-86ac-cf82c613351c	36947d0b-1b3d-4cfa-a321-80103a50f509	\N	Bolsa	1000	16264	COP	\N	\N	t	2026-03-02 13:52:01.082526+00	1	kg
da8cf616-c51a-42ba-9cde-b1af84a33c3b	03f08229-33eb-411f-93d5-4591b7ced037	36947d0b-1b3d-4cfa-a321-80103a50f509	\N	Bolsa	1000	17155	COP	\N	\N	t	2026-03-02 13:53:06.469331+00	1	kg
80ecb8bf-3bbc-4418-8269-9c62cb6b4a98	27890c97-a0a2-4389-ac2d-f2b2a169415c	36947d0b-1b3d-4cfa-a321-80103a50f509	\N	Bolsa	3600	80172	COP	\N	\N	t	2026-03-02 13:54:57.439775+00	3.6	kg
747a1fd3-6aea-4beb-8921-3674b62cd3c9	292d8839-be37-4160-a5c2-b2abbbec0889	c1d57216-ef5f-47cf-96b4-bbb0eeb37dd4	\N	Cuña	1000	85443	COP	\N	\N	t	2026-03-02 14:00:16.978279+00	1000	g
\.


--
-- Data for Name: product_uom_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."product_uom_profiles" ("id", "product_id", "label", "input_unit_code", "qty_in_input_unit", "qty_in_stock_unit", "is_default", "is_active", "source", "created_at", "updated_at", "usage_context") FROM stdin;
0f98e076-8e83-485b-be61-f4d9a7fbd3fe	c80ed0d2-010f-4643-aed1-45ba8cf0e911	Empaque	un	1	10	f	t	supplier_primary	2026-02-17 11:31:25.805737+00	2026-02-17 12:48:39.363+00	general
270c3233-2650-4c32-9b3d-b0bee0a2d002	c80ed0d2-010f-4643-aed1-45ba8cf0e911	Empaque	un	1	10	t	t	supplier_primary	2026-02-17 12:48:39.427604+00	2026-02-17 12:48:39.363+00	general
9ab2637f-a4f4-494d-b853-c552a5ca2946	28cd5694-b9d5-4c84-9d6c-9befd57b5846	Empaque	un	1	10	f	t	supplier_primary	2026-02-17 11:29:43.025614+00	2026-02-17 12:49:41.554+00	general
a9899170-4708-4326-8f0b-151a1c9cf5ee	28cd5694-b9d5-4c84-9d6c-9befd57b5846	Empaque	un	1	10	t	t	supplier_primary	2026-02-17 12:49:41.646469+00	2026-02-17 12:49:41.554+00	general
addf4068-a517-4c0b-9ace-aa7fde67396f	8ef62af2-c488-4e60-8279-2e68682eea38	Bandeja	un	1	12	t	t	supplier_primary	2026-02-17 22:42:29.472731+00	2026-02-25 21:24:27.727+00	remission
a9297927-0b06-420a-9dc4-98373f737ae7	28cd5694-b9d5-4c84-9d6c-9befd57b5846	Empaque	un	1	10	t	t	supplier_primary	2026-02-17 22:15:18.355696+00	2026-02-19 20:21:45.443+00	purchase
9346c790-3d66-48c3-9c60-87ec4b3716df	0f839b07-be3a-46b3-bee2-582fb52a59b1	Bandeja	un	1	24	t	t	supplier_primary	2026-02-18 13:47:08.380722+00	2026-02-25 20:37:15.3+00	remission
f1d710e5-52ee-4804-926e-7428bc3e56d2	8ef62af2-c488-4e60-8279-2e68682eea38	Bandeja	un	1	12	t	t	supplier_primary	2026-02-17 22:42:29.370408+00	2026-02-25 21:24:27.606+00	purchase
b98294c5-f6b4-4aed-9cde-f09f0a2d5709	28cd5694-b9d5-4c84-9d6c-9befd57b5846	Empaque	un	1	10	t	t	supplier_primary	2026-02-17 22:15:18.491313+00	2026-02-19 20:21:45.556+00	remission
2577d33b-f161-43da-8b38-6f509e1e91e3	6020f9ef-9bc0-4a65-87f6-c4d84f601f4b	Bulto	kg	1	50000	t	t	supplier_primary	2026-02-19 20:36:42.628646+00	2026-02-19 20:37:29.376+00	purchase
49b4478a-70c1-4f2a-b57a-bb0712b32ab1	5cc0d070-c4ec-4552-b35c-c7d03492a39f	Paquete	g	1	100	t	t	supplier_primary	2026-02-20 19:55:45.209504+00	2026-02-20 19:55:45.123+00	remission
4a806bdd-bf25-45e7-bca6-c002a0cb177e	575ced55-ca85-4c27-b3a9-abe2bac272cd	Bolsa	g	1	870	t	t	supplier_primary	2026-02-19 15:25:28.988221+00	2026-02-19 20:17:12.731+00	purchase
e92a29e4-132e-490c-b025-8333db829ba9	575ced55-ca85-4c27-b3a9-abe2bac272cd	Bolsa	g	1	870	t	t	supplier_primary	2026-02-19 15:25:29.115709+00	2026-02-19 20:17:12.84+00	remission
f9f3f026-099e-4126-bc9b-d8db5281d4cc	13d47350-ec1c-477a-afba-4146d0d0e9e0	Bloque	g	1	1360	t	t	supplier_primary	2026-02-20 16:28:56.33258+00	2026-02-20 16:31:45.495+00	purchase
3e95a865-4e69-440c-8f3c-e22541e1ffe2	13d47350-ec1c-477a-afba-4146d0d0e9e0	Bloque	g	1	1360	t	t	supplier_primary	2026-02-20 16:28:56.484734+00	2026-02-20 16:31:45.616+00	remission
38a166e6-c5af-445d-bbfd-7da3d79bd05d	19ef7b56-03fe-4218-8fc0-a7c51f2ba7c6	Caja	g	1	150	t	t	supplier_primary	2026-02-19 15:41:37.209866+00	2026-02-19 15:41:53.061+00	purchase
1c51f879-b7ef-4852-9922-08930c8bfc52	19ef7b56-03fe-4218-8fc0-a7c51f2ba7c6	Caja	g	1	150	t	t	supplier_primary	2026-02-19 15:41:37.319932+00	2026-02-19 15:41:53.165+00	remission
04c9c1e9-7e37-4a50-b76a-b2939f9b08fe	5db9eeab-548f-4989-80b0-9611ff918dad	Paquete	un	1	20	t	t	supplier_primary	2026-02-19 15:32:42.738012+00	2026-02-19 20:17:37.239+00	purchase
5825060c-49f4-4cb0-83fd-b910f89d57c6	5db9eeab-548f-4989-80b0-9611ff918dad	Paquete	un	1	20	t	t	supplier_primary	2026-02-19 15:32:42.85002+00	2026-02-19 20:17:37.351+00	remission
c71e8072-313d-43d3-889d-751391c91d55	cf3c5e31-17c4-4aaf-b456-b69efc6e8f1a	Bandeja	ml	1	4800	t	t	supplier_primary	2026-02-17 22:56:35.425659+00	2026-02-19 20:18:10.945+00	purchase
52bed9da-a5cf-4838-a2bd-5b1629ab5c04	0515038c-0444-4dc1-92bf-4871f1ca2852	Paquete	kg	1	1000	t	t	supplier_primary	2026-02-19 16:18:33.587359+00	2026-02-19 20:18:27.945+00	purchase
0b38de90-3628-42e0-af57-39e41f368291	f2c0bc54-d9d2-4c0e-9192-99bdd5cd86e6	Botella	l	1	1000	t	t	supplier_primary	2026-02-17 21:37:56.347368+00	2026-02-19 20:18:48.782+00	purchase
bc59a35f-b8e1-4295-a250-0cfadb6337dc	f2c0bc54-d9d2-4c0e-9192-99bdd5cd86e6	Botella	l	1	1000	t	t	supplier_primary	2026-02-17 21:37:56.504604+00	2026-02-19 20:18:48.902+00	remission
acdb7be3-8aa3-463e-b6d8-5fd467a5e43a	334198ae-c394-48f2-83f5-af515905200b	Paquete	l	1	6000	t	t	supplier_primary	2026-02-19 15:04:47.015763+00	2026-02-19 20:20:13.531+00	purchase
f0441e44-5515-45f2-b10c-d9b20e8f5cd9	334198ae-c394-48f2-83f5-af515905200b	Paquete	l	1	6000	t	t	supplier_primary	2026-02-19 15:04:47.139137+00	2026-02-19 20:20:13.782+00	remission
d14bbf32-58a0-4c59-abf0-4219f6bc2a61	ce7063ef-c60d-48ad-b253-346d9a99368a	Paquete	un	1	250	t	t	supplier_primary	2026-02-19 16:22:19.749378+00	2026-02-19 20:20:29.433+00	purchase
1bf69886-9051-459a-8c05-65664a1fbb55	ce7063ef-c60d-48ad-b253-346d9a99368a	Paquete	un	1	250	t	t	supplier_primary	2026-02-19 16:22:19.883819+00	2026-02-19 20:20:29.528+00	remission
838ed527-3fa7-4d31-be83-4f2123edf3a4	c80ed0d2-010f-4643-aed1-45ba8cf0e911	Empaque	un	1	10	t	t	supplier_primary	2026-02-17 22:15:39.911316+00	2026-02-19 20:20:48.203+00	purchase
3a466436-3d8e-4ac5-b989-f65f9ca88f91	c80ed0d2-010f-4643-aed1-45ba8cf0e911	Empaque	un	1	10	t	t	supplier_primary	2026-02-17 22:15:40.053399+00	2026-02-19 20:20:48.303+00	remission
28c02b61-6764-438a-821d-c3c23aaf68ca	edb369a7-b937-42b9-9e3d-4e0ae6466070	Bolsa	g	1	100	t	t	supplier_primary	2026-02-20 17:32:48.905424+00	2026-02-26 14:36:44.015+00	purchase
71ee556d-af30-4768-9c0e-05f390362d94	318df1ec-d831-4fe7-ba6c-554ca0c78a5c	Bloque	kg	1	3.5	t	t	supplier_primary	2026-02-18 16:22:14.033345+00	2026-02-26 14:20:21.901+00	purchase
ca0100a8-1aa0-4a3f-b8d6-e0fad63f6875	4a8426e1-7a26-4403-9649-3dc460da096c	Paquete	un	1	10	t	t	supplier_primary	2026-02-17 22:18:55.203888+00	2026-02-23 16:32:16.682+00	remission
a5997b14-676a-461e-87ea-1f5a262d7254	5bf72eab-09b1-43f6-aa65-11d888d92f9e	Bolsa	g	1	2000	t	t	supplier_primary	2026-02-20 16:39:39.494053+00	2026-02-20 16:40:06.916+00	purchase
90d453d0-7c3a-42c0-b15a-cec103db27f7	5bf72eab-09b1-43f6-aa65-11d888d92f9e	Bolsa	g	1	2000	t	t	supplier_primary	2026-02-20 16:39:39.590298+00	2026-02-20 16:40:07.016+00	remission
b06b50cf-bdf5-48cf-98c6-688235f160ad	37313d68-3e52-4509-80ef-a7fd3647f6da	Bolsa	g	1	1000	t	t	supplier_primary	2026-02-20 16:57:59.617717+00	2026-02-20 16:58:11.198+00	purchase
e383901d-bb4e-4c90-b77e-09807d2bb615	37313d68-3e52-4509-80ef-a7fd3647f6da	Bolsa	g	1	1000	t	t	supplier_primary	2026-02-20 16:57:59.729877+00	2026-02-20 16:58:11.353+00	remission
83f1b517-17d8-4d82-b207-916ef323f26d	5cc0d070-c4ec-4552-b35c-c7d03492a39f	Paquete	g	1	100	t	t	supplier_primary	2026-02-20 19:55:45.104549+00	2026-02-20 19:55:45.026+00	purchase
4d4374e1-b6f7-4a98-acbd-41d62d72213d	54910231-e9b6-4a84-9739-9831bcc5f4a8	Bolsa	ml	1	1100	t	t	supplier_primary	2026-02-20 19:57:20.526532+00	2026-02-20 19:58:12.415+00	purchase
c9b17680-6da3-4ede-95d9-9ba5b6a617d6	54910231-e9b6-4a84-9739-9831bcc5f4a8	Bolsa	ml	1	1100	t	t	supplier_primary	2026-02-20 19:57:20.631345+00	2026-02-20 19:58:12.502+00	remission
92c2156f-555c-4cda-a165-74c9c2b818af	786c4d51-fa92-4a99-ba68-9bc5b1b01bf1	Bolsa	kg	1	1000	t	t	supplier_primary	2026-02-20 19:59:56.206964+00	2026-02-20 19:59:56.131+00	purchase
05f55138-77ce-4bb3-89c4-595e60ed87b7	786c4d51-fa92-4a99-ba68-9bc5b1b01bf1	Bolsa	kg	1	1000	t	t	supplier_primary	2026-02-20 19:59:56.300646+00	2026-02-20 19:59:56.224+00	remission
f63ee8df-b1e3-4011-b1e6-061912016800	acd24ce9-d4ae-4208-88f7-0bbc1d05bf23	Cuña	g	1	180	t	t	supplier_primary	2026-02-20 20:05:13.585333+00	2026-02-20 20:05:13.494+00	purchase
68933fe5-b993-49f5-bc0c-70a5a61c7367	acd24ce9-d4ae-4208-88f7-0bbc1d05bf23	Cuña	g	1	180	t	t	supplier_primary	2026-02-20 20:05:13.715024+00	2026-02-20 20:05:13.606+00	remission
a1e2edc8-f291-4364-828e-5768f19f4999	ea45d1b3-4b3c-4c82-8cb6-dd12a5b4de73	Botella	g	1	1000	t	t	supplier_primary	2026-02-20 20:07:10.954318+00	2026-02-20 20:07:10.859+00	purchase
3c1cc761-8dd7-41cb-98cc-fa131139a985	ea45d1b3-4b3c-4c82-8cb6-dd12a5b4de73	Botella	g	1	1000	t	t	supplier_primary	2026-02-20 20:07:11.203933+00	2026-02-20 20:07:11.135+00	remission
793b33d6-0adc-4bd5-bf98-06a7870643c0	e365bf9f-5b7b-4b1e-af42-5fadfdb909cb	Pote	g	1	1000	t	t	supplier_primary	2026-02-20 20:08:22.258966+00	2026-02-20 20:20:12.827+00	purchase
57a79a61-8669-4b02-a4bd-1ce338bff90a	e365bf9f-5b7b-4b1e-af42-5fadfdb909cb	Pote	g	1	1000	t	t	supplier_primary	2026-02-20 20:08:22.384473+00	2026-02-20 20:20:12.945+00	remission
9ca82088-afe4-448a-a4b3-20ba6ffab84c	17b89c99-fa06-46df-9b7a-4b12bdf7aab5	Caja	kg	1	20000	t	t	supplier_primary	2026-02-20 20:22:28.796031+00	2026-02-20 20:22:35.729+00	purchase
7cbaaaee-1e23-4c87-91ea-df6c0402ec46	47b00115-54fe-403b-9724-a0f07f82016e	Tarro	kg	1	4000	t	t	supplier_primary	2026-02-20 20:28:57.206896+00	2026-02-20 20:28:57.087+00	purchase
08a5b1c2-aa25-4c73-bed6-fa347cbbd67b	914a9973-d465-4060-9edd-62e62212b4c5	Cartón	un	1	30	t	t	supplier_primary	2026-02-20 20:33:05.572746+00	2026-02-20 20:33:21.303+00	purchase
b8eafabf-3f3d-44ad-bca5-74afd4cef701	914a9973-d465-4060-9edd-62e62212b4c5	Cartón	un	1	30	t	t	supplier_primary	2026-02-20 20:33:05.665984+00	2026-02-20 20:33:21.435+00	remission
b9c1b203-9d7c-4a9b-9f9a-47b72b5c044d	cc5ae544-8255-4c02-a38d-a829fb36e8da	Bloque	un	1	83	t	t	supplier_primary	2026-02-20 20:36:55.627544+00	2026-02-20 20:36:55.543+00	purchase
7ca6a1eb-cc4f-4299-b031-54164431b8ec	cc5ae544-8255-4c02-a38d-a829fb36e8da	Bloque	un	1	83	t	t	supplier_primary	2026-02-20 20:36:55.760346+00	2026-02-20 20:36:55.644+00	remission
1f1a17b9-3743-44e9-8a51-5bb1799338a2	318df1ec-d831-4fe7-ba6c-554ca0c78a5c	Bloque	kg	1	3.5	t	t	supplier_primary	2026-02-18 16:22:14.188266+00	2026-02-26 14:20:22.063+00	remission
18dc513c-fdcc-4c3b-825e-674a66b10efe	c29cd6ec-3bdb-4495-aebc-6ed5d6051ad4	Bandeja	un	1	12	t	t	supplier_primary	2026-02-17 22:45:31.609939+00	2026-02-25 20:36:19.119+00	purchase
97c3e4f0-c8bb-48a5-a945-995569c17832	c29cd6ec-3bdb-4495-aebc-6ed5d6051ad4	Bandeja	un	1	12	t	t	supplier_primary	2026-02-17 22:45:31.707458+00	2026-02-25 20:36:19.258+00	remission
84db5f36-e21e-4682-b8f9-12bd90135afe	b322762d-9cc1-43d8-832e-66659eb63e74	Bandeja	un	1	24	t	t	supplier_primary	2026-02-18 13:47:11.05298+00	2026-02-25 20:36:54.115+00	purchase
d6b572c9-84c0-48e2-b641-2ebbc123425e	b322762d-9cc1-43d8-832e-66659eb63e74	Bandeja	un	1	24	t	t	supplier_primary	2026-02-18 13:47:11.172069+00	2026-02-25 20:36:54.258+00	remission
13c55796-ce29-4be2-9daa-a48bc1048c6f	0f839b07-be3a-46b3-bee2-582fb52a59b1	Bandeja	un	1	24	t	t	supplier_primary	2026-02-18 13:47:08.255332+00	2026-02-25 20:37:15.151+00	purchase
1b3fbbb5-6a9c-452b-80c8-cfbb13f66550	6244e86d-22b2-4d52-83fc-882899ddb943	Bloque	kg	1	1000	t	t	supplier_primary	2026-02-20 20:38:35.514386+00	2026-02-20 20:38:35.409+00	purchase
5cbd3f57-7750-48e8-8bbd-92fd64c5a1b5	6244e86d-22b2-4d52-83fc-882899ddb943	Bloque	kg	1	1000	t	t	supplier_primary	2026-02-20 20:38:35.642819+00	2026-02-20 20:38:35.538+00	remission
28848ba3-7ab2-4153-a897-9c70e51678f5	92708031-37ba-4d0f-bbb5-0e5f3c3ac8b5	Bolsa	kg	1	1000	t	t	supplier_primary	2026-02-20 21:04:45.356759+00	2026-02-20 21:04:45.278+00	purchase
7452f14e-629e-44ea-9d9c-980cc9636557	4a8426e1-7a26-4403-9649-3dc460da096c	Paquete	un	1	10	t	t	supplier_primary	2026-02-17 22:18:24.360444+00	2026-02-23 16:32:16.52+00	purchase
b3df6c15-0faa-47cc-bc23-c8bc0df22eeb	520b9e6a-0b15-4102-bebe-7ed4c33e5fea	Pote	g	1	2800	t	t	supplier_primary	2026-02-23 20:24:12.034695+00	2026-02-23 20:24:39.375+00	purchase
aa0d29ce-241e-44b5-b7a7-2738eb5535d5	520b9e6a-0b15-4102-bebe-7ed4c33e5fea	Pote	g	1	2800	t	t	supplier_primary	2026-02-23 20:24:12.184374+00	2026-02-23 20:24:39.507+00	remission
39a43081-63b5-4c06-99e0-e695ae3874eb	349a0494-247a-4194-b3e8-6c604452fe8b	Botella	ml	1	1500	t	t	supplier_primary	2026-02-25 21:36:37.972109+00	2026-02-25 21:38:34.456+00	purchase
d19e778e-1bdb-42b0-b10b-2766fec3c5c3	349a0494-247a-4194-b3e8-6c604452fe8b	Botella	ml	1	1500	t	t	supplier_primary	2026-02-25 21:36:38.082693+00	2026-02-25 21:38:34.577+00	remission
376f6d79-300c-46fb-8f57-f52f3fd32a06	ae75c0f7-ece7-46d5-ab70-0f7c44c7c4e2	Pote	g	1	340.2	t	t	supplier_primary	2026-02-23 20:29:20.634652+00	2026-02-23 20:30:09.069+00	purchase
1b832a96-0f62-42cb-be40-3ccaeb6e4bf9	ae75c0f7-ece7-46d5-ab70-0f7c44c7c4e2	Pote	g	1	340.2	t	t	supplier_primary	2026-02-23 20:29:20.746526+00	2026-02-23 20:30:09.223+00	remission
e2658cae-3892-4a3d-bfc0-1d1bcc19fdb6	a420c821-edee-44b7-9276-37fb195f8252	Pote	l	1	1000	t	t	supplier_primary	2026-02-23 20:38:57.954611+00	2026-02-23 20:39:03.345+00	purchase
618dae2c-2a93-4c36-b293-3b12cc722e0c	a420c821-edee-44b7-9276-37fb195f8252	Pote	l	1	1000	t	t	supplier_primary	2026-02-23 20:38:58.075707+00	2026-02-23 20:39:03.443+00	remission
a90455f9-dfea-4826-b4bb-94115a652b12	d8f89235-55c7-4c43-a826-8b4713781146	Costo	ml	1	1	t	t	supplier_primary	2026-02-23 20:44:15.272008+00	2026-02-23 20:44:52.657+00	purchase
64f1fbf4-7de4-44a6-9845-01350da0ab87	f80f232e-46e1-4e5a-a404-4579a1b72c44	Bolsa	kg	1	1	t	t	supplier_primary	2026-02-23 21:07:33.091627+00	2026-02-23 21:07:51.739+00	purchase
7c682118-9617-4393-b9bf-cb6d5c54f143	66a1ee94-ec4a-4530-bddf-d3824f85fd08	Bolsa	kg	1	1000	t	t	supplier_primary	2026-02-23 22:30:33.975776+00	2026-02-23 22:30:33.817+00	purchase
04bd2ef3-b2b6-482b-97d0-3b9c6e79a0b4	93a22bf1-3646-44ef-b240-81c769fe92ea	Bolsa	kg	1	1000	t	t	supplier_primary	2026-02-23 22:31:11.189736+00	2026-02-23 22:31:11.095+00	purchase
a70f283a-a6cd-4592-9d14-85911bb109e0	fa74b543-e07e-43e3-84a6-ea987ffeeb06	Bolsa	kg	1	1000	t	t	supplier_primary	2026-02-23 22:34:32.940993+00	2026-02-23 22:34:32.799+00	purchase
b3826d88-db9e-48a2-b969-d11e3ed91334	4437740c-2f53-43c7-ae41-0e8e82983f64	Bolsa	kg	1	1000	t	t	supplier_primary	2026-02-23 22:35:24.570338+00	2026-02-23 22:35:24.382+00	purchase
7bfc3d27-04e0-4ddd-9b50-b15ec62e69f6	15d4a6f8-67fc-41ad-9c5e-2622e0a0cbbb	Bolsa	kg	1	1000	t	t	supplier_primary	2026-02-23 22:36:12.722504+00	2026-02-23 22:36:12.598+00	purchase
1b021ac8-ae50-4560-9bfc-bff487e78f0b	2832b193-af6e-46f5-8d73-1b7051e6c105	Bolsa	kg	1	1000	t	t	supplier_primary	2026-02-23 22:36:50.413617+00	2026-02-23 22:36:50.241+00	purchase
34f1d823-a587-4618-9994-ca33832ddda8	449a2b73-0c98-4e48-8269-c298519bf429	Bolsa	kg	1	1000	t	t	supplier_primary	2026-02-23 22:37:47.899689+00	2026-02-23 22:37:47.799+00	purchase
a74e93fb-9a12-4c35-b9d7-a52f7eb84aee	743a7513-4507-411a-9bb8-327526e8323a	Bolsa	kg	1	1000	t	t	supplier_primary	2026-02-23 22:38:29.935635+00	2026-02-23 22:38:29.83+00	purchase
f5540945-3ada-4262-bd36-e0e2ec7bb4be	cff5ec9e-3ba6-4b7c-8125-1c4d347fb062	Bolsa	kg	1	1000	t	t	supplier_primary	2026-02-23 22:39:08.958058+00	2026-02-23 22:39:08.826+00	purchase
4ff273de-5c58-4748-9b4e-08927cd28a8c	4042f395-e77d-4ca9-b06d-d111282076c9	Bolsa	kg	1	1000	t	t	supplier_primary	2026-02-23 22:40:36.842502+00	2026-02-23 22:40:36.666+00	purchase
e64f2c92-ac62-4e47-84c0-cb87b541009c	3f7c5b37-beb2-4f97-bb1a-0ffab03d9d17	Bolsa	un	1	1	t	t	supplier_primary	2026-02-23 22:41:57.927725+00	2026-02-23 22:41:57.809+00	purchase
c94340ea-8b33-4c77-a7c4-ecab01d42121	3e5ab6a2-e2c3-4477-a73c-d16787500800	Bolsa	kg	1	1000	t	t	supplier_primary	2026-02-23 22:42:42.557768+00	2026-02-23 22:42:42.409+00	purchase
591e97c2-e805-4191-8d46-4b2a7ff335b3	d064c496-2979-4433-a103-52d25723333c	Bolsa	un	1	1	t	t	supplier_primary	2026-02-23 22:43:18.694318+00	2026-02-23 22:43:18.609+00	purchase
1a07247f-2790-4ddd-a098-21d6a0bfcfac	485f1953-7644-4eeb-ad5c-595de849b3c5	Bolsa	kg	1	1000	t	t	supplier_primary	2026-02-23 22:43:53.426413+00	2026-02-23 22:43:53.316+00	purchase
449f30cf-b060-490d-99fa-ceb86d512c7e	008d61d5-18a1-41db-8ff4-e6afd342b615	Bandeja	un	1	24	t	t	supplier_primary	2026-02-25 21:02:02.885374+00	2026-02-25 21:02:40.468+00	purchase
e977fffa-9d4a-4701-a9ba-56a89e0f7aee	008d61d5-18a1-41db-8ff4-e6afd342b615	Bandeja	un	1	24	t	t	supplier_primary	2026-02-25 21:02:03.059281+00	2026-02-25 21:02:40.914+00	remission
5f922699-fddc-4d84-b739-d50bb2e326a3	d03ba8c8-661d-4e20-8211-6105a0a87032	Bolsa	g	1	1000	t	t	supplier_primary	2026-02-23 16:39:41.163391+00	2026-02-25 21:25:46.724+00	purchase
50d58667-0bf7-405c-ace5-8d7b75cbde86	d03ba8c8-661d-4e20-8211-6105a0a87032	Bolsa	g	1	1000	t	t	supplier_primary	2026-02-23 16:39:41.288016+00	2026-02-25 21:25:46.844+00	remission
0488e003-0205-4527-b78c-35f803d8d74f	7c757e78-68ab-47a8-aff7-be53ccc89c77	Bandeja	un	1	24	t	t	supplier_primary	2026-02-25 21:34:10.888961+00	2026-02-25 21:34:23.286+00	purchase
903490b9-30de-4568-a6aa-10e624acf603	7c757e78-68ab-47a8-aff7-be53ccc89c77	Bandeja	un	1	24	t	t	supplier_primary	2026-02-25 21:34:11.022199+00	2026-02-25 21:34:23.436+00	remission
6aff2f0e-4403-4760-8a94-234ecf73946b	f9fdd102-1a36-45ea-8482-e4a1cdf2436a	Bandeja	un	1	24	t	t	supplier_primary	2026-02-25 21:56:51.817634+00	2026-02-25 21:57:10.426+00	remission
8c620b0a-e951-491b-a531-f42d7ea55c95	42ad4143-2469-4ae0-8510-14507b614b6f	Caja	un	1	6	t	t	supplier_primary	2026-02-25 21:41:16.124208+00	2026-02-25 21:41:48.035+00	purchase
57f21fed-c87a-477b-8960-20c935fb9174	42ad4143-2469-4ae0-8510-14507b614b6f	Caja	un	1	6	t	t	supplier_primary	2026-02-25 21:41:16.273535+00	2026-02-25 21:41:48.174+00	remission
3d553d89-edd9-4378-848f-6a7414e8012b	efb4f0b9-9fae-4116-a7b6-2a392611c2fb	Caja	un	1	6	t	t	supplier_primary	2026-02-25 21:44:40.467317+00	2026-02-25 21:44:52.805+00	purchase
52510bb9-10e4-4718-ba3d-dbd6afc3b9e1	efb4f0b9-9fae-4116-a7b6-2a392611c2fb	Caja	un	1	6	t	t	supplier_primary	2026-02-25 21:44:40.609726+00	2026-02-25 21:44:52.923+00	remission
83778877-8e37-4bc0-8e9e-ea9ac980e3f3	3f4939ba-1afe-476d-9e61-039a7f6ffad4	Caja	un	1	6	t	t	supplier_primary	2026-02-25 21:45:48.50758+00	2026-02-25 21:46:01.398+00	purchase
de1ce8e6-74f5-4208-8e8e-80c950a5d8f1	3f4939ba-1afe-476d-9e61-039a7f6ffad4	Caja	un	1	6	t	t	supplier_primary	2026-02-25 21:45:48.654242+00	2026-02-25 21:46:01.53+00	remission
e630506e-c7c7-44b5-bc43-fb5cd642128d	db599e31-59ab-4ac3-9ea0-994ced46dc46	Caja	un	1	6	t	t	supplier_primary	2026-02-25 21:46:44.81653+00	2026-02-25 21:46:55.747+00	purchase
241ad4e8-ecc4-419a-b997-7ce3531b3c1a	db599e31-59ab-4ac3-9ea0-994ced46dc46	Caja	un	1	6	t	t	supplier_primary	2026-02-25 21:46:44.930108+00	2026-02-25 21:46:55.865+00	remission
f77270f7-bcb4-452f-8e6d-f0bd235530fd	4f45a711-ae30-4188-be07-a0a94373fe64	Bulto	kg	1	5000	t	t	supplier_primary	2026-02-26 14:45:07.540343+00	2026-02-26 14:45:28.628+00	purchase
b7c26907-fb10-4a68-8976-68fe8d778bfc	a0c40b80-ab43-44e5-8bf5-dc4177805443	Caja	un	1	24	t	t	supplier_primary	2026-02-25 21:48:24.139152+00	2026-02-25 21:50:02.822+00	purchase
747eed5f-289d-4607-bd04-9d4151e5fa00	a0c40b80-ab43-44e5-8bf5-dc4177805443	Caja	un	1	24	t	t	supplier_primary	2026-02-25 21:48:24.25164+00	2026-02-25 21:50:02.952+00	remission
d227d11f-726e-4d5e-b889-9c67f9eb9652	2e08594c-6d0e-4ca0-ac81-06044d2723ea	Bandeja	un	1	24	t	t	supplier_primary	2026-02-25 21:52:14.269641+00	2026-02-25 21:52:25.585+00	purchase
fcbbe772-1759-4602-84d9-a4597af84641	2e08594c-6d0e-4ca0-ac81-06044d2723ea	Bandeja	un	1	24	t	t	supplier_primary	2026-02-25 21:52:14.40298+00	2026-02-25 21:52:25.695+00	remission
75293fb3-5d34-416e-918d-e15f52b1093d	f9fdd102-1a36-45ea-8482-e4a1cdf2436a	Bandeja	un	1	24	t	t	supplier_primary	2026-02-25 21:56:51.702061+00	2026-02-25 21:57:09.825+00	purchase
d4d2faa7-aa0c-4ecf-8344-bc6c67e0d72a	2415f66a-330e-4dae-bf93-ebe941d8892a	Bandeja	un	1	24	t	t	supplier_primary	2026-02-26 14:58:08.21051+00	2026-02-26 14:58:20.254+00	purchase
4e6a02ce-53ac-4b96-a58b-5724e29e21d9	2415f66a-330e-4dae-bf93-ebe941d8892a	Bandeja	un	1	24	t	t	supplier_primary	2026-02-26 14:58:08.324571+00	2026-02-26 14:58:20.498+00	remission
c6421711-4dba-4b57-ae67-974f213a7910	f2f46cdd-497b-46e1-9085-a268fa56a43b	Six Pack	un	1	6	t	t	supplier_primary	2026-02-26 19:54:12.344986+00	2026-02-26 19:54:35.074+00	purchase
ca61157a-2d5c-4cc9-a8ca-51e5ce4cd5c8	f2f46cdd-497b-46e1-9085-a268fa56a43b	Six Pack	un	1	6	t	t	supplier_primary	2026-02-26 19:54:12.472957+00	2026-02-26 19:54:35.22+00	remission
dcfdd18c-9f1c-4806-a1f6-5377b597f96b	db59f493-f735-42f4-86ea-685c9d27eea6	Caja	l	1	1000	t	t	supplier_primary	2026-02-26 20:26:30.568658+00	2026-02-26 20:31:34.575+00	purchase
14fdb4f8-23f3-4711-b1e8-c73fe0776fb7	db59f493-f735-42f4-86ea-685c9d27eea6	Caja	l	1	1000	t	t	supplier_primary	2026-02-26 20:26:30.721211+00	2026-02-26 20:31:34.722+00	remission
0bf91eee-6119-4976-b6af-4b589c8cf890	cd7ff907-81b4-4890-a084-779188433ee3	Caja	un	1	10	t	t	supplier_primary	2026-02-26 20:35:07.195066+00	2026-02-26 20:35:24.135+00	purchase
753ed703-850b-4876-86e6-ffadb3e74385	d79d4bbe-bf38-4819-86ac-cf82c613351c	Bolsa	kg	1	1000	t	t	supplier_primary	2026-03-02 13:51:51.408728+00	2026-03-02 13:52:01.104+00	purchase
0c79fd70-a74e-46ef-9a03-297d7fa56850	d79d4bbe-bf38-4819-86ac-cf82c613351c	Bolsa	kg	1	1000	t	t	supplier_primary	2026-03-02 13:51:51.537558+00	2026-03-02 13:52:01.318+00	remission
cc05f475-5255-4ae5-a0a6-2f184ed95abb	03f08229-33eb-411f-93d5-4591b7ced037	Bolsa	kg	1	1000	t	t	supplier_primary	2026-03-02 13:52:57.006086+00	2026-03-02 13:53:06.488+00	purchase
f6125624-397d-4255-9cf0-2481778cbf70	03f08229-33eb-411f-93d5-4591b7ced037	Bolsa	kg	1	1000	t	t	supplier_primary	2026-03-02 13:52:57.217522+00	2026-03-02 13:53:06.59+00	remission
6123db95-e4a9-4f69-bcdd-81a516154290	27890c97-a0a2-4389-ac2d-f2b2a169415c	Bolsa	kg	1	3600	t	t	supplier_primary	2026-03-02 13:54:53.024947+00	2026-03-02 13:54:57.465+00	purchase
82d0fa85-d2d1-49b4-95d7-e44fe90f4994	27890c97-a0a2-4389-ac2d-f2b2a169415c	Bolsa	kg	1	3600	t	t	supplier_primary	2026-03-02 13:54:53.124169+00	2026-03-02 13:54:57.573+00	remission
90670ee0-22e9-4360-9391-090aee0f0119	292d8839-be37-4160-a5c2-b2abbbec0889	Cuña	g	1	1000	t	t	supplier_primary	2026-03-02 13:58:21.104285+00	2026-03-02 14:00:17.042+00	purchase
\.


--
-- Data for Name: production_batch_consumptions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."production_batch_consumptions" ("id", "batch_id", "ingredient_product_id", "location_id", "required_qty", "consumed_qty", "stock_unit_code", "movement_id", "created_at", "created_by") FROM stdin;
\.


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."recipes" ("id", "product_id", "quantity", "is_active", "created_at", "updated_at", "ingredient_product_id") FROM stdin;
09c44614-3de6-432d-a61f-ae688a4192df	ce0e5301-6d13-46d6-984b-7446639809e5	200	t	2026-02-20 21:05:22.864218+00	2026-02-20 21:05:22.864218+00	92708031-37ba-4d0f-bbb5-0e5f3c3ac8b5
667f6ede-e715-4fcb-915d-959708945f18	0f9e4a4f-aa26-4267-9127-7c8d22997eb2	6000	t	2026-02-23 19:58:03.019453+00	2026-02-23 19:58:03.019453+00	575ced55-ca85-4c27-b3a9-abe2bac272cd
f8e72d16-3e3e-4987-a537-d3c721435b6f	0f9e4a4f-aa26-4267-9127-7c8d22997eb2	3000	t	2026-02-23 19:58:03.019453+00	2026-02-23 19:58:03.019453+00	13d47350-ec1c-477a-afba-4146d0d0e9e0
619a5bdf-1dde-4e54-8590-ed3fbf7f33bf	0f9e4a4f-aa26-4267-9127-7c8d22997eb2	0.6	t	2026-02-23 19:58:03.019453+00	2026-02-23 19:58:03.019453+00	318df1ec-d831-4fe7-ba6c-554ca0c78a5c
cd51ad57-dac2-48e1-8d75-a0029cae2336	0f9e4a4f-aa26-4267-9127-7c8d22997eb2	200	t	2026-02-23 19:58:03.019453+00	2026-02-23 19:58:03.019453+00	5bf72eab-09b1-43f6-aa65-11d888d92f9e
4cd3379c-7060-4678-8086-b676cd600655	0f9e4a4f-aa26-4267-9127-7c8d22997eb2	0.3	t	2026-02-23 19:58:03.019453+00	2026-02-23 19:58:03.019453+00	ce0e5301-6d13-46d6-984b-7446639809e5
5a55796c-a4b1-4221-b076-cafa74400fbd	0f9e4a4f-aa26-4267-9127-7c8d22997eb2	30	t	2026-02-23 19:58:03.019453+00	2026-02-23 19:58:03.019453+00	37313d68-3e52-4509-80ef-a7fd3647f6da
82fc154a-2bc9-46fe-a52e-33ac82eb2dc9	7f28b4fa-5510-4e0d-8426-b62c3b0a2cd7	2000	t	2026-02-23 20:34:32.145909+00	2026-02-23 20:34:32.145909+00	520b9e6a-0b15-4102-bebe-7ed4c33e5fea
9b2974db-285a-471c-b3e8-5ac4578fef34	7f28b4fa-5510-4e0d-8426-b62c3b0a2cd7	20	t	2026-02-23 20:34:32.145909+00	2026-02-23 20:34:32.145909+00	ae75c0f7-ece7-46d5-ab70-0f7c44c7c4e2
5cf18dd1-7b54-4d94-bcc7-25fcd039f3f4	382b35f2-e12c-4ba7-afc0-bb944fb65e5b	4000	t	2026-02-23 20:49:17.35275+00	2026-02-23 20:49:17.35275+00	a420c821-edee-44b7-9276-37fb195f8252
54749c59-3181-404a-84f2-e66f324af8c5	382b35f2-e12c-4ba7-afc0-bb944fb65e5b	3000	t	2026-02-23 20:49:17.35275+00	2026-02-23 20:49:17.35275+00	6020f9ef-9bc0-4a65-87f6-c4d84f601f4b
062f3787-4b2e-4577-89af-9eb3993354a6	382b35f2-e12c-4ba7-afc0-bb944fb65e5b	4	t	2026-02-23 20:49:17.35275+00	2026-02-23 20:49:17.35275+00	37313d68-3e52-4509-80ef-a7fd3647f6da
cf33e7b9-8d17-4918-a8f6-4a532822392e	84e0b57d-5343-4cab-83ed-19b5bc256d82	8000	t	2026-02-26 20:41:34.207162+00	2026-02-26 20:41:34.207162+00	66a1ee94-ec4a-4530-bddf-d3824f85fd08
53783b6f-54a2-43b1-aa52-454e92eb66df	84e0b57d-5343-4cab-83ed-19b5bc256d82	1232	t	2026-02-26 20:41:34.207162+00	2026-02-26 20:41:34.207162+00	4f45a711-ae30-4188-be07-a0a94373fe64
7c5004f4-4a4f-4bcf-8590-c77308a41e39	84e0b57d-5343-4cab-83ed-19b5bc256d82	560	t	2026-02-26 20:41:34.207162+00	2026-02-26 20:41:34.207162+00	db59f493-f735-42f4-86ea-685c9d27eea6
e42c41ea-0615-48c4-8668-dcbaefec30fe	84e0b57d-5343-4cab-83ed-19b5bc256d82	2	t	2026-02-26 20:41:34.207162+00	2026-02-26 20:41:34.207162+00	cd7ff907-81b4-4890-a084-779188433ee3
d0892845-076f-4703-93e8-10a701165e58	209443bd-1d3f-4c92-82e4-833dfbae26d0	16000	t	2026-02-26 20:45:43.404546+00	2026-02-26 20:45:43.404546+00	47b00115-54fe-403b-9724-a0f07f82016e
15b347b4-46dc-4a9f-b360-f1432bd0abb6	209443bd-1d3f-4c92-82e4-833dfbae26d0	533	t	2026-02-26 20:45:43.404546+00	2026-02-26 20:45:43.404546+00	6020f9ef-9bc0-4a65-87f6-c4d84f601f4b
58868e44-f3c8-432e-b054-c5706b11d0ad	209443bd-1d3f-4c92-82e4-833dfbae26d0	533	t	2026-02-26 20:45:43.404546+00	2026-02-26 20:45:43.404546+00	d8f89235-55c7-4c43-a826-8b4713781146
8b2aeb8b-9f76-40fa-a3cb-59ec4dcc9029	209443bd-1d3f-4c92-82e4-833dfbae26d0	63	t	2026-02-26 20:45:43.404546+00	2026-02-26 20:45:43.404546+00	edb369a7-b937-42b9-9e3d-4e0ae6466070
46066342-4163-4d5a-aa7b-d95b1becaf3e	209443bd-1d3f-4c92-82e4-833dfbae26d0	63	t	2026-02-26 20:45:43.404546+00	2026-02-26 20:45:43.404546+00	37313d68-3e52-4509-80ef-a7fd3647f6da
\.


--
-- Data for Name: production_request_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."production_request_items" ("id", "created_at", "request_id", "product_id", "recipe_id", "quantity", "unit", "requested_quantity", "produced_quantity", "loaded_quantity", "received_quantity", "stage_status", "production_area_kind") FROM stdin;
\.


--
-- Data for Name: recipe_steps; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."recipe_steps" ("id", "recipe_card_id", "step_number", "description", "tip", "time_minutes", "image_path", "created_at", "updated_at", "step_image_url", "step_video_url") FROM stdin;
f1d7cc29-14ff-40da-9e4c-e29b086e2067	15135fdf-d062-46ce-9f11-795196ba9355	1	Se agregan todos los ingredientes en una olla a fuego medio	\N	\N	\N	2026-02-23 20:34:32.443689+00	2026-02-23 20:34:32.443689+00	\N	\N
cfb38b74-300c-4954-a003-913e572bae3e	15135fdf-d062-46ce-9f11-795196ba9355	2	Cocinar mezclando constantemente para lograr extraer el picante del ají.	\N	\N	\N	2026-02-23 20:34:32.443689+00	2026-02-23 20:34:32.443689+00	\N	\N
d3b2f0fb-9848-4341-a886-c34d96b20bf0	15135fdf-d062-46ce-9f11-795196ba9355	3	Se deja enfriar al ambiente antes de empacar al vacío.	\N	\N	\N	2026-02-23 20:34:32.443689+00	2026-02-23 20:34:32.443689+00	\N	\N
227ac98f-058b-470b-961c-ff3cbcd1c73f	e933f2f4-a5dd-405a-a307-4122f4461b06	1	Se llevan todos los ingredientes a una olla y se ponen a fuego medio-bajo hasta que llegue a punto de ebullición.	\N	\N	\N	2026-02-23 20:49:17.734144+00	2026-02-23 20:49:17.734144+00	\N	\N
e975a852-dcbe-4aee-88ba-c559fd07b686	e933f2f4-a5dd-405a-a307-4122f4461b06	2	La preparación se debe dejar en cocción hasta que tenga el espesor indicado.	Se debe realizar la prueba de la cuchara para verificar que esté en el espesor indicado.	30	\N	2026-02-23 20:49:17.734144+00	2026-02-23 20:49:17.734144+00	\N	\N
dd2c7d12-b9a0-4450-a459-3b701c4017c6	f87e0e4b-098f-406f-952c-657382d72759	1	Se inicia con la limpieza y pelada de la cebolla	\N	\N	\N	2026-02-26 20:41:34.545562+00	2026-02-26 20:41:34.545562+00	\N	\N
9126ec08-bd59-44d6-981b-b365af47b549	f87e0e4b-098f-406f-952c-657382d72759	2	Cada cebolla se corta por mitad y se le realizan cortes en pluma no tan delgados para evitar que se deshaga en la cocción.	\N	\N	\N	2026-02-26 20:41:34.545562+00	2026-02-26 20:41:34.545562+00	\N	\N
7389ab2f-2b66-4bfd-ac4e-c156d74dd00d	f87e0e4b-098f-406f-952c-657382d72759	3	En una olla grande y honda se agrega el azúcar y se deja caramelizar, es importante agitar la olla ocasionalmente de forma circular sin ningún elemento, solo dando vueltas a la olla para evitar que esta se pegue o se queme.	\N	\N	\N	2026-02-26 20:41:34.545562+00	2026-02-26 20:41:34.545562+00	\N	\N
496ddf98-23fc-4a4c-87c4-7cc44f3fa051	f87e0e4b-098f-406f-952c-657382d72759	4	Cuando ya adquiera la consistencia caramelizada y este derrita todo el azúcar se añade la cebolla y sobre ella el vino y el Maggi.	\N	\N	\N	2026-02-26 20:41:34.545562+00	2026-02-26 20:41:34.545562+00	\N	\N
6311c226-e9f8-42d5-98c2-519232f5028f	f87e0e4b-098f-406f-952c-657382d72759	5	Se tapa y se deja cocinar a fuego medio.	\N	50	\N	2026-02-26 20:41:34.545562+00	2026-02-26 20:41:34.545562+00	\N	\N
483da4c5-befa-45b5-a8af-94056ad83899	f87e0e4b-098f-406f-952c-657382d72759	6	Transcurrido el tiempo se apaga y se deja enfriar al ambiente para después porcionar.	\N	\N	\N	2026-02-26 20:41:34.545562+00	2026-02-26 20:41:34.545562+00	\N	\N
\.


--
-- Data for Name: restock_request_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."restock_request_items" ("id", "created_at", "request_id", "product_id", "quantity", "unit", "transfer_unit_price", "transfer_currency", "transfer_total", "production_area_kind", "prepared_quantity", "shipped_quantity", "received_quantity", "shortage_quantity", "item_status", "notes", "input_qty", "input_unit_code", "conversion_factor_to_stock", "stock_unit_code", "source_location_id") FROM stdin;
692681b3-2c31-46a1-8fdb-55bda359f5f2	2026-02-19 19:15:42.185662+00	21996bca-4c71-4e1b-b836-780f80893aa7	c80ed0d2-010f-4643-aed1-45ba8cf0e911	50	un	\N	\N	\N	cocina_bar	0	0	0	0	pending	\N	5	un	10	un	\N
\.


--
-- Data for Name: role_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."role_permissions" ("id", "role", "permission_id", "scope_type", "scope_site_type", "scope_area_kind", "is_allowed", "created_at") FROM stdin;
67204491-7e3b-49c3-8169-afb46c8a65cc	propietario	02f44bfe-0232-4104-9c94-c62fff4c0c07	global	\N	\N	t	2026-01-18 17:10:40.064109+00
54ed7494-96a7-4090-9564-23463b860451	gerente_general	02f44bfe-0232-4104-9c94-c62fff4c0c07	global	\N	\N	t	2026-01-18 17:10:40.064109+00
3dc385e6-deb2-4274-ba71-98db13fc3b39	propietario	47bcf8a0-a5dd-4b0b-9922-3ed4347a2780	global	\N	\N	t	2026-01-31 20:51:15.881831+00
864d3a08-938c-4dce-a2f7-08a553ed8315	gerente_general	47bcf8a0-a5dd-4b0b-9922-3ed4347a2780	global	\N	\N	t	2026-01-31 20:51:15.881831+00
45f1476e-6123-4232-8ba0-c701869dfa61	propietario	3c9feb20-7cee-439b-95bb-e67447e2237b	global	\N	\N	t	2026-01-18 17:10:40.064109+00
3030106b-d12b-4a62-859f-9d799081514a	gerente_general	3c9feb20-7cee-439b-95bb-e67447e2237b	global	\N	\N	t	2026-01-18 17:10:40.064109+00
5f934c51-26f5-4ec2-9155-a71d8f70d88d	propietario	18cb2439-9f01-43a4-8293-2ab075277640	global	\N	\N	t	2026-01-18 17:10:40.064109+00
ec44fefe-0dd4-4abf-ad42-3f7b3cc9641f	gerente_general	18cb2439-9f01-43a4-8293-2ab075277640	global	\N	\N	t	2026-01-18 17:10:40.064109+00
d214fd0b-83aa-45c5-a307-4e3cc2b99901	propietario	34c4e840-af96-43fc-8641-3fa640b97899	global	\N	\N	t	2026-01-18 17:10:40.064109+00
306306eb-6dd7-4a81-b730-b3437906461c	gerente_general	34c4e840-af96-43fc-8641-3fa640b97899	global	\N	\N	t	2026-01-18 17:10:40.064109+00
8b3e9255-f8dd-4085-99ca-066f222b1890	propietario	c2c71b44-2771-4778-b958-39f24ed2f3a6	global	\N	\N	t	2026-01-18 17:10:40.064109+00
68d34553-be43-4368-a5c0-6c74e574964b	gerente_general	c2c71b44-2771-4778-b958-39f24ed2f3a6	global	\N	\N	t	2026-01-18 17:10:40.064109+00
31638195-1e4b-4ba4-8a9c-10df4c3b94d5	propietario	87c8bdbd-816c-4c9f-8f61-4f59ec59c905	global	\N	\N	t	2026-01-18 17:10:40.064109+00
5dbe2630-c6ee-49bb-bd38-5d58ba794ae1	gerente_general	87c8bdbd-816c-4c9f-8f61-4f59ec59c905	global	\N	\N	t	2026-01-18 17:10:40.064109+00
b807d48c-fd75-44d7-b93d-9d6aeccb1aa6	propietario	3cb8509a-b18a-4d4c-b95e-34f14b9288b2	global	\N	\N	t	2026-01-18 17:10:40.064109+00
6f0550b1-4395-4998-b162-ea6a2d6b5bcd	gerente_general	3cb8509a-b18a-4d4c-b95e-34f14b9288b2	global	\N	\N	t	2026-01-18 17:10:40.064109+00
49112254-ae55-4e44-8eaa-a87b83290215	propietario	aeddf737-76b4-433f-92d6-593539dba600	global	\N	\N	t	2026-01-18 17:10:40.064109+00
173226ae-a8b5-4d90-89ee-bbdcc583cfbc	gerente_general	aeddf737-76b4-433f-92d6-593539dba600	global	\N	\N	t	2026-01-18 17:10:40.064109+00
18b34f7d-14fe-40f7-b101-edee7c6d0a69	gerente	47bcf8a0-a5dd-4b0b-9922-3ed4347a2780	site	\N	\N	t	2026-01-31 20:51:15.881831+00
405d1a5b-9ace-40df-87e9-baa600a03739	bodeguero	47bcf8a0-a5dd-4b0b-9922-3ed4347a2780	site	\N	\N	t	2026-01-31 20:51:15.881831+00
8ee944ad-2965-466b-a246-8f0f3cf5d764	propietario	8086ddb7-950a-4f76-9a53-eaa5a4410c6e	global	\N	\N	t	2026-01-18 17:10:40.064109+00
8cab022e-f5aa-4e21-94c3-4b8774524b79	gerente_general	8086ddb7-950a-4f76-9a53-eaa5a4410c6e	global	\N	\N	t	2026-01-18 17:10:40.064109+00
50cb409c-a5f2-4821-802c-0d6b1c2473a1	propietario	25da0a2f-0b8b-46f5-b744-c83f9ce3e8c5	global	\N	\N	t	2026-01-18 17:10:40.064109+00
56412161-5999-4417-a948-c4143d9c0e49	gerente_general	25da0a2f-0b8b-46f5-b744-c83f9ce3e8c5	global	\N	\N	t	2026-01-18 17:10:40.064109+00
4465dc87-de93-46ea-9db1-fcc85147fed1	propietario	20ff1032-e248-4ed3-b033-e4b7bb97b4b4	global	\N	\N	t	2026-01-18 17:10:40.064109+00
e3505294-fb66-4bca-a615-ad516542aa72	gerente_general	20ff1032-e248-4ed3-b033-e4b7bb97b4b4	global	\N	\N	t	2026-01-18 17:10:40.064109+00
f83462e2-a34a-461e-96e1-4939a22e8366	gerente	02f44bfe-0232-4104-9c94-c62fff4c0c07	site	\N	\N	t	2026-01-18 17:10:40.064109+00
e3fc08d3-719e-4766-9e7f-db5c84870cb8	mesero	c2c71b44-2771-4778-b958-39f24ed2f3a6	site_type	satellite	\N	t	2026-02-21 14:30:00.35591+00
84269e82-1f00-49fd-857e-0c5f4608a3f0	gerente	3c9feb20-7cee-439b-95bb-e67447e2237b	site	\N	\N	t	2026-01-18 17:10:40.064109+00
95957147-3619-48ef-9662-55151dc81f02	gerente	18cb2439-9f01-43a4-8293-2ab075277640	site	\N	\N	t	2026-01-18 17:10:40.064109+00
d0c1b42c-bd50-4a61-b545-f0f8f23aed8b	gerente	34c4e840-af96-43fc-8641-3fa640b97899	site	\N	\N	t	2026-01-18 17:10:40.064109+00
8fd480c4-369e-4378-a490-9545ce5ab719	gerente	c2c71b44-2771-4778-b958-39f24ed2f3a6	site	\N	\N	t	2026-01-18 17:10:40.064109+00
cccb87cb-8a1d-4363-ba9c-8f726517dc9b	gerente	87c8bdbd-816c-4c9f-8f61-4f59ec59c905	site	\N	\N	t	2026-01-18 17:10:40.064109+00
10f7b940-e2ac-43c6-9ac1-51f1ae0905c2	gerente	3cb8509a-b18a-4d4c-b95e-34f14b9288b2	site	\N	\N	t	2026-01-18 17:10:40.064109+00
5ac67bf6-4b9d-49e1-af4a-6871b1c19e16	gerente	aeddf737-76b4-433f-92d6-593539dba600	site	\N	\N	t	2026-01-18 17:10:40.064109+00
f3cadc07-5abe-4430-819c-08c66dbf12e3	mesero	20ff1032-e248-4ed3-b033-e4b7bb97b4b4	site_type	satellite	\N	t	2026-02-21 14:30:00.35591+00
491b95e1-7c5b-4adc-a8d9-d28f5b603569	gerente	8086ddb7-950a-4f76-9a53-eaa5a4410c6e	site	\N	\N	t	2026-01-18 17:10:40.064109+00
aff3462f-84b4-49b1-ab85-22fc327a4ec2	gerente	25da0a2f-0b8b-46f5-b744-c83f9ce3e8c5	site	\N	\N	t	2026-01-18 17:10:40.064109+00
8ea68146-cf01-454c-b972-bb878c37a8a0	gerente	20ff1032-e248-4ed3-b033-e4b7bb97b4b4	site	\N	\N	t	2026-01-18 17:10:40.064109+00
b204febc-9b12-4c67-92fd-ec95dd705403	cajero	c2c71b44-2771-4778-b958-39f24ed2f3a6	site_type	satellite	\N	t	2026-01-18 17:10:40.064109+00
1433abc7-9e0e-4f9a-8b54-8e9acbf06e49	mesero	c2c71b44-2771-4778-b958-39f24ed2f3a6	site_type	satellite	\N	t	2026-01-18 17:10:40.064109+00
36dc80ff-88b8-4e34-be8a-bdd1b84f2996	cajero	20ff1032-e248-4ed3-b033-e4b7bb97b4b4	site_type	satellite	\N	t	2026-01-18 17:10:40.064109+00
2425d2fa-a720-4a27-acec-88de07340899	mesero	20ff1032-e248-4ed3-b033-e4b7bb97b4b4	site_type	satellite	\N	t	2026-01-18 17:10:40.064109+00
6275169f-693d-4b0f-a8a5-b49ea2c2a2e8	barista	34c4e840-af96-43fc-8641-3fa640b97899	site_type	satellite	\N	t	2026-01-18 17:10:40.064109+00
7d7eb103-9792-4c52-9cad-e22c8b8de2b8	barista	8086ddb7-950a-4f76-9a53-eaa5a4410c6e	site_type	satellite	\N	t	2026-01-18 17:10:40.064109+00
a6c80c52-5ce0-46a9-a71c-45f93baeaf4f	barista	c2c71b44-2771-4778-b958-39f24ed2f3a6	site_type	satellite	\N	t	2026-01-18 17:10:40.064109+00
b7d54d58-429d-45a3-84d3-023d0723a5b8	barista	20ff1032-e248-4ed3-b033-e4b7bb97b4b4	site_type	satellite	\N	t	2026-01-18 17:10:40.064109+00
8b321288-334d-4827-95f5-acec8591efbe	cocinero	34c4e840-af96-43fc-8641-3fa640b97899	site_type	satellite	\N	t	2026-01-18 17:10:40.064109+00
79fcd421-8771-4bb3-81eb-0239dc858c5d	cocinero	8086ddb7-950a-4f76-9a53-eaa5a4410c6e	site_type	satellite	\N	t	2026-01-18 17:10:40.064109+00
f7b268a6-a757-4af8-9abf-5a944a01ca12	cocinero	c2c71b44-2771-4778-b958-39f24ed2f3a6	site_type	satellite	\N	t	2026-01-18 17:10:40.064109+00
8812b3f1-6055-4dc4-af11-eaa824cd5e97	cocinero	20ff1032-e248-4ed3-b033-e4b7bb97b4b4	site_type	satellite	\N	t	2026-01-18 17:10:40.064109+00
9c7ec04f-5fe5-4d00-b178-d1a1c593b4b5	cocinero	34c4e840-af96-43fc-8641-3fa640b97899	site_type	production_center	\N	t	2026-01-18 17:10:40.064109+00
d6050d81-deb3-442f-b78b-181a6123ced9	cocinero	25da0a2f-0b8b-46f5-b744-c83f9ce3e8c5	site_type	production_center	\N	t	2026-01-18 17:10:40.064109+00
ebaec80d-5762-4414-a36a-f178dbb84089	cocinero	8086ddb7-950a-4f76-9a53-eaa5a4410c6e	site_type	production_center	\N	t	2026-01-18 17:10:40.064109+00
0f246ea9-522e-4fe4-8d9c-834d8ab5c7ad	panadero	34c4e840-af96-43fc-8641-3fa640b97899	site_type	production_center	\N	t	2026-01-18 17:10:40.064109+00
4ec73907-6ed0-4645-8df0-a6c773713408	repostero	34c4e840-af96-43fc-8641-3fa640b97899	site_type	production_center	\N	t	2026-01-18 17:10:40.064109+00
5ce98a9d-2100-4120-a4eb-1b869d5b5752	pastelero	34c4e840-af96-43fc-8641-3fa640b97899	site_type	production_center	\N	t	2026-01-18 17:10:40.064109+00
e52b3378-f4c3-4156-9d2a-16f0c033b5cd	panadero	25da0a2f-0b8b-46f5-b744-c83f9ce3e8c5	site_type	production_center	\N	t	2026-01-18 17:10:40.064109+00
790a9ff6-abf4-4030-865d-1a69488458de	repostero	25da0a2f-0b8b-46f5-b744-c83f9ce3e8c5	site_type	production_center	\N	t	2026-01-18 17:10:40.064109+00
78a86379-d863-41ab-808b-f9fe6a1eb898	pastelero	25da0a2f-0b8b-46f5-b744-c83f9ce3e8c5	site_type	production_center	\N	t	2026-01-18 17:10:40.064109+00
5c6b6edf-cdc9-4358-9871-dca07ba76e64	panadero	8086ddb7-950a-4f76-9a53-eaa5a4410c6e	site_type	production_center	\N	t	2026-01-18 17:10:40.064109+00
98aa1264-ac59-4ebe-87a2-aeba82ca5de3	repostero	8086ddb7-950a-4f76-9a53-eaa5a4410c6e	site_type	production_center	\N	t	2026-01-18 17:10:40.064109+00
32e7536a-e4fa-4e0a-80b6-482460e7231f	pastelero	8086ddb7-950a-4f76-9a53-eaa5a4410c6e	site_type	production_center	\N	t	2026-01-18 17:10:40.064109+00
71c600b8-19d2-4dd6-985e-78ac62eb7b60	contador	87c8bdbd-816c-4c9f-8f61-4f59ec59c905	site_type	admin	\N	t	2026-01-18 17:10:40.064109+00
a0c0e2f1-0e3d-432b-bc38-548a8dc96e4a	marketing	aeddf737-76b4-433f-92d6-593539dba600	site_type	admin	\N	t	2026-01-18 17:10:40.064109+00
bbbb0277-de8b-4825-845e-7fc0f6341288	propietario	eaba19a5-c16e-4aaa-a8f7-e6c980d34241	global	\N	\N	t	2026-01-31 20:57:36.301032+00
8745ff96-92e5-4fd8-8973-4da9b291082c	gerente_general	eaba19a5-c16e-4aaa-a8f7-e6c980d34241	global	\N	\N	t	2026-01-31 20:57:36.301032+00
f41698d9-f75f-460e-a074-6cd6848d3539	gerente	eaba19a5-c16e-4aaa-a8f7-e6c980d34241	site	\N	\N	t	2026-01-31 20:57:36.301032+00
c7596cc1-67b2-46f2-b80e-e08031eb17d4	bodeguero	eaba19a5-c16e-4aaa-a8f7-e6c980d34241	site	\N	\N	t	2026-01-31 20:57:36.301032+00
15f15281-82a1-42ec-afec-49db1209de87	propietario	8b52f5f0-be2f-4669-ade8-f40c81cd0b4b	global	\N	\N	t	2026-02-19 13:40:42.93701+00
8941ab6a-b436-45e6-83a1-52b3bad783ba	gerente_general	8b52f5f0-be2f-4669-ade8-f40c81cd0b4b	global	\N	\N	t	2026-02-19 13:40:42.93701+00
ae12b54d-506c-49a7-82be-7a64f7dcb8b2	propietario	34c4e840-af96-43fc-8641-3fa640b97899	global	\N	\N	t	2026-02-19 13:40:42.93701+00
f9ea32f4-5808-41d5-a3fe-2d1a2ad7be57	gerente_general	34c4e840-af96-43fc-8641-3fa640b97899	global	\N	\N	t	2026-02-19 13:40:42.93701+00
8ee85272-3fcd-4140-ab0b-7cb878b0b6a3	propietario	ee7e2c51-e5e6-4fa4-b104-915230b5deb2	global	\N	\N	t	2026-02-19 13:40:42.93701+00
a883799a-7557-4622-95a5-6cbb915a3ad3	gerente_general	ee7e2c51-e5e6-4fa4-b104-915230b5deb2	global	\N	\N	t	2026-02-19 13:40:42.93701+00
17fabd6f-10a7-46c9-b829-935f6da045e7	propietario	8086ddb7-950a-4f76-9a53-eaa5a4410c6e	global	\N	\N	t	2026-02-19 13:40:42.93701+00
ce27eab0-f2a6-4404-b61e-fe8f2e1e68e2	gerente_general	8086ddb7-950a-4f76-9a53-eaa5a4410c6e	global	\N	\N	t	2026-02-19 13:40:42.93701+00
2c2974c1-97b7-4bc9-a8c0-37ac90c41eb3	propietario	3cb8509a-b18a-4d4c-b95e-34f14b9288b2	global	\N	\N	t	2026-02-19 13:40:42.93701+00
2f29091b-7ffe-48ed-96e7-487a860a92fd	gerente_general	3cb8509a-b18a-4d4c-b95e-34f14b9288b2	global	\N	\N	t	2026-02-19 13:40:42.93701+00
aa6556ab-6d32-4907-87a0-9b96d711b849	propietario	62e26f14-8437-4dfb-a0ec-58f621bc4cf8	global	\N	\N	t	2026-02-19 13:40:42.93701+00
93fdf621-f2d8-4924-a267-e6a02b8fb9b6	gerente_general	62e26f14-8437-4dfb-a0ec-58f621bc4cf8	global	\N	\N	t	2026-02-19 13:40:42.93701+00
6a566864-5970-44e9-9fec-667ebba956af	gerente	ee7e2c51-e5e6-4fa4-b104-915230b5deb2	site	production_center	\N	t	2026-02-19 13:40:42.93701+00
a2c3977e-7205-4b97-9e77-7bc0cca42033	bodeguero	ee7e2c51-e5e6-4fa4-b104-915230b5deb2	site	production_center	\N	t	2026-02-19 13:40:42.93701+00
87a17aa5-3d16-47d7-b586-963f169a5196	gerente	62e26f14-8437-4dfb-a0ec-58f621bc4cf8	site	production_center	\N	t	2026-02-19 13:40:42.93701+00
a73422f8-add2-40be-8dc8-d56de75c0ec6	bodeguero	62e26f14-8437-4dfb-a0ec-58f621bc4cf8	site	production_center	\N	t	2026-02-19 13:40:42.93701+00
5c2a0a39-ac54-4143-aa03-3b1b52ee443f	mesero	c2c71b44-2771-4778-b958-39f24ed2f3a6	site_type	satellite	\N	t	2026-02-21 15:06:34.882787+00
564069e9-17c0-43b7-8aaf-2102391317f4	mesero	20ff1032-e248-4ed3-b033-e4b7bb97b4b4	site_type	satellite	\N	t	2026-02-21 15:06:34.882787+00
382ce75a-6f0f-42a4-808a-644292a3e95f	cajero	c2c71b44-2771-4778-b958-39f24ed2f3a6	site_type	satellite	\N	t	2026-02-21 15:06:34.882787+00
aa2a90db-c56f-4f66-b6ff-c5d72bfcf164	cajero	c2c71b44-2771-4778-b958-39f24ed2f3a6	site_type	production_center	\N	t	2026-02-21 15:06:34.882787+00
eaae9e82-1010-4593-93b9-8118ab933186	mesero	c2c71b44-2771-4778-b958-39f24ed2f3a6	site_type	satellite	\N	t	2026-02-21 15:06:34.882787+00
fdc08e9c-7529-4ddf-af03-5beb9f86a1f6	mesero	c2c71b44-2771-4778-b958-39f24ed2f3a6	site_type	production_center	\N	t	2026-02-21 15:06:34.882787+00
028ac797-34c7-4654-ba91-4af6f3b8bf1a	cajero	20ff1032-e248-4ed3-b033-e4b7bb97b4b4	site_type	satellite	\N	t	2026-02-21 15:06:34.882787+00
e13c4d07-61a0-4f93-b3cd-f43fb44b6166	cajero	20ff1032-e248-4ed3-b033-e4b7bb97b4b4	site_type	production_center	\N	t	2026-02-21 15:06:34.882787+00
5493366c-2ec2-4a4d-8024-eb4af4c6afa4	mesero	20ff1032-e248-4ed3-b033-e4b7bb97b4b4	site_type	satellite	\N	t	2026-02-21 15:06:34.882787+00
4141c362-c995-4db3-bf27-5f650e32f923	mesero	20ff1032-e248-4ed3-b033-e4b7bb97b4b4	site_type	production_center	\N	t	2026-02-21 15:06:34.882787+00
97fa6f01-960e-4dcc-96ab-bd858652de02	propietario	fe9c6157-2a2f-4a2b-b4c1-0ba8f814ecf3	global	\N	\N	t	2026-02-09 21:10:26.7374+00
89d4ffa3-ca1b-47da-bc84-5b77de967feb	gerente_general	fe9c6157-2a2f-4a2b-b4c1-0ba8f814ecf3	global	\N	\N	t	2026-02-09 21:10:26.7374+00
70ec67f6-2ce9-4306-b7a8-7419ff2c191b	gerente	fe9c6157-2a2f-4a2b-b4c1-0ba8f814ecf3	site	\N	\N	t	2026-02-09 21:10:26.7374+00
1c2e65b7-1e24-4808-b226-4a4f7cd56575	bodeguero	fe9c6157-2a2f-4a2b-b4c1-0ba8f814ecf3	site	\N	\N	t	2026-02-09 21:10:26.7374+00
8e52fed3-2e2d-4678-88b7-0bf2972abcc7	cajero	fe9c6157-2a2f-4a2b-b4c1-0ba8f814ecf3	site_type	satellite	\N	t	2026-02-09 21:10:26.7374+00
1c86d6dc-2689-451f-913a-c7c67f1851c4	barista	fe9c6157-2a2f-4a2b-b4c1-0ba8f814ecf3	site_type	satellite	\N	t	2026-02-09 21:10:26.7374+00
71b4681e-7386-4098-8330-41c70d1da52e	cocinero	fe9c6157-2a2f-4a2b-b4c1-0ba8f814ecf3	site_type	satellite	\N	t	2026-02-09 21:10:26.7374+00
ea7e13ac-4de4-4240-811e-a0cf18fcc4d8	cocinero	fe9c6157-2a2f-4a2b-b4c1-0ba8f814ecf3	site_type	production_center	\N	t	2026-02-09 21:10:26.7374+00
26b16b92-ca2b-4520-82dd-952dd5e98441	panadero	fe9c6157-2a2f-4a2b-b4c1-0ba8f814ecf3	site_type	production_center	\N	t	2026-02-09 21:10:26.7374+00
cc66c3fe-6787-417a-bcac-e4e514bb9fb6	repostero	fe9c6157-2a2f-4a2b-b4c1-0ba8f814ecf3	site_type	production_center	\N	t	2026-02-09 21:10:26.7374+00
9adb2fab-3552-426e-9742-efc6e9367428	pastelero	fe9c6157-2a2f-4a2b-b4c1-0ba8f814ecf3	site_type	production_center	\N	t	2026-02-09 21:10:26.7374+00
5edbb9ea-85f4-430b-bd97-cddfa4957f28	bodeguero	cea9689b-3362-4ff4-9db1-821790df6d20	site	\N	\N	t	2026-02-19 19:53:31.723721+00
5d03af34-ad47-4220-859c-121f28df9ae3	bodeguero	65e35395-ad98-4ce4-9aa2-37d166660e7f	site	\N	\N	t	2026-02-19 19:53:31.723721+00
5878d313-0e18-486f-96e1-9f61b223c0ea	bodeguero	c4db24a3-f071-4c5c-a160-a5b87628ffb0	site	\N	\N	t	2026-02-19 19:53:31.723721+00
86c4586f-8405-48ec-97f7-71708df14034	propietario	d4aca4fa-da1a-4087-a26c-e550d9686c09	global	\N	\N	t	2026-01-30 15:56:30.886953+00
9ecfe7eb-9b5f-4a50-94b2-0ea13cb12b6e	gerente_general	d4aca4fa-da1a-4087-a26c-e550d9686c09	global	\N	\N	t	2026-01-30 15:56:30.886953+00
30983e61-2724-4530-96df-c7beba224e69	propietario	c12f12c3-ac0d-49d0-abe6-01a20f7cb3ac	global	\N	\N	t	2026-01-30 15:56:30.886953+00
b834b18e-8590-4721-a7e1-26fd7df50db4	gerente_general	c12f12c3-ac0d-49d0-abe6-01a20f7cb3ac	global	\N	\N	t	2026-01-30 15:56:30.886953+00
19bb3a46-6a28-4972-b061-009c1d6fa144	propietario	22935557-ae7f-4c2e-aacb-aa0fa77c9080	global	\N	\N	t	2026-01-30 15:56:30.886953+00
a86a7911-492b-4296-a050-8a89f686eeee	gerente_general	22935557-ae7f-4c2e-aacb-aa0fa77c9080	global	\N	\N	t	2026-01-30 15:56:30.886953+00
1adf487e-4ece-4c3c-b59f-13d785591d0e	propietario	ac739689-b0d0-46c4-8794-951ba8108ca2	global	\N	\N	t	2026-01-30 15:56:30.886953+00
c14868bd-8d8f-4d71-95af-1dcc8307f5dc	gerente_general	ac739689-b0d0-46c4-8794-951ba8108ca2	global	\N	\N	t	2026-01-30 15:56:30.886953+00
3affe097-ab12-43be-a4d3-0f071129ed4c	propietario	3bfd6c64-e166-47f5-8913-054bef399ae0	global	\N	\N	t	2026-01-30 15:56:30.886953+00
76f8317a-33e9-41e8-860c-d439161a1330	gerente_general	3bfd6c64-e166-47f5-8913-054bef399ae0	global	\N	\N	t	2026-01-30 15:56:30.886953+00
b3f86c0a-a0e0-4605-9dd5-0056b4b6157e	propietario	2cbf4624-239b-4b3a-a7c4-8163fcdb544f	global	\N	\N	t	2026-01-30 15:56:30.886953+00
f5ef1b47-1895-440f-ad47-70db086ff0b0	gerente_general	2cbf4624-239b-4b3a-a7c4-8163fcdb544f	global	\N	\N	t	2026-01-30 15:56:30.886953+00
609c1988-0d7b-4f64-aeac-38cbf2931845	propietario	69be7320-2936-4a4b-a6db-f05f5d83097e	global	\N	\N	t	2026-01-30 15:56:30.886953+00
5fc1f990-eb34-45c6-ab7d-7a297be5066f	gerente_general	69be7320-2936-4a4b-a6db-f05f5d83097e	global	\N	\N	t	2026-01-30 15:56:30.886953+00
ff83ee3b-2211-4262-bc08-87efd237b9b4	propietario	cea9689b-3362-4ff4-9db1-821790df6d20	global	\N	\N	t	2026-01-30 15:56:30.886953+00
0bf61000-6340-45eb-8e74-3c727c87108d	gerente_general	cea9689b-3362-4ff4-9db1-821790df6d20	global	\N	\N	t	2026-01-30 15:56:30.886953+00
458e76a9-322d-4301-b4b9-f3245f6f155d	propietario	467e3dd4-053f-4aac-b61a-9ee5e6481b5f	global	\N	\N	t	2026-01-30 15:56:30.886953+00
faf3a4d6-0f74-42dd-9ba3-744033f1ec5d	gerente_general	467e3dd4-053f-4aac-b61a-9ee5e6481b5f	global	\N	\N	t	2026-01-30 15:56:30.886953+00
5cbc57e9-6798-48f2-830d-fac33456da4b	propietario	16d64dc1-84e5-4365-b810-2a0e1a2ef741	global	\N	\N	t	2026-01-30 15:56:30.886953+00
a3d0ff9c-3f06-44b4-aaec-b5bdcdd36944	gerente_general	16d64dc1-84e5-4365-b810-2a0e1a2ef741	global	\N	\N	t	2026-01-30 15:56:30.886953+00
7ca2ec79-3243-471f-807b-0f881994e0d6	propietario	65e35395-ad98-4ce4-9aa2-37d166660e7f	global	\N	\N	t	2026-01-30 15:56:30.886953+00
f0ce6832-d1f5-43bf-a248-b051ac509bf9	gerente_general	65e35395-ad98-4ce4-9aa2-37d166660e7f	global	\N	\N	t	2026-01-30 15:56:30.886953+00
b81a7649-6e9d-46b1-87f5-c198c23a000a	propietario	c4db24a3-f071-4c5c-a160-a5b87628ffb0	global	\N	\N	t	2026-01-30 15:56:30.886953+00
c3d74772-bac2-45bd-b31c-9e2732b46eb1	gerente_general	c4db24a3-f071-4c5c-a160-a5b87628ffb0	global	\N	\N	t	2026-01-30 15:56:30.886953+00
8b313a17-7e38-4662-a7c9-c34641de7396	propietario	c0a569d6-6ccd-4089-a4df-198ca1172a81	global	\N	\N	t	2026-01-30 15:56:30.886953+00
dbb38214-61c4-423e-8a27-1e66e1c52edf	gerente_general	c0a569d6-6ccd-4089-a4df-198ca1172a81	global	\N	\N	t	2026-01-30 15:56:30.886953+00
f55ed69a-5637-435e-b46b-c3731ae78a81	propietario	68313f31-be99-4260-a2ff-679590c2f98e	global	\N	\N	t	2026-01-30 15:56:30.886953+00
3d22e4f5-fb7c-4321-938d-a7b1f926ea1b	gerente_general	68313f31-be99-4260-a2ff-679590c2f98e	global	\N	\N	t	2026-01-30 15:56:30.886953+00
645ae3ec-7cc8-46f9-a342-6a89d205e14a	gerente	d4aca4fa-da1a-4087-a26c-e550d9686c09	site	\N	\N	t	2026-01-30 15:56:30.886953+00
b2fffcdf-8e83-4da9-a2a1-dd2164e1e157	gerente	c12f12c3-ac0d-49d0-abe6-01a20f7cb3ac	site	\N	\N	t	2026-01-30 15:56:30.886953+00
1114d89b-23d7-4dbb-b1c6-aa44f2161e29	gerente	22935557-ae7f-4c2e-aacb-aa0fa77c9080	site	\N	\N	t	2026-01-30 15:56:30.886953+00
8e0095eb-a911-439a-b24e-381b1050755f	gerente	ac739689-b0d0-46c4-8794-951ba8108ca2	site	\N	\N	t	2026-01-30 15:56:30.886953+00
f33efe57-defa-41c5-a014-19a6cdb8cfc6	gerente	3bfd6c64-e166-47f5-8913-054bef399ae0	site	\N	\N	t	2026-01-30 15:56:30.886953+00
1785b12d-3f16-4b3b-9476-82617a6ace0c	gerente	2cbf4624-239b-4b3a-a7c4-8163fcdb544f	site	\N	\N	t	2026-01-30 15:56:30.886953+00
d2fe9d2c-0bbd-4a70-8b99-eec1a16dad21	gerente	69be7320-2936-4a4b-a6db-f05f5d83097e	site	\N	\N	t	2026-01-30 15:56:30.886953+00
1ec5f0cd-5023-4716-8727-af2d5621a77b	gerente	cea9689b-3362-4ff4-9db1-821790df6d20	site	\N	\N	t	2026-01-30 15:56:30.886953+00
2d7d0fa8-9aa4-4964-92b7-ab3c986532f1	gerente	467e3dd4-053f-4aac-b61a-9ee5e6481b5f	site	\N	\N	t	2026-01-30 15:56:30.886953+00
9c620a53-ff41-4257-a0f1-50eb3613f2f2	gerente	16d64dc1-84e5-4365-b810-2a0e1a2ef741	site	\N	\N	t	2026-01-30 15:56:30.886953+00
45108942-026a-4338-b467-c5a12f906d26	gerente	65e35395-ad98-4ce4-9aa2-37d166660e7f	site	\N	\N	t	2026-01-30 15:56:30.886953+00
59e9510d-f42e-491a-9315-a1ac98d034a6	gerente	c4db24a3-f071-4c5c-a160-a5b87628ffb0	site	\N	\N	t	2026-01-30 15:56:30.886953+00
1a114634-c368-47bf-af15-a76720cbb329	gerente	c0a569d6-6ccd-4089-a4df-198ca1172a81	site	\N	\N	t	2026-01-30 15:56:30.886953+00
d564dd22-f267-498b-a75d-ef0c2caee95c	bodeguero	d4aca4fa-da1a-4087-a26c-e550d9686c09	site	\N	\N	t	2026-01-30 15:56:30.886953+00
58a3140b-0f5b-4335-acc6-b224663e6364	bodeguero	69be7320-2936-4a4b-a6db-f05f5d83097e	site	\N	\N	t	2026-01-30 15:56:30.886953+00
8bb1ad08-9cd6-418c-9039-41f529c717cf	bodeguero	2cbf4624-239b-4b3a-a7c4-8163fcdb544f	site	\N	\N	t	2026-01-30 15:56:30.886953+00
4670299e-27a2-46ba-b430-63f51f093882	bodeguero	ac739689-b0d0-46c4-8794-951ba8108ca2	site	\N	\N	t	2026-01-30 15:56:30.886953+00
8c66f459-3324-46cd-80e6-f7ef7ac3523a	bodeguero	3bfd6c64-e166-47f5-8913-054bef399ae0	site	\N	\N	t	2026-01-30 15:56:30.886953+00
bb6b1f17-efe1-46f3-a3e4-7a32508522a5	bodeguero	22935557-ae7f-4c2e-aacb-aa0fa77c9080	site	\N	\N	t	2026-01-30 15:56:30.886953+00
3d9d4669-76de-4947-a2dd-61182c0f3180	bodeguero	cea9689b-3362-4ff4-9db1-821790df6d20	site	\N	\N	t	2026-01-30 15:56:30.886953+00
bc2b77d4-4cfe-40ec-b1b8-fbe4e4604911	bodeguero	65e35395-ad98-4ce4-9aa2-37d166660e7f	site	\N	\N	t	2026-01-30 15:56:30.886953+00
34250782-8d96-4e8a-b91f-e00f99b58b1a	bodeguero	c4db24a3-f071-4c5c-a160-a5b87628ffb0	site	\N	\N	t	2026-01-30 15:56:30.886953+00
681844d9-6cec-4443-9b81-236781a87924	bodeguero	c12f12c3-ac0d-49d0-abe6-01a20f7cb3ac	site	\N	\N	t	2026-01-30 15:56:30.886953+00
bfac93d0-6f13-408b-9118-7e06678d988e	conductor	d4aca4fa-da1a-4087-a26c-e550d9686c09	site	\N	\N	t	2026-01-30 15:56:30.886953+00
d03a3fef-7bd3-4072-af5a-0b207a5f6532	conductor	cea9689b-3362-4ff4-9db1-821790df6d20	site	\N	\N	t	2026-01-30 15:56:30.886953+00
f9ec2808-abd4-4a7e-9e12-d9853cf81431	conductor	65e35395-ad98-4ce4-9aa2-37d166660e7f	site	\N	\N	t	2026-01-30 15:56:30.886953+00
8c0e3308-008d-4260-97c9-f3176da28ff5	conductor	c4db24a3-f071-4c5c-a160-a5b87628ffb0	site	\N	\N	t	2026-01-30 15:56:30.886953+00
671b73d7-7592-46ff-b8ef-2cc429b8d0fe	barista	d4aca4fa-da1a-4087-a26c-e550d9686c09	site_type	satellite	\N	t	2026-01-30 15:56:30.886953+00
1ff24b14-a46b-4a3c-b3ca-bb57fe1f1812	barista	cea9689b-3362-4ff4-9db1-821790df6d20	site_type	satellite	\N	t	2026-01-30 15:56:30.886953+00
8651587a-90cb-446a-8a52-bb689b9fdbef	barista	16d64dc1-84e5-4365-b810-2a0e1a2ef741	site_type	satellite	\N	t	2026-01-30 15:56:30.886953+00
3cccde95-35ea-46c8-8626-62eb879a6aac	cajero	d4aca4fa-da1a-4087-a26c-e550d9686c09	site_type	satellite	\N	t	2026-01-30 15:56:30.886953+00
916fcd7f-b31d-4faf-aa7d-ddba3e873c61	cajero	cea9689b-3362-4ff4-9db1-821790df6d20	site_type	satellite	\N	t	2026-01-30 15:56:30.886953+00
6f97bce1-1dd2-4298-90b9-b41378d1c54f	cajero	c4db24a3-f071-4c5c-a160-a5b87628ffb0	site_type	satellite	\N	t	2026-01-30 15:56:30.886953+00
1eb9d020-7e3d-4e15-b4d1-b5051f6c6cc3	cajero	16d64dc1-84e5-4365-b810-2a0e1a2ef741	site_type	satellite	\N	t	2026-01-30 15:56:30.886953+00
79a6e4ce-4a89-44e5-9d12-145e08060011	cocinero	d4aca4fa-da1a-4087-a26c-e550d9686c09	site_type	satellite	\N	t	2026-01-30 15:56:30.886953+00
6a853ad4-091c-4912-b348-43429303e32a	cocinero	cea9689b-3362-4ff4-9db1-821790df6d20	site_type	satellite	\N	t	2026-01-30 15:56:30.886953+00
3f9a4100-dae3-4d6b-8f5e-d18ceab0837b	cocinero	16d64dc1-84e5-4365-b810-2a0e1a2ef741	site_type	satellite	\N	t	2026-01-30 15:56:30.886953+00
802e556f-4642-4f89-ad4d-805fd9882229	cocinero	d4aca4fa-da1a-4087-a26c-e550d9686c09	site_type	production_center	\N	t	2026-01-30 15:56:30.886953+00
2afd27c3-fb76-49c8-bfe3-5fe6de00585d	panadero	d4aca4fa-da1a-4087-a26c-e550d9686c09	site_type	production_center	\N	t	2026-01-30 15:56:30.886953+00
a9024ccb-ed18-4371-9a41-86c905c6272a	repostero	d4aca4fa-da1a-4087-a26c-e550d9686c09	site_type	production_center	\N	t	2026-01-30 15:56:30.886953+00
48591073-8c5c-4661-940c-2061920fcbc0	pastelero	d4aca4fa-da1a-4087-a26c-e550d9686c09	site_type	production_center	\N	t	2026-01-30 15:56:30.886953+00
15b657e6-e811-468f-aacc-176432a599bd	cocinero	467e3dd4-053f-4aac-b61a-9ee5e6481b5f	site_type	production_center	\N	t	2026-01-30 15:56:30.886953+00
1bb9c082-b926-499f-be71-7ff7cfc71286	panadero	467e3dd4-053f-4aac-b61a-9ee5e6481b5f	site_type	production_center	\N	t	2026-01-30 15:56:30.886953+00
c269a125-28a3-47fe-ad52-0d032fd876fd	repostero	467e3dd4-053f-4aac-b61a-9ee5e6481b5f	site_type	production_center	\N	t	2026-01-30 15:56:30.886953+00
d2769942-7a92-4be1-8ae6-0e96bbf719ac	pastelero	467e3dd4-053f-4aac-b61a-9ee5e6481b5f	site_type	production_center	\N	t	2026-01-30 15:56:30.886953+00
\.


--
-- Data for Name: role_site_type_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."role_site_type_rules" ("role", "site_type", "is_allowed", "created_at") FROM stdin;
propietario	admin	t	2026-01-18 17:10:40.064109+00
gerente_general	admin	t	2026-01-18 17:10:40.064109+00
gerente	admin	t	2026-01-18 17:10:40.064109+00
contador	admin	t	2026-01-18 17:10:40.064109+00
marketing	admin	t	2026-01-18 17:10:40.064109+00
propietario	production_center	t	2026-01-18 17:10:40.064109+00
gerente_general	production_center	t	2026-01-18 17:10:40.064109+00
gerente	production_center	t	2026-01-18 17:10:40.064109+00
bodeguero	production_center	t	2026-01-18 17:10:40.064109+00
conductor	production_center	t	2026-01-18 17:10:40.064109+00
cocinero	production_center	t	2026-01-18 17:10:40.064109+00
panadero	production_center	t	2026-01-18 17:10:40.064109+00
repostero	production_center	t	2026-01-18 17:10:40.064109+00
pastelero	production_center	t	2026-01-18 17:10:40.064109+00
propietario	satellite	t	2026-01-18 17:10:40.064109+00
gerente_general	satellite	t	2026-01-18 17:10:40.064109+00
gerente	satellite	t	2026-01-18 17:10:40.064109+00
bodeguero	satellite	t	2026-01-18 17:10:40.064109+00
conductor	satellite	t	2026-01-18 17:10:40.064109+00
cajero	satellite	t	2026-01-18 17:10:40.064109+00
mesero	satellite	t	2026-01-18 17:10:40.064109+00
barista	satellite	t	2026-01-18 17:10:40.064109+00
cocinero	satellite	t	2026-01-18 17:10:40.064109+00
\.


--
-- Data for Name: site_production_pick_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."site_production_pick_order" ("site_id", "location_id", "priority", "is_active", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: site_supply_routes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."site_supply_routes" ("id", "requesting_site_id", "fulfillment_site_id", "is_active", "created_at", "updated_at") FROM stdin;
e0183bdc-2d6e-4f0a-9b3c-b1ca2132e61d	58362682-4ea3-4718-bd83-b4f311f885cd	407ccca3-bc35-4252-8998-7280623de78f	t	2026-02-09 15:08:22.989314+00	2026-02-09 15:08:22.989314+00
7dbac9c2-fa76-4b00-87ca-19bb49c7634c	7da218c3-fbf2-4f5d-b033-2fa9a40f767c	407ccca3-bc35-4252-8998-7280623de78f	t	2026-02-09 15:22:56.085109+00	2026-02-09 15:22:56.085109+00
\.


--
-- Data for Name: staff_invitations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."staff_invitations" ("id", "token", "email", "full_name", "staff_site_id", "staff_role", "staff_area", "status", "expires_at", "accepted_at", "created_by", "created_at") FROM stdin;
dc7c3c7a-e7aa-4ba4-9e43-202af0942bba	76a6b40d-4bee-4a18-bb98-afbd7cc64d68	carlos_ibari@hotmail.com	Alejandro Ibarra	59de8039-239a-4791-a20c-c2e7fe2344d3	conductor	\N	pending	2026-02-05 14:17:13.539+00	\N	194649ee-3f1c-42ea-a44a-2abd87053c46	2026-01-29 14:17:13.65446+00
8e5299b1-71b9-4705-aa2d-d7d20ee85bc7	2f70f352-58bc-4650-83a6-ff98d1a5dd40	dev.ventogroup@gmail.com	Dev Vento	59de8039-239a-4791-a20c-c2e7fe2344d3	conductor	\N	pending	2026-02-05 16:14:14.032+00	\N	194649ee-3f1c-42ea-a44a-2abd87053c46	2026-01-29 16:14:14.116519+00
\.


--
-- Data for Name: staging_insumos_import; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."staging_insumos_import" ("fecha", "area", "proveedor", "producto", "presentacion_raw", "purchase_unit", "purchase_unit_size", "base_unit", "unit_token", "precio_raw", "precio_cop", "issues") FROM stdin;
\N	\N	MEICO	BAILEYS 375ML	BOTELLA*375ML	BOTELLA	375	ml	ML	45.300	45300	\N
\N	\N	MEICO	BAILEYS 700ML	BOTELLA*700ML	BOTELLA	700	ml	ML	72.359	72359	\N
\N	\N	CASA LUKER	CHOCOLATE MONEDA BLANCA CASALUKER 20KG	CAJA*20KG	CAJA	20000	g	KG	711.317	711317	\N
\N	\N	NICOSPAN	DECORCREM BLANCO 4KG	POTE*4K	POTE	4000	g	KG	124.000	124000	\N
\N	\N	NICOSPAN	DECORCREM BLANCO 1KG	PTE*1KG	PTE	1000	g	KG	33.000	33000	\N
\N	\N	NICOSPAN	DECORCREM NEGRO 4KG	POTE*4K	POTE	4000	g	KG	110.000	110000	\N
\N	\N	NICOSPAN	DECORCREM NEGRO 1KG	PTE*1KG	PTE	1000	g	KG	32.500	32500	\N
\N	\N	CASA LUKER	CHOCOLATE MONEDA BLANCA CASALUKER 2.5KG	BOLSA*2,5KG	BOLSA	2500.0	g	KG	91.790	91790	\N
\N	\N	ALIMENTOS NATUVID	HARINA ALMENDRA	CAJA*11,4KG	CAJA	11400.0	g	KG	530.000	530000	\N
\N	\N	ATLANTIC FC SAS	LECHE DESLACTOSADA ALPINA	BOLSA*1,1LTR	BOLSA	1100.0	ml	L	4.100	4100	\N
\N	\N	CASA LUKER	CHOCOLATE  46% SELVA CASALUKER	BOLSA*2,5KG	BOLSA	2500.0	g	KG	140.551	140551	\N
\N	\N	COLANTA	LECHE DESLACTOSADA	BOLSA*1,1LTR	BOLSA	1100.0	ml	L	4.183	4183	\N
\N	\N	PREGEL	CACAO TOGO PREGEL	POTE*1,5KG	POTE	1500.0	g	KG	175.018	175018	\N
\N	\N	PREGEL	YOGOGEL PREGEL	POTE*1,5KG	POTE	1500.0	g	KG	191.076	191076	\N
\N	\N	PRICESMART	QUESO CREMA KRAFT	CAJA*13,6KG	CAJA	13600.0	g	KG	349.900	349900	\N
\N	\N	PRICESMART	ARANDANO CONGELADO	PAQ*1,36KG	PAQ	1360.00	g	KG	51.500	51500	\N
\N	\N	PRICESMART	TE CHAI POLVO	BOLSA*1,58KG	BOLSA	1580.00	g	KG	99.900	99900	\N
\N	\N	PRICESMART	SYRUP CHOCOLATE	POTE*1,360KG	POTE	1360.000	g	KG	38.750	38750	\N
\N	\N	ASERALIMENTOS SAS	BOQUILLA	1UND	UND	1	un	UND	\N	\N	missing_price
\N	\N	ACTIVA INDUSTRIA SAS	VASOS 14ONZ	14ONZ	UND	1	un	14ONZ	\N	\N	missing_price
\N	\N	ACTIVA INDUSTRIA SAS	VASOS 9ONZ	9ONZ	UND	1	un	9ONZ	\N	\N	missing_price
\N	\N	ACTIVA INDUSTRIA SAS	SERVILLETAS BLANCAS	600UND	UND	600	un	UND	\N	\N	missing_price
\N	\N	ACTIVA INDUSTRIA SAS	TAPAS	9ONZ/12ONZ	UND	1	un	9ONZ/12ONZ	\N	\N	missing_price
\N	\N	AGROPECUARIA ALIAR SA	COSTILLA CARNUDA	KG	KG	1000	g	KG	24.350	24350	assumed_1
\N	\N	AGROPECUARIA ALIAR SA	TOCINETA	KG	KG	1000	g	KG	46.300	46300	assumed_1
\N	\N	AGROPECUARIA ALIAR SA	BONDIOLA	KG	KG	1000	g	KG	16.849	16849	assumed_1
\N	\N	AGROPECUARIA ALIAR SA	PANCETA PIANO	KG	KG	1000	g	KG	24.540	24540	assumed_1
\N	\N	AGROPECUARIA ALIAR SA	MINI SALCHICHA CERDO	PAQ*20UND	PAQ	20	un	UND	8.780	8780	\N
\N	\N	AGROPECUARIA ALIAR SA	CARNE BONDIOLA CERDO	KG	KG	1000	g	KG	20.300	20300	assumed_1
\N	\N	AGROPECUARIA ALIAR SA	TOCINETA CON PIEL	KG	KG	1000	g	KG	28.000	28000	assumed_1
\N	\N	ALACENA DEL CHEF	MANGA DESECHABLE	PAQ*100UND	PAQ	100	un	UND	50.000	50000	\N
\N	\N	ALACENA DEL CHEF	FECULA MAIZ	KG	KG	1000	g	KG	8.330	8330	assumed_1
\N	\N	ALACENA DEL CHEF	AZUCAR GLASS	BOLSA*5KG	BOLSA	5000	g	KG	37.500	37500	\N
\N	\N	ALACENA DEL CHEF	GLUCOSA LIQUIDA	KG	KG	1000	g	KG	12.000	12000	assumed_1
\N	\N	ALACENA DEL CHEF	COLORANTE GEL	POTE*60ML	POTE	60	ml	ML	18.500	18500	\N
\N	\N	ALACENA DEL CHEF	COLORANTE BLANCO GOTERO PEQUEÑO	POTE*17ML	POTE	17	ml	ML	4.900	4900	\N
\N	\N	ALACENA DEL CHEF	COLORANTECOLOR PASTEL GOTERO PEQUEÑO	POTE*17ML	POTE	17	ml	ML	4.900	4900	\N
\N	\N	ALACENA DEL CHEF	COLORANTE LIPOSOLUBLE ROJO	POTESITO	POTESITO	1	un	UND	22.000	22000	\N
\N	\N	ALACENA DEL CHEF	COLORANTE POLVO VERDE OLIVA	SOBRE	SOBRE	1	un	UND	4.000	4000	\N
\N	\N	ALACENA DEL CHEF	POLVO HORNEAR	KG	KG	1000	g	KG	13.000	13000	assumed_1
\N	\N	ALACENA DEL CHEF	HARINA TRIGO ROOBIN	KG	KG	1000	g	KG	3.900	3900	assumed_1
\N	\N	ALACENA DEL CHEF	LECHE CONDENSADA NONAPEPA	GALON*5LTR	GALON	5000	ml	L	58.600	58600	\N
\N	\N	ALACENA DEL CHEF	BICARBONATO POLVO	KG	KG	1000	g	KG	7.000	7000	assumed_1
\N	\N	ALACENA DEL CHEF	M&M COLORES	KG	KG	1000	g	KG	77.000	77000	assumed_1
\N	\N	ALACENA DEL CHEF	GELATINA SIN SABOR	KG	KG	1000	g	KG	46.000	46000	assumed_1
\N	\N	ALACENA DEL CHEF	AZUCAR MORENA	BULTO*25K	BULTO	25000	g	KG	128.100	128100	\N
\N	\N	ALACENA DEL CHEF	AZUCAR TUBIPACK	PAQ*200 SOBRES	PAQ	200	un	UND	7.800	7800	\N
\N	\N	ALACENA DEL CHEF	BOCADILLO	BLOQUE*6,25	BLOQUE	6250	g	G	36.000	36000	\N
\N	\N	ALACENA DEL CHEF	CHANTILLY POLVO CORDILLERA	KG	KG	1000	g	KG	60.000	60000	assumed_1
\N	\N	ALACENA DEL CHEF	WHIP TOPPING RICHS	LTR	L	1000	ml	L	20.000	20000	assumed_1
\N	\N	ALACENA DEL CHEF	GAS BUTANO	LATA	LATA	1	un	UND	38.000	38000	\N
\N	\N	ALACENA DEL CHEF	BAILARINA METALICA	UND	UND	1	un	UND	160.000	160000	assumed_1
\N	\N	ALACENA DEL CHEF	ESPATULA CODO PRESS	UND	UND	1	un	UND	17.500	17500	assumed_1
\N	\N	ALACENA DEL CHEF	COLORANTE GOTERO AZUL TURQUEZA	POTE*17ML	POTE	17	ml	ML	4.900	4900	\N
\N	\N	ALACENA DEL CHEF	CORTADOR DE PIZZA	UND	UND	1	un	UND	22.000	22000	assumed_1
\N	\N	ALACENA DEL CHEF	COLADOR METALICO 12CM DIAMETRO	UND	UND	1	un	UND	13.000	13000	assumed_1
\N	\N	ALACENA DEL CHEF	POLVO DORADO	KG	KG	1000	g	KG	270.000	270000	assumed_1
\N	\N	ALACENA DEL CHEF	GRAJEAS OJITOS	KG	KG	1000	g	KG	130.000	130000	assumed_1
\N	\N	ALIMENTOS NATUVID	FLOR DE JAMAICA	KG	KG	1000	g	KG	60.000	60000	assumed_1
\N	\N	ALIMENTOS NATUVID	COMINO	KG	KG	1000	g	KG	60.000	60000	assumed_1
\N	\N	ALIMENTOS NATUVID	UVAS PASAS	KG	KG	1000	g	KG	15.000	15000	assumed_1
\N	\N	ALIMENTOS NATUVID	HARINA CENTENO	KG	KG	1000	g	KG	12.000	12000	assumed_1
\N	\N	ALIMENTOS NATUVID	TE MATCHA	KG	KG	1000	g	KG	200.000	200000	assumed_1
\N	\N	ALIMENTOS NATUVID	HARINA ESPELTA	KG	KG	1000	g	KG	20.000	20000	assumed_1
\N	\N	ALIMENTOS NATUVID	PAPRIKA POLVO	KG	KG	1000	g	KG	35.000	35000	assumed_1
\N	\N	ALIMENTOS NATUVID	ARANDANOS DESHIDRATADOS	KG	KG	1000	g	KG	50.000	50000	assumed_1
\N	\N	ALIMENTOS NATUVID	CEBOLLA POLVO	KG	KG	1000	g	KG	25.000	25000	assumed_1
\N	\N	ALIMENTOS NATUVID	MACADAMIA	KG	KG	1000	g	KG	80.000	80000	assumed_1
\N	\N	ALIMENTOS NATUVID	PISTACHOS DESCORTEZADOS	KG	KG	1000	g	KG	160.000	160000	assumed_1
\N	\N	ALIMENTOS NATUVID	AJONJOLI BLANCO	KG	KG	1000	g	KG	25.000	25000	assumed_1
\N	\N	ALIMENTOS NATUVID	AJONJOLI NEGRO	KG	KG	1000	g	KG	40.000	40000	assumed_1
\N	\N	ALIMENTOS NATUVID	AMAPOLA	KG	KG	1000	g	KG	70.000	70000	assumed_1
\N	\N	ALIMENTOS NATUVID	CHIA	KG	KG	1000	g	KG	30.000	30000	assumed_1
\N	\N	ALIMENTOS NATUVID	LINAZA	KG	KG	1000	g	KG	12.000	12000	assumed_1
\N	\N	ALIMENTOS NATUVID	QUINOA	KG	KG	1000	g	KG	15.000	15000	assumed_1
\N	\N	ALIMENTOS NATUVID	AVENA HOJUELAS	KG	KG	1000	g	KG	13.000	13000	assumed_1
\N	\N	ALIMENTOS NATUVID	SEMILLA CALABAZA	KG	KG	1000	g	KG	45.000	45000	assumed_1
\N	\N	ALIMENTOS NATUVID	ALMENDRA ENTERA	KG	KG	1000	g	KG	45.000	45000	assumed_1
\N	\N	ALIMENTOS NATUVID	ALMENDRA FILETEADA	KG	KG	1000	g	KG	55.000	55000	assumed_1
\N	\N	ALIMENTOS NATUVID	SEMILLA GIRASOL	KG	KG	1000	g	KG	25.000	25000	assumed_1
\N	\N	ALIMENTOS NATUVID	MANI TRITURADO	KG	KG	1000	g	KG	18.000	18000	assumed_1
\N	\N	ALIMENTOS NATUVID	PIMIENTA NEGRA	KG	KG	1000	g	KG	40.000	40000	assumed_1
\N	\N	ALIMENTOS NATUVID	PIMIENTA POLVO	KG	KG	1000	g	KG	40.000	40000	assumed_1
\N	\N	ALIMENTOS NATUVID	CANELA EN POLVO	KG	KG	1000	g	KG	50.000	50000	assumed_1
\N	\N	ALIMENTOS NATUVID	COCO RALLADO	KG	KG	1000	g	KG	30.000	30000	assumed_1
\N	\N	ALIMENTOS NATUVID	FRESA DESHIDRATADA	KG	KG	1000	g	KG	90.000	90000	assumed_1
\N	\N	ALIMENTOS NATUVID	FLOR JAMAICA	KG	KG	1000	g	KG	60.000	60000	assumed_1
\N	\N	ALIMENTOS NATUVID	AJO POLVO	KG	KG	1000	g	KG	25.000	25000	assumed_1
\N	\N	ALIMENTOS NATUVID	HARINA AVENA	KG	KG	1000	g	KG	8.000	8000	assumed_1
\N	\N	ALIMENTOS NATUVID	JENGIBRE POLVO	KG	KG	1000	g	KG	30.000	30000	assumed_1
\N	\N	ALIMENTOS NATUVID	AVELLANAS	KG	KG	1000	g	KG	70.000	70000	assumed_1
\N	\N	ALIMENTOS NATUVID	NUEZ PECAN	KG	KG	1000	g	KG	110.000	110000	assumed_1
\N	\N	ALIMENTOS NATUVID	NUEZ NOGAL	KG	KG	1000	g	KG	80.000	80000	assumed_1
\N	\N	ALIMENTOS NATUVID	NUEZ BRASIL	KG	KG	1000	g	KG	70.000	70000	assumed_1
\N	\N	ALIMENTOS NATUVID	DURAZNOS DESHIDRATADOS (ALBARICOQUE)	KG	KG	1000	g	KG	90.000	90000	assumed_1
\N	\N	ALIMENTOS NATUVID	NUEZ MOSCADA PEPA	KG	KG	1000	g	KG	110.001	110001	assumed_1
\N	\N	ALIMENTOS NATUVID	ANIS ESTRELLADO	KG	KG	1000	g	KG	100.000	100000	assumed_1
\N	\N	ALIMENTOS NATUVID	CIRUELAS	KG	KG	1000	g	KG	25.000	25000	assumed_1
\N	\N	ALIMENTOS NATUVID	CLAVO OLOR	GR	G	1	g	G	100.000	100000	assumed_1
\N	\N	ALIMENTOS NATUVID	ARROZ INFLADO	KG	KG	1000	g	KG	20.000	20000	assumed_1
\N	\N	ALIMENTOS NATUVID	ACEITE COCO	LTR	L	1000	ml	L	65.000	65000	assumed_1
\N	\N	APORTER GOURMET	QUESO BURRATA	UND	UND	1	un	UND	9.375	9375	assumed_1
\N	\N	APORTER GOURMET	MANTEQUILLA SIN SAL	KG	KG	1000	g	KG	35.000	35000	assumed_1
\N	\N	ATLANTIC FC SAS	QUESO CILIGINE	POTE*55 BOLITAS	POTE	55	un	UND	62.909	62909	\N
\N	\N	ASERALIMENTOS SAS	MOLDES VARIOS	1UND	UND	1	un	UND	\N	\N	missing_price
\N	\N	ATLANTIC FC SAS	QUESO STRACIATELLA	POTE*500GR	POTE	500	g	G	30.800	30800	\N
\N	\N	ATLANTIC FC SAS	AJO PICADO NEGRO BADIA	POTE*226GR	POTE	226	g	G	23.324	23324	\N
\N	\N	ATLANTIC FC SAS	MANTEQUILLA SIN SAL ALPINA	CAJA*20KG	CAJA	20000	g	KG	889.525	889525	\N
\N	\N	ATLANTIC FC SAS	CARNE ANGUS CHILENA	KG	KG	1000	g	KG	32.500	32500	assumed_1
\N	\N	ATLANTIC FC SAS	CARNE MOLIDA CERTIFIED  ANGUS BEEF #8	KG	KG	1000	g	KG	46.501	46501	assumed_1
\N	\N	ATLANTIC FC SAS	QUESO PARMESANO	BOLSA*2KG	BOLSA	2000	g	KG	132.090	132090	\N
\N	\N	ATLANTIC FC SAS	VINAGRE BALSAMICO	POTE*5LTR	POTE	5000	ml	L	71.162	71162	\N
\N	\N	ATLANTIC FC SAS	TOCINETA BACON	PAQ*900GR	PAQ	900	g	G	39.150	39150	\N
\N	\N	ATLANTIC FC SAS	TARTUFATA PASTA DE TRUFAS	POTE*500GR	POTE	500	g	G	82.217	82217	\N
\N	\N	ATLANTIC FC SAS	AREQUIPE ALPINA	BOLSA*5KG	BOLSA	5000	g	KG	76.398	76398	\N
\N	\N	ATLANTIC FC SAS	SALMON AHUMADO	PAQ*4UND	PAQ	4	un	UND	14.500	14500	\N
\N	\N	ATLANTIC FC SAS	ACEITE DE GIRASOL	POTE*3LTR	POTE	3000	ml	L	41.531	41531	\N
\N	\N	D1	BATERIAS AAA	PAQ	PAQ	1	un	UND	5.500	5500	\N
\N	\N	ATLANTIC FC SAS	QUESO CREMA KRAFT	BARRA*1,36	BARRA	1360	g	G	35.400	35400	\N
\N	\N	ATLANTIC FC SAS	YOGURT NATURAL	LTR	L	1000	ml	L	12.376	12376	assumed_1
\N	\N	ATLANTIC FC SAS	PANKOO	KG	KG	1000	g	KG	21.000	21000	assumed_1
\N	\N	ATLANTIC FC SAS	QUESO AZUL	KG	KG	1000	g	KG	73.721	73721	assumed_1
\N	\N	ATLANTIC FC SAS	YOGURT GRIEGO	LTR	L	1000	ml	L	24.811	24811	assumed_1
\N	\N	ATLANTIC FC SAS	PECHUGA DE PAVO	KG	KG	1000	g	KG	19.000	19000	assumed_1
\N	\N	ATLANTIC FC SAS	SYRACHA	POTE*500ML	POTE	500	ml	ML	15.000	15000	\N
\N	\N	ATLANTIC FC SAS	LYCHEE	LATA*230	LATA	230	g	G	14.500	14500	\N
\N	\N	ATLANTIC FC SAS	MAIZ DULCE	KG	KG	1000	g	KG	9.282	9282	assumed_1
\N	\N	ATLANTIC FC SAS	LOMO DE CERDO CAÑA	KG	KG	1000	g	KG	17.500	17500	assumed_1
\N	\N	AVSA SAS	PECHUGA DE POLLO GRANDE DE KILO REFRIGERADA	KG	KG	1000	g	KG	12.100	12100	assumed_1
\N	\N	AXTRAL	CLORO	PIMPINA DE 20LTR	PIMPINA	20000	ml	L	29.100	29100	\N
\N	\N	AXTRAL	ALCOHOL	PIMPINA DE 20LTR	PIMPINA	20000	ml	L	150.900	150900	\N
\N	\N	AXTRAL	JABON EN POLVO	BULTO*20K	BULTO	20000	g	KG	85.000	85000	\N
\N	\N	BARTEDING	PALILLO BAMBU	PAQ*100UND	PAQ	100	un	UND	19.900	19900	\N
\N	\N	BETMAN SAS	PAPA FRANCESA	KG	KG	1000	g	KG	15.406	15406	assumed_1
\N	\N	BETMAN SAS	PAPA CASCO	KG	KG	1000	g	KG	16.248	16248	assumed_1
\N	\N	BODEGA ALEX	HARINA PASTELERA	BOLTO*50KG	BOLTO	50000	g	KG	204.000	204000	\N
\N	\N	BODEGA ALEX	HARINA PANADERA	BULTO*50K	BULTO	50000	g	KG	116.000	116000	\N
\N	\N	BODEGA ALEX	MARGARINA DAGUSTO	CAJA*15KG	CAJA	15000	g	KG	155.000	155000	\N
\N	\N	BODEGA ALEX	CEREZA MARROSQUINO	FRASCO*4KG	FRASCO	4000	g	KG	88.000	88000	\N
\N	\N	BODEGA ALEX	HARINA ELITE PARA HOJALDRES	BULTO*50K	BULTO	50000	g	KG	204.000	204000	\N
\N	\N	BODEGA ALEX	HARINA IINTEGRAL ROBINSON	BULTO*25K	BULTO	25000	g	KG	98.000	98000	\N
\N	\N	BODEGA PANIFICADOR	DESTROXA POLVO	KG	KG	1000	g	KG	9.000	9000	assumed_1
\N	\N	BODEGA PANIFICADOR	MALTRODEXTRINA	KG	KG	1000	g	KG	8.500	8500	assumed_1
\N	\N	BODEGA PANIFICADOR	GLUCOSA POLVO	KG	KG	1000	g	KG	10.000	10000	assumed_1
\N	\N	BODEGA PANIFICADOR	GOMA XANTHAN	KG	KG	1000	g	KG	23.000	23000	assumed_1
\N	\N	BODEGA PANIFICADOR	ALBUMINA POLVO	KG	KG	1000	g	KG	126.000	126000	assumed_1
\N	\N	OSCAR SANTOS	CAFÉ EN GRANO	KG	KG	1000	g	KG	$ 62.000	62000	assumed_1
\N	\N	CARNES EL NOVILLON	CARNE CENTRO PIERNA RES	KG	KG	1000	g	KG	27.500	27500	assumed_1
\N	\N	CARNES EL NOVILLON	CARNE PECHO RES	KG	KG	1000	g	KG	24.500	24500	assumed_1
\N	\N	CARNES EL NOVILLON	CARNE CERDO	KG	KG	1000	g	KG	22.500	22500	assumed_1
\N	\N	CARNES EL NOVILLON	CARNE AGUJA EXTRA LIMPIA QUE NO ESTE RASGADA	KG	KG	1000	g	KG	53.000	53000	assumed_1
\N	\N	CARNES EL NOVILLON	CHOCOSUELA LIMPIA NO RASGADA	KG	KG	1000	g	KG	27.000	27000	assumed_1
\N	\N	CENABASTOS ACEITE IDEAL	ACEITE DE PALMA IDEAL	PIMPINA DE 20LTR	PIMPINA	20000	ml	L	119.000	119000	\N
\N	\N	CENTRO	GUANTES PARA HORNEAR	PAR	PAR	1	un	UND	30.000	30000	\N
\N	\N	CENTRO	GUANTES DE CARNAZA	PAR	PAR	1	un	UND	30.000	30000	\N
\N	\N	CENTRO	ESPATULAS CHIQUITICAS	UND	UND	1	un	UND	10.000	10000	assumed_1
\N	\N	CHAMPIÑONES VILLAMIL	CHAMPIÑONES	KG	KG	1000	g	KG	25.000	25000	assumed_1
\N	\N	CHARCUTERIA LA RICCOTA	JAMON DE PIERNA AHUMADO REDONDO	KG	KG	1000	g	KG	$ 35.000	35000	assumed_1
\N	\N	CHARCUTERIA LA RICCOTA	JAMON DE PAVO	KG	KG	1000	g	KG	$ 34.000	34000	assumed_1
\N	\N	CHARCUTERIA PASCUALI	CEREZA PASCUALI	FRASCO*4KG	FRASCO	4000	g	KG	$ 97.000	97000	\N
\N	\N	CHARCUTERIA VILLANUEVA	QUESO COSTEÑO	KG	KG	1000	g	KG	25.000	25000	assumed_1
\N	\N	CHARCUTERIA VILLANUEVA	MAYONESA PREMIUM	BOLSA*3,35	BOLSA	3350	g	G	59.000	59000	\N
\N	\N	COCA COLA	GASEOSA COCA COLA ZERO 269 ML	BANDEJA*12UND	BANDEJA	12	un	UND	30.000	30000	\N
\N	\N	COCA COLA	GASEOSA COCA COLA ORIGINAL 269 ML	BANDEJA*12UND	BANDEJA	12	un	UND	30.024	30024	\N
\N	\N	COLANTA	SUERO COSTEÑO	BOLSA*400GR	BOLSA	400	g	G	10.700	10700	\N
\N	\N	COLANTA	LECHE POLVO	BULTO*25KG	BULTO	25000	g	KG	600.000	600000	\N
\N	\N	COLANTA	LECHE LIQUIDA	BOLSA*1LTR	BOLSA	1000	ml	L	3.895	3895	\N
\N	\N	COLANTA	CREMA LECHE COCINA	BOLSA*870ML	BOLSA	870	ml	ML	15.000	15000	\N
\N	\N	COLANTA	CHORIZO SANTARROSANO	PAQ*20UND	PAQ	20	un	UND	37.250	37250	\N
\N	\N	COLANTA	QUESO CAMPESINO	PAQ*250GR	PAQ	250	g	G	7.050	7050	\N
\N	\N	COMORIENTE	JAGGER	BOTELLA*700ML	BOTELLA	700	ml	ML	94.400	94400	\N
\N	\N	COMORIENTE	APEROL	BOTELLA*750ML	BOTELLA	750	ml	ML	84.400	84400	\N
\N	\N	COMORIENTE	TRIPLE SEC	BOTELLA*750ML	BOTELLA	750	ml	ML	75.150	75150	\N
\N	\N	COMORIENTE	AMARETTO	BOTELLA*750ML	BOTELLA	750	ml	ML	47.651	47651	\N
\N	\N	COMORIENTE	TEQUILA JIMADOR	BOTELLA*700ML	BOTELLA	700	ml	ML	93.400	93400	\N
\N	\N	COMORIENTE	RON OSCURO CALDAS TRADICIONAL	BOTELLA*750ML	BOTELLA	750	ml	ML	47.100	47100	\N
\N	\N	COMORIENTE	RON OSCURO NAVIO	BOTELLA*750ML	BOTELLA	750	ml	ML	43.525	43525	\N
\N	\N	COMORIENTE	VINO BLANCO COCINA	CAJA*1LTR	CAJA	1000	ml	L	18.450	18450	\N
\N	\N	COMORIENTE	VINO LAMBRUSCO BLANCO	BOTELLA*750ML	BOTELLA	750	ml	ML	35.000	35000	\N
\N	\N	COMORIENTE	VINO CLOST MERLOT	BOTELLA*750ML	BOTELLA	750	ml	ML	18.300	18300	\N
\N	\N	COMORIENTE	VINO LAMBRUSCO TINTO	BOTELLA*750ML	BOTELLA	750	ml	ML	35.000	35000	\N
\N	\N	COMORIENTE	RON BLANCO	BOTELLA*750ML	BOTELLA	750	ml	ML	40.151	40151	\N
\N	\N	COMORIENTE	VINO SANSON	BOTELLA*750ML	BOTELLA	750	ml	ML	31.950	31950	\N
\N	\N	D1	TRAPERO REDONDO	UND	UND	1	un	UND	5.350	5350	assumed_1
\N	\N	D1	BATERIAS AA	PAQ	PAQ	1	un	UND	4.500	4500	\N
\N	\N	ATLANTIC FC SAS	TOMATE ENLATADO ROSSO	LATA*2,5KG	LATA	2500.0	g	KG	35.343	35343	\N
\N	\N	CASA LUKER	CHOCOLATE MONEDA LECHE CASALUKER	BOLSA*2,5KG	BOLSA	2500.0	g	KG	82.176	82176	\N
\N	\N	D1	QUESO GOUDA AHUMADO	PAQ*10LONJAS	PAQ	10	un	UND	8.490	8490	\N
\N	\N	D1	VINO TINTO	BOTELLA*750ML	BOTELLA	750	ml	ML	17.750	17750	\N
\N	\N	D1	HUEVOS COODORNIZ	CAJA*24UND	CAJA	24	un	UND	5.304	5304	\N
\N	\N	D1	CHORIZO&SALAMI VELA	PAQ*80GR	PAQ	80	g	G	8.400	8400	\N
\N	\N	D1	JUGO NARANJA	LTR	L	1000	ml	L	5.600	5600	assumed_1
\N	\N	D1	QUESO PROVOLONE	PAQ*10LONJAS	PAQ	10	un	UND	8.490	8490	\N
\N	\N	D1	VARSOL emulsionado	POTE*800ML	POTE	800	ml	ML	5.990	5990	\N
\N	\N	D1	FRIJOL ZARAGOZA	PAQ*500GR	PAQ	500	g	G	4.490	4490	\N
\N	\N	D1	LIMPIA JUNTAS	POTE*500ML	POTE	500	ml	ML	2.990	2990	\N
\N	\N	D1	PAPEL HIGIENICO 3HOJAS	PAQ*12ROLLOS	PAQ	12	un	UND	14.300	14300	\N
\N	\N	D1	ESPONJA MOÑITO ALUMINIO	UND	UND	1	un	UND	$ 1.000	1000	assumed_1
\N	\N	DISTRIHUYRO	PITILLO BAMBU 8MM*197	PAQ*200UND	PAQ	200	un	UND	25.288	25288	\N
\N	\N	DOLLAR CITY	CINTRA VERDE DE PAPEL	ROLLO	ROLLO	1	un	UND	8.000	8000	\N
\N	\N	DOLLAR CITY	ESOATULA PLANCHA COCINA	UND	UND	1	un	UND	10.000	10000	assumed_1
\N	\N	EDGAR RAMIREZ LUNA	ARANDANOS FRESCOS	BANDEJA*500GR	BANDEJA	500	g	G	22.500	22500	\N
\N	\N	EDGAR RAMIREZ LUNA	FRAMBUESAS	BANDEJA*125GR	BANDEJA	125	g	G	14.000	14000	\N
\N	\N	EMILIA	HIERBABUENA	BOLSA*500GR	BOLSA	500	g	G	25.000	25000	\N
\N	\N	EMILIA	MIX BABY	PAQ*150GR	PAQ	150	g	G	12.000	12000	\N
\N	\N	KANALOA	CREMA DE COCO	LTR	L	1000	ml	L	20.000	20000	assumed_1
\N	\N	EVOTIENDAS	TOALLA NUBE ABSORBENTE	ROLLO*150HOJAS	ROLLO	150	un	UND	4.400	4400	\N
\N	\N	EVOTIENDAS	BOLSA CHILLONA 1LB	PAQX100UNDS	PAQ	100	un	UND	$ 1.240	1240	\N
\N	\N	EVOTIENDAS	BOLSA CHILLONA 1/2LB	PAQX100UNDS	PAQ	100	un	UND	$ 1.143	1143	\N
\N	\N	EVOTIENDAS	BOLSA BASURA 200LTR	PAQX10UND	PAQ	10	un	UND	$ 4.972	4972	\N
\N	\N	EVOTIENDAS	BOLSA BASURA 150LT	PAQX10UNDS	PAQ	10	un	UND	$ 2.554	2554	\N
\N	\N	EVOTIENDAS	BOLSA CHILLONA 2LB	PAQX100UNDS	PAQ	100	un	UND	\N	\N	missing_price
\N	\N	EVOTIENDAS	BOLSA PAPEL KRAFT 2LB	PAQX100UNDS	PAQ	100	un	UND	\N	\N	missing_price
\N	\N	EVOTIENDAS	BOLSA PAPEL KRAFT 4LB	PAQX100UNDS	PAQ	100	un	UND	\N	\N	missing_price
\N	\N	EVOTIENDAS	BOLSA PRECORTE 2K	2KG	KG	2000	g	KG	\N	\N	missing_price
\N	\N	EVOTIENDAS	BOLSAS PORCIONAR1KG X100UND	PAQX100UNDS	PAQ	100	un	UND	\N	\N	missing_price
\N	\N	EVOTIENDAS	BOLW 1300X50UND	PAQ*50UND	PAQ	50	un	UND	\N	\N	missing_price
\N	\N	EVOTIENDAS	BOLW750X50UND	BOLSAX12ROLLOS	BOLSA	600	un	UND	\N	\N	missing_price
\N	\N	EVOTIENDAS	BOWL BAMBOO 750CC	PAQX50UNDS	PAQ	50	un	UND	\N	\N	missing_price
\N	\N	EVOTIENDAS	CLORO 20LT	20LT	L	20000	ml	L	\N	\N	missing_price
\N	\N	EVOTIENDAS	COTENEDOR TRANS. C/BISAGRA M	PAQX10UNDS	PAQ	10	un	UND	\N	\N	missing_price
\N	\N	EVOTIENDAS	DESINFECTANTE LAVANDA PISOS 3LT	3LT	L	3000	ml	L	\N	\N	missing_price
\N	\N	EVOTIENDAS	ESCOBA	1UND	UND	1	un	UND	\N	\N	missing_price
\N	\N	EVOTIENDAS	GORRO BLANCO TIPO ORUGA	PAQ*20UND	PAQ	20	un	UND	$ 2.762	2762	\N
\N	\N	EVOTIENDAS	GUANTE NITRILO LX100UND	CAJAX100UNDS	CAJA	100	un	UND	$ 22.000	22000	\N
\N	\N	EVOTIENDAS	GUANTE NITRILO MX100UND	CAJAX100UNDS	CAJA	100	un	UND	$ 22.000	22000	\N
\N	\N	EVOTIENDAS	JABON LIQUIDO MANOS 4LT	4LT	L	4000	ml	L	\N	\N	missing_price
\N	\N	EVOTIENDAS	MECHA TRAPERO	1UND	UND	1	un	UND	\N	\N	missing_price
\N	\N	EVOTIENDAS	MEZCLADORES NEGROS	PAQX500UNDS	PAQ	500	un	UND	\N	\N	missing_price
\N	\N	EVOTIENDAS	PAPEL ALUMINIO	300MTS	ROLLO	1	un	UND	\N	\N	missing_price
\N	\N	EVOTIENDAS	PAPEL HIGIENICO 3HOJAS	BOLSAX12ROLLOS	BOLSA	12	un	UND	\N	\N	missing_price
\N	\N	EVOTIENDAS	PITILLO FRAPPE COLORES	PAQX120UNDS	PAQ	120	un	UND	\N	\N	missing_price
\N	\N	EVOTIENDAS	SALSEROS BAMBOO	PAQX100UNDS	PAQ	100	un	UND	\N	\N	missing_price
\N	\N	EVOTIENDAS	SEPARADOR DE CARNES	PAQX1KG	PAQ	1000	g	KG	\N	\N	missing_price
\N	\N	EVOTIENDAS	SERVILLETAX600UNDS CAJAX9PAQ	CAJAX9PAQ	CAJA	5400	un	UND	\N	\N	missing_price
\N	\N	EVOTIENDAS	SET DE CUBIERTOS	PAQX100UNDS	PAQ	100	un	UND	\N	\N	missing_price
\N	\N	EVOTIENDAS	TAPA BOWL1300	BOWL1300	UND	1	un	UND	\N	\N	missing_price
\N	\N	EVOTIENDAS	TAPA BOWLL750	BOWLL750	UND	1	un	UND	\N	\N	missing_price
\N	\N	EVOTIENDAS	TAPA SALSEO BAMBOO	BOLSAX12ROLLOS	BOLSA	1	un	UND	\N	\N	missing_price
\N	\N	EVOTIENDAS	TAPABOCAS	CAJX50UNDS	CAJ	50	un	UND	\N	\N	missing_price
\N	\N	EVOTIENDAS	TOALLA MANO Z NATURAL X150UND CAJAX24PAQ	CAJAX24PAQ	CAJA	3600	un	UND	$ 131.433	131433	\N
\N	\N	EVOTIENDAS	VINIPEL COCINA AMARILLO	300MTS	ROLLO	1	un	UND	\N	\N	missing_price
\N	\N	EVOTIENDAS	VINIPEL DE 15CM	ROLLO	ROLLO	1	un	UND	$ 6.750	6750	\N
\N	\N	EVOTIENDAS	VINIPEL DE 30CM	ROLLO	ROLLO	1	un	UND	$ 8.000	8000	\N
\N	\N	ALMACENES ÉXITO	TOMATE CHERRY  UVALINA	KG	KG	1000	g	KG	10.000	10000	assumed_1
\N	\N	ALMACENES ÉXITO	PASTA RIGATONI BARILA	CAJA*500GR	CAJA	500	g	G	10.000	10000	\N
\N	\N	FENICE	VASO LATA GRANDE	UND	UND	1	un	UND	1.840	1840	assumed_1
\N	\N	FRESKALECHE	CREMA LECHE PASTELERIA	BOLSA*10LTR	BOLSA	10000	ml	L	145.000	145000	\N
\N	\N	CENABASTOS	AJI DULCE	LTR	L	1000	ml	L	10.000	10000	assumed_1
\N	\N	CENABASTOS	HIGOS	KG	KG	1000	g	KG	9.000	9000	assumed_1
\N	\N	CENABASTOS	PAPA AMARILLA	KG	KG	1000	g	KG	6.000	6000	assumed_1
\N	\N	CENABASTOS	BERENJENAS MORADAS	KG	KG	1000	g	KG	10.000	10000	assumed_1
\N	\N	CENABASTOS	AGUACATE	KG	KG	1000	g	KG	13.000	13000	assumed_1
\N	\N	CENABASTOS	MORA FRUTA0	KG	KG	1000	g	KG	8.000	8000	assumed_1
\N	\N	CENABASTOS	BANANO	KG	KG	1000	g	KG	4.500	4500	assumed_1
\N	\N	CENABASTOS	FRESA EXTRA	KG	KG	1000	g	KG	18.000	18000	assumed_1
\N	\N	CENABASTOS	DURAZNO	KG	KG	1000	g	KG	13.000	13000	assumed_1
\N	\N	CENABASTOS	KIWI	KG	KG	1000	g	KG	24.000	24000	assumed_1
\N	\N	CENABASTOS	LIMON	KG	KG	1000	g	KG	6.000	6000	assumed_1
\N	\N	CENABASTOS	MANGO	KG	KG	1000	g	KG	9.000	9000	assumed_1
\N	\N	CENABASTOS	MANZANA VERDE	KG	KG	1000	g	KG	10.000	10000	assumed_1
\N	\N	CENABASTOS	MARACUYA FRUTA	KG	KG	1000	g	KG	3.500	3500	assumed_1
\N	\N	CENABASTOS	MARACUYA PULPA	KG	KG	1000	g	KG	16.000	16000	assumed_1
\N	\N	CENABASTOS	PATILLA	KG	KG	1000	g	KG	3.500	3500	assumed_1
\N	\N	CENABASTOS	PERA	KG	KG	1000	g	KG	2.500	2500	assumed_1
\N	\N	CENABASTOS	PIÑA	KG	KG	1000	g	KG	5.000	5000	assumed_1
\N	\N	CENABASTOS	UCHUVA	KG	KG	1000	g	KG	10.000	10000	assumed_1
\N	\N	CENABASTOS	CHAMPIÑONES	KG	KG	1000	g	KG	30.000	30000	assumed_1
\N	\N	CENABASTOS	RUGULA	KG	KG	1000	g	KG	60.000	60000	assumed_1
\N	\N	CENABASTOS	ZUKINI AMARILLO	KG	KG	1000	g	KG	6.000	6000	assumed_1
\N	\N	CENABASTOS	ZUKINI VERDE	KG	KG	1000	g	KG	6.000	6000	assumed_1
\N	\N	CENABASTOS	ALBAHACA	KG	KG	1000	g	KG	20.000	20000	assumed_1
\N	\N	CENABASTOS	AHUYAMA	KG	KG	1000	g	KG	3.500	3500	assumed_1
\N	\N	CENABASTOS	AJO PELADO	KG	KG	1000	g	KG	20.000	20000	assumed_1
\N	\N	CENABASTOS	AJO PORRO	KG	KG	1000	g	KG	7.500	7500	assumed_1
\N	\N	CENABASTOS	CEBOLLA PUERRO	KG	KG	1000	g	KG	6.000	6000	assumed_1
\N	\N	CENABASTOS	CEBOLLIN	KG	KG	1000	g	KG	4.000	4000	assumed_1
\N	\N	CENABASTOS	PUERRO	KG	KG	1000	g	KG	6.000	6000	assumed_1
\N	\N	CENABASTOS	CEBOLLA CABEZONA	KG	KG	1000	g	KG	4.000	4000	assumed_1
\N	\N	CENABASTOS	CEBOLLA MORADA	KG	KG	1000	g	KG	6.000	6000	assumed_1
\N	\N	CENABASTOS	CILANTRO	KG	KG	1000	g	KG	10.000	10000	assumed_1
\N	\N	CENABASTOS	LECHUGA CRESPA VERDE	UND*200GR	UND	200	g	G	3.500	3500	\N
\N	\N	CENABASTOS	LECHUGA CRESPA MORADA	UND*200GR	UND	200	g	G	4.000	4000	\N
\N	\N	CENABASTOS	PULPA DE TAMARINDO	KG	KG	1000	g	KG	12.000	12000	assumed_1
\N	\N	CENABASTOS	TOMATE CHONTO	KG	KG	1000	g	KG	3.500	3500	assumed_1
\N	\N	CENABASTOS	PIMENTON	KG	KG	1000	g	KG	7.000	7000	assumed_1
\N	\N	CENABASTOS	PIMENTON AMARILLO	KG	KG	1000	g	KG	12.390	12390	assumed_1
\N	\N	CENABASTOS	PLATANO MADURO	KG	KG	1000	g	KG	5.000	5000	assumed_1
\N	\N	CENABASTOS	PAPA	KG	KG	1000	g	KG	3.000	3000	assumed_1
\N	\N	CENABASTOS	ROMERO	KG	KG	1000	g	KG	50.000	50000	assumed_1
\N	\N	CENABASTOS	ZANAHORIA	KG	KG	1000	g	KG	4.500	4500	assumed_1
\N	\N	CENABASTOS	NARANJA	KG	KG	1000	g	KG	3.800	3800	assumed_1
\N	\N	CENABASTOS	ARANDANOS FRESCOS	BANDEJITA*125GR	BANDEJITA	125	g	G	7.000	7000	\N
\N	\N	CENABASTOS	FRAMNBUESAS	BANDEJITA*125GR	BANDEJITA	125	g	G	14.000	14000	\N
\N	\N	CENABASTOS	PEREJIL	KG	KG	1000	g	KG	12.000	12000	assumed_1
\N	\N	CENABASTOS	PEPINO	KG	KG	1000	g	KG	2.500	2500	assumed_1
\N	\N	CENABASTOS	PIMENTOS AMARILLO	KG	KG	1000	g	KG	12.000	12000	assumed_1
\N	\N	CENABASTOS	REPOLLO BLANCO	KG	KG	1000	g	KG	3.000	3000	assumed_1
\N	\N	CENABASTOS	REPOLLO MORADO	KG	KG	1000	g	KG	3.600	3600	assumed_1
\N	\N	CENABASTOS	MELON	KG	KG	1000	g	KG	4.000	4000	assumed_1
\N	\N	CENABASTOS	APIO	KG	KG	1000	g	KG	4.000	4000	assumed_1
\N	\N	CENABASTOS	APIOESPAÑA	KG	KG	1000	g	KG	2.000	2000	assumed_1
\N	\N	CENABASTOS	REMOLACHA	KG	KG	1000	g	KG	4.000	4000	assumed_1
\N	\N	CENABASTOS	ESPINACA	KG	KG	1000	g	KG	30.000	30000	assumed_1
\N	\N	CENABASTOS	MIX LECHUGAS BABY	KG	KG	1000	g	KG	12.000	12000	assumed_1
\N	\N	CENABASTOS	CIMARRON	KG	KG	1000	g	KG	10.000	10000	assumed_1
\N	\N	CENABASTOS	CEBOLLA OCAÑERA	KG	KG	1000	g	KG	5.000	5000	assumed_1
\N	\N	FRUTOSOL	FLORES COMESTIBLES	BANDEJA*60GR	BANDEJA	60	g	G	18.000	18000	\N
\N	\N	FRUTOSOL	BROTES	BANDEJA*80GR	BANDEJA	80	g	G	13.000	13000	\N
\N	\N	GALAXIA DEL PLASTICO	GORRO MALLITA NEGRO	PAQ*100UND	PAQ	100	un	UND	29.000	29000	\N
\N	\N	GALAXIA DEL PLASTICO	PITILLO NEGROS GRUESOS	PAQ*250GR	PAQ	250	g	G	22.500	22500	\N
\N	\N	GALAXIA DEL PLASTICO	PITILLO BAMBU 8MM*196	PAQ*200UND	PAQ	200	un	UND	22.500	22500	\N
\N	\N	GALAXIA DEL PLASTICO	GUANTES PARA ASEO NEGRO CALIBRE 25	PAR	PAR	1	un	UND	7.500	7500	\N
\N	\N	GALAXIA DEL PLASTICO	EMBUDO PEQUEÑO	UND	UND	1	un	UND	3.000	3000	assumed_1
\N	\N	GALAXIA DEL PLASTICO	EMBUDO MEDIANO	UND	UND	1	un	UND	4.000	4000	assumed_1
\N	\N	GALAXIA DEL PLASTICO	EMBUDO GRANDE	UND	UND	1	un	UND	6.000	6000	assumed_1
\N	\N	GALAXIA DEL PLASTICO	CHUPA PARA INODORO	UND	UND	1	un	UND	9.000	9000	assumed_1
\N	\N	GALAXIA DEL PLASTICO	BOWL DARNEL BAMBOO NATURALS 1300cc	PAQ*50UND	PAQ	50	un	UND	$ 78.500	78500	\N
\N	\N	GALAXIA DEL PLASTICO	BOWL RECTANGULAR 828ML	PAQ*50UND	PAQ	50	un	UND	$ 30.500	30500	\N
\N	\N	GALAXIA DEL PLASTICO	MINI PACK VISAGRA TALLA S	UND	UND	1	un	UND	$ 777	777	assumed_1
\N	\N	GALAXIA DEL PLASTICO	BOLSA 13X18 POLIPROPILENO	PAQ*100UND	PAQ	100	un	UND	$ 22.900	22900	\N
\N	\N	GALAXIA DEL PLASTICO	BOLSA 12X17X2 POLIETILENO	PAQ*100UD	PAQ	100	un	UND	$ 46.500	46500	\N
\N	\N	GALAXIA DEL PLASTICO	BOLSA 15X19 POLIPROPILENO	PAQ*100UD	PAQ	100	un	UND	$ 22.431	22431	\N
\N	\N	GALAXIA DEL PLASTICO	CUCHARA MADERA	PAQ*100	PAQ	100	un	UND	9.700	9700	\N
\N	\N	GRANJA VILLA MARIANA	HUEVO EXTRAS	CARTON*30UND	CARTON	30	un	UND	14.500	14500	\N
\N	\N	GRANJA VILLA MARIANA	HUEVO AA	CARTON*30UND	CARTON	30	un	UND	13.000	13000	\N
\N	\N	HIELOS CUCUTA	HIELO	BOLSA*10KG	BOLSA	10000	g	KG	13.000	13000	\N
\N	\N	JAIME VELANDIA	ESENCIA DE ALMENDRA	POTE*500ML	POTE	500	ml	ML	22.000	22000	\N
\N	\N	JAIME VELANDIA	LEVADURA FRESCA	BARRA*500GR	BARRA	500	g	G	6.112	6112	\N
\N	\N	JAIME VELANDIA	ESCENCIA VAINILLA	POTE*500ML	POTE	500	ml	ML	16.252	16252	\N
\N	\N	KANALOA	SYRUP FRUTOS ROJOS	POTE*LTR	POTE	1000	ml	L	35.000	35000	assumed_1
\N	\N	KANALOA	SYRUP VAINILLA FRANCESA	POTE*LTR	POTE	1000	ml	L	35.700	35700	assumed_1
\N	\N	KANALOA	SYRUP ROSAS	POTE*LTR	POTE	1000	ml	L	35.000	35000	assumed_1
\N	\N	KANALOA	SYRUP COCO	POTE*LTR	POTE	1000	ml	L	29.750	29750	assumed_1
\N	\N	KANALOA	SYRUP FRUTOS AMARILLOS	POTE*LTR	POTE	1000	ml	L	35.000	35000	assumed_1
\N	\N	LA RECETTA	COCOA POLVO CORONA	BOLSA*KG	BOLSA	1000	g	KG	50.419	50419	assumed_1
\N	\N	\N	CHOCOLATE INSTANTANEO CORONA	BOLSA*500GR	BOLSA	500	g	G	14.180	14180	missing_supplier
\N	\N	LA RECETTA	CHOCOLATE  53% CORDILLERA	BOLSA*1KG	BOLSA	1000	g	KG	68.343	68343	\N
\N	\N	LA RECETTA	CHOCOLATE CHIPS BLANCO CORDILLERA	BOLSA*1KG	BOLSA	1000	g	KG	40.000	40000	\N
\N	\N	LA RECETTA	CHOCOLATE MONEDA BLANCO CORDILLERA	BOLSA*1KG	BOLSA	1000	g	KG	40.800	40800	\N
\N	\N	LA RECETTA	CHOCOLATE MONEDA LECHE CORDILLERA	BOLSA*1KG	BOLSA	1000	g	KG	35.600	35600	\N
\N	\N	LA RECETTA	COCOA POLVO COORDILLERA	BOLSA*1KG	BOLSA	1000	g	KG	59.151	59151	\N
\N	\N	LA RECETTA	MANTECA CACAO	PAQ*5KG	PAQ	5000	g	KG	643.604	643604	\N
\N	\N	LA RECETTA	CHOCOLATE CHIPS LECHE CORDILLERA	BOLSA*1KG	BOLSA	1000	g	KG	35.400	35400	\N
\N	\N	LAVAMAX	LAVANDA	PIMPINA DE 20LTR	PIMPINA	20000	ml	L	45.800	45800	\N
\N	\N	LAVAMAX	VARSOL ECOLOGICO	GALON*4LTR	GALON	4000	ml	L	40.000	40000	\N
\N	\N	LAVAMAX	LIMPIAJUNTAS	GALON*4LTR	GALON	4000	ml	L	25.000	25000	\N
\N	\N	LAVAMAX	CLORO*20LTR	PIMPINA*20LTR	PIMPINA	20000	ml	L	38.000	38000	\N
\N	\N	LAVAMAX	DESENGRASANTE PREMIUM	PIMPINA*20LTR	PIMPINA	20000	ml	L	130.000	130000	\N
\N	\N	LOS MONTES	NUGGET DE MILO	BOLSITA*40GR	BOLSITA	40	g	G	3.800	3800	\N
\N	\N	MAKRO	TOMILLO	PAQ*180GR	PAQ	180	g	G	13.800	13800	\N
\N	\N	MAKRO	GASEOSA COCA COLA ZERO 269 ML	BANDEJA*12UND	BANDEJA	12	un	UND	34.800	34800	\N
\N	\N	MAKRO	CUBITO MAGGIE	POTE*48UND	POTE	48	un	UND	20.500	20500	\N
\N	\N	MAKRO	BREVAS	KG	KG	1000	g	KG	5.000	5000	assumed_1
\N	\N	MAKRO	ARROZ	KG	KG	1000	g	KG	4.050	4050	assumed_1
\N	\N	MAKRO	ARANDANO FRESCO	BANDEJA*250GR	BANDEJA	250	g	G	6.000	6000	\N
\N	\N	MAKRO	OREO TRITUADO	PAQ*4KG	PAQ	4000	g	KG	79.050	79050	\N
\N	\N	MAKRO	MILO	BOLSA*2KG	BOLSA	2000	g	KG	76.900	76900	\N
\N	\N	MAKRO	SALSA DE HUMO ARO	POTE*1LTR	POTE	1000	ml	L	15.800	15800	\N
\N	\N	MAKRO	VINAGRE BALSAMICO	LTR	L	1000	ml	L	27.600	27600	assumed_1
\N	\N	MAKRO	CHOCOLISTO	BOLSA*2KG	BOLSA	2000	g	KG	55.050	55050	\N
\N	\N	MAKRO	VINAGRE FRUTAS	LTR	L	1000	ml	L	6.590	6590	assumed_1
\N	\N	MAKRO	VINAGRE BLANCO	POTE*4LTR	POTE	4000	ml	L	13.650	13650	\N
\N	\N	MAKRO	ALCAPARRAS	POTE*1KG - ESCURRIDO 500GR	POTE	500	g	G	20.300	20300	\N
\N	\N	MAKRO	ALCAPARRAS BABY	POTE*250GR-ESCURRIDO 150GR	POTE	150	g	G	9.950	9950	\N
\N	\N	MAKRO	ALCAPARRAS MINI	POTE*250GR	POTE	250	g	G	20.300	20300	\N
\N	\N	MAKRO	PANCETA CHICHARRON	KG	KG	1000	g	KG	29.000	29000	assumed_1
\N	\N	MAKRO	ACEITE OLIVA	LTR	L	1000	ml	L	53.000	53000	assumed_1
\N	\N	MAKRO	ACEITE MEZCLA SOYA-OLIVA	LTR	L	1000	ml	L	25.000	25000	assumed_1
\N	\N	MAKRO	BOLSA PORTACUBIERTO	PAQ*100UND	PAQ	100	un	UND	$ 9.700	9700	\N
\N	\N	MAKRO	ACEITE GIRASOL	GALON*5LTR	GALON	5000	ml	L	89.900	89900	\N
\N	\N	MAKRO	VODKA ABSOLUT	BOTELLA*700ML	BOTELLA	700	ml	ML	89.650	89650	\N
\N	\N	MAKRO	TABASCO	POTE*60ML	POTE	60	ml	ML	17.250	17250	\N
\N	\N	MAKRO	CHICHARRON CARNUDO NATURAL DON CHICHARRON	BOLSA*100GR	BOLSA	100	g	G	18.150	18150	\N
\N	\N	MAKRO	CAFÉ SELLO ROJO	PAQ*500GR	PAQ	500	g	G	27.900	27900	\N
\N	\N	MAKRO	SAL MARINA	BOLSA*800GR	BOLSA	800	g	G	4.490	4490	\N
\N	\N	MAKRO	KINDER BUENO	PAQ*24	PAQ	24	un	UND	20.500	20500	\N
\N	\N	MAKRO	HARINA PAN	KG	KG	1000	g	KG	3.400	3400	assumed_1
\N	\N	MAKRO	HOJUELA DE MAIZ NATURAL	BOLSA*1KG	BOLSA	1000	g	KG	17.750	17750	\N
\N	\N	MAKRO	GARBANZO	KG	KG	1000	g	KG	8.400	8400	assumed_1
\N	\N	MAKRO	AZUCAR BLANCA	BULTO*50KG	BULTO	50000	g	KG	160.000	160000	\N
\N	\N	MAKRO	TAJIN	POTE*400GR	POTE	400	g	G	31.050	31050	\N
\N	\N	MAKRO	SALSA BBQ	POTE*1LTR	POTE	1000	ml	L	15.900	15900	\N
\N	\N	MAKRO	ACEITUNAS RELLENAS	POTE*KG ESCURRIDO 500GR	POTE	500	g	G	24.000	24000	\N
\N	\N	MAKRO	JUGO NECTAR DE MANZANA ALPINA	CAJA*1LTR	CAJA	1000	ml	L	7.900	7900	\N
\N	\N	MAKRO	QUESO CHEDDAR	BLOQUE*100LONJAS	BLOQUE	100	un	UND	74.900	74900	\N
\N	\N	MAKRO	SAL	BOLSA*3LTR	BOLSA	3000	ml	L	7.000	7000	\N
\N	\N	MAKRO	GUANTE NITRILO	100UND	UND	100	un	UND	\N	\N	missing_price
\N	\N	MAKRO	ALCOHOL	4LT	L	4000	ml	L	\N	\N	missing_price
\N	\N	MARRANITOS	CHORIZO ARTESANAL	PAQ*5UND	PAQ	5	un	UND	13.000	13000	\N
\N	\N	MEICO	GINEBRA	BOTELLA*700ML	BOTELLA	700	ml	ML	66.617	66617	\N
\N	\N	MEICO	TEQUILA	BOTELLA*700ML	BOTELLA	700	ml	ML	94.900	94900	\N
\N	\N	MEICO	VINO BLANCO UVITA DE CAJA	CAJA*1LTR	CAJA	1000	ml	L	14.500	14500	\N
\N	\N	GALAXIA DEL PLASTICO	PALILLOS BAMBU 12 CM MIO	PAQ*100UND	PAQ	100	un	UND	4.500	4500	\N
\N	\N	MERCADOLIBRE	VINAGRE DE JEREZ	LTR	L	1000	ml	L	29.000	29000	assumed_1
\N	\N	MERCADOLIBRE	SYRUP CARAMELO	POTE*623ML	POTE	623	ml	ML	26.800	26800	\N
\N	\N	ALIMENTOS NATUVID	OREGANO DESHIDRATADO	PAQ*50GR	PAQ	50	g	G	3.900	3900	\N
\N	\N	ALIMENTOS NATUVID	HARINA ALMENDRAS	CAJA*11,38	CAJA	11380	g	G	534.860	534860	\N
\N	\N	ALIMENTOS NATUVID	OREGANO POLVO	PAQ*100GR	PAQ	100	g	G	35.000	35000	\N
\N	\N	ALIMENTOS NATUVID	AJI ESCAMAS	PAQ*340GR	PAQ	340	g	G	45.000	45000	\N
\N	\N	PAPELERIA GRADYMAR	PAPELERIA GLADYMAR	UND	UND	1	un	UND	122.151	122151	assumed_1
\N	\N	POSTOBON	AGUA TONICA	BANDEJA*24UND	BANDEJA	24	un	UND	43.200	43200	\N
\N	\N	POSTOBON	CERVEZA HEINIKEN LATA	BANDEJA*24UND	BANDEJA	24	un	UND	63.400	63400	\N
\N	\N	POSTOBON	AGUA 300 ML	BANDEJA*24UND	BANDEJA	24	un	UND	35.917	35917	\N
\N	\N	POSTOBON	SODA BRETAÑA 300 ML	BANDEJA*24UND	BANDEJA	24	un	UND	50.904	50904	\N
\N	\N	POSTOBON	SODA HATSU FRAMBUESAS 310ML	BANDEJA*24UND	BANDEJA	24	un	UND	60.000	60000	\N
\N	\N	POSTOBON	TE HATSU NEGRO 400ML	BANDEJA*6UND	BANDEJA	6	un	UND	17.634	17634	\N
\N	\N	POSTOBON	TE HATSU ROJO 400ML	BANDEJA*6UND	BANDEJA	6	un	UND	17.634	17634	\N
\N	\N	POSTOBON	TE HATSU BLANCO 400ML	BANDEJA*6UND	BANDEJA	6	un	UND	17.634	17634	\N
\N	\N	MAKRO	LAVALOZA CREMA	POTE* 3,8KG	POTE	3800.0	g	KG	$ 19.500	19500	\N
\N	\N	MAKRO	MOSTAZA	BOLSA*2,15KG	BOLSA	2150.00	g	KG	49.400	49400	\N
\N	\N	MAKRO	SYRUP MIEL	POTE*2,8LTR	POTE	2800.0	ml	L	26.800	26800	\N
\N	\N	POSTOBON	TE HATSU ROSADO 400ML	BANDEJA*6UND	BANDEJA	6	un	UND	17.634	17634	\N
\N	\N	POSTOBON	TE HATSU AMARILLO 400ML	BANDEJA*6UND	BANDEJA	6	un	UND	17.634	17634	\N
\N	\N	POSTOBON	GASEOSA MANAZANA 310 ML	BANDEJA*24UND	BANDEJA	24	un	UND	51.192	51192	\N
\N	\N	POSTOBON	GASEOSA COLOMBIANA 310ML	BANDEJA*24UND	BANDEJA	24	un	UND	51.192	51192	\N
\N	\N	POSTOBON	GINGER 300ML	BANDEJA*24UND	BANDEJA	24	un	UND	43.700	43700	\N
\N	\N	POSTOBON	SODA HATSU ALBAHACA 310 ML	BANDEJA*24UND	BANDEJA	24	un	UND	60.000	60000	\N
\N	\N	PESQUERA DEL MAR	ROBALO	PORCION *300-340GR	PORCION	320	g	G	20.700	20700	\N
\N	\N	PREGEL	PANNA ALPINA PREGEL	POTE*2KG	POTE	2000	g	KG	206.046	206046	\N
\N	\N	PREGEL	BASSE CAPRI PREGEL	POTE*2KG	POTE	2000	g	KG	168.434	168434	\N
\N	\N	PREGEL	LANCILLOTTO PREGEL	POTE*5KG	POTE	5000	g	KG	401.924	401924	\N
\N	\N	PREGEL	PASTORAMA LIMON PREGEL	KG	KG	1000	g	KG	126.835	126835	assumed_1
\N	\N	PREGEL	PASTORAMA VAINILLA PREGEL	KG	KG	1000	g	KG	111.281	111281	assumed_1
\N	\N	PREGEL	AMARENA CHERRY PREGEL	POTE*3KG	POTE	3000	g	KG	228.461	228461	\N
\N	\N	PREGEL	FRUTOS DEL BOSQUE PREGEL	POTE*3KG	POTE	3000	g	KG	295.176	295176	\N
\N	\N	PREGEL	KROCCO MILK PREGEL	POTE*3KG	POTE	3000	g	KG	209.748	209748	\N
\N	\N	PREGEL	GRAN STRACIATELLA REAL PREGEL	POTE*5KG	POTE	5000	g	KG	49.579	49579	\N
\N	\N	PREGEL	PASTA MALAGA PREGEL	POTE*6KG	POTE	6000	g	KG	525.733	525733	\N
\N	\N	PREGEL	ARABESHI FIKISSIMO PREGEL	POTE*3KG	POTE	3000	g	KG	261.989	261989	\N
\N	\N	PREGEL	MELOCOTON PREGEL	POTE*3KG	POTE	3000	g	KG	309.854	309854	\N
\N	\N	PRICESMART	JAMON DE PAVO	PAQ*680GR	PAQ	680	g	G	44.900	44900	\N
\N	\N	PRICESMART	JAMON SERRANO	PAQ*400GR	PAQ	400	g	G	58.500	58500	\N
\N	\N	PRICESMART	QUESO FETA	POTE*680GR	POTE	680	g	G	46.500	46500	\N
\N	\N	PRICESMART	BREAKSTONES QUESOCOTAGGE	POTE*680GR	POTE	680	g	G	22.500	22500	\N
\N	\N	PRICESMART	ZURICH SALCHICHA AHUMADA  MINI	PAQ*600GR	PAQ	600	g	G	28.500	28500	\N
\N	\N	PRICESMART	ACEITE DE OLIVA EXTRA SUAVE	POTE*2LTR	POTE	2000	ml	L	58.900	58900	\N
\N	\N	PRICESMART	FRESA CONGELADA	POTE*2KG	POTE	2000	g	KG	34.500	34500	\N
\N	\N	PRICESMART	MORA CONGELADA	POTE*2KG	POTE	2000	g	KG	31.900	31900	\N
\N	\N	PRICESMART	SYRUP MAPPLE	POTE*1,89	POTE	1890	ml	ML	35.900	35900	\N
\N	\N	PRICESMART	TOMATES SECOS	FRASCO*740GR-430 ESCURRIDO	FRASCO	430	g	G	35.900	35900	\N
\N	\N	PRICESMART	ACEITE SPRAY	LATA*400ML	LATA	400	ml	ML	49.900	49900	\N
\N	\N	PRICESMART	ALMENDRA FILETEADA	BOLSA*907GR	BOLSA	907	g	G	50.900	50900	\N
\N	\N	PRICESMART	ALMENDRA ENTERA	BOLSA*907GR	BOLSA	907	g	G	45.900	45900	\N
\N	\N	PRICESMART	NUEZ PECANA	BOLSA*907GR	BOLSA	907	g	G	69.900	69900	\N
\N	\N	PRICESMART	PISTACHO SIN CASCARA	BOLSA*907GR	BOLSA	907	g	G	101.900	101900	\N
\N	\N	PRICESMART	CERVEZA STELLA	BANDEJA*24UND	BANDEJA	24	un	UND	83.904	83904	\N
\N	\N	PRICESMART	CERVEZA CORONA	BANDEJA*24UND	BANDEJA	24	un	UND	68.904	68904	\N
\N	\N	PRICESMART	LECHE ALMENDRAS	CAJA*946ML	CAJA	946	ml	ML	12.250	12250	\N
\N	\N	REINALDO ALBA ROMAN	EMPAQUES	N/A	UND	1	un	UND	\N	\N	missing_price
\N	\N	SENSAFRUID	INFUSIONES	UND	UND	1	un	UND	2.087	2087	assumed_1
\N	\N	SHALOM	BOLSA DE PAPEL ASA  A1	UND	UND	1	un	UND	\N	\N	assumed_1,missing_price
\N	\N	SHALOM	BOLSA DE PAPEL ASA  A2	UND	UND	1	un	UND	\N	\N	assumed_1,missing_price
\N	\N	SHALOM	BOLSA DE PAPEL ASA  A3	UND	UND	1	un	UND	\N	\N	assumed_1,missing_price
\N	\N	SUPER C	CHOCOLATINA HERSHEYS	BARRITA	BARRITA	12	un	UND	6.400	6400	\N
\N	\N	SUPER C	MASMELOW	PAQ	PAQ	1	un	UND	7.700	7700	\N
\N	\N	SUPER C	NUTELLA	POTE*750GR	POTE	750	g	G	38.942	38942	\N
\N	\N	SUMINISTROS AMCA	PAPEL TERMICO	UND	UND	1	un	UND	493	493	assumed_1
\N	\N	SURTIDORA	GUANTE NITRILO TALLA L	CAJX100UNDS	CAJ	100	un	UND	$ 20.101	20101	\N
\N	\N	SURTIDORA	GUANTE NITRILO TALLA M	CAJX100UNDS	CAJ	100	un	UND	$ 20.100	20100	\N
\N	\N	SURTIDORA	ESPONJA BRILLANTE TASK *3	PAQ*3	PAQ	3	un	UND	$ 6.700	6700	\N
\N	\N	SURTIDORA	ESCOBA DALIA	1UND	UND	1	un	UND	$ 6.300	6300	\N
\N	\N	SURTIDORA	PALO MADRA ESCOBA	UND	UND	1	un	UND	$ 3.800	3800	assumed_1
\N	\N	SURTIDORA	TRAPERO MECHA	1UND	UND	1	un	UND	\N	\N	missing_price
\N	\N	SURTIDORA	PALILLO DE PINCHO 25CM	PAQ*100UND	PAQ	100	un	UND	3.700	3700	\N
\N	\N	SURTIDORA	BOLSA DE ASEO *150LTR	PAQ*10UND	PAQ	10	un	UND	6.600	6600	\N
\N	\N	SURTIDORA	BOLSA DE ASEO *250LTR	PAQ*10UND	PAQ	10	un	UND	23.500	23500	\N
\N	\N	SURTIDORA	MECHA TRAPERO REF 800 TASK	UND	UND	1	un	UND	$ 10.750	10750	assumed_1
\N	\N	SURTIDORA	PALO PARA MECHA TRAPERO	UND	UND	1	un	UND	$ 2.500	2500	assumed_1
\N	\N	SURTIDORA	ESPONJA LAVA LOZA BRILLANTE TASK	PAQ*3UND	PAQ	3	un	UND	$ 6.700	6700	\N
\N	\N	SURTIDORA	SERVILLETAS ACOLCHAMAX*100 UND FAMILIA	CAJA*27PAQ	CAJA	2700	un	UND	$ 73.440	73440	\N
\N	\N	SURTIDORA	GORRO ORUGA BLANCOI	PAQ*50UND	PAQ	50	un	UND	$ 8.100	8100	\N
\N	\N	SURTIDORA	PALETICAS MADERA MEZCLADOR	PAQ*500UND	PAQ	500	un	UND	$ 4.500	4500	\N
\N	\N	SURTIDORA	PAÑITOS DE MICRO FIBRA TASK PRO	PAQ*5	PAQ	5	un	UND	$ 22.500	22500	\N
\N	\N	TECNAS	LK-MAX	GALON *4LTR	GALON	4000	ml	L	68.244	68244	\N
\N	\N	TRINOS SAS	QUESO MOZARELLA	BLOQUE*100LONJAS	BLOQUE	100	un	UND	59.400	59400	\N
\N	\N	TRINOS SAS	QUESO PAISA	KG	KG	1000	g	KG	24.000	24000	assumed_1
\N	\N	UMAN	VASO HELADO 12oz	UND	UND	1	un	UND	1.100	1100	assumed_1
\N	\N	UMAN	VASO FRAPPE 16oz	UND	UND	1	un	UND	1.200	1200	assumed_1
\N	\N	UNIVERSO CREACIONES	PAPEL ENCERADO	PAQ*1000UND	PAQ	1000	un	UND	160.000	160000	\N
\N	\N	UNIVERSO MERCANTIL	BOLSA AL VACIO 10X18CM 70MICRAS	PAQ*200UND	PAQ	200	un	UND	17.600	17600	\N
\N	\N	UNIVERSO MERCANTIL	BOLSA AL VACIO 20X25 70MICRAS	PAQ*200UND	PAQ	200	un	UND	38.900	38900	\N
\N	\N	UNIVERSO MERCANTIL	BOLSA AL VACIO 20X30CM 70MICRAS	PAQ*200UND	PAQ	200	un	UND	46.800	46800	\N
\N	\N	LA COPA	GINEBRA	BOTELLA*750ML	BOTELLA	750	ml	ML	54.000	54000	\N
\N	\N	LA COPA	TEQUILA	BOTELLA*1000ML	BOTELLA	1000	ml	ML	66.000	66000	\N
\N	\N	LA COPA	RON NAVIO BLANCO	BOTELLA*750ML	BOTELLA	750	ml	ML	43.525	43525	\N
\N	\N	LA COPA	VINO VIENTOS DEL SUR	BOTELLA*187ML	BOTELLA	187	ml	ML	12.286	12286	\N
\N	\N	LA COPA	CREMA DE WHISKY PINAR DEL RIO	BOTELLA*750ML	BOTELLA	750	ml	ML	37.733	37733	\N
\N	\N	\N	CAJUN	KG	KG	1000	g	KG	80.000	80000	assumed_1,missing_supplier
\N	\N	ORQUIDEA	AZUCAR GRANULADA/INVERTIDA	POTE*250	POTE	250	g	G	19.800	19800	\N
\N	\N	ORQUIDEA	CAPUCHON *500GR	PAQ*50UND	PAQ	50	un	UND	94.900	94900	\N
\N	\N	ORQUIDEA	CAPUCHON *250GR	UND	UND	1	un	UND	1.200	1200	assumed_1
\.


--
-- Data for Name: support_tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."support_tickets" ("id", "created_by", "site_id", "category", "title", "description", "status", "assigned_to", "resolved_at", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: support_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."support_messages" ("id", "ticket_id", "author_id", "body", "created_at") FROM stdin;
\.


--
-- Data for Name: user_favorites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."user_favorites" ("id", "user_id", "reward_id", "created_at") FROM stdin;
\.


--
-- Data for Name: user_feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."user_feedback" ("id", "user_id", "site_id", "rating", "feedback_text", "category", "status", "reviewed_by", "reviewed_at", "resolution_notes", "metadata", "created_at", "updated_at") FROM stdin;
\.


--
-- Data for Name: wallet_passes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."wallet_passes" ("serial_number", "user_id", "pass_type_identifier", "auth_token", "data_hash", "updated_at") FROM stdin;
3456e710-6211-42bf-9632-3aefa8eefa32	3456e710-6211-42bf-9632-3aefa8eefa32	pass.co.ventogroup.pass	676668f68d7123b422a9939bc16705fa8b2a0794809abe64f4175a3879609ab5	7caecc62394fb801562e82443f0d54748993f8005210fc6ccbb2346505d15c61	2026-02-10 07:15:06.003+00
0857f8d1-0fc8-4c63-a8d2-d74333e90a9d	0857f8d1-0fc8-4c63-a8d2-d74333e90a9d	pass.co.ventogroup.pass	594444469d095e3f522136a474117a748c635184ab4689172904f047280c7442	7186cf6a8676102854d93701c60e19ffba69c1ce45f64281ec5c836d114452fc	2026-02-24 12:45:21.072+00
194649ee-3f1c-42ea-a44a-2abd87053c46	194649ee-3f1c-42ea-a44a-2abd87053c46	pass.co.ventogroup.pass	c2327d36456857ee84f558bbcd1a932a9b86981ed8532f8f4d40cc098e3cc44a	89e1c21a76d8fd742916eb39cdc884ea589e8517a7deb8768333639a04bb2778	2026-02-26 16:30:13.101+00
0beb74a5-4159-4f27-a698-6bf2024d3e8e	0beb74a5-4159-4f27-a698-6bf2024d3e8e	pass.co.ventogroup.pass	e584fba63584ac83dde32918f1335024ac60726bbb6426f6d6538b1e89e2060c	d4f6cdd108367bc9a212559b899b430e6fe93bdd287d9e04b688513926106a51	2026-02-26 16:44:10.897+00
\.


--
-- Data for Name: wallet_devices; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "public"."wallet_devices" ("id", "device_library_identifier", "pass_type_identifier", "serial_number", "push_token", "created_at", "updated_at") FROM stdin;
\.


--
-- Name: inventory_sku_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."inventory_sku_seq"', 79, true);


--
-- Name: lpn_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."lpn_sequence"', 1, true);


--
-- PostgreSQL database dump complete
--

-- \unrestrict WEG1w2gMb1g7OuvGpMZGzIRMzeF0XCvumf3juOYa9yICIAX0ZtixsuTt4SM39n2

RESET ALL;
