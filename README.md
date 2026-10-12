<p align="center">
  <img src="assets/icons/app_icon.png" alt="Ícone do aplicativo Consulta de CEP" width="140">
</p>

# Flutter CEP

Aplicativo mobile desenvolvido em Flutter para consultar endereços brasileiros a partir de um CEP. A aplicação consome a API pública [ViaCEP](https://viacep.com.br/) e apresenta os dados do endereço de forma simples e organizada.

<!-- ## Demonstração -->


## Funcionalidades

- Consulta de CEP com ou sem máscara (`00000-000`).
- Validação do CEP antes da consulta.
- Busca de dados em tempo real pela API ViaCEP.
- Exibição das informações encontradas:
  - CEP;
  - logradouro;
  - bairro;
  - cidade;
  - estado;
  - complemento, quando disponível.
- Feedback visual durante o carregamento.
- Mensagens de erro para CEP inválido, inexistente ou falha na comunicação com a API.
- Interface responsiva com tema visual próprio.

## Tecnologias utilizadas

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- [`http`](https://pub.dev/packages/http) — requisições à API.
- [`mask_text_input_formatter`](https://pub.dev/packages/mask_text_input_formatter) — máscara e formatação do CEP.
- [`solar_icons`](https://pub.dev/packages/solar_icons) — ícones da interface.
- [ViaCEP](https://viacep.com.br/) — fonte dos dados de endereço.

## Pré-requisitos

Antes de executar o projeto, instale:

- Flutter SDK compatível com Dart `^3.13.4`;
- Android Studio ou outra ferramenta com um dispositivo Android/emulador configurado;
- Git.

Para verificar a instalação do Flutter:

```bash
flutter doctor
```

## Como executar

Clone o repositório e entre na pasta do projeto:

```bash
git clone https://github.com/PabloXT14/flutter-cep.git
cd flutter-cep
```

Instale as dependências:

```bash
flutter pub get
```

Execute em um dispositivo conectado ou emulador:

```bash
flutter run
```

## Gerando o APK

Para gerar uma versão de release:

```bash
flutter clean
flutter pub get
flutter build apk --release
```

O APK será gerado em:

```text
build/app/outputs/flutter-apk/app-release.apk
```

Para gerar APKs separados por arquitetura, reduzindo o tamanho de cada arquivo:

```bash
flutter build apk --split-per-abi
```

> O aplicativo precisa de acesso à internet para consultar a API ViaCEP. A permissão `android.permission.INTERNET` já está configurada no Android.

## Estrutura do projeto

```text
lib/
├── core/
│   └── theme/                 # Cores, tipografia e temas da aplicação
├── data/
│   └── repositories/          # Integração com a API ViaCEP
├── domain/
│   └── models/                # Modelo de dados do endereço
├── ui/
│   └── home/
│       ├── widgets/           # Componentes visuais da tela principal
│       └── home_screen.dart   # Tela de consulta de CEP
└── main.dart                  # Ponto de entrada da aplicação
```

O projeto separa a integração com a API, o modelo de dados e a interface, facilitando a manutenção e a evolução do aplicativo.

## API utilizada

A consulta é realizada pelo endpoint:

```text
https://viacep.com.br/ws/{CEP}/json/
```

Exemplo:

```text
https://viacep.com.br/ws/01001000/json/
```

Consulte a [documentação da ViaCEP](https://viacep.com.br/) para conhecer o formato completo da resposta e as regras de uso do serviço.

## Validação do projeto

Para analisar o código e verificar possíveis problemas:

```bash
flutter analyze
```

## Contribuindo

Contribuições são bem-vindas:

1. Faça um fork do projeto.
2. Crie uma branch para sua alteração:

   ```bash
   git checkout -b minha-melhoria
   ```

3. Faça as alterações e valide o projeto com `flutter analyze`.
4. Envie um pull request descrevendo o que foi alterado.

## Licença

Este projeto está licenciado sob a licenca [MIT](https://opensource.org/licenses/MIT).
