/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () { // inicio ready.function

    $("#menu_uno").click(function () {
        $('#contenido').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
        $("#contenido").load("views/Dashboard/Dashboard.jsp");
    });

    $("#menu_dos").click(function () {
        $('#contenido').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
        $("#contenido").load("views/RegistrarComidas/RegistrarDesayunos/RegistrarDesayuno.jsp");
    });

    $("#menu_tres").click(function () {
        $('#contenido').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
        $("#contenido").load("views/RegistrarComidas/RegistrarAlmuerzos/RegistrarAlmuerzo.jsp");
    });

    $("#menu_cuatro").click(function () {
        $('#contenido').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
        $("#contenido").load("views/RegistrarComidas/RegistrarCenas/RegistrarCena.jsp");
    });

    $("#menu_cinco").click(function () {
        $('#contenido').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
        $("#contenido").load("views/Pensionistas/MainPensionistas.jsp");
    });

    $("#menu_seis").click(function () {
        $('#contenido').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
        $("#contenido").load("views/Pensionistas/PensionistasMes.jsp");
    });

    $("#menu_siete").click(function () {
        $('#contenido').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
        $("#contenido").load("");
    });

    $("#menu_ocho").click(function () {
        $('#contenido').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
        $("#contenido").load("");
    });

    $("#menu_nueve").click(function () {
        $('#contenido').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
        $("#contenido").load("views/Comidas/MainDesayunos.jsp");
    });

    $("#menu_diez").click(function () {
        $('#contenido').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
        $("#contenido").load("views/Comidas/MainAlmuerzos.jsp");
    });
    $("#menu_once").click(function () {
        $('#contenido').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
        $("#contenido").load("views/Comidas/MainCenas.jsp");
    });
    $("#listPersons").click(function () {
        $('#contenido').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
        $("#contenido").load("mantenimiento/persona/MainPersona.jsp");
    });
    $("#listPensionistas").click(function () {
        $('#contenido').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
        $("#contenido").load("mantenimiento/pensionista/MainPensionista.jsp");
    });
    $("#listDesayunos").click(function () {
        $('#contenido').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
        $("#contenido").load("mantenimiento/desayuno/MainDesayuno.jsp");
    });
    $("#listAlmuerzos").click(function () {
        $('#contenido').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
        $("#contenido").load("mantenimiento/almuerzo/MainAlmuerzo.jsp");
    });
    $("#listCenas").click(function () {
        $('#contenido').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
        $("#contenido").load("mantenimiento/cena/MainCena.jsp");
    });
   
    
}); // fin ready.function