import java.io.*;
import java.net.*;

    public class ClientUDP {
        public static void main(String[] args) {   
            try { 
            InetAddress addr = InetAddress.getLocalHost();
            System.out.println("adresse=" + addr.getHostName() );
            String s = "TEST ServeurUDP !";
            byte[] data = s.getBytes();
            DatagramPacket packet = new DatagramPacket( data, data.length, addr, 1234);
            DatagramSocket sock = new DatagramSocket();
            sock.send(packet);
            sock.receive();
                System.out.println();
                sock.close();
            } catch (IOException e) {
                e.printStackTrace();
            }    
        }
    }