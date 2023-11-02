set -e

main_image="my-$1-image"
# app_image="my-app-image"



docker build -t ${main_image} --build-arg target_image="Main" .
# docker build -t ${app_image} --build-arg target_image="App" .
docker run -d --name main-$1-container "$main_image"
# docker run -d --name app-container "$app_image"


# read -n 1 -s -r -p "Press any key to exit..."
