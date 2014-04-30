BetterNote.Views.NotebookForm = Backbone.View.extend({
  initialize: function(options) {
    this.$modal = options["$modal"]
  },

  template: JST['notebooks/form'],

  events: {
    "click input[type='submit']": "submitNotebook"
  },

  render: function() {
    var renderedContent = this.template({
      notebook: this.model
    });

    this.$el.html(renderedContent);
    return this;
  },

  submitNotebook: function(event) {
    event.preventDefault();

    var that = this;
    var attrs = $(event.target.form).serializeJSON();
    var success = function() {
      that.$modal.addClass("hidden");
      that.remove();
    };

    this.model.set(attrs);
    if (this.model.isNew()) {
      BetterNote.notebooks.create(this.model, {
        success: success
      });
    } else {
      this.model.save({}, {
        success: success
      })
    }
  }
});