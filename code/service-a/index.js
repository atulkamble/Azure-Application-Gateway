import http from 'http';

const PORT = process.env.PORT || 8081;

const server = http.createServer((req, res) => {
  if (req.url === '/healthz') {
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    res.end('ok');
    return;
  }
  res.writeHead(200, { 'Content-Type': 'application/json' });
  res.end(JSON.stringify({ service: 'service-a', path: req.url }));
});

server.listen(PORT, () => {
  console.log(`service-a listening on ${PORT}`);
});
