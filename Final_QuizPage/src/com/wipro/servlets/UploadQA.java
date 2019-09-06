package com.wipro.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UploadQA
 */
@WebServlet("/UploadQA")
public class UploadQA extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		String qID = request.getParameter("qID");
		if(!qID.contains("_")){
			pw.println("<script type=\"text/javascript\">");
			pw.println("alert('Enter Valid Question ID');");
			pw.println("location='UploadQA.jsp';");
			pw.println("</script>");
		}else{
			String[] sub = qID.split("_");
			String que = request.getParameter("que");
			String opt1 = request.getParameter("opt1");
			String opt2 = request.getParameter("opt2");
			String opt3 = request.getParameter("opt3");
			String opt4 = request.getParameter("opt4");
			String curropt = request.getParameter("curropt");
			for(int i=0; i<que.length(); i++){
				if(que.charAt(i)=='<'){
					que.replaceAll("<", "&lt;");
				}
				else if(que.charAt(i)=='>'){
					que.replaceAll("<", "&gt;");
				}
			}
			String query = "insert into questions values('"+sub[0]+"','"+que+"','"+opt1+"','"+opt2+"','"+opt3+"','"+opt4+"','"+curropt+"','"+sub[1]+"')";
			System.out.println(query);
			response.setContentType("text/html");
			Statement stmt = null;
			try{
				stmt = DBConnection.getConnection().createStatement();
				int succ = stmt.executeUpdate(query);
				pw.println("<script type=\"text/javascript\">");
				pw.println("alert('Sucessfully added Question');");
				pw.println("location='UploadQA.jsp';");
				pw.println("</script>");
				stmt.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
