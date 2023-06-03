package eStoreProduct.model;


import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class customerMapper implements RowMapper<custCredModel> {

	public custCredModel mapRow(ResultSet resultSet, int i) throws SQLException {

		custCredModel ccm=new custCredModel();
		ccm.setCustName(resultSet.getString(2));
		
		ccm.setCustPassword(resultSet.getString(12));
		return ccm;
	}
}