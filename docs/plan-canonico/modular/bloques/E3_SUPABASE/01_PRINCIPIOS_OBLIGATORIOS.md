### Principios obligatorios

SUPABASE
→ plataforma de datos y ejecución

VENTO-SHELL
→ fuente versionada de migraciones, configuración, contratos y pruebas

ESQUEMA
→ frontera lógica, de nombres, exposición y seguridad

DOMINIO
→ responsabilidad empresarial estable

APLICACIÓN
→ experiencia que consume uno o varios dominios

AUTHENTICATION
→ identifica la sesión técnica

IDENTIDAD EMPRESARIAL
→ identifica trabajador, cliente, dispositivo o actor de sistema

AUTHORIZATION
→ decide qué capacidad puede ejecutar el actor en un contexto y recurso

Reglas:

- no crear un esquema por aplicación automáticamente;
- no utilizar rutas o pantallas como estructura de datos;
- no mover objetos antes de identificar todos sus consumidores;
- no considerar `public` como destino universal;
- no mezclar esquemas administrados por Supabase con dominios de Vento;
- no convertir `auth.users` en catálogo laboral o de clientes;
- no utilizar tipos TypeScript como sustituto de RLS o autorización;
- no implementar el modelo objetivo mediante una migración masiva única;
- no retirar legacy antes de completar adopción, verificación y rollback.
