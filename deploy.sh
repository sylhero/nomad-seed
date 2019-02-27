for filename in jobs/*.nomad; do
    nomad job run "$filename"
done
