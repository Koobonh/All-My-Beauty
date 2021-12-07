package chap19.txtest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import sample.chap19.service.SampleTxService;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/mybatis-context.xml",
						"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Log4j
public class SampleTxServiceTests {
	
	@Setter(onMethod_ = { @Autowired})
	private SampleTxService sampleService;
	
	@Test
	public void testLong() {
		
		String str = "Starry\r\n" +
				"Starry night\r\n" +
				"Paint your palette blue and grey\r\n" +
				"Look out on a summer's day";
		
		log.info(str.getBytes().length);
		
		sampleService.addData(str);
		
	}
}
	


