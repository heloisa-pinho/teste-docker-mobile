# 💚 GUIA DE INSTALAÇÃO DO PROJETO BASE MOBILE COM DOCKER (em construção) 💚

<br/>

## 1. 📱 Instalação do Docker

> :warning: Testado apenas no Linux Mint até o momento.

### 1.1 Atualize o índice de pacotes:
    
```
sudo apt update
```
    
### 1.2 Instale os pacotes necessários para permitir que o `apt` utilize um repositório sobre HTTPS:

```
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```
    
### 1.3 adicione a chave GPG para o repositório oficial do Docker:

```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
    
### 1.4 Adicione o repositório do Docker às fontes do APT:

```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
```

### 1.5 Atualize o índice de pacotes novamente:

```
sudo apt update
```
    
### 1.6 Instale o Docker

```
sudo apt install docker-ce
```
    
### 1.7 Para verificar se o Docker foi instalado corretamente, execute:

```
sudo docker --version
```
    
<br/>

## 2. 📱 Gerenciando o Docker como um usuário não-root

> :warning: Esta ainda não é a melhor solução para o problema de permissões do Docker.

### 2.1 Crie o grupo Docker (caso ele ainda não exista)

```
sudo groupadd docker
```

### 2.2 Adicione seu usuário ao grupo Docker

```
sudo usermod -aG docker $USER
```

### 2.3 Ative as mudanças feitas no grupo

```
newgrp docker
```

### 2.4 Reinicie seu computador

Uma forma simples de fazer isso é executando o comando `reboot` no terminal. Certifique-se de que você não está com nada pendente, como um documento sem salvar.

<br/>

## 3. 📱 Preparando o contêiner
    
### 3.1 Clone o repositório com o dockerfile e os scripts

```
git clone https://github.com/heloisa-pinho/teste-docker-mobile.git
```

Caso você já utilize SSH, é possível clonar com o comando a seguir:

```
git clone git@github.com:heloisa-pinho/teste-docker-mobile.git
```
    
### 3.2 Entre na pasta

```
cd teste-docker-mobile
```
    
### 3.3 Crie a imagem do Docker com as dependências do projeto

```
sudo docker build -t teste-docker-mobile .
```
    
### 3.4 Crie o contêiner com a imagem criada

```
sudo docker run -it -p 8000:8000 -p 9000:9000 teste-docker-mobile
```
    
<br/>
    
## 4. 📱 Preparando o ambiente de desenvolvimento

> ℹ️ As próximas etapas foram testados com o projeto da Capacita de Mobile 2024-2 .

### 4.1 Clone o projeto 

```
git clone https://github.com/ecomp-co/capacita-MOBILE-24-2.git
```

Caso você esteja obtendo o clone com HTTPS, será necessário informar o seu nome de usuário do Github e também seu **Personal Access Token**.

Este token pode ser obtido realizando o seguinte caminho no Github: **Settings > Developer Settings > Personal Access Tokens > Tokens (classic) > Generate new token**. No campo **"Expiration"**, marque **"No expiration"** e ao definir o escopo, selecione todas as checkboxes.

### 4.2 Entre na pasta e mude para a branch `develop`

```
cd capacita-MOBILE-24-2;
git checkout develop;
```

### 4.3 Saia da pasta e rode o script para rodar o projeto

```
cd ..;
./start_services.sh;
```
## 5. 📱 Acessando o projeto

### 5.1 Android

Instale o Expo na play store e leie o QR-code no terminal para rodar o projeto no seu celular, pronto para você usar ✨

### 5.2 IOS

Leie o QR-code no terminal para rodar o projeto no seu celular,pronto para você usar ✨

<br/>

## 6. 📱 Como usar os contêiners 

### 6.1 Voltando a um contêiner ativo

Se você não parou a execução do seu contêiner, apenas saiu dele ou desligou o PC, para voltar a ele (que ainda está ativo), basta rodar seguir estes passos:

* Descubra o ID do seu contêiner
    ```
    sudo docker ps -a
    ```
    
* Entre no contêiner para poder rodar o script novamente

    ```
    sudo docker exec -it <ID_do_Contêiner> /bin/bash
    ```

### 6.2 Entrando em um contêiner parado

Se você parou seu contêiner para ele não ocupar mais as portas 8000 e 3000 com o comando `docker stop <ID_do_Contêiner>` e deseja entrar nele novamente, basta rodar estes comandos:

* Descubra o ID do seu contêiner 
    ```
    sudo docker ps -a
    ```

* Inicie o contêiner que foi parado anteriormente

    ```
    docker start <ID_do_Contêiner>
    ```

* Entre no contêiner para poder rodar o script novamente

    ```
    sudo docker exec -it <ID_do_Contêiner> /bin/bash
    ```

<br/>

## 7. 📱 Comandos úteis para mexer no Docker

### 7.1 Docker build 

Este comando é usado para construir uma **imagem Docker** a partir de um **Dockerfile**.
    
```
docker build -t nome-da-imagem .
```
    
### 7.2 Docker run

Este comando é usado para executar um contêiner Docker a partir de uma imagem.

```
docker run -it nome-da-imagem
```

### 7.3 Docker ps

Este comando é usado para listar os contêineres Docker em execução.

```
docker ps
```

### 7.4 Docker ps -a

Este comando é usado para listar todos os contêineres Docker, incluindo os que estão parados.
    
```
docker ps -a
```
     
### 7.5 Docker stop

Este comando é usado para parar um contêiner Docker em execução (o id pode ser visto com o docker `px` e `ps -a`).

```
docker stop <id_do_container>
```
    
### 7.6 Docker start

Este comando é usado para iniciar um contêiner Docker parado.
     
```
docker start <id_do_container>
```
     
### 7.7 Docker rm

Este comando é usado para remover um contêiner Docker.

```
docker rm <id_do_container>
```
    
### 7.8 Docker rmi

Este comando é usado para remover uma imagem Docker.
     
```
docker rmi <nome_da_imagem>
```
     
<br/>
  
## 8. 📱 Integração com o VSCode

Caso você ainda não tenha o Visual Studio Code em sua máquina, é possível obtê-lo a partir da sua [página de download](https://code.visualstudio.com/download). Se já o tiver, basta acompanhar o restante dos passos!

### 8.1 Instale a extensão "Dev Containers"

* Vá para a aba de extensões (ou pressione `Ctrl+Shift+X`);
* Procure por [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) e instale a extensão;
* Feche e abra novamente o seu VSCode. 

### 8.2 Abra o projeto dentro do contêiner

* No menu lateral do VSCode, clique em **"Remote Explorer"**;
* Em **"Dev Containers"**, você encontrará o nosso contêiner;
* Passe o mouse sobre o contêiner e clique no botão **"Attach in New Window"**:
    ![Abrindo o contêiner do projeto em uma nova janela](https://i.imgur.com/uxRrOsT.png)
* Talvez nenhum projeto estará aberto, então clique no ícone de **"Explorer"** e no botão **"New Folder"**;
* Na barra de pesquisa, digite o caminho da pasta do projeto. Exemplo:
    ```
    /var/www/html/nostrosole
    ```
* Clique em **"Ok"** para abri-lo.

<br/>

## 9. 📱 Referências

- [Como Instalar e Utilizar o Docker no Ubuntu 20.04](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04-pt) (artigo)
- [Gerenciar seus tokens de acesso pessoal](https://docs.github.com/pt/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens) (guia do Github)
- [Como trabalhar com Docker no VSCode](https://youtu.be/y3s47QItVQc?si=JzvQAvfN-qiuRfIV) (vídeo)
    
###### by Heloisa, Marquesini e Andrieli 💚 #quaqua
