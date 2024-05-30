using { sap.common.CodeList } from '@sap/cds/common';

namespace employeeSelfServicePortal;

entity TicketStatusCodeList : CodeList {
  @Common.Text : { $value: name, ![@UI.TextArrangement]: #TextOnly }
  key code : String(20);
  criticality : Integer;
}

entity TicketPriorityCodeList : CodeList {
  @Common.Text : { $value: name, ![@UI.TextArrangement]: #TextOnly }
  key code : String(20);
}

entity Ticket {
  key ID: UUID;
  ticketID: String(50) @assert.unique @mandatory;
  title: String(50);
  description: String;
  status: Association to TicketStatusCodeList;
  priority: Association to TicketPriorityCodeList;
  employee: Association to Employee;
  businessPartner: Association to HRBusinessPartner;
  resolutions: Association to many Resolution on resolutions.ticket = $self;
}

entity Employee {
  key ID: UUID;
  employeeID: String(50) @assert.unique @mandatory;
  name: String(50);
  tickets: Association to many Ticket on tickets.employee = $self;
}

entity HRBusinessPartner {
  key ID: UUID;
  hRBusinessPartnerID: String(50) @assert.unique @mandatory;
  name: String(50);
  tickets: Association to many Ticket on tickets.businessPartner = $self;
}

entity Resolution {
  key ID: UUID;
  resolutionID: String(50) @assert.unique @mandatory;
  ticket: Association to Ticket;
}
