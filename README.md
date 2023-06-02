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
























https://static.digit.in/default/848e74e131ed5b8172357de25c0afb9bf691029c.jpeg?tr=w-1200
https://www.apple.com/newsroom/images/product/mac/standard/Apple_MacBook-Pro_14-16-inch_10182021_big.jpg.slideshow-medium.jpg
https://mobirise.com/extensions/commercem4/assets/images/3.jpg
https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRBQy58C3pHvO6tN7zHCeTqq4L2t2-Kc5ENA&usqp=CAU


package razorpay;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

@Controller
public class PaymentController {

    @Autowired
    private RazorpayService razorpayService;

    @RequestMapping(value = "/payment-options", method = RequestMethod.GET)
    public String showPaymentOptions(Model model) {
        try {
            JSONArray paymentOptions = fetchPaymentOptions();

            List<String> paymentMethods = new ArrayList<>();
            for (int i = 0; i < paymentOptions.length(); i++) {
                String name = paymentOptions.getJSONObject(i).getString("name");
                paymentMethods.add(name);
            }

            model.addAttribute("paymentMethods", paymentMethods);
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "Failed to retrieve payment options");
        }

        return "payment-options";
    }

    private JSONArray fetchPaymentOptions() throws Exception {
        // Set the API endpoint for payment options
        String apiUrl = "https://api.razorpay.com/v1/payment_options";

        // Create the URL object
        URL url = new URL(apiUrl);

        // Open a connection
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        // Set the request method
        conn.setRequestMethod("GET");

        // Set the request headers
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Authorization", "Bearer " + razorpayService.getRazorpayApiKey());

        // Get the response code
        int responseCode = conn.getResponseCode();

        // Check if the request was successful (response code 200)
        if (responseCode == HttpURLConnection.HTTP_OK) {
            // Read the response
            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            StringBuilder response = new StringBuilder();

            while ((line = reader.readLine()) != null) {
                response.append(line);
            }
            reader.close();

            // Parse the response as a JSONArray
            return new JSONArray(response.toString());
        } else {
            throw new Exception("Failed to fetch payment options. Response code: " + responseCode);
        }
    }

    // Other controller methods...
}










Online Store Database 1.0
	-1st June 2023			
	
Database

Customers
This table stores all Customers information.

Cust_id				int 	PK_CUST
cust_name			v(100)
cust_mobile
cust_regdate			datetime	//registered datetime
cust_location
cust_email
cust_address			v(200)		//permenant/correspondance address
cust_saddress			v(200)		//shipment address
cust_pincode
cust_status			char(2)
cust_lastlogindate		datetime	

Vendors
This table stores all vendors details

vndr_id				int
vndr_title
vndr_email
vdnr_regdate
vndr_location
vndr_address
vndr_pincode
vndr_contactperson
vndr_contactdesg
vndr_contactmobile
vndr_contactemail
vndr_status
vndr_

ProductCategories
This table stores different product catagories.

prct_id			int
prct_title
prct_desc

GSTCategories
This table stores all GST Categories

gstc_id			int
gstc_title		v(20)
gstc_percentage		numeric
gstc_effectivefrom	date

Products
This table stores various product info

Prod_id			
prod_title
prod_vndr_id			int	FK(Pk_VNDR)
prod_prct_id			int
prod_gstc_id			int	FK(PK_GSTC)
prod_brand

ProductStock
This table stores the Live stock available.

prod_id				int
prod_batchno			v(20)
prod_price			numeric
prod_stock			int	
prod_mrp			numeric
prod_sgst			numeric
prod_igst			numeric
prod_cgst			numeric	

Orders
This table stores all order/sales details. Master Table.

Ordr_id				int
ordr_cust_id			int
ordr_billno			int
ordr_odate			datetime
ordr_total			numeric
ordr_gst			numeric		exclusive
ordr_payreference		int
ordr_paymode			char(4)		PATM/NETB/UPIM/CCRD
ordr_paystatus			char(2)
ordr_saddress			varchar(200)	if customer wants diff shipment address
ordr_shipment_status		char(2)
ordr_shipment_date		datetime
ordr_processedby		int		FK(PK_aUSR)

OrderProducts
This table stores all products ordered under an order.

Ordr_id				int
prod_id				int
orpr_batchno			varchar(20)
orpr_qty			int
orpr_gst			numeric		//though it is there in the master, it is copied here
orpr_price			numeric
		
Shipments
This table stores all shipments

