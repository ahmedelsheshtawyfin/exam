-- Optional reference/resource URL shown with a learning task.
ALTER TABLE learning_tasks ADD COLUMN resource_url TEXT NOT NULL DEFAULT '';
