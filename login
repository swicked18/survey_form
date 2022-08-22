<?php
    //add header & menu
    include ('header.php');
    include ('menu.php');
    
    // START SESSION IF NOT ALREADY STARTED
    if (!isset($_SESSION)) {
        session_start();
    }
 
    print '<h1> Login Form </h1>
  
         <p>   
            Users who are logged in can take full advantage of all of our websites offerings.
        </p>';
    
    //see if form is submitted    
    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
        
        if ((!empty($_POST['username'])) &&
        (!empty($_POST['password']))) {
            
            //check username & password
            if((strtolower($_POST['username'])== 'admin') && ($_POST['password']=='admin') XOR (strtolower($_POST['username'])== 'publisher') && ($_POST['password']=='publisher') XOR (strtolower($_POST['username'])== 'customer') && ($_POST['password']=='customer'))  {
                
                //redirect if correct
                session_start();
                $_SESSION['username']=$_POST["username"];
                $_SESSION['password']=$_POST["password"];
                $_SESSION['loggedin']=time();
                
                ob_end_clean();
                header('Location: welcome.php');
                exit();
                
            
            }else //wrong username or password
            {print'<p class="texterror"> The submitted user name and/or password are incorrect. <br> Please try again.</p>';
            }
            
            
        } else //missing field
        {print'<p class="texterror"> You must enter both a user name and password. <br> Please try again.</p>';
            } 
            
        //display the form
            
            {print'<form action="login.php" method="post">
    
    
            <p>Username:<br><input type="text" name="username" size="20"></p>
            <p>Password:<br><input type="password" name="password" size="20"></p>
            <p><input type="submit" name="submit" value="Log In!" button class="button"></p>
            </form>';}
            
    }else //display the form
    
    {print'<form action="login.php" method="post">
    
    
    <p>Username:<br><input type="text" name="username" size="20"></p>
    <p>Password:<br><input type="password" name="password" size="20"></p>
    <p><input type="submit" name="submit" value="Log In!" button class="button"></p>
    </form>';
    
    } 
    
    include ('footer.php');
    ?>
