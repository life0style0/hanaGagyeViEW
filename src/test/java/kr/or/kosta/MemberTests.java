package kr.or.kosta;
/**
 * users 테이블 더미데이터 만들기 (비밀번호 인코딩 처리됨) 
 * testInsertMember() 사용
 * block 유저 권한 변경에 따라 수정됨 (12.11)
 * @author 송주현
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.or.kosta.salmon.domain.CategoryDTO_sjh;
import kr.or.kosta.salmon.domain.PsnScoreDTO;
import kr.or.kosta.salmon.domain.RegistUserDTO;
import kr.or.kosta.salmon.domain.UserDTO;
import kr.or.kosta.salmon.domain.UserLocAndCatsDTO;
import kr.or.kosta.salmon.mapper.UserMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml","file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class MemberTests {
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwEncoder;
	
	@Setter(onMethod_ = @Autowired)
	private DataSource datasource;
	
	@Inject
	private UserMapper usermapper;
	
//	@Test
	public void testSelectMember() {
		String sql="select * from users";
		Connection con=null;
		PreparedStatement pstmt= null;
		
		try {
			con=datasource.getConnection();
			pstmt = con.prepareStatement(sql);
			log.info(pstmt);
		}catch (Exception e) {
		}
	}
	
	
//	@Test
	public void testRand() {
		for (int i = 0; i < 60; i++) {
		//	double randval= Math.random()*(99-70+1)+70;
			//log.info((int)randval);
			//log.info(getRandYear());
			log.info(getRandCatId());
		}
	}
	
	public int getRandYear() {
		return (int)(Math.random()*(99-70+1)+70);
	}
	public int getRandCatId() {
		return(int) (Math.random()*(16-1+1)+1);
	}
	
	//Users 더미데이터 (i값 변경해서 쓰기) 비밀번호 1234
	//block 유저 권한 변경에 따라 수정됨 (12.11)
	@Test
	public void testInsertMember() {
		log.info(" users DUMMY 삽입 ");
		
		String createUserSql="insert into users(user_id, user_nickname,user_email,user_passwd, user_gender,user_birthday,user_image, user_regdate) "+
				"values(?, ?,?, ?, ?, ?,?,add_months(sysdate, -1))";
		
		String adminAuthSql="insert into users_auth(user_auth_id, user_id, user_auth) values(users_auth_id_seq.nextval,?,'ROLE_ADMIN')";
		String managerAuthSql="insert into users_auth(user_auth_id, user_id, user_auth) values(users_auth_id_seq.nextval,?,'ROLE_MEMBER')";
		String userAuthSql="insert into users_auth(user_auth_id, user_id, user_auth) values(users_auth_id_seq.nextval,?,'ROLE_USER')";
		String userPsnsSql="insert into psns(psn_id, user_id, location_id,ctgry_1,ctgry_2,ctgry_3) values(psn_id_seq.NEXTVAL,?,?,?,?,?)";
		
		for(int i=0; i<30; i++) {
			Connection con=null;
			PreparedStatement pstmt= null;
			PreparedStatement adminAuthPstmt= null;
			PreparedStatement managerAuthPstmt= null;
			PreparedStatement userAuthPstmt= null;
			PreparedStatement userPsnsPstmt= null;
			
			try {
				con=datasource.getConnection();
				pstmt= con.prepareStatement(createUserSql);
				userAuthPstmt= con.prepareStatement(userAuthSql);
				userPsnsPstmt= con.prepareStatement(userPsnsSql);
				
				if(i==0) {
					//관리자 계정
					adminAuthPstmt= con.prepareStatement(adminAuthSql);
					managerAuthPstmt= con.prepareStatement(managerAuthSql);
					
					userAuthPstmt.setString(1, "admin"); //아이디
					adminAuthPstmt.setString(1, "admin");
					managerAuthPstmt.setString(1, "admin");
					
					pstmt.setString(1, "admin"); //아이디
					pstmt.setString(2, "admin"); //닉네임
					pstmt.setString(3, "admin@admin.com"); //이메일
					pstmt.setString(4, pwEncoder.encode("admin")); //비밀번호 암호화
					pstmt.setString(5, "F"); //성별
					pstmt.setString(6, "111111"); //생년월일
					pstmt.setString(7, "images/default-user.jpg"); //이미지
				} else if(i>0 && i<28) {
					//일반사용자
					managerAuthPstmt= con.prepareStatement(managerAuthSql);
					
					userAuthPstmt.setString(1, "jiwon"+i); //아이디
					managerAuthPstmt.setString(1, "jiwon"+i);
					
					pstmt.setString(1, "jiwon"+i); //아이디
					pstmt.setString(2, "jiwon"+i); //닉네임
					pstmt.setString(3, "jiwon"+i+"@mail.com"); //이메일
					pstmt.setString(4, pwEncoder.encode("1234")); //비밀번호 암호화
					pstmt.setString(5, "F"); //성별
					pstmt.setString(6, getRandYear()+"1225"); //생년월일
					pstmt.setString(7, "images/default-user.jpg"); //이미지
					
					
					userPsnsPstmt.setString(1,  "jiwon"+i);
					userPsnsPstmt.setString(2,  "1"); //location
					int ctgry_id=getRandCatId();
					userPsnsPstmt.setString(3,  ctgry_id+""); //category1
					userPsnsPstmt.setString(4,  (ctgry_id+1)+""); //category2
					userPsnsPstmt.setString(5,  (ctgry_id+2)+""); //category3
				} else {
					//block 당한 사용자
					userAuthPstmt.setString(1, "heyrim"+i); //아이디
					
					pstmt.setString(1, "heyrim"+i); //아이디
					pstmt.setString(2, "heyrim"+i); //닉네임
					pstmt.setString(3, "heyrim"+i+"@mail.com"); //이메일
					pstmt.setString(4, pwEncoder.encode("1234")); //비밀번호 암호화
					pstmt.setString(5, "F"); //성별
					pstmt.setString(6, getRandYear()+"1224"); //생년월일
					pstmt.setString(7, "images/default-user.jpg"); //이미지
				
					userPsnsPstmt.setString(1,  "heyrim"+i);
					userPsnsPstmt.setString(2,  "3"); //location
					userPsnsPstmt.setString(3,  "9"); //category1
					userPsnsPstmt.setString(4,  "7"); //category2
					userPsnsPstmt.setString(5,  "2"); //category3
				}
				
				
				pstmt.executeUpdate(); //users 테이블
				userAuthPstmt.executeUpdate(); //users_auth 테이블
				if(managerAuthPstmt!= null) {
					managerAuthPstmt.executeUpdate();
				}
				if(adminAuthPstmt != null) {
					adminAuthPstmt.executeUpdate();
				}
				userPsnsPstmt.executeQuery(); //psns 테이블
				
			}catch (Exception e) {
				
			} finally {
				if(pstmt!=null) { 
					try {
					pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					} 
				}
				if(userAuthPstmt!=null) { 
					try {
						userAuthPstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					} 
				}
				if(managerAuthPstmt!=null) { 
					try {
						managerAuthPstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					} 
				}
				if(adminAuthPstmt!=null) { 
					try {
						adminAuthPstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					} 
				}
				if(userPsnsPstmt!=null) { 
					try {
						userPsnsPstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					} 
				}
				if(con!=null) { 
					try {
					con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					} 
				}
			}
		}
	}
	
	//user dummy
	//Users 더미데이터 (i값 변경해서 쓰기) 비밀번호 1234
//	@Test
	public void testInsertMemberUser() {
		log.info(" users DUMMY 삽입 ");
		
		String createUserSql="insert into users(user_id, user_nickname,user_email,user_passwd, user_gender,user_birthday,user_image) "+
				"values(?, ?,?, ?, ?, ?,? )";
		
		String userAuthSql="insert into users_auth(user_auth_id, user_id, user_auth) values(users_auth_id_seq.nextval,?,'ROLE_USER')";
		String userPsnsSql="insert into psns(psn_id, user_id, location_id,ctgry_1,ctgry_2,ctgry_3) values(psn_id_seq.NEXTVAL,?,?,?,?,?)";
		
		for(int i=3; i<6; i++) {
			Connection con=null;
			PreparedStatement pstmt= null;
			PreparedStatement userAuthPstmt= null;
			PreparedStatement userPsnsPstmt= null;
			
			try {
				con=datasource.getConnection();
				pstmt= con.prepareStatement(createUserSql);
				userAuthPstmt= con.prepareStatement(userAuthSql);
				userPsnsPstmt= con.prepareStatement(userPsnsSql);
				
					//일반 사용자
					userAuthPstmt.setString(1, "jiwon"+i); //아이디
					//userAuthPstmt.setString(2, "ROLE_USER"); //권한
					
					pstmt.setString(1, "jiwon"+i); //아이디
					pstmt.setString(2, "jiwon"+i); //닉네임
					pstmt.setString(3, "jiwon"+i+"@mail.com"); //이메일
					pstmt.setString(4, pwEncoder.encode("1234")); //비밀번호 암호화
					pstmt.setString(5, "F"); //성별
					pstmt.setString(6, "901111"); //생년월일
					pstmt.setString(7, "https://notefolio.net/data/covers/39320_t2.jpg"); //이미지
				
					userPsnsPstmt.setString(1,  "jiwon"+i);
					userPsnsPstmt.setString(2,  "1"); //location
					userPsnsPstmt.setString(3,  "3"); //category1
					userPsnsPstmt.setString(4,  "2"); //category2
					userPsnsPstmt.setString(5,  "1"); //category3
				
				pstmt.executeUpdate(); //users 테이블
				userPsnsPstmt.executeQuery(); //psns 테이블
				userAuthPstmt.executeQuery(); //auth 테이블
				
			}catch (Exception e) {
				
			} finally {
				if(pstmt!=null) { 
					try {
					pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					} 
				}
				if(userAuthPstmt!=null) { 
					try {
						userAuthPstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					} 
				}
				if(userPsnsPstmt!=null) { 
					try {
						userPsnsPstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					} 
				}
				if(con!=null) { 
					try {
					con.close();
					} catch (SQLException e) {
						e.printStackTrace();
					} 
				}
			}
		}
	}
	
	//회원가입 테스트
//	@Test
	public void testCreateUser() {
		UserDTO user= new UserDTO();
		RegistUserDTO ruser= new RegistUserDTO();
		
		user.setUser_id("newid1");
		user.setUser_nickname("newNickname");
		user.setUser_email("new@mail.com");
		user.setUser_birthday("941225");
		user.setUser_gender("F");
		user.setUser_passwd(pwEncoder.encode("1234"));
		user.setUser_image("https://notefolio.net/data/covers/39320_t2.jpg");
		
		ruser.setUser_id("heyrim19");
		ruser.setLocation_id(2);
		ruser.setCtgry_1(1);
		ruser.setCtgry_2(2);
		ruser.setCtgry_3(-1);
		
		
	//	usermapper.createUser(user);
	//	usermapper.insertUserAuth(user);
		usermapper.insertBasicPsns3(ruser);
		
		log.info("회원가입 완료");
	}
	
	//회원정보 수정 테스트
//	@Test
	public void testUpdateUser() {
		UserDTO user= new UserDTO();
		
		user.setUser_id("heyrim19");
		usermapper.searchUserById(user.getUser_id());
		user.setUser_nickname("hh19");
		usermapper.changeNickname(user);
		usermapper.searchUserById(user.getUser_id());
	}
	
//	@Test
	public void testCtgry() {
		List<CategoryDTO_sjh> list = usermapper.getAllCategories();
		for (CategoryDTO_sjh categoryDTO : list) {
			log.info(categoryDTO);
		}
	}
	
//	@Test
	public void test() {
		usermapper.getUserSimplePsns("inin11");

	}
	
	@Test
	public void testProc() {
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		
		PsnScoreDTO result = new PsnScoreDTO();
		result.setArticleId("1");
		result.setUserId("jiwon1");
		result.setAmount("3");
		result.setFollowId("heyrim5");
		result.setGroupId("1");
		usermapper.updatePsnScoreByArticleId(result);
		log.info(result);
		usermapper.updatePsnScoreByFollowing(result);
		log.info(result);
		usermapper.updatePsnScoreByGroup(result);
		log.info(result);
		
	}
	
	
}
