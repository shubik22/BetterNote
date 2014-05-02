BetterNote.Views.NoteTagsIndex = Backbone.View.extend({
  initialize: function(options) {
    this.note = options["note"];
    this.listenTo(this.collection, "add remove", this.render);
  },

  template: JST['note_tags/index'],
  tagName: "ul",
  className: "tags",

  events: {
    "click .dropdown-parent": "showDropdown",
    "click .options-dropdown, .dropdown-parent": "stopPropagation",
    "click .add-tag>ul>li": "addNoteTag",
    "click .delete-tag": "deleteNoteTag"
  },

  render: function() {
    var renderedContent = this.template({
      noteTags: this.collection
    });

    this.$el.html(renderedContent);
    return this;
  },

  showDropdown: function(event) {
    event.preventDefault();

    var $dropdown = $(event.currentTarget).find(".options-dropdown");
    $dropdown.removeClass("hidden");
  },

  stopPropagation: function(event) {
    event.stopPropagation();
  },

  addNoteTag: function(event) {
    event.preventDefault();

    var tagId = parseInt($(event.currentTarget).attr("data-tag-id"));
    var noteTag = new BetterNote.Models.NoteTag({
      note_id: this.note.get("id"),
      tag_id: tagId,
      tag_name: BetterNote.tags.get(tagId).get("name")
    });

    noteTag.save();
  },

  deleteNoteTag: function(event) {
    event.preventDefault();

    var tagId = parseInt($(event.currentTarget).attr("data-tag-id"));
    var noteTag = this.collection.findWhere({
      tag_id: tagId
    });

    noteTag.destroy();
  }
});