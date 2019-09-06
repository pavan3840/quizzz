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
 * Servlet implementation class ChangePass
 */
@WebServlet("/ChangePass")
public class ChangePass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		String person = request.getParameter("person");
		String oldpass = request.getParameter("oldpwd");
		String email = request.getParameter("email");
		String pass = request.getParameter("pwd");
		Statement stmt = null;
		String query = "";
		String sql="";
		RequestDispatcher rd = null;
		try{
			if(person.contentEquals("stud")){
				stmt = DBConnection.getConnection().createStatement();
				query = "select pass from student where email = '"+email+"' and login=1";
				System.out.println(query);
				ResultSet rs = stmt.executeQuery(query);
				
//				stmt.executeQuery(query);
				if(rs.next()){
					if(!rs.getString("pass").contentEquals(oldpass)){
						pw.println("<script type=\"text/javascript\">");
						pw.println("alert('Invalid Password');");
						pw.println("location='ChangePass.jsp';");
						pw.println("</script>");
					}
					else{
						sql="update student set pass='"+pass+"',login=0 where email='"+email+"'";
						stmt.executeUpdate(sql);
						System.out.println(sql);
						pw.println("<script type=\"text/javascript\">");
						pw.println("alert('Student Password changed succesfully');");
						pw.println("location='Login.jsp';");
						pw.println("</script>");
					}
				}
				else{
					pw.println("<script type=\"text/javascript\">");
					pw.println("alert('Invalid user name');");
					pw.println("location='ChangePass.jsp';");
					pw.println("</script>");
			    	System.out.println("User does not exist");
				}
				
			}
			else if(person.contentEquals("prof")){
				stmt = DBConnection.getConnection().createStatement();
				query = "select pass from professor where email = '"+email+"' and login=1";
				System.out.println(query);
				ResultSet rs = stmt.executeQuery(query);
				if(rs.next()){
					if(!rs.getString("pass").contentEquals(oldpass)){
						pw.println("<script type=\"text/javascript\">");
						pw.println("alert('Invalid Password');");
						pw.println("location='ChangePass.jsp';");
						pw.println("</script>");
					}
					else{
						sql="update professor set pass='"+pass+"',login=0 where email='"+email+"'";
						stmt.executeUpdate(sql);
						System.out.println(sql);
						pw.println("<script type=\"text/javascript\">");
						pw.println("alert('Professor Password changed succesfully');");
						pw.println("location='Login.jsp';");
						pw.println("</script>");
					}
				}
				else{
					pw.println("<script type=\"text/javascript\">");
					pw.println("alert('Invalid user name');");
					pw.println("location='ChangePass.jsp';");
					pw.println("</script>");
			    	System.out.println("User does not exist");
				}
					
			}
			
				
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
