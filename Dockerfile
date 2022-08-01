FROM python

RUN apt-get update
RUN apt-get install texlive-lang-japanese texlive-xetex pandoc -y

RUN pip install jupyter
COPY index.tex.j2 /usr/local/share/jupyter/nbconvert/templates/latex/

RUN groupadd -g 1000 basicuser && \
   useradd -r -m -u 1000 -g basicuser basicuser
USER basicuser
WORKDIR /home/basicuser

CMD ["bash"]
