<?php 

// Verifica se é uma requisição do ESP32
if (isset($_GET['action']) && $_GET['action'] === 'verifyAndRegisterAccess') {
    
    // Configura o cabeçalho para resposta simples
    header('Content-Type: text/plain');
    
    if (isset($_GET['rfid'])) {
        $rfid = $_GET['rfid'];
        
        // Log da requisição (opcional - para debug)
        error_log("RFID recebido: " . $rfid);
        
        // Aqui você pode implementar sua lógica de verificação
        // Por exemplo, verificar em banco de dados, arquivo, etc.
        
        // TEMPORÁRIO: Para teste, vamos aceitar qualquer RFID que comece com "B1"
        if (strpos($rfid, 'B1') === 0) {
            echo "ok";
        } else {
            echo "negado";
        }
        
    } else {
        echo "rfid_missing";
    }
    
    // Encerra a execução aqui para requisições do ESP32
    exit;
}

// Código normal da página web
include 'app/view/include/header.php';

?>

<body>
    <h1>Sistema de Controle de Acesso</h1>
    <p>Sistema funcionando!</p>
</body>