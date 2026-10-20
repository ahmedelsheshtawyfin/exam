PRAGMA foreign_keys = ON;
CREATE TABLE IF NOT EXISTS course_resource_files (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  course_id INTEGER NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
  module_id INTEGER REFERENCES course_modules(id) ON DELETE CASCADE,
  title TEXT NOT NULL,
  description TEXT NOT NULL DEFAULT '',
  storage_key TEXT,
  external_url TEXT,
  file_name TEXT,
  mime_type TEXT,
  size_bytes INTEGER NOT NULL DEFAULT 0,
  resource_type TEXT NOT NULL DEFAULT 'file' CHECK(resource_type IN ('file','link')),
  sort_order INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CHECK ((resource_type='file' AND storage_key IS NOT NULL) OR (resource_type='link' AND external_url IS NOT NULL))
);
CREATE INDEX IF NOT EXISTS idx_course_resource_files_course ON course_resource_files(course_id,module_id,sort_order,id);
