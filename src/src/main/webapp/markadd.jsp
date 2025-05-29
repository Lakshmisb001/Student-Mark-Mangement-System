<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student Mark - EduTrack</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #e8f5e9 0%, #dcf1e0 100%); /* Light green subtle gradient */
            padding-top: 50px;
        }
        .container {
            max-width: 1200px;
        }
        .sidebar-card {
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.08);
            margin-bottom: 30px;
            padding: 15px 0;
        }
        .sidebar-card .card-header {
            background-color: #28a745; /* Primary green for header */
            color: white;
            font-weight: 600;
            border-radius: 12px 12px 0 0;
            padding: 15px 20px;
            font-size: 1.1rem;
        }
        .nav-pills .nav-link {
            color: #495057;
            padding: 12px 20px;
            border-left: 4px solid transparent;
            transition: all 0.2s ease;
        }
        .nav-pills .nav-link.active,
        .nav-pills .nav-link:hover {
            background-color: #e6ffe6; /* Light green background on active/hover */
            color: #28a745; /* Primary green text */
            border-left-color: #28a745; /* Primary green left border */
            font-weight: 500;
        }
        .nav-pills .nav-link.active {
            background-color: #28a745; /* Solid green for active background */
            color: white;
            border-left-color: #28a745;
        }

        .form-card {
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.08);
            padding: 30px;
        }
        .form-card .card-header {
            background-color: transparent;
            color: #343a40;
            font-weight: 700;
            font-size: 1.8rem;
            border-bottom: 1px solid #e9ecef;
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-radius: 0;
        }
        .form-label {
            font-weight: 500;
            color: #343a40;
            margin-bottom: 8px;
        }
        .form-control, .form-select {
            border-radius: 8px;
            padding: 10px 15px;
            border-color: #ced4da;
            transition: border-color 0.2s ease, box-shadow 0.2s ease;
        }
        .form-control:focus, .form-select:focus {
            border-color: #28a745; /* Green focus border */
            box-shadow: 0 0 0 0.25rem rgba(40, 167, 69, 0.25); /* Green focus shadow */
        }
        .btn-primary {
            background-color: #28a745; /* Primary green */
            border-color: #28a745;
            border-radius: 8px;
            padding: 10px 25px;
            font-weight: 600;
            transition: background-color 0.2s ease, border-color 0.2s ease;
        }
        .btn-primary:hover {
            background-color: #218838; /* Darker green on hover */
            border-color: #1e7e34;
        }
        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
            border-radius: 8px;
            padding: 10px 25px;
            font-weight: 600;
            transition: background-color 0.2s ease, border-color 0.2s ease;
        }
        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #5a6268;
        }
        .alert {
            border-radius: 8px;
            font-weight: 500;
        }
        .alert-success {
            background-color: #d4edda;
            color: #155724;
            border-color: #c3e6cb;
        }
        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
            border-color: #f5c6cb;
        }
        .invalid-feedback {
            font-size: 0.875em;
        }
        /* Custom Footer Styling */
        .footer {
            background-color: #343a40;
            color: white;
            text-align: center;
            padding: 25px 0;
            margin-top: 50px;
            border-radius: 12px 12px 0 0;
            box-shadow: 0 -4px 10px rgba(0,0,0,0.05);
        }
        .footer a {
            color: #90ee90; /* Light green for links */
            text-decoration: none;
            margin: 0 10px;
            transition: color 0.3s ease;
        }
        .footer a:hover {
            color: #ffffff;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-3">
                <div class="sidebar-card">
                    <div class="card-header">
                        <i class="bi bi-list-nested me-2"></i>Navigation
                    </div>
                    <div class="card-body p-0">
                        <ul class="nav nav-pills flex-column">
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp"><i class="bi bi-house-door-fill me-2"></i>Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="markadd.jsp"><i class="bi bi-plus-circle-fill me-2"></i>Add Marks</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="markupdate.jsp"><i class="bi bi-pencil-square me-2"></i>Update Marks</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="markdelete.jsp"><i class="bi bi-trash-fill me-2"></i>Delete Marks</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="DisplayMarksServlet"><i class="bi bi-eye-fill me-2"></i>Display Marks</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="report_form.jsp"><i class="bi bi-graph-up-arrow me-2"></i>Generate Reports</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-9">
                <div class="form-card">
                    <div class="card-header">
                        <i class="bi bi-mortarboard-fill me-3"></i>Input New Student Marks
                    </div>
                    <div class="card-body">
                        <% if (request.getAttribute("successMessage") != null) { %>
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <i class="bi bi-check-circle-fill me-2"></i>
                                <%= request.getAttribute("successMessage") %>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        <% } %>
                        
                        <% if (request.getAttribute("errorMessage") != null) { %>
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <i class="bi bi-x-circle-fill me-2"></i>
                                <%= request.getAttribute("errorMessage") %>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        <% } %>
                        
                        <form action="AddMarkServlet" method="post" id="addMarkForm" class="needs-validation" novalidate>
                            <div class="mb-3">
                                <label for="studentId" class="form-label">Student ID</label>
                                <input type="text" class="form-control" id="studentId" name="studentId" placeholder="e.g., 12345" required>
                                <div class="invalid-feedback">Please enter a valid numeric Student ID.</div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="studentName" class="form-label">Student Name</label>
                                <input type="text" class="form-control" id="studentName" name="studentName" placeholder="e.g., Alice Smith" required maxlength="100">
                                <div class="invalid-feedback">Please enter a Student Name (max 100 characters).</div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="subject" class="form-label">Subject</label>
                                <select class="form-select" id="subject" name="subject" required>
                                    <option value="" selected disabled>Choose a subject</option>
                                    <option value="Mathematics">Mathematics</option>
                                    <option value="Physics">Physics</option>
                                    <option value="Chemistry">Chemistry</option>
                                    <option value="Biology">Biology</option>
                                    <option value="Computer Science">Computer Science</option>
                                    <option value="English">English</option>
                                    <option value="History">History</option>
                                    <option value="Geography">Geography</option>
                                </select>
                                <div class="invalid-feedback">Please select a Subject.</div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="marks" class="form-label">Marks (0-100)</label>
                                <input type="number" class="form-control" id="marks" name="marks" min="0" max="100" placeholder="Enter marks between 0 and 100" required>
                                <div class="invalid-feedback">Please enter Marks between 0 and 100.</div>
                            </div>
                            
                            <div class="mb-4">
                                <label for="examDate" class="form-label">Exam Date</label>
                                <input type="date" class="form-control" id="examDate" name="examDate" required>
                                <div class="invalid-feedback">Please select a valid Exam Date (cannot be in the future).</div>
                            </div>
                            
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                <button type="reset" class="btn btn-secondary me-md-2"><i class="bi bi-arrow-counterclockwise me-2"></i>Clear Form</button>
                                <button type="submit" class="btn btn-primary"><i class="bi bi-save-fill me-2"></i>Add Student Mark</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <footer class="footer">
    <div class="container">
        <p>&copy; 2024 Student Mark Management System</p>
        <p>Developed by Lakshmi - 4AL22CS080</p>
        <div>
            <a href="https://github.com/Lakshmisb001" target="_blank">
                <i class="bi bi-github me-1"></i>GitHub
            </a>
        </div>
    </div>
</footer>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        (function () {
            'use strict'
            
            var forms = document.querySelectorAll('.needs-validation')
            
            Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        form.classList.add('was-validated')
                    }, false)
                })
        })()
        
        // Additional validation for dates (cannot be in the future)
        document.getElementById('examDate').addEventListener('change', function() {
            const selectedDate = new Date(this.value);
            const today = new Date();
            today.setHours(0, 0, 0, 0); // Normalize today's date to midnight for accurate comparison
            
            if (selectedDate > today) {
                this.setCustomValidity('Exam date cannot be in the future.');
            } else {
                this.setCustomValidity('');
            }
            this.reportValidity(); // Trigger validation message immediately
        });

        // Additional validation for numeric Student ID
        document.getElementById('studentId').addEventListener('input', function () {
            const value = this.value;
            if (/^\d+$/.test(value) || value === '') {
                this.setCustomValidity('');
            } else {
                this.setCustomValidity('Student ID must contain only numbers.');
            }
            this.reportValidity(); // Trigger validation message immediately
        });
    </script>
</body>
</html>