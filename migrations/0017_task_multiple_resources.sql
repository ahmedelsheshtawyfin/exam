-- Allow a task to publish multiple named file/resource links.
ALTER TABLE learning_tasks ADD COLUMN resource_links_json TEXT NOT NULL DEFAULT '[]';
