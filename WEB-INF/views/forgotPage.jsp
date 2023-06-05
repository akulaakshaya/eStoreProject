<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Forgot Password</title>
  <!-- Include Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    body {
      background-color: #f9f9f9;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
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
      margin-bottom: 30px;
      color: #333333;
    }
    
    form {
      margin-bottom: 20px;
    }
    
    label {
      font-weight: bold;
      color: #333333;
    }
    
    input[type="email"] {
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 3px;
      background-color: #f9f9f9;
      box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
    }
    
    input[type="submit"] {
      display: block;
      width: 100%;
      background-color: #007bff;
      color: #fff;
      border: none;
      padding: 10px;
      border-radius: 3px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }
    
    input[type="submit"]:hover {
      background-color: #0056b3;
    }
    
    #otpTextarea {
      display: none;
      margin-bottom: 20px;
    }
  </style>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
    $(document).ready(function() {
      $("form").submit(function(e) {
        e.preventDefault(); // Prevent form submission
        var email = $("#email").val();
        
        // Make an AJAX call to submit the email
        $.ajax({
          type: "POST",
          url: "otpAction", // Replace with the URL to submit the email
          data: { email: email },
          success: function(response) {
            // On success, show the OTP textarea
            $("#otpTextarea").show();
          },
          error: function() {
            // Handle error case
            alert("Error occurred. Please try again later.");
          }
        });
      });
    });
  </script>
</head>
<body>
  <div class="container">
    <h2>Forgot Password</h2>
    <form>
      <div class="form-group" action="otpAction" method="post">
        <label for="email">Email</label>
        <input type="email" class="form-control" id="email" required>
      </div>
      <button type="submit" class="btn btn-primary">Send OTP</button>
    </form>
    <input type="text" id="otpTextarea" class="form-control" rows="3" placeholder="Enter OTP">
    <button id="otpSubmitBtn" class="btn btn-primary mt-2">Submit</button>
  </div>

  <!-- Include Bootstrap JS -->
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>