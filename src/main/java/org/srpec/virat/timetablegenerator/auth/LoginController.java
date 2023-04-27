package org.srpec.virat.timetablegenerator.auth;

import com.mysql.cj.Session;
import org.srpec.virat.timetablegenerator.general.DBConnection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.*;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Request;
import javax.ws.rs.core.Response;

@Path("LoginController")
public class LoginController {
    @Context
    HttpServletRequest request;
    @Context
    HttpServletResponse response;

    @POST
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Path("Login")
    public String Login(@FormParam("username") String username, @FormParam("password") String password) {
        try {
            String Web_username = DBConnection.getDBPropertyValue("Web_username", "");
            String Web_password = DBConnection.getDBPropertyValue("Web_password", "");
            if (Web_username.equals(username) && Web_password.equals(password)) {
                HttpSession session = request.getSession(true);
                session.setAttribute("uid", "123");
                response.sendRedirect(request.getContextPath() + "/admin/Dashboard");
                return "success";
            } else {
                response.sendRedirect(request.getContextPath() + "/Home");
                return "success";
            }
        }
       catch (Exception e){
            e.printStackTrace();
            return  e.getMessage();
        }
    }
}
