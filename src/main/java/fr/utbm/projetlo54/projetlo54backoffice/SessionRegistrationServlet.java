/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fr.utbm.projetlo54.projetlo54backoffice;

import fr.utbm.projetlo54.entity.Client;
import fr.utbm.projetlo54.entity.CourseSession;
import fr.utbm.projetlo54.service.ClientService;
import fr.utbm.projetlo54.service.CourseSessionService;
import java.io.IOException;
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
@WebServlet(name = "SessionRegistrationServlet", urlPatterns = {"/session_registration"})
public class SessionRegistrationServlet extends HttpServlet {

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
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String csid = request.getParameter("csid");
        RequestDispatcher rd;
        if (firstname == "" || lastname == "" || address == "" || phone == "" || email == "" || csid == null)
        {
            rd = request.getRequestDispatcher("sessionRegistrationKO.jsp");
        }
        else
        {
            Client c = new Client();
            c.setFirstName(firstname);
            c.setLastName(lastname);
            c.setAddress(address);
            c.setPhone(phone);
            c.setEmail(email);               
            try
            {
                int sessionID = Integer.parseInt(csid);
                c.setSessionID(sessionID);
                ClientService cs = new ClientService();
                int cid = cs.registerClient(c);
                if (cid != -1)
                {
                    request.setAttribute("cid", cid);
                    CourseSessionService css = new CourseSessionService();
                    CourseSession courseSession = css.getCourseSessionById(cid);
                    request.setAttribute("courseSession", courseSession);
                    rd = request.getRequestDispatcher("sessionRegistrationOK.jsp");
                }
                else
                {
                    rd = request.getRequestDispatcher("sessionRegistrationKO.jsp");
                }
            }
            catch (NumberFormatException e)
            {
                rd = request.getRequestDispatcher("sessionRegistrationKO.jsp");
            }
        }
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
