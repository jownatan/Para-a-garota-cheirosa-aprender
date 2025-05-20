# firebase_auth_app

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)

Aplicativo de autenticação com Firebase e Flutter. Siga os passos abaixo para configurar e executar o projeto.

## 📋 Passo a Passo

### 1. Baixar Flutter
```bash
# Acesse flutter.dev e baixe a versão mais recente do Flutter SDK
# Extraia o arquivo baixado para um local de sua preferência (ex: C:\src\flutter no Windows)

2. Colocar nas variáveis de ambiente
# Adicione o caminho da pasta flutter\bin à variável PATH do seu sistema
# Verifique a instalação executando:
flutter doctor

3. Instalar gtools
# No Windows, instale o gcloud CLI
# https://cloud.google.com/sdk/docs/install
# E depois de instalar o Node.js (https://nodejs.org/en/download), use o comando:
npm install -g gtools

4. Abrir Firebase console, criar um projeto
# Acesse console.firebase.google.com
# Clique em "Adicionar projeto" e siga as instruções
# Dê um nome ao seu projeto e configure as opções conforme necessário

5. Clicar no símbolo do Flutter
# Na página inicial do projeto Firebase, clique no ícone de Flutter para adicionar um app Flutter
# Registre o app com um nome de pacote (ex: com.example.firebase_auth_app)

6. Usar dart pub global activate flutterfire_cli
dart pub global activate flutterfire_cli
# Isso instalará a ferramenta FlutterFire CLI globalmente

7. Usar flutterfire configure --project=(iddoprojeto)
flutterfire configure --project=seu-projeto-id
# Selecione as plataformas que deseja configurar (escolha Web)
# Isso gerará os arquivos de configuração necessários

8. Depois firebase init --project (iddoprojeto)
firebase init --project=seu-projeto-id
# Selecione os serviços que deseja usar (Authentication e Hosting)
# Configure as opções conforme solicitado

9. Dentro de lib criar pasta screens e services
mkdir -p lib/screens lib/services
# Isso cria a estrutura de pastas necessária para o projeto

10. Dentro de services criar auth_service.dart
# Crie o arquivo lib/services/auth_service.dart
# Adicione o código do serviço de autenticação (disponível no repositório)

11. Dentro de Screens criar arquivos home_screen.dart, login_screen.dart, register_screen.dart
# Crie os arquivos:
# lib/screens/home_screen.dart
# lib/screens/login_screen.dart
# lib/screens/register_screen.dart
# Adicione o código para cada tela (disponível no repositório)

12. Veja os arquivos no exemplo do GitHub
# Tudo dentro de lib é diferente dos seus arquivos, copie e cole no seu projeto

13. Rode o código usando
flutter build web --wasm --dart-define=FLUTTER_WEB_USE_SKIA=true
# Execute o comando acima para criar uma versão de produção
# Os arquivos serão gerados na pasta build/web
# Faça upload desses arquivos para o Firebase Hosting ou outro serviço de hospedagem

15. Veja seu projetinho
Agora seu aplicativo deve estar funcionando! Acesse-o através do navegador ou veja o resultado do deployment.

📂 Estrutura do Projeto
lib/
├── main.dart               # Arquivo principal que inicializa o app
├── screens/
│   ├── login_screen.dart   # Tela de login
│   ├── register_screen.dart # Tela de cadastro
│   └── home_screen.dart    # Tela principal após login
└── services/
    └── auth_service.dart   # Serviço de autenticação

