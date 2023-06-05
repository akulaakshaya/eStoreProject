<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>SLAM Store</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.2/js/bootstrap.bundle.min.js"></script>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  
  <style>
   
   
   
    .dropdown-content1 {
 
 
  right: 0;
  left: auto;
  max-width: 400px;
}
    

@media (max-width: 600px) {
  .dropdown-content1 {
    right: auto;
    left: 0;
    max-width: 100%;
  }
}


    
.profile-options {
  list-style: none;
  padding: 0;
  margin: 20px 0;
}

.profile-options li {
  margin-bottom: 10px;
}

.profile-options a {
  display: block;
  padding: 10px 20px;
  background-color: #f2f2f2;
  color: #333;
  text-decoration: none;
  transition: background-color 0.3s ease;
}

.profile-options a:hover {
  background-color: #ddd;
}

.modal-body {
  height: 300px; /* Increase or adjust the height as needed */
  overflow-y: auto;
}

.modal-content {
  width: 500px; /* Increase or adjust the width as needed */
}
    
    
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
      background-color: #333;
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
    white-space: nowrap; /* Ensures the content stays in a single line */
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
         
         <% if (!(Boolean) request.getAttribute("fl")) { %>
			  <i class="fas fa-user-shield"></i>			  
			  <div class="dropdown-content">
			    <a href="signUp">Sign Up</a>
			    <a href="signIn">Sign In</a>
			  </div>
			  <%}else{ %>
			   <i class="fas fa-user-shield"></i>
			   <div class="dropdown-content">
  <!-- <a href="#" data-bs-toggle="modal" data-bs-target="#profileModal">My Profile</a> -->
  <a href="profilePage">My Profile</a>
</div>
			   
			  <%}%>
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
  
  <div id="transitionSlideShowPage">
    <div class="slideshow-container">
      <div class="slide active">
<img  src="https://static.digit.in/default/848e74e131ed5b8172357de25c0afb9bf691029c.jpeg?tr=w-1200" />
      </div>
      <div class="slide">
        <img src="https://mobirise.com/extensions/commercem4/assets/images/3.jpg" alt="Slide 2">
      </div>
      <div class="slide">
        <img src="https://t4.ftcdn.net/jpg/03/38/88/59/240_F_338885943_qQRG84nyD1CcTdXuVD4UbzMz1xBGWjBC.jpg" alt="Slide 3">
      </div>
   <div class="slide">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRBQy58C3pHvO6tN7zHCeTqq4L2t2-Kc5ENA&usqp=CAU" alt="Slide 5">
      </div>
    </div>
    </div>
    
    
    
    
    <div id="profileCustomer">
    
    </div>
    
    <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="profileModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="profileModalLabel">Profile Page</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
 <div class="modal-body">
  <ul class="profile-options" class="dropdown-content1">
    <li><a href="#">Profile</a></li>
    <li><a href="#">eCash</a></li>
    <li><a href="#">Orders</a></li>
    <li><a href="#">Wishlist</a></li>
    <li><a href="start">Sign Out</a></li>
  </ul>

</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
    
    
  </main>
  <footer>
    <p>&copy; 2023 SLAM Store. All rights reserved.</p>
  </footer>
<script>
  $(document).ready(function() {
    var slides = $('.slide');
    var currentSlide = 0;
    
    // Function to show the current slide
    function showSlide() {
      // Hide all slides
      slides.hide();
      
      // Show the current slide
      slides.eq(currentSlide).show();
    }
    
    // Function to move to the next slide
    function nextSlide() {
      currentSlide++;
      if (currentSlide >= slides.length) {
        currentSlide = 0;
      }
      showSlide();
    }
    
    // Start the slideshow
    setInterval(nextSlide, 3000); // Change slide every 3 seconds
  });
</script>


</body>
</html>
