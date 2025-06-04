

create table eye_cancer_patients(
		PATIENT_ID (50),
		AGE INT,
		GENDER varchar(50),
		CANCER_TYPE varchar(50),
		LATERALITY varchar(50),
		DATE_OF_DIAGNOSIS date,
		STAGE_AT_DIAGNOSIS varchar(50),
		TREATMENT_TYPE varchar(50),
		SURGERY_STATUS varchar(50),
		RADIATION_THERAPY int,
		CHEMOTHERAPY int,
		OUTCOME_STATUS varchar(50),
		SURVIVAL_TIME_MONTHS int,
		GENETIC_MARKERS varchar(50),
		FAMILY_HISTORY varchar(50),
		COUNTRY varchar(50)
		);


--1.Display all records of eye cancer patients
SELECT
	*
FROM
	EYE_CANCER_PATIENTS;

--2.How many total patients are in dataset?
SELECT
	COUNT(*) AS TOTAL_PATIENTS
FROM
	EYE_CANCER_PATIENTS;

--3.List the distinct type of eye cancer recorded in the dataset
SELECT DISTINCT
	CANCER_TYPE
FROM
	EYE_CANCER_PATIENTS;

--4 Find the number of male and female patients diagnosed with eye cancer?
SELECT
	GENDER,
	COUNT(*) AS NUMBER_MALE_FEMALE
FROM
	EYE_CANCER_PATIENTS
GROUP BY
	GENDER;

/*5 What is averge age of patients diagnosed with eye cancer
use GROUP BY on gender*/
SELECT
	GENDER,
	AVG(AGE) AS AVG_AGE_PATIENTS
FROM
	EYE_CANCER_PATIENTS
GROUP BY
	GENDER;

--6 List patients who are older than 60 years and diagnosed with any type of eye cancer
SELECT
	*
FROM
	EYE_CANCER_PATIENTS
WHERE
	AGE > 60;

--7 which country has the highest number of eye cancer  case?
SELECT
	COUNTRY,
	COUNT(*) AS HIGHEST_NO_OF_CASE
FROM
	EYE_CANCER_PATIENTS
GROUP BY
	COUNTRY
ORDER BY
	HIGHEST_NO_OF_CASE DESC
LIMIT
	1;

--8 How many patients were diagnosed each year?
SELECT
	DATE_PART('year', DATE_OF_DIAGNOSIS) AS YEAR,
	COUNT(*) AS PATIENTS
FROM
	EYE_CANCER_PATIENTS
GROUP BY
	YEAR
ORDER BY
	YEAR;

--9.Find patients who have a follow-up scheduled (or status A ongoing).
SELECT
	*
FROM
	EYE_CANCER_PATIENTS
WHERE
	OUTCOME_STATUS = 'Active';

--10.Which type of cancer has the highest recovery rate?
SELECT
	CANCER_TYPE,
	COUNT(OUTCOME_STATUS) AS HIGH_RECOVERY_RATE
FROM
	EYE_CANCER_PATIENTS
WHERE
	OUTCOME_STATUS = 'In Remission'
GROUP BY
	CANCER_TYPE
ORDER BY
	HIGH_RECOVERY_RATE DESC;