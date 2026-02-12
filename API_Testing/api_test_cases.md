# API Test Cases — Reqres API

## GET /api/users?page=2

### Positive
- Verify response status code is 200
- Verify response body contains list of users
- Verify response contains user id, email, first_name, last_name
- Verify response time is acceptable

### Negative
- Send request with invalid page value
- Verify response status code is not 500

---

## GET /api/users/2

### Positive
- Verify response status code is 200
- Verify user data is returned

### Negative
- Send request with non-existing user id
- Verify response status code is 404

---

## POST /api/users

### Positive
- Create user with valid name and job
- Verify response status code is 201
- Verify response body contains id

### Negative
- Send request with empty body
- Verify API handles request correctly
