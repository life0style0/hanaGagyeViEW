package kr.or.kosta;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

/**
 * StringTest
 */
@Log4j
public class StringTest {

    @Test
    public void test() {
        String cal = "2018-12-12";
        log.info(cal.substring(5, 7));
    }
}