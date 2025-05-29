<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.StudentMark" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Student Marks - EduTrack System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background: linear-gradient(135deg, #e8f5e9 0%, #dcf1e0 100%); /* Light green subtle gradient */
            padding-top: 50px;
        }
        .container {
            max-width: 1300px;
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
            color: #28a745; /* Primary green for main header */
            font-weight: 700;
            font-size: 1.8rem;
            border-bottom: 1px solid #c3e6cb; /* Light green border */
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
        .btn-primary {
            background-color: #28a745; /* Primary green */
            border-color: #28a745;
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: 600;
        }
        .btn-primary:hover {
            background-color: #218838;
            border-color: #218838;
        }
        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: 600;
        }
        .btn-success:hover {
            background-color: #218838;
            border-color: #218838;
        }
        .btn-outline-secondary {
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: 600;
        }
        .btn-warning {
            background-color: #ffc107;
            border-color: #ffc107;
            color: #212529;
            border-radius: 8px;
            padding: 8px 15px;
            font-weight: 600;
        }
        .btn-warning:hover {
            background-color: #e0a800;
            border-color: #d39e00;
        }
        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
            border-radius: 8px;
            padding: 8px 15px;
            font-weight: 600;
        }
        .btn-danger:hover {
            background-color: #c82333;
            border-color: #c82333;
        }
        .alert {
            border-radius: 8px;
            font-weight: 500;
        }
        .alert-danger {
            background-color: #f8d7da;
            color: #721c24;
            border-color: #f5c6cb;
        }
        .search-card {
            background-color: #e6ffe6; /* Light green for search card */
            border: 1px solid #c3e6cb; /* Green border */
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
        .table-responsive {
            border-radius: 8px;
            overflow: hidden;
            border: 1px solid #dee2e6;
        }
        .table {
            margin-bottom: 0;
        }
        .table thead th {
            background-color: #28a745; /* Primary green for table header */
            color: white;
            border: none;
            vertical-align: middle;
        }
        .table tbody tr:hover {
            background-color: #f0f8ff; /* Light hover effect */
        }
        .table td, .table th {
            padding: 12px;
            vertical-align: middle;
        }
        .badge {
            font-size: 0.85em;
            padding: 0.5em 0.8em;
            border-radius: 0.35rem;
            font-weight: 600;
        }
        /* Adjusted badge-info for better green theme integration */
        .badge.bg-info {
            background-color: #17a2b8 !important; /* Retain Bootstrap's info blue for subjects */
            color: white !important;
        }
        .single-result-card {
            border: 1px solid #c3e6cb; /* Light green border for single result */
            background-color: #e6ffe6; /* Very light green background */
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
        }
        .single-result-card h5 {
            color: #28a745; /* Primary green for heading */
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }
        .single-result-card h5 i {
            font-size: 1.8rem;
            margin-right: 10px;
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
                                <a class="nav-link" href="markupdate.jsp"><i class="bi bi-pencil-square me-2"></i>Update Marks</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="markdelete.jsp"><i class="bi bi-trash-fill me-2"></i>Delete Marks</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="DisplayMarksServlet"><i class="bi bi-eye-fill me-2"></i>Display All Marks</a>
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
                        <i class="bi bi-journals me-3"></i>View Student Examination Records
                    </div>
                    <div class="card-body">
                        <% if (request.getAttribute("errorMessage") != null) { %>
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <i class="bi bi-x-circle-fill me-2"></i>
                                <%= request.getAttribute("errorMessage") %>
                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        <% } %>
                        
                        <div class="search-card">
                            <div class="card-header">
                                <i class="bi bi-filter-circle-fill me-2"></i>Filter or Search Records
                            </div>
                            <div class="card-body">
                                <form action="DisplayMarksServlet" method="get" class="d-flex">
                                    <input type="number" class="form-control me-2" name="studentId" placeholder="Enter Student ID to search" value="<%= request.getParameter("studentId") != null ? request.getParameter("studentId") : "" %>">
                                    <button type="submit" class="btn btn-primary me-2"><i class="bi bi-search me-2"></i>Search</button>
                                    <a href="DisplayMarksServlet" class="btn btn-outline-secondary"><i class="bi bi-arrow-counterclockwise me-2"></i>Show All</a>
                                </form>
                            </div>
                        </div>
                        
                        <%
                            StudentMark studentMark = (StudentMark) request.getAttribute("studentMark");
                            List<StudentMark> marksList = (List<StudentMark>) request.getAttribute("marksList");
                            Boolean searchPerformed = (Boolean) request.getAttribute("searchPerformed");
                            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                            
                            if (studentMark != null) {
                        %>
                        
                        <div class="single-result-card">
                            <h5><i class="bi bi-person-fill me-2"></i>Search Result for Student ID: <%= studentMark.getStudentId() %></h5>
                            <div class="row">
                                <div class="col-md-6">
                                    <p><strong>Student Name:</strong> <%= studentMark.getStudentName() %></p>
                                    <p><strong>Subject:</strong> <span class="badge bg-info"><%= studentMark.getSubject() %></span></p>
                                </div>
                                <div class="col-md-6">
                                    <p><strong>Marks:</strong> 
                                        <span class="badge <%= studentMark.getMarks() >= 80 ? "bg-success" : studentMark.getMarks() >= 60 ? "bg-warning text-dark" : "bg-danger" %>">
                                            <%= studentMark.getMarks() %>
                                        </span>
                                    </p>
                                    <p><strong>Exam Date:</strong> <%= dateFormat.format(studentMark.getExamDate()) %></p>
                                    <p><strong>Grade:</strong> 
                                        <span class="badge <%= studentMark.getMarks() >= 80 ? "bg-success" : studentMark.getMarks() >= 60 ? "bg-warning text-dark" : "bg-danger" %>">
                                            <%= studentMark.getMarks() >= 80 ? "A" : studentMark.getMarks() >= 60 ? "B" : "C" %>
                                        </span>
                                    </p>
                                </div>
                            </div>
                            <hr>
                            <div class="mt-3 text-end">
                                <a href="markupdate.jsp?studentId=<%= studentMark.getStudentId() %>" class="btn btn-warning btn-sm me-2"><i class="bi bi-pencil-square me-1"></i>Edit Mark</a>
                                <a href="markdelete.jsp?studentId=<%= studentMark.getStudentId() %>" class="btn btn-danger btn-sm"><i class="bi bi-trash-fill me-1"></i>Delete Mark</a>
                            </div>
                        </div>
                        
                        <% } else if (marksList != null && !marksList.isEmpty()) { %>
                        
                        <div class="card">
                            <div class="card-header bg-primary text-white">
                                <i class="bi bi-card-checklist me-2"></i>All Student Marks (Total: <%= marksList.size() %> records)
                            </div>
                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table table-striped table-hover">
                                        <thead>
                                            <tr>
                                                <th>Student ID</th>
                                                <th>Name</th>
                                                <th>Subject</th>
                                                <th>Marks</th>
                                                <th>Grade</th>
                                                <th>Exam Date</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% for (StudentMark mark : marksList) { %>
                                            <tr>
                                                <td><%= mark.getStudentId() %></td>
                                                <td><%= mark.getStudentName() %></td>
                                                <td><span class="badge bg-info"><%= mark.getSubject() %></span></td>
                                                <td>
                                                    <span class="badge <%= mark.getMarks() >= 80 ? "bg-success" : mark.getMarks() >= 60 ? "bg-warning text-dark" : "bg-danger" %>">
                                                        <%= mark.getMarks() %>
                                                    </span>
                                                </td>
                                                <td>
                                                    <span class="badge <%= mark.getMarks() >= 80 ? "bg-success" : mark.getMarks() >= 60 ? "bg-warning text-dark" : "bg-danger" %>">
                                                        <%= mark.getMarks() >= 80 ? "A" : mark.getMarks() >= 60 ? "B" : "C" %>
                                                    </span>
                                                </td>
                                                <td><%= dateFormat.format(mark.getExamDate()) %></td>
                                                <td>
                                                    <a href="markupdate.jsp?studentId=<%= mark.getStudentId() %>" class="btn btn-warning btn-sm"><i class="bi bi-pencil-square"></i></a>
                                                    <a href="markdelete.jsp?studentId=<%= mark.getStudentId() %>" class="btn btn-danger btn-sm ms-1"><i class="bi bi-trash-fill"></i></a>
                                                </td>
                                            </tr>
                                            <% } %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        
                        <% } else if (searchPerformed != null && searchPerformed) { %>
                        
                        <div class="empty-state">
                            <i class="bi bi-exclamation-circle"></i>
                            <h5>No Record Found for the Given ID</h5>
                            <p>We couldn't find a student record matching the ID you searched for. Please double-check the ID or try searching for another one.</p>
                        </div>
                        
                        <% } else { %>
                        
                        <div class="empty-state">
                            <i class="bi bi-card-text"></i>
                            <h5>No Student Marks Available</h5>
                            <p>There are currently no student examination records to display. Use the "Add Marks" section to input new data.</p>
                            <p>You can also use the search bar above to look for specific student records.</p>
                            <a href="markadd.jsp" class="btn btn-primary mt-3"><i class="bi bi-plus-circle-fill me-2"></i>Add First Mark</a>
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
</body>
</html>