package com.spring5218.mypro00.mapper02;



//@Test
//public void testSearchBoardWithPaging() {
//    MyBoardPgingDTO myBoardPagingDTO = new MyBoardPgingDTO(); //기본 생성자 이용(1, 10)
//    //myBoardPagingDTO.setKeyword("5");
//    myBoardPgingDTO.setKeyword("용5");
//    //myBoardPagingDTO.setKeyword("5");
//    
//    //myBoardPagingDTO.setScope("T");
//    //myBoardPagingDTO.setScope("C");
//    //myBoardPagingDTO.setScope("W");
//    //myBoardPagingDTO.setScope("TC");
//    myBoardPagingDTO.setScope("TCW");
//    //myBoardPagingDTO.setScope("TW");
//    //myBoardPagingDTO.setScope("CW");
//    log.info("행 총 개수: " + myBoardMapper.selectRowAmountTotal(myBoardPagingDTO));
//    
//    List<MyBoardVO> list = myBoardMapper.selectMyBoardList(myBoardPagingDTO);
//    list.forEach(board -> log.info(board));
//}

//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/mybatis-context.xml")
//@Log4j
//public class MyBoardMapperTest {
//
//	
//	
//	 @Setter(onMethod_ = @Autowired)
//	    private MyBoardMapper myBoardMapper;
//	 
	 
//	 @Test
//	 public void testSelectBoardListWithPaging() {
//		 
//		 MyBoardPgingDTO myBoardPagingDTO = new MyBoardPgingDTO(); // 기본 생성자 이용 (1, 10)
//		 myBoardMapper.selectMyBoardList(myBoardPagingDTO).forEach(myBoard -> System.out.println(myBoard));
//		 
//		 myBoardPagingDTO = new MyBoardPgingDTO(2, 10);
//		 myBoardMapper.selectMyBoardList(myBoardPagingDTO)
//		 			  .forEach(myBoard -> System.out.println(myBoard));
//	 }
	 
	 
//	 @Test
//	 public void testGetBoardList() {
//	 myBoardService.getBoardList(new MyBoardPgingDTO(2, 10)).forEach(myBoard -> log.info(myBoard));
	 
	 
	 
//	 @Test
//	 public void testSelectBoardList() {
//	    myBoardMapper.selectMyBoardList().forEach(myBoard -> log.info(myBoard));
//	 }
	 
	 //게시물 등록 테스트 - selectKey 사용 안함
//	  @Test
//	  public void testInsertMyBoard() {
//
//	      MyBoardVO myBoard = new MyBoardVO();
//	      myBoard.setBtitle("메퍼 테스트-입력제목");
//	      myBoard.setBcontent("매퍼 테스트-입력내용");
//	      myBoard.setBwriter("test");
//	      
//	      myBoardMapper.insertMyBoard(myBoard);
//	      log.info(myBoard);
//	  }
	 
	 
		/* 게시물 등록 테스트 - selectKey 사용 안함 */
	
//	 @Test
//	    public void testInsertMyBoardSelectKey() {
//	       
//	       MyBoardVO myBoard = new MyBoardVO();
//	       myBoard.setBtitle("메퍼테스트 - select Key");
//	       myBoard.setBcontent("메퍼테스트 - select Key");
//	       myBoard.setBwriter("test");
//	       
//	       myBoardMapper.insertMyBoardSelectKey(myBoard);
//	       log.info(myBoard);
//	       
//	    }
	 
	 
//	 @Test
//	 public void testSelectMyBoard() {
//		 log.info(myBoardMapper.selectMyBoard(1L));
		 
//	
//	 }
	 

	 
//}