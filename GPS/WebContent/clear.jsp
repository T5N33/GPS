<%@page import="bean.UserDAO"%>
<%@page import="bean.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
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
<%
		request.setCharacterEncoding("utf-8");
		%>
<%
	String _id = request.getParameter("id");
	String _pw = request.getParameter("pw");
	String _name = request.getParameter("name");

	UserDTO dto = new UserDTO();
	
	dto.setName(_name);
	dto.setId(_id);
	dto.setPw(_pw);

	UserDAO dao = new UserDAO();
	
	dao.insert(dto);

%>
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
회원가입이 완료 되었습니다.
<input type="button" onclick="location.href='GPS_login_main.jsp'" value="로그인하기">
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
</body>
</html>

