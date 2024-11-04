import java.io.*;
import java.net.Socket;

public class Clienthttp {
    public static void main(String[] args) {
        if (args.length != 1) {
            System.out.println("Usage: java ClientHTTP <hostname>");
            return;
        }

        String hostname = args[0];

        try {
            // Ouvrir un socket sur le port 80
            Socket socket = new Socket(hostname, 80);

            // Création des flux pour la communication
            OutputStreamWriter OSW = new OutputStreamWriter(socket.getOutputStream());
            BufferedWriter bufout = new BufferedWriter(OSW);
            InputStreamReader isr = new InputStreamReader(socket.getInputStream());
            BufferedReader bufIn = new BufferedReader(isr);

            // Création de la requête HTTP
            String request = "GET / HTTP/1.0\r\n\r\n";
            bufout.write(request);
            bufout.flush();

            // Lecture de la réponse ligne par ligne
            String line;
            while ((line = bufIn.readLine()) != null) {
                System.out.println(line); // Afficher le contenu reçu
            }

            // Fermeture des flux et du socket
            bufIn.close();
            bufout.close();
            socket.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
