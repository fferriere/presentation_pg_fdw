git ql -show-tables
/*
Tables:

commits
        hash, date, author, author_email, committer, committer_email, message, full_message.
refs
        name, full_name, type, hash.
remotes
        name, url, push_url, owner.
tags
        name, full_name, hash.
branches
        name, full_name, hash.
*/

time git ql 'SELECT hash, author, date, message FROM commits LIMIT 2'
/*
|---------------------------------------------------------------------------------------------------------------------------------------------|
| Hash                                     | Author         | Date                | Message                                                   |
|---------------------------------------------------------------------------------------------------------------------------------------------|
| 8c128304a63fb1f27da3be7db1b4cc561cb0ecd6 | Frédéric Hardy | 2016-11-20 00:21:09 | Evaluate test about variadic only if PHP version ≥ 5.6.0. |
|---------------------------------------------------------------------------------------------------------------------------------------------|
| 135080a82c2b4fbc7f74c05b1c3494046a675a48 | Frédéric Hardy | 2016-11-19 22:54:04 | Evaluate class if PHP version ≥ 5.6.0.                    |
|---------------------------------------------------------------------------------------------------------------------------------------------|

real    0m0.004s
user    0m0.001s
sys     0m0.002s
*/

git ql 'SELECT * FROM refs LIMIT 4'
/*
|----------------------------------------------------------------------------------------------|
| Name         | Full_name                 | Type   | Hash                                     |
|----------------------------------------------------------------------------------------------|
| master       | refs/heads/master         | branch | 8c128304a63fb1f27da3be7db1b4cc561cb0ecd6 |
|----------------------------------------------------------------------------------------------|
| origin/HEAD  | refs/remotes/origin/HEAD  | remote | NULL                                     |
|----------------------------------------------------------------------------------------------|
| origin/1.x   | refs/remotes/origin/1.x   | remote | 33597f45906cfc9ded860cb598af0600ffda8e69 |
|----------------------------------------------------------------------------------------------|
| origin/2.0.x | refs/remotes/origin/2.0.x | remote | 0b6ea4c2909b8a38e2abcd3a9562750f490ba2ba |
|----------------------------------------------------------------------------------------------|
*/
