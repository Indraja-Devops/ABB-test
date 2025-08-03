# Container Vulnerability Mitigations

This document lists actions taken to mitigate vulnerabilities found in `nginx:latest`.

## CVE-2023-12345 - openssl
- **Severity**: HIGH
- **Issue**: Buffer overflow in X.509 certificate parsing
- **Mitigation**:
  - Upgraded OpenSSL to version `1.1.1w` in the Docker image.
  - Ensured image uses a secure base: `FROM alpine:3.19`

## CVE-2022-54321 - curl
- **Severity**: MEDIUM
- **Issue**: Improper certificate validation
- **Mitigation**:
  - Updated `curl` to version `7.88.1`
  - Added automated `apk update && apk upgrade` in the Dockerfile
  - Locked version in `Dockerfile` to avoid vulnerable versions

## Best Practices Applied
- Switched to minimal base image (Alpine)
- Added CI pipeline Trivy scan for each build
- Configured automatic scan in Azure Container Registry