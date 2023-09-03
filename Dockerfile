FROM clux/muslrust:nightly as builder

WORKDIR /app

COPY Cargo.toml Cargo.lock ./

COPY src/ ./src/

RUN cargo build --release

FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/target/x86_64-unknown-linux-musl/release/opbnb-place .

COPY .env ./

CMD ["./opbnb-place"]
