#!/bin/bash

python -c "from deepface import DeepFace"
if [ -d ${FETCH_WEIGHTS} ]; then
    find ${FETCH_WEIGHTS} -type f | xargs -I {} cp -nv {} ${HOME}/.deepface/weights/
fi

python api.py