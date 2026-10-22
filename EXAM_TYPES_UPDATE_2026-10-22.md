# Exam Type Selection Update — 2026-10-22

The Admin → Exams → New/Edit Exam form now supports four exam types:
- Skill Assessment (standalone)
- Course (linked to a course)
- Challenge (linked to a challenge)
- Training Case (linked to a case study)

Challenge and Training Case exams are stored as the existing `assessment` exam type in the database and linked through `learning_final_exams`; this preserves compatibility with the current schema and uses the existing exam engine. The selected learning item is linked automatically when the exam is saved. Admins can set maximum attempts for challenge/case final exams (`0` means unlimited).

The Exams list now displays the linked learning type and title. The Link Learning Exams picker excludes exams already linked to a different learning item.

No new migration is required; this update uses the existing `0019_learning_final_exams.sql` schema.

Validation performed: `node --check public/app.js` and `node --check src/worker.js`.
