import java.util.Scanner;

public class Difference {
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

        int smallest=Integer.MAX_VALUE,secondsmallest=Integer.MAX_VALUE;
        for(int i=0;i<n;i++){
            if(arr[i]<smallest){
                secondsmallest=smallest;
                smallest=arr[i];
            }
            else if(arr[i]<secondsmallest && arr[i]!=smallest){
                secondsmallest=arr[i];
            }
        }

        // if (secondLargest == Integer.MIN_VALUE)
        //     secondLargest = largest;
        // if (secondsmallest == Integer.MAX_VALUE)
        //     secondsmallest = smallest;
        System.out.println("Second Largest: "+secondLargest);
        System.out.println("Second Smallest: "+secondsmallest);
        int difference=secondLargest-secondsmallest;
        System.out.println(difference);
    }
}
