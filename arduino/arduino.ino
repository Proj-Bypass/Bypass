// BIBLIOTECAS PARA O RFID
#include <SPI.h>
#include <MFRC522.h>
#include <Wire.h>

// BIBLIOTECAS PARA O WIFI
#include <WiFi.h>
#include <HTTPClient.h>

//BIBLIOTECAS PARA O SERVO MOTOR
#include <ESP32Servo.h>


// Configurações da rede Wi-Fi
const char* ssid = "Zhone_FB68";   // Substitua pelo SSID da sua rede
const char* password = "znid309436008";  // Substitua pela senha da sua rede

// URL do servidor PHP
const String serverUrl = "http://192.168.1.15/Bypass/index.php";

// Cria o objeto do servo
const int pinoServo = 5; // Voltando para o pino 5 original

Servo meuServo;  

//define alguns pinos do esp32 que serao conectados aos modulos e componentes
#define LedVerde 2
#define LedVermelho 15

#define SS_PIN 21
#define RST_PIN 22

MFRC522 mfrc522(SS_PIN, RST_PIN);  // define os pinos de controle do modulo de leitura de cartoes RFID

// Função simplificada para controle do servo
void moverServo(int angulo) {
  Serial.print("Movendo servo para: ");
  Serial.print(angulo);
  Serial.println(" graus");
  meuServo.write(angulo);
  delay(1000); // Aguarda o movimento
}

void setup() {
  SPI.begin();  // inicia a comunicacao SPI que sera usada para comunicacao com o mudulo RFID


  mfrc522.PCD_Init();  //inicia o modulo RFID

  Serial.begin(115200);  // inicia a comunicacao serial com o computador na velocidade de 115200 baud rate

  Serial.println("RFID + ESP32");
  Serial.println("Passe alguma tag RFID para verificar o id da mesma.");

  // define alguns pinos como saida
  pinMode(LedVerde, OUTPUT);
  pinMode(LedVermelho, OUTPUT);
  
  // Teste inicial dos LEDs
  Serial.println("Testando LEDs...");
  digitalWrite(LedVerde, HIGH);
  delay(1000);
  digitalWrite(LedVerde, LOW);
  digitalWrite(LedVermelho, HIGH);
  delay(1000);
  digitalWrite(LedVermelho, LOW);
  Serial.println("Teste dos LEDs concluído");

  // Conectando ao Wi-Fi
  Serial.print("Conectando-se ao Wi-Fi");
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.print(".");
  }
  Serial.println("\nConectado ao Wi-Fi");
  Serial.print("IP: ");
  Serial.println(WiFi.localIP());
  Serial.print("Gateway: ");
  Serial.println(WiFi.gatewayIP());

  // Anexa o servo ao pino especificado
  Serial.println("Configurando servo motor...");
  meuServo.attach(pinoServo);
  
  // Teste inicial do servo - mais simples
  Serial.println("Testando servo motor...");
  moverServo(0);
  delay(2000);
  moverServo(90);
  delay(2000);
  moverServo(0);
  Serial.println("Teste do servo concluído");

}

