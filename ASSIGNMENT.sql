DROP TABLE IF EXISTS HOSPITAL;
CREATE TABLE HOSPITAL(
 Hospital_Name VARCHAR(100),
 Location VARCHAR(100),
 Department VARCHAR(100),
 Doctors_Count INT,
 Patients_Count INT,
 Admission_Date DATE,
 Discharge_Date DATE,
 Medical_Expenses NUMERIC(10,2)
);

SELECT*FROM HOSPITAL;

--Write an SQL query to find the total number of patients across all hospitals.
SELECT SUM(PATIENTS_COUNT) AS TOTAL_PATIENTS FROM HOSPITAL;

--Retrieve the average count of doctors available in each hospital.
SELECT AVG(DOCTORS_COUNT) AS AVG_COUNT FROM HOSPITAL 
GROUP BY HOSPITAL_NAME;

--Find the top 3 hospital departments that have the highest number of patients.
SELECT DISTINCT DEPARTMENT,SUM(PATIENTS_COUNT) AS TOTAL_PATIENTS
FROM HOSPITAL
GROUP BY DEPARTMENT
ORDER BY TOTAL_PATIENTS DESC
LIMIT 3;

--Identify the hospital that recorded the highest medical expenses.
SELECT*FROM HOSPITAL
ORDER BY MEDICAL_EXPENSES DESC
LIMIT 1;

--Calculate the average medical expenses per day for each hospital.
SELECT AVG(Medical_Expenses/(DISCHARGE_DATE - ADMISSION_DATE)) AS AVG_MEDICAL_EXPENSES,HOSPITAL_NAME FROM HOSPITAL
GROUP BY HOSPITAL_NAME;

--Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.
SELECT (DISCHARGE_DATE-ADMISSION_DATE) AS LONGEST_STAY,
HOSPITAL_NAME, LOCATION ,DEPARTMENT FROM HOSPITAL
ORDER BY LONGEST_STAY DESC
LIMIT 1;

--Count the total number of patients treated in each city.
SELECT SUM(PATIENTS_COUNT) AS TOTAL_PATIENTS,
LOCATION FROM HOSPITAL
GROUP BY LOCATION;

--Calculate the average number of days patients spend in each department.
SELECT AVG(DISCHARGE_DATE-ADMISSION_DATE) AS AVG_NO_OF_DAYS , DEPARTMENT FROM HOSPITAL
GROUP BY DEPARTMENT;

--Find the department with the least number of patients.
SELECT SUM(PATIENTS_COUNT) AS TOTAL_PATIENTS, DEPARTMENT FROM HOSPITAL
GROUP BY DEPARTMENT 
ORDER BY TOTAL_PATIENTS ASC
LIMIT 1;

--Group the data by month and calculate the total medical expenses for each month.
SELECT TO_CHAR(ADMISSION_DATE, 'Month') AS MONTH_NAME,
SUM(MEDICAL_EXPENSES) AS TOTAL_EXPENSES FROM HOSPITAL
GROUP BY EXTRACT(MONTH FROM ADMISSION_DATE) , TO_CHAR(ADMISSION_DATE, 'Month')
ORDER BY EXTRACT(MONTH FROM ADMISSION_DATE);











       