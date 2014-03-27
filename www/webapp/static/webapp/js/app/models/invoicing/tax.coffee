###
  A data model that represents a tax

  @class Tax
  @extends Vosae.Model
  @namespace Vosae
  @module Vosae
###

Vosae.Tax = Vosae.Model.extend
  name: DS.attr('string')
  rate: DS.attr('number', defaultValue: 0.00)
  
  displayTax: (->
    name = @get("name")
    rate = @get('displayRate')
    name + ' ' + rate
  ).property("name", "rate")
  
  displayRate: (->
    accounting.formatMoney (@get("rate") * 100), {symbol: "%", format: "%v%s"}
  ).property("rate")

  checkValidity: ->
    errors = []

    unless Ember.isEmpty(errors)
      if @get('id')
        console.log 'API -> PUT  [Vosae.Tax]'
      else
        console.log 'API -> POST [Vosae.Tax]'
      errors.forEach (line) ->
        console.log '  ' + line

    return true if Ember.isEmpty(errors)

  didCreate: ->
    message = gettext 'The tax has been successfully created'
    Vosae.SuccessPopup.open
      message: message

  didUpdate: ->
    message = gettext 'The tax has been successfully updated'
    Vosae.SuccessPopup.open
      message: message

  didDelete: ->
    message = gettext 'The tax has been successfully deleted'
    Vosae.SuccessPopup.open
      message: message