BetterNote.Views.NotesIndex = Backbone.View.extend({
  initialize: function(options) {
    this.type = options["type"];
    this.$noteShowEl = options["$noteShowEl"];

    this.listenTo(this.collection, "add change sort remove", this.render);
    this.listenTo(BetterNote.filter, "change", this.render);

    if (this.model) {
      this.listenTo(this.model, "change", this.render);
      this.listenTo(this.model, "destroy", this.refreshNotesIndex);
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
    var filteredCollection = this._filteredCollection();

    if (filteredCollection.length > 0) {
      var note = filteredCollection[0];
      BetterNote.featuredNote = note;
      BetterNote.router.navigate("#/notes/" + note.get("id"), {
        trigger: true
      });
    } else {
      this.$noteShowEl.html("");
    }

    var renderedContent = this.template({
      notes: filteredCollection,
      model: this.model,
      type: this.type
    });

    BetterNote.featuredNotes = this.collection;
    if (this.type === "all") {
      BetterNote.featuredNotes.id = "all";
    } else {
      BetterNote.featuredNotes.id = this.model.get("id");
    }

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
  },

  _filteredCollection: function() {
    return this.collection.filter(function(note) {
      var title = note.get("title") ? note.get("title").toLowerCase() : "";
      var body = note.get("body") ? note.get("body").toLowerCase() : "";
      var searchText = BetterNote.filter.get("text");

      var titleMatch = (title.indexOf(searchText) === -1) ? false : true
      var bodyMatch = (body.indexOf(searchText) === -1) ? false : true

      return titleMatch || bodyMatch;
    })
  }
});