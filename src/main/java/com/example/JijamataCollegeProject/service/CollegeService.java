package com.example.JijamataCollegeProject.service;

import java.time.LocalDate;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.JijamataCollegeProject.dao.CollegeDao;
import com.example.JijamataCollegeProject.entity.Admission;
import com.example.JijamataCollegeProject.entity.Book;
import com.example.JijamataCollegeProject.entity.CollageOtpSend;
import com.example.JijamataCollegeProject.entity.College;
import com.example.JijamataCollegeProject.entity.ContactUs;
import com.example.JijamataCollegeProject.entity.ContactUser;
import com.example.JijamataCollegeProject.entity.FyAdmission;
import com.example.JijamataCollegeProject.entity.Library;
import com.example.JijamataCollegeProject.entity.LibraryAdminOtp;
import com.example.JijamataCollegeProject.entity.Otp;
import com.example.JijamataCollegeProject.entity.TyAdmission;

@Service
public class CollegeService {

	@Autowired
	private CollegeDao dao;
	
	public boolean register(College user , String email , String username) {
		return dao.register(user,email,username);
	}

	public boolean contactUsPage(ContactUs user ,String email) {
		return dao.contactUsPage(user,email);
	}

	public boolean collagePage(College user, String email, String password) {
		return dao.collagePage(user,email,password);
		
	}

	public boolean forgotPassword(College user) {
		return dao.forgotPassword(user);
	}

	public boolean OtpCheck(Otp user) {
		return dao.OtpCheck(user);
	}

	public boolean saveOtp(Otp user1,String otp) {
		return dao.saveOtp(user1,otp);
	}

	public boolean setPassword(College user, String password) {

		return dao.setPassword(user,password);
	}

	public boolean handleForm(Library user) {
		return dao.handleForm(user);
		
	}

	public Library libraryLogin(String email, LocalDate birthdate) {
	    return dao.libraryLogin(email, birthdate);
	}

	public Library bookLogin(String email, String phone) {
	    return dao.bookLogin(email, phone);
	}

	public boolean book(Book user ) {
		return dao.book(user);
	}


	public Library getLibraryById(Long id) {
	    return dao.getLibraryById(id);
	}

	public List<Book> getBooksByLibrary(Long libraryId) {
		return  dao.getBooksByLibrary(libraryId);
	}

	
	 public boolean saveCollegeOtp(String otp, CollageOtpSend user) {
	        return dao.saveCollegeOtp(otp, user);
	    }

	    public boolean verifyOtp(CollageOtpSend user) {
	        return dao.verifyOtp(user);
	    }

		public List<Book> getBooksByCourseAndYear(String course, String year) {
			return  dao.getBooksByCourseAndYear(course,year);
		
		}

		public boolean save(Admission admission) {
			return dao.save(admission);
			
		}

		public boolean save(TyAdmission admission) {
			return dao.save(admission);
			
		}

		public boolean save(FyAdmission admission) {
			return dao.save(admission);
			
		}

		public List<ContactUs> findAll() {
            return dao.findAll();
		}
		
		public void deleteContact(Long id) {
		    dao.deleteContact(id);
		}

		public void deletelibrary(Long id) {
			dao.deletelibrary(id);
			
		}

		public List<Library> findAllLibrary() {
			return dao.findAllLibrary();
		}

		public boolean adminCheckOtp(String otp) {
			return dao.adminCheckOtp(otp);
			
		}

		public void saveAdminOtp(String otp , LibraryAdminOtp user) {
			dao.saveAdminOtp(otp,user);
			
		}

		public void saveContactAdminOtp(String otp, ContactUser user) {
			dao.saveContactAdminOtp(otp,user);
		}

		public boolean admincontactotpVerify(String otp) {
			return dao.admincontactotpVerify(otp);
		}

		public List<ContactUs> findAllContact() {
			return dao.findAllContact();
		}

		
		public List<FyAdmission> fyfindAll() {
			
			return dao.fyfindAll();
		}

		public List<Admission> syfindAll() {
			
			return dao.syfindAll();
		}

		public List<TyAdmission> tyfindAll() {
			
			return dao.tyfindAll();
		}

		
		public void deleteFyById(Long id) {
			
			dao.deleteFyById(id);
		}

		public void deleteSyById(Long id) {
		
			dao.deleteSyById(id);
		}

		public void deleteTyById(Long id) {
			dao.deleteTyById(id);
			
		}

		public void saveAdmissionOtp(String otp) {
			dao.saveAdmissionOtp(otp);
			
		}

		public boolean adminAdmissionotpVerify(String otp) {
			return dao.adminAdmissionotpVerify(otp);
		}

		public FyAdmission findById(Long admissionId) {
			return dao.getFyAdmissionById(admissionId);
		}

		public void update(FyAdmission admission) {
			dao.update(admission);
			
		}

		 public boolean saveUser(College user) {
		        // optional: check confirmPassword here
		        if (user.getConfirmPassword() != null && !user.getConfirmPassword().equals(user.getPassword())) {
		            return false;
		        }
		        return dao.saveUser(user);
		    }
		
		public List<College> findAllRegisterUser() {
			return dao.findAllRegisterUser();
		}

		public void deleteUserById(Integer id) {
			dao.deleteUserById(id);
			
		}

		public void save(String otp) {
			dao.save(otp);
			
		}

		public boolean checkRegisterOtp(String otp) {
			return dao.checkRegisterOtp(otp);
			
		}

}
