import java.util.Scanner;

public class DecodePattern {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter String: ");
        String s=sc.nextLine(); 
        for(int i=0;i<s.length();i++){
            char ch=s.charAt(i);
            if(Character.isDigit(ch)){
                int num=0;

                while(i<s.length() && Character.isDigit(s.charAt(i))){
                    num=num*10+(s.charAt(i)-'0');
                    i++;
                }
                if(i<s.length()){
                    char ch1=s.charAt(i);
                    for(int j=0;j<num;j++){
                        System.out.print(ch1);
                    }
                }
                else{
                    System.out.println(num);
                }
            }
            else{
                System.out.print(ch);
            }
        }
    }    
}
