/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function () {
                // Evento que se ejecuta cada vez que se pulsa sobre un checkbox de la tabla
                $("table input[type=checkbox]").on("click", function () {
                    // si esta seleccionado el checkbox
                    if ($(this).is(":checked"))
                    {

                        // añadimos la clase selected
                        $(this).parents("tr").addClass("selected");
                    } else {

                        // quitamos la clase selected
                        $(this).parents("tr").removeClass("selected");
                    }
                    if ($(this).is(':checked')) {

                        $(this).attr("disabled", true);//si es asi lo desactivamos
                    }

                });


            });