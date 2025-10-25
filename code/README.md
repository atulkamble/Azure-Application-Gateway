# Sample services for testing

Two tiny Node.js services used for path-based routing tests:
- `service-a` — serves JSON and `/healthz` on port 8081 by default
- `service-b` — serves JSON and `/healthz` on port 8082 by default

## Run locally (macOS / zsh)
```bash
# Terminal 1
cd code/service-a
npm install
npm start

# Terminal 2
cd code/service-b
npm install
npm start
```

Test:
```bash
curl http://localhost:8081/
curl http://localhost:8081/healthz
curl http://localhost:8082/
curl http://localhost:8082/healthz
```

You can point Application Gateway backends to these services if reachable from the gateway (e.g., on a VM or container in the VNet). For local-only testing, use port-forwarding or deploy the services to Azure resources inside the VNet.