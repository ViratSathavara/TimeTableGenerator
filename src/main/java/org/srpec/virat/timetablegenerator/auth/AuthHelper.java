package org.srpec.virat.timetablegenerator.auth;

import org.srpec.virat.timetablegenerator.general.Utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class AuthHelper {

    public static void invalidateSession(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect(request.getContextPath() + "/Home");
    }

    public static Boolean isUserLoggedIn(HttpServletRequest request) throws IOException {
        HttpSession session = request.getSession();
        int uid = Utils.safeInt(session.getAttribute("uid"), -1);
        return uid > 0;
    }
}
