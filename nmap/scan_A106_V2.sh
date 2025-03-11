#!/bin/bash

# Définir la plage d'adresses IP à scanner (par exemple, 192.168.1.0/24)
subnet="172.16.0.0/24"

# Fichier CSV de sortie
output_file="scan-result_2.csv"

# Initialiser le fichier CSV avec les en-têtes
echo "IP, TCP_port_open, UDP_port_open" > "$output_file"

# Étape 1: Effectuer un scan Nmap pour trouver les machines actives
echo "Début du scan des machines actives..."
active_ips=$(nmap -sn "$subnet" | grep "Nmap scan report" | awk '{print $5}')

# Étape 2: Pour chaque machine active, effectuer un deuxième scan pour trouver les ports ouverts
for ip in $active_ips; do
    echo "Scan des ports ouverts sur $ip..."
    
    # Scan port tcp
    tcp_open_ports=$(nmap -sT -F "$ip" | grep "open" | wc -l)
	
    # Scan port tcp
    udp_open_ports=$(nmap -sU -F "$ip" | grep "open" | wc -l)
    
    # Si des ports sont ouverts, ajouter l'IP et le nombre de ports ouverts au fichier CSV
    echo "$ip, $tcp_open_ports, $udp_open_ports" >> "$output_file"

done

echo "Scan terminé. Résultats enregistrés dans $output_file"

