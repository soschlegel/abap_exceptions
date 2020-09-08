CLASS zcl_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .




  PUBLIC SECTION.

    INTERFACES: if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TRY.

        DATA(lo_test) = NEW lcl_test( ).

        lo_test->do_a( ).

        lo_test->do_b( ).

      CATCH cx_root INTO DATA(lx_error).

        WHILE lx_error IS BOUND.

          out->write( lx_error->get_text( ) ).

          lx_error = lx_error->previous.

        ENDWHILE.

        RETRY.


    ENDTRY.

  ENDMETHOD.

ENDCLASS.