ship_id				int
ship_ordr_id			int
ship_date			datetime
ship_processedby		int		FK(Pk_AUSR)

GoodsReciepts
This table stores all goods reciepts to the stock by Vendors

grnt_id				int
grnt_date			datetime
grnt_vndr_id			int
grnt_total			numeric

GoodsReceiptPRoducts
This table stores all products recieved as part of Goods receiept

Grnt_id				int
prod_id				int
prod_batchno			varchar
prod_qty			varchar
prod_source			varchar(100)	//source location, state location is imp for GST
prod_manfacuturer		varchar(100)	//
prod_sgst			numeric
prod_igst			numeric
prod_cgst			numeric			
prod_amount			numeric

AdminUsers
This table stores all admin users

ausr_id				int	PK_AUSR
ausr_title
ausr_desg
ausr_email
ausr_pwd			v(20)




CREATE TABLE slam_customers (
    Cust_id SERIAL PRIMARY KEY,
    cust_name VARCHAR(100),
    cust_mobile VARCHAR(20),
    cust_regdate TIMESTAMP,
    cust_location VARCHAR(100),
    cust_email VARCHAR(100),
    cust_address text,
    cust_saddress text,
    cust_pincode VARCHAR(10),
    cust_status CHAR(2),
    cust_lastlogindate TIMESTAMP
);


CREATE TABLE slam_vendors (
    vndr_id SERIAL PRIMARY KEY,
    vndr_title VARCHAR(100),
    vndr_email VARCHAR(100),
    vdnr_regdate TIMESTAMP,
    vndr_location VARCHAR(100),
    vndr_address VARCHAR(200),
    vndr_pincode VARCHAR(10),
    vndr_contactperson VARCHAR(100),
    vndr_contactdesg VARCHAR(100),
    vndr_contactmobile VARCHAR(20),
    vndr_contactemail VARCHAR(100),
    vndr_status CHAR(2)
);


CREATE TABLE slam_prodCategories (
    prct_id SERIAL PRIMARY KEY,
    prct_title VARCHAR(100),
    prct_desc TEXT
);


CREATE TABLE slam_GSTCategories (
    gstc_id SERIAL PRIMARY KEY,
    gstc_title VARCHAR(20),
    gstc_percentage NUMERIC,
    gstc_effectivefrom DATE
);



CREATE TABLE slam_Products (
    prod_id SERIAL PRIMARY KEY,
    prod_title VARCHAR(100),
    prod_vndr_id INT REFERENCES slam_vendors(vndr_id),
    prod_prct_id INT REFERENCES slam_prodCategories(prct_id),
    prod_gstc_id INT REFERENCES slam_GSTCategories(gstc_id),
    prod_brand VARCHAR(100)
);


CREATE TABLE slam_ProductStock (
    prod_id INT REFERENCES slam_Products(prod_id),
    prod_batchno VARCHAR(20),
    prod_price NUMERIC,
    prod_stock INT,
    prod_mrp NUMERIC,
    prod_sgst NUMERIC,
    prod_igst NUMERIC,
    prod_cgst NUMERIC,
    PRIMARY KEY (prod_id, prod_batchno)
);

CREATE TABLE slam_aUSR (
    ausr_id SERIAL PRIMARY KEY,
    ausr_title VARCHAR(100),
    ausr_desg VARCHAR(100),
    ausr_email VARCHAR(100),
    ausr_pwd VARCHAR(20)
);



CREATE TABLE slam_Orders (
    Ordr_id SERIAL PRIMARY KEY,
    ordr_cust_id INT REFERENCES slam_Customers(Cust_id),
    ordr_billno INT,
    ordr_odate TIMESTAMP,
    ordr_total NUMERIC,
    ordr_gst NUMERIC,
    ordr_payreference INT,
    ordr_paymode CHAR(4),
    ordr_paystatus CHAR(2),
    ordr_saddress VARCHAR(200),
    ordr_shipment_status CHAR(2),
    ordr_shipment_date TIMESTAMP,
    ordr_processedby INT REFERENCES slam_aUSR(ausr_id)
);



CREATE TABLE slam_OrderProducts (
    Ordr_id INT REFERENCES slam_Orders(Ordr_id),
    prod_id INT REFERENCES slam_Products(prod_id),
    orpr_batchno VARCHAR(20),
    orpr_qty INT,
    orpr_gst NUMERIC,
    orpr_price NUMERIC,
    PRIMARY KEY (Ordr_id, prod_id)
);


