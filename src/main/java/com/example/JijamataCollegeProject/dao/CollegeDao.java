package com.example.JijamataCollegeProject.dao;

import java.time.LocalDate;
import java.util.Collections;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.JijamataCollegeProject.entity.Admission;
import com.example.JijamataCollegeProject.entity.AdmissionOtp;
import com.example.JijamataCollegeProject.entity.Book;
import com.example.JijamataCollegeProject.entity.CollageOtpSend;
import com.example.JijamataCollegeProject.entity.College;
import com.example.JijamataCollegeProject.entity.ContactUs;
import com.example.JijamataCollegeProject.entity.ContactUser;
import com.example.JijamataCollegeProject.entity.FyAdmission;
import com.example.JijamataCollegeProject.entity.Library;
import com.example.JijamataCollegeProject.entity.LibraryAdminOtp;
import com.example.JijamataCollegeProject.entity.Otp;
import com.example.JijamataCollegeProject.entity.RegisterOtp;
import com.example.JijamataCollegeProject.entity.TyAdmission;

@Repository
public class CollegeDao {

	@Autowired
	SessionFactory factory;

	public boolean register(College user, String email, String username) {
		try (Session session = factory.openSession();) {
			Transaction tx = session.beginTransaction();
			List<Object[]> inf = session.createQuery("select email , username from College", Object[].class)
					.getResultList();
			for (Object row[] : inf) {
				String emails = (String) row[0];
				String usernames = (String) row[1];

				if (emails.contains(email) || usernames.contains(username)) {
					return false;
				}
			}
			session.save(user);
			tx.commit();
			return true;

		} catch (IllegalAccessError e) {
			System.out.println("Session can't open");
			return false;
		}

	}

	public boolean saveUser(College user) {
		Transaction tx = null;
		try (Session session = factory.openSession()) {
			tx = session.beginTransaction();
			session.save(user);
			tx.commit();
			return true;
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
			return false;
		}
	}

