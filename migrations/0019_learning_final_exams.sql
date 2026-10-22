-- Unified final exam links for courses, challenges and case studies.
-- max_attempts = 0 means unlimited retries; otherwise this is the total allowed attempts.
CREATE TABLE IF NOT EXISTS learning_final_exams (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  source_type TEXT NOT NULL CHECK(source_type IN ('course','challenge','case')),
  source_id INTEGER NOT NULL,
  exam_id INTEGER NOT NULL UNIQUE REFERENCES exams(id) ON DELETE CASCADE,
  max_attempts INTEGER NOT NULL DEFAULT 0 CHECK(max_attempts >= 0),
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE(source_type, source_id)
);
CREATE INDEX IF NOT EXISTS idx_learning_final_exams_source ON learning_final_exams(source_type, source_id);

-- Preserve course final exams that were already configured in the existing platform.
INSERT OR IGNORE INTO learning_final_exams(source_type, source_id, exam_id, max_attempts)
SELECT 'course', id, final_exam_id, 0
FROM courses
WHERE final_exam_id IS NOT NULL;

-- Use the linked course title on the shared certificate page for existing course final exams.
UPDATE exams SET certificate_title=(SELECT title FROM courses WHERE courses.final_exam_id=exams.id)
WHERE id IN (SELECT final_exam_id FROM courses WHERE final_exam_id IS NOT NULL);
