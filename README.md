# service-template

Template repo for fast CI + Docker deploy to VPS via GitHub Actions.

## What this template gives you
- push to `main` => `make ci` => deploy to VPS
- deploy uploads current repository to VPS (no `git pull` on server)
- runs `docker compose up -d --build --remove-orphans`

## Required repository secrets
- `VPS_HOST`
- `VPS_USER`
- `VPS_PORT`
- `VPS_SSH_KEY` (private key for GitHub Actions -> VPS)
- `VPS_BASE_DIR` (example: `/opt/services`)
- `APP_ENV_B64` (optional, base64 of your `.env`)

## One-time VPS setup
1. Install Docker + Docker Compose plugin.
2. Ensure deploy user is in docker group.
3. Create base directory:
   - `sudo mkdir -p /opt/services`
   - `sudo chown -R <VPS_USER>:<VPS_USER> /opt/services`

## Create `APP_ENV_B64`
Linux/macOS:
```bash
base64 -w 0 .env
```
WSL:
```bash
base64 -w 0 .env
```
PowerShell:
```powershell
[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes((Get-Content .env -Raw)))
```

Paste output into GitHub secret `APP_ENV_B64`.

## How to use template
1. Mark this repository as Template in GitHub settings.
2. Click `Use this template` and create a new repository.
3. Add required secrets in new repository.
4. Push to `main`.
