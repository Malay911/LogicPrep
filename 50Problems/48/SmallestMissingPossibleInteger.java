import java.util.Scanner;

public class SmallestMissingPossibleInteger {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter a number: ");
        int n=sc.nextInt();
        System.out.println("Enter elements: ");
        int arr[]=new int[n];
        for(int i=0;i<n;i++){
            arr[i]=sc.nextInt();
        }

        for(int i=0;i<n;i++){
            while(arr[i]>0 && arr[i]<=n && arr[arr[i]-1]!=arr[i]){
                int temp=arr[i];
                int idx=arr[i]-1;
                arr[i]=arr[idx];
                arr[idx]=temp;
            }
        }

        for(int i=0;i<n;i++){
            if(arr[i]!=i+1){
                System.out.println(i+1);
                break;
            }
        }
    }    
}
