#################
## build stage ##
#################
FROM rust:1-slim-bullseye AS builder
WORKDIR /code

# Download crates-io index and fetch dependency code.
# This step avoids needing to spend time on every build downloading the index
# which can take a long time within the docker context. Docker will cache it.
COPY Cargo.toml Cargo.toml

# copy app files
COPY src src

# compile app
RUN cargo build --release

###############
## run stage ##
###############
FROM almalinux:minimal
WORKDIR /app

# copy server binary from build stage
# COPY --from=builder /code/target/release/rust_demo_app rust_demo_app
COPY --from=builder /code/target/release/rust_demo_app .

ENV ROCKET_ADDRESS=0.0.0.0

# indicate what port the server is running on
EXPOSE 8000

# Run the server
CMD ["./rust_demo_app"]
