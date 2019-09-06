<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page import="com.wipro.servlets.DBConnection"%>

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Assessment History</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
    	body{
            background-image: url(back.jpg);
        }
        .jumbotron{
            margin: 5% 15%;
        	box-shadow: 29px 29px 20px 0px rgba(0,0,0,0.75);
			background: grey;
  			background-color:rgba(192,192,192, 0.7);
        
        }
        #subTitle{
            margin-bottom: 1%;
            padding-left: 30%;
            font-size: 75%;
        }
        #mainTitle{
            margin-bottom: 0px;
        }
        .btn-outline-danger{
        	padding: 8px;
        }
        .nav-link{
        	padding-bottom: 16px;
        }
    </style>
  </head>
  <body>
      
      <!-- Logout Button -->
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <nav class="navbar fixed-top">
                 	<ul class="nav">
                    	<li class="nav-item active">
                       		<a class="nav-link" href="Menu_Stud.jsp"><button class="btn btn-outline-success">Menu</button></a>
                    	</li>
	                </ul>
                    <ul class="navbar-nav ml-md-auto">
                        <li class="nav-item active">
                            <form action="Logout" method="post"> 
                                <a class="nav-link" href="Login.html"><button class="btn btn-outline-danger">Logout</button></a>
                            </form>
                        </li>
                    </ul>
                </nav>
            </div>
	    </div>
    </div>
      				<%
					Connection connection = null;
					Statement statement = null;
					try{
					connection = DBConnection.getConnection();
					statement = connection.createStatement();
					String sql = "select email from student where login=1";
					ResultSet resultSet = statement.executeQuery(sql);
					String email = "";
					if(resultSet.next()){
						email = resultSet.getString("email");
						sql ="select * from history where email='"+email+"'";
					}
						%>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
               <div class="jumbotron">
                    <h1 class="text-center" id="mainTitle">
                        Assessment History
                    </h1>
                    <p class="text-center" id="subTitle">
                        onlineQuiz
                    </p>
                    <p class="text-center">
                        Student-ID: <%=resultSet.getString("EMAIL")%>
                    </p>
                </div>
                
                <div class="jumbotron">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>
                                    Submitted on
                                </th>
                                <th>
                                    Subject
                                </th>
                                <th>
                                    Marks
                                </th>
                                <th>
                                    Total Marks
                                </th>
                            </tr>
                        </thead>
                        <tbody>
					
					<%
					System.out.println(sql);
					resultSet = statement.executeQuery(sql);
					while(resultSet.next()){
					 %>                        
                            <tr class="table-active">
                                <td>
                                  <%= resultSet.getString("DATES") %>  
                                </td>
                                <td>
                                    <%= resultSet.getString("NAME") %>  
                                </td>
                                <td>
                                    <%= resultSet.getString("SCORE") %>  
                                </td>
                                <td>
                                    <%= resultSet.getString("MAX_SCORE") %>  
                                </td>
                            </tr>
            		<%}
						}
						catch(Exception e){
							e.printStackTrace();
						}
					%>                
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</html>