# Présentation des FOREIGN DATA WRAPPER de PostgreSQL

Ce projet permet de créer deux instances de serveurs PostgreSQL.
Le premier sera le `server`, celui où les données seront les sources.
Le second sera le `client`, celui ci se connecte via `postgres_fdw` au serveur `server`.

## Mise en place

### Installation

Ce projet nécessite docker ainsi que les conteneurs suivants :
 - [dnsmasq](https://github.com/fferriere/docker-dnsmasq)
 - [postgresql-data](https://github.com/fferriere/docker-postgresql-data)
 - [postgresql-server](https://github.com/fferriere/docker-postgresql-server)

Ces projets doivent être (au moins en lien symbolique) dans `/opt/docker/`.

### Utilisation

Pour lancer les deux serveurs PostgreSQL il suffit de lancer le script `./run.sh`.

Lors du démarrage les deux serveurs vont se voir attitrer un nom de domaine chacun.
`server.conf_pg_fdw.lan` pour le `server` et `client.conf_pg_fdw.lan` pour le `client`.

### Premier démarrage

Lors du premier démarrage les instances sont initalisées avec l'utilisateur _`docker`_ et son mot de passe _`docker`_.

Pour initialiser les données des deux serveurs vous devez éxécuter les scripts `SQL` dédiés à chaque instances :
`./sql/server/*.sql` pour l'instance `server` et `./sql/client/*.sql`.

### Connexion aux serveurs

Les scripts `psql_server.sh` et `psql_client.sh` permettent de lancer le client en ligne de commande `psql` pour les instances respectives. Le mot de passe vous sera demandé.

## Explication



## On joue

### Avec les pays

Sur l'instance `server` nous pouvons voir qu'un table `country` exite :
```
docker=# \d
                Liste des relations
 Schéma |      Nom       |   Type   | Propriétaire
--------+----------------+----------+--------------
 public | country        | table    | docker
 public | country_id_seq | séquence | docker
(2 lignes)
```

Nous pouvons également constater que sur l'instance `client` nous avons les tables `f_country` et `u_country` :
```
Liste des relations
Schéma |    Nom    |      Type      | Propriétaire
--------+-----------+----------------+--------------
public | f_country | table distante | docker
public | u_country | table distante | docker
(2 lignes)
```

`f_country` correspond à la table `country` sur `server` en lecture seule alors que `u_country` correspond à la table `country` sur `server` mais en écriture.
