package eStoreProduct.DAO;



import eStoreProduct.model.custCredModel;


public interface customerDAO{
	boolean createCustomer(custCredModel   ccm);

	custCredModel checkCustomer(String usr,String pswd);

	
}