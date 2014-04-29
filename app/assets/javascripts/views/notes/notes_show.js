BetterNote.Views.NotesShow = Backbone.View.extend({
  template: JST['notes/show'],

  initialize: function(options) {
    this.notebooks = options["notebooks"];
  },

  render: function() {
    var renderedContent = this.template({
      note: this.model,
      notebooks: this.notebooks
    });

    this.$el.html(renderedContent);
    return this;
  }
});