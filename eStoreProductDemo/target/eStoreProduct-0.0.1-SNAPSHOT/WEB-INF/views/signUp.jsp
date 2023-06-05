<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="eStoreProduct.model.passwordHashing" %>
<!DOCTYPE html>
<html>
<head>
  <title>Sign Up</title>
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
    }
    
    .container {
      max-width: 5200px; /* Updated max-width value */
      padding: 70px;
      background-color: #f2f2f2;
      border: 1px solid #ccc;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    
    h2 {
      text-align: center;
      margin-bottom: 20px;
    }
    
    form {
      display: flex;
      flex-direction:column;
    }
    
    label {
      font-weight: bold;
      margin-bottom: 5px;
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
    }
    
    input[type="submit"]:hover {
      background-color: #555;
    }
  </style>
  <script>
    function validatePassword() {
      var passwordInput = document.getElementById("password").value;
      console.log("Password: " + passwordInput);
      var confirmPassword = document.getElementById("confirm-password").value;
     <%--  document.getElementById("hidden-field").value = passwordInput;
      document.getElementById("hidden-field1").value = confirmPassword;
      <%
      passwordHashing ph = new passwordHashing();
      String passwordH = request.getParameter("hidden-field");
      String passwordHa = request.getParameter("hidden-field1");
      String x = ph.hashString(passwordH);
      String y = ph.hashString(passwordHa);
      %>
      document.getElementById("password").value = '<%= x %>';
      var xy=document.getElementById("password").value;
      console.log("After hashPassword: " + xy);
      document.getElementById("confirm-password").value = '<%= y %>'; --%>
      var message = document.getElementById("confirm-password-message");
      
      if (passwordInput.value !== confirmPassword.value) {
        message.style.color = "red";
        message.innerHTML = "Passwords do not match";
        return false;
      } else {
        message.style.color = "green";
        message.innerHTML = "Passwords match";
        return true;
      }
    }
  </script>
</head>
<body>
  <div class="container">
    <h2>Create Account</h2>
    <form action="signInCreateAccount" method="POST" name="form">
      <label for="username">Username</label>
      <input type="text" id="username" name="custName" required>
      
      <label for="email">Email</label>
      <input type="text" id="email" name="custEmail" required>
      
      <label for="mobile">Mobile</label>
      <input type="number" id="mobile" name="custMobile" required>
            
      <label for="address">Address</label>
      <input type="text" id="address" name="custAddress" required>
      
      <label for="shipment-address">Shipment Address</label>
      <input type="text" id="shipment-address" name="custSAddress" required>
      
      <label for="pincode">Pincode</label>
      <input type="number" id="pincode" name="custPincode" required>
      
      <label for="location">Location</label>
      <input type="text" id="location" name="custLocation" required>
      
      <label for="password">Password</label>
      <input type="password" id="password" name="custPassword" required>
      
      <label for="confirm-password">Confirm Password</label>
      <input type="password" id="confirm-password" name="confirm-password" required>
      <span id="confirm-password-message"></span>
      <!-- <input type="hidden" id="hidden-field" name="hiddenField" />
      <input type="hidden" id="hidden-field1" name="hiddenField1" /> -->
      <button onclick="return validatePassword()">Create Account</button>
    </form>
  </div>
</body>
</html>