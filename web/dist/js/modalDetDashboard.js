/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function () {
   
     $("#modal_uno").click(function () {
        $('#detalle').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
        $('#detalle').load('views/Dashboard/DesaDiaDet.jsp');
    });
    
      $("#modal_dos").click(function () {
        $('#detalle').html('<center><img src="dist/img/loader.gif" width="20px" height="20px"/></center>');
        $('#detalle').load('views/Dashboard/DesaMesDet.jsp');
    });
    
    
});

