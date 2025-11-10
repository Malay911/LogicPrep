import java.util.Scanner;

public class Kaprekar {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter a number: ");
        int n=sc.nextInt();
        int n2 = n * n;
        int temp = n;
        int count = 0;
        while (temp != 0) {
            temp /= 10;
            count++;
        }
        int a1=(int) (n2%Math.pow(10, count));
        int a2=(int) (n2/Math.pow(10, count));
        if(a1+a2==n){
            System.out.println("Kaprekar Number");
        }
        else{
            System.out.println("Not kaprekar");
        }
    }
}
