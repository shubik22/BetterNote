BetterNote.Views.NotebookDelete = Backbone.View.extend({
  initialize: function(options) {
    this.$modal = options["$modal"]
  },

  template: JST['notebooks/delete'],

  events: {
    "click input[type='submit']": "deleteNotebook"
  },

  render: function() {
    var renderedContent = this.template({
      notebook: this.model
    });

    this.$el.html(renderedContent);
    return this;
  },

  deleteNotebook: function(event) {
    event.preventDefault();

    if (BetterNote.featuredNotes.id === this.model.get("id")) {
      console.log("here")
      BetterNote.featuredNotes = BetterNote.notes;
      BetterNote.featuredNotes.id = "all";
    }

    var that = this;
    this.model.destroy({
      success: function() {
        that.$modal.addClass("hidden");
        that.remove();
      }
    })
  }
});