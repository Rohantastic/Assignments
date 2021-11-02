
import java.util.Scanner;

public class Armstrong{
    public static void main(String[] args) {
        Scanner input=new Scanner(System.in);
        System.out.println("Enter a var to check whether its armstrong:\n");
        int var=input.nextInt();
        int digit=0,cube=0,sum=0;
        int arm=var;
        while(var>0){
            digit=var%10;
            cube=digit*digit*digit;
            sum=sum+cube;
            var=var/10;
        }
        if(sum==arm)
        System.out.println(arm+ " is armstrong.");
        else
        System.out.println(arm+" is not armstrong");
    }
}
