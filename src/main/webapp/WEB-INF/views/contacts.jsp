<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Records</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-5">
		<h2>Contact Us Records</h2>
		<a href="${pageContext.request.contextPath}/home.jsp"
			class="btn btn-secondary btn-sm float-end">⬅ Back to Home</a>

		<!-- 🔍 Search bar -->
		<div class="mt-3 mb-3">
			<input type="text" id="searchInput" class="form-control"
				placeholder="🔍 Search by Name, Email, Phone or Message...">
		</div>

		<table class="table table-bordered table-striped mt-3"
			id="contactsTable">
			<thead>
				<tr>
					<th>ID</th>
					<th>Name</th>
					<th>Email</th>
					<th>Phone Number</th>
					<th>Submitted At</th>
					<th>Message</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="contact" items="${contacts}">
					<tr>
						<td>${contact.id}</td>
						<td>${contact.name}</td>
						<td>${contact.email}</td>
						<td>${contact.phoneNumber}</td>
						<td><fmt:formatDate value="${contact.submittedAt}"
								pattern="dd-MM-yyyy HH:mm:ss" /></td>
						<td>${contact.message}</td>
						<td>
							<form action="deleteContact" method="post"
								style="display: inline;">
								<input type="hidden" name="id" value="${contact.id}">
								<button type="submit" class="btn btn-danger btn-sm"
									onclick="return confirm('Are you sure?')">Delete</button>
							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script>
    // 🔎 Table Search Filter
    document.getElementById("searchInput").addEventListener("keyup", function () {
        let filter = this.value.toLowerCase();
        let rows = document.querySelectorAll("#contactsTable tbody tr");

        rows.forEach(row => {
            let text = row.innerText.toLowerCase();
            row.style.display = text.includes(filter) ? "" : "none";
        });
    });
</script>

</body>
</html>
