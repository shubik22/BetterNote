BetterNote.Views.LikeShow = Backbone.View.extend({
  initialize: function(options) {
    this.note = options["note"];
    this.listenTo(this.collection, "add remove", this.render);
  },

  template: JST['likes/show'],

  className: "note-show-button",

  events: {
    "click .like-note": "likeNote",
    "click .unlike-note": "unlikeNote"
  },

  render: function() {
    var renderedContent = this.template({
      note: this.note
    });

    this.$el.html(renderedContent);

    var buttonClass = (this.note.currentUserLike()) ? "unlike-note" : "like-note";
    var $button = this.$el.find(".like-button")
    $button.removeClass("unlike-note like-note");
    $button.addClass(buttonClass);

    return this;
  },

  likeNote: function(event) {
    event.preventDefault();

    this.collection.create({
      note_id: this.note.get("id")
    });
  },

  unlikeNote: function(event) {
    event.preventDefault();
    this.note.currentUserLike().destroy();
  }
});