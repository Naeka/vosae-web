###
  A data model that represents a reminder settings

  @class ReminderSettings
  @extends Vosae.Model
  @namespace Vosae
  @module Vosae
###

Vosae.ReminderSettings = Vosae.Model.extend
  useDefault: DS.attr('boolean')
  overrides: DS.hasMany('reminderEntry')