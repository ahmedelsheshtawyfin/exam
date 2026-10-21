ALTER TABLE courses ADD COLUMN final_exam_id INTEGER REFERENCES exams(id) ON DELETE SET NULL;
CREATE INDEX IF NOT EXISTS idx_courses_final_exam ON courses(final_exam_id);
