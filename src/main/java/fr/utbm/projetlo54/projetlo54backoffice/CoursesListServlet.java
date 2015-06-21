/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.utbm.projetlo54.projetlo54backoffice;

import fr.utbm.projetlo54.entity.Course;
import fr.utbm.projetlo54.entity.CourseSession;
import fr.utbm.projetlo54.entity.Location;
import fr.utbm.projetlo54.service.CourseService;
import fr.utbm.projetlo54.service.LocationService;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Justine Ventalon
 */
@WebServlet(name = "CoursesListServlet", urlPatterns = {"/courses_list"})
public class CoursesListServlet extends HttpServlet 
{

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        // adds the list with all locations to the request attributes
        LocationService ls = new LocationService();
        List<Location> locations =  ls.getAllLocations();
        request.setAttribute("locations", locations);
                 
        // gets the request search criteria
        String titleKeyword = request.getParameter("title");
        String date = request.getParameter("date");
        String lid = request.getParameter("location");
        
        // sets parameters to null if search button was clicked with empty form values
        Date d = null;
        if (titleKeyword != null && titleKeyword.equals(""))
        {
            titleKeyword = null;
        }
        if (date != null && !date.equals(""))
        {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            try
            {
                d = df.parse(date);
            }
            catch (ParseException e)
            {
                System.out.println("parse date exception " + e);
            }
        }
        Location l = null;
        if (lid != null && !lid.equals(""))
        {
            try
            {
                int locid = Integer.parseInt(lid);
                l = ls.getLocation(locid);
            }
            catch (NumberFormatException e)
            {
                System.out.println(e + "location id must be an integer");
            }
        }
        
        // gets the list of courses with next course sessions corresponding to criteria
        CourseService cs = new CourseService();
        List<Object[]> courseSessions =  cs.getCoursesByCriteriaWithNexCourseSessions(titleKeyword, l, d);

        // sort the list in a map with courses as key and lists of corresponding 
        // course sessions as values (for easier displaying in the view)
        Map<Course, List<CourseSession>> courses = new LinkedHashMap();
        if (courseSessions != null && !courseSessions.isEmpty())
        {
            Course course = (Course) courseSessions.get(0)[0];
            List<CourseSession> list = new ArrayList();
            for (int i = 0; i < courseSessions.size(); ++i)
            {
                Course currentCourse = (Course) courseSessions.get(i)[0];
                if (!course.getCode().equals(currentCourse.getCode()))
                {
                    courses.put(course, list);
                    course = currentCourse;
                    list = new ArrayList();
                }
                CourseSession session = (CourseSession) courseSessions.get(i)[1];
                list.add(session);
            }
            courses.put(course, list);
        }
        
        // adds the list with all courses to the request attributes
        request.setAttribute("courses", courses);
        
        // calls the view
        RequestDispatcher rd = request.getRequestDispatcher("coursesList.jsp");
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
