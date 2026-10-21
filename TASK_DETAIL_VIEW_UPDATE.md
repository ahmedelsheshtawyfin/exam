# Task Detail View Update

- Clicking a task card in the student Tasks workspace now opens a dedicated task-details modal instead of jumping directly to submission.
- Task details include instructions, source course/challenge/case study, due date, points, submission type, task resource link, and submission status/score/feedback when available.
- The student can start or update the submission from the task details view.
- Task entries shown inside challenge and case-study detail views also open the same task detail view.
- Added responsive styling aligned with the Ahmed Finance / Case Lab visual identity.

Validation: `node --check public/app.js` passed. Production D1/API behavior was not tested from this local package.

## Navigation and mobile access update
- Public Case Study cards now redirect signed-out visitors to Student Login before opening the case details.
- Added Case Studies to the mobile navigation drawer alongside Courses, Challenges, and Skill Assessment.
- On mobile, the header action slot shows Dashboard for signed-in students; Logout is kept in the side navigation drawer.
- Validation: `node --check public/app.js` passed. End-to-end sign-in and production deployment were not tested.
