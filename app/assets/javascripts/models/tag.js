BetterNote.Models.Tag = Backbone.Model.extend({
  urlRoot: "api/tags",
  initialize: function() {
    this.notes = this.notes || new BetterNote.Collections.Notes();
  }
});