-- 부서별 인원수
SELECT
    Department,
    COUNT(*) AS employee_count
FROM employees
GROUP BY Department;

-- 부서별 평균 급여
SELECT
    Department,
    ROUND(AVG(MonthlyIncome), 0) AS avg_income
FROM employees
GROUP BY Department
ORDER BY avg_income DESC;

-- 부서별 퇴사자 수
SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count
FROM employees
GROUP BY Department;

-- 부서 x 야근여부별 인원
SELECT
    Department,
    OverTime,
    COUNT(*) AS employee_count
FROM employees
GROUP BY Department, OverTime
ORDER BY Department, OverTime;