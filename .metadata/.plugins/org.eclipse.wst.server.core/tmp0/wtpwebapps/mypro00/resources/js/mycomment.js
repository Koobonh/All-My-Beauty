/**
 * mycomment.js: 댓글/답글 처리용 Ajax Colosure Module
 */



//alert("================");
var myCommentClsr = ( function() {
	
	//댓글 목록
	function getCmtList(pagingParams, callback, error) {
		
		var bno = pagingParams.bno;
		var page = pagingParams.page || 1;
		
		console.log("getCmtList()가 전달받은 bno: " + bno);
		console.log("getCmtList()가 전달받은 page: " + page);
		console.log("getCmtList()함수의 ajax 처리 시작.............");
	
		$.ajax({	type : "get",
			    	url: "/mypro00/replies/pages/" + bno + "/" + page,
					dataType: "json",
					success: function(replyPagingCreator, status, xhr) {
						 if(callback) {
							console.log("데이터받아옴");
							callback(replyPagingCreator);
						}
					
					},
				
				error: function(xhr, status, er){
					if(error){
					   error(er);
					}
				}	
		});
		
	}
	
	//댓글 등록
	function registerCmt(comment, callback, error){
		var bno = comment.bno;
		console.log("getCmtList()가 전달받은 bno: " + bno);
		console.log("ajax 처리 시작: ");
		$.ajax( {  type: "post",
				   url: "/mypro00/replies/" + bno + "/new",
				   data: JSON.stringify(comment),
				   contentType : "application/json; charset=utf-8",
				   dataType : 'text',
				   success : function(result, status, xhr){
							 if(callback){
								 callback(result);
							}
				},
				
				error : function(xhr, status, er) {
						if(error){
							error(er);
						}
				}

		});

	}
		
		//답글 등록
		function registerReply(reply, callback, error){
		var bno = reply.bno;
		var prno = reply.prno;
		
		console.log("registerReply()가 전달받은 bno: " + bno);
		console.log("registerReply()가 전달받은 prno: " + prno);
		console.log("ajax 처리 시작: ");
		$.ajax( {  type: "post",
				   url: "/mypro00/replies/" + bno + "/" + prno + "/new",
				   data: JSON.stringify(reply),
				   contentType : "application/json; charset=utf-8",
				   dataType : 'text',
				   success : function(result, status, xhr){
							 if(callback){
								callback(result);
							}
				},
				
				error : function(xhr, status, er) {
						if(error){
							error(er);
						}
				}

		});

	}
	
		//댓글-답글 조회
		function getCmtReply(bnoAndRno, callback, error){
			
		var bno = bnoAndRno.bno;
		var rno = bnoAndRno.rno;
		
		console.log("getCmtReply()가 전달받은 bno: " + bno);
		console.log("getCmtReply()가 전달받은 rno: " + rno);
		console.log("getCmtReply() 함수의 특정 댓글에 조회 ajax 처리 시작: ");
		
		$.get( "/mypro00/replies/" + bno + "/" + rno + ".json",
				function(result) {
					if (callback) {
						callback(result);
					}
				}).fail(function(xhr, status, err) {
					if(error) {
					   error();
					}
				});
		}
		
		
		
		//댓글-답글 수정
		function modifyCmtReply(comment, callback, error) {
			
			var bno = comment.bno;
			var rno = comment.rno;
			console.log("modifyCmtReply() 전달받은 bno " + bno + "전달받은 rno: " + rno);
			console.log("modifyCmtReply() 함수의 특징 댓글 수정 ajax 처리");
			
			$.ajax({ type : "put",
					 url : "/mypro00/replies/" + bno + "/" + rno,
				  	 data: JSON.stringify(comment),
					 contentType: "application/json; charset=utf-8",
					 dataType : "text",
					 success: function(modifyResult, status, xhr) {
								  if(callback)  {
									callback(modifyResult);
								}
					},
					error : function(xhr, status, er) {
								if(error) {
								   error(er);
								}
					}
			});
			
		}
	
		// 댓글 삭제(실제 삭제)	
		function removeCmtReply(comment, callback, error) {
			
			var bno = comment.bno;
			var rno = comment.rno;
			var rwriter = comment.rwriter
			
			console.log("removeCmtReply() 전달받은 bno: " + bno );
			console.log("removeCmtReply() 전달받은 rno: " + rno );
			console.log("removeCmtReply() 전달받은 rwriter : " + rwriter);
			console.log("removeCmtReply() 전달받은 함수의 댓글 삭제 ajax 처리 시작!!!!!!!!");
			
				$.ajax({	type : "delete",
							 url : "/mypro00/replies/" + bno + "/" + rno,
				  	 		data: JSON.stringify({bno : bno, rno : rno, rwriter: rwriter}),
					 		contentType: "application/json; charset=utf-8",
					 		success : function(removeResult, status, xhr) {
									if (callback) {
										callback(removeResult);
									}
					},
					error: function(xhr, status, er) {
								   if(error) {
									  error(er)
								}
					}
				});
		}
		
		
	//숫자를 날짜로 변환하는 함수	
	//날짜시간 표시형식 설정 (서버와 상관없음)
    //JSON 날짜시간을 그대로 표시하면 1594169682000 이렇게 표시됩니다.
    //일반적인 날짜 시간 표시 형식으로 표시, 
    function showDatetime(datetimeValue) {

        var dateObj = new Date(datetimeValue);//전달된 댓글의 수정 날짜시간 값 저장
        var str ="";

        var yyyy = dateObj.getFullYear(); //YYYY
        var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
        var dd = dateObj.getDate();
        var hh = dateObj.getHours();
        var mi = dateObj.getMinutes();
        var ss = dateObj.getSeconds();

        str= [yyyy, '/', 
             (mm > 9 ? '' : '0') + mm, '/',
             (dd > 9 ? '' : '0') + dd, ' ',
             (hh > 9 ? '' : '0') + hh, ':', 
             (mi > 9 ? '' : '0') + mi,   ':', 
             (ss > 9 ? '' : '0') + ss].join(''); //배열값으로 하나의 문자열로 합침

        return str ;
   }	
		
	
	return {
		getCmtList : getCmtList,  //댓글 목록
		registerCmt: registerCmt, // 댓글 등록
		registerReply : registerReply,  // 답글 등록
		getCmtReply : getCmtReply,  // 댓글-답글 조회
		modifyCmtReply : modifyCmtReply,  //댓글-답글 수정
		removeCmtReply : removeCmtReply,  //댓글-답글 삭제
		//showDatetime : showDatetime     // 날짜시간 표시형식 지정
		
	};
	
})();     // 즉시 실행 함수