/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.utbm.projetlo54.projetlo54backoffice;

import fr.utbm.projetlo54.entity.Client;
import fr.utbm.projetlo54.entity.Course;
import fr.utbm.projetlo54.entity.CourseSession;
import fr.utbm.projetlo54.entity.Location;
import fr.utbm.projetlo54.service.CourseService;
import fr.utbm.projetlo54.service.CourseSessionService;
import fr.utbm.projetlo54.service.LocationService;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "SessionInscriptionServlet", urlPatterns = {"/session_registration_form"})
public class SessionRegistrationFormServlet extends HttpServlet {

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
        // adds the course session to the request attributes
        String id = request.getParameter("id");
        RequestDispatcher rd;
        try
        {
            int csid = Integer.parseInt(id);
            CourseSessionService css = new CourseSessionService();
            //CourseSession cs = css.getCourseSessionByIdWithLocation(csid);
            //request.setAttribute("cs", cs);
            rd = request.getRequestDispatcher("sessionRegistrationForm.jsp");
        }
        catch (NumberFormatException e)
        {
            rd = request.getRequestDispatcher("sessionNotFound.jsp");
        }
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