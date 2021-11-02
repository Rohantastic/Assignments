import java.util.Scanner;
public class Palindrom {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter the number: ");
		int a = sc.nextInt();
		int b;
		b = a;
		int sum=0;
		int  rev ;
		while(a>0) {
			rev= a%10;
			sum=(sum*10) + rev;
			a=a/10;
		}
		System.out.println(sum);
		
		if(b==sum) {
			System.out.println("The number is palindrome ");
			
		}
		else
			System.out.println("The number is not a palindrome ");
		
		

	}

}
