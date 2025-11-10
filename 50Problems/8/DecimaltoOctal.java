import java.util.Scanner;

public class DecimaltoOctal {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter a number: ");
        int n=sc.nextInt();
        int octal=0,rem=0,i=1;
        while(n!=0){
            rem=n%8;
            octal+=rem*i;
            n/=8;
            i*=10;
        }
        System.out.println(octal);
    }
}
