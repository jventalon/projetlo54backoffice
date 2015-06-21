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
            CourseSession cs = css.getCourseSessionById(csid);
            if (cs == null)
            {
                rd = request.getRequestDispatcher("sessionNotFound.jsp");
            }
            else
            {
                request.setAttribute("cs", cs);
                rd = request.getRequestDispatcher("sessionRegistrationForm.jsp");
            }
        }
        catch (NumberFormatException e)
        {
            rd = request.getRequestDispatcher("sessionNotFound.jsp");
        }
        
        // adds the errors
        /*String firstnameError = request.getParameter("firstnameError");
        String lastnameError = request.getParameter("lastnameError");
        String addressError = request.getParameter("addressError");
        String phoneError = request.getParameter("phoneError");
        String emailError = request.getParameter("emailError");*/
        
        // calls the view
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
            throws ServletException, IOException 
    {
        // gets the parameters
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String csid = request.getParameter("id");
        
        // check errors
        RequestDispatcher rd;
        if (csid == null)
        {
            rd = request.getRequestDispatcher("sessionRegistrationKO.jsp");
            rd.forward(request, response);
        }
        else 
        {
            boolean error = false;
            if (firstname == null || firstname == "")
            {
                request.setAttribute("firstnameError", "please enter your first name here");
                error = true;
            }
            if (lastname == null || lastname == "")
            {
                request.setAttribute("lastnameError", "please enter your last name here");
                error = true;
            }
            if (address == null || address == "")
            {
                request.setAttribute("addressError", "please enter your address here");
                error = true;
            }
            if (phone == null || phone == "")
            {
                request.setAttribute("phoneError", "please enter your phone number here");
                error = true;
            }
            if (email == null || email == "")
            {
                request.setAttribute("emailError", "please enter your email address here");
                error = true;
            }
            
            // if there are errors, process request to show form
            if (error)
            {   
                processRequest(request, response);
            }
            // if there are no errors, register the client
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
                    CourseSessionService css = new CourseSessionService();
                    CourseSession courseSession = css.getCourseSessionById(sessionID);
                    c.setSession(courseSession);
                    ClientService cs = new ClientService();
                    int cid = cs.registerClient(c);
                    if (cid != -1)
                    {
                        request.setAttribute("cid", cid);
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
                rd.forward(request, response);
            }
        }
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
