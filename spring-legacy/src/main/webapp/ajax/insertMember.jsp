<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>회원정보 한개 추가하기</h1>
	<hr>
	
	<form id="frm">
		아이디 : <input type="text" name="id"><br>
		비밀번호 : <input type="password" name="passwd"><br>
		이름 : <input type="text" name="name"><br>
		생년월일 : <input type="date" name="birthday"><br>
		성별 :
		<select name="gender">
			<option value="" disabled selected>성별을 선택하세요.</option>
			<option value="M">남자</option>
			<option value="F">여자</option>
			<option value="N">선택 안함</option>
		</select><br>
		이메일 : <input type="email" name="email"><br>
		이메일 수신여부 :
		<label><input type="radio" name="recvEmail" value="Y" checked> 예 </label>
		<label><input type="radio" name="recvEmail" value="N"> 아니오 </label><br>
		<button type="submit" id="btn">회원가입</button>
	</form>
	
	<script src="/resources/js/jquery-3.6.0.js"></script>
	<script src="/resources/js/jquery.serializeObject.min.js"></script>
	<script type="text/javascript">
		$('form#frm').on('submit',function(event){
			
			//폼 태그 기본 동작 막기
			event.preventDefault();
			
			//jquery의 serilize 함수 - 폼 안 입력 내용을 쿼리스트링으로 만들어서 리턴
			//let query = $(this).serialize();
			//console.log('쿼리스트링 : ' + query);
			
			/* let obj = {
				id:$('input[name="id"]').val();
				passwd:$('input[name="passwd"]').val();	
				name:$('input[name="name"]').val();	
			}; */
			
			let obj = $(this).serializeObject();
			console.log(typeof obj);
			console.log(obj);
			
			let strJson = JSON.stringify(obj);
			console.log(typeof strJson); //string
			console.log(strJson);
			
			let $frm = $('form#frm');
			
			//ajax 함수 호출
			$.ajax({
				url : '/api/members.json',
				method : 'POST',
				data : strJson,
				contentType : 'application/json; charset=UTF-8',
				success : function(data) {
					console.log(typeof data); //object
					console.log(data); // {}
					
					alert('회원가입 성공!');
					
					//$('form#frm').reset();
					$frm[0].reset();
				},
				error : function(request, status, error){
					alert('code : ' + request.status + '\n message : ' + request.responseText + '\n error : '+error);
				}
			});
			
 		});
	</script>
	
</body>
</html>