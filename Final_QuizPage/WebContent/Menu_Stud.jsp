<html>
<head>
    <title>Menu Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body{
            background-image: url(back.jpg);
        }
        h3{
            font-size: 180%;
            margin-bottom: 20px;
        }
        #subTitle{
            padding-left: 60%;
            font-size: 75%;
        }
        #mainTitle{
            font-size: 350%;
            margin-bottom: 0px;
        }
        .container-fluid{
            padding: 10% 30%;
        }
        .btn-primary{
            margin-top: 15px;
            width: 100%;
        }
        .form-group{
            text-align: center;
            
        }
        .jumbotron{
        	box-shadow: 29px 29px 20px 0px rgba(0,0,0,0.75);
			background: grey;
  			background-color:rgba(192,192,192, 0.7);
        }
    </style>
   
</head>
<body>
    
    <!-- Logout Button -->
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <nav class="navbar fixed-top">
                    <ul class="navbar-nav ml-md-auto">
                        <li class="nav-item active">
                             <form method="post" action="Logout"> 
                                <a class="nav-link" href="Login.jsp"><button class="btn btn-outline-danger">Logout</button></a>
                            </form>
                        </li>
                    </ul>
                </nav>
            </div>
	    </div>
    </div>
    
    <div class="container-fluid" >
        <div class="jumbotron">
            <div class="row">
                <div class="col-md-12">
                    <h3 class="text-center" id="mainTitle">
                        Student Menu
                    </h3>
                    <p class="text-center" id="subTitle">
                        onlineQuiz
                    </p>
                    <form role="form" class="form-group">
                        <div>
                            <label>
                                <a class="btn btn-primary" href="ViewAllTopics.jsp">&nbsp;&ensp;Write an Exam&nbsp;&ensp;</a>
                            </label>
                        </div>
                        <div>
                            <label>
                                <a class="btn btn-primary" href="AssessmentHistory.jsp">&ensp;&ensp;Show History&ensp;&ensp;</a>
                            </label>
                        </div>
                        <div>
                            <label>
                                <a class="btn btn-primary" href="ChangePass.jsp">Change Password</a>
                            </label>
                        </div>    
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
    
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>