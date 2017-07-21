function alerta(tipo, mensaje) {
    $('#div_alertas').append('<div id="alertdiv" class="alert alert-' +  tipo + '"><a class="close" data-dismiss="alert">×</a><span>'+mensaje+'</span></div>');

    setTimeout(function() {
        $("#alertdiv").remove();
    }, 3000);
}
