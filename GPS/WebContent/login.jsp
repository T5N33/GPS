<%@page import="bean.UserDAO"%>
<%@page import="bean.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		
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

  <div id="main">
		<%
			request.setCharacterEncoding("euc-kr");
			String _id = request.getParameter("id");
			String _pw = request.getParameter("pw");
			
			UserDTO dto = new UserDTO();
			
			dto.setId(_id);
			dto.setPw(_pw);
			
			UserDAO dao = new UserDAO();
			
			String name = dao.select(dto);
			
			if(name != "") {
				// 로그인 성공
				session.setAttribute("sessionName", name);
		%>
			로그인 성공!<br>
			<input type="button" value="홈으로 가기" onclick="location.href='GPS_main.jsp'">
		<%
			} else {
				// 로그인 실패
		%>
			아이디 비밀번호를 다시 확인해주세요.<br>
			<input type="button" value="다시 입력하기" onclick="location.href='GPS_login_main.jsp'">
		<%
			}
		%>
		
		</div>

  </div>
	</body>
</html>