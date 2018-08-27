/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () { // inicio ready.function

    $("#menu_uno").click(function () {
        $("#contenido").load("views/Dashboard/Dashboard.jsp");
    });

    $("#menu_dos").click(function () {
        $("#contenido").load("views/RegistrarComidas/RegistrarDesayunos/AddDesayuno.jsp");
    });

    $("#menu_tres").click(function () {
        $("#contenido").load("");
    });

    $("#menu_cuatro").click(function () {
        $("#contenido").load("");
    });

    $("#menu_cinco").click(function () {
        $("#contenido").load("");
    });

    $("#menu_seis").click(function () {
        $("#contenido").load("");
    });

    $("#menu_siete").click(function () {
        $("#contenido").load("");
    });

    $("#menu_ocho").click(function () {
        $("#contenido").load("");
    });

    $("#menu_nueve").click(function () {
        $("#contenido").load("");
    });

    $("#menu_diez").click(function () {
        $("#contenido").load("");
    });

}); // fin ready.function