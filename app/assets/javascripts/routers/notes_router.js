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
    var note = BetterNote.notes.at(0);

    var listView = new BetterNote.Views.NotesIndex({
      type: "all",
      collection: BetterNote.notes,
    });

    var showView = new BetterNote.Views.NoteShow({
      model: note
    });

    this._swapListView(listView);
    this._swapShowView(showView);
  },

  showNotebook: function(id) {
    var notebook = BetterNote.notebooks.get(id);

    var listView = new BetterNote.Views.NotesIndex({
      type: "notebook",
      model: notebook,
      collection: notebook.notes
    });

    this._swapListView(listView);

    if (notebook.notes.at(0)) {
      var showView = new BetterNote.Views.NoteShow({
        model: notebook.notes.at(0)
      });
      this._swapShowView(showView);
    }
  },

  showTag: function(id) {
    var tag = BetterNote.tags.get(id);
    var note = tag.notes.at(0);

    var listView = new BetterNote.Views.NotesIndex({
      type: "tag",
      model: tag,
      collection: tag.notes
    })

    var showView = new BetterNote.Views.NoteShow({
      model: note
    });

    this._swapListView(listView);
    this._swapShowView(showView);
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