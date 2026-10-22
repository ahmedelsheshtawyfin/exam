# Unified Learning Final Exams & Certificates — 2026-10-22

## What changed
- Added `learning_final_exams` to link one final exam to a Course, Challenge, or Case Study.
- Existing course final exams are carried into the new link table by migration `0019_learning_final_exams.sql`.
- Added Admin → Exams → **Link Learning Exams** to link/unlink content, choose the final exam, and configure maximum attempts.
- Maximum attempts: `0` means unlimited; `1–100` means total attempts, including the first attempt.
- Linked learning exams are hidden from the general Skill Assessments list.
- Course final exams remain locked until all course lessons are complete.
- Challenge final exams remain locked until the student is enrolled and all required challenge tasks have submissions.
- Case Study final exams remain locked until required case tasks have submissions and the student submits their case analysis.
- A passing attempt issues a regular `certificates` record, using the same printable/verification certificate page as Skill Assessments. The certificate title is set to the linked learning item's title.
- Failed attempts do not issue certificates. Students can retake after failing until they reach the configured attempt limit.
- A challenge enrollment is marked completed only after the linked final exam is passed. Admin cannot manually mark a linked Course/Challenge complete before the exam is passed.
- Legacy Course/Challenge certificates are also rendered using the shared printable certificate page.

## Files changed
- `src/worker.js`
- `public/app.js`
- `migrations/0019_learning_final_exams.sql`
- `UNIFIED_LEARNING_EXAMS_CERTIFICATES_UPDATE_2026-10-22.md`
- `UPLOAD_THIS_VERSION.txt`

## Deployment
1. Apply the new D1 migration to the production database:
   `npm run db:migrate:remote`
2. Deploy the updated Worker and static assets:
   `npm run deploy`
3. In Admin → Exams, use **Link Learning Exams** to connect Skill Assessment exams to Challenges and Case Studies. Courses can use their existing Course Exam or be linked in the same manager.
4. Ensure each linked exam is Active and has questions and a passing percentage configured.

## Validation performed
- `node --check src/worker.js`
- `node --check public/app.js`
- Standalone SQLite syntax check for migration `0019_learning_final_exams.sql`

Production D1 migration and live browser flow were not run from this workspace.
