import java.util.Scanner;

public class Pattern {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter number of rows: ");
        int n=sc.nextInt();
        int count=1;
        for(int i=1;i<=n;i++){
            if (i%2==0) {
                int temp=count+n-1;
                for (int j=1;j<=n;j++) {
                    System.out.print(temp--+" ");
                    count++;
                }
            }
            else{
                for(int j=1;j<=n;j++) {
                    System.out.print(count+++" ");
                }
            }
            System.out.println();
        }
    }
}
