BetterNote.Views.TagDelete = Backbone.View.extend({
  initialize: function(options) {
    this.$modal = options["$modal"]
  },

  template: JST['tags/delete'],

  events: {
    "click input[type='submit']": "deleteTag"
  },

  render: function() {
    var renderedContent = this.template({
      notebook: this.model
    });

    this.$el.html(renderedContent);
    return this;
  },

  deleteTag: function(event) {
    event.preventDefault();

    var that = this;
    this.model.destroy({
        success: function() {
      that.$modal.addClass("hidden");
      that.remove();
      }
    })
  }
});