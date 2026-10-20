# Phase 2 — Course Resources (uploads + external links)

## Included
- Course-level resource section in the student course player.
- Separate resource area per module.
- Admin can add external links and upload files, assign either to the whole course or a specific module, and delete resource entries.
- Uploaded files are delivered through an authenticated endpoint; enrolled students (or admins) can download them.
- Maximum upload size: 25 MB per file.
- Migration: `migrations/0015_course_resource_files.sql`.

## Required setup for direct uploads (R2)
External links work without R2. To enable uploads from a device:

1. In Cloudflare Dashboard → R2, create a bucket named `course-resources` (or use your preferred bucket name).
2. Add this binding to `wrangler.toml`:

```toml
[[r2_buckets]]
binding = "RESOURCES"
bucket_name = "course-resources"
```

3. Apply the database migration:

```bash
npx wrangler d1 migrations apply DB --remote
```

4. Deploy the Worker after reviewing the diff:

```bash
npx wrangler deploy
```

Do not run the remote migration or deploy until you have checked that `DB` points to the intended database. No remote migration or deployment was performed as part of this file update.

## Notes
- External links are saved as links; the platform does not copy the remote file into R2.
- The upload endpoint rejects files larger than 25 MB and checks that a selected module belongs to the selected course.
- Keep the R2 bucket private; downloads should go through the Worker endpoint so enrollment checks are applied.
