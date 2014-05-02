BetterNote.Views.CommentsIndex = Backbone.View.extend({

  initialize: function(options) {
    this.note = options["note"];
    this.listenTo(this.collection, "add change remove", this.render);
  },

  tagName: "section",
  className: "comments",
  template: JST['comments/index'],
  formTemplate: JST['comments/comment_form'],

  events: {
    "click .comment-button.new": "addCommentForm",
    "click .comment-button.submit": "submitComment",
    "click .delete-comment": "deleteComment",
    "click .comment-button.cancel": "addButton",
    "click .comments-header>.note-show-header-left": "toggleCommentsList"
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
    this.render();
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
    comment.author = BetterNote.currentUser;

    this.collection.create(comment, {});
  },

  deleteComment: function(event) {
    event.preventDefault();

    var commentId = $(event.currentTarget).find("button").attr("data-comment-id");
    var comment = this.collection.get(commentId);
    comment.destroy();
  },

  toggleCommentsList: function(event) {
    event.preventDefault();
    var $commentsContent = $(event.currentTarget).closest("section.comments")
                          .find(".comments-content");
    var $icon = $(event.currentTarget).find("i:first-of-type");

    if ($commentsContent.hasClass("hidden")) {
      $commentsContent.removeClass("hidden");
      $icon.removeClass('fa-caret-right').addClass('fa-caret-down')
    } else {
      $commentsContent.addClass("hidden")
      $icon.removeClass('fa-caret-down').addClass('fa-caret-right')
    }
  }
});