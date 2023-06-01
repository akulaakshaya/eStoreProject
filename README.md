# eStoreProject
Online Store v1.0
	-31st May 2023


=> Users

	-Customer
	-Shopkeeper

=> Public Options
	
	-Products List
		-View Product Info
		-Add to Cart/Remove from Cart
		-Extra : Variant concept
		-Pin code availabilitycheck

		-Should be able to add product to wishlist/Remove from wish list
		-Should also display 'Out of the Stock' if the stock is zero
	-Cart
		-Here we should display all items in the cart
		-Here also we should be able add/remove
		-Proceed 
			-Sign In/Sign Up
			-Shipping Address
			-Payment(Integrate with Razorpay test payment)
			-once the payment is done, create the order, and send the order invoice pdf 
				to customer email
	-Sign In	
	-Sign Up
	
=> Customer Options
	-Sign In
	-Profile
		-View
		-Edit address
		-Edit contact details

		-Different shipping addresses
			-edit of shipping addresses
	-eCash
		-show the ecash(ex: cash back amount or refund amount)
		-We can use this ecash for processing payment
	-Orders
		-List of orders /history
			-View order info
			-view invoice
	-Wishlist
		-List all the products that are there in the wishlist
	-Sign Out
		--

=> Admin Options
	

	-Dashboard
		-Show all orders 
		-Show all shipments

	-Orders
		-All orders with filters(between dates, value rang wise, location wise)
			-View order info
			-view invoice
	-Payments
		-all payments recieved

	-Stock 
		-Show current stock
			-View product stock
		-Show Reorder Level

	-Master Entry
		-Product Categories
		-Products
		
	-Reports
		-Daily Sales REport
		-Monthly GST Report
		-Product Category wise summary report

	
Note: Calculate the shipping charges, state wise or pin code wise
	-GST to be charged on shipping charges

GST will have 2 components
	1. SGST
	2. IGST 
	3. CGST

GST is based on HSN Code
		-
