package test;
class Extend{
	public final int getInt() { //final 상수는 상속이던 뭐던 변경이 안됨
		return 0;
		
	}
}
public class FinalTest extends Extend {

		final int a = 1;
		public int getInt() {
			return 1;
		}
}
