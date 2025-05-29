<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.StudentMark" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Student Mark - EduTrack System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body {
            font-family: 'Lato', sans-serif;
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
            background-color: #28a745; /* Primary green for sidebar header */
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
            color: #28a745; /* Primary green text */
            border-left-color: #28a745; /* Primary green left border */
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
            color: #dc3545; /* Retained red for deletion context */
            font-weight: 700;
            font-size: 1.8rem;
            border-bottom: 1px solid #f8d7da; /* Light red border */
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-radius: 0;
        }
        .form-label {
            font-weight: 500;
            color: #343a40;
            margin-bottom: 8px;
        }
        .form-control {
            border-radius: 8px;
            padding: 10px 15px;
            border-color: #ced4da;
            transition: border-color 0.2s ease, box-shadow 0.2s ease;
        }
        .form-control:focus {
            border-color: #28a745; /* Green focus border */
            box-shadow: 0 0 0 0.25rem rgba(40, 167, 69, 0.25); /* Green focus shadow */
        }
        /* Adjusted primary button to green, but keeping danger button red */
        .btn-primary {
            background-color: #28a745; /* Primary green */
            border-color: #28a745;
            border-radius: 8px;
            padding: 10px 25px;
            font-weight: 600;
        }
        .btn-primary:hover {
            background-color: #218838;
            border-color: #218838;
        }
        .btn-danger {
            background-color: #dc3545; /* Red danger - important for delete action */
            border-color: #dc3545;
            border-radius: 8px;
            padding: 10px 25px;
            font-weight: 600;
        }
        .btn-danger:hover {
            background-color: #c82333;
            border-color: #c82333;
        }
        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
            border-radius: 8px;
            padding: 10px 25px;
            font-weight: 600;
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
        .alert-warning {
            background-color: #fff3cd;
            color: #664d03;
            border-color: #ffecb5;
        }
        .student-info {
            background-color: #fefefe;
            border: 1px solid #ffeeba; /* Light yellow border */
            border-radius: 10px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }
        .student-info h5 {
            color: #dc3545; /* Red for warning text within student info */
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }
        .student-info h5 i {
            font-size: 1.8rem;
            margin-right: 10px;
        }
        .student-info p {
            margin-bottom: 8px;
        }
        .search-card {
            background-color: #eaf6ff; /* Light blue search card */
            border: 1px solid #cce5ff;
            border-radius: 10px;
            margin-bottom: 25px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }
        .search-card .card-header {
            background-color: #28a745; /* Primary green for search header */
            color: white;
            font-weight: 600;
            border-radius: 10px 10px 0 0;
            padding: 15px 20px;
            font-size: 1rem;
        }
        .search-card .btn-warning {
            background-color: #ffc107; /* Still yellow for search button */
            border-color: #ffc107;
            color: #212529;
            font-weight: 600;
            border-radius: 8px;
        }
        .search-card .btn-warning:hover {
            background-color: #e0a800;
            border-color: #d39e00;
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
            font-size: 3rem;
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
                                <a class="nav-link" href="markupdate.jsp"><i class="bi bi-pencil-square me-2"></i>Update Marks</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="markdelete.jsp"><i class="bi bi-trash-fill me-2"></i>Delete Marks</a>
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
                        <i class="bi bi-person-x-fill me-3"></i>Delete Student Record
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
                                <i class="bi bi-search me-2"></i>Find Student by ID
                            </div>
                            <div class="card-body">
                                <form action="DeleteMarkServlet" method="get" class="d-flex">
                                    <input type="number" class="form-control me-2" name="studentId" placeholder="Enter Student ID to search" required>
                                    <button type="submit" class="btn btn-warning"><i class="bi bi-search me-2"></i>Search</button>
                                </form>
                            </div>
                        </div>
                        
                        <%
                            StudentMark studentMark = (StudentMark) request.getAttribute("studentMark");
                            if (studentMark != null) {
                                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                        %>
                        
                        <div class="student-info">
                            <h5><i class="bi bi-exclamation-triangle-fill"></i> Record Found for Deletion</h5>
                            <div class="row">
                                <div class="col-md-6">
                                    <p><strong>Student ID:</strong> <%= studentMark.getStudentId() %></p>
                                    <p><strong>Student Name:</strong> <%= studentMark.getStudentName() %></p>
                                </div>
                                <div class="col-md-6">
                                    <p><strong>Subject:</strong> <%= studentMark.getSubject() %></p>
                                    <p><strong>Marks:</strong> <%= studentMark.getMarks() %></p>
                                    <p><strong>Exam Date:</strong> <%= dateFormat.format(studentMark.getExamDate()) %></p>
                                </div>
                            </div>
                        </div>
                        
                        <div class="alert alert-danger" role="alert">
                            <h6 class="alert-heading"><i class="bi bi-shield-fill-exclamation me-2"></i>Critical Warning!</h6>
                            This action will **permanently delete** the selected student record from the system. This operation **cannot be reversed**. Please proceed with extreme caution.
                        </div>
                        
                        <form action="DeleteMarkServlet" method="post" id="deleteForm" class="needs-validation" novalidate>
                            <input type="hidden" name="studentId" value="<%= studentMark.getStudentId() %>">
                            
                            <div class="mb-4">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="confirmDelete" name="confirmation" value="yes" required>
                                    <label class="form-check-label text-danger fw-bold" for="confirmDelete">
                                        I understand and **confirm** that I want to permanently delete this student record.
                                    </label>
                                    <div class="invalid-feedback">You must check this box to confirm deletion.</div>
                                </div>
                            </div>
                            
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                <a href="markdelete.jsp" class="btn btn-secondary me-md-2"><i class="bi bi-x-circle-fill me-2"></i>Cancel</a>
                                <button type="submit" class="btn btn-danger" id="deleteBtn" disabled><i class="bi bi-trash-fill me-2"></i>Delete Record Now</button>
                            </div>
                        </form>
                        
                        <% } else { %>
                        
                        <div class="empty-state">
                            <i class="bi bi-search"></i>
                            <h5>No Record Selected for Deletion</h5>
                            <p>To delete a student's mark, please enter their **Student ID** in the search box above and click "Search".</p>
                            <p>The system will then display the matching record for your review and confirmation before deletion.</p>
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
        // Enable delete button only when confirmation checkbox is checked
        document.getElementById('confirmDelete')?.addEventListener('change', function() {
            document.getElementById('deleteBtn').disabled = !this.checked;
        });
        
        // Add Bootstrap's form validation for the confirmation checkbox
        var deleteForm = document.getElementById('deleteForm');
        if (deleteForm) {
            deleteForm.addEventListener('submit', function (event) {
                if (!deleteForm.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                } else {
                    // Additional JavaScript confirmation for critical action
                    if (!confirm('You are about to permanently delete this student record. This action cannot be undone. Are you absolutely sure you want to proceed?')) {
                        event.preventDefault();
                    }
                }
                deleteForm.classList.add('was-validated');
            }, false);
        }

        // Basic validation for the search form (ensure it's a number)
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