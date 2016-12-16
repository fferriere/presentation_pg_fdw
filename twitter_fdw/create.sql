CREATE EXTENSION multicorn;

CREATE SERVER git_server
    FOREIGN DATA WRAPPER multicorn
    OPTIONS (
        wrapper 'multicorn.gitfdw.GitFdw'
    );

CREATE FOREIGN TABLE git_atoum (
    author_name VARCHAR(128),
    author_email VARCHAR(128),
    message TEXT,
    hash VARCHAR(128),
    date TIMESTAMP
)
SERVER git_server
OPTIONS (
    path '/opt/atoum'
);
