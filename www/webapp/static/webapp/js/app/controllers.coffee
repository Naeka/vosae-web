# Imports controllers
require 'controllers/controller'

require 'controllers/application'

require 'controllers/core/dashboardIndex'
require 'controllers/core/search'
require 'controllers/core/notifications'
require 'controllers/core/realtime'

require 'controllers/tenants/tenant'
require 'controllers/tenants/tenantsShow'
require 'controllers/tenants/tenantsAdd'

require 'controllers/settings/settingsOrganization'
require 'controllers/settings/settingsShowUsers'
require 'controllers/settings/settingsShowGroups'
require 'controllers/settings/settingsShowTaxes'
require 'controllers/settings/settingsEditUser'
require 'controllers/settings/settingsEditGroup'
require 'controllers/settings/settingsEditTax'
require 'controllers/settings/settingsInvoicingGeneral'
require 'controllers/settings/settingsNumbering'
require 'controllers/settings/settingsApiKeys'
require 'controllers/settings/settingsReport'

require 'controllers/contacts/entity'
require 'controllers/contacts/entities'
require 'controllers/contacts/organizationsShow'
require 'controllers/contacts/contactsShow'
require 'controllers/contacts/contactEdit'
require 'controllers/contacts/organizationEdit'
require 'controllers/contacts/contactShow'
require 'controllers/contacts/organizationShow'

require 'controllers/invoicing/invoicingDashboard'
require 'controllers/invoicing/invoicingFyFlowStatistics'
require 'controllers/invoicing/invoiceBase'
require 'controllers/invoicing/quotationShow'
require 'controllers/invoicing/invoiceShow'
require 'controllers/invoicing/quotationEdit'
require 'controllers/invoicing/invoiceEdit'
require 'controllers/invoicing/quotationsShow'
require 'controllers/invoicing/invoicesShow'
require 'controllers/invoicing/itemsShow'
require 'controllers/invoicing/itemShow'
require 'controllers/invoicing/itemEdit'
require 'controllers/invoicing/creditNoteShow'
require 'controllers/invoicing/purchaseOrderShow'
require 'controllers/invoicing/purchaseOrdersShow'
require 'controllers/invoicing/purchaseOrderEdit'

require 'controllers/organizer/calendarListsShow'
require 'controllers/organizer/calendarListShow'
require 'controllers/organizer/calendarListEdit'
require 'controllers/organizer/vosaeEventShow'
require 'controllers/organizer/vosaeEventEdit'