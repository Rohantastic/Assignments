import java.util.Scanner;
public class Strin {
	//Write a program to find the length of a string without using the library function?
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner scan = new Scanner(System.in);
		String S = scan.nextLine(); int length=0;
	/*	int a=0;
		a=S.length();
		System.out.println(a); */
		
		char[] aa = S.toCharArray();
		for( char asa:aa) {
			length++;
		}
		System.out.println(length);
	}

}
