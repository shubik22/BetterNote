BetterNote.Views.NoteShow = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.model, "change", this.render);
    this.listenTo(this.model.noteTags, "add remove", this.render);
  },

  template: JST['notes/show'],

  events: {
    "click .dropdown-parent": "showDropdown",
    "click .options-dropdown, .dropdown-parent": "stopPropagation",
    "click form.update-notebook": "updateNotebook",
    "click .delete-note": "showModal",
    "blur form.note-title, form.note-body": "updateNote"
  },

  render: function() {
    BetterNote.featuredNote = this.model;
    var renderedContent = this.template({
      note: this.model,
      notebooks: BetterNote.notebooks
    });

    this.$el.html(renderedContent);

    var infoView = new BetterNote.Views.NoteInfo({
      model: this.model,
      noteTags: this.model.noteTags,
      likes: this.model.likes
    })

    var commentView = new BetterNote.Views.CommentsIndex({
      collection: this.model.comments,
      note: this.model
    });

    var likeView = new BetterNote.Views.LikeShow({
      collection: this.model.likes,
      note: this.model
    });

    var noteTagView = new BetterNote.Views.NoteTagsIndex({
      collection: this.model.noteTags,
      note: this.model
    });

    this.$el.append(commentView.render().$el);
    this.$el.find(".note-show-header-left.top").append(noteTagView.render().$el);
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
  },

  updateNotebook: function(event) {
    event.preventDefault();

    var that = this;
    var attrs = $(event.currentTarget).serializeJSON();

    var oldNotebook = that.model.notebook;
    oldNotebook.notes.remove(this.model);

    this.model.save(attrs, {
      wait: true
    })
  },

  updateNote: function(event) {
    var attrs = $(event.currentTarget).serializeJSON();
    this.model.save(attrs, {
      wait: true
    });
  },

  showModal: function(event) {
    event.preventDefault();

    var $modal = $("#modal");
    var $modalContent = $(".modal-content")
    var view = new BetterNote.Views.NoteDelete({
      model: this.model,
      $modal: $modal
    });

    $modal.removeClass("hidden");
    $modalContent.html(view.render().$el);
  }
});