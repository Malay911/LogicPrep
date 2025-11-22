import java.util.Scanner;

public class RotateArraytoRightbyKsteps {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter number of elements: ");
        int n=sc.nextInt();
        System.out.println("Enter elements: ");
        int arr[]=new int[n];
        for(int i=0;i<n;i++){
            arr[i]=sc.nextInt();
        }

        System.out.println("Enter the number of steps to rotate: ");
        int k=sc.nextInt();
        k=k%n;
        for(int i=0;i<k;i++){
            int temp=arr[n-1];
            for(int j=n-1;j>0;j--){
                arr[j]=arr[j-1];
            }
            arr[0]=temp;
        }
        System.out.println("Rotated Array: ");
        for(int i=0;i<n;i++){
            System.out.println(arr[i]);
        }
        sc.close();
    }    
}
