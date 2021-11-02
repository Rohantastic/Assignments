

import java.util.Scanner;

public class Prime{
    
    public static void main(String[] args) {
        Scanner scan=new Scanner(System.in);
        System.out.println("Enter the number :");
        int num=scan.nextInt();
        int i,var=0;
        for(i=2;i<=num/2;i++)
        {
            if(num%i==0)
            {
                var=1;
                break;
            }
        }
        if(var==1)
            System.out.println("Not a prime number");
        else
            System.out.println("Prime number");
    }
}
