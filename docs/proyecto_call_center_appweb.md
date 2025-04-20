# 📘 Proyecto de Software: Call Center AppWeb Accesible

**Autor:** Nac Abarca  
**Rol:** Arquitecto / Desarrollador Full‑Stack  
**Repositorio:** https://github.com/NacAbarca/call_center_appweb  
**Fecha:** Abril 2025  
**Versión:** v0.1.0 (release estable)

---

## 1. 🧠 Resumen Ejecutivo

Desarrollar un **Centro de Videollamadas Accesible** para la comunidad sorda en Chile, conectando en tiempo real a usuarios sordos con intérpretes de LSCh y operadoras oyentes vía SIP/VoIP, monetizando el servicio por “monedas/minuto” de videollamada y chat.

---

## 2. 🎯 Objetivos

- Brindar accesibilidad 24/7 mediante intérpretes de LSCh.  
- Empoderar la comunicación autónoma de personas sordas.  
- Asegurar sostenibilidad financiera mediante modelo de monedas.  
- Permitir escalabilidad modular y multilingüe.

---

## 3. 📌 Alcance

- Registro e inicio de sesión de usuarios e intérpretes (Email/OTP).  
- Compra de paquetes de monedas (Stripe / MercadoPago).  
- Videollamada embebida (Jitsi self‑hosted).  
- Chat en paralelo.  
- Gestión de consumo de monedas por minuto.  
- Dashboard de balance e historial.  
- Panel de intérpretes con asignación y métricas.  
- Reportes de uso y SLA.

---

## 4. 📐 Arquitectura Técnica

- **Frontend Web/Móvil:** Flutter & React Native + Jitsi Embed.  
- **Media Server:** Jitsi Meet Dockerizado.  
- **API / Backend:** Node.js, Express, Socket.IO.  
- **Base de datos:** MySQL (o Firestore para prototipo).  
- **Autenticación:** Firebase Auth / Auth0.  
- **Pagos:** Stripe / MercadoPago.  
- **Infraestructura:** VPS (2 vCPU, 4GB RAM), Docker Compose.  

---

## 5. 🛠️ Desarrollo de Software

- **Metodología:** Agile (Scrum Ligero).  
- **Control de versiones:** Git + GitHub (branch strategy).  
- **Buenas prácticas:** Clean code, TDD inicial, código documentado.

---

## 6. 🧪 QA y Pruebas

- Pruebas unitarias y de integración (Jest, Mocha).  
- Pruebas de usabilidad con usuarios sordos.  
- Validación de accesibilidad WCAG 2.1 AA.  
- Monitoreo de errores (Sentry) y logs.

---

## 7. 🚀 DevOps / Despliegue

- **Entornos:** local, staging, producción.  
- **CI/CD:** GitHub Actions → despliegue en VPS.  
- **Contenedores:** Docker, Docker Compose.  
- **TLS:** Nginx + Let's Encrypt.  
- **Monitoreo:** Prometheus + Grafana / UptimeRobot.

---

## 8. 🔐 Seguridad

- JWT para API, HTTPS forzado.  
- CORS restrictivo y rate limiting.  
- Protección de datos (Ley 19.628).  
- Auditoría de sesiones e intentos de login.

---

## 9. 📦 Fases del Proyecto

| Fase                       | Duración     | Entregables                           |
|----------------------------|--------------|---------------------------------------|
| 1. Diseño y requisitos     | 2 semanas    | Documento de alcance, wireframes      |
| 2. PoC e infraestructura   | 3 semanas    | VPS + Jitsi + API base                |
| 3. MVP                     | 8 semanas    | Registro, pagos, videollamada, chat   |
| 4. QA y accesibilidad      | 4 semanas    | Pruebas y ajustes UI/UX               |
| 5. Beta piloto             | 2 semanas    | Implementación piloto                 |
| 6. Iteración y lanzamiento | 4 semanas    | Versiones finales y despliegue        |

---

## 10. 📈 KPIs del Sistema

- Tiempo de respuesta < 2s.  
- Tiempo de carga de videollamada < 1s.  
- SLA de llamadas ≥ 95%.  
- Tasa de conversión de compra ≥ 30%.

---

## 11. 📑 Documentación Técnica

- `README.md`, `CHANGELOG.md`, `RELEASE_NOTES.md`.  
- Diagramas: ER, secuencia, despliegue.  
- Manual de usuario y de despliegue.

---

## 12. 👥 Roles Involucrados

- **Proyecto:** Nac Abarca – Arquitecto / Desarrollador Full‑Stack.  
- **Frontend:** 1–2 Desarrolladores Flutter / React.  
- **Backend:** 2 Desarrolladores Node.js.  
- **DevOps:** 1 Ingeniero.  
- **QA:** 1 Tester.  
- **Intérpretes LSCh:** 4–6 profesionales.

---

## ⚖️ Licencia

MIT — Código abierto, modificar y compartir con atribución.
