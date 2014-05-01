BetterNote.Models.Note = Backbone.Model.extend({
  parse: function(jsonNote) {
    var that = this;
    if (jsonNote.comments) {
      this.comments = new BetterNote.Collections.Comments(jsonNote.comments);
      delete jsonNote.comments;
    }
    if (jsonNote.tags) {
      that.tags = new BetterNote.Collections.Tags();
      _(jsonNote.tags).each(function(jsonTag) {
        var tag = BetterNote.tags.get(jsonTag);
        that.tags.add(tag);
        tag.notes.add(that);
      })
      delete jsonNote.tags;
    }
    if (jsonNote.notebook) {
      var notebook = BetterNote.notebooks.get(jsonNote.notebook);
      this.notebook = notebook;
      notebook.notes.add(this);
      delete jsonNote.notebook;
    }
    return jsonNote;
  }
});