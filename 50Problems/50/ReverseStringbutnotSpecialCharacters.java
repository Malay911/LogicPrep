import java.util.Scanner;

public class ReverseStringbutnotSpecialCharacters {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter a string: ");
        String s=sc.nextLine();
        char[] arr=s.toCharArray();
        int i=0,j=s.length()-1;
        while(i<j){
            if(Character.isAlphabetic(arr[i]) && Character.isAlphabetic(arr[j])){
                char temp=arr[i];
                arr[i]=arr[j];
                arr[j]=temp;
                i++;j--;
            }
            else{
                if(!Character.isAlphabetic(arr[i])){
                    i++;
                }
                else{
                    j--;
                }
            }
        }
        System.out.println(arr);
    }    
}
