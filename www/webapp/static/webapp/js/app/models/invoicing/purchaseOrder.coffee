###
  A data model that represents a purchase order

  @class PurchaseOrder
  @extends Vosae.Quotation
  @namespace Vosae
  @module Vosae
###

Vosae.PurchaseOrder = Vosae.Quotation.extend
  makeInvoice: (controller) ->
    # Make an `Invoice` record from the `PurchaseOrder`.
    if @get('id') and @get('isInvoiceable')
      purchaseOrder = @
      purchaseOrder.set 'isMakingInvoice', true

      store = @get('store')
      adapter = store.adapterForType(Vosae.PurchaseOrder)
      serializer = adapter.get 'serializer'

      url = adapter.buildURL('purchase_order', @get('id'))
      url += "make_invoice/"

      adapter.ajax(url, "PUT").then((json) ->
        invoiceId = serializer.deurlify json['invoice_uri']
        if invoiceId
          purchaseOrder.reload()
          Em.run @, ->
            Vosae.SuccessPopup.open
              message: gettext 'Your purchase order has been transformed into an invoice'
            controller.transitionToRoute 'invoice.show', controller.get('session.tenant'), store.find(Vosae.Invoice, invoiceId)
          purchaseOrder.set 'isMakingInvoice', false
      ).then null, adapter.rejectionHandler