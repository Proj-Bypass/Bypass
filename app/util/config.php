<?php

//Mostrar erros do PHP
ini_set('display_errors', 1);
error_reporting(E_ALL);

//Configurar essas variáveis de acordo com o seu ambiente
define("DB_HOST", "localhost");
define("DB_NAME", "bypass");
define("DB_USER", "root");
define("DB_PASSWORD", "");

//configurações adicionais

//ambiente de desenvolvedor
define('AMB_DEV', true); //definir como false para desligar

if(AMB_DEV == true){
    error_reporting(E_ALL);
    ini_set('display_errors', 1);
    
    define("BASE_URL", "C:/xampp/htdocs/Bypass/");
}

if (AMB_DEV == false) {
    error_reporting(0);
    ini_set('display_errors', 0);
}