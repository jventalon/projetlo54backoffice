<%-- 
    Document   : sessionInscriptionOK
    Created on : May 25, 2015, 10:26:14 AM
    Author     : Justine Ventalon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Training Courses - Registration successful</title>
    </head>
    <body>
        <h1>Training Courses - Registration successful</h1>
        <p>You have been enrolled in the following course session:<br/>
            course code: ${courseSession.course.code}<br/>
            course title: ${courseSession.course.title}<br/>
            session: from ${courseSession.startDate} to ${courseSession.endDate} in ${courseSession.location.city}
        </p>
        <p>
            Your client id is ${cid}.
            <a href="client_info?id=${cid}">See you personal information</a>
        </p>
        <p>
            <a href="courses_list">Go back to the courses list</a>
        </p>
    </body>
</html>
