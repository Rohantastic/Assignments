import java.util.Scanner;

/*
****Welcome to Snack Center *********
1. Tea (Rs. 10)
2. Green Tea (Rs. 15)
3. Samosa (Rs. 20)
4. Sandwitch (Rs. 50)
5. Generate Bill & Exit
*/
public class SnackCenter {

	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		boolean shouldContinue = true;
		int teaQty = 0, greenTeaQty = 0, samosaQty = 0, sandwitchQty = 0;
		
		do {
			System.out.println("****Welcome to Snack Center *********");
			System.out.println("1. Tea (Rs. 10)");
			System.out.println("2. Green Tea (Rs. 15)");
			System.out.println("3. Samosa (Rs. 20)");
			System.out.println("4. Sandwitch (Rs. 50)");
			System.out.println("5. Generate Bill & Exit");
			System.out.println("Enter your choice");
			int choice = scan.nextInt();
			
			switch (choice) {
			case 1:
				System.out.println("Enter the quantity of Tea");
				teaQty = teaQty + scan.nextInt();
				
				break;
			case 2:
				System.out.println("Enter the quantity of Green Tea");
				greenTeaQty = greenTeaQty + scan.nextInt();
				break;
			case 3:
				System.out.println("Enter the quantity of Samosa");
				samosaQty = samosaQty + scan.nextInt();
				break;
			case 4:
				System.out.println("Enter the quantity of Sandwitch");
				sandwitchQty = sandwitchQty + scan.nextInt();
				break;
			case 5:
				double bill = teaQty * 10 + greenTeaQty * 15 + samosaQty*20 + sandwitchQty* 50;
				if(teaQty > 0) System.out.println("Tea Qty = " + teaQty);
				if(greenTeaQty > 0) System.out.println("Green Tea Qty = " + greenTeaQty);
				if(samosaQty > 0) System.out.println("Samosa Qty = " + samosaQty);
				if(sandwitchQty > 0) System.out.println("Sandwitch Qty = " + sandwitchQty);
				System.out.println("Your total bill is "+ bill);
				shouldContinue = false;
				//System.exit(0);
				break;
			default:
				System.out.println("Invalid choice. Try again");
			}
			
		} while (shouldContinue);
		
		scan.close();
	}

}
