package com.hezc.web;



import com.hezc.bean.Type;
import com.hezc.dao.TypeDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminTypeServlet", value = "/admin/type")
public class AdminTypeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        String flag=request.getParameter("flag");

        TypeDao typeDao=new TypeDao();
        if (flag==null){
            List<Type> typeList = typeDao.getAllType();
            request.setAttribute("typelist1",typeList);
            request.getRequestDispatcher("type_list.jsp").forward(request,response);

        } else if ("update".equals(flag)) {
            Integer id=Integer.parseInt(request.getParameter("id"));
            String name=request.getParameter("name");

            Type t=new Type();
            t.setId(id);
            t.setName(name);
            typeDao.update(t);
            response.sendRedirect("type");


        }
        else if ("add".equals(flag)){
            String name=request.getParameter("name");
            Type type=new Type();
            type.setName(name);
            typeDao.insert(type);
            response.sendRedirect("type");
        } else if ("delete".equals(flag)) {
            Integer id=Integer.parseInt(request.getParameter("id"));
            typeDao.delete(id);
            response.sendRedirect("type");

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
