<html>
<head>
    <title>Change Password</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body{
            background-image: url(back.jpg);
        }
        h3{
            font-size: 350%;
        }
        #subTitle{
            padding-left: 70%;
            font-size: 75%;
        }
        #mainTitle{
            margin-bottom: 0px;
        }
        .container-fluid{
            padding: 5% 30%;
        }
        .radio{
            display: inline-block;
            padding-left: 20%;
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
            <div class="row">
                <div class="col-md-12">
                    <h3 class="text-center" id="mainTitle">
                    Change Password
                    </h3>
                    <p class="text-center" id="subTitle">
                        onlineQuiz
                    </p>
                    <form role="form" action="ChangePass" method="post">
                         <div class="radio">
                            <label>
                                <input type="radio" name="person" value="prof" required/> I'm a Professor
                            </label>
                        </div> 
                        <div class="radio">

                            <label>
                                <input type="radio" name="person" value="stud" required/> I'm a Student
                            </label>
                        </div>
                        <div class="form-group">

                            <label for="exampleInputEmail1">
                                Email address
                            </label>
                            <input type="email" name="email" class="form-control" id="exampleInputEmail1" required/>
                        </div>
                        
                        <div class="form-group">
						
							<label for="exampleInputPasswordOld">
                                Old Password
                            </label>
                            <input type="password" name="oldpwd" class="form-control" id="exampleInputPasswordOld" required/>
                        </div>
                        
                        <div class="form-group">
                        
                            <label for="exampleInputPassword1">
                                New Password
                            </label>
                            <input type="password" name="pwd" class="form-control" id="exampleInputPassword1" pattern=".{6,}" title="Six or more characters" required/>
                        </div>

                        <div class="form-group">

                            <label for="exampleInputPasswordConfirm">
                                Confirm Password
                            </label>
                            <input type="password" name="cnfpwd" class="form-control" id="exampleInputPasswordConfirm" pattern=".{6,}" title="Six or more characters" required/>
                        </div> 
                        <button type="submit" class="btn btn-primary">
                            Submit
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    var password = document.getElementById("exampleInputPassword1")
    , confirm_password = document.getElementById("exampleInputPasswordConfirm");

    function validatePassword(){
      if(password.value != confirm_password.value) {
        confirm_password.setCustomValidity("Passwords Don't Match");
      } else {
        confirm_password.setCustomValidity('');
      }
    }
    password.onchange = validatePassword;
    confirm_password.onkeyup = validatePassword;
</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</html>