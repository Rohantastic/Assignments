import java.util.*;
public class Reverse {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("Enter the number : ");
		Scanner sc= new Scanner(System.in);
		int n = sc.nextInt();
		int sum=0, res=0;
		while(n>0) {
			
				res = n % 10 ;
				sum = (sum * 10) + res;
				n=n/10;
		}
		System.out.println(sum);
		}

}
