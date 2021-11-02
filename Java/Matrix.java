
import java.util.Scanner;
public class Matrix {
    public static void main(String[] args) {
       Scanner sc = new Scanner(System.in);
       System.out.println("Enter the number of rows");
       int rows = sc.nextInt();
       int num = 1;
       for(int i=1;i<=rows;i++){
           for(int j=0;j<i;j++){
               System.out.print(num+" ");
               num++;
           }
           System.out.println("");
       } 
    }
}