# DevOps Practice Example

This real-time chat application, developed with Rust and Rocket, is used as an example for DevOps practice, showcasing Kubernetes (K8s) deployment. The app provides instant messaging between users, thematic channels, and user authentication.

## Key Features

- **Real-Time Chat:** Instant messaging between users.
- **Channel Organization:** Creation and management of thematic channels.
- **User Authentication:** Authentication system to secure the application.

## Technologies Used

- **Backend:** Rust with Rocket as the web framework.
- **Database:** PostgreSQL for storing user data, messages, and channels.
- **DevOps Tools:**
  - CI/CD: GitHub Actions, Azure DevOps, or Jenkins.
  - Orchestration: Kubernetes (K8s) for container orchestration.

## Installation and Setup

1. **Requirements:**

   - Rust and Cargo installed.
   - PostgreSQL installed and configured.
   - Kubernetes (K8s) cluster or Minikube installed for deployment.

2. **Clone the Repository:**
   ```bash
   git clone https://github.com/mnsh4/rust-demo-app.git
   ```

# Docker sample

## Build image

```shell
docker build -t app_sample .
```

## Run built image

```shell
docker run -d -p 8000:8000 app_sample
# and the server should start instantly
curl http://localhost:8000
```

## Running unit tests

```shell
docker build -t app_sample:test .
docker run --rm app_sample:test
```
