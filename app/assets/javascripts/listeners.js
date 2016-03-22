var DANEBOOK = DANEBOOK || {};

DANEBOOK.ListenerModule = ( function() {
  var _requests;

  function init( requests ) {
    _requests = requests;
  }

  function registerListeners() {
    _commentLinkListener();
  };

  function _commentLinkListener() {
    $(".comment-link").on("click", function(e) {
      e.preventDefault();
      var $target = $(e.target);
      var $commentable = $target.parent().parent().parent().parent();
      var id = $commentable.data("id");
      var type = $commentable.data("type");

      _requests.showCommentForm(type, id);
    });
  };

  return {
    registerListeners: registerListeners,
    init: init,
  };

})();
