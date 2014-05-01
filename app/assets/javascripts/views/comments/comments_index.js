BetterNote.Views.CommentsIndex = Backbone.View.extend({

  initialize: function(options) {
    this.note = options["note"];
    this.listenTo(this.collection, "add change remove", this.render);
  },

  template: JST['comments/index'],
  formTemplate: JST['comments/comment_form'],

  events: {
    "click .comment-button.new": "addCommentForm",
    "click .comment-button.submit": "submitComment"
  },

  render: function() {
    var renderedContent = this.template({
      comments: this.collection
    });

    this.$el.html(renderedContent);
    return this;
  },

  addButton: function(event) {
    if (event) event.preventDefault();

    var renderedContent = this.buttonTemplate();

    $(".comment-form").remove();
    this.$el.append(renderedContent);
  },

  addCommentForm: function(event) {
    event.preventDefault();

    var renderedContent = this.formTemplate({
      note: this.note
    });

    $(".comment-button").remove();
    this.$el.append(renderedContent);
  },

  submitComment: function(event) {
    event.preventDefault();

    var attrs = $(event.target.form).serializeJSON();
    var comment = new BetterNote.Models.Comment(attrs);

    var that = this;
    this.collection.create(comment, {});
  }
});