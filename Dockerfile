FROM sean962081468/opencv-python-cuda

COPY ./facenet/requirements.txt /facenet/
RUN pip3 install -r facenet/requirements.txt
