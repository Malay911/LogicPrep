import java.util.Scanner;

public class DecimaltoHexadecimal {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter a number: ");
        int n=sc.nextInt();
        String hexadecimal="";
        if(n==0){
            hexadecimal="0";
        }
        else{
            while(n!=0){
                int rem=n%16;
                if(rem<10){
                    hexadecimal=rem+hexadecimal;
                }
                else{
                    hexadecimal=(char)('A'+rem-10)+hexadecimal;
                }
                n/=16;
            }
        }
        System.out.println(hexadecimal);
    }
}
