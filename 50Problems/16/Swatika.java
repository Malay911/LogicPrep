import java.util.Scanner;

public class Swatika {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter a number: ");
        int n=sc.nextInt();
        for(int i=1;i<=n;i++){
            for(int j=1;j<=n;j++){

                if(j==(n/2)+1 || i==(n/2)+1 ||
                (j==1 && i>=1 && i<=n/2) || 
                (j==n && i>=n/2+1 && i<=n) || 
                (i==1 && j>=n/2+1 && j<=n) || 
                (i==n && j>=1 && j<=n/2)){

                    System.out.print("* ");
                }
                else{
                    System.out.print("  ");
                }
            }
            System.out.println();
        }
    }
}
