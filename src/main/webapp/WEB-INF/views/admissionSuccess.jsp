<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admission Success</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background: linear-gradient(to right, #ACB6E5, #74ebd5);
	font-family: 'Segoe UI', sans-serif;
}

.card {
	margin-top: 30px;
	padding: 30px;
	border-radius: 15px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
	background: #fff;
}

.section-title {
	font-weight: bold;
	font-size: 1.4rem;
	margin-top: 20px;
	margin-bottom: 10px;
	color: #333;
	border-bottom: 2px solid #74ebd5;
	padding-bottom: 5px;
}

.top-section {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	margin-bottom: 20px;
}

.personal-info, .contact-info, .parent-info, .academic-info,
	.course-info, .other-info {
	flex: 1;
}

.info-row {
	display: flex;
	gap: 15px;
	margin-bottom: 10px;
	flex-wrap: wrap;
}

.info-item {
	flex: 1 1 200px; /* responsive width */
	background: #f9f9f9;
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 8px 12px;
}

.img-right {
	width: 160px;
	border-radius: 10px;
	border: 3px solid #74ebd5;
}

.document-grid {
	display: flex;
	flex-wrap: wrap;
	gap: 15px;
	margin-top: 10px;
}

.document-item {
	border: 1px solid #ccc;
	padding: 8px;
	border-radius: 8px;
	background: #f9f9f9;
	text-align: center;
	width: 180px;
	font-size: 0.9rem;
}

.document-item img {
	max-width: 100%;
	height: auto;
	border-radius: 5px;
	margin-bottom: 5px;
}

.btn-print {
	margin-top: 20px;
	background: #74ebd5;
	color: #000;
	font-weight: bold;
	border-radius: 8px;
	padding: 8px 15px;
}

