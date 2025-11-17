import java.util.Scanner;

public class AllPossiblePermutations {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter number of elements: ");
        int n=sc.nextInt();
        System.out.println("Enter elements: ");
        int arr[]=new int[n];
        for(int i=0;i<n;i++){
            arr[i]=sc.nextInt();
        }

        permute(arr,0,n-1);

        sc.close();
    }

    public static void permute(int arr[],int l,int r){
        if(l==r){
            for(int i=0;i<=r;i++){
                System.out.print(arr[i]+" ");
            }
            System.out.println();
        }
        else{
            for(int i=l;i<=r;i++){
                int temp=arr[l];
                arr[l]=arr[i];
                arr[i]=temp;
                permute(arr,l+1,r);
                temp=arr[l];
                arr[l]=arr[i];
                arr[i]=temp;
            }
        }
    }
}
