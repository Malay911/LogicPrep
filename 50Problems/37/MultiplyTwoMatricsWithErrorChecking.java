import java.util.Scanner;

public class MultiplyTwoMatricsWithErrorChecking {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter rows for fist matrix: ");
        int r1=sc.nextInt();
        System.out.println("Enter column for fist matrix: ");
        int c1=sc.nextInt();
        System.out.println("Enter rows for second matrix: ");
        int r2=sc.nextInt();
        System.out.println("Enter column for second matrix: ");
        int c2=sc.nextInt();

        if(c1!=r2){
            System.out.println("Matrices cannot be multiplied");
        }
        else{
            int m1[][]=new int[r1][c1];
            int m2[][]=new int[r2][c2];

            System.out.println("Enter elements for first matrix: ");
            for(int i=0;i<r1;i++){
                for(int j=0;j<c1;j++){
                    m1[i][j]=sc.nextInt();
                }
            }

            System.out.println("Enter elements for second matrix: ");
            for(int i=0;i<r2;i++){
                for(int j=0;j<c2;j++){
                    m2[i][j]=sc.nextInt();
                }
            }

            int m3[][]=new int[r1][c2];
            for(int i=0;i<r1;i++){
                for(int j=0;j<c2;j++){
                    m3[i][j]=0;
                    for(int k=0;k<c1;k++){
                        m3[i][j]+=m1[i][k]*m2[k][j];
                    }
                }
            }

            System.out.println("Multiplied matrices: ");
            for(int i=0;i<r1;i++){
                for(int j=0;j<c2;j++){
                    System.out.print(m3[i][j]+" ");
                }
                System.out.println();
            }
        }
    }    
}
