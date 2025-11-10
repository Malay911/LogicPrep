import java.util.Scanner;

public class Pronic {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter a number: ");
        int n=sc.nextInt();
        boolean isPronic=false;
        for(int i=0;i<n;i++){
            if(n==i*(i+1)){
                isPronic=true;
                break;
            }
        }
        if(isPronic){
            System.out.println("Pronic");
        }
        else{
            System.out.println("Not Pronic");
        }
    }
}
