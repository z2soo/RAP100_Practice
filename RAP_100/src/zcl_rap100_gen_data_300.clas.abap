CLASS zcl_rap100_gen_data_300 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_rap100_gen_data_300 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA:
      group_id   TYPE string VALUE '300',
      attachment TYPE /dmo/attachment,
      file_name  TYPE /dmo/filename,
      mime_type  TYPE /dmo/mime_type.

* clear data
    DELETE FROM zrap100_atrav300.

* insert travel demo data
    INSERT zrap100_atrav300 FROM (

        SELECT
        FROM /dmo/travel AS a
        FIELDS
            a~travel_id AS travel_id,
            a~agency_id AS agency_id,
            a~customer_id AS customer_id,
            a~begin_date AS begin_date,
            a~end_date AS end_date,
            a~booking_fee AS booking_fee,
            a~total_price AS total_price,
            a~currency_code AS currency_code,
            a~description AS description,
            CASE a~status       "N(New), P(Planned), B(Booked)
                WHEN 'N' THEN 'O'
                WHEN 'P' THEN 'O'
                WHEN 'B' THEN 'A'
                ELSE 'X'
            END AS overall_status,
            @attachment AS attachment,
            @mime_type AS mime_type,
            @file_name AS file_name,
            a~createdby AS created_by,
            a~createdat AS created_at,
            a~lastchangedby AS last_changed_by,
            a~lastchangedat AS last_changed_at,
            a~lastchangedat AS local_last_changed_at
            ORDER BY travel_id UP TO 10 ROWS
        ).

    COMMIT WORK.

    out->write( |[RAP100] Demo data generated for table ZRAP100_ATRAV{ group_id }. | ).

  ENDMETHOD.

ENDCLASS.
