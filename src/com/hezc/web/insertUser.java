package com.hezc.web;



import com.hezc.bean.user;
import com.hezc.dao.userdao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "insertUser", value = "/insertUser")
public class insertUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("UTF-8");

        String flag=request.getParameter("flag");
        userdao dao=new userdao();
        HttpSession session=request.getSession();

        if("insert".equals(flag)){
            user user=new user();
            String username=request.getParameter("username");
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            String name=request.getParameter("name");
            String phone= request.getParameter("phone");
            String address= request.getParameter("address");

            user.setUsername(username);
            user.setEmail(email);
            user.setPassword(password);
            user.setName(name);
            user.setPhone(phone);
            user.setAddress(address);

            int insert = dao.insert(user);
            response.sendRedirect("login.jsp");

        }
        else if ("checkname".equals(flag)) {
            String name=request.getParameter("name1");
            user checkname = dao.checkname(name);
            if(checkname==null) {
            response.getWriter().print(0);
        }
            else
                response.getWriter().print(1);
        }
        else if("checkemail".equals(flag)){
            String email=request.getParameter("email1");
            user che = dao.checkemail(email);
            if(che==null){
                response.getWriter().print(0);
            }else
            {
                response.getWriter().print(1);
            }
        } else if ("login".equals(flag)) {
//            String ue=request.getParameter("ue");
//
//            user checkname = dao.checkname(ue);
//            if(checkname!=null){
//                System.out.println("登陆成功");
//                response.sendRedirect("index.jsp");
//
//            }
//            else {
//                System.out.println("登陆失败");
//                response.sendRedirect("login.jsp");
//            }
            String username=request.getParameter("ue");
            String password=request.getParameter("password");
            user u=dao.login(username,password);
            if(u!=null){
                session.setAttribute("loginuser",u);
                request.getRequestDispatcher("user_center.jsp").forward(request,response);
            }else {
                request.setAttribute("failMsg","用户名或密码错误，请重新登陆");
                request.getRequestDispatcher("login.jsp").forward(request,response);
            }

        } else if ("changeaddress".equals(flag)) {
            String name=request.getParameter("name");
            String address=request.getParameter("address");
            String phone=request.getParameter("phone");
            user u=(user) session.getAttribute("loginuser");
            u.setName(name);
            u.setAddress(address);
            u.setPhone(phone);
            int r=dao.updateuser(u);
            request.setAttribute("successMsg","用户信息修改成功");
            request.getRequestDispatcher("user_center.jsp").forward(request,response);

        } else if ("checkpass".equals(flag)) {
            user u=(user) session.getAttribute("loginuser");
            String oldpass=request.getParameter("oldpass");
            if(oldpass.equals(u.getPassword())){
                response.getWriter().print(1);
            }
            else {response.getWriter().print(0);}
        } else if ("changepwd".equals(flag)) {
            user u=(user) session.getAttribute("loginuser");
            String newpass=request.getParameter("newPassword");
            u.setPassword(newpass);
            dao.updateuser(u);
            request.setAttribute("successMsg","用户信息修改成功");
            request.getRequestDispatcher("user_center.jsp").forward(request,response);

        }
        else if("logout".equals(flag)){
            session.removeAttribute("loginuser");
            session.invalidate();
            response.sendRedirect("index");
        }


    }
}
