import java.util.Scanner;
 
class Fibo {
  public static void main(String[] args) {
    Scanner in = new Scanner(System.in);
 
    int n,a=0, b=1, c=0;
 
    System.out.println("Enter the value of n");
    n = in.nextInt();
 
    
    System.out.print(a+" "+b+" ");
 
    for(int i=3; i<=n; i++){
      
      c = a+b;
      a = b;
      b = c;
      System.out.print(c+" ");
    }
  }
}