# Usar a imagem do Ubuntu 20.04 como imagem base
FROM ubuntu:20.04

# Atualizar a lista de pacotes
RUN apt-get update

# Instalar curl
RUN apt-get install -y curl

# Instalar git
RUN apt-get install -y git

# Instalar nano
RUN apt-get install -y nano

# Instalar vim
RUN apt-get install -y vim

# Instalar o Node Version Manager (NVM)
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash \
    && export NVM_DIR="$HOME/.nvm" \
    && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
    && [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" \
    && nvm install 18 \
    && nvm use 18 \
    && npm install --global expo-cli

# Copiar o script de inicialização
COPY start_services.sh /var/www/html/start_services.sh
RUN chmod +x /var/www/html/start_services.sh

# Definir o diretório de trabalho padrão
WORKDIR /var/www/html

