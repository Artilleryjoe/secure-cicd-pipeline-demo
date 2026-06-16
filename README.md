# secure-cicd-pipeline-demo

This repository demonstrates a security-focused CI/CD pipeline using GitHub Actions. The goal was to build a working pipeline that tests, secures, builds, and deploys a small application while following security best practices.

## The Application

A minimal Python application (`app.py`) used to demonstrate the pipeline. The focus of this project is the CI/CD pipeline itself, not application complexity.

## Pipeline Overview

The workflow (`.github/workflows/secure-ci-cd.yml`) contains three jobs that run on every push and pull request to `main`:

### 1. Lint & Test
- Runs **Ruff** for linting and formatting checks
- Runs **pytest** for unit tests
- Uses `PYTHONPATH=.` to ensure imports work correctly

### 2. CodeQL SAST Analysis
- Performs static application security testing using GitHub's official CodeQL engine
- Scans for security vulnerabilities and insecure coding patterns in Python
- Results are visible in the repository **Security → Code scanning** tab

### 3. Build, Scan & Deploy
- Builds a Docker image using multi-stage build and a non-root user
- Pushes the image to **GitHub Container Registry (GHCR)**
- Scans the container image with **Trivy** for vulnerabilities and secrets
- Uploads Trivy results (SARIF) to the Security tab
- Only runs on direct pushes to `main` (not on pull requests)

## Security Choices

- **CodeQL** for industry-standard static analysis
- **Trivy** for container vulnerability and secret scanning
- Multi-stage Docker build + non-root user to reduce attack surface
- Least-privilege permissions in the workflow
- SARIF upload so all security findings appear in one place (GitHub Security tab)
- Dependabot and branch protection recommendations (see below)

## How to Run Locally

```bash
# Run the app directly
python app.py

# Build and run with Docker
docker build -t secure-cicd-demo .
docker run --rm secure-cicd-demo
```

Additional cybersecurity projects are available in my main portfolio: https://github.com/Artilleryjoe/Cybersecurity-Portfolio
