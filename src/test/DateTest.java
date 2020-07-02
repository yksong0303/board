package test;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTest {
	public static void main(String[] args) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		/*YYYY - 년도
		 * MM - 달
		 * dd - 일
		 * HH - 시간
		 * mm - 분
		 * ss - 초
		 */
		System.out.println(sdf.format(date));
	}
}
