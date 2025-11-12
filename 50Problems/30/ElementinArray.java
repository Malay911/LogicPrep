import java.util.Scanner;

public class ElementinArray {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter the size of the array: ");
        int n=sc.nextInt();
        int[] arr=new int[n];
        System.out.println("Enter the elements of the array: ");
        for(int i=0;i<n;i++){
            arr[i]=sc.nextInt();
        }
        System.out.println("Enter the element to be searched: ");
        int m=sc.nextInt();
        
        int result=isInArrayRecursion(arr, m);

        if(result==1){
            System.out.println("Element found in the array.");
        }
        else{
            System.out.println("Element not found in the array.");
        }
    }

    static int isInArrayRecursion(int a [], int m){
        return isInArrayHelper(a, m, 0);
    }

    static int isInArrayHelper(int a[],int m,int idx){
        if(idx==a.length){
            return 0;
        }
        if(a[idx]==m){
            return 1;
        }
        return isInArrayHelper(a, m, idx+1);
    }
}
