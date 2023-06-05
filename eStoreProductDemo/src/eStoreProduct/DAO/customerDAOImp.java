package eStoreProduct.DAO;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import eStoreProduct.model.custCredModel;
import eStoreProduct.model.customerMapper;

@Component
public class customerDAOImp implements customerDAO {

	JdbcTemplate jdbcTemplate;

	private final String SQL_INSERT_CUSTOMER = "insert into slam_customers(cust_name,  cust_mobile , cust_regdate ,cust_location , cust_email ,cust_address, cust_saddress, cust_pincode ,cust_status ,cust_lastlogindate, cust_pswd ) values(?,?,?,?,?,?,?,?,?,?,?)";
	private final String SQL_CHECK_CUSTOMER = "select * from slam_customers where cust_name=? and cust_pswd=? ";

	@Autowired
	public customerDAOImp(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@PersistenceContext
	private EntityManager em;

	public void persist(custCredModel ccm) {
		em.persist(ccm);
	}

	public boolean createCustomer(custCredModel ccm) {
		return jdbcTemplate.update(SQL_INSERT_CUSTOMER, ccm.getCustName(), ccm.getCustMobile(), ccm.getCustRegDate(),
				ccm.getCustLocation(), ccm.getCustEmail(), ccm.getCustAddress(), ccm.getCustSAddress(),
				ccm.getCustPincode(), ccm.getCustStatus(), ccm.getCustLastLoginDate(), ccm.getCustPassword()) > 0;
	}

	public custCredModel checkCustomer(String usr, String pswd) {
		// TODO Auto-generated method stub

		return jdbcTemplate.queryForObject(SQL_CHECK_CUSTOMER, new Object[] { usr, pswd }, new customerMapper());
	}

}