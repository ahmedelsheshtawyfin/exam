# Ahmed Finance — Fix for certificates page showing “No certificates yet”

## Root cause addressed
The recovery query previously looked only for `exams.exam_type = 'course'`. In existing deployments, a final exam may be associated with a course through `courses.final_exam_id` or `exams.course_id` even if its `exam_type` was not migrated/updated as expected. In that case, the certificates endpoint could miss a passed final exam and return an empty list.

## Fix
- Recover missing certificates for passed exams identified as course finals by any of these links: `exam_type='course'`, `exams.course_id`, or `courses.final_exam_id`.
- Use the same `ensureCertificate()` helper and shared `certificates` table.
- Classify linked course-final certificates as `Course certificate` in the student page even if an old exam row still has `exam_type='assessment'`.
- No new table or migration is added.

## Deploy
Deploy the updated `src/worker.js` and `public/app.js` from this archive. Then sign in as the student and reopen Certificates. A previously passed course final exam with certificates enabled should be recovered into the shared certificate system.

## Validation
- `node --check src/worker.js` passed.
- `node --check public/app.js` passed.
- Production data and email delivery must be verified after deployment.
