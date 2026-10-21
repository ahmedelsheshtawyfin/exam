# Required Tasks Workspace Update

- Added a dedicated student Tasks page at `/tasks`, linked from the dashboard.
- Dashboard task tile shows the remaining required-task count and opens the unified task workspace.
- Unified workspace includes required tasks from enrolled courses, joined challenges, and published case studies, with status, due date, points, resource links, and submission/update actions.
- My Challenges cards now show related task counts and quick submission actions; challenge details also show task resource links.
- Published case-study details show their required tasks. Case-linked tasks can be submitted by signed-in students without requiring course/challenge enrollment.
- Student learning API includes case-study task counts and case task submissions.
- Admin task list now displays the related case study and supports assigning tasks to a course, challenge, or case study.
- No new database migration was added; the existing `learning_tasks.case_study_id`, `resource_url`, and submission tables are reused.

Validation: `node --check public/app.js` and `node --check src/worker.js` passed. Runtime behavior against the production Cloudflare D1 database has not been exercised from this local package.
