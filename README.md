# Student-Mark-Mangement-System

Subject Name: Advanced Java
Subject Code: BCS613D
Name: Lakshmi Shivabasappa Banakar
USN: 4AL22CS080
Sem/Section: VI/B

A complete web application to manage student exam marks using JSP, Servlets, and MySQL, structured with the MVC design pattern.

Features

Full CRUD: Add, edit, remove, and view student marks

Search: Look up records using Student ID

Reports: Generate reports for

Students above a certain mark

Students by subject

Top N scorers

Input Checks: Validations on both client and server sides

User Interface: Responsive design using Bootstrap

Architecture: Clean MVC separation

Database: MySQL with JDBC

Prerequisites

JDK 8 or newer

Apache Tomcat 9 or above

MySQL Server or XAMPP

MySQL JDBC Driver

Java IDE like Eclipse or IntelliJ

Modern web browser

Project Structure
MarkWebApp/

src/

dao/MarkDAO.java

model/StudentMark.java

servlet/ (AddMarkServlet.java, UpdateMarkServlet.java, etc.)

WebContent/

index.jsp, markadd.jsp, markupdate.jsp, etc.

WEB-INF/web.xml

README.md

Database Setup

Create the database
CREATE DATABASE mark_management;
USE mark_management;

Create the table
CREATE TABLE StudentMarks (StudentID INT PRIMARY KEY, StudentName VARCHAR(100), Subject VARCHAR(50), Marks INT, ExamDate DATE);

Add sample data
INSERT INTO StudentMarks VALUES (1001, 'Samay Shetty', 'Mathematics', 85, '2025-04-10'), ... ;

Setup Steps

Download and arrange files as per structure

Start MySQL and run the SQL scripts

Update database URL and credentials in MarkDAO.java

Add JDBC driver to WEB-INF/lib and build path

Create dynamic web project, copy files, deploy to Tomcat

Start server and open: http://localhost:8080/your_Project_name/

Usage

To add marks: Go to Add Marks, enter student details, and submit

To update: Search by ID, change info, and save

To delete: Search by ID, confirm, and remove

To display: View all or search by ID

To get reports: Choose report type, fill criteria, and generate

Technical Features

Validations: JavaScript and servlet-based checks

Error Handling: Try-catch blocks and messages

Security: Uses prepared statements

UI: Mobile-friendly layout using Bootstrap

Testing

Check add, update, delete, and search functions

Handle invalid inputs and duplicate IDs

Verify report accuracy and statistics

Outcomes

Learn MVC with Java web tech

Understand full-stack web development with MySQL integration

Gain experience in validation, database operations, and responsive design
