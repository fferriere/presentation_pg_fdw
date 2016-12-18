SELECT *
FROM git_atoum
ORDER BY date DESC
LIMIT 10;
/*
  author_name   |         author_email         |                                                    message                                                    |                   hash                   |        date
----------------+------------------------------+---------------------------------------------------------------------------------------------------------------+------------------------------------------+---------------------
 Frédéric Hardy | frederic.hardy@mageekbox.net | Evaluate test about variadic only if PHP version ≥ 5.6.0.                                                     | 8c128304a63fb1f27da3be7db1b4cc561cb0ecd6 | 2016-11-19 23:21:09
 Frédéric Hardy | frederic.hardy@mageekbox.net | Evaluate class if PHP version ≥ 5.6.0.                                                                        | 135080a82c2b4fbc7f74c05b1c3494046a675a48 | 2016-11-19 21:54:04
 Frédéric Hardy | frederic.hardy@mageekbox.net | Use full PHP version number.                                                                                  | 752f9cc20eee4dd7db16b68bff69b788e9bb4ec9 | 2016-11-19 21:35:23
 Frédéric Hardy | frederic.hardy@mageekbox.net | Fix PHP version comparator.                                                                                   | 6077ee7b4a99fb4441225f5e4b7c6f1cc22c9838 | 2016-11-19 21:27:27
 Frédéric Hardy | frederic.hardy@mageekbox.net | Check `allIsInterface()` in mock generator behavior only if PHP version ≥ 5.6.                                | f7905e9a11587a47eb7239b08295c5125be184ce | 2016-11-19 21:14:49
 Frédéric Hardy | frederic.hardy@mageekbox.net | Fix bug in mock generator in case of variadic arguments in constructor and method `allIsInterface()` is used. | a287fc1256e1ea269b5fe41de8f370c54a4c29c1 | 2016-11-19 21:04:04
 Julien BIANCHI | contact@jubianchi.Fr         | Merge pull request #660 from agallou/fix_santa                                                                | e9d37193dc5ef59ca5d0f00da46c73770b78d39c | 2016-11-11 10:41:06
 Adrien Gallou  | adriengallou@gmail.com       | fix santa report                                                                                              | 487eccd5d6ef4bd00dc67943d1d6264c13103c9e | 2016-10-16 09:57:44
 jubianchi      | contact@jubianchi.fr         | Set version to dev-master.                                                                                    | 1809e7680420918616af7831d71f575364f2a9f9 | 2016-10-08 11:41:17
 jubianchi      | contact@jubianchi.fr         | Set version to 2.9.0-beta1.                                                                                   | 56f1450241742aed188733605ef594816cebdbdc | 2016-10-08 11:41:14
(10 rows)
*/

\timing
SELECT hash, author_name, date, message
FROM git_atoum
ORDER BY date DESC
LIMIT 2;
/*
                   hash                   |  author_name   |        date         |                          message
------------------------------------------+----------------+---------------------+-----------------------------------------------------------
 8c128304a63fb1f27da3be7db1b4cc561cb0ecd6 | Frédéric Hardy | 2016-11-19 23:21:09 | Evaluate test about variadic only if PHP version ≥ 5.6.0.
 135080a82c2b4fbc7f74c05b1c3494046a675a48 | Frédéric Hardy | 2016-11-19 21:54:04 | Evaluate class if PHP version ≥ 5.6.0.
(2 rows)

Time: 57.630 ms
*/


SELECT author_name, message, date
FROM git_atoum
WHERE author_name ILIKE '%florian%'
ORDER BY date DESC;

/*
   author_name    |                       message                        |        date
------------------+------------------------------------------------------+---------------------
 Florian FERRIERE | Merge branch 'master' into correct-datetimeimmutable | 2016-03-23 08:18:59
 Florian Ferriere | Correction for dateTimeImmutable happens with #547   | 2016-03-21 14:14:52
(2 rows)
*/

SELECT author_email, COUNT(*) as nb_commit
FROM git_atoum
GROUP BY author_email
HAVING COUNT(*) > 10
ORDER BY nb_commit DESC, author_email ASC;

SELECT *
FROM git_atoum
WHERE date BETWEEN 2016-01-01 AND 2016-12-31;

SELECT to_char(date, 'YYYY-MM') AS mois, COUNT(*) as nb_commit
FROM git_atoum
GROUP BY to_char(date, 'YYYY-MM')
ORDER BY nb_commit DESC;

SELECT array_to_json(array_agg(t))
FROM (
    SELECT to_char(date, 'YYYY-MM') AS month, COUNT(*) as nb_commit
    FROM git_atoum
    GROUP BY to_char(date, 'YYYY-MM')
    ORDER BY nb_commit DESC
) AS t;

