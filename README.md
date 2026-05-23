> **Denys Yanovskyi** · QA Engineer · Warsaw  
> [kubismatism@gmail.com](mailto:kubismatism@gmail.com)

---

## About This Project

End-to-end manual QA testing of **OpenCart Demo** — a real e-commerce web application.  
Covers a full QA cycle: test planning → checklist design → execution → bug reporting.

**App under test:** https://demo.opencart.com/

---

## Key Results

| Area | Details |
|---|---|
| Bug Reports | 4 bugs found and documented (2 Major, 2 Minor) |
| Checklists | 5 checklists covering core user flows |
| API Testing | 12 test cases (GET/POST, status codes, JSON validation) |
| SQL | Data validation queries (SELECT, WHERE, JOIN, GROUP BY) |
| Test Plan | Scope, objectives, risks, and exit criteria |
| Automation | 2 Playwright + pytest test cases (login flow) |

---

## Bugs Found

### BR-002 — Major: Registration accepts invalid email format
- **Steps:** Open Registration → enter `test@@mail` → submit form
- **Expected:** Validation error, form not submitted
- **Actual:** Form accepts invalid email or shows no clear error
- **Severity:** Major | **Priority:** Medium

### BR-003 — Major: Cart allows negative product quantity
- **Steps:** Open Cart → enter `-1` in quantity field → click Update
- **Expected:** Validation error, only positive numbers allowed
- **Actual:** System accepts negative value or behaves incorrectly
- **Severity:** Major | **Priority:** Medium

### BR-001 — Minor: Success message disappears too quickly
- **Steps:** Add any product to cart → observe success message
- **Expected:** Message stays visible long enough to read
- **Actual:** Message disappears immediately
- **Severity:** Minor | **Priority:** Low

### BR-004 — Minor: No clear message when search returns no results
- **Steps:** Search for `zzzz123` → observe results page
- **Expected:** Clear message "No products found"
- **Actual:** Page does not clearly inform user about empty results
- **Severity:** Minor | **Priority:** Low

> Full bug reports in [`/Bug_Reports`](./Bug_Reports)

---

## Checklists

| Checklist | Scope |
|---|---|
| Smoke | Core app availability and navigation |
| Registration | Form validation, required fields, error messages |
| Login | Valid/invalid credentials, error handling |
| Product Page | Images, price, add to cart, UI elements |
| Shopping Cart | Quantity, update, remove, totals |

> **Note:** During smoke testing the app returned Cloudflare Error 522 (Connection timed out).  
> All items were documented as BLOCKED — reflects real QA practice when environment is unavailable.

> Full checklists in [`/Checklist`](./Checklist)

---

## Project Structure

```
qa-opencart-manual-testing/
├── Test_Plan/       # Objectives, scope, risks, entry/exit criteria
├── Checklist/       # 5 functional checklists
├── Bug_Reports/     # 4 bug reports (2 Major, 2 Minor)
├── API_Testing/     # 12 REST API test cases
├── SQL_Testing/     # Data validation queries
├── Automation/      # Playwright + pytest login tests
└── README.md
```

---

## Tools Used

Markdown · Postman · SQL · Playwright + pytest · Chrome DevTools · Git & GitHub

---

## About Me

Junior QA Engineer based in Warsaw.  
Open to junior / trainee QA positions.
