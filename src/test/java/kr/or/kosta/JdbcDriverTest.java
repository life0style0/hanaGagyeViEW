package kr.or.kosta;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JdbcDriverTest {
	@Test
	public void test() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			log.info("오라클 드라이버 로딩 완료...");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		try (Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr")) {
			log.info("연결 완료: " + con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
