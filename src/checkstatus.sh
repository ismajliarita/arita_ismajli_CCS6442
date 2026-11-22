#!/bin/sh
echo "Waiting for PostgreSQL...."

until pg_isready -h postgres -p 5432 -U "$POSTGRES_USER" -d "$POSTGRES_DB"; do
	sleep 2
done

echo "Database is readyyy!!"