import java.util.Scanner;

public class BinarytoDecimal {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter a number in binary: ");
        String s=sc.nextLine();
        
        double decimal=0,base=1;
        int point=s.indexOf('.');
        if(point==-1) point=s.length();
        int i=point-1;
        while(i>=0){
            if(s.charAt(i)=='1'){
                decimal+=base;
            }
            base*=2;
            i--;
        }

        base=0.5;
        i=point+1;
        while(i<s.length()){
            if(s.charAt(i)=='1'){
                decimal+=base;
            }
            base/=2;
            i++;
        }

        System.out.println(decimal);
    }
}
