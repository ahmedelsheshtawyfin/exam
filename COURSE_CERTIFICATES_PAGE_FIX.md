# Ahmed Finance — Certificates page recovery fix

## Problem addressed
A learner could pass a course final exam and have a certificate associated with the result, but older successful course-exam attempts created before the unified certificate flow might not have a row in the shared `certificates` table. The student Certificates page reads that shared table, so those older attempts could be missing from the list.

## Fix
- The authenticated `GET /api/certificates` endpoint now checks for passed course-final-exam results that do not yet have a shared certificate.
- It issues the missing certificate through the existing `ensureCertificate()` helper and existing `certificates` table.
- For newly recovered certificates, it attempts email delivery using the existing `deliverCertificateEmail()` flow and configured Gmail relay.
- The recovery is idempotent because certificate issuance is keyed by `attempt_id`; repeat page visits do not create duplicate certificates or re-send mail for an already existing certificate.
- The student Certificates page labels shared course-final-exam certificates as “Course certificate”.

## Database/deployment
- No new table or migration is added.
- Deploy the updated `src/worker.js` and `public/app.js`.
- Email recovery depends on the existing `GMAIL_APPS_SCRIPT_URL` and `GMAIL_APPS_SCRIPT_TOKEN` Worker settings.

## Validation
- `node --check src/worker.js` passed.
- `node --check public/app.js` passed.
- Production database issuance and real email delivery still require testing in the deployed Cloudflare environment.
