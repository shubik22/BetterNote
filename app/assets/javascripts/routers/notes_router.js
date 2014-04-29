BetterNote.Routers.Notes = Backbone.Router.extend({

  initialize: function(notebooks, notes, $noteShowEl) {
    this.notebooks = notebooks;
    this.notes = notes;
    this.$noteShowEl = $noteShowEl;
  },

  routes: {
    'notes/:id': 'show',
    'notes/:id/edit': 'edit'
  },

  show: function(id) {
    var view = new BetterNote.Views.NotesShow({
      model: this.notes.get(id),
      notebooks: this.notebooks
    });

    this._swapView(view);
  },

  edit: function() {
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$noteShowEl.html(view.render().$el);
  }
});