CREATE TABLE slam_Shipments (
    ship_id SERIAL PRIMARY KEY,
    ship_ordr_id INT REFERENCES slam_Orders(Ordr_id),
    ship_date TIMESTAMP,
    ship_processedby INT REFERENCES slam_aUSR(ausr_id)
);

CREATE TABLE slam_GoodsReciepts (
    grnt_id SERIAL PRIMARY KEY,
    grnt_date TIMESTAMP,
    grnt_vndr_id INT REFERENCES slam_vendors(vndr_id),
    grnt_total NUMERIC
);

CREATE TABLE slam_GoodsReceiptProducts (
    Grnt_id INT REFERENCES slam_GoodsReciepts(grnt_id),
    prod_id INT REFERENCES slam_Products(prod_id),
    prod_batchno VARCHAR,
    prod_qty VARCHAR,
    prod_source VARCHAR(100),
    prod_manufacturer VARCHAR(100),
    prod_sgst NUMERIC,
    prod_igst NUMERIC,
    prod_cgst NUMERIC,
    prod_amount NUMERIC,
    PRIMARY KEY (Grnt_id, prod_id)
);


insert queries:

slam_customers
INSERT INTO slam_Customers (cust_name, cust_mobile, cust_regdate, cust_location, cust_email, cust_address, cust_saddress, cust_pincode, cust_status, cust_lastlogindate)
VALUES ('Rahul Sharma', '9876543210', '2023-06-01 10:00:00', 'Mumbai', 'rahul.sharma@example.com', '123 ABC Street', 'Apt 456', '400001', 'A', '2023-06-01 10:00:00');
INSERT INTO slam_Customers (cust_name, cust_mobile, cust_regdate, cust_location, cust_email, cust_address, cust_saddress, cust_pincode, cust_status, cust_lastlogindate)
VALUES ('Priya Patel', '8765432109', '2023-06-01 11:00:00', 'Delhi', 'priya.patel@example.com', '456 XYZ Road', NULL, '110001', 'A', '2023-06-01 11:00:00');
INSERT INTO slam_Customers (cust_name, cust_mobile, cust_regdate, cust_location, cust_email, cust_address, cust_saddress, cust_pincode, cust_status, cust_lastlogindate)
VALUES ('Amit Singh', '7890123456', '2023-06-01 12:00:00', 'Bangalore', 'amit.singh@example.com', '789 PQR Avenue', NULL, '560001', 'A', '2023-06-01 12:00:00');
INSERT INTO slam_Customers (cust_name, cust_mobile, cust_regdate, cust_location, cust_email, cust_address, cust_saddress, cust_pincode, cust_status, cust_lastlogindate)
VALUES ('Neha Gupta', '9012345678', '2023-06-01 13:00:00', 'Chennai', 'neha.gupta@example.com', '987 DEF Lane', 'Apt 123', '600001', 'A', '2023-06-01 13:00:00');
INSERT INTO slam_Customers (cust_name, cust_mobile, cust_regdate, cust_location, cust_email, cust_address, cust_saddress, cust_pincode, cust_status, cust_lastlogindate)
VALUES ('Rajesh Patel', '7654321098', '2023-06-01 14:00:00', 'Hyderabad', 'rajesh.patel@example.com', '654 GHI Road', NULL, '500001', 'A', '2023-06-01 14:00:00');
INSERT INTO slam_Customers (cust_name, cust_mobile, cust_regdate, cust_location, cust_email, cust_address, cust_saddress, cust_pincode, cust_status, cust_lastlogindate)
VALUES ('Ananya Verma', '8765432101', '2023-06-01 15:00:00', 'Kolkata', 'ananya.verma@example.com', '321 JKL Street', NULL, '700001', 'A', '2023-06-01 15:00:00');

