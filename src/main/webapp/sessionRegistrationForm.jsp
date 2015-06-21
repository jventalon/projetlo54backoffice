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
        <form method="POST" action="session_registration_form?id=${cs.id}">
            first name: <input type="text" name="firstname" value="${param.firstname}"/> ${firstnameError}<br/>
            last name: <input type="text" name="lastname" value="${param.lastname}"/> ${lastnameError}<br/>
            address: <input type="text" name="address" value="${param.address}"/> ${addressError}<br/>
            phone number:<input type="text" name="phone" value="${param.phone}"/> ${phoneError}<br/>
            email address:<input type="text" name="email" value="${param.email}"/> ${emailError}<br/>
            <input type="submit" value="register">
        </form>
    </body>
</html>
