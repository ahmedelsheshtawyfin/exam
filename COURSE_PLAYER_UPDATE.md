# Course Player UI Update

This update changes the enrolled-course experience from opening each lesson in a modal to a dedicated course-player page.

## Student experience
- Course content appears in a persistent sidebar grouped by module.
- The main area displays lesson text, embedded YouTube/Vimeo or direct video URLs, and file/resource links.
- PDF lessons can be previewed in-page and opened/downloaded separately.
- Students can select lessons from the curriculum sidebar.
- Marking a lesson complete records progress through the existing API and automatically opens the next lesson.
- Course progress and per-lesson completion states are displayed in the player.
- The My Learning course cards include Start learning / Continue learning actions.

## Admin content entry
Use Admin → Courses → Content to add modules and lessons. For each lesson, select Text, Video, File, or External resource and provide a Resource URL when needed.

## Deployment
No database migration is required for this UI update. Upload the updated `public/app.js`, `public/styles.css`, and `public/index.html` with the rest of the project as appropriate. The script query version was incremented to reduce stale browser cache issues.

## Notes
- YouTube and Vimeo URLs are embedded when the lesson type is Video.
- Direct MP4/WebM/OGG URLs use the native video player.
- File URLs are shown with open/download controls; PDFs additionally receive an in-page preview.
- Files must be hosted at a URL accessible to the student. This update does not add direct file uploads to Cloudflare R2.

## Branded player polish (2026-10-19)
- Refined the lesson player to match the Ahmed Finance warm ivory, charcoal and orange identity, with a more polished responsive cover, play button, timeline and control bar.
- Added Cairo alongside Inter for improved Arabic typography and bumped the app asset version to refresh browser cache.
- The YouTube IFrame API remains the playback engine for YouTube lesson URLs. YouTube branding is controlled partly by YouTube and cannot be guaranteed to disappear completely from an embedded YouTube video. For a fully unbranded player, use a direct MP4/WebM URL hosted by the platform or a video hosting service that supports white-label playback; the existing native video path already uses the platform's custom/native video surface.
- No database changes are required.
