package com.hezc.web;

import com.hezc.bean.Goods;
import com.hezc.bean.Type;
import com.hezc.dao.GoodsDao;
import com.hezc.dao.TypeDao;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Date;
import java.util.List;

@WebServlet(name = "AdminGoodsServlet", value = "/admin/goods")
public class AdminGoodsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flag=request.getParameter("flag");
        GoodsDao goodsDao=new GoodsDao();
        TypeDao typeDao=new TypeDao();

        String pnos=request.getParameter("pno");
        if (pnos==null){
            pnos="1";

        }
        if ("list".equals(flag)||flag==null){
            String ts=request.getParameter("type");
            Integer tid=Integer.parseInt(ts);
//            Type type=typeDao.getByid(tid);
//            if (type==null){
//                type=new Type();
//                type.setId(0);
//                type.setName("全部系列");
//
//            }
            int psize=5;
            int pno =Integer.parseInt(pnos);
            int start=(pno-1)*psize;
            int count=goodsDao.count2(tid);
            int pcount=(count +psize-1)/psize;

            List<Goods> goodsList=goodsDao.getGoodsList2(tid,start,psize);
            request.setAttribute("goodsList",goodsList);
//            request.setAttribute("type",type);
            request.setAttribute("pno",pno);
            request.setAttribute("pcount",pcount);
            request.setAttribute("count",count);
//            request.setAttribute("a",1);
            request.setAttribute("tid",tid);//推荐类型
            request.getRequestDispatcher("goods_list.jsp").forward(request,response);

        } else if ("recommend".equals(flag)) {
            String method=request.getParameter("method");
            Integer pno=Integer.parseInt(pnos);
            String typeTarget=request.getParameter("typeTarget");
            Integer typeTarget1=Integer.parseInt(typeTarget);
            int goods_id=Integer.parseInt(request.getParameter("id"));
            if (method.equals("add")){
                goodsDao.insertRecommend(typeTarget1,goods_id);

            }else {
                goodsDao.deleteRecommend(typeTarget1,goods_id);
            }

            response.sendRedirect("goods?type="+typeTarget);

            
        } else if ("add".equals(flag)) {
            goodsAdd(request,response);
            
        } else if ("delete".equals(flag)) {
            Integer tid=Integer.parseInt(request.getParameter("type"));
            Integer pno=Integer.parseInt(request.getParameter("pno"));
            Integer id=Integer.parseInt(request.getParameter("id"));
            goodsDao.delete(id);

            response.sendRedirect("goods?type="+tid+"&pno="+pno);

        } else if ("edit".equals(flag)) {
            Integer id=Integer.parseInt(request.getParameter("id"));
            Integer pno=Integer.parseInt(request.getParameter("pno"));
            Integer tid=Integer.parseInt(request.getParameter("type"));
            Goods goods=goodsDao.getById(id);

            request.setAttribute("pno",pno);
            request.setAttribute("tid",tid);
            request.setAttribute("goods",goods);
            request.getRequestDispatcher("goods_edit.jsp").forward(request,response);


        } else if ("update".equals(flag)) {
            goodsUpdate(request,response);

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }
    protected void goodsUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pno=1;
        int tid=0;
        try {
            //设置响应编码方式
            response.setContentType("text/html;charset=utf-8");
            DiskFileItemFactory factory = new DiskFileItemFactory();

            //创建ServletFileUpload对象
            ServletFileUpload fileUpload = new ServletFileUpload(factory);
            fileUpload.setHeaderEncoding("UTF-8");

            GoodsDao goodsDao = new GoodsDao();

            List<FileItem> fileItems = fileUpload.parseRequest(request);//解析request，得到带文件请求对象
            PrintWriter writer = response.getWriter(); //响应输出流
            Goods goods = new Goods();
            for (FileItem fileItem : fileItems) {
                if (fileItem.isFormField()) {//如果为普通字段
                    String name = fileItem.getFieldName(); //获取变量名
                    String value = fileItem.getString("utf-8");
                    switch (name) {
                        case "pno":
                            pno = Integer.parseInt(value);
                            break;
                        case "type":
                            tid = Integer.parseInt(value);
                            break;
                        case "id":
                            goods.setId(Integer.parseInt(value));
                            break;
                        case "name":
                            goods.setName(value);
                            break;
                        case "price":
                            goods.setPrice(Float.parseFloat(value));
                            break;
                        case "intro":
                            goods.setIntro(value);
                            break;
                        case "stock":
                            goods.setStock(Integer.parseInt(value));
                            break;
                        case "type_id":
                            goods.setType_id(Integer.parseInt(value));
                            break;
                        case "cover":
                            goods.setCover(value);
                            break;
                        case "image1":
                            goods.setImage1(value);
                            break;
                        case "image2":
                            goods.setImage2(value);
                            break;
                    }
                } else {

                    if (fileItem.getInputStream().available() <= 0) continue;

                    String filename = fileItem.getName();

                    //截取文件名，获得文件的扩展名 如jpg,docx
                    filename = filename.substring(filename.lastIndexOf(".") + 1);
                    //生成新的文件名

                    //生成新的文件名，利用时间值作为图片的名称
                    Date d = new Date();
                    filename = d.getTime() + "." + filename;

                    //逐个判断图片
                    switch (fileItem.getFieldName()) {
                        case "cover":
                            goods.setCover("/picture/" + filename);
                            System.out.println(goods.getCover());
                            break;
                        case "image11":
                            goods.setImage1("/picture/" + filename);
                            System.out.println(goods.getImage1());
                            break;
                        case "image21":
                            goods.setImage2("/picture/" + filename);
                            // System.out.println(goods.getImage2());
                            break;
                    }

                    String webPath = "/picture/"; //相对路径upload
                    String filepath = getServletContext().getRealPath(webPath + filename);
//                    System.out.println(filepath);
                    //创建文件
                    File file = new File(filepath);
                    file.getParentFile().mkdirs();
                    file.createNewFile();
                    //获得上传的文件流in
                    InputStream in = fileItem.getInputStream();
                    FileOutputStream out = new FileOutputStream(file);
                    byte[] buffer = new byte[1024];
                    int len;
                    //读出文件的字节
                    while ((len = in.read(buffer)) > 0) {
                        out.write(buffer, 0, len);
                    }
                    in.close();
                    out.close();
                    fileItem.delete();


                }
            }goodsDao.updateGoods(goods);
            response.sendRedirect("goods?type="+tid+"&pno="+pno);


        }catch (FileUploadException e) {
            e.printStackTrace();
        }
    }


    protected void goodsAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //设置响应编码方式
            response.setContentType("text/html;charset=utf-8");
            DiskFileItemFactory factory = new DiskFileItemFactory();

            //创建ServletFileUpload对象
            ServletFileUpload fileUpload = new ServletFileUpload(factory);
            fileUpload.setHeaderEncoding("UTF-8");

            GoodsDao goodsDao=new GoodsDao();

            List<FileItem> fileItems = fileUpload.parseRequest(request);//解析request，得到带文件请求对象
            PrintWriter writer = response.getWriter(); //响应输出流
            Goods goods=new Goods();
            for(FileItem fileItem:fileItems){
                if(fileItem.isFormField()){//如果为普通字段
                    String name = fileItem.getFieldName(); //获取变量名
                    if(name.equals("name")){
                        //获取普通字段值
                        String value=fileItem.getString("utf-8");
                        goods.setName(value);
                    }

                    if(name.equals("price")){
                        //获取普通字段值
                        String value=fileItem.getString("utf-8");
                       goods.setPrice(Float.parseFloat(value));
                    }

                    if(name.equals("intro")){
                        //获取普通字段值
                        String value=fileItem.getString("utf-8");
                        goods.setIntro(value);
                    }
                    if(name.equals("stock")){
                        //获取普通字段值
                        String value=fileItem.getString("utf-8");
                        goods.setStock(Integer.parseInt(value));
                    }if(name.equals("type_id")){
                        //获取普通字段值
                        String value=fileItem.getString("utf-8");
                        goods.setType_id(Integer.parseInt(value));
                    }


                }else{
                    //如果为文件字段，首先得到文件名
                    String filename = fileItem.getName();

                    //截取文件名，获得文件的扩展名 如jpg,docx
                    filename = filename.substring(filename.lastIndexOf(".")+1);
                    //生成新的文件名

                    //生成新的文件名，利用时间值作为图片的名称
                    Date d = new Date();
                    filename = d.getTime() +"."+filename;

                    //逐个判断图片
                    switch (fileItem.getFieldName())
                    {
                        case "cover":
                            goods.setCover("/picture/" + filename);
                             System.out.println(goods.getCover());
                            break;
                        case "image1":
                            goods.setImage1("/picture/" + filename);
                            System.out.println(goods.getImage1());
                            break;
                        case "image2":
                            goods.setImage2("/picture/" + filename);
                            // System.out.println(goods.getImage2());
                            break;
                    }

                    String webPath="/picture/"; //相对路径upload
                    String filepath = getServletContext().getRealPath(webPath+filename);
//                    System.out.println(filepath);
                    //创建文件
                    File file = new File(filepath);
                    file.getParentFile().mkdirs();
                    file.createNewFile();
                    //获得上传的文件流in
                    InputStream in = fileItem.getInputStream();
                    FileOutputStream out = new FileOutputStream(file);
                    byte[] buffer = new byte[1024];
                    int len;
                    //读出文件的字节
                    while((len=in.read(buffer))>0){
                        out.write(buffer,0,len);
                    }
                    in.close();
                    out.close();
                    fileItem.delete();


                }
            }
            goodsDao.addGoods(goods);
            int pcount=(goodsDao.count2(0)+4)/5;
            response.sendRedirect("goods?type=0&pno="+pcount);
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
    }
}
