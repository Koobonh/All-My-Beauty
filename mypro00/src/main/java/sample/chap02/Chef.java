package sample.chap02;

import org.springframework.stereotype.Component;

// lombok이 알아서 VO역할해줌
import lombok.Data;


@Component
@Data
public class Chef {
	private String cname;
	private String cid;
	
	
	
}
