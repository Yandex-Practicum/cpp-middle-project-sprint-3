FROM archlinux@sha256:fcc0e315ba72175e77f5c351f1a79ff05fe5548431e842924b7b7cddb8240c08

# Add core-testing repo
RUN sed -i '/^#\[core-testing\]/s/^#//' /etc/pacman.conf && \
    sed -i '/^\[core-testing\]$/,/^$/ s/^#\(Include = \/etc\/pacman\.d\/mirrorlist\)/\1/' /etc/pacman.conf

RUN pacman -Syyu --noconfirm \
    && pacman -Syyu --noconfirm git less vim sudo python-pipx wget which pkgconf cmake make ninja \
    && pacman -Syyu --noconfirm core-testing/gcc

# Create a non-root user 'dev'
RUN useradd -ms /bin/bash dev \
    && echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/dev \
    && chmod 0440 /etc/sudoers.d/dev

USER dev

RUN pipx install conan
RUN pipx ensurepath && source ~/.bashrc

# Copy conan profile
COPY default /home/dev/.conan2/profiles/default
RUN sudo chown -R dev:dev /home/dev/.conan2

RUN git config --global core.editor vim

# Set the default working directory
WORKDIR /home/dev

# Set the default command
CMD ["/bin/bash"]
