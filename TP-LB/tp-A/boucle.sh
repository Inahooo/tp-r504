
count_hello1=0
count_hello2=0

for ((i=1; i<=500; i++)); do
    response=$(curl -s localhost:83)
    if [[ "$response" == "<h1>Hello 1</h1>" ]]; then
        ((count_hello1++))
    elif [[ "$response" == "<h1>Hello 2</h1>" ]]; then
        ((count_hello2++))
    fi
done

# Affichage des résultats
echo "Total 'Hello 1': $count_hello1"
echo "Total 'Hello 2': $count_hello2"


