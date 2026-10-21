# Course lesson files and links update — 2026-10-21

- Kept the existing lesson-as-file workflow and the PDF badge above the lesson title.
- Removed the large embedded PDF viewer from file lessons.
- Replaced the two `Open file` / `Download file` actions with one `Download` action.
- Added a `Lesson links & files` block to the lesson page. It lists all resources assigned to the current lesson's module, with one download/open action per resource.
- Admins can add multiple links using Admin → Courses → Content → Add resource and assign each link to the relevant module. Existing lessons, modules, and resources are preserved.
- No database migration is introduced by this visual update. If the `0018_course_resources_module.sql` migration from the previous package has not been run, run it once before relying on module-assigned resources.
