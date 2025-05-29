<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Reports - EduTrack Analytics</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
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
            padding: 12px 30px;
            font-weight: 600;
            font-size: 1.1rem;
            transition: background-color 0.2s ease, border-color 0.2s ease;
        }
        .btn-primary:hover {
            background-color: #218838;
            border-color: #218838;
        }
        .report-option-card {
            border: 2px solid #e9ecef;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 15px;
            cursor: pointer;
            transition: all 0.3s ease;
            background-color: #fcfcfc;
            height: 100%; /* Ensure cards have same height */
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .report-option-card:hover {
            border-color: #a2d9a2; /* Lighter green on hover */
            background-color: #f8f9fa;
            transform: translateY(-3px); /* Subtle lift effect */
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }
        .report-option-card.selected {
            border-color: #28a745; /* Vibrant green when selected */
            background-color: #e6ffe6; /* Very light green background */
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
        }
        .report-icon-lg {
            font-size: 3rem; /* Larger icons */
            margin-bottom: 15px;
            display: block;
            color: #28a745; /* Green icon color */
        }
        .report-option-card h6 {
            font-weight: 600;
            color: #34495e;
            margin-bottom: 5px;
        }
        .report-option-card p.small {
            font-size: 0.85em;
            color: #7f8c8d;
        }
        #criteriaContainer {
            display: none;
            margin-top: 30px;
        }
        .criteria-card {
            background-color: #e6ffe6; /* Light green background for criteria */
            border: 1px solid #c3e6cb;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
        }
        .criteria-card .card-header {
            background-color: #28a745; /* Primary green for criteria header */
            color: white;
            font-weight: 600;
            border-radius: 12px 12px 0 0;
            padding: 15px 20px;
            font-size: 1.1rem;
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
        .instructions-card {
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.08);
            margin-top: 30px;
        }
        .instructions-card .card-header {
            background-color: #6c757d; /* Grey for instructions header */
            color: white;
            font-weight: 600;
            border-radius: 12px 12px 0 0;
            padding: 15px 20px;
            font-size: 1.1rem;
        }
        .instructions-card ul {
            list-style: none; /* Remove default bullets */
            padding-left: 0;
        }
        .instructions-card ul li {
            position: relative;
            padding-left: 25px; /* Space for custom bullet */
            margin-bottom: 8px;
            line-height: 1.5;
        }
        .instructions-card ul li::before {
            content: "\2022"; /* Unicode for bullet point */
            color: #28a745; /* Primary green bullet */
            font-weight: bold;
            display: inline-block;
            width: 1em;
            margin-left: -1em;
            position: absolute;
            left: 0;
        }
        .alert-info {
            background-color: #d1ecf1; /* Standard Bootstrap info alert blue */
            color: #0c5460;
            border-color: #bee5eb;
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
                <div class="main-card">
                    <div class="card-header">
                        <i class="bi bi-bar-chart-fill me-3"></i>Generate Performance Reports
                    </div>
                    <div class="card-body">
                        <form action="ReportServlet" method="post" id="reportForm" class="needs-validation" novalidate>
                            <div class="mb-4">
                                <h5 class="mb-3 text-secondary">Choose a Report Type:</h5>
                                <div class="row row-cols-1 row-cols-md-3 g-3">
                                    <div class="col">
                                        <div class="report-option-card" data-report="aboveThreshold">
                                            <div class="text-center">
                                                <i class="bi bi-arrow-up-circle-fill report-icon-lg"></i>
                                                <h6>Students Above Threshold</h6>
                                                <p class="text-muted small">Find students with marks equal to or above a specified value.</p>
                                            </div>
                                            <input type="radio" name="reportType" value="aboveThreshold" class="d-none" required>
                                        </div>
                                    </div>
                                    
                                    <div class="col">
                                        <div class="report-option-card" data-report="bySubject">
                                            <div class="text-center">
                                                <i class="bi bi-journal-bookmark-fill report-icon-lg"></i>
                                                <h6>Students by Subject</h6>
                                                <p class="text-muted small">View all students who took a particular subject.</p>
                                            </div>
                                            <input type="radio" name="reportType" value="bySubject" class="d-none" required>
                                        </div>
                                    </div>
                                    
                                    <div class="col">
                                        <div class="report-option-card" data-report="topStudents">
                                            <div class="text-center">
                                                <i class="bi bi-award-fill report-icon-lg"></i>
                                                <h6>Top Performing Students</h6>
                                                <p class="text-muted small">Display the top 'N' students based on their marks.</p>
                                            </div>
                                            <input type="radio" name="reportType" value="topStudents" class="d-none" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="invalid-feedback d-none" id="reportTypeFeedback">Please select a report type.</div>
                            </div>
                            
                            <div id="criteriaContainer">
                                <div class="criteria-card">
                                    <div class="card-header">
                                        <i class="bi bi-sliders me-2"></i>Report Criteria
                                    </div>
                                    <div class="card-body" id="criteriaContent">
                                        </div>
                                </div>
                            </div>
                            
                            <div class="d-grid mt-4">
                                <button type="submit" class="btn btn-primary" id="generateBtn" disabled><i class="bi bi-file-earmark-bar-graph-fill me-2"></i>Generate Report</button>
                            </div>
                        </form>
                    </div>
                </div>
                
                <div class="instructions-card">
                    <div class="card-header">
                        <i class="bi bi-info-circle-fill me-2"></i>How to Generate Reports
                    </div>
                    <div class="card-body">
                        <h6 class="mb-3 text-primary">Follow these simple steps:</h6>
                        <ul class="mb-3">
                            <li><strong>1. Select Report Type:</strong> Click on one of the report cards (e.g., "Students Above Threshold") to choose the report you wish to generate.</li>
                            <li><strong>2. Enter Criteria:</strong> Once selected, a new section will appear prompting you for specific details (e.g., a minimum mark, a subject, or the number of top students).</li>
                            <li><strong>3. Generate Report:</strong> After entering the required criteria, click the "Generate Report" button to view your results.</li>
                        </ul>
                        <div class="alert alert-info border-info">
                            <i class="bi bi-lightbulb-fill me-2"></i>
                            <strong>Tip:</strong> The criteria section will dynamically change based on your chosen report type.
                        </div>
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
        // Handle report option selection
        document.querySelectorAll('.report-option-card').forEach(option => {
            option.addEventListener('click', function() {
                // Remove selected class from all options
                document.querySelectorAll('.report-option-card').forEach(opt => {
                    opt.classList.remove('selected');
                });
                
                // Add selected class to clicked option
                this.classList.add('selected');
                
                // Check the corresponding radio button
                const radio = this.querySelector('input[type="radio"]');
                radio.checked = true;
                
                // Show criteria container and load appropriate content
                const reportType = this.dataset.report;
                showCriteriaFor(reportType);
                
                // Enable generate button
                document.getElementById('generateBtn').disabled = false;

                // Hide validation feedback for report type
                document.getElementById('reportTypeFeedback').classList.add('d-none');
            });
        });
        
        function showCriteriaFor(reportType) {
            const criteriaContainer = document.getElementById('criteriaContainer');
            const criteriaContent = document.getElementById('criteriaContent');
            
            criteriaContainer.style.display = 'block';
            
            let content = '';
            
            switch(reportType) {
                case 'aboveThreshold':
                    content = `
                        <div class="mb-3">
                            <label for="threshold" class="form-label"><i class="bi bi-percent me-2"></i>Minimum Marks Threshold</label>
                            <input type="number" class="form-control" id="threshold" name="threshold" 
                                   min="0" max="100" placeholder="Enter minimum marks (0-100)" required>
                            <div class="form-text text-muted">Students with marks equal to or above this value will be included in the report.</div>
                            <div class="invalid-feedback">Please enter a valid threshold between 0 and 100.</div>
                        </div>
                    `;
                    break;
                    
                case 'bySubject':
                    content = `
                        <div class="mb-3">
                            <label for="subject" class="form-label"><i class="bi bi-book-fill me-2"></i>Select Subject</label>
                            <select class="form-select" id="subject" name="subject" required>
                                <option value="" selected disabled>Choose a subject...</option>
                                <option value="Mathematics">Mathematics</option>
                                <option value="Physics">Physics</option>
                                <option value="Chemistry">Chemistry</option>
                                <option value="Biology">Biology</option>
                                <option value="Computer Science">Computer Science</option>
                                <option value="English">English</option>
                                <option value="History">History</option>
                                <option value="Geography">Geography</option>
                            </select>
                            <div class="form-text text-muted">All students who took the selected subject will be included in the report.</div>
                            <div class="invalid-feedback">Please select a subject.</div>
                        </div>
                    `;
                    break;
                    
                case 'topStudents':
                    content = `
                        <div class="mb-3">
                            <label for="count" class="form-label"><i class="bi bi-trophy-fill me-2"></i>Number of Top Students</label>
                            <input type="number" class="form-control" id="count" name="count" 
                                   min="1" max="100" placeholder="Enter number of students (e.g., 10)" required>
                            <div class="form-text text-muted">The top performers based on marks will be displayed in descending order.</div>
                            <div class="invalid-feedback">Please enter a valid number (1-100) for top students.</div>
                        </div>
                    `;
                    break;
            }
            
            criteriaContent.innerHTML = content;

            // Re-apply Bootstrap validation to newly loaded content
            const newFormElements = criteriaContent.querySelectorAll('input, select');
            newFormElements.forEach(element => {
                element.addEventListener('input', () => {
                    if (element.checkValidity()) {
                        element.classList.remove('is-invalid');
                        element.classList.add('is-valid');
                    } else {
                        element.classList.remove('is-valid');
                        element.classList.add('is-invalid');
                    }
                });
            });
        }

        // Bootstrap form validation for the main form
        (function () {
            'use strict'
            const form = document.getElementById('reportForm');
            const generateBtn = document.getElementById('generateBtn');
            const reportTypeRadios = form.querySelectorAll('input[name="reportType"]');
            const reportTypeFeedback = document.getElementById('reportTypeFeedback');

            form.addEventListener('submit', function (event) {
                let reportTypeSelected = false;
                reportTypeRadios.forEach(radio => {
                    if (radio.checked) {
                        reportTypeSelected = true;
                    }
                });

                if (!reportTypeSelected) {
                    reportTypeFeedback.classList.remove('d-none');
                    reportTypeFeedback.classList.add('d-block');
                    event.preventDefault();
                    event.stopPropagation();
                } else {
                    reportTypeFeedback.classList.remove('d-block');
                    reportTypeFeedback.classList.add('d-none');
                }

                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }

                form.classList.add('was-validated');
            }, false);
        })();
    </script>
</body>
</html>