BetterNote.Views.FriendNoteShow = Backbone.View.extend({
  template: JST['notes/friend_show'],

  events: {
    "click .dropdown-parent": "showDropdown",
    "click .options-dropdown, .dropdown-parent": "stopPropagation",
  },

  render: function() {
    BetterNote.featuredNote = this.model;
    var renderedContent = this.template({
      note: this.model
    });

    this.$el.html(renderedContent);

    var infoView = new BetterNote.Views.NoteInfo({
      model: this.model
    })

    var commentView = new BetterNote.Views.CommentsIndex({
      collection: this.model.comments,
      note: this.model
    });

    var likeView = new BetterNote.Views.LikeShow({
      collection: this.model.likes,
      note: this.model
    });

    this.$el.append(commentView.render().$el);
    this.$el.find(".note-show-header-right.top").append(infoView.render().$el);
    this.$el.find(".note-show-header-right.bottom").prepend(likeView.render().$el);

    return this;
  },

  showDropdown: function(event) {
    event.preventDefault();
    this.hideDropdowns();

    var $dropdown = $(event.currentTarget).find(".options-dropdown");
    $dropdown.removeClass("hidden");
  },

  hideDropdowns: function(event) {
    $(".options-dropdown").not("hidden").addClass("hidden");
  },

  stopPropagation: function(event) {
    event.stopPropagation();
  }
});