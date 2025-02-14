package com.hezc.web;



import com.hezc.bean.Goods;
import com.hezc.bean.Order;
import com.hezc.dao.GoodsDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "GoodsBuyServlet", value = "/goods_buy")
public class GoodsBuyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer goodsid=Integer.parseInt(request.getParameter("goodsid"));
        String flag=request.getParameter("flag");

        PrintWriter out=response.getWriter();
        GoodsDao goodsDao=new GoodsDao();
        Goods goods=goodsDao.getById(goodsid);
        HttpSession session=request.getSession();
        Order o=(Order) session.getAttribute("order");

        if("add".equals(flag)){
            if(o==null){
                o=new Order();
            }
            o.addGoods(goods);
            session.setAttribute("order",o);
            out.print("ok");
        } else if ("lessen".equals(flag)) {
            o.lessenGoods(goodsid);
            session.setAttribute("order",o);
            out.print("ok");
        } else if ("delete".equals(flag)) {
            o.deleteGoods(goodsid);
            session.setAttribute("order",o);
            out.print("ok");

        }

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