void loop() {

  // Teste manual simplificado
  if (Serial.available() > 0) {
    char comando = Serial.read();
    Serial.print("Comando recebido: ");
    Serial.println(comando);
    
    if (comando == 'a') {
      Serial.println("=== TESTE MANUAL: ABRIR ===");
      moverServo(90);
      digitalWrite(LedVerde, HIGH);
      digitalWrite(LedVermelho, LOW);
      Serial.println("Servo aberto + LED Verde ligado");
      
    } else if (comando == 'f') {
      Serial.println("=== TESTE MANUAL: FECHAR ===");
      moverServo(0);
      digitalWrite(LedVerde, LOW);
      digitalWrite(LedVermelho, LOW);
      Serial.println("Servo fechado + LEDs desligados");
      
    } else if (comando == 'v') {
      Serial.println("=== TESTE LED VERDE ===");
      digitalWrite(LedVerde, HIGH);
      digitalWrite(LedVermelho, LOW);
      
    } else if (comando == 'r') {
      Serial.println("=== TESTE LED VERMELHO ===");
      digitalWrite(LedVermelho, HIGH);
      digitalWrite(LedVerde, LOW);
      
    } else if (comando == 'o') {
      Serial.println("=== DESLIGAR TUDO ===");
      digitalWrite(LedVerde, LOW);
      digitalWrite(LedVermelho, LOW);
      moverServo(0);
      
    } else if (comando == 'n') {
      Serial.println("=== TESTE NEGADO (LED VERMELHO) ===");
      digitalWrite(LedVerde, LOW);
      digitalWrite(LedVermelho, HIGH);
      moverServo(0);
      
    } else if (comando == 't') {
      Serial.println("========================================");
      Serial.println("=== INICIANDO TESTE COMPLETO ===");
      Serial.println("========================================");
      
      // Teste 1: Desligar tudo primeiro
      Serial.println("1. Desligando tudo...");
      digitalWrite(LedVerde, LOW);
      digitalWrite(LedVermelho, LOW);
      moverServo(0);
      delay(1000);
      
      // Teste 2: LED Verde
      Serial.println("2. Testando LED Verde...");
      digitalWrite(LedVerde, HIGH);
      digitalWrite(LedVermelho, LOW);
      delay(2000);
      
      // Teste 3: LED Vermelho
      Serial.println("3. Testando LED Vermelho...");
      digitalWrite(LedVerde, LOW);
      digitalWrite(LedVermelho, HIGH);
      delay(2000);
      
      // Teste 4: Ambos LEDs piscando
      Serial.println("4. Testando LEDs alternados...");
      for(int i = 0; i < 3; i++) {
        digitalWrite(LedVerde, HIGH);
        digitalWrite(LedVermelho, LOW);
        delay(500);
        digitalWrite(LedVerde, LOW);
        digitalWrite(LedVermelho, HIGH);
        delay(500);
      }
      digitalWrite(LedVermelho, LOW);
      
      // Teste 5: Servo
      Serial.println("5. Testando Servo Motor...");
      Serial.println("   Posição 0 graus...");
      moverServo(0);
      delay(2000);
      
      Serial.println("   Posição 45 graus...");
      moverServo(45);
      delay(2000);
      
      Serial.println("   Posição 90 graus...");
      moverServo(90);
      delay(2000);
      
      Serial.println("   Posição 135 graus...");
      moverServo(135);
      delay(2000);
      
      Serial.println("   Retornando para 0 graus...");
      moverServo(0);
      delay(2000);
      
      // Teste 6: Simulação de acesso autorizado
      Serial.println("6. Simulando ACESSO AUTORIZADO...");
      digitalWrite(LedVerde, HIGH);
      digitalWrite(LedVermelho, LOW);
      moverServo(90);
      for(int i = 3; i > 0; i--) {
        Serial.print("   Fechando em: ");
        Serial.println(i);
        delay(1000);
      }
      moverServo(0);
      digitalWrite(LedVerde, LOW);
      
      // Teste 7: Simulação de acesso negado
      Serial.println("7. Simulando ACESSO NEGADO...");
      digitalWrite(LedVermelho, HIGH);
      digitalWrite(LedVerde, LOW);
      delay(3000);
      digitalWrite(LedVermelho, LOW);
      
      // Finalização
      Serial.println("========================================");
      Serial.println("=== TESTE COMPLETO FINALIZADO ===");
      Serial.println("Status: Todos os componentes testados!");
      Serial.println("========================================");
    }
    
    // Limpa o buffer serial
    while(Serial.available()) Serial.read();
  }

  if (WiFi.status() == WL_CONNECTED) {

    // Remove o print constante - só quando detectar cartão
    // Serial.println("Aguardando leitura RFID");

    if (!mfrc522.PICC_IsNewCardPresent()) {
      return;  // se nao tiver um cartao para ser lido recomeça o void loop
    }

    if (!mfrc522.PICC_ReadCardSerial()) {
      return;  //se nao conseguir ler o cartao recomeça o void loop tambem
    }

    // Só imprime quando detectar um cartão
    Serial.println("=== CARTÃO DETECTADO ===");

    String conteudo = "";  // cria uma string

    Serial.print("id da tag :");  //imprime na serial o id do cartao

    for (byte i = 0; i < mfrc522.uid.size; i++) {  // faz uma verificacao dos bits da memoria do cartao
      //ambos comandos abaixo vão concatenar as informacoes do cartao...
      //porem os 2 primeiros irao mostrar na serial e os 2 ultimos guardarao os valores na string de conteudo para fazer as verificacoes
      Serial.print(mfrc522.uid.uidByte[i] < 0x10 ? " 0" : " ");
      Serial.print(mfrc522.uid.uidByte[i], HEX);
      conteudo.concat(String(mfrc522.uid.uidByte[i] < 0x10 ? " 0" : " "));
      conteudo.concat(String(mfrc522.uid.uidByte[i], HEX));
    }


    conteudo.toUpperCase();  // deixa as letras da string todas maiusculas

    Serial.println("\n---------------------------------------");
    Serial.println(conteudo.substring(1));
    Serial.println("\n---------------------------------------");


    //APOS LER O RFID CONECTA AO SERVIDOR E VERIFICA SE O RFID EXISTE E SE É ELEGÍVEL PARA ENTRAR OU SAIR

    // Verifica se ainda está conectado ao Wi-Fi
    if (WiFi.status() != WL_CONNECTED) {
      Serial.println("Wi-Fi desconectado durante operação");
      return;
    }

    HTTPClient http;

    String rfid = conteudo.substring(1);

    rfid.trim();

    // Substitui os espaços por %20
    rfid.replace(" ", "%20");

    String url = serverUrl + "?action=verifyAndRegisterAccess&rfid=" + rfid;

    Serial.println(url);

    // Inicia a solicitação HTTP com timeout
    http.begin(url);
    http.setTimeout(10000); // 10 segundos de timeout
    http.setConnectTimeout(5000); // 5 segundos para conectar

    Serial.println("Fazendo requisição HTTP...");
    int httpResponseCode = http.GET();

    if (httpResponseCode > 0) {
      // Lê a resposta do servidor
      String response = http.getString();
      Serial.println("Resposta do servidor:");
      Serial.println(response);
      
      // Remove espaços e quebras de linha da resposta
      response.trim();

      if (response == "ok") {

        Serial.println("=== ACESSO AUTORIZADO ===");
        
        // Liga LED verde e desliga vermelho
        digitalWrite(LedVerde, HIGH);
        digitalWrite(LedVermelho, LOW);
        Serial.println("LED Verde ligado");
        
        // Move servo
        Serial.println("Abrindo servo...");
        moverServo(90);

        // Contagem regressiva
        for (byte s = 5; s > 0; s--) { // Reduzido para 5 segundos
          Serial.print("Fechando em: ");
          Serial.println(s);
          delay(1000);
        }

        Serial.println("Fechando servo...");
        moverServo(0);
        
        // Desliga LED
        digitalWrite(LedVerde, LOW);
        Serial.println("Acesso fechado");
      
      } else {

        Serial.println("=== ACESSO NEGADO ===");
        Serial.print("Resposta recebida: '");
        Serial.print(response);
        Serial.println("'");
        
        digitalWrite(LedVermelho, HIGH);
        digitalWrite(LedVerde, LOW);
        Serial.println("LED Vermelho ligado");
        delay(3000);
        digitalWrite(LedVermelho, LOW);
        Serial.println("LED Vermelho desligado");
      }

    } else {
      Serial.println("=== ERRO HTTP ===");
      Serial.print("Código: ");
      Serial.println(httpResponseCode);
      
      // LED vermelho piscando para erro
      digitalWrite(LedVerde, LOW);
      for (int i = 0; i < 3; i++) {
        digitalWrite(LedVermelho, HIGH);
        delay(300);
        digitalWrite(LedVermelho, LOW);
        delay(300);
      }
    }

    // Finaliza a conexão HTTP
    http.end();
    
    // Importante: Para o cartão do loop para evitar leituras múltiplas
    mfrc522.PICC_HaltA();
    mfrc522.PCD_StopCrypto1();
    
  } else {
    Serial.println("Wi-Fi desconectado");
  }

  delay(2000);  // Aguarda 2 segundos antes da próxima leitura (aumentado)
}