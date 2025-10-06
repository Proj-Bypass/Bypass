<?php
include __DIR__ . '/../include/header.php';

?>


<body>
    <header class="header">
        <div class="div-logo">
            <a href="home.php"><img class="logo" src="../../../assets/img/logoBranca.png" alt=""></a>
        </div>

        <div class="div-acesso">
            <a href="login.php"><button class=button-acess>Acessar o sistema</button></a>
        </div>
    </header>

    <main>
        <div class="div-title">
            <h1 style="font-family: 'F29LT Bukra SmBd'; font-size: 42px;">Bypass: Mais que controle de acesso, uma experiência inteligente</h1>
            <p style="font-size: 21px;">O projeto que promete revolucionar a tecnologia de gestão de acessos no âmbito escolar.</p>
        </div>

        <div class="div-presentation">
            <div class="presentation-intro">
                <h3>Conheça agora o projeto e seu idealizador</h3>
                <p>Imagine um colégio onde a entrada e saída de alunos são automatizadas, seguras, registradas em tempo real enquanto os responsáveis são notificados. Agora pare de imaginar: isso é o Bypass, um projeto inovador de automação escolar criado pensando na realidade de um colégio: o Instituto Federal do Paraná.</p>
            </div>

            <div class="presentation-content">
                <div class="content-section ideia">
                    <h2>Como surgiu a ideia?</h2>
                    <p>Tudo começou com uma necessidade real: monitorar e controlar melhor a entrada e saída dos alunos no campus, visto que muitos estudantes entram e saem em horários diferentes por conta das aulas, atividades de extensão ou outros compromissos pessoais, o que acaba por gerar uma dificuldade para a coordenação e segurança manterem o controle de quem estava no campus a qualquer momento.</p>
                </div>

                <div class="content-section projeto">
                    <h2>Como funciona o Bypass?</h2>
                    <p>O Bypass é uma catraca inteligente com controle de acesso via RFID, conectada a um sistema backend que valida, em tempo real, se o aluno pode ou não passar por ela, com base no seu horário de aula e permissões registradas. O projeto é dividido em três grandes pilares:</p>

                    <div class="pilares">
                        <div class="pilar">
                            <h4>Hardware inteligente:</h4>
                            <ul>
                                <li>Um leitor RFID RC522 faz a leitura dos cartões dos alunos.</li>
                                <li>Um ESP32 comanda a comunicação e o controle da catraca ou fechadura eletrônica.</li>
                                <li>Um relé ativa o mecanismo de abertura quando a validação é positiva.</li>
                            </ul>
                        </div>

                        <div class="pilar">
                            <h4>Validação em tempo real:</h4>
                            <ul>
                                <li>O cartão é lido e seus dados são enviados para o backend.</li>
                                <li>O sistema consulta o banco de dados, verifica os horários da turma, permissões especiais e autorizações temporárias.</li>
                                <li>Caso esteja tudo certo, a catraca abre. Caso contrário, permanece fechada e um registro de tentativa é salvo.</li>
                            </ul>
                        </div>

                        <div class="pilar">
                            <h4>Sistema Web de Administração:</h4>
                            <ul>
                                <li>Uma interface web permite que a equipe administrativa cadastre alunos, configure os horários das turmas e gerencie permissões.</li>
                                <li>Também é possível ver um log completo de acessos, tentativas negadas e relatórios de presença por horário.</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="div-status">
            <div class="status-content">
                <div class="content-section">
                    <h2>Status atual</h2>
                    <p>Até o momento, o projeto está em fase de desenvolvimento e testes. A parte de hardware já está em funcionamento básico, com leitura RFID integrada ao ESP32. O backend está em construção com PHP e MySQL, e o painel web está sendo estruturado para permitir a gestão completa do sistema.</p>
                    <p>Além disso, o projeto está sendo estruturado de forma modular, para que seja possível adaptar o mesmo sistema a outras instituições, ou até mesmo a portarias de empresas e condomínios no futuro.</p>
                </div>
            </div>
        </div>

        <div class="div-idealizador">
            <div class="idealizador-content">
                <div class="content-section">
                    <h2>Sobre o Desenvolvedor</h2>

                    <div class="container-fluid px-0">
                        <div class="row g-0 align-items-center">
                            <!-- Coluna da foto -->
                            <div class="col-lg-4 col-md-5 d-flex justify-content-center mb-4 mb-md-0">
                                <div class="developer-photo-wrapper">
                                    <img src="../../../assets/img/founderPhoto.jpg"
                                        alt="Felipe Augusto Buche - Desenvolvedor do Projeto Bypass"
                                        class="developer-photo img-fluid shadow-lg">
                                </div>
                            </div>

                            <!-- Coluna do texto -->
                            <div class="col-lg-8 col-md-7">
                                <div class="developer-info ps-md-4">
                                    <h3 class="developer-name mb-2">Felipe Augusto Buche</h3>
                                    <p class="developer-title mb-3">Desenvolvedor e Idealizador do Projeto Bypass</p>

                                    <div class="developer-description">
                                        <p>Felipe Augusto Buche é estudante do 3º ano do Curso Técnico em Desenvolvimento de Sistemas no Instituto Federal do Paraná. Com foco em soluções tecnológicas aplicadas ao ambiente educacional, atua no desenvolvimento de sistemas embarcados e aplicações web voltadas à automação e melhoria de processos institucionais.</p>

                                        <p class="mb-0">Atualmente, é responsável pela idealização e implementação do Bypass, contudo, possui experiência em programação, eletrônica aplicada e integração de sistemas, com ênfase na criação de soluções escaláveis, seguras e eficientes.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </main>
</body>

<?php
include __DIR__ . '/../include/footer.php';
?>