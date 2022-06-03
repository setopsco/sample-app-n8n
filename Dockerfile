FROM n8nio/n8n:latest

ENV QUEUE_HEALTH_CHECK_ACTIVE=true

ENV DB_TYPE=postgresdb
ENV DB_POSTGRESDB_SSL_CA_FILE=/etc/ssl/certs/aws-rds-cert-bundle.cer
ENV DB_POSTGRESDB_SSL_CERT_FILE=/etc/ssl/certs/aws-rds-cert-bundle.cer
ENV DB_POSTGRESDB_SCHEMA=public

# for executing health checks
RUN apk --no-cache add curl

COPY docker-entrypoint.sh /docker-entrypoint.sh
COPY url-to-env.js /url-to-env.js
COPY aws-rds-cert-bundle.cer /etc/ssl/certs/aws-rds-cert-bundle.cer

USER node:node
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["n8n", "start"]
