# Student Management REST API

Implementation of Module 3 - Practical 1:

**Student Management REST API Using Node.js, Express.js and MySQL**

## Requirements

Install these before running:

- Node.js (LTS)
- MySQL Server
- VS Code
- Postman

Check Node.js:

```bash
node --version
npm --version
```

Check MySQL:

```bash
mysql --version
```

## 1. Create the database

Open MySQL Workbench or MySQL command line.

Run the complete `database.sql` file.

This creates:

- Database: `student_management`
- Table: `students`
- Sample records

## 2. Configure environment variables

Copy:

```text
.env.example
```

to:

```text
.env
```

Then edit `.env`.

Example:

```env
PORT=3000

DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_mysql_password
DB_NAME=student_management
DB_PORT=3306
```

Replace `your_mysql_password` with your actual MySQL password.

## 3. Install dependencies

Open a terminal inside the project folder:

```bash
npm install
```

## 4. Start the server

```bash
npm start
```

Expected output:

```text
Server running at http://localhost:3000
```

Test in browser:

```text
http://localhost:3000
```

You should get:

```json
{
  "success": true,
  "message": "Student Management REST API is running"
}
```

## 5. API endpoints

### Create student

```http
POST http://localhost:3000/students
```

JSON body:

```json
{
  "student_id": 104,
  "name": "Shreya Rai",
  "email": "shreya@example.com",
  "department": "CSE",
  "semester": 5,
  "cgpa": 8.70
}
```

Expected status: `201 Created`

---

### Get all students

```http
GET http://localhost:3000/students
```

Expected status: `200 OK`

---

### Get student by ID

```http
GET http://localhost:3000/students/101
```

Expected status: `200 OK`

---

### Update student

```http
PUT http://localhost:3000/students/101
```

JSON body:

```json
{
  "name": "Aarav Updated",
  "email": "aarav.updated@example.com",
  "department": "CSE",
  "semester": 6,
  "cgpa": 9.00
}
```

Expected status: `200 OK`

---

### Delete student

```http
DELETE http://localhost:3000/students/101
```

Expected status: `200 OK`

---

### Search by department

```http
GET http://localhost:3000/students/department/CSE
```

Expected status: `200 OK`

## 6. Important HTTP status codes

| Situation | Status |
|---|---:|
| Successful GET | 200 |
| Successful PUT | 200 |
| Successful DELETE | 200 |
| Student created | 201 |
| Invalid input | 400 |
| Student not found | 404 |
| Duplicate email/ID | 409 |
| Server/database error | 500 |

## 7. Validation included

The API checks:

- Student ID is a positive integer
- Name is required
- Email is required and has basic email format validation
- Department is required
- Semester is a positive integer
- CGPA must be between 0 and 10
- Student ID cannot be duplicated
- Email cannot be duplicated

Duplicate email is protected at both:

1. Application/API level
2. MySQL `UNIQUE` constraint

## 8. Suggested Postman test sequence

Run these in order:

1. `GET /students`
2. `POST /students`
3. `GET /students`
4. `GET /students/:id`
5. `PUT /students/:id`
6. `GET /students/department/CSE`
7. Try POST with an existing email → should return `409`
8. `DELETE /students/:id`
9. `GET /students/:id` → should return `404`

## 9. Project structure

```text
student-management-rest-api/
│
├── middleware/
│
├── routes/
│   └── students.js
│
├── .env.example
├── .gitignore
├── database.sql
├── db.js
├── package.json
├── README.md
└── server.js
```

## 10. Architecture

```text
Postman / Client
       |
       v
Express Server :3000
       |
       v
Student Routes
       |
       v
MySQL Connection Pool
       |
       v
students table
```

## Viva points

### What is REST API?

A REST API exposes resources through HTTP endpoints and uses HTTP methods such as GET, POST, PUT and DELETE.

### What does Express do?

Express is the Node.js web framework used to create the server and API routes.

### Why use `mysql2`?

`mysql2` allows Node.js to communicate with MySQL and supports promise-based queries.

### Why use a connection pool?

A pool manages multiple database connections efficiently instead of creating a new connection for every request.

### Why is email UNIQUE?

It prevents two student records from having the same email address.

### Why POST for create?

POST is conventionally used to create a new resource.

### Why PUT for update?

PUT is used to update an existing resource.

### Why DELETE?

DELETE removes an existing resource.

### Why 409 for duplicate email?

HTTP 409 Conflict indicates that the request conflicts with the current state of the resource.

### Why parameterized queries?

Queries use `?` placeholders so user input is passed separately from SQL, reducing SQL injection risk.

## Assignment coverage

This implementation covers the assignment requirements:

- Express server on port 3000
- MySQL connection
- Students table
- GET, POST, PUT and DELETE
- Department search
- Required-field validation
- Duplicate email prevention
- JSON responses and HTTP status codes
- Postman testing
