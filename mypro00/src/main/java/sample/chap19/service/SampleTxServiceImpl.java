package sample.chap19.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import sample.chap19.mapper.SampleMapper1;
import sample.chap19.mapper.SampleMapper2;

@Service
@Log4j
public class SampleTxServiceImpl implements SampleTxService {
	
	@Setter(onMethod_ = { @Autowired })
	private SampleMapper1 samplemapper1;
	
	@Setter(onMethod_ = { @Autowired })
	private SampleMapper2 samplemapper2;
	
	@Override
	@Transactional
	public void addData(String data) {
		
	log.info("mapper1=============");
	samplemapper1.insertCol1(data);
	
	
	log.info("mapper2=============");
	samplemapper2.insertCol2(data);
	
	log.info("end==================");
	
	
	}
	
}
