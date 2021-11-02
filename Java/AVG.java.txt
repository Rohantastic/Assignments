//Write a java program to read 10 numbers from keyboard and find their  sum and average?

import java.util.Scanner;

public class Avg_and_sum
{

    public static void main(String args[]){
       int sum=0, avg=0;
        for(int i=1 ;i <=10 ; i++ ){
            sum = sum + i ;
        
        }
            avg = sum / 10 ;
        
        System.out.println( avg + " " + sum);



    }

}