/*@author Oswaldo Didier Lopez Garcia
 * 24 de Agosto del 2012
 * oswaldo@codetlan.com*/
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
//= require jquery.remotipart

/*Creamos una funcion que se manda a llamar con el id del carousel que ocupamos para el muestreo de las imagenes. En la funcion
 * se pausa para que se quede estatico en una imagen y se le agrega otra funcion que al darle click va cambiar la imagen*/
$(function () {
    $("#myCarousel").hover(function () {
        $(this).carousel('pause')
        $("#myCarousel").click(function () {
            $(this).carousel('next');
            /*Buscamos en las imagenes la clase active que sera la que se va estar mostrando en el carousel, esto con el fin de
              obtener el id*/
            var imagen = $('.active').find('img'),
                sel = imagen[0].id, i=0, a=[], destroy;
            //Ya que tenemos el id hacemos una llamada ajax mediante get para traer los comentarios de la imagen
            $.get('/comments/' + sel + ".json", function (o) {
                if (o.length == 0) {
                    $('#comments').html('<h1>Comentarios</h1><div>No hay Comentarios</div>');
                } else {
                    //Recorremos los comentarios para meterlos en un arreglo y mostrarlos
                    for (i = 0; i < o.length; i++) {
                        destroy = "<a href='/comments/" + o[i].id + "'" + "data-method='delete' data-remote='true' rel='nofollow'> x </a>";
                        a += '<li><div><font color="#ff8c00" size="3" style="background: #E0E0E0">' + o[i].text + '</font>' + destroy + '</div></li>';
                        //Actualizamos los comentarios al cambiar la imagen de acuerdo al id de la imagen con clase active.
                        $('#comments').html('<h1>Comentarios</h1><div><ol>' + a + '</ol></div>');
                    }
                }
            });
            //Seteamos el id de la imagen a la propiedad :image_id esto con el fin de saber en que imagen se pone el comentario.
            $("#imagen").val(sel);
        })
    })
});
//Seteamos el id de la imagen para el caso en el que agregamos un comentario en el index sin utilizar la funcion click del carousel
$(function () {
    var img = $('.active').find('img'),
        sel = img[0].id;
    $("#imagen").val(sel);
});