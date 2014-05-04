BetterNote.Views.NoteDelete = Backbone.View.extend({
  initialize: function(options) {
    this.$modal = options["$modal"];
    this.noteShowView = options["noteShowView"];
  },

  template: JST['notes/delete'],

  events: {
    "click input[type='submit']": "deleteNote"
  },

  render: function() {
    var renderedContent = this.template({
      note: this.model
    });

    this.$el.html(renderedContent);
    return this;
  },

  deleteNote: function(event) {
    event.preventDefault();

    if (BetterNote.featuredNotes.length > 1) {
      var nextNoteId = BetterNote.featuredNotes.nextNote(this.model).get("id");
      var nextNote = BetterNote.notes.get(nextNoteId);
      BetterNote.featuredNote = nextNote;
    }

    var that = this;
    this.model.destroy({
      success: function() {
        that.$modal.addClass("hidden");
        that.remove();
        if (nextNoteId) {
          BetterNote.router.navigate("#/notes/" + nextNoteId);
        } else {
          that.noteShowView.remove();
        }
      }
    })
  }
});