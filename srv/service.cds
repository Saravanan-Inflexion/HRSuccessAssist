using { employeeSelfServicePortal } from '../db/schema.cds';

service employeeSelfServicePortalSrv {
  @odata.draft.enabled
  entity Ticket as projection on employeeSelfServicePortal.Ticket;
  @odata.draft.enabled
  entity Employee as projection on employeeSelfServicePortal.Employee;
  @odata.draft.enabled
  entity HRBusinessPartner as projection on employeeSelfServicePortal.HRBusinessPartner;
  @odata.draft.enabled
  entity Resolution as projection on employeeSelfServicePortal.Resolution;
}