package com.hezc.web;



import com.hezc.bean.Order;
import com.hezc.bean.user;
import com.hezc.dao.OrderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "orderlistServlet", value = "/order_list")
public class orderlistServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        OrderDao orderDao=new OrderDao();
        String flag=request.getParameter("flag");
        if (flag==null){
            user user =(user) session.getAttribute("loginuser");
            List<Order> orderList=orderDao.selectOrders(user.getId());

            request.setAttribute("orderList",orderList);
            request.getRequestDispatcher("order_list.jsp").forward(request,response);


        } else if ("delete".equals(flag)) {
            Integer id=Integer.parseInt(request.getParameter("id"));

            orderDao.orderdelete(id);

            response.sendRedirect("order_list");

        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            this.doGet(request, response);
    }
}
