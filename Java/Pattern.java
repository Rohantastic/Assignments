//5. Write a program to display the pattern like right angle triangle using an asterisk as shown below:
/*
*
**
***
**** 
*/

import java.util.Scanner;
public class Pattern{
    public static void main(String args[]) 
    {
        Scanner scan = new Scanner(System.in);
        int a= scan.nextInt();
        for(int i=1; i<=a ; i++){
            
                for( int j=1 ; j<=i ; j++)
                        System.out.print("*");
        System.out.print("\n");
        }

    }
}