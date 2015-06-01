<%-- 
    Document   : index
    Created on : May 24, 2015, 1:58:43 PM
    Author     : Justine Ventalon
--%>

<%@page import="fr.utbm.projetlo54.service.CourseService"%>
<%@page import="fr.utbm.projetlo54.entity.Course"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="fr.utbm.projetlo54.service.LocationService"%>
<%@page import="fr.utbm.projetlo54.entity.Location"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Training courses - Courses list</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <h1>Training courses - Courses list</h1>
        <p>Welcome to the training courses management application of the school!</p>
        <p>
            This is a list of all the courses offered by the school with their next training sessions planned.
        </p>
        <form method="POST" action="coursesList">
            title keyword: <input type="search" name="title"/><br/>
            <c:if test="${not empty locations}">
                session location:
                <select name="location">
                    <c:forEach var="l" items="${locations}">
                        <option value="${l.id}">${l.city}</option>
                    </c:forEach>
                </select><br/>
            </c:if>
            session date: <input type="date" name="date"/><br/>
            <input type="submit" value="search">
        </form>
        <ul>
        <c:forEach var="c" items="${courses}">
            <li>${c.code}: ${c.title}</li>
            <!-- TODO: manage course sessions
            <%-- <c:if test="${not empty c.courseSessions}">
                <ul>
                <c:forEach var="cs" items="${c.courseSessions}">
                    <li>
                        from ${cs.startDate} to ${cs.endDate} in ${cs.location.city}
                        <a href="session_registration_form?id=${cs.id}">Registration</a>
                    </li>
                </c:forEach>   
                <ul> 
            </c:if> --%> -->
        </c:forEach>
        </ul>
    </body>
</html>