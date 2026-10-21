-- Allow downloadable files and other resources to be attached to a specific course module.
ALTER TABLE course_resources ADD COLUMN module_id INTEGER REFERENCES course_modules(id) ON DELETE SET NULL;
CREATE INDEX IF NOT EXISTS idx_course_resources_module ON course_resources(module_id, id);
