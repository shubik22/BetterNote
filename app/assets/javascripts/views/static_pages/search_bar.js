BetterNote.Views.SearchBar = Backbone.View.extend({

  tagName: "header",
  className: "search group",
  template: JST['static_pages/search_bar'],

  events: {
    "click button.create-new-note": "createNote",
    "click .submit": "applySearchFilter",
    "click .clear-search": "clearSearch"
  },

  render: function() {
    var renderedContent = this.template();
    this.$el.html(renderedContent);
    return this;
  },

  createNote: function(event) {
    event.preventDefault();

    var note = new BetterNote.Models.Note({
      title: "Untitled",
      notebook_id: BetterNote.featuredNotebook.get("id")
    });
    BetterNote.featuredNote = note;

    var that = this;
    note.save({}, {
      success: function(note) {
        that.render();
        BetterNote.notes.add(note);
        BetterNote.router.navigate("#/notes/" + note.get("id"));
      }
    });
  },

  applySearchFilter: function(event) {
    event.preventDefault();

    var searchText = $(event.currentTarget).closest("form").serializeJSON().query;
    BetterNote.filter.set({text: searchText});
  },

  clearSearch: function(event) {
    event.preventDefault();
    BetterNote.filter.set({
      text: "",
      tags: []
    })
    this.render();
  }
});