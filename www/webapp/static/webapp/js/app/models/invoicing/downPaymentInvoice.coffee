###
  A data model that represents a down payement invoice

  @class DownPaymentInvoice
  @extends Vosae.Invoice
  @namespace Vosae
  @module Vosae
###

Vosae.DownPaymentInvoice = Vosae.Invoice.extend
  percentage: DS.attr('string')
  taxApplied: DS.belongsTo('tax')