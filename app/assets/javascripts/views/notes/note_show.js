BetterNote.Views.NoteShow = Backbone.View.extend({
  template: JST['notes/show'],

  render: function() {
    var renderedContent = this.template({
      note: this.model,
      notebooks: BetterNote.notebooks
    });

    this.$el.html(renderedContent);
    return this;
  }
});