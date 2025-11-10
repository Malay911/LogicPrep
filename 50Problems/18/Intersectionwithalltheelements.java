// Given two integer arrays nums1 and nums2, return an array of their intersection.  
// Each element in the result must appear as many times as it shows in both arrays and you may return the 
// result in sorted order. 

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class Intersectionwithalltheelements {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter a number: ");
        int n1=sc.nextInt();
        int arr1[]=new int[n1];
        System.out.println("Enter elements of array 1: ");
        for(int i=0;i<n1;i++){
            arr1[i]=sc.nextInt();
        }

        System.out.println("Enter a number: ");
        int n2=sc.nextInt();
        int arr2[]=new int[n2];
        System.out.println("Enter elements of array 2: ");
        for(int i=0;i<n2;i++){
            arr2[i]=sc.nextInt();
        }

        Arrays.sort(arr1);
        Arrays.sort(arr2);
        List<Integer> list=new ArrayList<>();
        
        int i=0,j=0;
        while(i<n1 && j<n2){
            if(arr1[i]==arr2[j]){
                list.add(arr1[i]);
                i++;
                j++;
            }
            else if(arr1[i]<arr2[j]){
                i++;
            }
            else{
                j++;
            }
        }
        System.out.println("Intersection of arrays: ");
        for(int k=0;k<list.size();k++){
            System.out.println(list.get(k)+" ");
        }
    }   
}
