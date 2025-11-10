import java.util.Scanner;

public class OctaltoDecimal {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter a number: ");
        int n=sc.nextInt();
        int decimal=0,rem=0,i=1;
        while(n!=0){
            rem=n%10;
            decimal+=rem*i;
            n/=10;
            i*=8;
        }
        System.out.println(decimal);
    }
}
