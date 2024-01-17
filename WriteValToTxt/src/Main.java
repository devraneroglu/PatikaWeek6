import java.io.*;
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        String txtName = "writeVal.txt";
        System.out.println("Metin yazınız . Yazdığınız veriler dosyaya kayıt edilecek ..");
        Scanner sc = new Scanner(System.in);
        String sLineText = sc.nextLine();

        try {
            FileOutputStream sTxtFile = new FileOutputStream(txtName);
            ObjectOutputStream sTxt = new ObjectOutputStream(sTxtFile);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


        try {
            FileWriter fw = new FileWriter(txtName);
            BufferedWriter bw = new BufferedWriter(fw);
            bw.append(sLineText);
            bw.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        try {
            FileReader fr = new FileReader(txtName);
            BufferedReader br = new BufferedReader(fr);
            String writeVal;
            while ((writeVal = br.readLine()) != null) {
                System.out.println(writeVal);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


    }
}