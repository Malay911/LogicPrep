import java.util.Scanner;

public class ArrayMedian{
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter a number: ");
        int n1=sc.nextInt();
        System.out.println("Enter elements for array 1: ");
        int arr1[]=new int[n1];
        for(int i=0;i<n1;i++){
            arr1[i]=sc.nextInt();
        }

        System.out.println("Enter a number: ");
        int n2=sc.nextInt();
        System.out.println("Enter elements for array 2: ");
        int arr2[]=new int[n2];
        for(int i=0;i<n2;i++){
            arr2[i]=sc.nextInt();
        }

        int arr3[]=new int[n1+n2];
        int i=0,j=0,k=0;
        while(i<arr1.length && j<arr2.length){

                if(arr1[i]<arr2[j]){
                    arr3[k++]=arr1[i];
                    i++;
                }
                else{
                    arr3[k++]=arr2[j];
                    j++;
                }
        }
        while(j<arr2.length){
            arr3[k++]=arr2[j++];
        }
        while(i<arr1.length){
            arr3[k++]=arr1[i++];
        }
        // for(int i=0;i<n1;i++){
        //     arr3[i]=arr1[i];
        // }
        // for(int i=n1;i<n1+n2;i++){
        //     arr3[i]=arr2[i-n1];
        // }

        double median;
        int len=arr3.length;
        if(len%2==0){
            median=(arr3[len/2-1]+arr3[len/2])/2.0;
        }
        else{
            median=arr3[len/2];
        }
        System.out.println(median);
    }
}