
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
