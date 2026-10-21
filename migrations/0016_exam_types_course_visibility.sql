-- Keep existing exams as Skill Assessments. Course exams are private to one course.
ALTER TABLE exams ADD COLUMN exam_type TEXT NOT NULL DEFAULT 'assessment' CHECK (exam_type IN ('assessment','course'));
ALTER TABLE exams ADD COLUMN course_id INTEGER REFERENCES courses(id) ON DELETE SET NULL;
CREATE INDEX IF NOT EXISTS idx_exams_type_course ON exams(exam_type, course_id);

-- Upgrade any course exams that were already linked by the earlier final_exam_id field.
UPDATE exams
SET exam_type = 'course',
    course_id = (SELECT c.id FROM courses c WHERE c.final_exam_id = exams.id LIMIT 1)
WHERE id IN (SELECT final_exam_id FROM courses WHERE final_exam_id IS NOT NULL);
