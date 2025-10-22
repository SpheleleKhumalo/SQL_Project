CREATE TABLE job_applied(
    jib_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);

INSERT INTO job_applied(
    jib_id,
    application_sent_date,
    custom_resume,
    resume_file_name,
    cover_letter_sent,
    cover_letter_file_name,
    status
)
VALUES(
    01,
    '2025-10-14',
    true,
    'first_resume',
    true,
    'fst_cover_letter',
    'submitted'
),
(
    02,
    '2025-09-11',
    false,
    'second_resume',
    true,
    '2nd_cover_letter',
    'In progress'
),
(
    03,
    '2025-09-12',
    false,
    '3rd_resume',
    false,
    NULL,
    'rejected'
),
(
    04,
    '2025-09-25',
    true,
    '4th_resume',
    true,
    '4th_cover_letter',
    'short_listed'
);

ALTER TABLE job_applied
ADD contact VARCHAR(50);

UPDATE job_applied
SET contact = 'Sphelele Khumalo'
WHERE jib_id = 01;

UPDATE job_applied
SET contact = 'Syabonga Khumalo'
WHERE jib_id = 02;

UPDATE job_applied
SET contact = 'Sipho Hadebe'
WHERE jib_id = 03;

UPDATE job_applied
SET contact = 'Velenkosini Nkosi'
WHERE jib_id = 04;

ALTER TABLE job_applied
RENAME COLUMN jib_id TO job_id;

ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name;

SELECT*
FROM job_applied;

ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;

ALTER TABLE job_applied
DROP COLUMN contact_name;

DROP TABLE job_applied;

