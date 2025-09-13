<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Book Issue</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script>
        // 🔥 Book List Mapping
        const booksData = {
            "BSc(CS)": {
                "FY": ["Problem Solving using 'C' Programming ", "Lab Cource based on CS-101-T", "Matrix Algebra","Mathematics Practical-I","Principles of Analog Electronics","Electronics Practical Cource-I","Generic IKS","Office Automation I/Introduction to Computers and Basis of Internet/Introduction to Google Apps-I/Fundamentals Of Computers-I","Statistical Methods for Computer Science-I","English","EVS-I","Advanced C Programming","Lab Cource Based on CS-103-T","Graph Theory","Mathematics Practical-II","Principles Of Digital Electronics","Electronics Practical Cource-II","Office Automation-II/Computer Fundamentals/Introduction to Google Apps II/Fundamentals Of Computer-II","Statistical Methods for Computer Science-II","English","EVS-II"],
                "SY": [
                	  "Data Structure-I",
                	  "Database Management System-I",
                	  "Lab Cource based on CS201MJ & CS202MJ",
                	  "Software Engineering",
                	  "Computations in Ancient India",
                	  "Mathematics",
                	  "Electronics",
                	  "E commerce/Web Design/Digital Marketing",
                	  "Data Structure-II",
                	  "Database Management System-II",
                	  "Lab Course based on DS-II & DBMS-II",
                	  "Advanced Python Programming",
                	  "Mini Project",
                	  "Mathematics or Electronics (Theory)",
                	  "Mathematics or Electronics (Practical)",
                	  "E-commerce II / Web Design II / Digital Marketing II / AI for Everyone – II",
                	  "Computer Networks / Statistical Analysis using R Software",
                	  "Ability Enhancement Course (From University Basket)",
                	  "Common Course (From University Basket)"
                	],
                "TY": ["Operating Systems-I", "Computer Networks-II", "Practical cource based on CS 351","Web Technologies-I","Foundations Of Data Science","Practical cource based on CS 353 and CS 354","Object Oriented Programming using Java-I","Theoretical Computer Science","Practical Cource based on CS 355","Python Programming","Blockchain Technology","Operating Systems-II","Software Testing","Practical cource based on CS 361","Web Technologies-II","Data Analytics","Practical cource based on CS 363 and CS 364","Object Oriented Programming using Java-II","Compiler Construction","Practical Cource based on CS 365","Software Testing Tools"]
            },
            "BCom": {
                "FY": [ "AEC-101 – English: Mastering English for Professional Purposes – I",
                    "FAC-101 – Financial Accounting – I",
                    "FOB-106 – Fundamentals of Banking – I",
                    "TBE-109 – Introduction to Behavioural Economics (MN)",
                    "IKS – Indian Knowledge System (Generic)",
                    "OE – Computer Science",
                    "SEC (111) – Business Accounting – I",
                    "VEC (101) – Environmental Education – I",
                    "AEC-121 – English: Mastering English for Professional Purposes – II",
                    "FAC-121 – Financial Accounting – II",
                    "FI-126 – Fundamentals of Insurance – II",
                    "MSF-129 – Market Structure & Welfare Economics",
                    "121 – Constitutional Values, Fundamental Duties & Political System in India (MN)",
                    "OE – Computer Science",
                    "SEC (121) – Business Accounting – II",
                    "CC – (Skill/Competency Course – name not mentioned)"],
                    
                "SY": [ "MM – Corporate Accounting – I",
                    "C – Indian Banking System – I",
                    "MN – Theory of Money",
                    "OE – Computer Science (C2)",
                    "VSC – Tally Accounting – I",
                    "AEC – Language (Marathi) – I",
                    "IKS – Indian Knowledge System",
                    "CC – (Skill/Competency Course)",
                    "FP – Banking & Finance – Field Project – I",
                    "MM – Corporate Accounting – II",
                    "C – Indian Banking System – II",
                    "MN – Macro-Economic Policy",
                    "OE – Computer Science (C2)",
                    "VSC – Tally Accounting – II",
                    "SEC – Goods & Service Tax Act (GST)",
                    "AEC – Language (Marathi) – II",
                    "CC – (Skill/Competency Course)",
                    "CEP – Community Engagement Project – I"],
                    
                "TY": ["Business Regulatory Framework-I", "Indian and Global Economic development-I","Advanced Accounting-I","Auditing and Tasaction-I","Banking and Finance-II","Banking and Finance-III","Business Regulatory Framework-II", "Indian and Global Economic development-II","Advanced Accounting-II","Auditing and Tasaction-II","Banking and Finance-II","Banking and Finance-III"]
            },
            "BCA": {
                "FY": ["Problem solving using C", "Data Base Management System","Computer Laboratory based on C programming and Data Base Management System(DBMS)","Business Mathematics","Business Statistics","Office Automation tools","Programming Principles and algorithm","Business Communication Skills-I","Enviromental Awarness","Generic IKS","Physical Education-I","Advance C Programming","Relational Database Management System(RDBMS)","Computer Laboratory based on Advance C and RDBMS","Principle and Practices of Management","Introduction to Data Science","Tally Prime","Web Technology","E-Commerce","Business Communication Skills-II","Democracy Awareness & Gender Sensitization","Physical Education-II"],   
                "SY": ["Data Structure", "PHP","Computer Laboratory based on DS,PHP","To be selected from the basket of the other faculty","Web development tools","Modern Indian Languages 1","Project based on Web Applications","NSS//NCC/Yoga Education/Health and Wellness/Fine Arts-I","Object Oriented Programming using C++","Advance PHP","Computer Laboratory based on CPP,Adv PHP","Digital Marketing","Computer Network","Modern Indian languages 2","Project based on Digital Marketing","NSS/NCC/Yoga Education/Health and Wellness/Fine Arts-II"],
                "TY": ["Java Programming", "Mobile Application Development","Computer Laboratory based on Java and Mobile Application Development","Linux Operating System","Software Engineering","Dot Net Programming","Project based on Mobile Application Development","Recent Trends in IT","Python","Computer Laboratory based on Python","Internet Of Things","Software Testing","Management Information Systems"]
            }
        };

        function loadBooks() {
            const course = document.getElementById("courseSelect").value;
            const year = document.getElementById("yearSelect").value;
            const bookSelect = document.getElementById("bookNameSelect");
            const otherBookDiv = document.getElementById("otherBookDiv");
            const hiddenBook = document.getElementById("bookName");

            // Clear old options
            bookSelect.innerHTML = "<option value=''>--Select Book--</option>";

            if (!course || !year) return;

            const selectedBooks = booksData[course]?.[year] || [];

            if (selectedBooks.length === 0) {
                const option = document.createElement("option");
                option.textContent = "No books found";
                option.value = "";
                bookSelect.appendChild(option);
            } else {
                selectedBooks.forEach(book => {
                    const option = document.createElement("option");
                    option.value = book;
                    option.textContent = book;
                    bookSelect.appendChild(option);
                });

                // ✅ Add Other option at last
                const otherOption = document.createElement("option");
                otherOption.value = "Other";
                otherOption.textContent = "Other";
                bookSelect.appendChild(otherOption);
            }

            // Hide "Other Book" field initially
            otherBookDiv.style.display = "none";
            hiddenBook.value = "";
        }

        function checkOtherBook() {
            const bookSelect = document.getElementById("bookNameSelect");
            const otherBookDiv = document.getElementById("otherBookDiv");
            const hiddenBook = document.getElementById("bookName");

            if (bookSelect.value === "Other") {
                otherBookDiv.style.display = "block";
                document.getElementById("otherBook").required = true;
                hiddenBook.value = "";
            } else {
                otherBookDiv.style.display = "none";
                document.getElementById("otherBook").required = false;
                hiddenBook.value = bookSelect.value;
            }
        }

        // 🔥 On form submit: agar Other select hai → wahi backend me bhejenge
        window.addEventListener("DOMContentLoaded", () => {
            const form = document.querySelector("form[action$='/book']");
            form.addEventListener("submit", function (e) {
                const bookSelect = document.getElementById("bookNameSelect");
                const otherBookInput = document.getElementById("otherBook");
                const hiddenBook = document.getElementById("bookName");

                if (bookSelect.value === "Other") {
                    if (otherBookInput.value.trim() === "") {
                        alert("Please enter the book name!");
                        e.preventDefault(); // stop submit
                    } else {
                        hiddenBook.value = otherBookInput.value.trim();
                    }
                }
            });

            // 🔥 Issue/Return date logic
            const issueDate = document.getElementById("issueDate");
            const returnDate = document.getElementById("returnDate");
            const today = new Date().toISOString().split("T")[0];

            issueDate.min = today;
            returnDate.disabled = true;

            issueDate.addEventListener("change", function () {
                if (issueDate.value) {
                    returnDate.disabled = false;
                    returnDate.min = issueDate.value; // Return date ≥ issue date
                } else {
                    returnDate.disabled = true;
                    returnDate.value = "";
                }
            });
        });
    </script>

