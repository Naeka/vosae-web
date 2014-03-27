Vosae.DashboardIndexRoute = Ember.Route.extend    
  beforeModel: ->
    meta = @store.metadataFor "timeline"
    # Only fetch `timeline` once
    if !meta or !meta.get "hasBeenFetched"
      @store.find "timeline"

  model: ->
    promises = []
    for model in Vosae.Utilities.TIMELINE_MODELS
      promises.push @store.all(model)
    return Ember.RSVP.all promises
  
  setupController: (controller, model) ->
    controller.setProperties
      'content': null
      'unmergedContent': model

  renderTemplate: ->
    @_super()
    @render 'dashboard.index.settings',
      outlet: 'outletPageSettings'