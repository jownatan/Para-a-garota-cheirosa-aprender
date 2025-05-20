
# 🚀 firebase_auth_app

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)

Aplicativo de autenticação com Firebase e Flutter. Siga os passos abaixo para configurar e executar o projeto. ✨

---

## 📋 Passo a Passo

### 1. Baixar Flutter
- Acesse [flutter.dev](https://flutter.dev) e baixe a versão mais recente do Flutter SDK.
- Extraia para um local de sua preferência (ex: `C:\src\flutter` no Windows).

### 2. Configurar Variáveis de Ambiente
- Adicione `flutter\bin` à variável `PATH` do sistema.
- Verifique com:
```bash
flutter doctor
```

### 3. Instalar gtools (CLI do Firebase)
- No Windows, instale o [Google Cloud CLI](https://cloud.google.com/sdk/docs/install).
- Instale o Node.js: [nodejs.org](https://nodejs.org/en/download)
- Então:
```bash
npm install -g gtools
```

### 4. Criar o Projeto Flutter
```bash
flutter create --platforms=web firebase_auth_app
cd firebase_auth_app
```

### 5. Criar Projeto no Firebase
- Acesse [console.firebase.google.com](https://console.firebase.google.com)
- Clique em **Adicionar projeto** e siga os passos.

### 6. Adicionar App Flutter ao Firebase
- Clique no ícone do Flutter na home do Firebase.
- Registre com um nome de pacote, por exemplo: `com.example.firebase_auth_app`.

### 7. Instalar FlutterFire CLI
```bash
dart pub global activate flutterfire_cli
```

### 8. Configurar o Firebase no Projeto
```bash
flutterfire configure --project=seu-projeto-id
```

### 9. Inicializar Firebase no Terminal
```bash
firebase init --project=seu-projeto-id
```
- Selecione **Authentication** e **Hosting**.

### 10. Criar Estrutura de Pastas
```bash
mkdir -p lib/screens lib/services
```

### 11. Criar `auth_service.dart`
- Caminho: `lib/services/auth_service.dart`
- Adicione a lógica de autenticação.

### 12. Criar Telas
- `lib/screens/login_screen.dart`
- `lib/screens/register_screen.dart`
- `lib/screens/home_screen.dart`

### 13. Copiar os Arquivos do Exemplo
- Substitua os arquivos da pasta `lib/` pelos do exemplo neste repositório.

### 14. Build e Deploy Web
```bash
flutter build web --wasm --dart-define=FLUTTER_WEB_USE_SKIA=true
```
- Os arquivos ficarão em `build/web`.

### 15. Visualizar seu Projetinho 💜
- Acesse o app no navegador após o deploy.

---

## 📂 Estrutura do Projeto

```
lib/
├── main.dart             # Arquivo principal
├── screens/
│   ├── login_screen.dart     # Tela de login
│   ├── register_screen.dart  # Tela de cadastro
│   └── home_screen.dart      # Tela principal
└── services/
    └── auth_service.dart     # Serviço de autenticação
```

---
