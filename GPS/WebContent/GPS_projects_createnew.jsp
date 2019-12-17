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
    var month = today.getMonth() + 1;
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
      <h2>
        CREATE NEW PROJECT!</br></br>
      </h2>
	<form action="create_project.jsp" method="get">
      <table>
        <tr>
          <td>Project Name</td>
          <td><input type="text" style="width: 400px;" name="pname" placeholder="프로젝트명을 입력해주세요." /></td>
        </tr>

        <tr>
          <td>Project Scale(1-10)</td>
          <td><input type="text" style="width: 400px;" name="pscale" placeholder="프로젝트의 규모를 입력해주세요.(1-10)" /></td>
        </tr>

        <tr>
          <td>Number of Members</td>
          <td><input type="text" style="width: 400px;" name="pnom" placeholder="참가인원을 입력해주세요." /></td>
        </tr>

        <tr>
          <td>Start Date</td>
          <td><input type="text" style="width: 400px;" name="startdate" placeholder="프로젝트 시작날짜를 입력해주세요. ex)191201" /></td>
        </tr>
        
        <tr>
          <td>Due Date</td>
          <td><input type="text" style="width: 400px;" name="duedate" placeholder="프로젝트 마감날짜를 입력해주세요. ex)191231" /></td>
        </tr>

        <tr>
          <td>Description</td>
          <td><input type="text" size="100" name="pdescription" placeholder="프로젝트 설명을 간단하게 해주세요." /></td>
        </tr>
		
        <tr>
          <td>Captain of Project</td>
          <td><input type="text" style="width: 400px;" name="pcaptain" placeholder="프로젝트 팀장 이름을 입력해주세요." /></td>
        </tr>
		
        <tr>
          <td></td>
          <td><input type="submit" name="Submit" value="register"/>
          <input type="reset" name="cancel" value="reset" /></td>
        </tr>


      </table>
</form>
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
