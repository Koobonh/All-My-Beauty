package sample.chap02;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

//import lombok.Setter;


@Component
//@Data
//@Setter
public class Restaurant {
	
	@Autowired
	private Chef chef;
	
	
public Restaurant(Chef chef) {
		this.chef = chef;
	}


	public void setChef(Chef chef) {
		this.chef = chef;
	}
	
	
	public Chef getChef() {
		chef = new Chef();
		
		return chef;
	
	}
	
	
	
//	
//	@Setter(onMethod_ = @Autowired)
//	private Chef chef;
//
//	public Chef getChef() {
//		chef = new Chef();
//		
//		return chef;
//	}
//	
//	
}
