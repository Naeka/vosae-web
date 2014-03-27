Vosae.SettingsEditUserRoute = Ember.Route.extend
  setupController: (controller, model) ->
    controller.setProperties
      'content': model
      'groupsList': @store.all("group")

  deactivate: ->
    model = @controller.get "content"
    model.rollback() if model and not model.get('isDeleted')
