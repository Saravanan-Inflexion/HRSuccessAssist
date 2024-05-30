using { employeeSelfServicePortalSrv } from '../srv/service.cds';

annotate employeeSelfServicePortalSrv.Ticket with {
  employee @Common.ValueList: {
    CollectionPath: 'Employee',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: employee_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'employeeID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
    ],
  }
};
annotate employeeSelfServicePortalSrv.Ticket with {
  businessPartner @Common.ValueList: {
    CollectionPath: 'HRBusinessPartner',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: businessPartner_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'hRBusinessPartnerID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'name'
      },
    ],
  }
};
annotate employeeSelfServicePortalSrv.Ticket with @UI.DataPoint #title: {
  Value: title,
  Title: 'Title',
};
annotate employeeSelfServicePortalSrv.Ticket with @UI.DataPoint #description: {
  Value: description,
  Title: 'Description',
};
annotate employeeSelfServicePortalSrv.Ticket with @UI.DataPoint #status: {
  Value: status_code,
  Title: 'Status',
  Criticality: status.criticality,
};
annotate employeeSelfServicePortalSrv.Ticket with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#title', ID: 'Title' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#description', ID: 'Description' },
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#status', ID: 'Status' }
];
annotate employeeSelfServicePortalSrv.Ticket with @UI.HeaderInfo: {
  TypeName: 'Ticket',
  TypeNamePlural: 'Tickets',
  Title: { Value: ticketID }
};
annotate employeeSelfServicePortalSrv.Ticket with {
  ID @UI.Hidden
};
annotate employeeSelfServicePortalSrv.Ticket with @UI.Identification: [{ Value: ticketID }];
annotate employeeSelfServicePortalSrv.Ticket with {
  ticketID @Common.Label: 'Id';
  title @Common.Label: 'Title';
  description @Common.Label: 'Description';
  status @Common.Label: 'Status';
  priority @Common.Label: 'Priority';
  employee @Common.Label: 'Employee';
  businessPartner @Common.Label: 'HR Business Partner';
  resolutions @Common.Label: 'Resolutions'
};
annotate employeeSelfServicePortalSrv.Ticket with {
  ID @Common.Text: { $value: ticketID, ![@UI.TextArrangement]: #TextOnly };
  employee @Common.Text: { $value: employee.employeeID, ![@UI.TextArrangement]: #TextOnly };
  businessPartner @Common.Text: { $value: businessPartner.hRBusinessPartnerID, ![@UI.TextArrangement]: #TextOnly };
  status @Common.Text : { $value: status.name, ![@UI.TextArrangement]: #TextOnly };
  priority @Common.Text : { $value: priority.name, ![@UI.TextArrangement]: #TextOnly };
};
annotate employeeSelfServicePortalSrv.Ticket with {
  status @Common.ValueListWithFixedValues;
  priority @Common.ValueListWithFixedValues;
};
annotate employeeSelfServicePortalSrv.Ticket with @UI.SelectionFields: [
  employee_ID,
  businessPartner_ID,
  status_code,
  priority_code
];
annotate employeeSelfServicePortalSrv.Ticket with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: ticketID },
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: status_code },
    { $Type: 'UI.DataField', Value: priority_code },
    { $Type: 'UI.DataField', Label: 'Employee', Value: employee_ID },
    { $Type: 'UI.DataField', Label: 'HR Business Partner', Value: businessPartner_ID }
];
annotate employeeSelfServicePortalSrv.Ticket with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: ticketID },
    { $Type: 'UI.DataField', Value: title },
    { $Type: 'UI.DataField', Value: description },
    { $Type: 'UI.DataField', Value: status_code },
    { $Type: 'UI.DataField', Value: priority_code },
    { $Type: 'UI.DataField', Label: 'Employee', Value: employee_ID },
    { $Type: 'UI.DataField', Label: 'HR Business Partner', Value: businessPartner_ID }
]};
annotate employeeSelfServicePortalSrv.Resolution with @UI.LineItem #Ticket_resolutions: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: resolutionID }
];
annotate employeeSelfServicePortalSrv.Ticket with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
  { $Type: 'UI.ReferenceFacet', ID: 'resolutions', Label: 'Resolutions', Target: 'resolutions/@UI.LineItem#Ticket_resolutions' }
];
annotate employeeSelfServicePortalSrv.Employee with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate employeeSelfServicePortalSrv.Employee with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name', ID: 'Name' }
];
annotate employeeSelfServicePortalSrv.Employee with @UI.HeaderInfo: {
  TypeName: 'Employee',
  TypeNamePlural: 'Employees',
  Title: { Value: employeeID }
};
annotate employeeSelfServicePortalSrv.Employee with {
  ID @UI.Hidden
};
annotate employeeSelfServicePortalSrv.Employee with @UI.Identification: [{ Value: employeeID }];
annotate employeeSelfServicePortalSrv.Employee with {
  employeeID @Common.Label: 'Id';
  name @Common.Label: 'Name';
  tickets @Common.Label: 'Tickets'
};
annotate employeeSelfServicePortalSrv.Employee with {
  ID @Common.Text: { $value: employeeID, ![@UI.TextArrangement]: #TextOnly };
};
annotate employeeSelfServicePortalSrv.Employee with @UI.SelectionFields: [
  employeeID
];
annotate employeeSelfServicePortalSrv.Employee with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: employeeID },
    { $Type: 'UI.DataField', Value: name }
];
annotate employeeSelfServicePortalSrv.Employee with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: employeeID },
    { $Type: 'UI.DataField', Value: name }
]};
annotate employeeSelfServicePortalSrv.Employee with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];
annotate employeeSelfServicePortalSrv.HRBusinessPartner with @UI.DataPoint #name: {
  Value: name,
  Title: 'Name',
};
annotate employeeSelfServicePortalSrv.HRBusinessPartner with @UI.HeaderFacets: [
 { $Type : 'UI.ReferenceFacet', Target : '@UI.DataPoint#name', ID: 'Name' }
];
annotate employeeSelfServicePortalSrv.HRBusinessPartner with @UI.HeaderInfo: {
  TypeName: 'HR Business Partner',
  TypeNamePlural: 'HR Business Partners',
  Title: { Value: hRBusinessPartnerID }
};
annotate employeeSelfServicePortalSrv.HRBusinessPartner with {
  ID @UI.Hidden
};
annotate employeeSelfServicePortalSrv.HRBusinessPartner with @UI.Identification: [{ Value: hRBusinessPartnerID }];
annotate employeeSelfServicePortalSrv.HRBusinessPartner with {
  hRBusinessPartnerID @Common.Label: 'Id';
  name @Common.Label: 'Name';
  tickets @Common.Label: 'Tickets'
};
annotate employeeSelfServicePortalSrv.HRBusinessPartner with {
  ID @Common.Text: { $value: hRBusinessPartnerID, ![@UI.TextArrangement]: #TextOnly };
};
annotate employeeSelfServicePortalSrv.HRBusinessPartner with @UI.SelectionFields: [
  hRBusinessPartnerID
];
annotate employeeSelfServicePortalSrv.HRBusinessPartner with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: hRBusinessPartnerID },
    { $Type: 'UI.DataField', Value: name }
];
annotate employeeSelfServicePortalSrv.HRBusinessPartner with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: hRBusinessPartnerID },
    { $Type: 'UI.DataField', Value: name }
]};
annotate employeeSelfServicePortalSrv.HRBusinessPartner with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];
annotate employeeSelfServicePortalSrv.Resolution with {
  ticket @Common.ValueList: {
    CollectionPath: 'Ticket',
    Parameters    : [
      {
        $Type            : 'Common.ValueListParameterInOut',
        LocalDataProperty: ticket_ID,
        ValueListProperty: 'ID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'ticketID'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'title'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'description'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'status'
      },
      {
        $Type            : 'Common.ValueListParameterDisplayOnly',
        ValueListProperty: 'priority'
      },
    ],
  }
};
annotate employeeSelfServicePortalSrv.Resolution with @UI.HeaderInfo: {
  TypeName: 'Resolution',
  TypeNamePlural: 'Resolutions',
  Title: { Value: resolutionID }
};
annotate employeeSelfServicePortalSrv.Resolution with {
  ID @UI.Hidden
};
annotate employeeSelfServicePortalSrv.Resolution with @UI.Identification: [{ Value: resolutionID }];
annotate employeeSelfServicePortalSrv.Resolution with {
  resolutionID @Common.Label: 'Id';
  ticket @Common.Label: 'Ticket'
};
annotate employeeSelfServicePortalSrv.Resolution with {
  ID @Common.Text: { $value: resolutionID, ![@UI.TextArrangement]: #TextOnly };
  ticket @Common.Text: { $value: ticket.ticketID, ![@UI.TextArrangement]: #TextOnly };
};
annotate employeeSelfServicePortalSrv.Resolution with @UI.SelectionFields: [
  ticket_ID
];
annotate employeeSelfServicePortalSrv.Resolution with @UI.LineItem: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: resolutionID },
    { $Type: 'UI.DataField', Label: 'Ticket', Value: ticket_ID }
];
annotate employeeSelfServicePortalSrv.Resolution with @UI.FieldGroup #Main: {
  $Type: 'UI.FieldGroupType', Data: [
    { $Type: 'UI.DataField', Value: ID },
    { $Type: 'UI.DataField', Value: resolutionID },
    { $Type: 'UI.DataField', Label: 'Ticket', Value: ticket_ID }
]};
annotate employeeSelfServicePortalSrv.Resolution with @UI.Facets: [
  { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
];