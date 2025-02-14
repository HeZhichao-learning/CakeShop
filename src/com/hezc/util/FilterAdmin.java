package com.hezc.util;



import com.hezc.bean.user;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.http.HttpRequest;

@WebFilter(filterName = "FilterAdmin",value = "/admin/*")
public class FilterAdmin implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req=(HttpServletRequest)request;
        HttpServletResponse resp=(HttpServletResponse)response;
        user user=(user) req.getSession().getAttribute("loginuser");
        if(user==null){
            req.setAttribute("failMsg","您没有登陆，请登录");
            req.getRequestDispatcher("../login.jsp").forward(request,response);
            return;
        }else if(user.getIsadmin()!=1){
            req.setAttribute("failMsg","您不是管理员，请登录管理员账号");
            req.getRequestDispatcher("../login.jsp").forward(request,response);
            return;
        }
        else
            chain.doFilter(request, response);
    }
}
