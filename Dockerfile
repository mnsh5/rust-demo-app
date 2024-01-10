FROM rust:1.75.0-alpine3.18 AS builder
RUN apk add --no-cache musl-dev gcc
WORKDIR /app

# Primero, copia solo los archivos de dependencias y compila
COPY Cargo.toml Cargo.lock ./
# RUN mkdir src && touch src/main.rs
RUN cargo build --release

# Luego, copia el resto del código y realiza la construcción final
COPY . .
RUN cargo build --release

# Etapa final: crear una imagen más pequeña
FROM alpine:3.18
RUN apk add --no-cache libgcc

WORKDIR /app

# Copia solo el ejecutable compilado
COPY --from=builder /app/target/release/chat-rust-rocket .

# Expone el puerto que utiliza tu aplicación (si es necesario)
EXPOSE 8000

# Comando para ejecutar tu aplicación cuando el contenedor se inicia
CMD ["./chat-rust-rocket"]
