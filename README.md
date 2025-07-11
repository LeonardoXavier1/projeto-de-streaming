# 🎬 Plataforma de Vídeos TESTE - Flutter App

Este projeto é uma **plataforma de vídeos** desenvolvida com Flutter, com o objetivo de oferecer uma experiência fluida e moderna de navegação e visualização de conteúdos audiovisuais.

> 🔗 [Acesse o protótipo no Figma](https://www.figma.com/proto/FGeRIvXu0Oh78OEzGTEeWL/Untitled?node-id=0-1&p=f&t=poOCuvq6qEiLbwcw-0&scaling=scale-down&content-scaling=fixed&page-id=0%3A1)

---

## 📱 Funcionalidades

- ✅ Tela de Login com validação de campos
- ✅ Exibição de vídeos em formato de **Grade 4xN**
- ✅ Diálogo com player de vídeo integrado (YouTube)
- ✅ Estilo visual fiel ao Figma
- ✅ Carregamento dinâmico de vídeos via **API REST mock**
- ✅ Utilização de Flutter Modular para gerenciamento de rotas e dependências

---

## 💻 Tecnologias Utilizadas

| Ferramenta              | Finalidade                                         |
|-------------------------|----------------------------------------------------|
| 🐦 Flutter               | Framework principal                                |
| 🎯 Dart                  | Linguagem de programação                           |
| 🧱 flutter_modular       | Gerenciamento de rotas e injeção de dependências   |
| 🎥 youtube_player_iframe | Exibição de vídeos YouTube no app                 |
| 🌐 API mock (Mocki)      | Fonte de dados simulada                           |
| 🎨 Google Fonts          | Tipografia moderna                                |

---

## 🖼️ Layout (Figma)

O design do projeto foi baseado no seguinte protótipo:

🔗 [Visualizar no Figma](https://www.figma.com/proto/FGeRIvXu0Oh78OEzGTEeWL/Untitled?node-id=0-1&p=f&t=poOCuvq6qEiLbwcw-0&scaling=scale-down&content-scaling=fixed&page-id=0%3A1)

---

## 🌐 API de Vídeos (Mocki)

Os vídeos são carregados de uma API simulada:

```bash
https://mocki.io/v1/c7324389-d62d-4f64-8c26-91b01a6b5b30
```
## 📂 Estrutura de Pastas
```
/lib
 ┗ app/
   ┣ core/
   ┃ ┣ controllers/
   ┃ ┃ ┗ app_controller.dart       # Controller global do app
   ┃ ┗ constants.dart              # Cores e estilos globais
   ┣ modules/
   ┃ ┣ home/
   ┃ ┃ ┣ models/
   ┃ ┃ ┃ ┗ video_model.dart        # Modelo do vídeo
   ┃ ┃ ┣ repositories/
   ┃ ┃ ┃ ┗ video_repository.dart   # Lógica para buscar vídeos
   ┃ ┃ ┣ widgets/
   ┃ ┃ ┃ ┗ video_dialog.dart       # Widget de player em diálogo
   ┃ ┃ ┣ home_controller.dart      # Controller da Home
   ┃ ┃ ┣ home_module.dart          # Módulo da Home
   ┃ ┃ ┗ home_page.dart            # UI da Home
   ┃ ┗ login/
   ┃   ┣ login_controller.dart     # Controller da Login
   ┃   ┣ login_module.dart         # Módulo da Login
   ┃   ┗ login_page.dart           # UI da Login
   ┣ app_module.dart               # Injeção de dependências geral
   ┗ app_widget.dart               # Widget raiz do app
main.dart                          # Entrada do aplicativo

```

## 🚀 Como Rodar Localmente
🔧 Passos:
```
/lib
# 1. Clone o repositório
git clone https://github.com/seu-usuario/seu-repo.git
cd seu-repo

# 2. Instale as dependências
flutter pub get

# 3. Rode o projeto
flutter run

```
