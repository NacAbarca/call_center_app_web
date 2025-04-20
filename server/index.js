// server/index.js
require('dotenv').config();
const express = require('express');
const http = require('http');
const { Server } = require('socket.io');
const cors = require('cors');
const mysql = require('mysql2/promise');

const app = express();
app.use(cors());
app.use(express.json());

// Conexión MySQL
const db = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
});

// Ruta de prueba
app.get('/api/health', (req, res) => res.json({ status: 'OK' }));

// WebSocket (Socket.IO)
const server = http.createServer(app);
const io = new Server(server, { cors: { origin: '*' } });
io.on('connection', socket => {
  console.log('Nuevo cliente conectado:', socket.id);
  socket.on('disconnect', () => console.log('Cliente desconectado:', socket.id));
});

const PORT = process.env.PORT || 4000;
server.listen(PORT, () => console.log(`API escuchando en puerto ${PORT}`));
