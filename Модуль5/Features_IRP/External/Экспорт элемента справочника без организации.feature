#language: ru

@tree
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Загрузка элемента справочника Соглашения без прикрепленной организации

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: загрузка элемента справочника Соглашения без прикрепленной организации

	// Справочник.Agreements

	И я проверяю или создаю для справочника "Agreements" объекты:
		| 'Ref'                                                                | 'DeletionMark' | 'Code' | 'Number' | 'Date'               | 'PartnerSegment' | 'Partner'                                                          | 'Company' | 'PriceType'                                                          | 'ItemSegment' | 'StartUsing'         | 'EndOfUse'           | 'ManagerSegment' | 'PriceIncludeTax' | 'DaysBeforeDelivery' | 'Store'                                                          | 'Type'                         | 'LegalName' | 'CurrencyMovementType'                                                                            | 'ApArPostingDetail'                   | 'StandardAgreement' | 'Kind'                        | 'UseCreditLimit' | 'CreditLimitAmount' | 'PaymentTerm' | 'Description_en'  | 'Description_hash' | 'Description_ru' | 'Description_tr' |
		| 'e1cib/data/Catalog.Agreements?ref=83e9d4ae527f39c011ec7d0987ecc334' | 'False'        | 10     | ''       | '01.01.0001 0:00:00' | ''               | 'e1cib/data/Catalog.Partners?ref=b762b13668d0905011eb7663e35d794b' | ''        | 'e1cib/data/Catalog.PriceTypes?ref=b762b13668d0905011eb76684b9f6866' | ''            | '01.01.0001 0:00:00' | '01.01.0001 0:00:00' | ''               | 'False'           |                      | 'e1cib/data/Catalog.Stores?ref=b762b13668d0905011eb76684b9f6861' | 'Enum.AgreementTypes.Customer' | ''          | 'e1cib/data/ChartOfCharacteristicTypes.CurrencyMovementType?ref=b762b13668d0905011eb7663e35d796b' | 'Enum.ApArPostingDetail.ByAgreements' | ''                  | 'Enum.AgreementKinds.Regular' | 'False'          |                     | ''            | 'Без организации' | ''                 | ''               | ''               |
