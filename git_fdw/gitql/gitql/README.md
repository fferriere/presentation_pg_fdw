# gitql/gitql

https://github.com/gitql/gitql

## Installation

```
docker build -t gitql_gitql /path/Dockerfile
```

## Utilisation

```
docker run -ti -v $(pwd):$(pwd) -w $(pwd) gitql_gitql 'SELECT ...'
```

Simplication :
```
/path/run.sh 'SELECT ...'
```
