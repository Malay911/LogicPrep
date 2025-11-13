import java.util.Scanner;

public class ElementswithSumK {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter a number: ");
        int n=sc.nextInt();
        System.out.println("Sum to be found: ");
        int k=sc.nextInt();
        System.out.println("Enter elements: ");
        int arr[]=new int[n];
        for(int i=0;i<n;i++){
            arr[i]=sc.nextInt();
        }
        int count=0;
        for(int i=0;i<n;i++){
            for(int j=i+1;j<n;j++){
                if(k==(arr[i]+arr[j])){
                    count++;
                }
            }
        }
        System.out.println(count);
    }
}
