import java.util.Scanner;

public class SumOfDigit {
	
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter the number: ");
		int num = sc.nextInt();
		System.out.println(sumOfDigit(num));
		sc.close();

	}
	
	static int sumOfDigit(int s) {
		if (s==0) return 0;
		return (s % 10) + sumOfDigit((s / 10));		
	}

}
