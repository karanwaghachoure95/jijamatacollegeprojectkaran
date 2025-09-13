package com.example.JijamataCollegeProject.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "admissions")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Admission {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    // Personal info
    @NotNull @Size(min=2,max=50) private String fullName;
    @NotNull private String gender;
    @NotNull private String dob;
    private Integer age;
    private String bloodGroup;
    private String religion;
    private String nationality;
    private String motherTongue;
    private String aadhaarNumber;
    private String passportNumber;
    private String category;
    private String casteCertificateNumber;
    private String subCaste;

    // Contact
    @NotNull private String permanentAddress;
    private String currentAddress;
    private String city;
    private String state;
    private String pincode;
    @NotNull @Pattern(regexp="^\\d{10}$") private String mobileNumber;
    private String alternateMobile;
    @NotNull @Email private String email;

    // Parent/Guardian
    private String fatherName;
    private String motherName;
    private String guardianName;
    private String fatherOccupation;
    private String motherOccupation;
    private String parentPhone;
    private Double annualIncome;

    // Academic
    private String tenthSchool;
    private String tenthBoard;
    private String tenthYear;
    private String tenthRollNo;
    private String tenthMarks;
    private String twelfthCollege;
    private String twelfthBoard;
    private String twelfthYear;
    private String twelfthRollNo;
    private String twelfthMarks;
    private String twelfthStream;
    private String diplomaDetails;
    private String entranceExam;
    private String entranceRollNo;
    private String entranceRank;

    // Course
    private String courseApplied;
    private String specialization;
    private String admissionCategory;
    private String modeOfStudy;

    // Documents – MultipartFile fields (not stored in DB)
    @Transient private MultipartFile passportPhoto;
    @Transient private MultipartFile aadhaarDoc;
    @Transient private MultipartFile birthCert;
    @Transient private MultipartFile transferCert;
    @Transient private MultipartFile leavingCert;
    @Transient private MultipartFile migrationCert;
    @Transient private MultipartFile casteCert;
    @Transient private MultipartFile incomeCert;
    @Transient private MultipartFile domicileCert;
    @Transient private MultipartFile characterCert;
    @Transient private MultipartFile gapCert;
    @Transient private MultipartFile sportsCert;
    @Transient private MultipartFile medicalCert;
    @Transient private MultipartFile entranceScoreCard;
    @Transient private MultipartFile fyMarkSheet;


    // Saved file names (DB me store hoga)
    private String passportPhotoFileName;
    private String aadhaarDocFileName;
    private String birthCertFileName;
    private String transferCertFileName;
    private String leavingCertFileName;
    private String migrationCertFileName;
    private String casteCertFileName;
    private String incomeCertFileName;
    private String domicileCertFileName;
    private String characterCertFileName;
    private String gapCertFileName;
    private String sportsCertFileName;
    private String medicalCertFileName;
    private String entranceScoreCardFileName;
    private String fyMarkSheetFileName;

    // Other
    private Boolean hostelRequired;
    private Boolean transportRequired;
    private String localGuardian;
    private Boolean isPwd;
    private Boolean scholarshipRequired;
    private String extracurricular;
    
    // 🆕 New column for form submission date
    @Column(name = "submitted_at")
    private Date submittedAt;

    @PrePersist   // Jab record save hoga tab automatically set ho jayega
    public void prePersist() {
        this.submittedAt = new Date(); // abhi ka current system timestamp set karega
    }
}
