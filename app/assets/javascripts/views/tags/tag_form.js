BetterNote.Views.TagForm = Backbone.View.extend({
  initialize: function(options) {
    this.$modal = options["$modal"]
  },

  template: JST['tags/form'],

  events: {
    "click input[type='submit']": "submitTag"
  },

  render: function() {
    var renderedContent = this.template({
      tag: this.model
    });

    this.$el.html(renderedContent);
    return this;
  },

  submitTag: function(event) {
    event.preventDefault();

    var that = this;
    var attrs = $(event.target.form).serializeJSON();
    var success = function() {
      that.$modal.addClass("hidden");
      that.remove();
    };

    this.model.set(attrs);
    if (this.model.isNew()) {
      BetterNote.tags.create(this.model, {
        wait: true,
        success: success
      });
    } else {
      this.model.save({}, {
        wait: true,
        success: success
      })
    }
  }
});