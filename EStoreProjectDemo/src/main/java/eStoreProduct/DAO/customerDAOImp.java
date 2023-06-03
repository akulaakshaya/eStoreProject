
package eStoreProduct.DAO;
import java.util.List;
import javax.sql.DataSource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import eStoreProduct.model.custCredModel;

@Component
public class customerDAOImp implements customerDAO{
	
	
	JdbcTemplate jdbcTemplate;

	
	private final String SQL_INSERT_CUSTOMER = "insert into slam_customers(cust_name,  cust_mobile , cust_regdate ,cust_location , cust_email ,cust_address, cust_saddress, cust_pincode ,cust_status ,cust_lastlogindate, cust_pswd ) values(?,?,?,?,?,?,?,?,?,?,?)";

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
			return jdbcTemplate.update(SQL_INSERT_CUSTOMER, ccm.getCustName(),ccm.getCustMobile(),ccm.getCustRegDate(),ccm.getCustLocation(),ccm.getCustEmail(),ccm.getCustAddress(),ccm.getCustSAddress(),ccm.getCustPincode(),ccm.getCustStatus(),ccm.getCustLastLoginDate(),ccm.getCustPassword()) > 0;
		}


}
