# DeepFace for CPU-only
[DeepFace](https://github.com/serengil/deepface) for CPU-only.   
This image was inspired by [sanjeetpal/deepface](https://hub.docker.com/r/sanjeetpal/deepface) image.


## Troubleshoot

If you get the following error:

```
172.17.0.1 - - [30/Jun/2021 07:37:18] "POST /represent HTTP/1.1" 400 -
facenet_weights.h5 will be downloaded...
Access denied with the following error:

        Too many users have viewed or downloaded this file recently. Please
        try accessing the file again later. If the file you are trying to
        access is particularly large or is shared with many people, it may
        take up to 24 hours to be able to view or download the file. If you
        still can't access a file after 24 hours, contact your domain
        administrator. 

You may still be able to access the file from the browser:

         https://drive.google.com/uc?id=xxxxxxxxxxxxxxxxxxx
```

You can specify that the model should be loaded from an external volume (e.g. `$PWD/weights`) by appending:

```
$ docker run -itp 5000:5000 -v $PWD/weights:/home/deepface/.deepface/weights eternity1984/deepface-cpu
```

Next, Download the model file and save it directly to a mounted volume.