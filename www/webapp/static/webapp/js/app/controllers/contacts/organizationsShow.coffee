###
  A custom array controller for a collection of `Vosae.Organization` records.

  @class OrganizationsShowController
  @extends Vosae.EntitiesController
  @namespace Vosae
  @module Vosae
###

Vosae.OrganizationsShowController = Vosae.EntitiesController.extend
  relatedType: "organization"
  needs: ['contactsShow']
  sortProperties: ['corporateName']
  sortAscending: true