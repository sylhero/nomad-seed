for filename in nomad/jobs/**/*.nomad; do
    docker run -v ${PWD}:/scripts --rm sylhero/alpine_nomad:latest validate "$filename">>result.txt
done
cat result.txt && if grep -qF "error" result.txt;then echo "error"; exit 1; fi
