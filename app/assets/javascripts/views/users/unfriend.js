BetterNote.Views.Unfriend = Backbone.View.extend({
  initialize: function(options) {
    this.$modal = options["$modal"];
  },

  template: JST['users/unfriend'],

  events: {
    "click input[type='submit']": "removeFriend"
  },

  render: function() {
    var renderedContent = this.template({
      friend: this.model
    });

    this.$el.html(renderedContent);
    return this;
  },

  removeFriend: function(event) {
    event.preventDefault();

    var that = this;
    this.model.destroy({
      success: function() {
        that.$modal.addClass("hidden");
        that.remove();
        BetterNote.router.navigate("#/notes");
      }
    })
  }
});