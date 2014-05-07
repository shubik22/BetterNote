BetterNote.Routers.Notes = Backbone.Router.extend({
  initialize: function($notesListEl, $noteShowEl) {
    this.$notesListEl = $notesListEl;
    this.$noteShowEl = $noteShowEl;
  },

  routes: {
    '': "notesIndex",
    'notes/:id': 'showNote',
    'notes': "notesIndex",
    'notebooks/:id': 'showNotebook',
    'users/:id': 'showFriend'
  },

  showNote: function(id) {
    if (BetterNote.notes.get(id)) {
      var view = new BetterNote.Views.NoteShow({
        model: BetterNote.notes.get(id)
      });
    } else {
      var view = new BetterNote.Views.FriendNoteShow({
        model: BetterNote.friendNotes.findWhere({ id: parseInt(id) })
      })
    }

    this._swapShowView(view);
  },

  notesIndex: function() {
    var listView = new BetterNote.Views.NotesIndex({
      type: "all",
      collection: BetterNote.notes,
      $noteShowEl: this.$noteShowEl
    });

    BetterNote.featuredNotebook = BetterNote.notebooks.at(0);

    this._swapListView(listView);
  },

  showNotebook: function(id) {
    var notebook = BetterNote.notebooks.get(id);
    BetterNote.featuredNotebook = notebook;

    var listView = new BetterNote.Views.NotesIndex({
      type: "notebook",
      model: notebook,
      collection: notebook.notes,
      $noteShowEl: this.$noteShowEl
    });

    this._swapListView(listView);
  },

  showFriend: function(id) {
    var friend = BetterNote.friends.get(id);
    
    var listView = new BetterNote.Views.NotesIndex({
      type: "friend",
      model: friend,
      collection: friend.notes,
      $noteShowEl: this.$noteShowEl
    })
    
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