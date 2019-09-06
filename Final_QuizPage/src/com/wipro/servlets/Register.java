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
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		String person = request.getParameter("person");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String pass = request.getParameter("pwd");
		Statement stmt = null;
		String query = "",sql="";
		if(email.contentEquals("")||name.contentEquals("")||pass.contentEquals("")){
			pw.println("<script type=\"text/javascript\">");
			pw.println("alert('Enter Valid Data.');");
			pw.println("location='Register.jsp';");
			pw.println("</script>");
		}
		else{
			try {
				stmt = DBConnection.getConnection().createStatement();
				if(person.contentEquals("stud")){
					sql = "select * from student where email = '" + email+"'";
					System.out.println(sql);
					ResultSet rs = stmt.executeQuery(sql);
					if(rs.next()){
						pw.println("<script type=\"text/javascript\">");
						pw.println("alert('User Exists. Please Login.');");
						pw.println("location='Register.jsp';");
						pw.println("</script>");
					}
					else{
						query = "insert into student values('"+name+"','"+email+"','"+pass+"',0,'stud')";
					}
				}
				else if(person.contentEquals("prof")){
					
					sql = "select * from professor where email = '" +email+"'";
					ResultSet rs = stmt.executeQuery(sql);
					System.out.println(sql);
					if(rs.next()){
						pw.println("<script type=\"text/javascript\">");
						pw.println("alert('User Exists. Please Login.');");
						pw.println("location='Register.jsp';");
						pw.println("</script>");
					}
					else{
						query = "insert into professor values('"+name+"','"+email+"','"+pass+"',0,'prof')";
					}
				}
				
				System.out.println(query);
			    stmt.executeUpdate(query);
			    pw.println("<script type=\"text/javascript\">");
				pw.println("alert('Successfully Registered. Please Login.');");
				pw.println("location='Login.jsp';");
				pw.println("</script>");
				stmt.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
//			RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
//	        rd.forward(request, response);
		}
	}

}
