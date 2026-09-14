# FitFlow Redesign

A cross-platform fitness application redesign delivering personalized workout plans, nutrition tracking, and social sharing across iOS, Android, and Web.

## Tech Stack

| Layer | Technology |
|---|---|
| Frontend (iOS/Android/Web) | Flutter (Dart), with native Swift/Kotlin modules for HealthKit/Health Connect |
| Core Backend | Node.js / NestJS (TypeScript) |
| AI/ML Microservice | Python / FastAPI |
| Primary Database | PostgreSQL |
| Secondary Database | MongoDB |
| Cache / Real-time | Redis |
| Authentication | Auth0 |
| Object Storage | S3-compatible storage |

See `docs/technology-comparison.md` and `docs/decision-matrix.md` for the full evaluation and justification behind these choices.

## Project Structure

```
fitflow-redesign/
├── frontend/       # Flutter app (iOS, Android, Web)
├── backend/        # NestJS microservices (user, workout, nutrition, social, notification)
├── ai-service/     # FastAPI AI/ML microservice
├── docs/           # Documentation
│   ├── technology-comparison.md
│   ├── decision-matrix.md
│   ├── architecture-decision-record.md
│   └── architecture-diagram.png
└── README.md
```

## Documentation

- **Technology Comparison** — `docs/technology-comparison.md`
- **Weighted Decision Matrix** — `docs/decision-matrix.md`
- **Architecture Decision Record (ADR-001)** — `docs/architecture-decision-record.md`
- **Architecture Diagram** — `docs/architecture-diagram.png`

## Getting Started

1. Clone the repository
2. Install dependencies for each subfolder as it's developed (`frontend/`, `backend/`, `ai-service/`)
3. Copy `.env.example` to `.env` in each service and configure environment variables
4. Follow individual subfolder READMEs (to be added) for local setup instructions

## Status

Planning phase — technology stack selected, architecture documented. Implementation to follow.