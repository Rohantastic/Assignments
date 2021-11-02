import java.util.Scanner;
public class Search {
//Write a Java program to test if an array contains a specific value?
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("Enter the array size: ");
		int arrSize = scan.nextInt(); 
		
		int arr[] = new int[arrSize];
		for(int i = 0;i <arrSize ; i++) {
			arr[i]= scan.nextInt();
		}
		System.out.println("Enter the number which you wanna find: ");
		int Finder = scan.nextInt();
		for(int i = 0;i <arrSize ; i++) {
			if(Finder == arr[i]) {
				System.out.println("Yes it contains the specific value" );
				break;
			}
			
		}
		

	}

}
