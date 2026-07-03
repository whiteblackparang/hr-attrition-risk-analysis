-- 부서별 퇴사율(%) 계산
SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        1
    ) AS attrition_rate_pct,
    ROUND(AVG(MonthlyIncome), 0) AS avg_monthly_income
FROM employees
GROUP BY Department
ORDER BY attrition_rate_pct DESC;

-- 위험 부서만 추출
-- 전체 평균 퇴사율보다 높은 부서만 필터링
SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        1
    ) AS attrition_rate_pct,
    ROUND(AVG(MonthlyIncome), 0) AS avg_monthly_income
FROM employees
GROUP BY Department
HAVING attrition_rate_pct > (
    SELECT SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)
    FROM employees
)
ORDER BY attrition_rate_pct DESC;