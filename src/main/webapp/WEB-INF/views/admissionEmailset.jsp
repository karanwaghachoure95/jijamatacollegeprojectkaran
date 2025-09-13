<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .login-card {
            max-width: 450px;
            margin: 80px auto;
            padding: 30px;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
            text-align: center;
        }
        .login-card h2 {
            font-weight: bold;
            color: #333;
            margin-bottom: 20px;
        }
        .btn-admin {
            width: 100%;
            font-size: 18px;
            font-weight: bold;
            padding: 12px;
            border-radius: 8px;
        }
        .footer-text {
            margin-top: 15px;
            font-size: 14px;
            color: #777;
        }
    </style>
</head>
<body>

    <div class="login-card">
        <h2> Admin Login</h2>

        <form action="adminAdmissionEmail" method="post">
            <!-- Hardcoded Email -->
            <input type="hidden" name="email" value="karanwaghachoure@gmail.com" />

            <p class="mb-3">Click below to login as <strong>Admin</strong>.</p>
            <button type="submit" class="btn btn-primary btn-admin">Login as Admin</button>
        </form>

        <p class="footer-text">Only authorized admins can access this section.</p>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
