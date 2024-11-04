import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

public class ServeurTCP3 {
        public static void main(String[] args) {   
            try { 
                ServerSocket socketserver = new ServerSocket( 2016 );
                while(true){
                    System.out.println( "serveur en attente" );
                    Socket socket = socketserver.accept();
                    System.out.println("Connection d'un client");
                    DataInputStream dIn = new DataInputStream( socket.getInputStream());
                    String rev = new StringBuilder(dIn.readUTF()).reverse().toString();
                    System.out.println("Message inversé : " + rev);
                }
        } catch (IOException e) {
            e.printStackTrace();
        }  
    }
}