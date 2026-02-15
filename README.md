# Cloud-Native Platform Engineering Capstone

Welcome to the Cloud-Native Node.js + PostgreSQL Capstone Project! This repository contains a complete, production-ready application stack designed to demonstrate modern platform engineering practices, including Containerization, Kubernetes Orchestration, CI/CD, and Infrastructure as Code (IaC).

## 🚀 Project Overview

The goal of this project is to simulate a real-world scenario where a legacy application is modernized and deployed to a cloud-agnostic platform.

**Key Features:**
*   **Application**: Node.js (Express) REST API.
*   **Database**: PostgreSQL (Relational Data).
*   **Containerization**: Docker (Multi-stage builds, non-root users).
*   **Orchestration**: Kubernetes (Manifests & Helm Charts).
*   **CI/CD**: GitHub Actions / Azure DevOps.
*   **Infrastructure**: Terraform (AWS & Azure).
*   **Observability**: Prometheus & Grafana stack.

## 📂 Repository Structure

```
.
├── src/                # Application Source Code
│   ├── config/         # DB Configuration
│   └── app.js          # App Entry Point
├── k8s/                # Kubernetes Manifests (YAML)
├── helm/               # Helm Charts
├── terraform/          # Infrastructure as Code
│   ├── aws/            # AWS Modules
│   └── azure/          # Azure Modules
├── .github/workflows/  # CI/CD Pipelines
├── Dockerfile          # Container Definition
├── docker-compose.yml  # Local Development Setup
└── README.md           # This Documentation
```

## 🛠️ Getting Started (Local Development)

### Prerequisites
*   [Docker](https://docs.docker.com/get-docker/) & [Docker Compose](https://docs.docker.com/compose/install/)
*   [Node.js](https://nodejs.org/) (Optional, for local non-docker dev)

### Quick Start
1.  **Clone the repository**:
    ```bash
    git clone <repository-url>
    cd capstone-app
    ```

2.  **Run with Docker Compose**:
    ```bash
    docker-compose up --build
    ```

3.  **Verify the Application**:
    *   Health Check: `http://localhost:3000/health`
    *   DB Connection: `http://localhost:3000/db-check`

## ☸️ Kubernetes Deployment

### Prerequisites
*   [kubectl](https://kubernetes.io/docs/tasks/tools/)
*   [Helm](https://helm.sh/docs/intro/install/)
*   A running Kubernetes cluster (Minikube, Kind, EKS, or AKS)

### Deploying with Manifests
1.  **Apply Namespace**:
    ```bash
    kubectl apply -f k8s/namespace.yaml
    ```
2.  **Apply Configs & Secrets**:
    ```bash
    kubectl apply -f k8s/configmap.yaml
    kubectl apply -f k8s/secret.yaml
    ```
3.  **Deploy Database (StatefulSet)**:
    ```bash
    kubectl apply -f k8s/statefulset.yaml
    kubectl apply -f k8s/service-db.yaml
    ```
4.  **Deploy Application**:
    ```bash
    kubectl apply -f k8s/deployment.yaml
    kubectl apply -f k8s/service-app.yaml
    ```

## 📊 Observability (Prometheus & Grafana)

To enable monitoring, we use the `kube-prometheus-stack` Helm chart.

1.  **Add Prometheus Community Repo**:
    ```bash
    helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
    helm repo update
    ```

2.  **Install the Stack**:
    ```bash
    helm install monitoring prometheus-community/kube-prometheus-stack -n monitoring --create-namespace -f monitoring/values.yaml
    ```

3.  **Access Grafana**:
    *   Port-forward Grafana service:
        ```bash
        kubectl port-forward svc/monitoring-grafana 8080:80 -n monitoring
        ```
    *   Open `http://localhost:8080`.
    *   Default login: `admin` / `prom-operator`.

## ☁️ Infrastructure Provisioning (Terraform)

Navigate to the `terraform/` directory and choose your cloud provider (AWS or Azure).
Refer to `terraform/README.md` for specific instructions.

*Note: For AWS, ensure you are authenticated via AWS CLI. For Azure, use `az login`.*

## 🤝 Contribution
1.  Fork the repository.
2.  Create a feature branch.
3.  Submit a Pull Request.

---
*Created by Antigravity for the Cloud-Native Capstone Project.*
