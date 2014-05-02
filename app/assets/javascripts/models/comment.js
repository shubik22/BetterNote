BetterNote.Models.Comment = Backbone.Model.extend({
  parse: function(jsonComment) {
    if (jsonComment.author) {
      this.author = new BetterNote.Models.User(jsonComment.author);
      delete jsonComment.author;
    }
    return jsonComment;
  }
});