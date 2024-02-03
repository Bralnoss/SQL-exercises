1.   Show first name, last name, and gender of patients whose gender is 'M':
Q:   SELECT first_name, last_name, gender FROM patients WHERE gender = 'M';
2.   Show first name and last name of patients who does not have allergies. (null):
Q:   SELECT first_name, last_name FROM patients where allergies IS NULL;
3.   Show first name of patients that start with the letter 'C':
Q:   SELECT first_name from patients where first_name LIKE 'C%';
4.   Show first name and last name of patients that weight within the range of 100 to 120 (inclusive):
Q:   SELECT first_name, last_name FROM patients WHERE weight BETWEEN 100 AND 120;
5.   Update the patients table for the allergies column. If the patients allergies is null then replace it with 'NKA':
Q:   UPDATE patients SET allergies = 'NKA' WHERE allergies IS NULL;
6.   Show first name and last name concatinated into one column to show their full name.:
Q:   SELECT concat(first_name, " ", last_name) AS full_name FROM patients
7.   Show first name, last name, and the full province name of each patient:
Q:   SELECT first_name, last_name, province_name FROM patients JOIN province_names ON patients.province_id=province_names.province_id;
8.   Show how many patients have a birth_date with 2010 as the birth year:
Q:   SELECT count(*) AS birth_year_equal_to_2010 FROM patients WHERE YEAR(birth_date) = 2010;
9.   Show the first_name, last_name, AND height of the patient with the greatest height:
Q:   SELECT first_name, last_name, height FROM patients ORDER BY height DESC limit 1;
10.  Show all columns for patients who have one of the following patient_ids: 1,45,534,879,1000:
Q:   SELECT * FROM patients WHERE patient_id IN (1, 45, 534, 879, 1000);
11.  Show the total number of admissions:
Q:   SELECT Count(*) AS total_admissions FROM admissions;
12.  Show all the columns from admissions WHERE the patient was admitted and discharged on the same day:
Q:   SELECT * FROM admissions WHERE admission_date = discharge_date;
13.  Show the patient id and the total number of admissions for patient_id 579:
Q:   SELECT patient_id, count(*) AS total_admissions FROM admissions WHERE patient_id = 579;
14.  Based on the cities that our patients live in, show unique cities that are in province_id 'NS':
Q:   SELECT DISTINCT(city) AS unique_city FROM patients WHERE province_id = 'NS';
15.  Write a query to find the first_name, last name and birth date of patients who has height greater than 160 and weight greater than 70:
Q:   SELECT first_name, last_name, birth_date FROM patients WHERE height > 160 AND WEIGHT > 70;
16.  Write a query to find list of patients first_name, last_name, and allergies where allergies are not null and are from the city of 'Hamilton':
Q:   SELECT first_name, last_name, allergies FROM patients where allergies not null and city = 'Hamilton';
17.  Show unique birth years FROM patients and order them by ascending:
Q:   SELECT distinct(year(birth_date)) AS unique_birth_date FROM patients order by unique_birth_date;
18.  Show unique first names FROM the patients table which only occurs once in the list:
Q:   SELECT first_name as unique_first_name FROM patients group by first_name having count(*) < 2;
19.  Show patient_id and first_name FROM patients where their first_name start and ends with 's' and is at least 6 characters long:
Q:   SELECT patient_id, first_name FROM patients where first_name like 'S%s' and len(first_name) > 5;
20.  Show patient_id, first_name, last_name FROM patients whos diagnosis is 'Dementia':
Q:   SELECT patients.patient_id, first_name, last_name FROM patients join admissions on patients.patient_id = admissions.patient_id where diagnosis = 'Dementia'
21.  Display every patients first_name. Order the list by the length of each name and then by alphabetically:
Q:   SELECT first_name FROM patients order by len(first_name), first_name;
22.  Show the total amount of male patients and the total amount of female patients in the patients table. Display the two results in the same row:
Q:   SELECT SUM(gender = 'M') AS male_count, sum (gender = 'F') AS female_count FROM patients;
23.  Show first and last name, allergies from patients which have allergies to either 'Penicillin' or 'Morphine'. Show results ordered ascending by allergies then by first_name then by last_name:
Q:   select first_name, last_name, allergies from patients where allergies IN ('Penicillin', 'Morphine') order by allergies , first_name, last_name;
24.  Show patient_id, diagnosis from admissions. Find patients admitted multiple times for the same diagnosis:
Q:   SELECT patient_id, diagnosis from admissions group by patient_id, diagnosis having count(*) > 1 
25.  Show the city and the total number of patients in the city. Order from most to least patients and then by city name ascending:
Q:   SELECT city, count(*) AS total_number_of_patients FROM patients group by city order by total_number_of_patients DESC, city;
26.  Show first name, last name and role of every person that is either patient or doctor. The roles are either "Patient" or "Doctor":
Q:   SELECT first_name, last_name, 'Patient' AS role FROM patients UNION SELECT ALL first_name, last_name, 'Doctor' from doctors;
27.  Show all allergies ordered by popularity. Remove NULL values from query:
Q:   SELECT allergies, count(*) AS number_of_allergies from patients where allergies not null group by allergies order by number_of_allergies desc;
28.  Show all patients first_name, last_name, and birth_date who were born in the 1970s decade. Sort the list starting from the earliest birth_date:
Q:   SELECt first_name, last_name, birth_date from patients WHERE year(birth_date) between 1970 and 1979 order by birth_date;
29.  We want to display each patients full name in a single column. Their last_name in all upper letters must appear first, then first_name in all lower case letters. Separate the last_name and first_name with a comma. Order the list by the first_name in decending order:
Q:   SELECT concat(upper(last_name),",",lower(first_name)) AS full_name from patients order by first_name desc;
30.  Show the province_id(s), sum of height; where the total sum of its patients height is greater than or equal to 7,000:
Q:   SELECT province_id, sum(height) from patients group by province_id having sum(height) >= 7000;
31.  Show the difference between the largest weight and smallest weight for patients with the last name 'Maroni':
Q:   SELECT max(weight) - min(weight) AS difference_weight from patients where last_name = 'Maroni';
32.  Show all of the days of the month (1-31) and how many admission_dates occurred on that day. Sort by the day with most admissions to least admissions.
Q:   SELECT day(admission_date) AS number_of_day, count(*) AS admission_count from admissions group by day(admission_date) order by admission_count DESC;
33.  Show all columns for patient_id 542s most recent admission_date.
Q:   SELECT * from admissions where patient_id = 542 order by admission_date DESC limit 1;
34.  Show patient_id, attending_doctor_id, and diagnosis for admissions that match one of the two criteria: patient_id is an odd number and attending_doctor_id is either 1, 5, or 19, attending_doctor_id contains a 2 and the length of patient_id is 3 characters.
Q:   SELECT patient_id, attending_doctor_id, diagnosis from admissions where (patient_id%2=1 and attending_doctor_id IN (1, 5, 19)) or  (attending_doctor_id like '%2%' and len(patient_id) = 3);
35.  Show first_name, last_name, and the total number of admissions attended for each doctor. Every admission has been attended by a doctor.
Q:   SELECT first_name, last_name, count(admission_date) AS number_of_admissions from doctors join admissions ON doctors.doctor_id=admissions.attending_doctor_id group by first_name;
36.  For each doctor, display their id, full name, and the first and last admission date they attended.
Q:   SELECT doctor_id, concat(first_name, " ", last_name) AS full_name, min(admission_date) AS first_admission_date, max(admission_date) AS last_admission_date from doctors join admissions on doctors.doctor_id = admissions.attending_doctor_id group by first_name;
37.  Display the total amount of patients for each province. Order by descending.
Q:   SELECT province_name, count(patient_id) AS amount_of_patients from province_names join patients on province_names.province_id = patients.province_id group by province_name order by amount_of_patients desc; 
38.  For every admission, display the patient's full name, their admission diagnosis, and their doctor's full name who diagnosed their problem.
Q:   SELECT concat(doctors.first_name, " ", doctors.last_name) AS doctor_full_name, diagnosis, concat(patients.first_name, " ",patients.last_name) AS patient_full_name from doctors JOIN admissions on doctors.doctor_id = admissions.attending_doctor_id JOIN patients ON admissions.patient_id = patients.patient_id;
39.  Display the first name, last name and number of duplicate patients based on their first name and last name. Ex: A patient with an identical name can be considered a duplicate.
Q:   SELECT first_name, last_name, count(*) AS number_of_duplicate from patients group by first_name, last_name having count(*) > 1;
40.  Display patient s full name, height in the units feet rounded to 1 decimal, weight in the unit pounds rounded to 0 decimals, birth_date, gender non abbreviated. Convert CM to feet by dividing by 30.48. Convert KG to pounds by multiplying by 2.205.
Q:   SELECT concat(first_name, " " , last_name) AS full_name, round((height/30.48),1) AS height_to_feet, round((weight*2.205),0) AS kg_to_pounds, birth_date, 
case 
when gender = 'F' then 'Female'
when gender = 'M' THEN 'Male'
END AS gender_type
from patients ;
41.  Show patient_id, first_name, last_name from patients whose does not have any records in the admissions table. (Their patient_id does not exist in any admissions.patient_id rows.)
Q:   SELECT patients.patient_id, first_name, last_name from  patients left join admissions on patients.patient_id = admissions.patient_id where admissions.patient_id is null;
42.  Show patient_id, weight, height, isObese from the patients table. Display isObese as a boolean 0 or 1. Obese is defined as weight(kg)/(height(m)2) >= 30. weight is in units kg. height is in units cm.
Q:   SELECT patient_id, weight, height,
CASE 
WHEN weight/(power(height/100.0,2)) >= 30 then 1
else 0
end as isObese
from patients;
43.  Show patient_id, first_name, last_name, and attending doctors specialty. Show only the patients who has a diagnosis as 'Epilepsy' and the doctors first name is 'Lisa':
Q:   SELECT patients.patient_id, patients.first_name, patients.last_name, specialty from patients join admissions on patients.patient_id = admissions.patient_id join doctors on admissions.attending_doctor_id = doctors.doctor_id where diagnosis = 'Epilepsy' and doctors.first_name = 'Lisa';
44.  All patients who have gone through admissions, can see their medical documents on our site. Those patients are given a temporary password after their first admission. Show the patient_id and temp_password. The password must be the following, in order: patient_id, the numerical length of patients last_name, year of patients birth_date:
Q:   SELECT distinct(patients.patient_id), concat(patients.patient_id,len(last_name), year(birth_date)) AS temp_password from patients join admissions on patients.patient_id = admissions.patient_id;
45.  We are looking for a specific patient. Pull all columns for the patient who matches the following criteria: First_name contains an 'r' after the first two letters, Identifies their gender as 'F', born in February, May, or December, Their weight would be between 60kg and 80kg, Their patient_id is an odd number, They are from the city 'Kingston':
Q:   select * from patients where first_name like '%__r%' AND gender = 'F' AND month(birth_date) in (2, 5, 12) AND weight between 60 and 80 AND patient_id%2=1 AND city='Kingston';