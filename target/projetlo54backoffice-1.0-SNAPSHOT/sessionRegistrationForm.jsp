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
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <title>Training courses - Session inscription</title>
    </head>
    <body>
        <div class="container">
            <h1>Training courses - Session inscription</h1>
            <p>
                <a href="courses_list"><span class="glyphicon glyphicon-chevron-left"></span> Go back to the courses list</a>
            </p>
            <p>
                You are going to enroll in the following course session:
                <ul>
                    <li>Course code: ${cs.course.code}</li>
                    <li>Course title: ${cs.course.title}</li>
                    <li>Session: from ${cs.startDate} to ${cs.endDate} in ${cs.location.city}</li>
                </ul>
            </p>
            <p>
                Please fill in this form:
            </p>
            <div class="row">
                <form method="POST" action="session_registration_form?id=${cs.id}" class="form-horizontal col-sm-8">
                    <%-- First name input --%>
                    <div class="form-group row">
                        <label class="col-sm-3 control-label">First name</label>
                        <div class="col-sm-9">
                            <input type="text" name="firstname" value="${param.firstname}" class="form-control input-sm"/>${firstnameError}
                        </div>
                    </div>
                    <%-- Last name input --%>
                    <div class="form-group row">
                        <label class="col-sm-3 control-label">Last name</label>
                        <div class="col-sm-9">
                            <input type="text" name="lastname" value="${param.lastname}" class="form-control input-sm"/>${lastnameError}
                        </div>
                    </div>
                    <%-- Address input --%>
                    <div class="form-group row">
                        <label class="col-sm-3 control-label">Address</label>
                        <div class="col-sm-9">
                            <input type="text" name="address" value="${param.address}" class="form-control input-sm"/>${addressError}
                        </div>
                    </div>
                    <%-- Phone number input --%>
                    <div class="form-group row">
                        <label class="col-sm-3 control-label">Phone number</label>
                        <div class="col-sm-9">
                            <input type="text" name="phone" value="${param.phone}" class="form-control input-sm"/>${phoneError}
                        </div>
                    </div>
                    <%-- Email input --%>
                    <div class="form-group row">
                        <label class="col-sm-3 control-label">Email address</label>
                        <div class="col-sm-9">
                            <input type="text" name="email" value="${param.email}" class="form-control input-sm"/>${emailError}
                        </div>
                    </div>
                    <%-- Submit button --%>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            <input type="submit" value="Register" class="btn btn-primary">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
