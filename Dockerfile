FROM michaelwetter/ubuntu-1604_jmodelica_trunk

ENV ROOT_DIR /usr/local
ENV JMODELICA_HOME $ROOT_DIR/JModelica
ENV IPOPT_HOME $ROOT_DIR/Ipopt-3.12.4
ENV SUNDIALS_HOME $JMODELICA_HOME/ThirdParty/Sundials
ENV SEPARATE_PROCESS_JVM /usr/lib/jvm/java-8-openjdk-amd64/
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
ENV PYTHONPATH $PYTHONPATH:$JMODELICA_HOME/Python:$JMODELICA_HOME/Python/pymodelica
ENV PATH="/home/developer/.local/bin:${PATH}"

ENV HOME /home/developer
WORKDIR $HOME
USER developer

RUN pip install --user --no-cache-dir notebook==5.*
RUN pip install --user pandas
RUN pip install --user ipykernel==4.7.0

COPY JModelica_test.ipynb $HOME
COPY MPC_ecercise_Name_Surname.ipynb $HOME
COPY fig $HOME
