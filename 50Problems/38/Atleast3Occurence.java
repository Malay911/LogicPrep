import java.util.Scanner;

public class Atleast3Occurence {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter number of elements: ");
        int n=sc.nextInt();
        System.out.println("Enter sorted elements: ");
        int arr[]=new int[n];
        for(int i=0;i<n;i++){
            arr[i]=sc.nextInt();
        }

        for(int i=0;i<n-1;i++){
            if(arr[i]>arr[i+1]){
                System.out.println("0");
                return;
            }
        }

        if(atleastthreeOccurence(arr,n)==1){
            System.out.println("1");
        }
        else{
            System.out.println("0");
        }
    }

    public static int atleastthreeOccurence(int arr[],int n){
        for(int i=0;i<n;i++){
            int count=1;
            while(i+1<n && arr[i]==arr[i+1]){
                count++;
                i++;
            }
            if(count>=3){
                return 1;
            }
            i++;
        }
        return 0;
    }
}
