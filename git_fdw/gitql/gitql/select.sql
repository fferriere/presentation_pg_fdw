gitql query 'SHOW TABLES;'
/*
+--------------+
|    TABLE     |
+--------------+
| blobs        |
| commits      |
| objects      |
| refs         |
| tags         |
| tree_entries |
+--------------+
*/

gitql query 'DESCRIBE TABLE commits;'
/*
+----------------+-------------------------+
|      NAME      |          TYPE           |
+----------------+-------------------------+
| hash           | string                  |
| author_name    | string                  |
| author_email   | string                  |
| author_when    | timestamp with timezone |
| comitter_name  | string                  |
| comitter_email | string                  |
| comitter_when  | timestamp with timezone |
| message        | string                  |
+----------------+-------------------------+
*/

time gitql query 'SELECT hash, author_name, author_when, message FROM commits ORDER BY author_when DESC LIMIT 2;'
/*
+------------------------------------------+----------------+---------------------------+-----------------------------------------------------------+
|                   HASH                   |  AUTHOR NAME   |          AUTHOR WHEN      |            MESSAGE                                        |
+------------------------------------------+----------------+---------------------------+-----------------------------------------------------------+
| 8c8d424403f849310bbe3fabb74d9fce1389b7f8 | Frédéric Hardy | 2016-11-23 18:46:48 +0100 | Now, each mock instance may be unique.                    |
| 8c128304a63fb1f27da3be7db1b4cc561cb0ecd6 | Frédéric Hardy | 2016-11-20 00:21:09 +0100 | Evaluate test about variadic only if PHP version ≥ 5.6.0. |
+------------------------------------------+----------------+---------------------------+-----------------------------------------------------------+

real    0m8.169s
user    0m16.476s
sys     0m0.764s
*/

time gitql query 'SELECT * FROM refs ORDER BY name LIMIT 4;'
/*
+------------------------------------------+---------------------------+-----------+---------+-----------+--------+-------------------+
|                   HASH                   |           NAME            | IS BRANCH | IS NOTE | IS REMOTE | IS TAG |      TARGET       |
+------------------------------------------+---------------------------+-----------+---------+-----------+--------+-------------------+
| 0000000000000000000000000000000000000000 | HEAD                      | false     | false   | false     | false  | refs/heads/master |
| 8c128304a63fb1f27da3be7db1b4cc561cb0ecd6 | refs/heads/master         | true      | false   | false     | false  |                   |
| 33597f45906cfc9ded860cb598af0600ffda8e69 | refs/remotes/origin/1.x   | false     | false   | true      | false  |                   |
| 0b6ea4c2909b8a38e2abcd3a9562750f490ba2ba | refs/remotes/origin/2.0.x | false     | false   | true      | false  |                   |
+------------------------------------------+---------------------------+-----------+---------+-----------+--------+-------------------+

real    0m0.068s
user    0m0.036s
sys     0m0.036s
*/
