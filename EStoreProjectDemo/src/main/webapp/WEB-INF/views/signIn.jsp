<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Sign In</title>
  <style>
    /* Add your custom styles here */
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
      background-color: #f9f9f9;
    }
    
    .container {
      max-width: 400px;
      padding: 30px;
      background-color: #ffffff;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    
    h2 {
      text-align: center;
      margin-bottom: 20px;
      color: #333333;
    }
    
    form {
      display: flex;
      flex-direction: column;
    }
    
    label {
      font-weight: bold;
      margin-bottom: 5px;
      color: #333333;
    }
    
    input[type="text"],
    input[type="password"] {
      padding: 10px;
      margin-bottom: 10px;
      border: 1px solid #ccc;
      border-radius: 3px;
    }
    
    input[type="submit"] {
      background-color: #333;
      color: #fff;
      border: none;
      padding: 10px;
      border-radius: 3px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }
    
    input[type="submit"]:hover {
      background-color: #555;
    }
    
    .forgot-password {
      text-align: center;
      margin-top: 10px;
    }
    
    .forgot-password a {
      color: #333333;
      text-decoration: none;
    }
    
    .forgot-password a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>Sign In</h2>
    <form>
      <label for="username">Username</label>
      <input type="text" id="username" name="username" required>
      
      <label for="password">Password</label>
      <input type="password" id="password" name="password" required>
      
      <input type="submit" value="Sign In">
      
      <div class="forgot-password">
        <a href="forgotPassword">Forgot Password?</a>
      </div>
    </form>
  </div>
</body>
</html>
