*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_test DEFINITION.


  PUBLIC SECTION.

    METHODS:
      do_a
        RAISING
          cx_gui_xml,
      do_b
        RAISING
          cx_gui_alv_grid_ext,
      do_c
        RAISING
          cx_gui_xml.

ENDCLASS.

CLASS lcl_test IMPLEMENTATION.


  METHOD do_a.

    RAISE EXCEPTION TYPE cx_gui_xml.

  ENDMETHOD.

  METHOD do_b.

    DATA: lx_error TYPE REF TO cx_gui_alv_grid_ext.


    IF 1 = 2.

      RAISE EXCEPTION lx_error.

    ELSE.

      do_c( ).

    ENDIF.



  ENDMETHOD.

  METHOD do_c.

    DATA: lx_alv TYPE REF TO cx_salv_column_unknown.

    TRY.
        RAISE EXCEPTION lx_alv. "Lagertyp gesperrt

      CATCH cx_root INTO DATA(lx_root).

        RAISE EXCEPTION TYPE cx_gui_xml "Speichern nicht möglich
          EXPORTING
            previous = lx_root.

    ENDTRY.



  ENDMETHOD.

ENDCLASS.
