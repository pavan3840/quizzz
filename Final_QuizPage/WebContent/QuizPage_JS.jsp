<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page import="com.wipro.servlets.DBConnection"%>



<html>
<head>
    <title>Quiz Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body{
            background-image: url(back.jpg);
        }
        h3{
            font-size: 350%;
        }
        #subTitle{
            margin-bottom: 1%;
            padding-left: 15%;
            font-size: 75%;
        }
        #mainTitle{
            margin-bottom: 0px;
        }
        .container-fluid{
            padding: 5% 10%;
        }
        .quesNum{
            font-weight: bold;
        }
        .optionSet{
            padding-left: 5%;
        }
        .submit{
            margin-top: 30px;
            padding-left: 90%;
        }
        .jumbotron{
        	box-shadow: 29px 29px 20px 0px rgba(0,0,0,0.75);
		background: grey;
  		background-color:rgba(192,192,192, 0.9);
        }
    </style>
    <script type="text/javascript">
    	var score = 0;
    	function validate(){
    		var corr = [],subb = [];
    		for(var i=1; i<=10; i++){
    			corr[i] = document.getElementById('corr_'+i).value;
    			subb[i] = document.querySelector('input[name="opt_'+ i +'"'+']:checked').value;
    			if(corr[i]==subb[i]){
        			score++;
        		}
    		}
    		alert("Your Score is "+ score);
    		document.getElementById('score').value = score;
    	}
    </script>
</head>
    
<body>
    
    <!-- Logout Button -->
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <nav class="navbar ">
                    <ul class="navbar-nav ml-md-auto">
                        <li class="nav-item active">
                             <form method="post" action="Logout"> 
                                <a class="nav-link" href="Login.html"><button class="btn btn-outline-danger">Logout</button></a>
                            </form>
                        </li>
                    </ul>
                </nav>
            </div>
	    </div>
    </div>
    
    <div class="container-fluid" >
        <div class="row">
            <div class="col-md-12">
                <div class="jumbotron">
                    <h3 class="text-center" id="mainTitle">
                        Quizzard
                    </h3>
                    <p class="text-center" id="subTitle">
                        onlineQuiz
                    </p>
                    <p class="text-center">
                        Made by Team_6@Wipro
                    </p>
                </div>
               <form method="get" action="QuizPage"  name="test" onsubmit="return validate()"> 
            	<input type="hidden" name="date" value="<%= java.time.LocalDate.now()+""%>"/>
                <input type="hidden" name="subject" value="JS"/>
			 <%
				Connection connection = null;
				Statement statement = null;
				try{
				connection = DBConnection.getConnection();
				statement = connection.createStatement();
				String sql ="select * from (select * from questions where questionid='JS' ORDER BY dbms_random.value) WHERE rownum < 11 ";
				System.out.println(sql);
				ResultSet resultSet = statement.executeQuery(sql);
				int i=1;				
				while(resultSet.next()){
					
			%> 	
					
                <div class="jumbotron">
                    <div class="row">
                        <div class="col-md-12" >
                            <div class="quesNum">
                                <p>Question #<%= i%></p>
                            </div>
                            <div>
                                <p class="question">
                                    <%= resultSet.getString("QUESTION")%>
                                </p>
                            </div>
                            <br>
                            <div class="optionSet">
                                <div class="row" id="optionSet">
                                    <div class="col-md-6">
                                        <div class="radio">
                                            <label>
                                              <input type="radio" class="opt_<%=i%>" name="opt_<%=i%>" value="A"/> <%= resultSet.getString("OPT1")%>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="radio">
                                            <label>
                                              <input type="radio" class="opt_<%=i%>" name="opt_<%=i%>" value="B"/> <%= resultSet.getString("OPT2")%>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="radio">
                                            <label>
                                              <input type="radio" class="opt_<%=i%>" name="opt_<%=i%>" value="C"/> <%= resultSet.getString("OPT3")%>
                                            </label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="radio">
                                            <label>
                                              <input type="radio" class="opt_<%=i%>"  name="opt_<%=i%>" value="D"/> <%= resultSet.getString("OPT4")%>
                                            </label>
                                        </div>
                                    </div>
                                    <input type="hidden" name="corr_<%=resultSet.getString("qID")%>" id="corr_<%=i %>" value="<%= resultSet.getString("CORRECTOPTION")%>"/>
                                    
                                    <%i++; %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
		<%} %>
             
<!-- Submit Key -->
				<input type="hidden" name="score" id="score" value=""/>
                <input type="submit" class="btn btn-danger">
                
                </form>
                
            </div>
        </div>
    </div>
</body>
    
    
		  <%
				resultSet.close();
				}
				catch(Exception e){
					e.printStackTrace();
				} 
			%>  
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>