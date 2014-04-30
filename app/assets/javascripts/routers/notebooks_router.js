BetterNote.Routers.Notebooks = Backbone.Router.extend({

  initialize: function(notebooks, tags, notes, $notesListEl) {
    this.notebooks = notebooks;
    this.tags = tags;
    this.notes = notes;
    this.$notesListEl = $notesListEl;
  },

  routes: {

  },


  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$notesListEl.html(view.render().$el);
  }
});
