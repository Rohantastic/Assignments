import java.util.Scanner ;
public class StrongNumber {

	public static void main(String[] args) {
	//If sum of factorial of each digit of a number is equal to that number, 
		//then that number is called strong number.
		Scanner scan = new Scanner(System.in);
		System.out.print("Enter the number " );
		int Number = scan.nextInt();
		int LastNumber=0; int cutter=0;
		while(Number>0) {
			LastNumber = Number % 10 ;
			cutter = cutter * 10 + LastNumber ;
			Number = Number / 10;
			
			
		}
		System.out.print(LastNumber);
		/*	int next = LastNumber ;
		 LastNumber=0;  cutter=0;
		while(next > 0) {
			LastNumber = next % 10 ;
			cutter = cutter * 10 + LastNumber ;
			System.out.print(LastNumber);
			next = next / 10;
			
		} */
		
	}

}
