BetterNote.Views.NotesIndex = Backbone.View.extend({
  initialize: function(options) {
    $("body").on("click", this.hideDropdowns);
    this.type = options["type"];
    this.selectedNote = options["selectedNote"];
    this.listenTo(this.collection, "add change sort remove", this.render);
    this.listenTo(BetterNote.featuredNote, "add change", this.render);
    if (this.model) {
      this.listenTo(this.model, "change", this.render);
      this.listenTo(this.model, "destroy", this.refreshNotesIndex);
      this.listenTo(this.model.notes, "add change remove", this.render);
    }
  },

  events: {
    "click .notes-list-footer-left-text": "showDropdown",
    "click .options-dropdown, .notes-list-footer-left-text": "stopPropagation",
    "click .sort-option": "sortNotes",
    "click .note-preview": "selectNote"
  },

  template: JST['notes/index'],

  render: function() {
    var renderedContent = this.template({
      notes: this.collection,
      model: this.model,
      type: this.type
    });
    BetterNote.featuredNotes = this.collection;

    this.$el.html(renderedContent);
    return this;
  },

  showDropdown: function(event) {
    event.preventDefault();
    this.hideDropdowns();

    var $dropdown = $(event.currentTarget).closest(".dropdown-parent")
                      .find(".options-dropdown");
    $dropdown.removeClass("hidden");
  },

  hideDropdowns: function(event) {
    $(".options-dropdown").not("hidden").addClass("hidden");
  },

  stopPropagation: function(event) {
    event.stopPropagation();
  },

  selectNote: function(event) {
    $(event.currentTarget).closest(".notes")
      .find(".selected").removeClass("selected");

    var $note = $(event.currentTarget).closest(".note-preview");
    $note.addClass("selected");
  },

  refreshNotesIndex: function(event) {
    this.remove();
    BetterNote.router.navigate("#/notes");
  },

  sortNotes: function(event) {
    event.preventDefault();

    var $li = $(event.currentTarget);
    var sortField = $li.attr("data-sort-field");
    var sortToggle = $li.attr("data-sort-toggle");

    this.collection.setComparator(sortField, sortToggle);
    this.collection.sort();

    this.hideDropdowns();
  }
});