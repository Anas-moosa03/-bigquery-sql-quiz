-- This query shows a list of the daily top Google Search terms.
SELECT
 refresh_date AS Day,
 term AS Top_Term,
 rank
FROM `bigquery-public-data.google_trends.top_terms`
WHERE
 rank IN (1, 2, 3) AND dma_name = "UK"
 -- Choose only the top term each day.
 AND refresh_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 4 WEEK)
 -- Filter to the last 4 weeks.
GROUP BY Day, Top_Term, rank
ORDER BY Day DESC
 -- Show the days in reverse chronological order.