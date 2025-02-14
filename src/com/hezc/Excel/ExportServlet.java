package com.hezc.Excel;

import com.hezc.bean.user;
import com.hezc.dao.userdao;
//import com.huoll.dao.UserDao;
//import com.huoll.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
/**
* @author huoll
* 使用servlet导出动态生成的excel文件，数据可以来源于数据库
* 这样，浏览器客户端就可以访问该servlet得到一份用java代码动态生成的excel文件
*/
@WebServlet(value = "/export")
public class ExportServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExportServlet()
	{
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

	      response.setContentType("octets/stream");
	      response.addHeader("Content-Disposition", "attachment;filename=users.xls");
	      //测试
	      ExportExcel<user> ex = new ExportExcel<>();
	      String[] headers = {"编号","用户名", "邮箱", "密码","姓名","手机号","地址","是否为管理员","是否可用"};
	      try
		  {
	          userdao udao=new userdao();
	    	  ArrayList<user> dataset= (ArrayList<user>) udao.getAlluser(0,udao.countUser());	//查询所有数据进行输出

	         OutputStream out = response.getOutputStream();
	         ex.exportExcel(headers, dataset, out);
	         out.close();
	         System.out.println("用户表导出成功！");
	      } catch (IOException e)
		  {
	          // TODO Auto-generated catch block
	          e.printStackTrace();
	       }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
