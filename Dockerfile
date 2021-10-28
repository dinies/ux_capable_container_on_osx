ARG base_img
FROM $base_img

ARG username
ARG base_img

ENV USERNAME $username

ENV DISPLAY :0
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && \
  apt-get install -y \
  sudo \
  git \
  vim \
  x11-apps

RUN if [ "$base_img" = "ubuntu:focal" ]; then \
      apt install -y \
      libglu1-mesa-dev \
      freeglut3-dev \
      mesa-common-dev \
      mesa-utils ;\
    fi

# sudoers 
RUN useradd -ms /bin/bash ${USERNAME} && \
  echo "$USERNAME:$USERNAME" | chpasswd && \
  usermod -aG sudo $USERNAME && \
  echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/$USERNAME && \
  chmod 440 /etc/sudoers.d/$USERNAME

WORKDIR /home/$USERNAME
ENTRYPOINT ["/bin/bash"]
