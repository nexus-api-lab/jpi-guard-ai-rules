import express from 'express';
import { JpiGuard } from 'jpi-guard';

const app = express();
const guard = new JpiGuard({ apiKey: process.env.JPI_GUARD_API_KEY! });

app.use(express.json());

app.post('/chat', async (req, res) => {
  const { message } = req.body;
  const scan = await guard.scan(message);
  if (scan.is_injection) {
    return res.status(400).json({ error: 'Injection detected', risk_level: scan.risk_level });
  }
  // safe to pass to LLM
  res.json({ safe: true, message });
});

app.listen(3000, () => console.log('Server running on :3000'));
