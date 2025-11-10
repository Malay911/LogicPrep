import java.util.Scanner;

public class InsertElementatSpecificPosition {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter number of elements: ");
        int n=sc.nextInt();
        System.out.println("Enter elements: ");
        int arr[]=new int[n+1];
        for(int i=0;i<n;i++){
            arr[i]=sc.nextInt();
        }
        System.out.println("Enter posiition to insert: ");
        int pos=sc.nextInt();
        System.out.println("Enter element to insert: ");
        int x=sc.nextInt();
        
        for(int i=n-1;i>=pos;i--){
            arr[i+1]=arr[i];
        }
        arr[pos]=x;

        System.out.println("Array");
        for(int i=0;i<n+1;i++){
            System.out.println(arr[i]);
        }
    }
}
