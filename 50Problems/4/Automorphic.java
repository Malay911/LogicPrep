import java.util.Scanner;

public class Automorphic {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter a number: ");
        int n=sc.nextInt();
        int n2=n*n;
        int temp = n;
        int count = 0;
        while (temp != 0) {
            temp /= 10;
            count++;
        }
        int a=(int) (n2%Math.pow(10, count));
        if(n==a){
            System.out.println("Automorphic");
        }
        else{
            System.out.println("Not Automorphic");
        }
    }
}
