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
import java.util.List;

@WebServlet(name = "AdminUserServlet", value = "/admin/user")
public class AdminUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session=request.getSession();
        String flag=request.getParameter("flag");
        String pnos=request.getParameter("pno");
        userdao userdao=new userdao();

        String name=request.getParameter("name");
        String username=request.getParameter("username");
        String phone=request.getParameter("phone");
        if(name==null) name="";
        if(username==null) username="";
        if(phone==null) phone="";

        if(pnos==null || pnos.equals("")){
            pnos="1";

        }
        int psize=5;
        if (flag==null||"list".equals(flag)){


            Integer pno=Integer.parseInt(pnos);
            int start=(pno-1)*psize;
            List<user> userList=userdao.searchUser(name,username,phone,start,psize);
            int count=userdao.countUser2(name,username,phone);
            int pcount=(count+psize-1)/psize;


            session.setAttribute("pno",pno);
//            request.setAttribute("pno",pno);
            session.setAttribute("name",name);
            session.setAttribute("username",username);
            session.setAttribute("phone",phone);

            
            request.setAttribute("pcount",pcount);
            request.setAttribute("userList",userList);
            request.getRequestDispatcher("user_list.jsp").forward(request,response);
        } else if ("reset".equals(flag)) {
            Integer id=Integer.parseInt(request.getParameter("id"));
            String newpass=request.getParameter("newpass");
            user user=userdao.getbyid(id);
            user.setPassword(newpass);

            userdao.updateuser(user);

            Integer pno=(Integer) session.getAttribute("pno");
            String name2=(String) session.getAttribute("name") ;
            String username2=(String) session.getAttribute("username");
            String phone2=(String) session.getAttribute("phone");
//            request.getRequestDispatcher("/admin/user?flag=list&pno="+pno).forward(request,response);
            response.sendRedirect("user?pno="+pno+"&name="+name2+"&username="+username2+"&phone="+phone2);


        } else if ("edit".equals(flag)) {
            Integer id=Integer.parseInt(request.getParameter("id"));

            user user =userdao.getbyid(id);
            request.setAttribute("user",user);
            request.getRequestDispatcher("user_edit.jsp").forward(request,response);

        } else if ("update".equals(flag)) {
            Integer id=Integer.parseInt(request.getParameter("id"));
            String name1=request.getParameter("name");
            String phone1=request.getParameter("phone");
            String address=request.getParameter("address");

            user user=userdao.getbyid(id);
            user.setName(name1);
            user.setPhone(phone1);
            user.setAddress(address);
            userdao.updateuser(user);

            Integer pno=(Integer) session.getAttribute("pno");
            String name2=(String) session.getAttribute("name") ;
            String username2=(String) session.getAttribute("username");
            String phone2=(String) session.getAttribute("phone");
//            request.getRequestDispatcher("/admin/user?flag=list&pno="+pno).forward(request,response);
            response.sendRedirect("user?pno="+pno+"&name="+name2+"&username="+username2+"&phone="+phone2);
            
        } else if ("delete".equals(flag)) {
            Integer id =Integer.parseInt(request.getParameter("id"));
            userdao.delete(id);
            Integer pno=(Integer) session.getAttribute("pno");
            String name2=(String) session.getAttribute("name") ;
            String username2=(String) session.getAttribute("username");
            String phone2=(String) session.getAttribute("phone");
//            request.getRequestDispatcher("/admin/user?flag=list&pno="+pno).forward(request,response);
            response.sendRedirect("user?pno="+pno+"&name="+name2+"&username="+username2+"&phone="+phone2);
        } else if ("logout".equals(flag)) {
            session.removeAttribute("loginuser");
            session.invalidate();
            response.sendRedirect("index");

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        this.doGet(request, response);
    }
}
