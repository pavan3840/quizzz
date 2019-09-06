<html>
<head>
    <title>View All Topics</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        a{
            display: inline;
        }
        body{
            background-image: url(back.jpg);
        }
        h3{
            font-size: 350%;
            padding-bottom: 10%;
        }
        #subTitle{
            padding-left: 70%;
            font-size: 75%;
        }
        #mainTitle{
            margin-bottom: 0%;
            text-align: center;
        }
        .container-fluid{
            padding-left: 2px;
            padding-right: 2px;
            align-content: center;
        }
        img{
            padding-left: 16%;
            max-width: 75%;
            display: inline;
            margin: 5%;
            
        }
        rounded-circle{
            max-width: 100%;
            height: auto;
            image-resolution: 72dpi;
        }
        .jumbotron{
            padding: 4rem 1rem;
            margin: 10% 30%;
        	box-shadow: 29px 29px 20px 0px rgba(0,0,0,0.75);
			background: grey;
  			background-color:rgba(192,192,192, 0.7);
        }
        .button{
        	display: inline;
        	padding-left: 8%;
        }
        .buttons{
        	padding-left: 16%
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
        <div class="jumbotron">
            <h3 id="mainTitle">Available Topics</h3>
                <div class="container-fluid">
                   <div class="row">
                      <div class="col-md-12">
                       <img alt="HTML " src="all_img.png" class="rounded" />
                       	<div class="buttons">
	                        <div class="button">
	                        	<a href="QuizPage_HTML.jsp"><button type="button" class="btn btn-outline-danger">
									HTML
								</button></a>
							</div>
							
							<div class="button">
								<a href="QuizPage_CSS.jsp"><button type="button" class="btn btn-outline-primary">
									&nbsp; CSS &nbsp;
								</button></a>
							</div>
							
							<div class="button">
								<a href="QuizPage_JS.jsp"><button type="button" class="btn btn-outline-warning">
									&ensp; JS &ensp;
								</button></a>
							</div>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>