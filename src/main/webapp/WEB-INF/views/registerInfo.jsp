<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registered Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f8f9fa;
        }
        h2 {
            text-align: center;
            margin-top: 20px;
            color: #333;
        }
        table {
            width: 85%;
            border-collapse: collapse;
            margin: 20px auto;
            background: white;
            box-shadow: 0px 4px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 12px 15px;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .btn-delete {
            background-color: red;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-delete:hover {
            background-color: darkred;
        }
        /* ✅ Back button style */
        .btn-back {
            display: block;
            margin: 20px auto;
            text-align: center;
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            transition: 0.3s;
        }
        .btn-back:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <h2>Registered Users</h2>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Username</th>
                <th>Password</th>
                <th>Confirm Password</th>
                <th>Action</th> <!-- ✅ New Column -->
            </tr>
        </thead>
        <tbody>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.fullname}</td>
                    <td>${user.email}</td>
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                    <td>${user.confirmPassword}</td>
                    <td>
                        <!-- ✅ Delete Button -->
                        <form action="deleteUser/${user.id}" method="post" style="display:inline;">
                            <button type="submit" class="btn-delete">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- ✅ Back Button -->
    <a href="home.jsp" class="btn-back">⬅ Back to Home</a>

</body>
</html>
