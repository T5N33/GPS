<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="bean.ProjectDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.ProjectDAO"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.NEW"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta charset="utf-8">
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
    input {
      vertical-align: middle;
      }
    input.form-text {
      border: 1px solid #bcbcbc;
      height: 28px;
     }
    input.img-button {
      background: url( "images/button_search.png" ) no-repeat;
      border: none;
      width: 32px;
      height: 32px;
      cursor: pointer;
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
  		ProjectDAO dao = new ProjectDAO();
  		ArrayList<ProjectDTO> list = null;
  		ProjectDTO dto = null;
  		if(sessionName == "" || sessionName == null || sessionName.equals("") || sessionName.equals(null)) {
  	%>
  		<h1>로그인이 필요한 서비스입니다.</h1>
  		<button type="button" onclick="location.href='GPS_projects_main.jsp'">돌아가기</button>	
  	<%
  		} else {
	  		list = dao.select(sessionName);
  		}
  		
  		if(list != null) {
  			for(int i = 0; i < list.size(); i++) {
  				dto = list.get(i);
  				out.write("<h1>Project List</h1><br>");
  				out.write("<h2>진행상황</h2><br>");
  				int dateMinus = dto.getDuedate() - dto.getStartdate();
  				
  				try{
  			        SimpleDateFormat format = new SimpleDateFormat("yyMMdd");
  			        Date FirstDate = format.parse(Integer.toString(dto.getDuedate()));
  			        Date SecondDate = format.parse(Integer.toString(dto.getStartdate()));
  			        
  			        long calDate = FirstDate.getTime() - SecondDate.getTime(); 
  			        
  			        long calDateDays = calDate / ( 24*60*60*1000); 
  			 
  			        calDateDays = Math.abs(calDateDays);
  			        
  			        Date currentTime = new Date ();
  			        
  			        String mTime = format.format ( currentTime );

  			        Date currentDate = format.parse(mTime);
  			        
  			        long catDate2 = currentDate.getTime() - SecondDate.getTime(); 
  			        
  			        long calDateDays2 = catDate2 / ( 24*60*60*1000); 
  			        
  			        calDateDays2 = Math.abs(calDateDays2);
			        
			        
			        double per = ( (double)(calDateDays2) / (double)(calDateDays)) * 100;
			        int percent = (int)per;
  			        
			        %>
			        <div>
						<progress value="<%= percent %>" max="100" style="width: 1000px;"></progress>
					</div>
			        <%
			        
  			        }
  			        catch(Exception e)
  			        {
  			            // 예외 처리
  			    }

  				out.write("<h4>프로젝트 명 : </h4>&nbsp;&nbsp;" + dto.getPname() + "<br>");
  				out.write("<h4>규모 : </h4>&nbsp;&nbsp;" + dto.getPscale() + "<br>");
  				out.write("<h4>인원 : </h4>&nbsp;&nbsp;" + dto.getPnom() + "<br>");
  				out.write("<h4>시작일자 : </h4>&nbsp;&nbsp;" + dto.getStartdate() + "<br>");
  				out.write("<h4>마감일자 : </h4>&nbsp;&nbsp;" + dto.getDuedate() + "<br>");
  				out.write("<h4>프로젝트 설명 : </h4>&nbsp;&nbsp;" + dto.getPdescription() + "<br>");
  				out.write("<h4>팀장 : </h4>&nbsp;&nbsp;" + dto.getPcaptain() + "<br>");
  				out.write("<br><hr><br>");
  			}
  		} 
  	%>
  
  </div>
 </div>
</body>

</html>
