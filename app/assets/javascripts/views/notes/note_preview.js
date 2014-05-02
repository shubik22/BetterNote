BetterNote.Views.NotePreview = Backbone.View.extend({
  // TO BE IMPLEMENTED
  initialize: function(options) {
    this.listenTo(this.model, "change", this.render);
    this.listenTo(this.model, "destroy", this.remove);
  },

  template: JST['notes/preview'],

  events: {
    "click .note-preview": "selectNote"
  },

  render: function() {
    var renderedContent = this.template({
      note: this.model
    });

    this.$el.html(renderedContent);
    return this;
  },

  selectNote: function(event) {
    $(event.currentTarget).closest(".notes")
      .find(".selected").removeClass("selected");

    var $note = $(event.currentTarget).closest(".note-preview");
    $note.addClass("selected");
  }
});