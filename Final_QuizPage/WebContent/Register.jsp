<html>
<head>
    <title>Register Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        body{
            background-image: url(back.jpg);
        }
        h3{
            font-size: 350%;
        }
        #subTitle{
            padding-left: 145px;
            font-size: 75%;
        }
        #mainTitle{
            margin-bottom: 0px;
        }
        .container-fluid{
            padding: 3% 30%;
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
    <div class="container-fluid" >
        <div class="jumbotron">
            <div class="row">
                <div class="col-md-12">
                    <h3 class="text-center" id="mainTitle">
                        Register
                    </h3>
                    <p class="text-center" id="subTitle">
                        onlineQuiz
                    </p>
                    <form role="form" action="Register" method="post">
                        <div class="radio">

                        <label>
                            <input type="radio" name="person" value="prof" required/> I'm a Professor
                        </label>
                        </div> 
                        <div class="radio">

                            <label>
                                <input type="radio" name="person" value="stud"/> I'm a Student
                            </label>
                        </div> 
                        <div class="form-group">

                            <label for="exampleInputName">
                                Name
                            </label>
                            <input type="text" name="name" class="form-control" id="exampleInputName" pattern="^\S+$" required />
                        </div>
                        <div class="form-group">

                            <label for="exampleInputEmail1">
                                Email address
                            </label>
                            <input type="email" name="email" class="form-control" id="exampleInputEmail1" pattern="^\S+$" required/>
                        </div>

                        <div class="form-group">

                            <label for="exampleInputPassword1">
                                Password
                            </label>
                            <input type="password" name="pwd" class="form-control" id="exampleInputPassword1" pattern=".{6,}" title="Six or more characters" required/>
                        </div>
                        <div class="form-group">

                            <label for="exampleInputConfirmPassword1">
                                Confirm Password
                            </label>
                            <input type="password" name="cnf-pwd" class="form-control" id="exampleInputConfirmPassword1" required/>
                        </div>
                        <p class="text-center">
                            Know us Already? Click <a href="Login.jsp">here</a>
                        </p>
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
    , confirm_password = document.getElementById("exampleInputConfirmPassword1");

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