
$(document).ready(function() {

    $("tr").click(function () {
      $(this).offsetParent("table").find("tr").removeClass("selected");
      $(this).addClass("selected");
    });
    $('.index_as_table').tableScroll({height:350}).addClass("navigateable");

    $(document).bind('keypress', function(e) {
            switch(e.keyCode){
              case 13://enter: deberia ir al show.
                  break;
              case 40:// down arrow
                  // si no encuentra deberia ir a la primera
                  // si es la ultima no deberia seguir
                  sel = $(".selected");
                  $("table").find("tr").removeClass("selected");
                  sel.next("tr").addClass("selected");
                  break;
              case 38:// up arrow
                  // si es la primera no deberia seguir
                  // o podria ir a la primera.
                  sel = $(".selected");
                  $("table").find("tr").removeClass("selected");
                  sel.prev("tr").addClass("selected");
                  break;
            }
    });

    // other examples

    // sets the table to have a scrollable area of 200px
//    $('#thetable').tableScroll({height:500});

    // sets a hard width limit for the table, setting this too small
    // may not always work
  //  $('#thetable').tableScroll({width:400});

    // by default the plugin will wrap everything in a div with this
    // css class, if it finds that you have manually wrapped the
    // table with a custom element using this same css class it
    // will forgo creating a container DIV element
   // $('#thetable').tableScroll({containerClass:'myCustomClass'});
});
