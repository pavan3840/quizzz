package com.wipro.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteQA
 */
@WebServlet("/DeleteQA")
public class DeleteQA extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		String qID = request.getParameter("qID");
		if(!qID.contains("_")){
			pw.println("<script type=\"text/javascript\">");
			pw.println("alert('Enter Valid Question ID');");
			pw.println("location='DeleteQA.jsp';");
			pw.println("</script>");
		}
		else{
			String[] qIDs = qID.split("_");
			if(qIDs[0].contentEquals("HTML") || qIDs[0].contentEquals("CSS") || qIDs[0].contentEquals("JS")){
				Statement stmt = null;
				String query = "";
				RequestDispatcher rd = null;
				try {
					stmt = DBConnection.getConnection().createStatement();
					query = "delete from questions where questionid='"+qIDs[0]+"' and qid='"+qIDs[1]+"'";
					System.out.println(query);
					int rs = stmt.executeUpdate(query);
					System.out.println(rs);
					if(rs>0){
						pw.println("<script type=\"text/javascript\">");
						pw.println("alert('Successfully Deleted');");
						pw.println("location='DeleteQA.jsp';");
						pw.println("</script>");
					}
					else{
						pw.println("<script type=\"text/javascript\">");
						pw.println("alert('Question Does not Exist');");
						pw.println("location='DeleteQA.jsp';");
						pw.println("</script>");
					}
					stmt.close();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else{
				pw.println("<script type=\"text/javascript\">");
				pw.println("alert('Enter Proper Subject');");
				pw.println("location='DeleteQA.jsp';");
				pw.println("</script>");
			}
		}
	}
}



