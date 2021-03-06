/**
 * 댓글/답글 데이터 처리용 Ajax Closure Module 
 */

var myCommentClsr = ( function(){
	
	function getCmtList(pagingParams, callback, error){
		
		var bno = pagingParams.bno;
		var page = pagingParams.page || 1;
		
		$.ajax({	type: 'get',
					url: "/mypro/replies/pages/" + bno + "/" + page,
					dataType: 'json',
					success : function(bCommentPagingCreator, status, xhr){
							   if(callback){
									callback(bCommentPagingCreator);
							}
					},
					
					error : function(xhr, status, er){
								if(error){
									error(er);
								}
					}
				   }
				);//.ajax END
				
	}//getCmtList END
	
	function registerCmt(comment, callback, error){
		var bno = comment.bno;
		console.log("registerCmt()에 전달된 bno: " + bno);
		console.log("registerCmt() 함수의 comment등록 ajax 처리 시작...........");
		
		$.ajax({ type:"post",
				 url: "/mypro/replies/" + bno + "/new",
				 data: JSON.stringify(comment),
				 contentType: "application/json; charset=utf-8",
				 success : function(result, status, xhr){
								if(callback){
										callback(result);
								}
							},
				 error : function(xhr, status, er){
							if(error){
									error(er);
							}
						}
				}
		);//.ajax END	
	}//registerCmt 함수 END
	
	//답글 등록
	function registerReply(reply, callback,error){
		var bno = reply.bno;
		var creply = reply.creply
		console.log("registerReply()에 전달받은 bno: " + bno);
		console.log("registerReply()에 전달받은 creply: "+ creply);
		console.log("registerReply()함수의 댓글에 대한 답글 등록 .ajax 처리 시작...");
		
		$.ajax( { type: "post",
				  url: "/mypro/replies/"+ bno + "/" + creply + "/new",
				  data: JSON.stringify(reply),
				  contentType : "application/json; charset=utf-8",
				  dataType: 'text',
				  success : function(result, status, xhr){
								if(callback){
										callback(result);
								}
							},
				  error : function(xhr, status, er){
								if(error){
									error(er);
								}
							}
				}
		);//.ajax END
	}//registerReply함수 END
	
	//댓글 조회
	function getCmtReply(bnoAndCno, callback, erorr){
		
		var bno = bnoAndCno.bno;
		var cno = bnoAndCno.cno;
		console.log("getCmtReply에서 전달받은 bno: " + bno);
		console.log("getCmtReply에서 전달받은 cno: " + cno);
		console.log("getCmtReply에서 댓글 조회 .ajax 처리 시작.........");
		
		$.get("/mypro/replies/" + bno + "/" + cno + ".json",
			function(result){
				if (callback){
					callback(result);
				}
			}).fail(function(xhr, status, err){
						if(error){
							error();
						}
			});//fail END
	}//getCmtReply 함수 END
	
	//댓글 수정: 특정 댓글을 서버로 전송
	function modifyCmtReply(comment, callback, error){
		
		var bno = comment.bno;
		var cno = comment.cno;
		console.log("modifCmtReply() 전달받은 bno: " + bno + " 전달받은 cno: " + cno);
		console.log("modifCmtReply() 함수의 특정 댓글 수정 ajax 처리 시작.....");
		
		$.ajax( {type: "put",
				 url : "/mypro/replies/" + bno + "/" + cno,
				 data: JSON.stringify(comment),
				 contentType: "application/json; charset=utf-8",
				 dataType: "text",
				 success: function(modifyResult, status, xhr){
							if (callback){
								 callback(modifyResult);
							}
				},
				error: function(xhr, status, er){
							if(error){
								erorr(er);
							}
				}
		});//ajax END
	}//updata END
	
	function removeCmtReply(comment, callback, error){
		
		var bno = comment.bno;
		var cno = comment.cno;
		var cwriter = comment.cwriter
		console.log("removeCmtReply() 전달받은bno: " + bno);
		console.log("removeCmtReply() 전달받은cno:  " + cno);
		console.log("removeCmtReply() 전달받은rwriter:  " + rwriter);
		console.log("removeCmtReply() 함수의 댓글삭제 ajax시작... ");
		
		$.ajax( {type: "delete",
				url: "/mypro/replies" + bno + "/" + cno,
				data: JSON.stringify({bno: bno, cno: cno, rwriter: rwriter}),
				contentType : "application/json; charset=utf-8",
				success : function(removeResult, status, xhr){
							if(callback){
								callback(removeresult);
							}
				},
				error: function(xhr, status, er){
						if(error){
							error(er);
						}
				}
		}); //ajax END
	}//removeCmtReply 함수 END
	
	
	return{
		getCmtList : getCmtList,
		registerCmt : registerCmt,
		registerReply : registerReply,
		getCmtReply: getCmtReply,
		modifyCmtReply: modifyCmtReply,
		removeCmtReply: removeCmtReply
	};
	
})();//즉시 실행 함수