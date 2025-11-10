import java.util.Scanner;

public class HexadecimaltoDecimal {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter a number: ");
        String hex=sc.nextLine().toUpperCase();
        int decimal=0,base=1;

        for(int i=hex.length()-1;i>=0;i--){
            char c=hex.charAt(i);

            if(c>='0' && c<='9'){
                decimal+=base*(c-'0');
            }
            else if(c>='A' && c<='F'){
                decimal+=base*(c-'A'+10);
            }
            else{
                System.out.println("Invalid input");
                return;
            }
            base*=16;
        }

        System.out.println(decimal);
    }
}
