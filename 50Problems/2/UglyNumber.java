import java.util.Scanner;

public class UglyNumber {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter a number: ");
        int n=sc.nextInt();
        while(n!=1){
            if(n%2==0){
                n/=2;
            }
            else if(n%3==0){
                n/=3;
            }
            else if(n%5==0){
                n/=5;
            }
            else{
                System.out.println("Not Ugly");
                return;
            }
        }
        System.out.println("Ugly Number");
    }
}
