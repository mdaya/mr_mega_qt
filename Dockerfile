FROM bioconductor/bioconductor_docker:RELEASE_3_10

#Install SeqArray
RUN R -e "BiocManager::install('SeqArray', update=T, ask=F)"

#Install MR-MEGA
RUN mkdir MR-MEGA_v0.1.5 && \
    cd MR-MEGA_v0.1.5 && \
    wget http://www.geenivaramu.ee/tools/MR-MEGA_v0.1.5.zip && \
    unzip MR-MEGA_v0.1.5.zip  && \
    make  && \
    mkdir /home/analyst  && \
    mv MR-MEGA /home/analyst && \
    cd .. && \
    rm -r MR-MEGA_v0.1.5

#Install METAL
RUN mkdir METAL && \
    cd METAL && \
    wget http://csg.sph.umich.edu/abecasis/Metal/download/Linux-metal.tar.gz && \
    gzip -d Linux-metal.tar.gz && \
    tar -xvf Linux-metal.tar && \
    mv generic-metal/metal /home/analyst && \
    cd .. && \
    rm -r METAL
    

# Install scripts
COPY *.sh /home/analyst/
COPY *.R /home/analyst/
RUN chmod a+x /home/analyst/

