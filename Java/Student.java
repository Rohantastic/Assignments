 
import java.util.Scanner;
public class Student
 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Input the Roll Number of the student :");
        int  roll=sc.nextInt();
        System.out.println("Input the Name of the Student :");
        String name=sc.next();
        System.out.println("Input the marks of Physics, Chemistry and Computer Application :");
        int physics=sc.nextInt();
        int chemistry=sc.nextInt();
        int  cp=sc.nextInt();
        int total=physics+chemistry+ cp;
        double percentage=(total/300.0)*100.0;
        String division;
        if(percentage>=90)
            division="First";
        else if(percentage>=80)
            division="Second";
        else if(percentage>=70)
            division="Third";
        else
            division="Fail";

        System.out.println("Roll No : "+ roll);
        System.out.println("Name of Student : "+name);
        System.out.println("Total marks:"+total);
        System.out.println("Percentage :"+percentage);
        System.out.println("Division :"+division);
    }
}
