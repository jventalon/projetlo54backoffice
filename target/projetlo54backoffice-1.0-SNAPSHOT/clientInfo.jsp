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
            first name: ${c.firstname}<br/>
            last name: ${c.lastname}<br/>
            address: ${c.address}<br/>
            phone number: ${c.phone}<br/>
            email address: ${c.email}<br/>
        </p>
         <p>You have been enrolled in the following course session:<br/>
            course code: ${courseSession.course.code}<br/>
            course title: ${courseSession.course.title}<br/>
            session: from ${courseSession.startDate} to ${courseSession.endDate} in ${courseSession.location.city}
        </p>
    </body>
</html>
