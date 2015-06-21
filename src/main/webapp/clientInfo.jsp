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
        <title>Training courses - Client information</title>
    </head>
    <body>
        <h1>Training courses - Client information</h1>
        <p>Your personal information:<br/>
            id: ${c.id}<br/>
            first name: ${c.firstName}<br/>
            last name: ${c.lastName}<br/>
            address: ${c.address}<br/>
            phone number: ${c.phone}<br/>
            email address: ${c.email}<br/>
        </p>
         <c:if test="${not empty c.session}">
            <p>You have been enrolled in the following course session:<br/>
               course code: ${c.session.course.code}<br/>
               course title: ${c.session.course.title}<br/>
               session: from ${c.session.startDate} to ${c.session.endDate} in ${c.session.location.city}
            </p>
         </c:if>
    </body>
</html>
