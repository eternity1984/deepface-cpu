ARG BASE_CONTAINER_TAG=2.5.0
FROM tensorflow/tensorflow:${BASE_CONTAINER_TAG}

ARG DEEPFACE_PKG_VER=0.0.62
ARG USERNAME=deepface
ARG GROUPNAME=deepface
ARG UID=1000
ARG GID=1000

RUN groupadd -g ${GID} ${GROUPNAME} \
    && useradd -m -s /bin/bash -u ${UID} -g ${GID} ${USERNAME}

ENV HOME /home/${USERNAME}
ENV FETCH_WEIGHTS /mnt/weights
WORKDIR ${HOME}

RUN apt-get update \
    && apt-get install -yq libgl1-mesa-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install -q \
            "numpy>=1.14.0" \
            "pandas>=0.23.4" \
            "tqdm>=4.30.0" \
            "gdown>=3.10.1" \
            "Pillow>=5.2.0" \
            "opencv-python>=4.1.0" \
            "Flask>=1.1.2" \
            "flask-cors>=3.0.0" \
    && pip install -q --no-deps \
            "retina-face>=0.0.1" \
            "mtcnn>=0.1.0" \
            "deepface==${DEEPFACE_PKG_VER}"


USER ${USERNAME}

COPY deepface/api/api.py ${HOME}/api.py
COPY startup.sh ${HOME}/startup.sh
CMD ["/bin/bash", "startup.sh"]
