import java.util.Scanner;

public class Chocolateperkwrapper{
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter total amount: ");
        int n=sc.nextInt();
        System.out.println("Enter price of each chocolate: ");
        int m=sc.nextInt();
        System.out.println("Enter total number of wrappers to exchange 1 chocolate: ");
        int k=sc.nextInt();

        int chocolate=n/m;
        int wrappers=chocolate;
        while(wrappers>=k){
            int newchocolate=wrappers/k;
            chocolate+=newchocolate;
            wrappers=wrappers%k+newchocolate;
        }
        System.out.println(chocolate);
    }
}