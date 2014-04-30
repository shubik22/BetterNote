BetterNote.Views.NotesIndex = Backbone.View.extend({
  initialize: function(options) {
    this.type = options["type"];
    this.listenTo(this.collection, "add change sort", this.render);
    if (this.model) {
      this.listenTo(this.model, "add change remove", this.render);
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

    $("body").on("click", this.hideDropdowns);

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

  sortNotes: function(event) {
    event.preventDefault();

    var $li = $(event.currentTarget);
    var sortField = $li.attr("data-sort-field");
    var sortOrder = $li.attr("data-sort-order");

    this.collection.comparator = function(note) {
      return note.get(sortField);
    };
    this.collection.sort();

    this.hideDropdowns();
  },

  selectNote: function(event) {
    $(".selected").removeClass("selected");

    var $note = $(event.currentTarget).closest(".note-preview");
    $note.addClass("selected");
  }
});