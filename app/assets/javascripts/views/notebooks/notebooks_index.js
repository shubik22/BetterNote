BetterNote.Views.NotebooksIndex = Backbone.View.extend({

  initialize: function(options) {
    this.notes = options["notes"];
    this.notebooks = options["notebooks"];
    this.tags = options["tags"];
  },

  template: JST['notebooks/index'],

  render: function() {
    var renderedContent = this.template({
      notes: this.notes,
      notebooks: this.notebooks,
      tags: this.tags
    })

    this.$el.html(renderedContent);
    return this;
  }

});
