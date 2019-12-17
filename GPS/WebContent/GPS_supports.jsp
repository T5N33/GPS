<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
       			%>�� ȯ���մϴ�. GPS�Դϴ�.
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
		 <li><a href="GPS_supports.html">SUPPORT</a></li>
      </ul>
    </div>

<br><br><br><br>
    <div id="main">
        <table id="tb1">
            <tr id="intb1">
                <td>
                    <a href="http://blog.naver.com/PostList.nhn?blogId=kingstargirl&from=postList&categoryNo=44&parentCategoryNo=44" title="�պ��� PPT ���ø�">
                        <img src="�պ�.PNG" width="400" height="300"/><br>
                    <a href="http://blog.naver.com/PostList.nhn?blogId=kingstargirl&from=postList&categoryNo=44&parentCategoryNo=44" title="�պ��� PPT ���ø�">
                        �պ��� PPT ���ø�</a></br>
                </td>

                <td>
                    <a href="http://blog.naver.com/PostList.nhn?blogId=angrymomo&from=postList&categoryNo=9" title="�޸��� PPT ����">
                        <img src="�޸�.PNG" width="400" height="300"/><br>
                    <a href="http://blog.naver.com/PostList.nhn?blogId=angrymomo&from=postList&categoryNo=9" title="�޸��� PPT ����">
                        �޸��� PPT ����
                    </a></br>
                </td>

                <td>
                    <a href="https://blog.naver.com/jinoiq/220356324699?proxyReferer=https%3A%2F%2Fm.post.naver.com%2Fviewer%2FpostView.nhn%3FvolumeNo%3D6880734%26memberNo%3D10505396" title="������ PPT ������">
                        <img src="����.PNG" width="400" height="300"/><br>
                    <a href="https://blog.naver.com/jinoiq/220356324699?proxyReferer=https%3A%2F%2Fm.post.naver.com%2Fviewer%2FpostView.nhn%3FvolumeNo%3D6880734%26memberNo%3D10505396" title="������ PPT ������">
                        ������ PPT ������
                    </a></br>
                </td>
            </tr>
        </table>
<br><br><br><br>

        <table>
            <tr id="intb1">
                <td>
                    <a href="http://leehyekang.blogspot.com/search/label/template"  title="ģ���� �������� PPT ���ø�">
                        <img src="����.PNG" width="400" height="300"/><br>
                    <a href="http://leehyekang.blogspot.com/search/label/template"  title="ģ���� �������� PPT ���ø�">
                        ģ���� �������� PPT ���ø�
                    </a></br>
                </td>

                <td>
                    <a href="https://blog.naver.com/cheekyhodori"  title="ġŰȫ PPT ���ø�">
                    <img src="ġŰȫ.PNG" width="400" height="300"/><br>
                    <a href="https://blog.naver.com/cheekyhodori"  title="ġŰȫ PPT ���ø�">
                        ġŰȫ PPT ���ø�
                    </a></br>
                </td>
            <tr>

        </table>

        <br><br><br>

        </div>



</body>
</html>
