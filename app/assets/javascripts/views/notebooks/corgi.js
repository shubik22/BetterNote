BetterNote.Views.Corgi = Backbone.View.extend({
  initialize: function(options) {
    this.$modal = options["$modal"]
  },

  template: JST['static_pages/corgi'],

  events: {
    "click input[type='submit']": "closeModal"
  },

  render: function() {
    var renderedContent = this.template({
      notebook: this.model
    });

    this.$el.html(renderedContent);
    return this;
  },

  closeModal: function(event) {
    event.preventDefault();

    this.$modal.addClass("hidden");
    this.remove();
  }
});