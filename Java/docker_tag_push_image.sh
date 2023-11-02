set -e

main_image="my-$1-image"
# app_image="my-app-image"

container_name="main-container"

# Check if the container exists
if docker ps -a --format '{{.Names}}' | grep -q "^$container_name$"; then
    # Container exists, so remove it
    docker rm "$container_name"
    echo "Container $container_name removed."
else
    echo "Container $container_name does not exist."
fi



docker build -t ${main_image} --build-arg target_image="Main" .
# docker build -t ${app_image} --build-arg target_image="App" .
docker run -d --name main-container "$main_image"
# docker run -d --name app-container "$app_image"


# read -n 1 -s -r -p "Press any key to exit..."
