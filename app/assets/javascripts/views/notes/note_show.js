BetterNote.Views.NoteShow = Backbone.View.extend({
  initialize: function() {
    this.listenTo(this.model, "add change remove", this.render);
    this.listenTo(this.model.notebook, "change", this.render);
    this.listenTo(this.model.likes, "add remove", this.render);
    this.listenTo(this.model.tags, "add change remove", this.render);
  },

  template: JST['notes/show'],

  events: {
    "click .dropdown-parent": "showDropdown",
    "click .options-dropdown, .dropdown-parent": "stopPropagation",
    "click form.update-notebook": "updateNotebook",
    "click .delete-note": "showModal",
    "click .like-note": "likeNote",
    "click .unlike-note": "unlikeNote",
    "blur form.note-title, form.note-body": "updateNote",
    "click .add-tag>ul>li": "addNoteTag",
    "click .delete-tag": "deleteNoteTag"
  },

  render: function() {
    BetterNote.featuredNote = this.model;
    var renderedContent = this.template({
      note: this.model,
      notebooks: BetterNote.notebooks
    });

    this.$el.html(renderedContent);

    var commentView = new BetterNote.Views.CommentsIndex({
      collection: this.model.comments,
      note: this.model
    });

    this.$el.append(commentView.render().$el);

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
    var success = function() {
      that.hideDropdowns();
    };

    var oldNotebook = that.model.notebook;
    var newNotebook = BetterNote.notebooks.get(attrs.note.notebook_id);
    this.model.notebook = newNotebook;
    oldNotebook.notes.remove(this.model);
    newNotebook.notes.add(this.model);

    this.model.set(attrs);
    this.model.save({}, {
      success: success
    })
  },

  updateNote: function(event) {
    var attrs = $(event.currentTarget).serializeJSON();
    this.model.save(attrs);
  },

  likeNote: function(event) {
    event.preventDefault();

    var like = new BetterNote.Models.Like({
      note_id: this.model.get("id")
    });

    this.model.likes.create(like);
  },

  unlikeNote: function(event) {
    event.preventDefault();
    this.model.currentUserLike().destroy();
  },

  addNoteTag: function(event) {
    event.preventDefault();

    var tagId = parseInt($(event.currentTarget).attr("data-tag-id"));
    var tag = BetterNote.tags.get(tagId);
    var noteTag = this.model.noteTags.create({
      note_id: this.model.id,
      tag_id: tagId
    });

    this.model.tags.add(tag);
  },

  deleteNoteTag: function(event) {
    event.preventDefault();

    var tagId = parseInt($(event.currentTarget).attr("data-tag-id"));
    var tag = this.model.tags.get(tagId);
    var noteTag = this.model.noteTags.findWhere({
      tag_id: tagId
    });

    this.model.tags.remove(tag);
    noteTag.destroy();
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