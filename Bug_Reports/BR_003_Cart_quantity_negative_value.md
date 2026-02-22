# Bug Report: Cart allows negative product quantity

## Bug ID
BR-003

## Title
Negative quantity value can be entered in cart

## Environment
- Application: OpenCart Demo
- URL: https://demo.opencart.com/
- Browser: Microsoft Edge
- Platform: Web (Desktop)

## Preconditions
- User has at least one product in the cart
- User is on the Shopping Cart page

## Steps to Reproduce
1. Open Shopping Cart page
2. Enter a negative value (e.g. -1) in quantity field
3. Click Update button

## Actual Result
System accepts negative quantity or behaves incorrectly.

## Expected Result
Quantity field should accept only positive numbers and show validation error.

## Severity
Major

## Priority
Medium

## Notes
Incorrect quantity handling may affect order calculation and user experience.
