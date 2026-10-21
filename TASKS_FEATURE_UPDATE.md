# Required Tasks for Student Challenges

This update adds a student-facing task workflow to the existing learning platform.

## Included
- A required-task count and remaining-task count on the student dashboard.
- A dashboard shortcut to the dedicated `/challenges` student workspace.
- A challenge workspace showing each joined challenge, its required-task count, submitted/remaining totals, due dates, resource links, submission state, and instructor feedback.
- Task submission uses the existing `/api/learning/tasks/:id/submit` endpoint and the existing task-submission modal.
- Submission refreshes the currently open student task view.
- Responsive styling for desktop and mobile, matching the Ahmed Finance design system.

## Data and migration
No new database schema is introduced. The feature uses the existing `learning_tasks` and `task_submissions` tables and `/api/student/learning` response. Ensure all existing project migrations, including `0014_task_resource_url.sql`, have been applied to the target D1 database.

## Validation performed
- `node --check public/app.js` passed.
- The ZIP was created from the full project source.
- The deployed Cloudflare Worker and live D1 database were not changed or remotely tested by this package build.
