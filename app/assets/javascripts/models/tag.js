BetterNote.Models.Tag = Backbone.Model.extend({
  initialize: function() {
    this.notes = this.notes || new BetterNote.Collections.Notes();
  }
});