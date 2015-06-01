<%-- 
    Document   : inscription
    Created on : May 18, 2015, 4:50:54 PM
    Author     : Justine Ventalon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Training courses - Session inscription</title>
    </head>
    <body>
        <h1>Training courses - Session inscription</h1>
        <p>
            <a href="courses_list">Go back to the courses list</a>
        </p>
        <p>
            You are going to enroll in the following course session:<br/>
            course code: ${cs.course.code}<br/>
            course title: ${cs.course.title}<br/>
            session: from ${cs.startDate} to ${cs.endDate} in ${cs.location.city}
        </p>
        <p>
            Please fill in this form:
        </p>
        <form method="POST" action="session_registration">
            first name: <input type="text" name="firstname"/><br/>
            last name: <input type="text" name="lastname"/><br/>
            address: <input type="text" name="address"/><br/>
            phone number:<input type="text" name="phone"/><br/>
            email address:<input type="text" name="email"/><br/>
            <input type="hidden" name="csid" value="${cs.id}">
            <input type="submit" value="register">
        </form>
    </body>
</html>
