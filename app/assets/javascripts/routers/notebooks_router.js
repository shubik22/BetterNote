BetterNote.Routers.Notebooks = Backbone.Router.extend({

  initialize: function(notebooks, tags, notes, $notesListEl) {
    this.notebooks = notebooks;
    this.tags = tags;
    this.notes = notes;
    this.$notesListEl = $notesListEl;
  },

  routes: {
    'notes': "notesIndex",
    'notebooks/:id': 'showNotebook',
    'tags/:id': 'showTag'
  },

  notesIndex: function() {
    var view = new BetterNote.Views.NotesIndex({
      collection: this.notes
    });

    this._swapView(view);
  },

  showNotebook: function(id) {
    var view = new BetterNote.Views.NotebooksShow({
      model: this.notebooks.get(id)
    })

    this._swapView(view);
  },

  showTag: function(id) {
    var view = new BetterNote.Views.TagsShow({
      model: this.tags.get(id)
    })

    this._swapView(view);
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$notesListEl.html(view.render().$el);
  }
});
