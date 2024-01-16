import java.io.BufferedReader;
import java.io.FileReader;

public class Main {
    public static void main(String[] args) {
        try {
            FileReader txt = new FileReader("src/sum.txt");
            BufferedReader readTxt = new BufferedReader(txt);
            String line;
            int iSum = 0;
            while ((line = readTxt.readLine()) != null) {
                System.out.println(line);
                iSum += Integer.parseInt(line);
            }
            System.out.println("Toplam : " + iSum);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}