	public List<College> findAllRegisterUser() {
		try (Session session = factory.openSession()) {
			return session.createQuery("from College", College.class).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}

	public boolean contactUsPage(ContactUs user, String email) {
		try (Session session = factory.openSession();) {
			Transaction tx = session.beginTransaction();
			List<String> emails = session.createQuery("select email from ContactUs", String.class).getResultList();

			if (emails.contains(email)) {
				return false;

			}
			session.save(user);
			tx.commit();
			return true;

		} catch (IllegalAccessError e) {
			System.out.println("Please check insert , something put wrong");
			return false;
		}
	}

	public boolean collagePage(College user, String email, String password) {
		try (Session session = factory.openSession();) {
			List<Object[]> inf = session
					.createQuery("select email , password ,confirmPassword from College", Object[].class)
					.getResultList();
			for (Object row[] : inf) {
				String emails = (String) row[0];
				String passwords = (String) row[1];
				String confirmPassword = (String) row[2];

				if (email.contains(emails) && password.equals(passwords) || password.equals(confirmPassword)) {
					return true;
				}
			}
			return false;

		} catch (IllegalAccessError e) {
			System.out.println("Session can't open");
			return false;
		}
	}

	public boolean forgotPassword(College user) {
		try (Session session = factory.openSession()) {
			List<String> email = session.createQuery("select email from  College", String.class).getResultList();
			if (email.contains(user.getEmail())) {
				return true;
			} else {
				return false;
			}
		} catch (IllegalAccessError e) {
			System.out.println("Session can't open");
			return false;
		}
	}

	public boolean saveOtp(Otp user1, String otp) {
		try (Session session = factory.openSession()) {
			Transaction tx = session.beginTransaction();
			user1.setOtp(otp);
			session.save(user1);
			tx.commit();
			return true;
		} catch (IllegalAccessError e) {
			System.out.println("Session can't open");
			return false;
		}

	}

	public boolean OtpCheck(Otp user) {
		try (Session session = factory.openSession()) {
			List<String> otp = session.createQuery("select otp from  Otp", String.class).getResultList();
			if (otp.contains(user.getOtp())) {
				return true;
			} else {
				return false;
			}
		} catch (IllegalAccessError e) {
			System.out.println("Session can't open");
			return false;
		}

	}

	public boolean setPassword(College user, String password) {
		try (Session session = factory.openSession()) {
			session.beginTransaction();

			int updated = session.createQuery("UPDATE College SET password = :pass WHERE email = :email")
					.setParameter("pass", password).setParameter("email", user.getEmail()).executeUpdate();

			session.getTransaction().commit();
			return updated > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean handleForm(Library user) {
		Session session = factory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction(); // ✅ Transaction start pehle
			session.save(user); // Save object
			tx.commit(); // Commit transaction
			return true;
		} catch (Exception e) {
			if (tx != null)
				tx.rollback(); // Rollback if error
			e.printStackTrace();
			return false; // ❌ Error me true nahi dena
		} finally {
			session.close(); // Session close
		}

	}

	public Library libraryLogin(String email, LocalDate birthdate) {
		try (Session session = factory.openSession()) {
			// Query to get Library record by email and birthdate
			List<Library> list = session
					.createQuery("FROM Library WHERE email = :email AND birthdate = :birthdate", Library.class)
					.setParameter("email", email).setParameter("birthdate", birthdate).getResultList();

			if (!list.isEmpty()) {
				return list.get(0); // first matching user
			} else {
				return null; // no match found
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Library bookLogin(String email, String phone) {
		try (Session session = factory.openSession()) {
			// Query to get Library record by email and birthdate
			List<Library> list = session
					.createQuery("FROM Library WHERE email = :email AND phone = :phone", Library.class)
					.setParameter("email", email).setParameter("phone", phone).getResultList();

			if (!list.isEmpty()) {
				return list.get(0); // first matching user
			} else {
				return null; // no match found
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public boolean book(Book book) {
		Transaction tx = null;
		try (Session session = factory.openSession()) {
			tx = session.beginTransaction();

			// ✅ libraryUser null check
			if (book.getLibraryUser() == null) {
				throw new RuntimeException("Library user must be set before saving the book!");
			}

			session.save(book);
			tx.commit();
			return true;
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
			return false;
		}
	}

	public Library getLibraryById(Long id) {
		Session session = factory.openSession();
		Library library = session.get(Library.class, id);
		session.close();
		return library;
	}

	public List<Book> getBooksByLibrary(Long libraryId) {
		Session session = factory.openSession();
		CriteriaBuilder cb = session.getCriteriaBuilder();
		javax.persistence.criteria.CriteriaQuery<Book> cq = cb.createQuery(Book.class);
		Root<Book> root = cq.from(Book.class);
		cq.select(root).where(cb.equal(root.get("libraryUser").get("id"), libraryId));
		List<Book> books = session.createQuery(cq).getResultList();
		session.close();
		return books;
	}

	public boolean saveCollegeOtp(String otp, CollageOtpSend user) {
		try (Session session = factory.openSession()) {
			Transaction tx = session.beginTransaction();
			user.setOtp(otp);
			session.save(user);
			tx.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean verifyOtp(CollageOtpSend user) {
		try (Session session = factory.openSession()) {
			Transaction tx = session.beginTransaction();

			// 1. Get latest record (highest id)
			CollageOtpSend latest = session
					.createQuery("from CollageOtpSend c order by c.id desc", CollageOtpSend.class).setMaxResults(1)
					.uniqueResult();

			if (latest == null) {
				tx.commit();
				return false;
			}

			// 2. Delete all except latest
			session.createQuery("delete from CollageOtpSend c where c.id != :latestId")
					.setParameter("latestId", latest.getId()).executeUpdate();

			tx.commit();

			// 3. Check OTP
			return latest.getOtp().equals(user.getOtp());
		}

	}

	public List<Book> getBooksByCourseAndYear(String course, String year) {
		Session session = factory.openSession();
		List<Book> books = null;
		try {
			books = session.createQuery("FROM Book WHERE course = :course AND year = :year", Book.class)
					.setParameter("course", course).setParameter("year", year).getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return books;
	}

	public boolean save(Admission admission) {
		Transaction tx = null;
		try (Session session = factory.openSession()) {
			tx = session.beginTransaction(); // ✅ pehle transaction start
			session.save(admission); // save
			tx.commit(); // ✅ commit karo
			return true;
		} catch (Exception e) {
			if (tx != null)
				tx.rollback(); // rollback on error
			e.printStackTrace();
			return false;
		}
	}

	public boolean save(TyAdmission admission) {
		Transaction tx = null;
		try (Session session = factory.openSession()) {
			tx = session.beginTransaction();
			session.save(admission);
			tx.commit();
			return true;
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
			return false;
		}
	}

	public boolean save(FyAdmission admission) {
		Transaction tx = null;
		try (Session session = factory.openSession()) {
			tx = session.beginTransaction();
			session.save(admission);
			tx.commit();
			return true;
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
			return false;
		}
	}

	public List<ContactUs> findAll() {
		try (Session session = factory.openSession()) {
			return session.createQuery("from ContactUs", ContactUs.class).getResultList();
		}
	}

	public void deleteContact(Long id) {
		Transaction tx = null;
		try (Session session = factory.openSession()) {
			tx = session.beginTransaction();
			ContactUs contact = session.get(ContactUs.class, id);
			if (contact != null) {
				session.delete(contact);
			}
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
	}

	public List<Library> findAllLibrary() {
		try (Session session = factory.openSession()) {
			return session.createQuery("from Library", Library.class).getResultList();
		}
	}

	public void deletelibrary(Long id) {
		Transaction tx = null;
		try (Session session = factory.openSession()) {
			tx = session.beginTransaction();
			Library member = session.get(Library.class, id);
			if (member != null) {
				session.delete(member);
			}
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
	}

	public boolean adminCheckOtp(String otp) {
		try (Session session = factory.openSession()) {
			Transaction tx = session.beginTransaction();

			// 1. Get latest record (highest id)
			LibraryAdminOtp latest = session
					.createQuery("from LibraryAdminOtp l order by l.id desc", LibraryAdminOtp.class).setMaxResults(1)
					.uniqueResult();

			if (latest == null) {
				tx.commit();
				return false;
			}

			// 2. Delete all except latest
			session.createQuery("delete from LibraryAdminOtp l where l.id != :latestId")
					.setParameter("latestId", latest.getId()).executeUpdate();

			tx.commit();

			// 3. Check OTP
			return latest.getOtp().equals(otp);
		}

	}

	public void saveAdminOtp(String otp, LibraryAdminOtp user) {
		Session session = factory.openSession();
		user.setOtp(otp);
		session.save(user);
		session.beginTransaction().commit();

	}

	public List<ContactUs> findAllContact() {
		try (Session session = factory.openSession()) {
			return session.createQuery("from ContactUs", ContactUs.class).getResultList();
		}
	}

	public void saveContactAdminOtp(String otp, ContactUser user) {
		Session session = factory.openSession();
		user.setOtp(otp);
		session.save(user);
		session.beginTransaction().commit();

	}

	public boolean admincontactotpVerify(String otp) {
		try (Session session = factory.openSession()) {
			Transaction tx = session.beginTransaction();

			// 1. Get latest record (highest id)
			ContactUser latest = session.createQuery("from ContactUser u order by u.id desc", ContactUser.class)
					.setMaxResults(1).uniqueResult();

			if (latest == null) {
				tx.commit();
				return false;
			}

			// 2. Delete all except latest
			session.createQuery("delete from ContactUser u where u.id != :latestId")
					.setParameter("latestId", latest.getId()).executeUpdate();

			tx.commit();

			// 3. Check OTP
			return latest.getOtp().equals(otp);
		}
	}

	public List<FyAdmission> fyfindAll() {
		try (Session session = factory.openSession()) {
			return session.createQuery("from FyAdmission", FyAdmission.class).getResultList();
		}
	}

	public List<Admission> syfindAll() {
		try (Session session = factory.openSession()) {
			return session.createQuery("from Admission", Admission.class).getResultList();
		}
	}

	public List<TyAdmission> tyfindAll() {
		try (Session session = factory.openSession()) {
			return session.createQuery("from TyAdmission", TyAdmission.class).getResultList();
		}
	}

	public void deleteFyById(Long id) {
		try (Session session = factory.openSession()) {
			session.beginTransaction();
			FyAdmission student = session.get(FyAdmission.class, id);
			if (student != null) {
				session.delete(student);
			}
			session.getTransaction().commit();
		}
	}

	public void deleteSyById(Long id) {
		try (Session session = factory.openSession()) {
			session.beginTransaction();
			Admission student = session.get(Admission.class, id);
			if (student != null) {
				session.delete(student);
			}
			session.getTransaction().commit();
		}
	}

	public void deleteTyById(Long id) {
		try (Session session = factory.openSession()) {
			session.beginTransaction();
			TyAdmission student = session.get(TyAdmission.class, id);
			if (student != null) {
				session.delete(student);
			}
			session.getTransaction().commit();
		}
	}

	public void saveAdmissionOtp(String otp) {
		AdmissionOtp user = new AdmissionOtp();

		Session session = factory.openSession();
		user.setOtp(otp);
		session.save(user);
		session.beginTransaction().commit();
	}

	public boolean adminAdmissionotpVerify(String otp) {
		try (Session session = factory.openSession()) {
			Transaction tx = session.beginTransaction();

			// 1. Get latest record (highest id)
			AdmissionOtp latest = session.createQuery("from AdmissionOtp u order by u.id desc", AdmissionOtp.class)
					.setMaxResults(1).uniqueResult();

			if (latest == null) {
				tx.commit();
				return false;
			}

			// 2. Delete all except latest
			session.createQuery("delete from AdmissionOtp u where u.id != :latestId")
					.setParameter("latestId", latest.getId()).executeUpdate();

			tx.commit();

			// 3. Check OTP
			return latest.getOtp().equals(otp);
		}
	}

	public FyAdmission getFyAdmissionById(Long admissionId) {
		try (Session session = factory.openSession()) {
			return session.get(FyAdmission.class, admissionId); // DB se ek hi record fetch
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public void update(FyAdmission admission) {
		Transaction tx = null;
		try (Session session = factory.openSession()) {
			tx = session.beginTransaction();
			session.update(admission); // 🔹 Existing record update karega
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		}
	}

	public void deleteUserById(Integer id) {
	    Transaction tx = null;
	    try (Session session = factory.openSession()) {
	        tx = session.beginTransaction();

	        // College entity ko id se fetch karo
	        College user = session.get(College.class, id);

	        if (user != null) {
	            session.delete(user);  // record delete karo
	        }

	        tx.commit();
	    } catch (Exception e) {
	        if (tx != null) tx.rollback();
	        e.printStackTrace();
	    }
	}

	public void save(String otp) {
		RegisterOtp user = new RegisterOtp();
		Session session = factory.openSession();
		user.setOtp(otp);
		session.save(user);
		session.beginTransaction().commit();
	}

	public boolean checkRegisterOtp(String otp) {
		try (Session session = factory.openSession()) {
			Transaction tx = session.beginTransaction();

			// 1. Get latest record (highest id)
			RegisterOtp latest = session.createQuery("from RegisterOtp u order by u.id desc", RegisterOtp.class)
					.setMaxResults(1).uniqueResult();

			if (latest == null) {
				tx.commit();
				return false;
			}

			// 2. Delete all except latest
			session.createQuery("delete from RegisterOtp u where u.id != :latestId")
					.setParameter("latestId", latest.getId()).executeUpdate();

			tx.commit();

			// 3. Check OTP
			return latest.getOtp().equals(otp);
		}
		
	}


}
