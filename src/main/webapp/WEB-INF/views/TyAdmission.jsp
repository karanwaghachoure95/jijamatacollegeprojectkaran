<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admission Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background: linear-gradient(to right, #74ebd5, #ACB6E5);
	font-family: 'Segoe UI', sans-serif;
}

.form-container {
	background: #fff;
	border-radius: 12px;
	padding: 30px;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
	margin-top: 40px;
}

.section-title {
	font-weight: bold;
	font-size: 1.3rem;
	margin-top: 20px;
	color: #333;
	border-bottom: 2px solid #74ebd5;
	padding-bottom: 5px;
}

.btn-custom {
	background: #74ebd5;
	color: #000;
	font-weight: bold;
	border-radius: 30px;
}

.btn-custom:hover {
	background: #5ad1c5;
}

img.uploaded-photo {
	border: 2px solid #ccc;
	border-radius: 8px;
	padding: 3px;
	margin-top: 5px;
}
</style>
</head>
<body>

	<div class="container">
		<div class="form-container">
			<h2 class="text-center mb-4">Admission Form</h2>

			<form:form method="post" modelAttribute="TYadmission"
				enctype="multipart/form-data">

				<!-- Personal Information -->
				<div class="section-title">Personal Information</div>
				<div class="row">
					<div class="col-md-6 mb-3">
						<form:label path="fullName">Full Name</form:label>
						<form:input path="fullName" cssClass="form-control" />
					</div>
					<div class="col-md-3 mb-3">
						<form:label path="gender">Gender</form:label>
						<form:select path="gender" cssClass="form-select">
							<form:option value="">Select</form:option>
							<form:option value="Male">Male</form:option>
							<form:option value="Female">Female</form:option>
							<form:option value="Other">Other</form:option>
						</form:select>
					</div>
					<div class="col-md-3 mb-3">
						<form:label path="dob">Date of Birth</form:label>
						<form:input path="dob" type="date" cssClass="form-control" />
					</div>
				</div>


				<div class="row">
					<div class="col-md-3 mb-3">
						<form:label path="age">Age</form:label>
						<form:input path="age" type="number" cssClass="form-control" />
					</div>
					<div class="col-md-3 mb-3">
						<form:label path="bloodGroup">Blood Group</form:label>
						<form:input path="bloodGroup" cssClass="form-control" />
					</div>
					<div class="col-md-3 mb-3">
						<form:label path="religion">Religion</form:label>
						<form:input path="religion" cssClass="form-control" />
					</div>
					<div class="col-md-3 mb-3">
						<form:label path="nationality">Nationality</form:label>
						<form:input path="nationality" cssClass="form-control" />
					</div>
				</div>

				<div class="row">
					<div class="col-md-3 mb-3">
						<form:label path="motherTongue">Mother Tongue</form:label>
						<form:input path="motherTongue" cssClass="form-control" />
					</div>
					<div class="col-md-3 mb-3">
						<form:label path="aadhaarNumber">Aadhaar Number</form:label>
						<form:input path="aadhaarNumber" cssClass="form-control" />
					</div>
					<div class="col-md-3 mb-3">
						<form:label path="passportNumber">Passport Number</form:label>
						<form:input path="passportNumber" cssClass="form-control" />
					</div>
					<div class="col-md-3 mb-3">
						<form:label path="category">Category</form:label>
						<form:input path="category" cssClass="form-control" />
					</div>
				</div>

				<div class="row">
					<div class="col-md-6 mb-3">
						<form:label path="casteCertificateNumber">Caste Certificate Number</form:label>
						<form:input path="casteCertificateNumber" cssClass="form-control" />
					</div>
					<div class="col-md-6 mb-3">
						<form:label path="subCaste">Sub Caste</form:label>
						<form:input path="subCaste" cssClass="form-control" />
					</div>
				</div>
				<!-- Contact Details -->
				<div class="section-title">Contact Details</div>
				<div class="row">
					<div class="col-md-6 mb-3">
						<form:label path="permanentAddress">Permanent Address</form:label>
						<form:textarea path="permanentAddress" cssClass="form-control"
							rows="2" />
					</div>
					<div class="col-md-6 mb-3">
						<form:label path="currentAddress">Current Address</form:label>
						<form:textarea path="currentAddress" cssClass="form-control"
							rows="2" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-4 mb-3">
						<form:label path="city">City</form:label>
						<form:input path="city" cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="state">State</form:label>
						<form:input path="state" cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="pincode">Pincode</form:label>
						<form:input path="pincode" cssClass="form-control" />
					</div>
				</div>

				<div class="row">
					<div class="col-md-4 mb-3">
						<form:label path="mobileNumber">Mobile Number</form:label>
						<form:input path="mobileNumber" cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="alternateMobile">Alternate Mobile</form:label>
						<form:input path="alternateMobile" cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="email">Email</form:label>
						<form:input path="email" cssClass="form-control" />
					</div>
				</div>

				<!-- Parent / Guardian Details -->
				<div class="section-title">Parent / Guardian Details</div>
				<div class="row">
					<div class="col-md-4 mb-3">
						<form:label path="fatherName">Father Name</form:label>
						<form:input path="fatherName" cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="motherName">Mother Name</form:label>
						<form:input path="motherName" cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="guardianName">Guardian Name</form:label>
						<form:input path="guardianName" cssClass="form-control" />
					</div>
				</div>


				<div class="row">
					<div class="col-md-4 mb-3">
						<form:label path="fatherOccupation">Father Occupation</form:label>
						<form:input path="fatherOccupation" cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="motherOccupation">Mother Occupation</form:label>
						<form:input path="motherOccupation" cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="parentPhone">Parent Phone</form:label>
						<form:input path="parentPhone" cssClass="form-control" />
					</div>
				</div>

				<div class="row">
					<div class="col-md-4 mb-3">
						<form:label path="annualIncome">Annual Income</form:label>
						<form:input path="annualIncome" type="number" step="0.01"
							cssClass="form-control" />
					</div>
				</div>
				<!-- Academic Details -->
				<div class="section-title">Academic Details</div>
				<div class="row">
					<div class="col-md-4 mb-3">
						<form:label path="tenthSchool">10th School</form:label>
						<form:input path="tenthSchool" cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="tenthBoard">10th Board</form:label>
						<form:input path="tenthBoard" cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="tenthYear">10th Year</form:label>
						<form:input path="tenthYear" cssClass="form-control" />
					</div>
				</div>


				<div class="row">
					<div class="col-md-4 mb-3">
						<form:label path="twelfthCollege">12th College</form:label>
						<form:input path="twelfthCollege" cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="twelfthBoard">12th Board</form:label>
						<form:input path="twelfthBoard" cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="twelfthYear">12th Year</form:label>
						<form:input path="twelfthYear" cssClass="form-control" />
					</div>
				</div>

				<div class="row">
					<div class="col-md-4 mb-3">
						<form:label path="twelfthRollNo">12th Board Seat No</form:label>
						<form:input path="twelfthRollNo" cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="twelfthMarks">12th Marks</form:label>
						<form:input path="twelfthMarks" cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="twelfthStream">12th Stream</form:label>
						<form:input path="twelfthStream" cssClass="form-control" />
					</div>
				</div>

				<div class="row">
					<div class="col-md-4 mb-3">
						<form:label path="fyrollno">FY Rollno</form:label>
						<form:input path="fyrollno" cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="fymark">FY Mark/Pointer</form:label>
						<form:input path="fymark" cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="fyentranceRollNo">FY entrance Seat No</form:label>
						<form:input path="fyentranceRollNo" cssClass="form-control" />
					</div>
				</div>
				<div class="row">
					<div class="col-md-4 mb-3">
						<form:label path="diplomaDetails">SY Rollno</form:label>
						<form:input path="diplomaDetails" cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="entranceExam">SY Mark/Pointer</form:label>
						<form:input path="entranceExam" cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="entranceRollNo">SY entrance Seat No</form:label>
						<form:input path="entranceRollNo" cssClass="form-control" />
					</div>
				</div>

				<div class="row">
					<div class="col-md-4 mb-3">
						<form:label path="entranceRank">Entrance Rank (A, A+ ,O, B, B+ ,D)</form:label>
						<form:input path="entranceRank" cssClass="form-control" />
					</div>
				</div>

				<!-- Course Details -->
				<div class="section-title">Course Details</div>
				<div class="row">
					<div class="col-md-6 mb-3">
						<form:label path="courseApplied">Course Applied</form:label>
						<form:input path="courseApplied" cssClass="form-control" />
					</div>
					<div class="col-md-6 mb-3">
						<form:label path="specialization">Specialization</form:label>
						<form:input path="specialization" cssClass="form-control" />
					</div>
				</div>

				<div class="row">
					<div class="col-md-6 mb-3">
						<form:label path="admissionCategory">Admission Category</form:label>
						<form:input path="admissionCategory" cssClass="form-control" />
					</div>
					<div class="col-md-6 mb-3">
						<form:label path="modeOfStudy">Mode Of Study</form:label>
						<form:input path="modeOfStudy" cssClass="form-control" />
					</div>
				</div>

				<!-- Upload Passport Photo -->
				<div class="section-title">Upload Documents</div>
				<div class="mb-3">
					<form:label path="passportPhoto">Passport Photo</form:label>
					<form:input path="passportPhoto" type="file"
						cssClass="form-control" />
				</div>


				<!-- Other Documents Upload -->
				<div class="row">
					<div class="col-md-4 mb-3">
						<form:label path="aadhaarDoc">Aadhaar Document</form:label>
						<form:input path="aadhaarDoc" type="file" cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="birthCert">Birth Certificate</form:label>
						<form:input path="birthCert" type="file" cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="transferCert">Transfer Certificate</form:label>
						<form:input path="transferCert" type="file"
							cssClass="form-control" />
					</div>
				</div>


				<div class="row">
					<div class="col-md-4 mb-3">
						<form:label path="leavingCert">Leaving Certificate</form:label>
						<form:input path="leavingCert" type="file" cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="migrationCert">Migration Certificate</form:label>
						<form:input path="migrationCert" type="file"
							cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="casteCert">Caste Certificate</form:label>
						<form:input path="casteCert" type="file" cssClass="form-control" />
					</div>
				</div>

				<div class="row">
					<div class="col-md-4 mb-3">
						<form:label path="incomeCert">Income Certificate</form:label>
						<form:input path="incomeCert" type="file" cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="domicileCert">Domicile Certificate</form:label>
						<form:input path="domicileCert" type="file"
							cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="characterCert">Character Certificate</form:label>
						<form:input path="characterCert" type="file"
							cssClass="form-control" />
					</div>
				</div>

				<div class="row">
					<div class="col-md-4 mb-3">
						<form:label path="gapCert">Gap Certificate</form:label>
						<form:input path="gapCert" type="file" cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="sportsCert">Sports Certificate</form:label>
						<form:input path="sportsCert" type="file" cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="medicalCert">Medical Certificate</form:label>
						<form:input path="medicalCert" type="file" cssClass="form-control" />
					</div>
				</div>

				<div class="row">
					<div class="col-md-4 mb-3">
						<form:label path="fyMarkSheet">Fy Mark Sheet</form:label>
						<form:input path="fyMarkSheet" type="file" cssClass="form-control" />
					</div>
					<div class="col-md-4 mb-3">
						<form:label path="syMarkSheet">Sy Mark Sheet</form:label>
						<form:input path="syMarkSheet" type="file" cssClass="form-control" />
					</div>
				</div>

				<div class="row">
					<div class="col-md-4 mb-3">
						<form:label path="entranceScoreCard">12th Score Card</form:label>
						<form:input path="entranceScoreCard" type="file"
							cssClass="form-control" />
					</div>
				</div>

				<!-- Other Details -->
				<div class="section-title">Other Details</div>
				<div class="row">
					<div class="col-md-3 mb-3">
						<form:label path="hostelRequired">Hostel Required</form:label>
						<form:checkbox path="hostelRequired" />
					</div>
					<div class="col-md-3 mb-3">
						<form:label path="transportRequired">Transport Required</form:label>
						<form:checkbox path="transportRequired" />
					</div>
					<div class="col-md-3 mb-3">
						<form:label path="isPwd">PWD</form:label>
						<form:checkbox path="isPwd" />
					</div>
					<div class="col-md-3 mb-3">
						<form:label path="scholarshipRequired">Scholarship Required</form:label>
						<form:checkbox path="scholarshipRequired" />
					</div>
				</div>

				<div class="row">
					<div class="col-md-6 mb-3">
						<form:label path="localGuardian">Local Guardian</form:label>
						<form:input path="localGuardian" cssClass="form-control" />
					</div>
					<div class="col-md-6 mb-3">
						<form:label path="extracurricular">Extracurricular Activities</form:label>
						<form:textarea path="extracurricular" cssClass="form-control"
							rows="2" />
					</div>
				</div>
					<!-- Payment QR Code -->
				<div class="qr-section" style="text-align: center; margin: 20px 0;">
					<img class="qr-code" src="images/Scanner.jpg" alt="Payment QR Code"
						style="width: 180px; height: 180px; border: 2px solid #ddd; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);">
					<div style="margin-top: 10px; font-weight: bold;">Pay the 150 rupees payment and this payment receipt add form page</div>
					<div style="margin-top: 10px; font-weight: bold;">Payment QR
						Code</div>
				</div>


				<!-- Submit Button -->
				<div class="text-center mt-4">
					<button type="submit" class="btn btn-custom px-4">Submit</button>
				</div>
			</form:form>
		</div>
	</div>

	<!-- Bootstrap JS Bundle -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
