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
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <div class="container">
            <h1>Training courses - Courses list</h1>
            <p>Welcome to the training courses management application of the school!</p>
            <p>
                This is a list of all the courses offered by the school with their next training sessions planned.
            </p>
            <%-- Form for the courses list search criteria --%>
            <div class="row">
                <form method="POST" action="courses_list" class="form-horizontal col-sm-9">
                    <div class="row">
                        <div class="col-sm-10 vcenter">
                         <%-- Title keyword input --%>
                         <div class="form-group row">
                             <label class="col-sm-4 control-label">Title keyword</label>
                             <div class="col-sm-8">
                                 <input type="search" name="title" class="form-control input-sm"/>
                             </div>
                         </div>
                         <%-- Location dropdown --%>
                         <c:if test="${not empty locations}">
                             <div class="form-group row">
                                 <label class="col-sm-4 control-label">Session location</label>
                                 <div class="col-sm-8">
                                     <select name="location" class="form-control input-sm">
                                         <option value="">any</option>
                                         <c:forEach var="l" items="${locations}">
                                             <option value="${l.id}">${l.city}</option>
                                         </c:forEach>
                                     </select>
                                 </div>
                             </div>
                         </c:if>
                         <%-- Date input --%>
                         <div class="form-group row">
                             <label class="col-sm-4 control-label">Session date (YYYY-MM-DD)</label>
                             <div class="col-sm-8">
                                 <input type="date" name="date" class="form-control input-sm"/>
                             </div>
                         </div>
                        </div>
                         <%-- Submit button --%>
                         <div class="form-group col-sm-2 vcenter">
                            <div class="col-sm-offset-1">
                                <input type="submit" value="Search" class="btn btn-primary">
                            </div>
                         </div>
                    </div>
                </form>
            </div>
            <%-- List of courses with next course sessions corresponding to search criteria --%>
            <c:choose>
                <c:when test="${not empty courses}">
                    <ul>
                        <c:forEach var="e" items="${courses}">
                           <li>
                               ${e.key.code}: ${e.key.title}
                               <c:if test="${not empty e.value}">
                                   <ul>
                                   <c:forEach var="cs" items="${e.value}">
                                       <li>
                                           from ${cs.startDate} to ${cs.endDate} in ${cs.location.city}<br/>
                                           <a href="session_registration_form?id=${cs.id}" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-chevron-right"></span> Registration</a>
                                       </li>
                                   </c:forEach>   
                                   </ul> 
                               </c:if><br/>
                           </li>
                       </c:forEach>
                    </ul>
                </c:when>
                <c:otherwise>
                    <p>
                        There is no course sessions corresponding to your criteria.
                    </p>
                </c:otherwise>
            </c:choose>
        </div>
    </body>
</html>
