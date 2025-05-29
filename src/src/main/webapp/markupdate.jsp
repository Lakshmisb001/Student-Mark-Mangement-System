<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.StudentMark" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Student Mark - EduTrack System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #e8f5e9 0%, #dcf1e0 100%); /* Light green gradient */
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
            background-color: #28a745; /* Success green for sidebar */
            color: white;
            font-weight: 700;
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
            background-color: #e6ffe6; /* Light green on active/hover */
            color: #28a745; /* Green text */
            border-left-color: #28a745; /* Green left border */
            font-weight: 500;
        }
        .nav-pills .nav-link.active {
            background-color: #28a745;
            color: white;
            border-left-color: #28a745;
        }

        .main-card {
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.08);
            padding: 30px;
        }
        .main-card .card-header {
            background-color: transparent;
            color: #007bff; /* Primary blue for main header */
            font-weight: 700;
            font-size: 1.8rem;
            border-bottom: 1px solid #cce5ff;
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
            border-color: #86b7fe;
            box-shadow: 0 0 0 0.25rem rgba(0, 123, 255, 0.25);
        }
        .form-control[readonly] {
            background-color: #e9ecef; /* Light gray for readonly fields */
            cursor: not-allowed;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            border-radius: 8px;
            padding: 10px 25px;
            font-weight: 600;
            transition: background-color 0.2s ease, border-color 0.2s ease;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
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
        .search-card {
            background-color: #f0f7f4; /* Subtle green background for search */
            border: 1px solid #d4edda;
            border-radius: 10px;
            margin-bottom: 25px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }
        .search-card .card-header {
            background-color: #28a745; /* Success green for search header */
            color: white;
            font-weight: 600;
            border-radius: 10px 10px 0 0;
            padding: 15px 20px;
            font-size: 1rem;
        }
        .search-card .btn-success {
             background-color: #28a745; /* Green search button */
             border-color: #28a745;
             font-weight: 600;
             border-radius: 8px;
             padding: 10px 20px;
        }
        .search-card .btn-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }
        .empty-state {
            padding: 40px;
            text-align: center;
            color: #6c757d;
            background-color: #f8f9fa;
            border-radius: 10px;
            border: 1px dashed #ced4da;
            margin-top: 20px;
        }
        .empty-state i {
            font-size: 3.5rem;
            margin-bottom: 15px;
            color: #adb5bd;
        }
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
            color: #90ee90;
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
                        <i class="bi bi-list-nested me-2"></i>Navigation Menu
                    </div>
                    <div class="card-body p-0">
                        <ul class="nav nav-pills flex-column">
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp"><i class="bi bi-house-door-fill me-2"></i>Dashboard</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="markadd.jsp"><i class="bi bi-plus-circle-fill me-2"></i>Add Marks</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="markupdate.jsp"><i class="bi bi-pencil-square me-2"></i>Update Marks</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="markdelete.jsp"><i class="bi bi-trash-fill me-2"></i>Delete Marks</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="DisplayMarksServlet"><i class="bi bi-eye-fill me-2"></i>Display All Marks</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="report_form.jsp"><i class="bi bi-graph-up-arrow me-2"></i>Generate Reports</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-9">
                <div class="main-card">
                    <div class="card-header">
                        <i class="bi bi-pencil-square me-3"></i>Modify Student Mark Record
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
                        
                        <div class="search-card">
                            <div class="card-header">
                                <i class="bi bi-search me-2"></i>Find Student to Update
                            </div>
                            <div class="card-body">
                                <form action="UpdateMarkServlet" method="get" class="d-flex">
                                    <input type="number" class="form-control me-2" name="studentId" placeholder="Enter Student ID to find record" required>
                                    <button type="submit" class="btn btn-success"><i class="bi bi-search me-2"></i>Search</button>
                                </form>
                            </div>
                        </div>
                        
                        <%
                            StudentMark studentMark = (StudentMark) request.getAttribute("studentMark");
                            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                            
                            if (studentMark != null) {
                        %>
                        
                        <form action="UpdateMarkServlet" method="post" id="updateMarkForm" class="needs-validation" novalidate>
                            <div class="mb-3">
                                <label for="studentId" class="form-label">Student ID</label>
                                <input type="number" class="form-control" id="studentId" name="studentId" 
                                       value="<%= studentMark.getStudentId() %>" 
                                       readonly>
                                <div class="form-text">Student ID cannot be changed. Search for a new ID to update a different record.</div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="studentName" class="form-label">Student Name</label>
                                <input type="text" class="form-control" id="studentName" name="studentName" 
                                       value="<%= studentMark.getStudentName() %>" required maxlength="100">
                                <div class="invalid-feedback">Please enter a Student Name (max 100 characters).</div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="subject" class="form-label">Subject</label>
                                <select class="form-select" id="subject" name="subject" required>
                                    <option value="" disabled>Select a subject</option>
                                    <option value="Mathematics" <%= "Mathematics".equals(studentMark.getSubject()) ? "selected" : "" %>>Mathematics</option>
                                    <option value="Physics" <%= "Physics".equals(studentMark.getSubject()) ? "selected" : "" %>>Physics</option>
                                    <option value="Chemistry" <%= "Chemistry".equals(studentMark.getSubject()) ? "selected" : "" %>>Chemistry</option>
                                    <option value="Biology" <%= "Biology".equals(studentMark.getSubject()) ? "selected" : "" %>>Biology</option>
                                    <option value="Computer Science" <%= "Computer Science".equals(studentMark.getSubject()) ? "selected" : "" %>>Computer Science</option>
                                    <option value="English" <%= "English".equals(studentMark.getSubject()) ? "selected" : "" %>>English</option>
                                    <option value="History" <%= "History".equals(studentMark.getSubject()) ? "selected" : "" %>>History</option>
                                    <option value="Geography" <%= "Geography".equals(studentMark.getSubject()) ? "selected" : "" %>>Geography</option>
                                </select>
                                <div class="invalid-feedback">Please select a Subject.</div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="marks" class="form-label">Marks (0-100)</label>
                                <input type="number" class="form-control" id="marks" name="marks" min="0" max="100" 
                                       value="<%= studentMark.getMarks() %>" required>
                                <div class="invalid-feedback">Please enter Marks between 0 and 100.</div>
                            </div>
                            
                            <div class="mb-4">
                                <label for="examDate" class="form-label">Exam Date</label>
                                <input type="date" class="form-control" id="examDate" name="examDate" 
                                       value="<%= dateFormat.format(studentMark.getExamDate()) %>" required>
                                <div class="invalid-feedback">Please select a valid Exam Date (cannot be in the future).</div>
                            </div>
                            
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                <button type="reset" class="btn btn-secondary me-md-2"><i class="bi bi-arrow-counterclockwise me-2"></i>Reset Fields</button>
                                <button type="submit" class="btn btn-primary"><i class="bi bi-save-fill me-2"></i>Update Mark</button>
                            </div>
                        </form>
                        
                        <% } else { %>
                        
                        <div class="empty-state">
                            <i class="bi bi-question-circle"></i>
                            <h5>No Student Mark Loaded for Update</h5>
                            <p>To update a student's mark, please enter their **Student ID** in the search box above and click "Search".</p>
                            <p>Once found, the form will automatically populate with their current details, allowing you to make modifications.</p>
                        </div>
                        
                        <% } %>
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
        // Example starter JavaScript for disabling form submissions if there are invalid fields
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

        // Basic validation for search form (ensure it's a number)
        document.querySelector('.search-card form').addEventListener('submit', function(event) {
            const studentIdInput = this.querySelector('input[name="studentId"]');
            if (!studentIdInput.value || !/^\d+$/.test(studentIdInput.value)) {
                event.preventDefault();
                alert('Please enter a valid numeric Student ID to search.');
                studentIdInput.focus();
            }
        });
    </script>
</body>
</html>