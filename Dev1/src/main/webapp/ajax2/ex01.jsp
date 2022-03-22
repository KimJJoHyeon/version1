<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>

<script type="text/javascript">

// JQuery를 이용한 Ajax 통신
	function click1(){
		$.ajax({
			type: "get", // type 
			url: "<%=request.getContextPath()%>/data/data1.txt", // txt 파일 경로 설정
			success: function(data) {
				$("#result").text(data);
			}
		});
	}
	
	/*
	클릭2를 클릭했을 때 data/data2.html 데이터를 불러와 result에 출력하세요(jQuery 사용)
	*/
	//html 객체 읽어오기
	function click2() {
		$.ajax({
			type: "get", // type 
			url: "<%=request.getContextPath()%>/data/data1.html", // html 파일 경로 설정
			success: function(data) {
				//$("#result").text(data);  -> 이거는 그냥 텍스트로 모든걸 받아옴
				$("#result").html(data); // ->html() -> 그 태그의 내용을 가져옴
			}
		});
	}
		//json 데이터 읽어오기
		function click3() {
			$.ajax({
				type: "get", // type 
				url: "<%=request.getContextPath()%>/data/data1.json", // json 파일 경로 설정
				success: function(data) {
			/*
				JQuery 로 ajax 통신의 경우 요청 경로의 확장자가 json이면
				응답 데이터를 javascript 객체로 변환하여 반환한다.
				즉,JSON.parse()미필요
			*/		
			//오류남	// var json = JSON.parse(data);  JSON 데이터는 이미 알아서 자바스크립트 객체로 만들어 줘서 json parse 안해도된다.
					
					for(var i =0; i<data.length;i++){
						var jsondata = data[i];
						console.log(jsondata);
					}
				}
			});
	}
		
		/*
			버튼4 클릭시 data/data2.json 데이터를 jQuery를 사용하여 ajax 통신 후 result 에 전부 출력해주세요.
		*/ 
		function click4() {
			$.ajax({
				type: "get", // type 
				url: "<%=request.getContextPath()%>/data/data2.json", // json 파일 경로 설정
				success: function(data) {
					var result = '';
					result = data[0].name;
					result = result +"<br>";
					
					var student = data[0].students;
					console.log(result);
					for(var i =0; i<student.length;i++){
						var name=student[i].name;
						var age =student[i].age;
						//console.log(jsondata);
						result += name+"/"+age+"<br>";
					}
					console.log(result);
					
					document.getElementById("result").innerHTML = result;
				}
			
			});
	}
		//5. xml 데이터 가져오기
		function click5() {
			$.ajax({
				type: "get", // type 
				url: "<%=request.getContextPath()%>/data/data1.xml", // xml 파일 경로 설정
				success: function(data) {
					var $data = $(data);
					
					var books = $data.children("books").children("book");
					
					 console.log(books.length);
					// console.log(books[0].getElementsByTagName("name")[0].textContent);
					
					books.each(function(){
						var name = $(this).children("name").text();
						var publisher =$(this).children("publisher").text();
						var author= $(this).children("author").text();
						var price = $(this).children("price").text();
						
					});
					
					}
			});	
		}
		/*
		
			6번 버튼 클릭시 data/data2.xml의 데이터를 result영역에 ajax(jQuery)를 통하여 출력하세요.
		*/
		function click6() {
			$.ajax({
				type: "get", // type 
				url: "<%=request.getContextPath()%>/data/data2.xml", // xml 파일 경로 설정
				success: function(data) {
					var $data = $(data);
					//console.log($data.children());
					var school = $data.children("school");
					var result = '';
					var name = school.children("name").text();
					console.log(name);
					result = "학교 이름 : " +name+"<br>";
					
					var students = school.children("students").children("student");
					console.log(students.children());
					
					students.each(function(){
						console.log($(this));
						var name =  $(this).children("name").text();
						var age =  $(this).children("age").text();
						console.log(name);
						console.log(age);
						result += "|"+"학생 이름 : " +name+" / "+
						"나이 : " +age+"|"+"<br>";
						result = result + "______________________________<br>"; 
					});
					
					document.getElementById("result").innerHTML=
						result;
					}
			});	
		}
		
</script>
</head>
<body>
	<button onclick="click1()">클릭 1</button>
	<button onclick="click2()">클릭 2</button>
	<button onclick="click3()">클릭 3</button>
	<button onclick="click4()">클릭 4</button>
	<button onclick="click5()">클릭 5</button>
	<button onclick="click6()">클릭 6</button>
	<div id ="result"></div>
</body>
</html>