# Course content editing after publishing — 2026-10-21

## What changed
- Added admin `PUT` endpoints to edit existing course modules, lessons, and resources without deleting/recreating them.
- Updated Admin → Courses → Content manager with Edit buttons for modules, lessons, and resources.
- Module editor updates title, description, and display order.
- Lesson editor updates module assignment, title, content, type, URL, and display order.
- Resource editor updates title, URL, type, and the module it belongs to (or moves it to course-level sources).
- Updates are in-place and preserve record IDs, so existing course enrollment and progress records are not reset by editing.
- No additional database migration is required for these edit features; they use existing fields and the `0018_course_resources_module.sql` migration already included in this project version for module-linked resources must already be applied if using that feature.

## Deploy
Deploy `src/worker.js` and `public/app.js` (or the full project package). Sign in as admin → Courses → Content, then use **Edit module**, **Edit** beside a lesson, or **Edit** beside a resource.
