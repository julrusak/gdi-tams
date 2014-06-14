App.Router.map(function() {
  this.resource('courses', { path: '/dashboard' });
});

App.ApplicationRoute = Ember.Route.extend({
  actions: {
    openModal: function(modalName, model, course) {
      this.controllerFor(modalName).set('model', model);
      this.controllerFor(modalName).set('course', course);
      return this.render(modalName, {
        into: 'application',
        outlet: 'modal'
      });
    },

    closeModal: function() {
      return this.disconnectOutlet({
        outlet: 'modal',
        parentView: 'application'
      });
    }
  }
});
