<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="bean.ProjectDAO"%>
<%@page import="bean.ProjectDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
			request.setCharacterEncoding("utf-8");
			String pname = request.getParameter("pname");
			int pscale = Integer.parseInt(request.getParameter("pscale"));
			int pnom = Integer.parseInt(request.getParameter("pnom"));
			int startdate = Integer.parseInt(request.getParameter("startdate"));
			int duedate = Integer.parseInt(request.getParameter("duedate"));
			String pdescription = request.getParameter("pdescription");
			String pcaptain = request.getParameter("pcaptain");
			
			ProjectDTO dto = new ProjectDTO();
			
			dto.setPname(pname);
			dto.setPscale(pscale);
			dto.setPnom(pnom);
			dto.setStartdate(startdate);
			dto.setDuedate(duedate);
			dto.setPdescription(pdescription);
			dto.setPcaptain(pcaptain);
			
			ProjectDAO dao = new ProjectDAO();
			
			dao.insert(dto);
			
		%>
		
		프로젝트 정보가 등록 되었습니다.
		<input type="button" value="돌아가기" onclick="location.href='GPS_projects_main.jsp'">
		
		</div>

  </div>
	</body>
</html>