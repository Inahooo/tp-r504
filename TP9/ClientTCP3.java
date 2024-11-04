import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;

public class ClientTCP3 {
        public static void main(String[] args){
        try {
            Socket socket = new Socket( "localhost", 2016);
            DataOutputStream dOut = new DataOutputStream(socket.getOutputStream());
            dOut.writeUTF( args[0] );
            socket.close();
        } catch (IOException e){
            e.printStackTrace();
        }
    } 
}
