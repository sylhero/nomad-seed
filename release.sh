for filename in nomad/jobs/dev/*.nomad; do
    IMAGE_NAME=$(echo "${filename##*/}" | cut -f 1 -d '.')
    if [ "$IMAGE_NAME" != "fabio" ]
    then
        LATEST_IMAGE=images.ormuco.com:5000/ormuco/"$IMAGE_NAME":latest
        RELEASE_IMAGE=images.ormuco.com:5000/ormuco/"$IMAGE_NAME":"$1"
        echo "$LATEST_IMAGE"
        echo "$RELEASE_IMAGE"
        docker pull "$LATEST_IMAGE"
        docker tag "$LATEST_IMAGE" "$RELEASE_IMAGE"
        docker push "$RELEASE_IMAGE"
    fi
done
