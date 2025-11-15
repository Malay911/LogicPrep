import java.util.Scanner;

public class nthDigitofInfiniteSequence {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter nth number: ");
        int n=sc.nextInt();
        
        int count=9;
        int digit=1;
        int num=1;
        while(n>count*digit){
            n-=count*digit;
            count*=10;
            digit++;
            num*=10;
        }
        int number=num+(n-1)/digit;

        String s=Integer.toString(number);
        char ans=s.charAt((n-1)%digit);

        System.out.println(ans);
    }
}
