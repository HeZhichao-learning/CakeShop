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

@WebServlet(name = "OrderSubmitServlet", value = "/order_confirm")
public class OrderConfirmServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name=request.getParameter("name");
        String phone=request.getParameter("phone");
        String address=request.getParameter("address");
        Integer paytype=Integer.parseInt(request.getParameter("paytype"));
        HttpSession session=request.getSession();
        Order order=(Order) session.getAttribute("order");
        order.setName(name);
        order.setPhone(phone);
        order.setAddress(address);
        order.setPaytype(paytype);

        if (paytype==3){
            order.setStatus(1);
        }else {
            order.setStatus(2);

        }
        user user=(user) session.getAttribute("loginuser");
        order.setUser_id(user.getId());

        OrderDao orderDao=new OrderDao();
        orderDao.addOrder(order);
        session.removeAttribute("order");
        response.sendRedirect("order_success.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        this.doGet(request, response);
    }
}
