/*
1
2 3
4 5 6
7 8 9 10 */
import java.util.Scanner;
public class Pattern3{
    public static void main(String args[]) 
    {
        Scanner scan = new Scanner(System.in);
        int a= scan.nextInt();
        int v=1;
        for(int i=1; i<=a ; i++){
            
                for( int j=1 ; j<=i ; j++) {
                        
                       
                        System.out.print(v);
                        v++;
                }

        System.out.print("\n");
        }

    }
}