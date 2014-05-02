BetterNote.Views.NoteDelete = Backbone.View.extend({
  initialize: function(options) {
    this.$modal = options["$modal"]
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

    var nextNoteId = BetterNote.featuredNotes.nextNote(this.model).get("id");
    var nextNote = BetterNote.notes.get(nextNoteId);

    var that = this;
    this.model.destroy({
      success: function() {
        that.$modal.addClass("hidden");
        that.remove();
        BetterNote.featuredNote = nextNote;
        BetterNote.router.navigate("#/notes/" + nextNoteId);
      }
    })
  }
});