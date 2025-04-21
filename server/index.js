// server/index.js
require('dotenv').config();
const path = require('path');
const express = require('express');
const http = require('http');
const { Server } = require('socket.io');
const cors = require('cors');
const mysql = require('mysql2/promise');

const app = express();
app.use(cors());
app.use(express.json());

// Conectar MySQL
const db = mysql.createPool({
  host:   process.env.DB_HOST,
  user:   process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
});

// 1) Servir archivos estáticos (build Flutter Web)
app.use(express.static(path.join(__dirname, 'public')));

// 2) Rutas API
// Health
app.get('/api/health', (req, res) => res.json({ status: 'OK' }));

// Sessions (debes invocarlas con POST, no GET)
const sessionRoutes = require('./routes/sessionRoutes');
app.use('/api/sessions', sessionRoutes);

// 3) Catch‑all para SPA (devolver index.html en cualquier otra ruta)
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// 4) Socket.IO + arranque del servidor
const server = http.createServer(app);
const io = new Server(server, { cors: { origin: '*' } });
io.on('connection', socket => {
  console.log('Cliente conectado:', socket.id);
  socket.on('disconnect', () => console.log('Cliente desconectado:', socket.id));
});

const PORT = process.env.PORT || 4000;
server.listen(PORT, () => console.log(`API escuchando en puerto ${PORT}`));
