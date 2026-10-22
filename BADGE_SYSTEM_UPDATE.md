# Ahmed Finance — Badge System Update

## What changed
- Added a separate badge registry and credential settings tables.
- Added per-item credential controls to course, challenge, case-study and skill-assessment editors.
- Admin can independently enable/disable the existing certificate flow and badge issuance for each supported item.
- Added badge styles using the AE identity: red for skill assessments, blue for challenges, charcoal for case studies, and charcoal/red for course completion.
- Added public badge pages at `/badge/{BADGE_ID}` with print/download support.
- Added a Badges section in the admin portal for reviewing, opening, revoking and restoring badges.
- Added an Achievement Badges section above Certificates in the student's credentials page.
- Added case-study certificate issuance through the existing learning-certificate verification page when a case is graded and meets its configured threshold.
- Existing exam certificate numbering, verification route, and email delivery code remain in place.

## Database migrations
Two migrations were added:
- `0019_learning_badges.sql`
- `0020_learning_certificate_sources.sql`

Apply migrations to the correct D1 database before deploying the Worker:

```bash
npx wrangler d1 migrations apply DB --remote
```

Then deploy the project:

```bash
npx wrangler deploy
```

For local development, use `npm run db:migrate:local` and `npm run dev`.

## Credential behavior
- Existing course/challenge certificate behavior is retained by default for items without saved credential settings.
- Saving an item writes its explicit certificate and badge choices.
- Skill assessment badges are issued only after a passing result and when badge issuance is enabled and the minimum score is met.
- Course/challenge badges are issued when the existing completion workflow marks the enrollment completed.
- Case-study badges/certificates are issued after a submission is graded and has a recorded score that meets the configured threshold.
- Badge issuance is idempotent per learner and source item; duplicate completion events do not create multiple badges.

## Notes
- The project was syntax-checked with Node.js for `src/worker.js` and `public/app.js`.
- The new migrations were validated with SQLite independently. The full historical migration chain in the supplied archive has an existing failure in `0009_certificates_schema_repair.sql` when run from a fresh scratch database; this update does not modify that historical migration. Use the already-established production D1 migration history when applying the new migrations.
