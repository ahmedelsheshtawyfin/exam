# Ahmed Finance — Unified course exam certificates

## What changed
- Course final exams now issue credentials through the existing `certificates` table and `ensureCertificate()` helper used by skill assessments.
- The existing `deliverCertificateEmail()` flow sends the certificate email and tracks delivery state in the same `certificates` row.
- The course exam result response now includes `result.certificate`, so the existing result UI displays the same certificate panel and `/verify/{certificate_number}` link.
- The student result-detail recovery endpoint can also recover a certificate for a passed course exam using the same system.
- Course enrollment completion is still updated after passing the final exam when all course lessons are complete.
- New course final exam passes no longer create a parallel `learning_certificates` record. Existing legacy course/challenge records remain readable for backwards compatibility.
- Admin exam settings copy now clarifies that course exams and skill assessments share the certificate system.

## Database / deployment
- No new migration or certificate table is required for this change. The shared `certificates` table and its email tracking columns are already present in the project migrations.
- Deploy the updated `src/worker.js` and `public/app.js` with the existing deployment process.
- Email delivery still depends on the existing configured Gmail relay settings and must be tested in the deployed environment.

## Validation performed
- `node --check src/worker.js`
- `node --check public/app.js`

A real issuance/email test requires a deployed Worker, a configured email relay, and a student account/course exam to complete.
