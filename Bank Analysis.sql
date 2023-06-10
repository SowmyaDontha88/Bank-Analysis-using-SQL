Create Database Bank;
Use Bank;

Select * from finance_1;
Select * from finance_2;

-- year wise loan aount stats

SELECT concat(20,SUBSTRING(issue_d, -2)) AS issue_year,
       COUNT(*) AS total_loans,
       MIN(loan_amnt) AS min_loan_amount,
       MAX(loan_amnt) AS max_loan_amount,
       AVG(loan_amnt) AS avg_loan_amount,
       SUM(loan_amnt) AS total_loan_amount
FROM finance_1
GROUP BY issue_year
ORDER BY issue_year;

-- Grade and subgrade wise revol_bal

SELECT f1.grade, f1.sub_grade, SUM(f2.revol_bal) AS total_revol_bal
FROM finance_1 f1
JOIN finance_2 f2 ON f1.id = f2.id
GROUP BY f1.grade, f1.sub_grade;

-- Total payment for verified status vs total payment for non verified status

SELECT verification_status,SUM(loan_amnt) AS total_payment
FROM finance_1
GROUP BY verification_status;

-- State wise and month wise loan status

SELECT addr_state, SUBSTRING(issue_d, 1, 3) AS month,loan_status
FROM finance_1;

-- Home ownership vs last payment date stats

SELECT
    f1.home_ownership,
    MIN(f2.last_pymnt_d) AS earliest_last_payment,
    MAX(f2.last_pymnt_d) AS latest_last_payment,
    COUNT(*) AS total_records
FROM finance_1 AS f1
JOIN finance_2 AS f2 ON f1.id = f2.id
WHERE f2.last_pymnt_d IS NOT NULL
GROUP BY f1.home_ownership;









