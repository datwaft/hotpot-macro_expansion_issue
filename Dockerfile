FROM debian:buster-slim

# Install dependencies
RUN apt-get update && apt-get install -y curl git

# Install Neovim
WORKDIR /tmp
RUN curl -LO https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.tar.gz
RUN tar xzf nvim-linux64.tar.gz -C /opt
ENV PATH /opt/nvim-linux64/bin:$PATH

# Install Hotpot
WORKDIR /root/.local/share/nvim/site/pack/packer/start
RUN git clone https://github.com/rktjmp/hotpot.nvim

# Deploy the configuration
COPY config /root/.config/nvim

# Finish
WORKDIR /root
