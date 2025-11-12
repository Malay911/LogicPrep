import java.util.Arrays;
import java.util.Scanner;

public class Anagram {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter first string: ");
        String str1=sc.nextLine().toLowerCase();
        System.out.println("Enter second string: ");
        String str2=sc.nextLine().toLowerCase();
        char[] arr1=str1.toCharArray();
        char[] arr2=str2.toCharArray();

        for(int i=0;i<arr1.length-1;i++){
            for(int j=0;j<arr1.length-1-i;j++){
                if(arr1[j]>arr1[j+1]){
                    char temp=arr1[j];
                    arr1[j]=arr1[j+1];
                    arr1[j+1]=temp;
                }
            }
        }

        for(int i=0;i<arr2.length-1;i++){
            for(int j=0;j<arr2.length-1-i;j++){
                if(arr2[j]>arr2[j+1]){
                    char temp=arr2[j];
                    arr2[j]=arr2[j+1];
                    arr2[j+1]=temp;
                }
            }
        }

        if(Arrays.equals(arr1, arr2)){
            System.out.println("Anagram");
        } 
        else{
            System.out.println("Not Anagram");
        }
    }
}
