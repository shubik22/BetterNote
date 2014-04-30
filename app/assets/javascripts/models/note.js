BetterNote.Models.Note = Backbone.Model.extend({
  parse: function(jsonNote) {
    if (jsonNote.comments) {
      this.comments = new BetterNote.Collections.Comments(jsonNote.comments);
      delete jsonNote.comments;
    }
    if (jsonNote.tags) {
      this.tags = new BetterNote.Collections.Tags();
      this.parseTags(jsonNote.tags);
      delete jsonNote.tags;
    }
    if (jsonNote.notebook) {
      this.parseNotebook(jsonNote.notebook);
      delete jsonNote.notebook;
    }
    return jsonNote;
  },

  parseNotebook: function(jsonNotebook) {
    if (BetterNote.notebooks.get(jsonNotebook)) {
      var notebook = BetterNote.notebooks.get(jsonNotebook);
      this.notebook = notebook;
      notebook.notes.add(this);
    } else {
      this.notebook = new BetterNote.Models.Notebook(jsonNotebook);
      this.notebook.notes = new BetterNote.Collections.Notes(this);
      BetterNote.notebooks.add(this.notebook);
    }
  },

  parseTags: function(jsonTags) {
    var that = this;
    _(jsonTags).each(function(jsonTag) {
      if (BetterNote.tags.get(jsonTag)) {
        var tag = BetterNote.tags.get(jsonTag);
        that.tags.add(tag);
        tag.notes.add(that);
      } else {
        var tag = new BetterNote.Models.Tag(jsonTag);
        that.tags.add(tag);
        tag.notes = new BetterNote.Collections.Notes(that);
        BetterNote.tags.add(tag);
      }
    })
  }
});