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
 * Servlet implementation class ViewAllTopics
 */
@WebServlet("/ViewAllTopics")
public class ViewAllTopics extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw = null;
		response.setContentType("text/html");
		String Subject = request.getParameter("Subject");
		Statement stmt = null;
		String query = "";
		RequestDispatcher rd = null;
		try {
			stmt = DBConnection.getConnection().createStatement();
			query = "select email from student where login = 1";
			ResultSet rs = stmt.executeQuery(query);
			if(rs.next()){
				query = "update selectedq set active = 1 where subject = '" +Subject+"'";
				stmt.executeUpdate(query);
				System.out.println(query);
				rd = request.getRequestDispatcher("QuizPage_"+Subject+".jsp");
			}
			else{
				rd = request.getRequestDispatcher("UploadQA.jsp");
			}
	    	rd.forward(request, response);
			stmt.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
