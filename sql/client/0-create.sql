CREATE EXTENSION postgres_fdw;

CREATE SERVER remote FOREIGN DATA WRAPPER postgres_fdw OPTIONS (
    host 'server.conf_pg_fdw.lan',
    dbname 'docker'
);

CREATE USER MAPPING FOR docker
    SERVER remote
    OPTIONS (user 'docker', password 'docker');

CREATE FOREIGN TABLE f_country (
    id INTEGER,
    alpha2 CHAR(2),
    alpha3 CHAR(3),
    label VARCHAR(64)
)
SERVER remote
OPTIONS (table_name 'country', updatable 'false');

CREATE FOREIGN TABLE u_country (
    id INTEGER,
    alpha2 CHAR(2),
    alpha3 CHAR(3),
    label VARCHAR(64)
)
SERVER remote
OPTIONS (table_name 'country', updatable 'true');

-- Customers
CREATE FOREIGN TABLE f_customer (
    id INTEGER,
    lastname VARCHAR,
    firstname VARCHAR,
    birthday DATE
)
SERVER remote
OPTIONS (table_name 'customer');

CREATE MATERIALIZED VIEW m_customer AS
SELECT id, lastname, firstname,
        date_part('year', age(birthday)) as age
FROM f_customer
WITH NO DATA;
CREATE INDEX m_customer_keys
    ON m_customer (id);
REFRESH MATERIALIZED VIEW m_customer;
