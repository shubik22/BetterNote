BetterNote.Views.TagsShow = Backbone.View.extend({
  template: JST['tags/show'],

  render: function() {
    var renderedContent = this.template({
      tag: this.model
    });

    this.$el.html(renderedContent);
    return this;
  }
});