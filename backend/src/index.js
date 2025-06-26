const express = require('express');
const bodyParser = require('body-parser');
const app = express();
app.use(bodyParser.json());

// Placeholder login route for universities
app.post('/admin/login', (req, res) => {
  const { email, password } = req.body;
  if (email === 'admin@example.com' && password === 'password') {
    res.json({ token: 'admin-token' });
  } else {
    res.status(401).json({ error: 'Invalid credentials' });
  }
});

// Placeholder certificate upload
app.post('/certificates', (req, res) => {
  // TODO: Integrate NDI API, IPFS, and blockchain
  res.json({ status: 'uploaded' });
});

// Placeholder verification endpoint
app.post('/verify', (req, res) => {
  // TODO: Implement verification logic
  res.json({ status: 'verified' });
});

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});
