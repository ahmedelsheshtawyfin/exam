# Course curriculum + video player fix (2026-10-21)

## Changes
- Guarded YouTube IFrame API calls until the player reports ready and confirmed that methods such as `getDuration()` exist before calling them. This prevents `d.player.getDuration is not a function` during player initialization.
- Updated the course curriculum in both the course detail view and the enrolled course player. Lessons show a type icon (video, file, or text), and module-specific resources/downloads appear underneath the relevant module.
- Added an optional module assignment when admins add a course resource. Resources without a module appear under a separate **Sources** accordion.
- Added migration `0018_course_resources_module.sql` to support `course_resources.module_id`.
- Bumped the app script cache version to `v30.0`.

## Deployment
1. Apply `migrations/0018_course_resources_module.sql` once to the production D1 database. It adds a nullable `module_id` column and an index; existing course resources remain intact.
2. Deploy the updated `src/worker.js` and `public/` files.
3. Hard refresh the browser if the previous JavaScript is cached.
4. In Admin → Courses → Content, when adding a resource, select the module it belongs to. It will then show under that module as a source/download, not as a lesson. Leave the selection on “Course-level sources” to keep it in the separate Sources accordion.

No existing lesson or resource records are deleted or converted.
