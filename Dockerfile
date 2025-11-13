# ---- Build ----
FROM golang:1.22-alpine AS builder
WORKDIR /src
COPY go.mod ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -trimpath -o /app/icanhazip .

# ---- Run (nonroot) ----
FROM gcr.io/distroless/static:nonroot
WORKDIR /opt/icanhazip
COPY --from=builder --chown=nonroot:nonroot /app/icanhazip ./icanhazip
EXPOSE 8091
ENTRYPOINT ["./icanhazip"]