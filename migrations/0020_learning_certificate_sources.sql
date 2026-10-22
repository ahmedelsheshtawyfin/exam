
-- Extend the existing learning-certificate registry to support case-study
-- completion without changing certificate IDs, routes, or verification flow.
CREATE TABLE learning_certificates_new (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  certificate_number TEXT NOT NULL UNIQUE,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  source_type TEXT NOT NULL CHECK(source_type IN ('course','challenge','case')),
  source_id INTEGER NOT NULL,
  title TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'valid' CHECK(status IN ('valid','revoked')),
  issued_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE(user_id,source_type,source_id)
);
INSERT INTO learning_certificates_new(id,certificate_number,user_id,source_type,source_id,title,status,issued_at)
SELECT id,certificate_number,user_id,source_type,source_id,title,status,issued_at FROM learning_certificates;
DROP TABLE learning_certificates;
ALTER TABLE learning_certificates_new RENAME TO learning_certificates;
CREATE INDEX IF NOT EXISTS idx_learning_certificates_user ON learning_certificates(user_id,issued_at DESC);
