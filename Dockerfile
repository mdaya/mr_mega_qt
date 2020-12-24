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

# Install scripts
COPY *.sh /home/analyst/
COPY *.R /home/analyst/
RUN chmod a+x /home/analyst/

