(function(){

  var appendNewUser = function(id) {
    if(id % 20 == 0) {
      $('.js_append').empty()
    }

    $.getJSON('/user/' + id, function(data) {

    var $new = $(
        '<div class="col-md-4">' +
        '<div class="well well-sm">' +
        '<div class="media">' +
        '<a class="thumbnail pull-left" href="#">' +
        '<img class="media-object" style="height: 80px;" src="' + data.picture + '">' +
        '</a>' +
        '<div class="media-body">' +
        '<h4 class="media-heading">'+ data.name +'</h4>' +
        '<h5 class="media-description">'+ data.email +'</h5>' +
        '</div>' +
        '</div>' +
        '</div>' +
        '</div>').hide();

      $('.js_append').append($new);
      $new.show('slow');
    })
  }

  var sendRequests = function(delay) {
    id = 1;
    setInterval(function(){
      appendNewUser(id)
      id = id + 1;
      if(id === 1000) {
        id = 1
      }
    }, delay);
  }

  sendRequests(200)

})();
