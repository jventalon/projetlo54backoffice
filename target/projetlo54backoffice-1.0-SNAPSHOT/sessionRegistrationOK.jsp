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
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <title>Training Courses - Registration successful</title>
    </head>
    <body>
        <div class="container">
            <h1>Training Courses - Registration successful</h1>
            <p>
                <a href="courses_list"><span class="glyphicon glyphicon-chevron-left"></span> Go back to the courses list</a>
            </p>
            <p>
            You have been enrolled in the following course session:
                <ul>
                    <li>Course code: ${courseSession.course.code}</li>
                    <li>Course title: ${courseSession.course.title}</li>
                    <li>Session: from ${courseSession.startDate} to ${courseSession.endDate} in ${courseSession.location.city}</li>
                </ul>
            </p>
            <p>
                Your client id is ${cid}.
            </p>
            <p>
                <a href="client_info?id=${cid}"><span class="glyphicon glyphicon-chevron-right"></span> See you personal information</a>
            </p>
        </div>
    </body>
</html>
