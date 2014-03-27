###
  A data model that represents a line item

  @class LineItem
  @extends Vosae.Model
  @namespace Vosae
  @module Vosae
###

Vosae.LineItem = Vosae.Model.extend
  reference: DS.attr('string')
  description: DS.attr('string')
  itemId: DS.attr('string')
  quantity: DS.attr('number')
  unitPrice: DS.attr('number')
  tax: DS.belongsTo('tax', async: true)
  optional: DS.attr('boolean', defaultValue: false)
  
  shouldDisableField: (->
    # Returns true if current line item hasn't reference
    if @get('reference')
      return false
    true
  ).property('reference')

  total: (->
    if @get("quantity") and @get("unitPrice")
      return (@get("quantity") * @get("unitPrice"))
    0
  ).property("quantity", "unitPrice")

  totalPlusTax: (->
    if @get("quantity") and @get("unitPrice") and @get("tax.isLoaded")
      total = (@get("quantity") * @get("unitPrice"))
      return total + (total * @get("tax.rate"))
    0
  ).property("quantity", "unitPrice", "tax.isLoaded")

  displayTotal: (->
    if @get('total') 
      return accounting.formatMoney @get('total')
    accounting.formatMoney 0
  ).property("total")

  displayTotalPlusTax: (->
    if @get('totalPlusTax') 
      return accounting.formatMoney @get('totalPlusTax')
    accounting.formatMoney 0
  ).property("totalPlusTax")

  displayUnitPrice: (->
    if @get("unitPrice")
      return accounting.formatMoney @get("unitPrice")
    accounting.formatMoney 0
  ).property("unitPrice")

  displayQuantity: (->
    if @get("quantity")
      return accounting.formatMoney @get("quantity")
    accounting.formatMoney 0
  ).property("quantity")

  guid: (->
    Em.guidFor @
  ).property()

  didLoad: ->
    # This hack is used to refresh the `taxes` computed property
    # on model InvoiceRevision once the current tax is loaded
    tax = @get 'tax'
    if tax? and not tax.get('isLoaded')
      tax.then =>
        @propertyDidChange('tax')

  VAT: ->
    tax = @get 'tax'
    new Ember.RSVP.Promise (resolve) =>
      resolve(null) if not tax 
      tax.then (tax) =>
        if @get("quantity") and @get("unitPrice")
          total = (@get("quantity") * @get("unitPrice")) * tax.get("rate")
          resolve(
            total: total
            tax: tax
          )
        resolve(null)

  recordIsEmpty: ->
    # Return true if item is empty
    if @get 'reference'
      return false
    if @get 'description'
      return false
    if @get 'itemId'
      return false
    if @get 'quantity'
      return false
    if @get 'unitPrice'
      return false
    if @get 'tax'
      return false
    return true