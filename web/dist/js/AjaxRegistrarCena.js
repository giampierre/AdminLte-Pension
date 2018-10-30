/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var ajax;

function funcionCallback()
{
    // Comprobamos si la peticion se ha completado (estado 4)
    if (ajax.readyState === 4)
    {
        // Comprobamos si la respuesta ha sido correcta (resultado HTTP 200)
        if (ajax.status === 200)
        {
            // Escribimos el resultado en la pagina HTML mediante DHTML
            document.all.salida.innerHTML = "<p style='font-size: 20px; text-transform: uppercase;'><b>" + ajax.responseText + "</b></p>";
        }else {
            alert("nada");
        }
    }

}

function tufuncion(e) {
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla === 13) {
        //Aqui haz lo que quieras que pase cuando presionen enter
        // Creamos el control XMLHttpRequest segun el navegador en el que estemos 
        if (window.XMLHttpRequest)
            ajax = new XMLHttpRequest(); // No Internet Explorer
        else
            ajax = new ActiveXObject("Microsoft.XMLHTTP"); // Internet Explorer

        // Almacenamos en el control al funcion que se invocara cuando la peticion
        // cambie de estado	
        ajax.onreadystatechange = funcionCallback;
        // Enviamos la peticion
        ajax.open("GET", "views/RegistrarComidas/RegistrarCenas/AddCena.jsp?dni=" + document.all.entrada.value + "&estado=" + document.all.estado.value + "&cantidad=" + document.all.cantidad.value, true);
        ajax.send("");
        
        $('#salida').hide(2000);
	$('.salida').hide("fast");
       // alert("ok");
        $('#salida').show(2000);
	$('.salida').show("slow");
        
    }
    
    document.all.salida.innerHTML = "ingresando código...";
}


//FUNCION LIMPIAR DESPUES DE REGISTRAR DESAYUNO
function funLimpiar(e) {
    tecla = (document.all) ? e.keyCode : e.which;
    if (tecla === 13) {
        $('input[type="text"]').val('');
    }
}



