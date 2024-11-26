FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    git \
    curl \
    xz-utils \
    sudo \
    && apt-get clean

ENV USER=testuser
ENV HOME=/home/$USER

# Create a non-root user for testing
RUN useradd -m -s /bin/bash $USER && echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Switch to the non-root user
USER $USER
WORKDIR $HOME

# Install nix
RUN curl -L https://nixos.org/nix/install | sh -s -- --no-daemon

RUN . ~/.nix-profile/etc/profile.d/nix.sh && \
    nix-channel --update


# For faster development, copy dotfiles directory
COPY . $HOME/dotfiles

WORKDIR $HOME/dotfiles

# Run dotfiles installation script
RUN bash ./install.sh

WORKDIR $HOME

CMD ["/bin/bash"]

