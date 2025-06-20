FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl unzip make inotify-tools python3 nodejs npm ipe inkscape graphviz texlive-full && \
    apt-get clean

RUN curl -L --output /tmp/pandoc.deb https://github.com/jgm/pandoc/releases/download/3.5/pandoc-3.5-1-amd64.deb && \
    apt-get install /tmp/pandoc.deb && \
    rm /tmp/pandoc.deb

RUN mkdir -p /usr/share/fonts/custom/JuliaMono && cd /usr/share/fonts/custom/JuliaMono && \
    curl -L --output JuliaMono.tar.gz https://github.com/cormullion/juliamono/releases/download/v0.058/JuliaMono-ttf.tar.gz && \
    tar xfz JuliaMono.tar.gz && \
    rm JuliaMono.tar.gz && \
    mkdir -p /usr/share/fonts/custom/NotoSerifCJK && cd /usr/share/fonts/custom/NotoSerifCJK && \
    curl -L --output NotoSerifCJK.zip https://github.com/notofonts/noto-cjk/releases/download/Serif2.003/03_NotoSerifCJK-TTF-VF.zip && \
    unzip NotoSerifCJK.zip && \
    rm NotoSerifCJK.zip && \
    mkdir -p /usr/share/fonts/custom/NotoSansCJK && cd /usr/share/fonts/custom/NotoSansCJK && \
    curl -L --output NotoSansCJK.zip https://github.com/notofonts/noto-cjk/releases/download/Sans2.004/02_NotoSansCJK-TTF-VF.zip && \
    unzip NotoSansCJK.zip && \
    rm NotoSansCJK.zip && \
    fc-cache -fv
    
WORKDIR /root/content
