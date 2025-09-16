# ---------- Stage 1: build Vite ----------
FROM node:22 AS build
WORKDIR /app

# Installe les deps (cache optimisé)
COPY frontend/package*.json ./
RUN npm ci

# Copie le code et build
COPY frontend/ ./
# Permet de passer l'URL API au build si tu veux: --build-arg VITE_API_BASE_URL=...
ARG VITE_API_BASE_URL
ENV VITE_API_BASE_URL=${VITE_API_BASE_URL}
RUN npm run build

# ---------- Stage 2: run sur Nginx ----------
FROM nginx:1.27-alpine
# Conf Nginx pour SPA (fallback sur index.html)
COPY infra/docker/nginx.conf /etc/nginx/conf.d/default.conf
# Fichiers statiques
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80