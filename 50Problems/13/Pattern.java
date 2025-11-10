// * * * * * 
//   *   *
//     *
//   *   *
// * * * * *

import java.util.Scanner;

public class Pattern {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter a number: ");
        int n=sc.nextInt();
        for(int i=0;i<n;i++){
            for(int j=0;j<n;j++){
                if(i==0||i==n-1){
                    System.out.print("* ");
                }
                else if(j==i||j==n-1-i){
                    System.out.print("*");
                    if (j!=n-1){
                        System.out.print(" ");
                    }
                }
                else{
                    System.out.print("  ");
                }
            }
            System.out.println();
        }
    }    
}