<style>
body {
	background: linear-gradient(135deg, #0f172a, #4f46e5);
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	font-family: Arial, sans-serif;
	padding: 20px;
}

.card {
	width: 100%;
	max-width: 900px;
	background: #fff;
	border-radius: 20px;
	box-shadow: 0 12px 25px rgba(0, 0, 0, 0.2);
	padding: 30px;
	position: relative;
}

.card h2 {
	text-align: center;
	margin-bottom: 20px;
	font-weight: 700;
	color: #1e3c72;
}

.table th {
	background: #1e3c72;
	color: #fff;
}

.user-image {
	position: absolute;
	top: 20px;
	right: 20px;
	border-radius: 10px;
	object-fit: cover;
	width: 100px;
	height: 100px;
	border: 2px solid #ddd;
}

a.back-link {
	display: block;
	text-align: center;
	margin-top: 15px;
	text-decoration: none;
	color: #4f46e5;
	font-weight: bold;
}
</style>
</head>
<body>

	<div class="card">
		<!-- User Image -->
		<c:choose>
			<c:when test="${not empty library.imagePath}">
				<img class="user-image"
					src="${pageContext.request.contextPath}/${library.imagePath}"
					alt="User Image">
			</c:when>
			<c:otherwise>
				<img class="user-image"
					src="${pageContext.request.contextPath}/uploads/default.png"
					alt="Default Image">
			</c:otherwise>
		</c:choose>

		<h2>Book Issue / Return</h2>

		<!-- Book Issue Form -->
		<form action="${pageContext.request.contextPath}/book" method="post">
			<h4 class="mb-3">User Details</h4>
			<table class="table table-bordered">
				<tr>
					<th>Full Name</th>
					<td>${library.fullname}</td>
				</tr>
				<tr>
					<th>Email</th>
					<td>${library.email}</td>
				</tr>
				<tr>
					<th>Birthdate</th>
					<td>${library.birthdate}</td>
				</tr>
				<tr>
					<th>Address</th>
					<td>${library.address}</td>
				</tr>
				<tr>
					<th>Class</th>
					<td>${library.studentClass}</td>
				</tr>
				<tr>
					<th>College</th>
					<td>${library.college}</td>
				</tr>
				<tr>
					<th>Pincode</th>
					<td>${library.pincode}</td>
				</tr>
				<tr>
					<th>Mobile</th>
					<td>${library.phone}</td>
				</tr>
			</table>

			<h4 class="mb-3">Book Details</h4>
			<div class="row">
				<!-- Course Dropdown -->
				<div class="col-md-6 mb-3">
					<label class="form-label">Course</label> <select id="courseSelect"
						name="course" class="form-select" onchange="loadBooks()" required>
						<option value="">--Select Course--</option>
						<option value="BSc(CS)">BSc(CS)</option>
						<option value="BCom">BCom</option>
						<option value="BCA">BCA</option>
					</select>
				</div>

				<!-- Year Dropdown -->
				<div class="col-md-6 mb-3">
					<label class="form-label">Year</label> <select id="yearSelect"
						name="year" class="form-select" onchange="loadBooks()" required>
						<option value="">--Select Year--</option>
						<option value="FY">FY</option>
						<option value="SY">SY</option>
						<option value="TY">TY</option>
					</select>
				</div>
			</div>

			<!-- Book Name Dropdown -->
			<div class="mb-3">
				<label class="form-label">Book Name</label> <select
					id="bookNameSelect" class="form-select" onchange="checkOtherBook()"
					required>
					<option value="">--Select Book--</option>
				</select>
				<!-- Hidden input (backend me yahi jayega) -->
				<input type="hidden" name="bookName" id="bookName">
			</div>

			<!-- Other Book Input (Hidden by default) -->
			<div class="mb-3" id="otherBookDiv" style="display: none;">
				<label class="form-label">Enter Other Book Name</label> <input
					type="text" id="otherBook" class="form-control">
			</div>

			<div class="mb-3">
				<label class="form-label">ISBN</label> <input type="text"
					name="isbn" class="form-control" required>
			</div>

			<div class="mb-3">
				<label class="form-label">Issue Date</label> <input type="date"
					name="issueDate" id="issueDate" class="form-control" required>
			</div>

			<div class="mb-3">
				<label class="form-label">Return Date</label> <input type="date"
					name="returnDate" id="returnDate" class="form-control" required
					disabled>
			</div>

			<input type="hidden" name="libraryId" value="${library.id}">

			<button type="submit" class="btn btn-primary w-100 mt-3">Save
				Book Record</button>
		</form>

		<!-- Show My Books -->
		<form action="${pageContext.request.contextPath}/studentBooks"
			method="get">
			<input type="hidden" name="libraryId" value="${library.id}">
			<button type="submit" class="btn btn-success mt-3 w-100">Show
				My Books</button>
		</form>

		<!-- Back Link -->
		<a class="back-link" href="${pageContext.request.contextPath}/book">⬅
			Back to Book Form</a>
	</div>

</body>
</html>
