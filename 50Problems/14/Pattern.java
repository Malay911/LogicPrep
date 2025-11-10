//       1
//     2 1 2
//   3 2 1 2 3
// 4 3 2 1 2 3 4
//   3 2 1 2 3
//     2 1 2
//       1


import java.util.Scanner;

public class Pattern {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter a number: ");
        int n=sc.nextInt();

        for(int i=1;i<=n;i++){
            for(int j=i;j<=n;j++){
                System.out.print("  ");
            }

            for(int j=i;j>=1;j--){
                System.out.print(j+" ");
            }

            for(int j=2;j<=i;j++){
                System.out.print(j+" ");
            }
            System.out.println();
        }

        for (int i=n-1;i>=1;i--){
            for(int j=n;j>=i;j--){
                System.out.print("  ");
            }

            for(int j=i;j>=1;j--){
                System.out.print(j+" ");
            }

            for(int j=2;j<=i;j++){
                System.out.print(j+" ");
            }
            System.out.println();
        }
    }
}
