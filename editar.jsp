<%@page import="model.Usuario"%>
<% 
    Usuario u = (Usuario) request.getAttribute("user");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title> Barbearia du ZÉ </title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="icon" href="img/logobarber.png"/>
          <style>
            body {
                background-color: #000000;
            }
            h1{
                color: #fff
            }
            .form-floating input, .form-check-label {
                color: #fff;
            }
        </style>
    </head>
    <body>

        <main class="text-center mt-3 container col-sm-10 col-md-4">
            <h1> Barbearia du Zé edição </h1>

            <form action="usuario-controller" method="post" class="validar" novalidate onsubmit="return confrm('Deseja editar os dados?')" >
                
                 <input type="hidden" name="pagina" value="atualizar">
                 <input type="hidden" name="id" value="<%= u.getId() %>">

                <div class="form-floating mt-3">
                    <input type="text" id="nome" name="nome" class="form-control" placeholder="Nome completo" required minlength="6" >
                    <label for="nome"> Nome completo </label>

                    <small class="invalid-feedback text-start">
                        O nome precisa conter no mínimo 6 caracteres.
                    </small>
                </div>

                <div class="form-floating mt-3">
                    <input type="email" id="email" name="email" class="form-control" placeholder="exemplo@seuemail.com" required >
                    <label for="email"> Email </label>

                    <small class="invalid-feedback text-start">
                        O email precisa ter '@' e um domínio (exemplo@email.com).
                    </small>
                </div>

                <div class="form-floating mt-3">
                    <input type="date" id="nasc" name="nasc" class="form-control" required >
                    <label for="nasc"> Data de nascimento </label>

                    <small class="invalid-feedback text-start">
                        O usuário precisa ter idade maior do que 12 anos.
                    </small>
                </div>

                <div class="form-floating mt-3">
                    <input type="password" id="senha" name="senha" class="form-control" placeholder="Senha" required minlength="6" pattern="^(?=.*[A-Z])(?=.*\d)(?=.*[^\w\s]).{6,}$" onkeyup="validarSenha()" >
                    <label for="senha"> Senha </label>

                    <div class="invalid-feedback mt-2 text-start">
                        A senha precisa ter:
                        <ul>
                            <li id="minimo"> No mínimo 6 caracteres </li>
                            <li id="maiuscula"> Letra MAIÚSCULA </li>
                            <li id="especial"> Caracter especial </li>
                            <li id="numero"> Número </li>
                        </ul>
                    </div>

                    <small class="valid-feedback text-start">
                        Senha OK!
                    </small>
                </div>

                <div class="form-floating mt-3">
                    <input type="password" id="confere-senha" name="confere-senha" class="form-control" placeholder="Confirmação da senha" required minlength="6" onkeyup="validarSenha()" >
                    <label for="confere-senha"> Confirmação da senha </label>

                    <small class="invalid-feedback text-start">
                        As senhas não coincidem!
                    </small>
                </div>

                <div class="form-check form-switch mt-3 text-start">
                    <input type="checkbox" id="noticias" name="noticias" value="sim" class="form-check-input">
                    <label for="noticias" class="form-check-label"> Deseja receber nossa noticias? </label>
                </div>

                <hr>

                <div class="d-grid mt-4">
                    <input type="submit" value="Confirmar" class="btn btn-primary">
                    <input type="reset" value="Limpar campos" class="btn btn-light mt-3">
                </div>

            </form>

        </main>


        <script src="js/bootstrap.min.js"></script>

        <script>
                        const campoData = document.getElementById("nasc");
                        const senha = document.getElementById("senha");
                        const confSenha = document.getElementById("confere-senha");
                        const minimo = document.getElementById("minimo");
                        const maiuscula = document.getElementById("maiuscula");
                        const especial = document.getElementById("especial");
                        const numero = document.getElementById("numero");

                        function validarSenha() {
                            confSenha.minLength = senha.value.length;

                            (senha.value.length >= 6) ? minimo.style.color = "green" : minimo.style.color = "red";
                            (/[A-Z]/.test(senha.value)) ? maiuscula.style.color = "green" : maiuscula.style.color = "red";
                            (/[^\w\s]/.test(senha.value)) ? especial.style.color = "green" : especial.style.color = "red";
                            (/[\d]/.test(senha.value)) ? numero.style.color = "green" : numero.style.color = "red";

                            if (confSenha.value === senha.value) {
                                confSenha.classList.add("is-valid");
                            } else {
                                confSenha.minLength = 10000;
                            }
                        }

                        function pegarData() {
                            let hoje = new Date();
                            let dataFormatada = (hoje.getFullYear() - 12) +
                                    "-" +
                                    ((hoje.getMonth() + 1 < 10) ?
                                            "0" + hoje.getMonth() + 1) :
                                    hoje.getMonth() + 1) +
                                    "-" +
                                    ((hoje.getDate() < 10) ?
                                            "0" + hoje.getDate() :
                                            hoje.getDate());

                            campoData.max = dataFormatada;
                        }

                        document.addEventListener("load", pegarData());
        </script>

        <script src="js/init-validation.js"></script>
        
    </body>
</html>

