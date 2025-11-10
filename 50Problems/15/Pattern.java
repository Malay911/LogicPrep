import java.util.Scanner;

public class Pattern {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter number of rows: ");
        int n=sc.nextInt();
        for(int i=1;i<=n;i++){
            for(int j=1;j<=2*i-1;j++){
                if(i==j){
                    System.out.print(i+" ");
                }
                else if(j==1 || j==2*i-1){
                    System.out.print("1 ");
                }
                else{
                    System.out.print("* ");
                }
            }
            System.out.println();
        }
    }
}
