/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$('.input-number').on('input', function () {
    this.value = this.value.replace(/[^0-9.]/g, '');
});

//this.value = this.value.replace(/[^0-9]/g, '');

