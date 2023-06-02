<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>SLAM Store</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  
  <style>
    /* Add your custom styles here */
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }
    
    header {
      background-color: #333;
      color: #fff;
      padding: 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    
    nav ul {
      list-style-type: none;
      margin: 0;
      padding: 0;
    }
    
    nav ul li {
      display: inline;
    }
    
    nav ul li a {
      color: #fff;
      text-decoration: none;
      padding: 10px 20px;
    }
    
    nav ul li a:hover {
      background-color: #555;
    }
    
    .search-bar {
      text-align: center;
      padding: 20px;
      background-color: #f2f2f2;
    }
    
    .search-bar input[type="text"] {
      width: 300px;
      padding: 6px;
      border: none;
    }
    
    .search-bar input[type="submit"] {
      background-color: #333;
      color: #fff;
      border: none;
      padding: 6px 10px;
      cursor: pointer;
    }
    
    .slideshow-container {
      position: relative;
      width: 100%;
      max-width: 800px;
      margin: 0 auto;
    }
    
    .slideshow-container img {
      width: 100%;
      height: auto;
    }
    
    .slideshow-container .slide {
      display: none;
    }
    
    .slideshow-container .slide.active {
      display: block;
    }

    /* Dropdown styles */
    .profile-dropdown {
      position: relative;
      display: inline-block;
    }

    .dropdown-content {
      position: absolute;
      top: 100%;
      left: -60px; /* Adjust this value as per your preference */
      display: none;
      overflow: hidden;
      background-color: transparent;
      min-width: 120px;
      box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
      padding: 12px 16px;
      z-index: 1;
      opacity: 0;
      transition: opacity 0.3s ease;
    }

    .profile-dropdown:hover .dropdown-content {
      display: block;
      opacity: 1;
      transition: opacity 0.3s ease;
    }

    .dropdown-content a {
      display: block;
      margin-bottom: 5px;
    }
  </style>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
  <header>
    <h1>SLAM Store</h1>
    <nav>
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">Products</a></li>
        <li><a href="#">About Us</a></li>
        <li><a href="#">Contact</a></li>
        <li><a href="#">&#128722; Cart</a></li>
        <li><a href="#">&#10084; WishList</a></li>
         <li class="profile-dropdown">
  <i class="fas fa-user-shield"></i>
  <div class="dropdown-content">
    <a href="signUp">Sign Up</a>
    <a href="signIn">Sign In</a>
  </div>
</li>
     
      </ul>
    </nav>
  </header>

  <div class="search-bar">
    <form>
      <input type="text" placeholder="Search...">
      <input type="submit" value="Search">
    </form>
  </div>

  <main>
    <div class="slideshow-container">
      <div class="slide active">
        <img src="shopping-cart.png" alt="Slide 1">
      </div>
      <div class="slide">
        <img src="image2.jpg" alt="Slide 2">
      </div>
      <div class="slide">
        <img src="image3.jpg" alt="Slide 3">
      </div>
    </div>
  </main>
  <footer>
    <p>&copy; 2023 SLAM Store. All rights reserved.</p>
  </footer>

  <script>
    $(document).ready(function() {
      $(".profile-dropdown").hover(
        function() {
          $(this).find(".dropdown-content").slideDown(300);
        },
        function() {
          $(this).find(".dropdown-content").slideUp(300);
        }
      );
    });
  </script>
</body>
</html>