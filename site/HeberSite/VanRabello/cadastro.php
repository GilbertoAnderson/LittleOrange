<?php
    include_once('conexao.php');
    $condominio = _POST('condominio');
    $empresa = _POST('empresa');
    $especialidade = _POST('especialidade');
    $email = _POST('email');
    $celular = _POST('celular');
    $cpf = _POST('cpf');

    $idCondominio = 1
    $idCanal = 1;
    $idEspecialidade = 1;
    $idStatus = 1;
    $idPlano = 1;
    $idAbrangencia = 1;

    $result_cadastro = "INSERT INTO tblPrestadorBase(idCondominio, idCanal, Empresa, Email, Celular,CPF_CNPJ, idEspecialidade, idStatus, idPlano, idAbrangencia) values('$idCondominio','$idCanal','$empresa','$email','$celular','$cpf', '$idEspecialidade','$idStatus','$idPlano','$idAbrangencia')";

    $resultado_cadastro = sql_connect($conn, $result_cadastro);
                                                     
?>