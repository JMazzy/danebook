var DANEBOOK = DANEBOOK || {};

DANEBOOK.RequestModule = ( function() {
  function showCommentForm( type, id ) {
    $.ajax({
      url: "/comments/new",
      type: "GET",
      data: JSON.stringify( {  comment: {
                              commentable_type: type,
                              commentable_id: id } } ),
      success: function() {
        console.log("success");
      },
      error: function(response) {
        console.log("error");
        console.log(response)
      },
      complete: function() {
        console.log("complete");
      }
    });
  };

  return {
    showCommentForm: showCommentForm,
  }
})();
