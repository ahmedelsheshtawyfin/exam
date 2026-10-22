PRAGMA foreign_keys = ON;

-- Credential settings are separate from certificate records so the existing
-- certificate numbering, verification, and email workflow remains intact.
CREATE TABLE IF NOT EXISTS learning_credential_settings (
  source_type TEXT NOT NULL CHECK(source_type IN ('course','challenge','case','exam')),
  source_id INTEGER NOT NULL,
  certificate_enabled INTEGER NOT NULL DEFAULT 1 CHECK(certificate_enabled IN (0,1)),
  badge_enabled INTEGER NOT NULL DEFAULT 0 CHECK(badge_enabled IN (0,1)),
  badge_type TEXT NOT NULL DEFAULT 'completion' CHECK(badge_type IN ('skill','challenge','case','course','completion')),
  minimum_score REAL NOT NULL DEFAULT 0 CHECK(minimum_score BETWEEN 0 AND 100),
  badge_level TEXT NOT NULL DEFAULT 'Completion',
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY(source_type,source_id)
);

CREATE TABLE IF NOT EXISTS learning_badges (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  badge_number TEXT NOT NULL UNIQUE,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  source_type TEXT NOT NULL CHECK(source_type IN ('course','challenge','case','exam')),
  source_id INTEGER NOT NULL,
  title TEXT NOT NULL,
  badge_type TEXT NOT NULL DEFAULT 'completion',
  badge_level TEXT NOT NULL DEFAULT 'Completion',
  score REAL,
  issued_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status TEXT NOT NULL DEFAULT 'valid' CHECK(status IN ('valid','revoked')),
  UNIQUE(user_id,source_type,source_id)
);
CREATE INDEX IF NOT EXISTS idx_learning_badges_user ON learning_badges(user_id,issued_at DESC);
CREATE INDEX IF NOT EXISTS idx_learning_badges_number ON learning_badges(badge_number);
