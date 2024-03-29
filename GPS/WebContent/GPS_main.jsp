<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Group Project Supporter</title>
  <style>
  a {
    color:black;
    text-decoration: none;
  }
  image{

  }
  body{
    margin: 0px;
    font-size: 18px;
    background-color: white;
  }

  #top{
    background-color: powderblue;
    height: 80px;
    border: 1px solid black;
  }

  #main{
    background-color: white;
    height: 1000px;
    width: 80%;
    position:static;
    float: right;
  }
  #left{
    background-color: powderblue;
    position: static;
    width: 18.7%;
    float: left;
    height: 1000px;
    border: 3px solid black;
  }
  </style>
  <script>
    var today = new Date();
    var year = today.getYear();
    var month = today.getMonth()+1;
    var day = today.getDate();
      document.write("Today is: " + month + "/" + day + "...");
      
      
  </script>
</head>
<body>
  <div id="box">

    <div id="top">
      <h1>
        <p style="font-weight:bold;">
        <a href="GPS_main.jsp"><%
			String sessionName = (String)session.getAttribute("sessionName");
      		if(sessionName == "" || sessionName == null || sessionName.equals("") || sessionName.equals(null)) {
      			%>
      		Welcome to GPS!
      		<%
       		} else {
       			out.write(sessionName);
       			%>님 환영합니다. GPS입니다.
       			<%
       		}
		%>
        </a>    
        </p>
      </h1>
      
    </div>

    <div id="main">
      <p>
      <img src="https://image.flaticon.com/icons/png/512/1534/1534938.png" style="width: 500px;"><br>
        안녕하세요!<br>
        GPS는 Group Project Supporter의 준말로써
        여러분의 모든 그룹 프로젝트를 서포트 할 것입니다.<br>
      </p>
    </div>

    <div id="left">
      <ul>
      <%
      		if(sessionName == "" || sessionName == null || sessionName.equals("") || sessionName.equals(null)) {
      			%>
      		<li><a href="GPS_login_main.jsp">Log In</a></li>
      		<%
       		} else {
       			%>
       			<li><a href="GPS_loginSession.jsp" id="logOut">Log Out</a></li>
       			<%
       		}
		%>
        
        <li><a href="GPS_projects_main.jsp">PROJECTS</a></li>
		 <li><a href="GPS_supports.jsp">SUPPORT</a></li>
      </ul>
    </div>

  </div>
</body>
</html>
