-- 부서 내 직무별 위험도 순위

WITH jobrole_stats AS (
    SELECT
        Department,
        JobRole,
        COUNT(*) AS total_employees,
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
        ROUND(
            SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
            1
        ) AS attrition_rate_pct,
        ROUND(AVG(MonthlyIncome), 0) AS avg_monthly_income
    FROM employees
    GROUP BY Department, JobRole
)
SELECT
    Department,
    JobRole,
    total_employees,
    attrition_count,
    attrition_rate_pct,
    avg_monthly_income,
    RANK() OVER (PARTITION BY Department ORDER BY attrition_rate_pct DESC) AS risk_rank_in_dept
FROM jobrole_stats
ORDER BY Department, risk_rank_in_dept;