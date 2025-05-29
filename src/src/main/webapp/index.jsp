<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Mark Management - Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f0f2f5 0%, #c1cfe0 100%);
            padding-top: 20px;
        }
        .navbar {
            background-color: #343a40; /* Darker Navbar */
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .navbar-brand, .nav-link {
            color: #ffffff !important;
            font-weight: 600;
        }
        .header-section {
            background: linear-gradient(45deg, #28a745, #218838); /* Green gradient */
            color: #fff;
            padding: 4rem 3rem;
            border-radius: 15px;
            margin-bottom: 40px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
        }
        .header-section h1 {
            font-weight: 700;
        }
        .feature-card {
            background-color: #ffffff;
            border-radius: 15px;
            padding: 25px;
            text-align: center;
            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            height: 100%; /* Ensure cards are same height */
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .feature-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 25px rgba(0,0,0,0.15);
        }
        .feature-card .icon {
            font-size: 3.5rem;
            margin-bottom: 15px;
            color: #28a745; /* Green icon */
        }
        .feature-card h5 {
            font-weight: 700;
            margin-bottom: 10px;
            color: #343a40;
        }
        .feature-card p {
            color: #6c757d;
            flex-grow: 1; /* Allows paragraph to take up available space */
        }
        .feature-card .btn {
            margin-top: 20px;
            border-radius: 50px;
            padding: 10px 25px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .sidebar {
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.08);
            padding: 15px 0;
        }
        .sidebar .nav-link {
            padding: 15px 20px;
            color: #343a40;
            font-weight: 500;
            transition: all 0.2s ease;
            border-left: 5px solid transparent;
        }
        .sidebar .nav-link:hover {
            background-color: #e9ecef;
            border-left-color: #28a745;
            color: #28a745;
        }
        .sidebar .nav-link.active {
            background-color: #28a745;
            color: #fff;
            border-left-color: #28a745;
            font-weight: 600;
        }
        .footer {
            background-color: #343a40; /* Darker Footer */
            color: white;
            text-align: center;
            padding: 40px 0;
            margin-top: 60px;
            border-radius: 20px 20px 0 0;
            box-shadow: 0 -4px 10px rgba(0,0,0,0.1);
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
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="index.jsp"><i class="bi bi-mortarboard-fill"></i> Student Marks</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link active" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="markadd.jsp">Add Marks</a></li>
                    <li class="nav-item"><a class="nav-link" href="DisplayMarksServlet">View Marks</a></li>
                    <li class="nav-item"><a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#aboutModal">About</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="header-section text-center">
            <h1 class="display-4">Welcome to the Student Mark Dashboard</h1>
            <p class="lead">Efficiently manage, analyze, and report student performance.</p>
        </div>

        <div class="row g-4">
            <div class="col-md-3">
                <div class="sidebar">
                    <ul class="nav flex-column">
                        <li class="nav-item"><a class="nav-link active" href="index.jsp"><i class="bi bi-house-door-fill me-2"></i>Dashboard Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="markadd.jsp"><i class="bi bi-plus-circle-fill me-2"></i>Add New Marks</a></li>
                        <li class="nav-item"><a class="nav-link" href="markupdate.jsp"><i class="bi bi-pencil-square me-2"></i>Update Existing Marks</a></li>
                        <li class="nav-item"><a class="nav-link" href="markdelete.jsp"><i class="bi bi-trash-fill me-2"></i>Delete Marks</a></li>
                        <li class="nav-item"><a class="nav-link" href="DisplayMarksServlet"><i class="bi bi-eye-fill me-2"></i>Display All Marks</a></li>
                        <li class="nav-item"><a class="nav-link" href="report_form.jsp"><i class="bi bi-graph-up-arrow me-2"></i>Generate Reports</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-9">
                <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                    <div class="col">
                        <div class="feature-card">
                            <div class="icon"><i class="bi bi-file-earmark-plus-fill"></i></div>
                            <h5>Add Student Marks</h5>
                            <p>Easily input new examination records for students.</p>
                            <a href="markadd.jsp" class="btn btn-success">Add Marks</a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="feature-card">
                            <div class="icon"><i class="bi bi-arrow-repeat"></i></div>
                            <h5>Update Existing Marks</h5>
                            <p>Modify student marks quickly and accurately.</p>
                            <a href="markupdate.jsp" class="btn btn-outline-success">Update Marks</a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="feature-card">
                            <div class="icon"><i class="bi bi-x-circle-fill"></i></div>
                            <h5>Remove Marks Data</h5>
                            <p>Delete outdated or incorrect student mark entries.</p>
                            <a href="markdelete.jsp" class="btn btn-outline-success">Delete Marks</a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="feature-card">
                            <div class="icon"><i class="bi bi-table"></i></div>
                            <h5>View All Marks</h5>
                            <p>Access a comprehensive list of all student marks.</p>
                            <a href="DisplayMarksServlet" class="btn btn-success">View All</a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="feature-card">
                            <div class="icon"><i class="bi bi-bar-chart-line-fill"></i></div>
                            <h5>Generate Performance Reports</h5>
                            <p>Create detailed reports and visualize student progress.</p>
                            <a href="report_form.jsp" class="btn btn-outline-success">Generate Reports</a>
                        </div>
                    </div>
                    <div class="col">
                        <div class="feature-card">
                            <div class="icon"><i class="bi bi-info-circle-fill"></i></div>
                            <h5>About This System</h5>
                            <p>Learn more about the functionalities and features of this application.</p>
                            <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#aboutModal">More Info</button>
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


        <div class="modal fade" id="aboutModal" tabindex="-1" aria-labelledby="aboutModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header bg-success text-white">
                        <h5 class="modal-title" id="aboutModalLabel">About This System</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>This **Student Mark Management System** is a robust application designed to streamline the process of managing student examination records. It's built using a modern **MVC architecture** leveraging **JSP, Servlets, and JDBC** for efficient database interaction.</p>
                        <h6>Key Features:</h6>
                        <ul>
                            <li><i class="bi bi-check-circle-fill text-success me-2"></i>**Comprehensive Data Management**: Easily add, update, and delete student marks.</li>
                            <li><i class="bi bi-check-circle-fill text-success me-2"></i>**Interactive Data Display**: View and search for student marks with intuitive filtering options.</li>
                            <li><i class="bi bi-check-circle-fill text-success me-2"></i>**Insightful Reporting**: Generate detailed performance reports to analyze student progress and trends.</li>
                        </ul>
                        <p>Our goal is to provide an intuitive and powerful tool for educators and administrators to handle student academic data effectively.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>