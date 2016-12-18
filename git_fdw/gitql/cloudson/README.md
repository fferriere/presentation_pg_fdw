# cloudson/gitql

https://github.com/cloudson/gitql

## Installation

```
docker build -t cloudson_gitql /path/Dockerfile
```

## Utilisation

```
docker run -ti -v $(pwd):$(pwd) -w $(pwd) cloudson_gitql git ql 'SELECT ...'
```

Simplication :
```
/path/run.sh 'SELECT ...'
```
