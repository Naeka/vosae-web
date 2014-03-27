###
  This mixin help us to manage pagination for resources.

  @class MetaMixin
  @extends Ember.Mixin
  @namespace Vosae
  @module Vosae
###

Vosae.MetaMixin = Ember.Mixin.create
  offset: null
  limit: null
  next: null
  previous: null
  since: null
  totalCount: 0
  loading: false
  queries: []

  # Returns true if model has already been fetched on the API.
  hasBeenFetched: (->
    if @previous or @offset? then true else false
  ).property('previous', 'offset').volatile()

  # Returns true if there's more records to fetch on the API.
  canFetchMore: (->
    if !@loading and @next then true else false
  ).property('loading', 'next').volatile()

  getMetaForQuery: (query) ->
    @get("queries").findBy 'name', query