@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZRAP100_R_TRAVELTP_300'
@ObjectModel.semanticKey: [ 'TabelID' ]
define root view entity ZRAP100_C_TRAVELTP_300
  provider contract transactional_query
  as projection on ZRAP100_R_TRAVELTP_300
{
  key TabelID,
  AgencyID,
  CustomerID,
  BeginDate,
  EndDate,
  BookingFee,
  TotalPrice,
  CurrencyCode,
  Description,
  OverallStatus,
  Attachment,
  MimeType,
  FileName,
  LocalLastChangedAt
  
}
