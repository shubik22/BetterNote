BetterNote.Views.NotebooksShow = Backbone.View.extend({
  template: JST['notebooks/show'],

  render: function() {
    var renderedContent = this.template({
      notebook: this.model
    });

    this.$el.html(renderedContent);
    return this;
  }
});