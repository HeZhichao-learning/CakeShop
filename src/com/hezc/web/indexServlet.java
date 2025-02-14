package com.hezc.web;



import com.hezc.bean.Goods;
import com.hezc.bean.Type;
import com.hezc.dao.GoodsDao;
import com.hezc.dao.TypeDao;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "indexServlet", value = "/index")
public class indexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GoodsDao dao=new GoodsDao();
        List<Goods> bannerlist=dao.getGoosList(1);
        List<Goods> hotlist =dao.getGoosList(2);
        List<Goods> newlist=dao.getGoosList(3);
        request.setAttribute("bannerlist",bannerlist);
        request.setAttribute("hotlist",hotlist);
        request.setAttribute("newlist",newlist);


        TypeDao tyypedao=new TypeDao();
        List<Type> typelist= tyypedao.getAllType();
        ServletContext context=this.getServletContext();
        context.setAttribute("typelist",typelist);


        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}
