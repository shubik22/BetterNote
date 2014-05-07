BetterNote.Models.User = Backbone.Model.extend({
  urlRoot: 'api/friendships',
  
  parse: function(jsonUser) {
    if (jsonUser.notes) {
      this.notes = new BetterNote.Collections.Notes(jsonUser.notes, { parse: true })
      delete jsonUser.notes    
    }
    return jsonUser;
  }
});