# Git Foreign Data Wrapper

Ce sous projet nous permet de tester le Foreign Data Wrapper avec Git
dans un container docker.

## Mise en place

### Installation

Pour installer le projet il suffit de lancer le script `build.sh`.
Ce script va lancer la construction d'une image docker
en partant de l'image officielle `postgres`.

On installe en plus les différents paquets pour installer multicorn.
Cette librairie apporte l'extension pour communiquer avec un dépôt Git
directement dans PostgreSQL.

### Utilisation

Pour lancer le serveur PostgreSQL, il suffit de lancer le script `run.sh`.
Par défaut, le serveur se lance en premier plan.
Vous pouvez le lancer en ajoutant `&` en fin de commande pour le lancer en second plan.

Il faut ensuite éxécuter le script `psql.sh` pour lancer `psql` à l'intérieur du containeur.
Il est alors possible de configurer le serveur avec les requêtes dans le fichier `create.sql`.

## On joue

Quelques exemples de requêtes possibles sont présentées dans le fichier `select.sql`.
