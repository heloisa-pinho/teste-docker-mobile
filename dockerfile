FROM ubuntu:20.04

# Atualizar a lista de pacotes e instalar dependências
RUN apt-get update && \
    apt-get install -y \
        curl \  # Ferramenta de transferência de dados \
        git \   # Sistema de controle de versão distribuído \
        nano \  # Editor de texto simples para linha de comando \
        vim    # Editor de texto avançado

# Instalar o Node Version Manager (NVM) e o Node.js
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash && \
    export NVM_DIR="$HOME/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" && \
    nvm install 18 && \
    nvm use 18 && \
    npm install --global expo-cli


# Copiar o script de inicialização
COPY start_services.sh /var/www/html/start_services.sh
RUN chmod +x /var/www/html/start_services.sh

# Definir o diretório de trabalho padrão
WORKDIR /var/www/html