// 4 4 4 4 4 4 4 
// 4 3 3 3 3 3 4 
// 4 3 2 2 2 3 4 
// 4 3 2 1 2 3 4 
// 4 3 2 2 2 3 4 
// 4 3 3 3 3 3 4 
// 4 4 4 4 4 4 4

import java.util.Scanner;

public class Pattern {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter a number: ");
        int n=sc.nextInt();
        for(int i=1;i<=2*n-1;i++){
            for(int j=1;j<=2*n-1;j++){
                int top=i-1;
                int bottom=2*n-1-i;
                int left=j-1;
                int right=2*n-1-j;
                int min=Math.min(Math.min(top,bottom), Math.min(left,right));
                System.out.print(n-min+" ");
            }
            System.out.println();
        }
    }
}