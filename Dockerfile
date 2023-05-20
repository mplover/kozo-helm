FROM alpine/helm:3.12.0 AS builder

WORKDIR /app
COPY . /app/src

RUN helm dependency build /app/src
RUN helm package /app/src -d /app/dist

FROM alpine/helm:3.12.0

COPY --from=builder /app/dist /app

CMD helm --help
