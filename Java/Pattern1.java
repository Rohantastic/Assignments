//6. Write a program to display the pattern like right angle triangle with a number as shown below : 
/*
1
12
123
1234 */

import java.util.Scanner;
public class Pattern1{
    public static void main(String args[]) 
    {
        Scanner scan = new Scanner(System.in);
        int a= scan.nextInt();
        for(int i=1; i<=a ; i++){
            
                for( int j=1 ; j<=i ; j++)
                        System.out.print(j);
        System.out.print("\n");
        }

    }
}