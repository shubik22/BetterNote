BetterNote.Models.Note = Backbone.Model.extend({
  urlRoot: "/api/notes",

  parse: function(jsonNote) {
    var that = this;
    if (jsonNote.author) {
      this.author = new BetterNote.Models.User(jsonNote.author);
      delete jsonNote.author;
    } else {
      this.author = BetterNote.currentUser;
    }
    if (jsonNote.notebook_id) {
      var notebook = BetterNote.notebooks.get(jsonNote.notebook_id);
      this.notebook = notebook;
      notebook.notes.add(this);
      delete jsonNote.notebook;
    }
    if (jsonNote.comments) {
      this.comments = new BetterNote.Collections.Comments(jsonNote.comments, { parse: true });
      delete jsonNote.comments;
    } else {
      this.comments = new BetterNote.Collections.Comments();
    }
    if (jsonNote.note_tags) {
      this.noteTags = new BetterNote.Collections.NoteTags(jsonNote.note_tags);
      this.noteTags.each(function(noteTag) {
        var tag = BetterNote.tags.get(noteTag.get("tag_id"));
        tag.notes.add(that);
      })
      delete jsonNote.note_tags;
    } else {
      this.noteTags = new BetterNote.Collections.NoteTags();
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