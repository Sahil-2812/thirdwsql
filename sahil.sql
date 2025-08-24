-- Step 1: Create teachers table
CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(50)
);

--  Table structure after creation:
-- | teacher_id | teacher_name |
-- |------------|--------------|
-- | (empty)    | (empty)      |


-- Step 2: Create students table with foreign key
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

--  Table structure after creation:
-- | student_id | student_name | teacher_id |
-- |------------|--------------|------------|
-- | (empty)    | (empty)      | (empty)    |


-- Step 3: Insert data into teachers
INSERT INTO teachers (teacher_id, teacher_name) VALUES
(1, 'Mr. Ali'),
(2, 'Ms. Fatima');

--  teachers table now:
-- | teacher_id | teacher_name |
-- |------------|--------------|
-- | 1          | Mr. Ali      |
-- | 2          | Ms. Fatima   |


-- Step 4: Insert data into students
INSERT INTO students (student_id, student_name, teacher_id) VALUES
(101, 'Sahil', 1),   -- Sahil’s teacher is Mr. Ali
(102, 'Ahmed', 2),   -- Ahmed’s teacher is Ms. Fatima
(103, 'Zara', 1);    -- Zara’s teacher is Mr. Ali

-- students table now:
-- | student_id | student_name | teacher_id |
-- |------------|--------------|------------|
-- | 101        | Sahil        | 1          |
-- | 102        | Ahmed        | 2          |
-- | 103        | Zara         | 1          |


-- Step 5: Join students and teachers to see relationship
SELECT 
    s.student_id, 
    s.student_name, 
    t.teacher_name
FROM students s
JOIN teachers t ON s.teacher_id = t.teacher_id;

--  Final Output:
-- | student_id | student_name | teacher_name |
-- |------------|--------------|--------------|
-- | 101        | Sahil        | Mr. Ali      |
-- | 102        | Ahmed        | Ms. Fatima   |
-- | 103        | Zara         | Mr. Ali      |
