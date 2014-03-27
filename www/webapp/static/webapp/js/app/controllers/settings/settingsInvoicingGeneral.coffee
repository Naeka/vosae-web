###
  Custom controller for a `Vosae.InvoicingSettings` record.

  @class SettingsInvoicingGeneralController
  @extends Ember.ObjectController
  @namespace Vosae
  @module Vosae
###

Vosae.SettingsInvoicingGeneralController = Em.ObjectController.extend
  # Sort currencies by description
  sortedCurrencies: (->
    Ember.ArrayProxy.createWithMixins Ember.SortableMixin,
      sortProperties: ['description']
      content: @get('currencies')
  ).property('currencies')
  
  # Hack 
  supportedCurrencies: (->
    ids = @get('invoicing.supportedCurrencies').getEach('id')
    @get('store').all('currency').filter (cur) ->
      cur if ids.contains cur.get('id')
  ).property('invoicing.supportedCurrencies.@each.id', 'invoicing.supportedCurrencies.length')

  actions:
    save: (tenantSettings) ->
      tenantSettings.save()
