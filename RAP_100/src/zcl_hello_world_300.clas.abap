CLASS zcl_hello_world_300 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.


  PROTECTED SECTION.


  PRIVATE SECTION.


ENDCLASS.



CLASS zcl_hello_world_300 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    out->write( 'HELLO WPRLD' ).
  ENDMETHOD.

ENDCLASS.
