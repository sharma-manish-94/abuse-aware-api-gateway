# Abuse-Aware API Gateway

An abuse-aware API gateway that combines multi-algorithm rate limiting with an event-driven risk scoring pipeline to protect upstream services from sophisticated attack patterns.

## Quick Start

### Prerequisites
- Go 1.22+
- Docker & Docker Compose (for Redis + Kafka)
- Make (Linux/Mac) or PowerShell (Windows)

### Local Development

**Linux/Mac:**
```bash
make build
make test
make lint
```

**Windows:**
```powershell
.\tasks1.ps1 all
```

### Running the Gateway
```bash
# Start the fake upstream
go run ./cmd/upstream

# In another terminal, start the gateway
go run ./cmd/gateway

# Test it
curl http://localhost:8080/health
```

## Architecture


## Design Decisions

See [DESIGN.md](./DESIGN.md) for detailed architecture and tradeoff analysis.

