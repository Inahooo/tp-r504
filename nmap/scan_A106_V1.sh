#!/bin/bash

# Définir la plage d'adresses IP à scanner (par exemple, 192.168.1.0/24)
subnet="172.16.0.0/24"

# Fichier CSV de sortie
output_file="scan-result_1.csv"

# Initialiser le fichier CSV avec les en-têtes
echo "IP, TCP_port_open" > "$output_file"

# Étape 1: Effectuer un scan Nmap pour trouver les machines actives
echo "Début du scan des machines actives..."
active_ips=$(nmap -sn "$subnet" | grep "Nmap scan report" | awk '{print $5}')

# Étape 2: Pour chaque machine active, effectuer un deuxième scan pour trouver les ports ouverts
for ip in $active_ips; do
    echo "Scan des ports ouverts sur $ip..."
    
    # Effectuer un scan Nmap pour obtenir les ports ouverts
    open_ports=$(nmap -F "$ip" | grep "open" | wc -l)
    
    # Si des ports sont ouverts, ajouter l'IP et le nombre de ports ouverts au fichier CSV
    if [ "$open_ports" -gt 0 ]; then
        echo "$ip, $open_ports" >> "$output_file"
    else
        echo "$ip, 0" >> "$output_file"
    fi
done

echo "Scan terminé. Résultats enregistrés dans $output_file"

