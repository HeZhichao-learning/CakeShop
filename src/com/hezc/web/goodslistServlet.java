package com.hezc.web;



import com.hezc.bean.Goods;
import com.hezc.bean.Type;
import com.hezc.dao.GoodsDao;
import com.hezc.dao.TypeDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "goodslistServlet", value = "/goodslist")
public class goodslistServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        String flag=request.getParameter("flag");
        GoodsDao dao=new GoodsDao();
        TypeDao Tdao=new TypeDao();
        if("goodsDetail".equals(flag)){
            Integer id=Integer.parseInt(request.getParameter("id"));
           Goods goods= dao.getById(id);
           request.setAttribute("goods",goods);
           request.getRequestDispatcher("goods_detail.jsp").forward(request,response);

        }



        else if ("list".equals(flag)) {
            Integer typeid= Integer.parseInt(request.getParameter("typeid"));
            int psize=8;
            String pnos=request.getParameter("pno");
            if(pnos==null){
                pnos="1";

            }
            int pno=Integer.parseInt(pnos);
            int start=(pno-1)*psize;
            int pcount =(dao.count(typeid)+psize-1)/psize;
            List<Goods> goodsList=dao.getAllGoods(typeid,start,psize);
            request.setAttribute("goodsList",goodsList);
            request.setAttribute("pno",pno);
            request.setAttribute("pcount",pcount);
            Type type=new Type();
            if(typeid==0){
                type.setId(0);
                type.setName("全部系列");
            }
            else {
                type=Tdao.getByid(typeid);
            }
            request.setAttribute("type",type);
            request.getRequestDispatcher("goods_list.jsp").forward(request,response);


        } else if ("search".equals(flag)) {
            String key=request.getParameter("keyword");
            if(key==null){
                key="";

            }
            int psize=8;
            String pnos=request.getParameter("pno");
            if(pnos==null){
                pnos="1";

            }
            int pno=Integer.parseInt(pnos);
            int start=(pno-1)*psize;

            int count =dao.countSearch(key);
            int pcount=(count+psize-1)/psize;


            List<Goods> goodsList=dao.searchGoods(key,start,psize);
            request.setAttribute("goodsList",goodsList);
            request.setAttribute("pno",pno);
            request.setAttribute("pcount",pcount);
            request.setAttribute("count",count);

            Type t=new Type();
            t.setId(-1);
            t.setName("搜索'"+key+"'的结果");
            request.setAttribute("key",key);
            request.setAttribute("type",t);
            request.getRequestDispatcher("goods_search.jsp").forward(request,response);

        }

        else if("recommend".equals(flag)){
            Integer type=Integer.parseInt(request.getParameter("type"));

           List<Goods> goodslist2=dao.getGoosList2(type);
            Type t=new Type();
            if(type==2){
                t.setId(-2);
                t.setName("热销推荐");
            }
            else {
                t.setId(-3);
                t.setName("新品推荐");
            }

            request.setAttribute("type",t);
           request.setAttribute("goodsList",goodslist2);
           request.getRequestDispatcher("goods_list.jsp").forward(request,response);



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
