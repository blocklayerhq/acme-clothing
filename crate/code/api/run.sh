#!/bin/sh


> src/config/database.json cat << EOF
{
  "development": {
    "username": "$DB_USERNAME",
    "password": "$DB_PASSWORD",
    "database": "$DB_DBNAME",
    "host": "$DB_HOSTNAME",
    "port": $DB_PORT,
    "dialect": "mysql",
    "seederStorage": "sequelize"
  }
}
EOF

npm run start:prod
