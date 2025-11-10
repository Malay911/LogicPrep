import java.util.Scanner;

public class HappyNumber {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter a number: ");
        int n=sc.nextInt();
        // int result=n;
        // int sum=0;
        // while(result!=1 && result!=4){
        //     sum=0;
        //     while(result!=0){
        //         int rem=result%10;
        //         sum+=rem*rem;
        //         result/=10;
        //     }
        //     result=sum;
        // }
        // if(result==1){
        //     System.out.println("Happy Number");
        // }
        // else{
        //     System.out.println("Not Happy");
        // }
        int temp=n;
        int index=0;
        int sum=0;
        int arr[]=new int[1000];
        while(true){
            sum=0;
            while(temp!=0){
                int rem=temp%10;
                sum+=rem*rem;
                temp/=10;
            }
        
            if(sum==1) {
                System.out.println("Happy Number");
                break;
            }
            else{
                boolean repeated=false;
                for(int k=0;k<index;k++){
                    if(sum==arr[k]){
                        repeated=true;
                        break;
                    }
                }
        
                if(repeated){
                    System.out.println("Not Happy Number");
                    break;
                }
                else{
                    arr[index++]=sum;
                    temp=sum;
                }
            }
        }
    }
}