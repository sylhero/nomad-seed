for filename in nomad/jobs/"$1"/*.nomad; do
    sed -i 's/RELEASE_VERSION/'"$2"'/g' "$filename"
    sed -i 's/DOCKER_USERNAME/'"$3"'/g' "$filename"
    sed -i 's/DOCKER_PASSWORD/'"$4"'/g' "$filename"
done
