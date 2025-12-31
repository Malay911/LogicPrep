// You are given a 0-indexed array nums consisting of positive integers. You can choose two indices i and j, 
// such  that  i  !=  j,  and  the  sum  of  digits  of  the  number  nums[i]  is  equal  to  that  of  nums[j].    Return  the 
// maximum value of nums[i] + nums[j] that you can obtain over all possible indices i and j that satisfy the 
// conditions.  
// Input: nums = [18,43,36,13,7] Output: 54 
// Explanation: The pairs (i, j) that satisfy the conditions are: 
// - (0, 2), both numbers have a sum of digits equal to 9, and their sum is 18 + 36 = 54. 
// - (1, 4), both numbers have a sum of digits equal to 7, and their sum is 43 + 7 = 50. 
// So the maximum sum that we can obtain is 54.

import java.util.Scanner;

public class MaximumValue {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter the size of the array: ");
        int n=sc.nextInt();
        int[] arr=new int[n];
        System.out.println("Enter the elements of the array: ");
        for(int i=0;i<n;i++){
            arr[i]=sc.nextInt();
        }
        System.out.println("The maximum value is: "+maxValue(arr));
        sc.close();
    }

    public static int maxValue(int[] arr){
        int maxSum=-1;
        for(int i=0;i<arr.length;i++){
            for(int j=i+1;j<arr.length;j++){
                if(digitSum(arr[i])==digitSum(arr[j])){
                    maxSum=Math.max(maxSum,arr[i]+arr[j]);
                }
            }
        }
        return maxSum;
    }

    public static int digitSum(int num){
        int sum=0;
        while(num>0){
            sum+=num%10;
            num/=10;
        }
        return sum;
    }
}
