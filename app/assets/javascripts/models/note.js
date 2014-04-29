BetterNote.Models.Note = Backbone.Model.extend({
  initialize: function() {
    if (this.get("comments")) {
      var comments = this.get("comments");
      this.comments = new BetterNote.Collections.Comments(comments);
      this.unset("comments");
    }
    if (this.get("tags")) {
      var tags = this.get("tags");
      this.tags = new BetterNote.Collections.Tags(tags);
      this.unset("tags");
    }
    if (this.get("notebook")) {
      var notebook = this.get("notebook");
      this.notebook = new BetterNote.Models.Notebook(notebook);
      this.unset("notebook");
    }
  },

  parse: function(jsonResp) {
    if (jsonResp.comments) {
      this.comments = new BetterNote.Collections.Comments(jsonResp.comments);
      delete jsonResp.comments;
    }
    if (jsonResp.tags) {
      this.tags = new BetterNote.Collections.Tags(jsonResp.tags);
      delete jsonResp.tags;
    }
    if (jsonResp.notebook) {
      this.notebook = new BetterNote.Models.Notebook(jsonResp.notebook);
      delete jsonResp.notebook;
    }
    return jsonResp;
  }
});