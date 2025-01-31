FROM nodered/node-red

# Define build-time arguments
ARG GIT_USER
ARG GIT_PSW
ARG GIT_BRANCH
RUN rm -rf /data/* /data/.[!.]* /data/..?*
#run echo "git clone https://${GIT_USER}:${GIT_PSW}@github.com/pavlo-shcherbukha/node-red-rabbit.git /data -b ${GIT_BRANCH}"
RUN git clone https://${GIT_USER}:${GIT_PSW}@github.com/pavlo-shcherbukha/node-red-rabbit.git /data -b ${GIT_BRANCH}
RUN  git config --global user.email "pasha.kx@gmail.com"
RUN  git config --global user.name "${GIT_USER}"
RUN cd /data && npm install
#ENV FLOWS=myservice.json

