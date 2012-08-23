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

$(function () {
    $("#myCarousel").hover(function () {
        $(this).carousel('pause')
        $("#myCarousel").click(function () {
            $(this).carousel('next');
            var imagen = $('.active').find('img'),
                sel = imagen[0].id, i=0, a=[], destroy;
            $.get('/comments/' + sel + ".json", function (o) {
                if (o.length == 0) {
                    $('#comments').html('<h1>Comentarios</h1><div>No hay Comentarios</div>');
                } else {
                    for (i = 0; i < o.length; i++) {
                        destroy = "<a href='/comments/" + o[i].id + "'" + "data-method='delete' data-remote='true' rel='nofollow'> x </a>";
                        a += '<li><div><font color="#ff8c00" size="3" style="background: #E0E0E0">' + o[i].text + '</font>' + destroy + '</div></li>';
                        $('#comments').html('<h1>Comentarios</h1><div><ol>' + a + '</ol></div>');
                    }
                }
            });
            $("#imagen").val(sel);
        })
    })
});

$(function () {
    var img = $('.active').find('img'),
        sel = img[0].id;
    $("#imagen").val(sel);
});