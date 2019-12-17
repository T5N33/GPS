<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 request.setCharacterEncoding("UTF-8");
 
// 모든 session을 제거
 session.invalidate();
// 페이지의 메인으로 이동
 response.sendRedirect("GPS_main.jsp");
%>
