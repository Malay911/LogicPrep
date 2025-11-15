import java.util.Scanner;

public class PossibleWaystoClimbStairs {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter number of stairs: ");
        int n=sc.nextInt();
        if(n<0) System.out.println("Invalid input");
        if(n==0) System.out.println(1);

        int ways[]=new int[n+1];
        ways[0]=1;
        ways[1]=1;
        if(n>=2) ways[2]=2;
        for(int i=3;i<=n;i++){
            ways[i]=ways[i-1]+ways[i-2]+ways[i-3];
        }
        System.out.println(ways[n]);
    }
}
