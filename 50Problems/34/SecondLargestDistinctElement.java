import java.util.Scanner;

public class SecondLargestDistinctElement {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter number of elements: ");
        int n=sc.nextInt();
        System.out.println("Enter elements: ");
        int arr[]=new int[n];
        for(int i=0;i<n;i++){
            arr[i]=sc.nextInt();
        }

        int largest=Integer.MIN_VALUE,secondLargest=Integer.MIN_VALUE;
        for(int i=0;i<n;i++){
            if(arr[i]>largest){
                secondLargest=largest;
                largest=arr[i];
            }
            else if(arr[i]>secondLargest && arr[i]!=largest){
                secondLargest=arr[i];
            }
        }

        if(secondLargest==Integer.MIN_VALUE){
            System.out.println("-1");
        }
        else{
            System.out.println("Second largest element: "+secondLargest);
        }
    }
}
