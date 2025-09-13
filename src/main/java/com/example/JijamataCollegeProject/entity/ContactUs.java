package com.example.JijamataCollegeProject.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.ToString;

@Entity
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ContactUs {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotBlank(message = "Name is required")
    @Size(max = 50, message = "Name must be less than 50 characters")
    private String name;

    @NotBlank(message = "Email is required")
    @Email(message = "Email should be valid")
    private String email;

    @NotBlank(message = "Phone number is required")
    @Size(max = 15, message = "Phone number must be less than 15 characters")
    private String phoneNumber;

    @NotBlank(message = "Message is required")
    @Size(max = 500, message = "Message must be less than 500 characters")
    private String message;
    
    // 🆕 New column for form submission date
    @Column(name = "submitted_at")
    private Date submittedAt;

    @PrePersist   // Jab record save hoga tab automatically set ho jayega
    public void prePersist() {
        this.submittedAt = new Date(); // abhi ka current system timestamp set karega
    }
}

