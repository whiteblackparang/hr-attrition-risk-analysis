SELECT * FROM employees 
LIMIT 5;

-- 전체 행 개수
SELECT COUNT(*) AS total_rows 
FROM employees;

-- 퇴사자만 조회
SELECT
    EmployeeNumber,
    Department,
    JobRole,
    MonthlyIncome,
    Attrition
FROM employees
WHERE Attrition = 'Yes'
LIMIT 10;

-- 야근하면서 퇴사한 사람
SELECT
    EmployeeNumber,
    Department,
    JobRole,
    OverTime,
    Attrition
FROM employees
WHERE Attrition = 'Yes'
  AND OverTime = 'Yes';

-- 급여 낮은 순
SELECT
    EmployeeNumber,
    Department,
    JobRole,
    MonthlyIncome
FROM employees
ORDER BY MonthlyIncome ASC
LIMIT 10;

-- 부서/직무 종류 확인
SELECT DISTINCT Department 
FROM employees;

SELECT DISTINCT JobRole 
FROM employees
ORDER BY JobRole;

