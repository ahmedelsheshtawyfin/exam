# Course Exam / Skill Assessment split

This update keeps one exam engine and separates exam visibility by type.

- Existing exams default to `assessment` and continue to appear in the general Assessments area.
- `Course Exam` is linked to one course in Admin → Exams and appears as the final module in that enrolled student's course player only.
- Course exams use the existing question manager, timer, attempt tracking, scoring and pass mark.
- The server checks enrollment and completion of all course lessons before allowing a course exam to start.
- Passing a course exam issues the existing learning-course certificate record only after all course lessons are complete. It does not issue a separate assessment certificate.
- Completing lessons alone no longer issues a course certificate. Admin cannot bypass the course exam by manually marking a course complete.
- The existing Certificates page UI has not been edited. Learning-certificate links open a digital verification record rather than a printable paper-style template.

## Deployment

1. Back up the D1 database before deploying.
2. Apply migrations in order, including `0015_course_final_exam.sql` (if not already applied) and the new `0016_exam_types_course_visibility.sql`.
3. Deploy the Worker and public assets together.
4. Test with a student enrolled in a course: complete lessons, attempt the final exam, fail once, pass on a later attempt, then confirm that the course certificate appears in the existing Certificates page. Confirm the course exam does not appear in Assessments.
5. Confirm existing Skill Assessments and previously issued certificates still display and verify normally.
