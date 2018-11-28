package kr.or.kosta;

import java.sql.Connection;
import java.sql.SQLException;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DataSourceTest {

	@Inject
	DataSource dataSource;
	
	@Inject
	SqlSessionFactory sqlSessionFactory;

//	@Test
	public void testDataSource() throws SQLException {
		Connection con = dataSource.getConnection();
		log.info("DB 연결 : " + con);
		con.close();	
	}
	
	@Test
	public void testMybatis() throws SQLException {
		SqlSession session = sqlSessionFactory.openSession();
		log.info("Mybatis DB 연결 : " + session.getConnection());
	}

}