.btn-print:hover {
	background: #5ad1c5;
}
</style>
<script>
function printAdmission() {
    window.print();
}
</script>
</head>
<body>

	<div class="container">
		<div class="card" id="admissionCard">

			<c:if test="${admission.passportPhotoFileName != null}">
				<img class="img-right"
					src="uploads/${admission.passportPhotoFileName}"
					alt="Passport Photo">
			</c:if>
			<!-- Top Section with Passport Photo -->
			<div class="top-section">
				<div class="personal-info">
					<div class="section-title">Personal Information</div>
					<div class="info-row">
						<div class="info-item">
							<strong>Full Name:</strong> ${admission.fullName}
						</div>
						<div class="info-item">
							<strong>Gender:</strong> ${admission.gender}
						</div>
						<div class="info-item">
							<strong>Date of Birth:</strong> ${admission.dob}
						</div>
					</div>
					<div class="info-row">
						<div class="info-item">
							<strong>Age:</strong> ${admission.age}
						</div>
						<div class="info-item">
							<strong>Blood Group:</strong> ${admission.bloodGroup}
						</div>
						<div class="info-item">
							<strong>Religion:</strong> ${admission.religion}
						</div>
					</div>
					<div class="info-row">
						<div class="info-item">
							<strong>Nationality:</strong> ${admission.nationality}
						</div>
						<div class="info-item">
							<strong>Mother Tongue:</strong> ${admission.motherTongue}
						</div>
						<div class="info-item">
							<strong>Aadhaar Number:</strong> ${admission.aadhaarNumber}
						</div>
					</div>
					<div class="info-row">
						<div class="info-item">
							<strong>Passport Number:</strong> ${admission.passportNumber}
						</div>
						<div class="info-item">
							<strong>Category:</strong> ${admission.category}
						</div>
						<div class="info-item">
							<strong>Caste Certificate Number:</strong>
							${admission.casteCertificateNumber}
						</div>
					</div>
					<div class="info-row">
						<div class="info-item">
							<strong>Sub Caste:</strong> ${admission.subCaste}
						</div>
					</div>
				</div>
			</div>

			<!-- Contact Details -->
			<div class="section-title">Contact Details</div>
			<div class="info-row">
				<div class="info-item">
					<strong>Permanent Address:</strong> ${admission.permanentAddress}
				</div>
				<div class="info-item">
					<strong>Current Address:</strong> ${admission.currentAddress}
				</div>
				<div class="info-item">
					<strong>City:</strong> ${admission.city}
				</div>
			</div>
			<div class="info-row">
				<div class="info-item">
					<strong>State:</strong> ${admission.state}
				</div>
				<div class="info-item">
					<strong>Pincode:</strong> ${admission.pincode}
				</div>
				<div class="info-item">
					<strong>Mobile Number:</strong> ${admission.mobileNumber}
				</div>
			</div>
			<div class="info-row">
				<div class="info-item">
					<strong>Alternate Mobile:</strong> ${admission.alternateMobile}
				</div>
				<div class="info-item">
					<strong>Email:</strong> ${admission.email}
				</div>
			</div>

			<!-- Parent / Guardian Details -->
			<div class="section-title">Parent / Guardian Details</div>
			<div class="info-row">
				<div class="info-item">
					<strong>Father Name:</strong> ${admission.fatherName}
				</div>
				<div class="info-item">
					<strong>Mother Name:</strong> ${admission.motherName}
				</div>
				<div class="info-item">
					<strong>Guardian Name:</strong> ${admission.guardianName}
				</div>
			</div>
			<div class="info-row">
				<div class="info-item">
					<strong>Father Occupation:</strong> ${admission.fatherOccupation}
				</div>
				<div class="info-item">
					<strong>Mother Occupation:</strong> ${admission.motherOccupation}
				</div>
				<div class="info-item">
					<strong>Parent Phone:</strong> ${admission.parentPhone}
				</div>
			</div>
			<div class="info-row">
				<div class="info-item">
					<strong>Annual Income:</strong> ${admission.annualIncome}
				</div>
			</div>

			<!-- Academic Details -->
			<div class="section-title">Academic Details</div>
			<div class="info-row">
				<div class="info-item">
					<strong>10th School:</strong> ${admission.tenthSchool}
				</div>
				<div class="info-item">
					<strong>10th Board:</strong> ${admission.tenthBoard}
				</div>
				<div class="info-item">
					<strong>10th Year:</strong> ${admission.tenthYear}
				</div>
			</div>
			<div class="info-row">
				<div class="info-item">
					<strong>12th College:</strong> ${admission.twelfthCollege}
				</div>
				<div class="info-item">
					<strong>12th Board:</strong> ${admission.twelfthBoard}
				</div>
				<div class="info-item">
					<strong>12th Year:</strong> ${admission.twelfthYear}
				</div>
			</div>
			<div class="info-row">
				<div class="info-item">
					<strong>12th Board Seat No:</strong> ${admission.twelfthRollNo}
				</div>
				<div class="info-item">
					<strong>12th Marks:</strong> ${admission.twelfthMarks}
				</div>
				<div class="info-item">
					<strong>12th Stream:</strong> ${admission.twelfthStream}
				</div>
			</div>
			<div class="info-row">
				<div class="info-item">
					<strong>Fy Rollno:</strong> ${admission.diplomaDetails}
				</div>
				<div class="info-item">
					<strong>FY Mark/Pointer:</strong> ${admission.entranceExam}
				</div>
				<div class="info-item">
					<strong>Fy entrance Seat No:</strong> ${admission.entranceRollNo}
				</div>
			</div>
			<div class="info-row">
				<div class="info-item">
					<strong>Entrance Rank:</strong> ${admission.entranceRank}
				</div>
			</div>

			<!-- Course Details -->
			<div class="section-title">Course Details</div>
			<div class="info-row">
				<div class="info-item">
					<strong>Course Applied:</strong> ${admission.courseApplied}
				</div>
				<div class="info-item">
					<strong>Specialization:</strong> ${admission.specialization}
				</div>
				<div class="info-item">
					<strong>Admission Category:</strong> ${admission.admissionCategory}
				</div>
				<div class="info-item">
					<strong>Mode of Study:</strong> ${admission.modeOfStudy}
				</div>
			</div>


			<!-- Other Details -->
			<div class="section-title">Other Details</div>
			<div class="info-row">
				<div class="info-item">
					<strong>Hostel Required:</strong>
					<c:choose>
						<c:when test="${admission.hostelRequired}">Yes</c:when>
						<c:otherwise>No</c:otherwise>
					</c:choose>
				</div>
				<div class="info-item">
					<strong>Transport Required:</strong>
					<c:choose>
						<c:when test="${admission.transportRequired}">Yes</c:when>
						<c:otherwise>No</c:otherwise>
					</c:choose>
				</div>
				<div class="info-item">
					<strong>PWD:</strong>
					<c:choose>
						<c:when test="${admission.isPwd}">Yes</c:when>
						<c:otherwise>No</c:otherwise>
					</c:choose>
				</div>
				<div class="info-item">
					<strong>Scholarship Required:</strong>
					<c:choose>
						<c:when test="${admission.scholarshipRequired}">Yes</c:when>
						<c:otherwise>No</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="info-row">
				<div class="info-item">
					<strong>Local Guardian:</strong> ${admission.localGuardian}
				</div>
				<div class="info-item">
					<strong>Extracurricular Activities:</strong>
					${admission.extracurricular}
				</div>
			</div>


			<!-- Uploaded Documents -->
			<div class="section-title">Uploaded Documents</div>
			<div class="document-grid">
				<c:if test="${admission.passportPhotoFileName != null}">
					<div class="document-item">
						<img src="uploads/${admission.passportPhotoFileName}"
							alt="Passport Photo">
						<div>Passport Photo</div>
					</div>
				</c:if>
				<c:if test="${admission.aadhaarDocFileName != null}">
					<div class="document-item">
						<img src="uploads/${admission.aadhaarDocFileName}"
							alt="Aadhaar Document">
						<div>Aadhaar Document</div>
					</div>
				</c:if>
				<c:if test="${admission.birthCertFileName != null}">
					<div class="document-item">
						<img src="uploads/${admission.birthCertFileName}"
							alt="Birth Certificate">
						<div>Birth Certificate</div>
					</div>
				</c:if>
				<c:if test="${admission.transferCertFileName != null}">
					<div class="document-item">
						<img src="uploads/${admission.transferCertFileName}"
							alt="Transfer Certificate">
						<div>Transfer Certificate</div>
					</div>
				</c:if>
				<c:if test="${admission.leavingCertFileName != null}">
					<div class="document-item">
						<img src="uploads/${admission.leavingCertFileName}"
							alt="Leaving Certificate">
						<div>Leaving Certificate</div>
					</div>
				</c:if>
				<c:if test="${admission.migrationCertFileName != null}">
					<div class="document-item">
						<img src="uploads/${admission.migrationCertFileName}"
							alt="Migration Certificate">
						<div>Migration Certificate</div>
					</div>
				</c:if>
				<c:if test="${admission.casteCertFileName != null}">
					<div class="document-item">
						<img src="uploads/${admission.casteCertFileName}"
							alt="Caste Certificate">
						<div>Caste Certificate</div>
					</div>
				</c:if>
				<c:if test="${admission.incomeCertFileName != null}">
					<div class="document-item">
						<img src="uploads/${admission.incomeCertFileName}"
							alt="Income Certificate">
						<div>Income Certificate</div>
					</div>
				</c:if>
				<c:if test="${admission.domicileCertFileName != null}">
					<div class="document-item">
						<img src="uploads/${admission.domicileCertFileName}"
							alt="Domicile Certificate">
						<div>Domicile Certificate</div>
					</div>
				</c:if>
				<c:if test="${admission.characterCertFileName != null}">
					<div class="document-item">
						<img src="uploads/${admission.characterCertFileName}"
							alt="Character Certificate">
						<div>Character Certificate</div>
					</div>
				</c:if>
				<c:if test="${admission.gapCertFileName != null}">
					<div class="document-item">
						<img src="uploads/${admission.gapCertFileName}"
							alt="Gap Certificate">
						<div>Gap Certificate</div>
					</div>
				</c:if>
				<c:if test="${admission.sportsCertFileName != null}">
					<div class="document-item">
						<img src="uploads/${admission.sportsCertFileName}"
							alt="Sports Certificate">
						<div>Sports Certificate</div>
					</div>
				</c:if>
				<c:if test="${admission.medicalCertFileName != null}">
					<div class="document-item">
						<img src="uploads/${admission.medicalCertFileName}"
							alt="Medical Certificate">
						<div>Medical Certificate</div>
					</div>
				</c:if>
				<c:if test="${admission.entranceScoreCardFileName != null}">
					<div class="document-item">
						<img src="uploads/${admission.entranceScoreCardFileName}"
							alt="12th score card">
						<div>12th score card</div>
					</div>
				</c:if>

				<c:if test="${admission.fyMarkSheetFileName != null}">
					<div class="document-item">
						<img src="uploads/${admission.fyMarkSheetFileName}"
							alt="Fy mark Sheet">
						<div>Fy mark Sheet</div>
					</div>
				</c:if>
			</div>


			<!-- Print Button -->
			<div class="text-center">
				<button class="btn btn-print" onclick="printAdmission()">Print
					/ Download</button>
			</div>
    <a href="${pageContext.request.contextPath}/home.jsp" class="btn btn-secondary btn-sm float-end">⬅ Back to Home</a>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
