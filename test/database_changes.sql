Generate Reference Data View
---------------------------------------------------------------------
Create view reference_data as
SELECT applicant_id, reference1_filename as reference_filename, reference1_first as reference_first, reference1_last as reference_last, reference1_email as reference_email, reference1_online as reference_online  FROM applicants
UNION
SELECT applicant_id, reference2_filename as reference_filename, reference2_first as reference_first, reference2_last as reference_last, reference2_email as reference_email, reference2_online as reference_online  FROM applicants
UNION
SELECT applicant_id, reference3_filename as reference_filename, reference3_first as reference_first, reference3_last as reference_last, reference3_email as reference_email, reference3_online as reference_online  FROM applicants
UNION
SELECT applicant_id, reference_filename, reference_first, reference_last, reference_email, reference_online FROM extrareferences;



Generate References
--------------------------------------------------------------------------
Create view applicant_references as
SELECT a.applicant_id, CONCAT(a.given_name, " ", a.family_name) as applicant_name, b.reference_filename, CONCAT(b.reference_first, " ", b.reference_last) as reference_name, b.reference_email,
STR_TO_DATE(RIGHT(SUBSTR( b.reference_filename , 1, CHAR_LENGTH(b.reference_filename) - 4), 10 ), '%m-%d-%Y') as recommendation_submission_date, b.reference_online as reference_online
FROM applicants a
JOIN
reference_data b
ON
a.applicant_id = b.applicant_id;


Generate Applicant Academic
--------------------------------------------------------------------------------
ALTER ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `applicant_academic` AS select `a`.`applicant_id` AS `applicant_id`,`a`.`application_payment_method` AS `application_payment_method`,`a`.`has_been_submitted` AS `has_been_submitted`,`a`.`date_of_birth` AS `date_of_birth`,concat(`a`.`given_name`,_latin1' ',`a`.`middle_name`,_latin1'',`a`.`family_name`) AS `applicant_name`,`a`.`given_name` AS `given_name`,`a`.`family_name` AS `family_name`,`p`.`academic_program` AS `academic_program`,`a`.`application_submit_date` AS `application_submit_date`,`p`.`start_semester` AS `start_semester`,`p`.`start_year` AS `start_year`,`a`.`application_fee_payment_status` AS `application_fee_payment_status`,`p`.`student_type` AS `student_type`,`p`.`attendance_load` AS `attendance_load`,`a`.`email` AS `email`,`a`.`essay_file_name` AS `essay_file_name`,`a`.`resume_file_name` AS `resume_file_name`,`a`.`application_process_status` AS `status` from (`applicants` `a` left join `appliedprograms` `p` on((`a`.`applicant_id` = `p`.`applicant_id`)))