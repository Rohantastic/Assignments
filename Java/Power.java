import java.util.Scanner;
class Power {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        System.out.println("Enter the two number ");
      int base = scan.nextInt();
      int powerRaised =scan.nextInt();
      int result = power(base, powerRaised);
  
      System.out.println(base + "^" + powerRaised + "=" + result);
    }
  
    public static int power(int base, int powerRaised) {
      if (powerRaised != 0) {
  
      
        return (base * power(base, powerRaised - 1));
      }
      else {
        return 1;
      }
    }
  }