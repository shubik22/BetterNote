BetterNote.Routers.Notes = Backbone.Router.extend({
  initialize: function($notesListEl, $noteShowEl) {
    this.$notesListEl = $notesListEl;
    this.$noteShowEl = $noteShowEl;
  },

  routes: {
    '': "notesIndex",
    'notes': "notesIndex",
    'notebooks/:id': 'showNotebook',
    'tags/:id': 'showTag',
    'notes/:id': 'showNote'
  },

  showNote: function(id) {
    var view = new BetterNote.Views.NoteShow({
      model: BetterNote.notes.get(id)
    });

    this._swapShowView(view);
  },

  notesIndex: function() {
    var listView = new BetterNote.Views.NotesIndex({
      type: "all",
      collection: BetterNote.notes
    });
    BetterNote.featuredNotebook = BetterNote.notebooks.at(0);

    var showView = new BetterNote.Views.NoteShow({
      model: BetterNote.notes.at(0)
    });

    this._swapListView(listView);
    this._swapShowView(showView);
  },

  showNotebook: function(id) {
    var notebook = BetterNote.notebooks.get(id);
    BetterNote.featuredNotebook = notebook;

    var listView = new BetterNote.Views.NotesIndex({
      type: "notebook",
      model: notebook,
      collection: notebook.notes
    });

    if (notebook.notes.length > 0) {
      var note = notebook.notes.at(0)
      var showView = new BetterNote.Views.NoteShow({
        model: note
      });
      this._swapShowView(showView);
    } else {
      this.$noteShowEl.html("");
    }

    this._swapListView(listView);
  },

  showTag: function(id) {
    var tag = BetterNote.tags.get(id);

    var listView = new BetterNote.Views.NotesIndex({
      type: "tag",
      model: tag,
      collection: tag.notes
    })

    if (tag.notes.length > 0) {
      var note = tag.notes.at(0)
      var showView = new BetterNote.Views.NoteShow({
        model: note
      });
      this._swapShowView(showView);
    } else {
      this.$noteShowEl.html("");
    }

    this._swapListView(listView);
  },

  _swapShowView: function(view) {
    this._currentShowView && this._currentShowView.remove();
    this._currentShowView = view;
    this.$noteShowEl.html(view.render().$el);
  },

  _swapListView: function(view) {
    this._currentListView && this._currentListView.remove();
    this._currentListView = view;
    this.$notesListEl.html(view.render().$el);
  }
});