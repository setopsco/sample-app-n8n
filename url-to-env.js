const url = new URL(process.argv[2]);

if (url.protocol != "postgresql:") {
  console.error(`Unsupported protocol: ${url.protocol}`)
  process.exit(1)
}

console.log(`
export DB_POSTGRESDB_DATABASE=${url.pathname.substring(1)}
export DB_POSTGRESDB_HOST=${url.hostname}
export DB_POSTGRESDB_PORT=${url.port || '5432'}
export DB_POSTGRESDB_USER=${url.username}
export DB_POSTGRESDB_PASSWORD=${url.password}`);
