package org.srpec.virat.timetablegenerator.internal;


import org.srpec.virat.timetablegenerator.auth.AuthHelper;
import org.srpec.virat.timetablegenerator.general.Utils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashSet;

public class SessionFilter implements Filter {

    private static final HashSet<String> sessionLessURLSet = new HashSet<>();

    static {
        sessionLessURLSet.add("rest/login");
        sessionLessURLSet.add("/sessionExpired");
        sessionLessURLSet.add("index.jsp");
        sessionLessURLSet.add("home.jsp");
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest)req;
        HttpServletResponse response = (HttpServletResponse)res;
        String requestURI = request.getRequestURI();
        HttpSession session = request.getSession();
        chain.doFilter(req,res);
    }

    public static boolean checkSessionLessURIs(String requestURI){
        boolean flag = true;
        for (String sessionLessURL : sessionLessURLSet) {
            flag = flag && requestURI.contains(sessionLessURL);
        }
        return flag;
    }

    @Override
    public void init(FilterConfig filterConfig) {
        System.out.println("init");
    }
    @Override
    public void destroy() {
        System.out.println("destroy");
    }
}
