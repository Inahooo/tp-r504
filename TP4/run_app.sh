docker run -d \
   -p 5000:5000 \
   --name tp4-app \
   --mount type=bind,source="$(pwd)",target=/srv/ \
   --network net-tp4 \
   im-tp4:latest
