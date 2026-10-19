# Learning Platform Update — 19 October 2026

This update adds working learning-platform routes and admin screens to the existing Cloudflare Workers + D1 project.

## Included
- Admin management for Courses, Challenges, Case Studies, Enrollments and Tasks.
- Course editor with modules, lessons and resource links.
- Challenge settings for self-paced or fixed-cohort schedules and open, approval-based or invitation-only enrollment.
- Public catalog populated from published database records instead of hard-coded placeholder cards.
- Student My Learning view for enrolled courses/challenges, tasks and case studies.
- Student enrollment is protected by the API; joining requires a student login.
- Task submissions and admin grading/feedback.
- Case study scenario, objectives, data/resources, guided solution and optional submission. Graded cases require a submission before the solution endpoint returns the model answer.
- Learning certificates issued when an administrator marks a course/challenge enrollment completed; certificate verification page support.
- Seeded categories: Financial Accounting, Financial Analysis, Financial Modeling, Financial Planning & Analysis, and Excel & Power BI.

## Deploy safely
1. Back up the D1 database before applying migrations.
2. From the project directory, run in a terminal (not in the D1 SQL editor):
   `npx wrangler d1 migrations apply DB --remote`
3. Confirm migration `0013_learning_platform.sql` is applied successfully.
4. Deploy the worker and static assets:
   `npx wrangler deploy`
5. Open `/admin`, sign in, and create a course/challenge/case study. Set status to `published` for it to appear publicly.
6. Test student registration/login, enrollment, task submission, admin grading, marking completion and certificate verification.

The migration adds new learning tables and does not drop or rewrite existing exam, result or certificate tables. Still, take a database backup first.

## Important current behavior
- Courses, challenges and case studies are not auto-populated with sample content; the admin must create and publish real content.
- Completion certificates are issued when an administrator marks a course/challenge enrollment as `completed` from Admin → Enrollments. This is an explicit admin action until course completion rules are automated.
- The current course editor supports modules, lessons and resource URLs. Uploading files directly to Cloudflare R2 is not included; use stable HTTPS resource URLs for now.
