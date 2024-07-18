# Use uma imagem base do Ubuntu 20.04
FROM ubuntu:20.04

# Atualiza os repositórios de pacotes e instala o curl, git, nano, vim, python3, g++ e build-essential.
RUN apt-get update && \
    apt-get install -y \
    curl \   # Ferramenta de transferência de dados
    git \    # Sistema de controle de versão distribuído
    nano \   # Editor de texto simples para linha de comando
    vim \    # Editor de texto avançado
    python3 \ # Interpretador da linguagem de programação Python
    g++ \    # Compilador C++
    build-essential \ # Pacote essencial de compilação, inclui gcc, g++ e make

# Baixa e instala o NVM (Node Version Manager)
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash && \

# Configuração do NVM
    export NVM_DIR="$HOME/.nvm" && \
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" && \

# Instalação do Node.js versão 18 usando o NVM
    nvm install 18 && \

# Usa a versão 18 do Node.js
    nvm use 18 && \

# Instalação do Expo CLI globalmente
    npm install --global expo-cli

# Definir o diretório de trabalho padrão
WORKDIR /var/www/html