<?php
include __DIR__ . '/../include/header.php';
?>

<body>
    <header class="header">
        <div class="div-logo">
            <a href="home.php"><img class="logo" src="../../../assets/img/logoBranca.png" alt=""></a>
        </div>

        <div class="div-acesso">
            <a href="home.php"><button class="button-acess">Voltar ao início</button></a>
        </div>
    </header>

    <main>
        <div class="div-login">
            <div class="container-fluid px-0">
                <div class="row g-0 min-vh-100">
                    <!-- Lado esquerdo - Imagem e texto de boas-vindas -->
                    <div class="col-lg-6 col-md-6 d-flex align-items-center justify-content-center login-left-side">
                        <div class="login-welcome-content text-center">
                            <h2 class="welcome-title mb-3">Bem-vindo de volta!</h2>
                            <p class="welcome-subtitle">Acesse o painel administrativo do sistema Bypass</p>
                            <div class="welcome-logo mb-10">
                                <img src="../../../assets/img/monoColorido.png" alt="Bypass Logo" class="login-logo img-fluid">
                            </div>
                        </div>
                    </div>
                    
                    <!-- Lado direito - Formulário de login -->
                    <div class="col-lg-6 col-md-6 d-flex align-items-center justify-content-center login-right-side">
                        <div class="login-form-container">
                            <div class="login-card">
                                <h1 class="login-title mb-4">Entrar no sistema</h1>
                                
                                <form class="login-form" method="post">
                                    <div class="form-group mb-3">
                                        <input type="text" name="cpf" id="cpf" class="form-control login-input" placeholder="Digite seu CPF">
                                    </div>
                                    
                                    <div class="form-group mb-4">
                                        <input type="password" name="senha" id="senha" class="form-control login-input" placeholder="Digite sua senha">
                                    </div>
                                    
                                    <button type="submit" class="btn-login w-100">Entrar</button>
                                </form>
                                
                                <div class="login-footer text-center">
                                    <p class="back-to-home">
                                        <a href="home.php" class="text-decoration-none">← Voltar à página inicial</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>

<script>
$(document).ready(function() {
    $('#cpf').mask('000.000.000-00');
});
</script>

<?php
include __DIR__ . '/../include/footer.php';
?>