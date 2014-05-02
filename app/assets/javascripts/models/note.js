BetterNote.Models.Note = Backbone.Model.extend({
  parse: function(jsonNote) {
    var that = this;
    if (jsonNote.author) {
      this.author = new BetterNote.Models.User(jsonNote.author);
      delete jsonNote.author;
    } else {
      this.author = BetterNote.currentUser;
    }
    if (jsonNote.comments) {
      this.comments = new BetterNote.Collections.Comments(jsonNote.comments, { parse: true });
      delete jsonNote.comments;
    } else {
      this.comments = new BetterNote.Collections.Comments();
    }
    if (jsonNote.tags) {
      this.tags = new BetterNote.Collections.Tags();
      _(jsonNote.tags).each(function(jsonTag) {
        var tag = BetterNote.tags.get(jsonTag);
        that.tags.add(tag);
        tag.notes.add(that);
      })
      delete jsonNote.tags;
    } else {
      this.tags = new BetterNote.Collections.Tags();
    }
    if (jsonNote.note_tags) {
      this.noteTags = new BetterNote.Collections.NoteTags(jsonNote.note_tags);
      delete jsonNote.note_tags;
    } else {
      this.noteTags = new BetterNote.Collections.NoteTags();
    }
    if (jsonNote.notebook) {
      var notebook = BetterNote.notebooks.get(jsonNote.notebook);
      this.notebook = notebook;
      notebook.notes.add(this);
      delete jsonNote.notebook;
    } else {
      this.notebook = BetterNote.featuredNotebook;
    }
    if (jsonNote.likes) {
      this.likes = new BetterNote.Collections.Likes(jsonNote.likes, { parse: true });
      delete jsonNote.likes;
    } else {
      this.likes = new BetterNote.Collections.Likes();
    }
    return jsonNote;
  },

  currentUserLike: function() {
    return this.likes.find(function(like) {
      return (like.owner.get("id") === BetterNote.currentUser.get("id"));
    });
  }
});