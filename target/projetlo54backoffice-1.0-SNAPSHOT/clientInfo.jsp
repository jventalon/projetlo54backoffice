<%-- 
    Document   : clientInfo.jsp
    Created on : May 25, 2015, 1:35:13 PM
    Author     : Justine Ventalon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <title>Training courses - Client information</title>
    </head>
    <body>
        <div class="container">
            <h1>Training courses - Client information</h1>
            <p>
                <a href="courses_list"><span class="glyphicon glyphicon-chevron-left"></span> Go back to the courses list</a>
            </p>
            <p>
                Your personal information:
                <ul>
                    <li>Id: ${c.id}</li>
                    <li>First name: ${c.firstName}</li>
                    <li>Last name: ${c.lastName}</li>
                    <li>Address: ${c.address}</li>
                    <li>Phone number: ${c.phone}</li>
                    <li>Email address: ${c.email}</li>
                </ul>
            </p>
             <c:if test="${not empty c.session}">
                <p>
                    You have been enrolled in the following course session:
                    <ul>
                       <li>Course code: ${c.session.course.code}</li>
                       <li>Course title: ${c.session.course.title}</li>
                       <li>Session: from ${c.session.startDate} to ${c.session.endDate} in ${c.session.location.city}</li>
                    </ul>
                </p>
             </c:if>
        </div>
    </body>
</html>
