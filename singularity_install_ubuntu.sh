#Gylee singularity env 230321
sudo apt-get update -y && \
     sudo apt-get install build-essential -y && \
     sudo apt-get install -y \
     openssl-devel \
     uuid-dev \
     libseccomp-devel \
     wget \
     squashfs-tools \
     cryptsetup

rm -rf /usr/local/go #anti-collision

export VERSION=1.16.4 OS=linux ARCH=amd64 && \  # Replace the values as needed
  wget https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz && \ # Downloads the required Go package
  sudo tar -C /usr/local -xzvf go$VERSION.$OS-$ARCH.tar.gz && \ # Extracts the archive
  yes | rm go$VERSION.$OS-$ARCH.tar.gz    # Deletes the ``tar`` file

echo 'export PATH=/usr/local/go/bin:$PATH' >> ~/.bashrc
source ~/.bashrc

export VERSION=3.8.1 && # adjust this as necessary \
    wget https://github.com/sylabs/singularity/releases/download/v${VERSION}/singularity-ce-${VERSION}.tar.gz && \
    tar -xzf singularity-ce-${VERSION}.tar.gz && \
    yes | rm singularity-ce-${VERSION}.tar.gz && \
    cd singularity-ce-${VERSION}

./mconfig && \
    make -C builddir && \
    sudo make -C builddir install

#version check
singularity --version
