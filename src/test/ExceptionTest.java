package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.Connector;

public class ExceptionTest {
	static void test() {
		String numStr = "1.1";
		Connection conn = null; 
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<String> titleList = new ArrayList<>();
		
		try {
			conn = Connector.getConnection();
			ps = conn.prepareStatement("select * from board");
			rs = ps.executeQuery();
		}catch(Exception e) {
			System.out.println("왜 숫자가 아닌거야");
		}
	}
	
	public static void main(String[] args) {
		test();
		
	}
}
