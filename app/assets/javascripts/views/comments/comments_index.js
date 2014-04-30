BetterNote.Views.CommentsIndex = Backbone.View.extend({

  template: JST['comments/index'],

  render: function() {
    var renderedContent = this.template({
      comments: this.collection
    });

    this.$el.html(renderedContent);
    return this;
  }

});
