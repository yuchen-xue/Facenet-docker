FROM sean962081468/opencv-python-cuda
VOLUME /root/datasets 
ENV PYTHONPATH /root/facenet/src

COPY ./ /root/
WORKDIR /root/facenet
RUN pip3 install -r requirements.txt
CMD ["bash"]