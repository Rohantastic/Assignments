import java.util.Scanner;
public class Largest {
// Write a program to find out highest and second highest number in an array?
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		System.out.println("Enter the array size: ");
		int arrSize = scan.nextInt(); 
		
		int arr[] = new int[arrSize];
		for(int i = 0;i <arrSize ; i++) {
			arr[i]= scan.nextInt();
		}
		//System.out.println("The highest number is: ");
		int greater=0; int swap=0;
	
		
		for(int i = 0;i <arrSize ; i++) {
			for( int j = i + 1 ; j < arrSize ; j++) {
					if(arr[i] > arr[j]) {
						swap = arr[i];
						arr[i] = arr[j];
						arr[j] = swap;
					}
			}
		
		}
		//System.out.println("Sorted form of array is: ");
		 /*for(int i = 0;i <arrSize ; i++) {
			System.out.print(arr[i]);
		} */
			System.out.println("The largest number is: " + arr[arrSize-1]);
			System.out.println("The second largest number is: " + arr[arrSize-2]);
}
}