slam_Vendors
select * from slam_Vendors
INSERT INTO slam_vendors (vndr_title, vndr_email, vdnr_regdate, vndr_location, vndr_address, vndr_pincode, vndr_contactperson, vndr_contactdesg, vndr_contactmobile, vndr_contactemail, vndr_status)
VALUES ('ABC Traders', 'abc@example.com', '2023-06-01 00:00:00', 'Mumbai', '123 Main St', '400001', 'John Doe', 'Manager', '9876543210', 'john.doe@abc.com', 'A');
INSERT INTO slam_vendors (vndr_title, vndr_email, vdnr_regdate, vndr_location, vndr_address, vndr_pincode, vndr_contactperson, vndr_contactdesg, vndr_contactmobile, vndr_contactemail, vndr_status)
VALUES ('XYZ Suppliers', 'xyz@example.com', '2023-06-01 00:00:00', 'Delhi', '456 Oak Ave', '110001', 'Jane Smith', 'Sales Executive', '8765432109', 'jane.smith@xyz.com', 'A');
INSERT INTO slam_vendors (vndr_title, vndr_email, vdnr_regdate, vndr_location, vndr_address, vndr_pincode, vndr_contactperson, vndr_contactdesg, vndr_contactmobile, vndr_contactemail, vndr_status)
VALUES ('PQR Enterprises', 'pqr@example.com', '2023-06-01 00:00:00', 'Bangalore', '789 PQR Avenue', '560001', 'Amit Singh', 'Director', '7890123456', 'amit.singh@pqr.com', 'A');
INSERT INTO slam_vendors (vndr_title, vndr_email, vdnr_regdate, vndr_location, vndr_address, vndr_pincode, vndr_contactperson, vndr_contactdesg, vndr_contactmobile, vndr_contactemail, vndr_status)
VALUES ('LMN Distributors', 'lmn@example.com', '2023-06-01 00:00:00', 'Chennai', '987 DEF Road', '600001', 'Rajesh Gupta', 'Sales Manager', '7654321098', 'rajesh.gupta@lmn.com', 'A');
INSERT INTO slam_vendors (vndr_title, vndr_email, vdnr_regdate, vndr_location, vndr_address, vndr_pincode, vndr_contactperson, vndr_contactdesg, vndr_contactmobile, vndr_contactemail, vndr_status)
VALUES ('JKL Manufacturers', 'jkl@example.com', '2023-06-01 00:00:00', 'Hyderabad', '654 GHI Street', '500001', 'Neha Patel', 'Procurement Manager', '9012345678', 'neha.patel@jkl.com', 'A');

slam_productDescription
INSERT INTO slam_ProdCategories (prct_title, prct_desc)
VALUES ('Electronics', 'Category for electronic products');
INSERT INTO slam_ProdCategories (prct_title, prct_desc)
VALUES ('Clothing', 'Category for clothing and apparel');
INSERT INTO slam_ProdCategories (prct_title, prct_desc)
VALUES ('Home Appliances', 'Category for home appliances and household items');


slam_GSTCategories
INSERT INTO slam_GSTCategories (gstc_title, gstc_percentage, gstc_effectivefrom)
VALUES ('Standard', 18.0, '2023-06-01');
INSERT INTO slam_GSTCategories (gstc_title, gstc_percentage, gstc_effectivefrom)
VALUES ('Reduced', 12.0, '2023-06-01');
INSERT INTO slam_GSTCategories (gstc_title, gstc_percentage, gstc_effectivefrom)
VALUES ('Zero Rated', 0.0, '2023-06-01');

slam_products
select * from slam_products
INSERT INTO slam_Products (prod_title, prod_vndr_id, prod_prct_id, prod_gstc_id, prod_brand)
VALUES ('iPhone 12', 1, 1, 1, 'Apple');
INSERT INTO slam_Products (prod_title, prod_vndr_id, prod_prct_id, prod_gstc_id, prod_brand)
VALUES ('Samsung Galaxy S21', 2, 1, 1, 'Samsung');
INSERT INTO slam_Products (prod_title, prod_vndr_id, prod_prct_id, prod_gstc_id, prod_brand)
VALUES ('Sony Bravia 4K TV', 3, 1, 1, 'Sony');


slam_ProductStock
INSERT INTO slam_ProductStock (prod_id, prod_batchno, prod_price, prod_stock, prod_mrp, prod_sgst, prod_igst, prod_cgst)
VALUES (1, 'BATCH001', 1000.00, 50, 1299.00, 9.00, 0.00, 9.00);
INSERT INTO slam_ProductStock (prod_id, prod_batchno, prod_price, prod_stock, prod_mrp, prod_sgst, prod_igst, prod_cgst)
VALUES (2, 'BATCH002', 800.00, 30, 999.00, 6.00, 0.00, 6.00);
INSERT INTO slam_ProductStock (prod_id, prod_batchno, prod_price, prod_stock, prod_mrp, prod_sgst, prod_igst, prod_cgst)
VALUES (3, 'BATCH003', 5000.00, 20, 5999.00, 12.00, 0.00, 12.00);


-
