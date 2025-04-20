// server/index.js
require('dotenv').config();
const path = require('path');
const express = require('express');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

// 1) Sirve archivos estáticos del build de Flutter Web
app.use(express.static(path.join(__dirname, 'public')));

// 2) Ruta de salud de la API
app.get('/api/health', (req, res) => {
  res.json({ status: 'OK' });
});

// 3) Catch‑all para SPA (sirve index.html en cualquier ruta no API)
app.use((req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// 4) Arranca el servidor en el puerto configurado
const PORT = process.env.PORT || 4000;
app.listen(PORT, () => {
  console.log(`Servidor Express escuchando en puerto ${PORT}`);
});
