SELECT *
FROM diabetic_data_cleaned;

SELECT *
FROM admission_type_id_cleaned as guide1;

SELECT *
FROM discharge_disposition_id_cleaned as guide2;

SELECT *
FROM admission_source_id_cleaned as guide3;

SELECT *
FROM diabetic_data_cleaned as df
LEFT JOIN admission_type_id_cleaned as guide1
ON df.admission_type_id = guide1.admission_type_id
LEFT JOIN discharge_disposition_id_cleaned as guide2
ON df.discharge_disposition_id = guide2.discharge_disposition_id
LEFT JOIN admission_source_id_cleaned as guide3
ON df.admission_source_id = guide3.admission_source_id;


#based_on_ICD9_codes
SELECT
    CASE 
        WHEN diag_1 BETWEEN '390' AND '459' THEN 'Circulatory'
        WHEN diag_1 BETWEEN '460' AND '519' THEN 'Respiratory'
        WHEN diag_1 BETWEEN '520' AND '579' THEN 'Digestive'
        WHEN diag_1 BETWEEN '250' AND '250.99' THEN 'Diabetes'
        ELSE 'Other'
    END AS condition_group,
    AVG(time_in_hospital) AS avg_length_of_stay
FROM 
    diabetic_data_cleaned
WHERE
    diag_1 IS NOT NULL
GROUP BY 
    condition_group
ORDER BY 
    avg_length_of_stay DESC;


    SELECT
    CASE 
        WHEN diag_1 BETWEEN '390' AND '459' THEN 'Circulatory'
        WHEN diag_1 BETWEEN '460' AND '519' THEN 'Respiratory'
        WHEN diag_1 BETWEEN '520' AND '579' THEN 'Digestive'
        WHEN diag_1 BETWEEN '250' AND '250.99' THEN 'Diabetes'
        ELSE 'Other'
    END AS condition_group,
    SUM(CASE WHEN readmitted = '>30' OR readmitted = '<30' THEN 1 ELSE 0 END) * 100.0 / COUNT(readmitted) 
        AS readmission_rate
FROM diabetic_data_cleaned
GROUP BY condition_group
ORDER BY readmission_rate DESC;

SELECT 'metformin' AS medication, COUNT(*) AS prescriptions
FROM diabetic_data_cleaned
WHERE metformin IN ('Steady','Up','Down')
UNION ALL
SELECT 'repaglinide' AS medication, COUNT(*)
FROM diabetic_data_cleaned
WHERE repaglinide IN ('Steady','Up','Down')
UNION ALL
SELECT 'nateglinide' AS medication, COUNT(*)
FROM diabetic_data_cleaned
WHERE nateglinide IN ('Steady','Up','Down')
UNION ALL
SELECT 'chlorpropamide' AS medication, COUNT(*)
FROM diabetic_data_cleaned
WHERE chlorpropamide IN ('Steady','Up','Down')
UNION ALL
SELECT 'glimepiride' AS medication, COUNT(*)
FROM diabetic_data_cleaned
WHERE glimepiride IN ('Steady','Up','Down')
UNION ALL
SELECT 'acetohexamide' AS medication, COUNT(*)
FROM diabetic_data_cleaned
WHERE acetohexamide IN ('Steady','Up','Down')
UNION ALL
SELECT 'glipizide' AS medication, COUNT(*)
FROM diabetic_data_cleaned
WHERE glipizide IN ('Steady','Up','Down')
UNION ALL
SELECT 'glyburide' AS medication, COUNT(*)
FROM diabetic_data_cleaned
WHERE glyburide IN ('Steady','Up','Down')
UNION ALL
SELECT 'tolbutamide' AS medication, COUNT(*)
FROM diabetic_data_cleaned
WHERE tolbutamide IN ('Steady','Up','Down')
UNION ALL
SELECT 'pioglitazone' AS medication, COUNT(*)
FROM diabetic_data_cleaned
WHERE pioglitazone IN ('Steady','Up','Down')
UNION ALL
SELECT 'rosiglitazone' AS medication, COUNT(*)
FROM diabetic_data_cleaned
WHERE rosiglitazone IN ('Steady','Up','Down')
UNION ALL
SELECT 'acarbose' AS medication, COUNT(*)
FROM diabetic_data_cleaned
WHERE acarbose IN ('Steady','Up','Down')
UNION ALL
SELECT 'miglitol' AS medication, COUNT(*)
FROM diabetic_data_cleaned
WHERE miglitol IN ('Steady','Up','Down')
UNION ALL
SELECT 'troglitazone' AS medication, COUNT(*)
FROM diabetic_data_cleaned
WHERE troglitazone IN ('Steady','Up','Down')
UNION ALL
SELECT 'tolazamide' AS medication, COUNT(*)
FROM diabetic_data_cleaned
WHERE tolazamide IN ('Steady','Up','Down')
UNION ALL
SELECT 'examide' AS medication, COUNT(*)
FROM diabetic_data_cleaned
WHERE examide IN ('Steady','Up','Down')
UNION ALL
SELECT 'citoglipton' AS medication, COUNT(*)
FROM diabetic_data_cleaned
WHERE citoglipton IN ('Steady','Up','Down')
UNION ALL
SELECT 'insulin' AS medication, COUNT(*)
FROM diabetic_data_cleaned
WHERE insulin IN ('Steady','Up','Down')
UNION ALL
SELECT 'glyburide_metformin' AS medication, COUNT(*)
FROM diabetic_data_cleaned
WHERE glyburide_metformin IN ('Steady','Up','Down')
UNION ALL
SELECT 'glipizide_metformin' AS medication, COUNT(*)
FROM diabetic_data_cleaned
WHERE glipizide_metformin IN ('Steady','Up','Down')
UNION ALL
SELECT 'glimepiride_pioglitazone' AS medication, COUNT(*)
FROM diabetic_data_cleaned
WHERE glimepiride_pioglitazone IN ('Steady','Up','Down')
UNION ALL
SELECT 'metformin_rosiglitazone' AS medication, COUNT(*)
FROM diabetic_data_cleaned
WHERE metformin_rosiglitazone IN ('Steady','Up','Down')
UNION ALL
SELECT 'metformin_pioglitazone' AS medication, COUNT(*)
FROM diabetic_data_cleaned
WHERE metformin_pioglitazone IN ('Steady','Up','Down')

