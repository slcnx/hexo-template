FROM node:latest


WORKDIR /data/git 

ADD id_rsa_2048 /root/.ssh/
RUN  chmod 600 /root/.ssh/id_rsa_2048 

ADD . ./

# 生成网页
RUN npm install && npm run build 

# 上传到GIT
RUN install -dv /data/page/ && cp -a public /data/page/

ARG GITHUB
ARG GUSER 
ARG EMAIL 
WORKDIR /data/page/public/
ENV GIT_SSH_COMMAND='ssh -i /root/.ssh/id_rsa_2048  -o IdentitiesOnly=yes -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
RUN git config --global init.defaultBranch main && git config --global user.email $EMAIL  && git config --global user.name $GUSER  && \
    git config --global pull.rebase true && \
    git init && \
    git remote add origin $GITHUB && git add -A && git commit -m init && git push --force origin main 
