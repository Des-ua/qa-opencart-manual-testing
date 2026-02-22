# Bug Report: Invalid email format is accepted during registration

## Bug ID
BR-002

## Title
Registration allows invalid email format

## Environment
- Application: OpenCart Demo
- URL: https://demo.opencart.com/
- Browser: Microsoft Edge
- Platform: Web (Desktop)

## Preconditions
- User is not logged in
- User is on the Registration page

## Steps to Reproduce
1. Open Registration page
2. Enter invalid email format (e.g. test@@mail)
3. Fill other mandatory fields with valid data
4. Submit the registration form

## Actual Result
Registration form accepts invalid email format or does not clearly indicate an error.

## Expected Result
System should reject invalid email format and display a validation message.

## Severity
Major

## Priority
Medium

## Notes
Incorrect email validation may lead to incorrect user data and communication issues.