ORDER BY prescriptions DESC;

SELECT 'insulin' AS medication,
       SUM(CASE WHEN `change` = 'Ch' THEN 1 ELSE 0 END) AS change_count,
       SUM(CASE WHEN readmitted = 'NO' THEN 1 ELSE 0 END) AS not_readmitted_count
FROM diabetic_data_cleaned
WHERE insulin IN ('Steady','Up','Down')

UNION ALL

SELECT 'metformin' AS medication,
       SUM(CASE WHEN `change` = 'Ch' THEN 1 ELSE 0 END),
       SUM(CASE WHEN readmitted = 'NO' THEN 1 ELSE 0 END)
FROM diabetic_data_cleaned
WHERE metformin IN ('Steady','Up','Down')

UNION ALL

SELECT 'glipizide' AS medication,
       SUM(CASE WHEN `change` = 'Ch' THEN 1 ELSE 0 END),
       SUM(CASE WHEN readmitted = 'NO' THEN 1 ELSE 0 END)
FROM diabetic_data_cleaned
WHERE glipizide IN ('Steady','Up','Down')

UNION ALL

SELECT 'glyburide' AS medication,
       SUM(CASE WHEN `change` = 'Ch' THEN 1 ELSE 0 END),
       SUM(CASE WHEN readmitted = 'NO' THEN 1 ELSE 0 END)
FROM diabetic_data_cleaned
WHERE glyburide IN ('Steady','Up','Down')

UNION ALL

SELECT 'pioglitazone' AS medication,
       SUM(CASE WHEN `change` = 'Ch' THEN 1 ELSE 0 END),
       SUM(CASE WHEN readmitted = 'NO' THEN 1 ELSE 0 END)
FROM diabetic_data_cleaned
WHERE pioglitazone IN ('Steady','Up','Down')

ORDER BY change_count AND not_readmitted_count DESC;

SELECT 
    age_label, COUNT(*) AS total_number_of_patients,
    SUM(CASE WHEN readmitted = 'NO' THEN 1 ELSE 0 END) AS not_readmitted,
    SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) AS readmitted_in_less_than_30days,
    SUM(CASE WHEN readmitted = '>30' THEN 1 ELSE 0 END) AS readmitted_after_30days
FROM diabetic_data_cleaned
GROUP BY age_label
ORDER BY readmitted_in_less_than_30days DESC;

SELECT 
    age_label, COUNT(*) AS total_number_of_patients,
    ROUND(100.0 * SUM(CASE WHEN readmitted = 'NO' THEN 1 ELSE 0 END) / COUNT(*), 2) AS not_readmitted_percent,
    ROUND(100.0 * SUM(CASE WHEN readmitted = '<30' THEN 1 ELSE 0 END) / COUNT(*), 2) AS readmitted_in_less_than_30days_percent,
    ROUND(100.0 * SUM(CASE WHEN readmitted = '>30' THEN 1 ELSE 0 END) / COUNT(*), 2) AS readmitted_in_less_than_30days_percent
FROM diabetic_data_cleaned
GROUP BY age_label
ORDER BY readmitted_in_less_than_30days_percent DESC;
