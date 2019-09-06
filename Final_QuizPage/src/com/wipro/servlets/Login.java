package com.wipro.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@SuppressWarnings("unused")
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		String person = request.getParameter("person");
		String email = request.getParameter("email");
		String pass = request.getParameter("pwd");
		Statement stmt = null;
		String query = "";
		RequestDispatcher rd = null;
		try {
			if(person.contentEquals("stud")){
				query = "select pass from student where email = '"+email+"'";
			}
			else if(person.contentEquals("prof")){
				query = "select pass from professor where email = '"+email+"'";
			}
			stmt = DBConnection.getConnection().createStatement();
			System.out.println(query);
		    ResultSet rs = stmt.executeQuery(query);
		    String pwd = "";
		    if(rs.next()){
		    	pwd = rs.getString(1);
		    }
		    else{
		    	pw.println("<script type=\"text/javascript\">");
				pw.println("alert('User does not exist');");
				pw.println("location='Login.jsp';");
				pw.println("</script>");
		    	System.out.println("User does not exist");
		    }
		    if(pwd.contentEquals(pass)){
		    	if(person.contentEquals("stud")){
		    		stmt.executeUpdate("update student set login=1 where email = '"+email+"'");
		    		System.out.println("update student set login=1 where email = '"+email+"'");
		    		rd = request.getRequestDispatcher("Menu_Stud.jsp");
		    	}
		    	else if(person.contentEquals("prof")){
		    		stmt.executeUpdate("update professor set login=1 where email = '"+email+"'");
		    		System.out.println("update professor set login=1 where email = '"+email+"'");
		    		rd = request.getRequestDispatcher("Menu_Prof.jsp");
		    	}
			    	rd.forward(request, response);
		    }
		    else{
		    	pw.println("<script type=\"text/javascript\">");
				pw.println("alert('User or password incorrect');");
				pw.println("location='Login.jsp';");
				pw.println("</script>");
		    	System.out.println("User or password incorrect");
		    }
			stmt.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
        
	}

}
