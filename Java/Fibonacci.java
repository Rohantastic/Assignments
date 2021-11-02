import java.util.*;

public class Fibonacci {

	public static void main(String[] args) {
		Scanner sc= new Scanner(System.in);
		System.out.println("Enter the number ");
		int ne = sc.nextInt();
		int i=1;
		int a=0,b=1,c=0;
		//System.out.println();
		while(i <= ne ) {
			
			System.out.println(a);
			
			c=a+b;
			a=b;
			b=c;
			i++;
			
		}
		

	}

}
