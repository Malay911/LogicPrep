import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

public class SecondOccurence {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter string: ");
        String str=sc.nextLine();
        Set<Character> seen = new HashSet<>();
        for(int i=0;i<str.length();i++){
        Character s=str.charAt(i);
            if(seen.contains(s)){
                System.out.println(s);
                return;
            }
            else{
                seen.add(s);
            }
        }
        System.out.println("No character repeated");
    }
}
