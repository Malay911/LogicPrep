import java.util.Scanner;

public class AnglebtwHourandMinute {
    public static void main(String[] args) {
        Scanner sc=new Scanner(System.in);
        System.out.println("Enter hours: ");
        int h=sc.nextInt();
        System.out.println("Enter minutes: ");
        int m=sc.nextInt();
        int diff=(int) Math.min(Math.abs(30*h-5.5*m), 360-Math.abs(30*h-5.5*m));
        System.out.println(diff);
    }
}
