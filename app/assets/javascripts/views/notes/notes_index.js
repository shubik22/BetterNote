BetterNote.Views.NotesIndex = Backbone.View.extend({
  initialize: function(options) {
    this.type = options["type"];
    this.selectedNote = options["selectedNote"];
    this.listenTo(this.collection, "add change sort", this.render);
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

    $("body").on("click", this.hideDropdowns);
    $(".new-note").on("click", this.createNote);

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

  // createNote: function(event) {
  //   event.preventDefault();
  //
  //   if (this.type === "notebook") {
  //     var note = BetterNote.Models.Note({
  //       title: "Untitled"
  //     });
  //     this.collection.add(note);
  //   }
  // },

  selectNote: function(event) {
    $(event.currentTarget).closest(".notes")
      .find(".selected").removeClass("selected");

    var $note = $(event.currentTarget).closest(".note-preview");
    $note.addClass("selected");
  },

  refreshNotesIndex: function(event) {
    this.remove();
    BetterNote.router.navigate("");
  },

  sortNotes: function(event) {
    event.preventDefault();

    var $li = $(event.currentTarget);
    var sortField = $li.attr("data-sort-field");
    var sortToggle = $li.attr("data-sort-toggle");

    this.collection.comparator = this._setComparator(sortField, sortToggle);
    this.collection.sort();

    this.hideDropdowns();
  },

  _setComparator: function(sortField, sortToggle) {
    return function(note1, note2) {
      var field1 = note1.get(sortField);
      var field2 = note2.get(sortField);

      if (note1.isNew()) {
        return -1
      } else if (note2.isNew()) {
        return 1
      };

      if (sortField === "title") {
        field1 = field1.toLowerCase();
        field2 = field2.toLowerCase();
      }

      if (field1 > field2) {
        return 1 * sortToggle;
      } else if (field1 < field2) {
        return -1 * sortToggle;
      } else {
        return 0;
      }
    }
  }
});