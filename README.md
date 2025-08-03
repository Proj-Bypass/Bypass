# 🚀 Bypass - Sistema de Controle de Acesso Inteligente

## 📖 Sobre o Projeto

O **Bypass** é um sistema inovador de controle de acesso via RFID, projetado especificamente para instituições educacionais. Desenvolvido pensando na realidade do Instituto Federal do Paraná, o projeto automatiza e monitora a entrada e saída de alunos de forma segura e inteligente.

## 🎯 Funcionalidades Principais

- ✅ **Controle de Acesso RFID**: Leitura automática de cartões estudantis
- ✅ **Validação em Tempo Real**: Verificação instantânea de permissões
- ✅ **Sistema Web de Administração**: Interface para gestão de usuários e horários
- ✅ **Logs Completos**: Registro de todos os acessos e tentativas
- ✅ **Notificações**: Alertas para responsáveis em tempo real
- ✅ **Design Responsivo**: Funciona perfeitamente em qualquer dispositivo

## 🛠️ Tecnologias Utilizadas

### Hardware
- **ESP32**: Microcontrolador WiFi para comunicação IoT
- **MFRC522**: Leitor RFID para cartões estudantis
- **Servo Motor**: Mecanismo de abertura/fechamento
- **LEDs**: Indicadores visuais de status
- **Relé**: Controle de fechaduras eletrônicas

### Software
- **Backend**: PHP com Apache Server
- **Frontend**: HTML5, CSS3, JavaScript, Bootstrap
- **Banco de Dados**: MySQL para armazenamento seguro
- **Arduino IDE**: Programação do ESP32

## 🎨 Design e UX

- **Design Moderno**: Interface inspirada no Marble Studio
- **Responsivo**: Adaptável a todos os tamanhos de tela
- **Acessível**: Estrutura semântica e navegação intuitiva
- **Performance**: Otimizado para carregamento rápido

## 🚀 Como Funciona

1. **Leitura RFID**: O aluno aproxima o cartão do leitor
2. **Validação**: Sistema consulta horários e permissões no banco de dados
3. **Decisão**: Liberação ou negação baseada nas regras cadastradas
4. **Registro**: Log completo da transação é armazenado
5. **Notificação**: Responsáveis recebem alertas quando necessário

## 📋 Estrutura do Projeto

```
Bypass/
├── arduino/
│   └── arduino.ino          # Código do ESP32
├── app/
│   ├── controller/          # Lógica de negócio
│   ├── model/              # Modelos de dados
│   └── view/               # Templates PHP
├── assets/
│   ├── css/
│   │   └── main.css        # Estilos responsivos
│   ├── img/                # Imagens e ícones
│   └── js/                 # Scripts JavaScript
├── data/                   # Arquivos de dados
├── index.html              # Página inicial (GitHub Pages)
└── index.php               # API PHP para ESP32
```

## 🔧 Configuração Local

### Pré-requisitos
- XAMPP ou similar (Apache + PHP + MySQL)
- Arduino IDE com biblioteca ESP32
- Componentes hardware listados acima

### Instalação
1. Clone o repositório
2. Coloque os arquivos no diretório `htdocs` do XAMPP
3. Configure o banco de dados MySQL
4. Faça upload do código `arduino.ino` para o ESP32
5. Acesse `localhost/Bypass` no navegador

## 👨‍💻 Desenvolvimento

Este projeto foi desenvolvido como uma solução real para problemas de controle de acesso em instituições educacionais, combinando hardware IoT com desenvolvimento web moderno.

### Comandos de Teste do ESP32
- `a` - Simular acesso autorizado
- `f` - Fechar sistema
- `v` - Testar LED verde
- `r` - Testar LED vermelho
- `o` - Desligar tudo
- `n` - Simular acesso negado
- `t` - Teste completo de componentes

## 📞 Contato

Email: felipe.buche.tds2023@gmail.com

---
