<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<title>Student Lists</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background: #f8f9fa;
}

.nav-tabs .nav-link.active {
	background: #0d6efd;
	color: white;
	border-radius: 5px 5px 0 0;
}

table thead {
	background: #0d6efd;
	color: white;
}

table tbody tr:hover {
	background: #f1f1f1;
}

.page-title {
	text-align: center;
	margin-bottom: 30px;
	font-weight: bold;
	color: #0d6efd;
}

.search-box {
	margin-bottom: 15px;
}
</style>
</head>
<body class="container mt-5">

	<h2 class="page-title">📚 Student Lists</h2>

	<!-- Tabs -->
	<ul class="nav nav-tabs" id="studentTabs" role="tablist">
		<li class="nav-item"><a class="nav-link active" id="fy-tab"
			data-bs-toggle="tab" href="#fy" role="tab">FY Students</a></li>
		<li class="nav-item"><a class="nav-link" id="sy-tab"
			data-bs-toggle="tab" href="#sy" role="tab">SY Students</a></li>
		<li class="nav-item"><a class="nav-link" id="ty-tab"
			data-bs-toggle="tab" href="#ty" role="tab">TY Students</a></li>
	</ul>

	<!-- Tab Content -->
	<div class="tab-content mt-3">

		<!-- FY Students -->
		<div class="tab-pane fade show active" id="fy" role="tabpanel">
			<div class="card shadow-sm">
				<div class="card-body">
					<!-- Search -->
					<input type="text" id="fySearch" class="form-control search-box"
						placeholder="🔍 Search FY Students...">

					<table class="table table-hover align-middle">
						<thead>
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Gender</th>
								<th>DOB</th>
								<th>Mobile</th>
								<th>Email</th>
								<th>Course</th>
								<th>Submitted At</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody id="fyTable">
							<c:forEach var="student" items="${fyStudents}">
								<tr>
									<td>${student.id}</td>
									<td>${student.fullName}</td>
									<td>${student.gender}</td>
									<td>${student.dob}</td>
									<td>${student.mobileNumber}</td>
									<td>${student.email}</td>
									<td>${student.courseApplied}</td>
									<td><fmt:formatDate value="${student.submittedAt}"
											pattern="dd-MM-yyyy HH:mm:ss" /></td>
											
									<td><a href="deleteFy/${student.id}"
										class="btn btn-sm btn-outline-danger"
										onclick="return confirm('Are you sure you want to delete this student?');">
											🗑 Delete </a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<!-- SY Students -->
		<div class="tab-pane fade" id="sy" role="tabpanel">
			<div class="card shadow-sm">
				<div class="card-body">
					<!-- Search -->
					<input type="text" id="sySearch" class="form-control search-box"
						placeholder="🔍 Search SY Students...">

					<table class="table table-hover align-middle">
						<thead>
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Gender</th>
								<th>DOB</th>
								<th>Mobile</th>
								<th>Email</th>
								<th>Course</th>
								<th>Submitted At</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody id="syTable">
							<c:forEach var="student" items="${syStudents}">
								<tr>
									<td>${student.id}</td>
									<td>${student.fullName}</td>
									<td>${student.gender}</td>
									<td>${student.dob}</td>
									<td>${student.mobileNumber}</td>
									<td>${student.email}</td>
									<td>${student.courseApplied}</td>
									<td><fmt:formatDate value="${student.submittedAt}"
											pattern="dd-MM-yyyy HH:mm:ss" /></td>

									<td><a href="deleteSy/${student.id}"
										class="btn btn-sm btn-outline-danger"
										onclick="return confirm('Are you sure you want to delete this student?');">
											🗑 Delete </a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<!-- TY Students -->
		<div class="tab-pane fade" id="ty" role="tabpanel">
			<div class="card shadow-sm">
				<div class="card-body">
					<!-- Search -->
					<input type="text" id="tySearch" class="form-control search-box"
						placeholder="🔍 Search TY Students...">

					<table class="table table-hover align-middle">
						<thead>
							<tr>
								<th>ID</th>
								<th>Name</th>
								<th>Gender</th>
								<th>DOB</th>
								<th>Mobile</th>
								<th>Email</th>
								<th>Course</th>
								<th>Submitted At</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody id="tyTable">
							<c:forEach var="student" items="${tyStudents}">
								<tr>
									<td>${student.id}</td>
									<td>${student.fullName}</td>
									<td>${student.gender}</td>
									<td>${student.dob}</td>
									<td>${student.mobileNumber}</td>
									<td>${student.email}</td>
									<td>${student.courseApplied}</td>
									<td><fmt:formatDate value="${student.submittedAt}"
											pattern="dd-MM-yyyy HH:mm:ss" /></td>

									<td><a href="deleteTy/${student.id}"
										class="btn btn-sm btn-outline-danger"
										onclick="return confirm('Are you sure you want to delete this student?');">
											🗑 Delete </a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script>
    // Tab preserve code
    const activeTab = '${activeTab}';
    if(activeTab) {
        const tabTrigger = new bootstrap.Tab(document.querySelector(`#${activeTab}-tab`));
        tabTrigger.show();
    }

    // Existing search filter code
    function searchTable(inputId, tableId) {
        document.getElementById(inputId).addEventListener("keyup", function () {
            let filter = this.value.toLowerCase();
            let rows = document.querySelectorAll("#" + tableId + " tr");
            rows.forEach(row => {
                row.style.display = row.innerText.toLowerCase().includes(filter) ? "" : "none";
            });
        });
    }
    searchTable("fySearch", "fyTable");
    searchTable("sySearch", "syTable");
    searchTable("tySearch", "tyTable");
</script>

	<!-- Back Button -->
	<div class="mb-3">
		<a href="${pageContext.request.contextPath}/home.jsp"
			class="btn btn-secondary btn-sm float-end">⬅ Back to Home</a>
		<!-- Agar specific page pe bhejna ho to:
        <a href="home" class="btn btn-secondary">⬅ Back</a>
        -->
	</div>

</body>
</html>
