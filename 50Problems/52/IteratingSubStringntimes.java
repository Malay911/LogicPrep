import java.util.Scanner;

public class IteratingSubStringntimes {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter a string: ");
        String s=sc.nextLine();
        int n=s.length();

        for(int len=1;len<=n/2;len++){
            if(n%len!=0){
                continue;
            }

            boolean match=true;
            for(int i=0;i<n;i++){
                if(s.charAt(i)!=s.charAt(i%len)){
                    match=false;
                    break;
                }
            }
            if(match){
                System.out.println("true");
                return;
            }
        }
        System.out.println("false");
    }    
}
