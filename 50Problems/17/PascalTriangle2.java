import java.util.Scanner;

public class PascalTriangle2 {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter number of rows: ");
        int n=sc.nextInt();
        for(int i=1;i<=n;i++){
            for(int j=1;j<=n-i;j++){
                System.out.print(" ");
            }

            int c=1;
            for(int k=1;k<=i;k++){
                System.out.print(c+" ");
                c=c*(i-k)/(k);
            }
            System.out.println();
        }
    }
}
