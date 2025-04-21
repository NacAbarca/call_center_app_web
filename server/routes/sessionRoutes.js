// server/routes/sessionRoutes.js
const express = require('express');
const router = express.Router();
const { startSession, endSession } = require('../models/session');

router.post('/start', async (req, res) => {
  try {
    const { userId, interpreterId } = req.body;
    if (!userId || !interpreterId) {
      return res.status(400).json({ error: 'userId and interpreterId required' });
    }
    const result = await startSession(userId, interpreterId);
    res.status(201).json(result);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: err.message });
  }
});

router.post('/end', async (req, res) => {
  try {
    const { sessionId } = req.body;
    if (!sessionId) {
      return res.status(400).json({ error: 'sessionId required' });
    }
    const result = await endSession(sessionId);
    res.json(result);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: err.message });
  }
});

module.exports = router;
