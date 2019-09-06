package com.wipro.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class QuizPage
 */
@WebServlet("/QuizPage")
public class QuizPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String date = request.getParameter("date");
		String sub = request.getParameter("subject");
		System.out.println(date + " -- "+ sub);
		Statement stmt = null;
		RequestDispatcher rd = null;
		int score = Integer.parseInt(request.getParameter("score"));
		try{
			String sql = "select * from student where login=1";
			Connection con = DBConnection.getConnection();
			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			String email = null;
			if(rs.next()){
				 email = rs.getString("email");
			}
			sql = "insert into history values('" + email + "','" + sub + "','" + date + "','" + score + "',10)";
			System.out.println(sql);
			stmt.executeUpdate(sql);
			rd = request.getRequestDispatcher("AssessmentHistory.jsp");
			rd.forward(request, response);
		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
