<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.StudentMark" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report Analytics - EduTrack System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body {
            font-family: 'Lato', sans-serif;
            background: linear-gradient(135deg, #f0f4f8 0%, #d9e2ec 100%); /* Soft blue-grey gradient */
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
            background-color: #007bff; /* Primary blue for sidebar */
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
            background-color: #e0f2ff; /* Light blue on active/hover */
            color: #007bff; /* Primary blue text */
            border-left-color: #007bff; /* Primary blue left border */
            font-weight: 500;
        }
        .nav-pills .nav-link.active {
            background-color: #007bff;
            color: white;
            border-left-color: #007bff;
        }

        .main-content-area {
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.08);
            padding: 30px;
        }
        .main-content-area .card-header {
            background-color: transparent;
            color: #2c3e50; /* Darker text for main header */
            font-weight: 700;
            font-size: 1.8rem;
            border-bottom: 1px solid #dfe6e9; /* Light grey border */
            margin-bottom: 25px;
            padding-bottom: 15px;
            border-radius: 0;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: 600;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
        .btn-outline-primary {
            border-radius: 8px;
            padding: 8px 15px;
            font-weight: 600;
            color: #007bff;
            border-color: #007bff;
        }
        .btn-outline-primary:hover {
            background-color: #007bff;
            color: white;
        }
        .btn-secondary {
            border-radius: 8px;
            padding: 8px 15px;
            font-weight: 600;
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
        .report-summary-card {
            background: linear-gradient(45deg, #007bff 0%, #6610f2 100%); /* Blue to purple gradient */
            color: white;
            border-radius: 12px;
            padding: 25px 30px;
            margin-bottom: 30px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            text-align: center;
        }
        .report-summary-card h4 {
            font-size: 1.4rem;
            margin-bottom: 15px;
            font-weight: 700;
            opacity: 0.95;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .report-summary-card h4 i {
            font-size: 1.8rem;
            margin-right: 10px;
        }
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        .stats-item {
            background-color: rgba(255, 255, 255, 0.15); /* Semi-transparent white */
            border-radius: 8px;
            padding: 15px;
            text-align: center;
            backdrop-filter: blur(5px); /* Frosted glass effect */
        }
        .stats-number {
            font-size: 2.2rem;
            font-weight: 900;
            line-height: 1.2;
        }
        .stats-label {
            font-size: 0.9rem;
            opacity: 0.8;
            margin-top: 5px;
        }
        .table-responsive {
            border-radius: 10px;
            overflow: hidden;
            border: 1px solid #dee2e6;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
        }
        .table {
            margin-bottom: 0;
            background-color: white;
        }
        .table thead th {
            background-color: #007bff; /* Primary blue for table header */
            color: white;
            border: none;
            vertical-align: middle;
            font-weight: 600;
            padding: 12px;
        }
        .table tbody tr:hover {
            background-color: #f5f8fc; /* Lighter hover effect */
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
        .empty-state {
            padding: 50px;
            text-align: center;
            color: #6c757d;
            background-color: #fcfdff;
            border-radius: 12px;
            border: 1px dashed #b8c7d6;
            margin-top: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.03);
        }
        .empty-state i {
            font-size: 4rem;
            margin-bottom: 20px;
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
        @media print {
            .no-print {
                display: none !important;
            }
            body {
                background: none;
                padding-top: 0;
            }
            .container {
                max-width: 100%;
                margin: 0;
                padding: 0;
            }
            .main-content-area, .card {
                box-shadow: none;
                border: none;
                border-radius: 0;
                padding: 0;
            }
            .main-content-area .card-header, .card .card-header {
                background-color: #f0f0f0 !important; /* Lighter for print */
                color: #333 !important;
                border-bottom: 1px solid #ccc !important;
                padding: 10px 15px !important;
            }
            .report-summary-card {
                background: #e9ecef !important; /* Lighter for print */
                color: #333 !important;
                box-shadow: none !important;
                border: 1px solid #dee2e6 !important;
                padding: 15px !important;
            }
            .stats-item {
                background-color: transparent !important;
                backdrop-filter: none !important;
                border: none !important;
            }
            .table thead th {
                background-color: #e9ecef !important; /* Lighter table header */
                color: #333 !important;
                border-bottom: 1px solid #dee2e6 !important;
            }
            .table {
                -webkit-print-color-adjust: exact; /* Ensure background colors print */
                print-color-adjust: exact;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-3 no-print">
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
                                <a class="nav-link" href="DisplayMarksServlet"><i class="bi bi-eye-fill me-2"></i>Display All Marks</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="report_form.jsp"><i class="bi bi-graph-up-arrow me-2"></i>Generate Reports</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-9">
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="alert alert-danger alert-dismissible fade show no-print" role="alert">
                        <i class="bi bi-x-circle-fill me-2"></i>
                        <%= request.getAttribute("errorMessage") %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                <% } %>
                
                <%
                    String reportTitle = (String) request.getAttribute("reportTitle");
                    List<StudentMark> reportResults = (List<StudentMark>) request.getAttribute("reportResults");
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    
                    if (reportResults != null && !reportResults.isEmpty()) {
                        // Calculate statistics
                        double totalMarks = 0;
                        int maxMarks = Integer.MIN_VALUE;
                        int minMarks = Integer.MAX_VALUE;
                        
                        for (StudentMark mark : reportResults) {
                            totalMarks += mark.getMarks();
                            maxMarks = Math.max(maxMarks, mark.getMarks());
                            minMarks = Math.min(minMarks, mark.getMarks());
                        }
                        
                        double averageMarks = totalMarks / reportResults.size();
                %>
                
                <div class="main-content-area">
                    <div class="card-header">
                        <i class="bi bi-journal-check me-3"></i><%= reportTitle != null ? reportTitle : "Report Results" %>
                    </div>
                    <div class="card-body p-0">
                        <div class="report-summary-card mb-4">
                            <h4><i class="bi bi-bar-chart-line-fill me-2"></i>Report Overview</h4>
                            <p class="text-white-50">Generated on: <%= new java.util.Date() %></p>
                            <div class="stats-grid">
                                <div class="stats-item">
                                    <div class="stats-number"><%= reportResults.size() %></div>
                                    <div class="stats-label">Total Records</div>
                                </div>
                                <div class="stats-item">
                                    <div class="stats-number"><%= String.format("%.1f", averageMarks) %></div>
                                    <div class="stats-label">Avg. Marks</div>
                                </div>
                                <div class="stats-item">
                                    <div class="stats-number"><%= maxMarks %></div>
                                    <div class="stats-label">Max. Marks</div>
                                </div>
                                <div class="stats-item">
                                    <div class="stats-number"><%= minMarks %></div>
                                    <div class="stats-label">Min. Marks</div>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex justify-content-end align-items-center mb-4 no-print">
                            <button onclick="window.print()" class="btn btn-outline-primary me-2"><i class="bi bi-printer-fill me-2"></i>Print Report</button>
                            <a href="report_form.jsp" class="btn btn-secondary"><i class="bi bi-arrow-left-circle-fill me-2"></i>New Report</a>
                        </div>
                        
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>Rank</th>
                                        <th>Student ID</th>
                                        <th>Name</th>
                                        <th>Subject</th>
                                        <th>Marks</th>
                                        <th>Grade</th>
                                        <th>Exam Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% 
                                    int rank = 1;
                                    for (StudentMark mark : reportResults) { %>
                                    <tr>
                                        <td>
                                            <% if (rank <= 3) { %>
                                                <span class="badge bg-info text-dark rounded-pill">#<%= rank %></span>
                                            <% } else { %>
                                                <%= rank %>
                                            <% } %>
                                        </td>
                                        <td><%= mark.getStudentId() %></td>
                                        <td><%= mark.getStudentName() %></td>
                                        <td><span class="badge bg-primary"><%= mark.getSubject() %></span></td>
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
                                    </tr>
                                    <% 
                                        rank++;
                                    } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                
                <% } else if (reportResults != null) { %>
                
                <div class="main-content-area">
                    <div class="card-header">
                        <i class="bi bi-journal-check me-3"></i>Report Results
                    </div>
                    <div class="card-body">
                        <div class="empty-state">
                            <i class="bi bi-exclamation-triangle-fill"></i>
                            <h5>No Results Found for Your Report Criteria</h5>
                            <p>It seems that no student records match the criteria you specified for this report. Please try adjusting your filters or generating a different type of report.</p>
                            <a href="report_form.jsp" class="btn btn-primary mt-3"><i class="bi bi-arrow-left-circle-fill me-2"></i>Generate New Report</a>
                        </div>
                    </div>
                </div>
                
                <% } else { %>
                
                <div class="main-content-area">
                    <div class="card-header">
                        <i class="bi bi-journal-check me-3"></i>Report Results
                    </div>
                    <div class="card-body">
                        <div class="empty-state">
                            <i class="bi bi-graph-up-arrow"></i>
                            <h5>No Report Generated Yet</h5>
                            <p>To view student performance analytics, please navigate to the "Generate Reports" section and select your desired report type and criteria.</p>
                            <a href="report_form.jsp" class="btn btn-primary mt-3"><i class="bi bi-file-earmark-bar-graph-fill me-2"></i>Generate Report Now</a>
                        </div>
                    </div>
                </div>
                
                <% } %>
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