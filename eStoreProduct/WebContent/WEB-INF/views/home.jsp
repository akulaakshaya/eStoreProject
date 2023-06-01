<!DOCTYPE html>
<html>
<head>
  <title>SLAM Store</title>
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
    
    /* Add more styles as needed */
  </style>
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
        <li><a href="#">Cart</a></li>
        <li><a href="#">WishList</a></li>
        <li><a href="#">Profile</a></li>
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
    // JavaScript for slideshow functionality
    const slides = document.querySelectorAll('.slide');
    let currentSlide = 0;
    const slideInterval = setInterval(nextSlide, 3000);
    
    function nextSlide() {
      slides[currentSlide].classList.remove('active');
      currentSlide = (currentSlide + 1) % slides.length;
      slides[currentSlide].classList.add('active');
    }
  </script>
</body>
</html>
