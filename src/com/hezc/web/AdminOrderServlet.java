package com.hezc.web;



import com.hezc.bean.Order;
import com.hezc.dao.OrderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminOrderServlet", value = "/admin/order")
public class AdminOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flag=request.getParameter("flag");
        OrderDao orderDao=new OrderDao();

        int psize=5;

        String pnos=request.getParameter("pno");
        String status1=request.getParameter("status");
        if(status1==null){
            status1="0";

        }
        if(pnos==null||pnos.equals("")){
            pnos="1";

        }
        if(flag==null||flag.equals("list")){
            int pno=Integer.parseInt(pnos);
            int start=(pno-1)*psize;
            int status=Integer.parseInt(status1);
            int count = orderDao.countOrder(status);
            int pcount =(count+psize-1)/psize;
            List<Order> orderList=orderDao.selectAllOrders(status,start,psize);

            request.setAttribute("pno",pno);
            request.setAttribute("pcount",pcount);
            request.setAttribute("orderList",orderList);
            request.setAttribute("status",status);
            request.getRequestDispatcher("order_list.jsp").forward(request,response);
        } else if ("operate".equals(flag)) {

            Integer id =Integer.parseInt(request.getParameter("id"));
            Integer status=Integer.parseInt(request.getParameter("status"));
            orderDao.operate(id,status);
            response.sendRedirect("order?status="+status);

        } else if ("delete".equals(flag)) {
            Integer id =Integer.parseInt(request.getParameter("id"));
            int status=Integer.parseInt(status1);
            Integer pno=Integer.parseInt(pnos);
            orderDao.delete(id);
            response.sendRedirect("order?status="+status+"&pno="+pno);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
}
