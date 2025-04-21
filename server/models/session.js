// server/models/session.js
const db = require('../db'); // Asegúrate que db.js exporte tu pool de MySQL
const COINS_PER_MINUTE = parseInt(process.env.COINS_PER_MINUTE, 10) || 1;

async function startSession(userId, interpreterId) {
  const [result] = await db.execute(
    'INSERT INTO Sessions (user_id, interpreter_id) VALUES (?, ?)',
    [userId, interpreterId]
  );
  return { sessionId: result.insertId };
}

async function endSession(sessionId) {
  const [[session]] = await db.execute(
    'SELECT start_ts, user_id FROM Sessions WHERE id = ?',
    [sessionId]
  );
  if (!session) throw new Error('Session not found');

  const endTs = new Date();
  const minutes = Math.ceil((endTs - new Date(session.start_ts)) / 60000);
  const coins = minutes * COINS_PER_MINUTE;

  await db.execute(
    'UPDATE Sessions SET end_ts = ?, coins_spent = ? WHERE id = ?',
    [endTs, coins, sessionId]
  );
  await db.execute(
    'UPDATE Users SET monedas = monedas - ? WHERE id = ?',
    [coins, session.user_id]
  );

  return { minutes, coins };
}

module.exports = { startSession, endSession };
