import java.util.Scanner;

public class RotateArray {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter number of elements: ");
        int n=sc.nextInt();
        System.out.println("Enter elements: ");
        int arr[]=new int[n];
        for(int i=0;i<n;i++){
            arr[i]=sc.nextInt();
        }

        System.out.println("Enter number elements to be shifted: ");
        int k=sc.nextInt();

        k=k%n;
        int[] rotate=new int[n];
        int idx=0;
        for(int i=n-k;i<n;i++){
            rotate[idx++]=arr[i];
        }
        for(int i=0;i<n-k;i++){
            rotate[idx++]=arr[i];
        }

        System.out.println("Rotated Array: ");
        for(int i=0;i<n;i++){
            System.out.print(rotate[i]+" ");
        }
    }
}
