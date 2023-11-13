set -e
echo "here in Java/docker_tag_push_image"
echo "Current directory: $(pwd)"
echo "${ls -l}"
docker build -t javatestimage .


# read -n 1 -s -r -p "Press any key to exit..."
