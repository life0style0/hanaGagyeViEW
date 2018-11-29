package kr.or.kosta;
/**
 * users 테이블 더미데이터 만들기 (비밀번호 인코딩 처리됨) 
 * testInsertMember() 사용
 * @author 송주현
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.or.kosta.salmon.domain.UserDTO;
import kr.or.kosta.salmon.mapper.UserMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
public class MemberTests {
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwEncoder;

	@Setter(onMethod_ = @Autowired)
	private DataSource datasource;

	@Inject
	private UserMapper usermapper;

	@Test
	public void testSelectMember() {
		String sql = "select * from users";
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = datasource.getConnection();
			pstmt = con.prepareStatement(sql);
		} catch (Exception e) {
		}
	}

	// Users 더미데이터 (i값 변경해서 쓰기) 비밀번호 1234
	@Test
	public void testInsertMember() {
		log.info(" users DUMMY 삽입 ");

		String createUserSql = "insert into users(user_id, user_nickname,user_email,user_passwd, user_gender,user_birthday,user_image) "
				+ "values(?, ?,?, ?, ?, ?,? )";

		String adminAuthSql = "insert into users_auth(user_auth_id, user_id, user_auth) values(users_auth_id_seq.nextval,?,'ROLE_ADMIN')";
		String managerAuthSql = "insert into users_auth(user_auth_id, user_id, user_auth) values(users_auth_id_seq.nextval,?,'ROLE_MEMBER')";
		String userAuthSql = "insert into users_auth(user_auth_id, user_id, user_auth) values(users_auth_id_seq.nextval,?,'ROLE_USER')";

		for (int i = 0; i < 20; i++) {
			Connection con = null;
			PreparedStatement pstmt = null;
			PreparedStatement adminAuthPstmt = null;
			PreparedStatement managerAuthPstmt = null;
			PreparedStatement userAuthPstmt = null;

			try {
				con = datasource.getConnection();
				pstmt = con.prepareStatement(createUserSql);
				userAuthPstmt = con.prepareStatement(userAuthSql);

				if (i == 0) {
					// 관리자 계정
					adminAuthPstmt = con.prepareStatement(adminAuthSql);
					managerAuthPstmt = con.prepareStatement(managerAuthSql);

					userAuthPstmt.setString(1, "admin"); // 아이디
					// userAuthPstmt.setString(2, "ROLE_USER"); //권한
					adminAuthPstmt.setString(1, "admin");
					// adminAuthPstmt.setString(2, "ROLE_ADMIN");
					managerAuthPstmt.setString(1, "admin");
					// managerAuthPstmt.setString(2, "ROLE_MANAGER");

					pstmt.setString(1, "admin"); // 아이디
					pstmt.setString(2, "admin"); // 닉네임
					pstmt.setString(3, "admin@admin.com"); // 이메일
					pstmt.setString(4, pwEncoder.encode("admin")); // 비밀번호 암호화
					pstmt.setString(5, "F"); // 성별
					pstmt.setString(6, "111111"); // 생년월일
					pstmt.setString(7, "https://t1.daumcdn.net/cfile/tistory/995A17455A409C9A28"); // 이미지
				} else if (i > 0 && i < 5) {
					// 관리권한 있는 사용자
					managerAuthPstmt = con.prepareStatement(managerAuthSql);

					userAuthPstmt.setString(1, "manager" + i); // 아이디
					// userAuthPstmt.setString(2, "ROLE_USER"); //권한
					managerAuthPstmt.setString(1, "manager" + i);
					// managerAuthPstmt.setString(2, "ROLE_MANAGER");

					pstmt.setString(1, "manager" + i); // 아이디
					pstmt.setString(2, "manager" + i); // 닉네임
					pstmt.setString(3, "manager" + i + "@mail.com"); // 이메일
					pstmt.setString(4, pwEncoder.encode("1234")); // 비밀번호 암호화
					pstmt.setString(5, "F"); // 성별
					pstmt.setString(6, "941225"); // 생년월일
					pstmt.setString(7, "https://t1.daumcdn.net/cfile/tistory/243C6749533255D51D"); // 이미지
				} else {
					// 일반 사용자
					userAuthPstmt.setString(1, "heyrim" + i); // 아이디
					// userAuthPstmt.setString(2, "ROLE_USER"); //권한

					pstmt.setString(1, "heyrim" + i); // 아이디
					pstmt.setString(2, "heyrim" + i); // 닉네임
					pstmt.setString(3, "heyrim" + i + "@mail.com"); // 이메일
					pstmt.setString(4, pwEncoder.encode("1234")); // 비밀번호 암호화
					pstmt.setString(5, "F"); // 성별
					pstmt.setString(6, "901111"); // 생년월일
					pstmt.setString(7, "https://notefolio.net/data/covers/39320_t2.jpg"); // 이미지
				}

				pstmt.executeUpdate(); // users 테이블
				userAuthPstmt.executeUpdate(); // users_auth 테이블
				if (managerAuthPstmt != null) {
					managerAuthPstmt.executeUpdate();
				}
				if (adminAuthPstmt != null) {
					adminAuthPstmt.executeUpdate();
				}
			} catch (Exception e) {

			} finally {
				if (pstmt != null) {
					try {
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (userAuthPstmt != null) {
					try {
						userAuthPstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (managerAuthPstmt != null) {
					try {
						managerAuthPstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (adminAuthPstmt != null) {
					try {
						adminAuthPstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if (con != null) {
					try {
						con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	// 회원가입 테스트
	@Test
	public void testCreateUser() {
		UserDTO user = new UserDTO();

		user.setUser_id("newid");
		user.setUser_nickname("newNickname");
		user.setUser_email("new@mail.com");
		user.setUser_birthday("941225");
		user.setUser_gender("F");
		user.setUser_passwd(pwEncoder.encode("1234"));
		user.setUser_image("https://notefolio.net/data/covers/39320_t2.jpg");

		usermapper.createUser(user);
		usermapper.insertUserAuth(user);

		log.info("회원가입 완료");
	}
}