/*
[{"mois":"2013-04","nb_commit":130},{"mois":"2012-10","nb_commit":105},{"mois":"2011-07","nb_commit":104},{"mois":"2011-12","nb_commit":101},{"mois":"2013-10","nb_commit":99},{"mois":"2013-11","nb_commit":98},{"mois":"2014-12","nb_commit":92},{"mois":"2013-03","nb_commit":84},{"mois":"2014-03","nb_commit":80},{"mois":"2011-08","nb_commit":73},{"mois":"2013-02","nb_commit":69},{"mois":"2012-06","nb_commit":67},{"mois":"2011-05","nb_commit":67},{"mois":"2011-06","nb_commit":66},{"mois":"2011-04","nb_commit":66},{"mois":"2013-01","nb_commit":62},{"mois":"2012-08","nb_commit":61},{"mois":"2013-09","nb_commit":60},{"mois":"2016-01","nb_commit":58},{"mois":"2012-04","nb_commit":58},{"mois":"2013-05","nb_commit":55},{"mois":"2010-09","nb_commit":54},{"mois":"2012-07","nb_commit":53},{"mois":"2011-09","nb_commit":53},{"mois":"2011-03","nb_commit":53},{"mois":"2011-01","nb_commit":49},{"mois":"2013-06","nb_commit":49},{"mois":"2010-11","nb_commit":47},{"mois":"2011-10","nb_commit":45},{"mois":"2012-11","nb_commit":45},{"mois":"2012-03","nb_commit":44},{"mois":"2011-02","nb_commit":42},{"mois":"2010-12","nb_commit":41},{"mois":"2015-04","nb_commit":37},{"mois":"2012-09","nb_commit":36},{"mois":"2012-12","nb_commit":34},{"mois":"2015-11","nb_commit":31},{"mois":"2013-08","nb_commit":31},{"mois":"2012-02","nb_commit":30},{"mois":"2011-11","nb_commit":28},{"mois":"2013-07","nb_commit":28},{"mois":"2015-01","nb_commit":28},{"mois":"2016-07","nb_commit":27},{"mois":"2014-01","nb_commit":26},{"mois":"2015-07","nb_commit":24},{"mois":"2015-02","nb_commit":24},{"mois":"2015-10","nb_commit":24},{"mois":"2015-08","nb_commit":22},{"mois":"2014-06","nb_commit":22},{"mois":"2010-10","nb_commit":20},{"mois":"2015-12","nb_commit":20},{"mois":"2013-12","nb_commit":20},{"mois":"2010-06","nb_commit":20},{"mois":"2015-09","nb_commit":19},{"mois":"2014-09","nb_commit":16},{"mois":"2016-02","nb_commit":15},{"mois":"2014-11","nb_commit":15},{"mois":"2012-01","nb_commit":15},{"mois":"2016-09","nb_commit":13},{"mois":"2012-05","nb_commit":12},{"mois":"2016-03","nb_commit":12},{"mois":"2016-05","nb_commit":12},{"mois":"2016-06","nb_commit":10},{"mois":"2014-07","nb_commit":9},{"mois":"2015-05","nb_commit":8},{"mois":"2010-08","nb_commit":7},{"mois":"2016-10","nb_commit":6},{"mois":"2015-03","nb_commit":6},{"mois":"2010-05","nb_commit":5},{"mois":"2016-04","nb_commit":5},{"mois":"2014-05","nb_commit":4},{"mois":"2014-04","nb_commit":3},{"mois":"2016-08","nb_commit":3},{"mois":"2010-07","nb_commit":3},{"mois":"2014-10","nb_commit":3},{"mois":"2014-02","nb_commit":2},{"mois":"2015-06","nb_commit":1},{"mois":"2016-11","nb_commit":1},{"mois":"2014-08","nb_commit":1}]
*/

SELECT to_json(t)
FROM (
    SELECT  array_agg(data.quarter) AS labels,
            array_agg(data.nb_commit) AS data
    FROM (
        SELECT to_char(date, 'YYYY-TQ') AS quarter,
                COUNT(*) as nb_commit
        FROM git_atoum
        GROUP BY to_char(date, 'YYYY-TQ')
        ORDER BY quarter ASC
    ) AS data
) AS t;

/*
{"labels":["2010-T2","2010-T3","2010-T4","2011-T1","2011-T2","2011-T3","2011-T4","2012-T1","2012-T2","2012-T3","2012-T4","2013-T1","2013-T2","2013-T3","2013-T4","2014-T1","2014-T2","2014-T3","2014-T4","2015-T1","2015-T2","2015-T3","2015-T4","2016-T1","2016-T2","2016-T3","2016-T4"],"data":[25,64,108,144,199,230,174,89,137,150,184,215,234,119,217,108,29,26,110,58,46,65,75,85,27,43,7]}
*/
