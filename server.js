require("dotenv").config();

const express = require("express");
const studentRoutes = require("./routes/students");

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.json());

// Health/root endpoint
app.get("/", (req, res) => {
  res.status(200).json({
    success: true,
    message: "Student Management REST API is running"
  });
});

// Student routes
app.use("/students", studentRoutes);

// 404 handler
app.use((req, res) => {
  res.status(404).json({
    success: false,
    message: "Route not found"
  });
});

// General error handler
app.use((err, req, res, next) => {
  console.error(err);

  res.status(err.status || 500).json({
    success: false,
    message: err.message || "Internal server error"
  });
});

app.listen(PORT, () => {
  console.log(`Server running at http://localhost:${PORT}`);
});