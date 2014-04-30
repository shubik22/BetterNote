BetterNote.Models.Notebook = Backbone.Model.extend({
  initialize: function() {
    this.notes = this.notes || new BetterNote.Collections.Notes();
  },

  parse: function(jsonResp) {
    if (jsonResp.notes) {
      var that = this;
      that.notes = new BetterNote.Collections.Notes(jsonResp.notes);
      that.notes.each(function(note) {
        note.notebook = that;
      })
      delete jsonResp.notes;
    }
    if (jsonResp.owner) {
      this.owner = new BetterNote.Models.User(jsonResp.owner);
      delete jsonResp.owner;
    }
    return jsonResp;
  }
});