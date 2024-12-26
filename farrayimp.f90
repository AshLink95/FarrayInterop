module farrayimp1D
     use iso_C_binding
     use singly_linked_list_of_arrays
     implicit none

     type(asll)::gslla
     contains
          subroutine create_double_farray1D(size, pos) bind(C, name="cdf1")
               implicit none
               integer(C_int)::size, pos
               type(rnode1D)::node

               allocate(node%array(size))
               call add_node(gslla, node%asll_node)
               pos = node%rank

               return
          end subroutine create_double_farray1D

          subroutine create_int_farray1D(size, pos) bind(C, name="cif1")
               implicit none
               integer(C_int)::size, pos
               type(inode1D)::node

               allocate(node%array(size))
               call add_node(gslla, node%asll_node)
               pos = node%rank

               return
          end subroutine create_int_farray1D

          subroutine create_bool_farray1D(size, pos) bind(C, name="cbf1")
               implicit none
               integer(C_int)::size, pos
               type(lnode1D)::node

               allocate(node%array(size))
               call add_node(gslla, node%asll_node)
               pos = node%rank

               return
          end subroutine create_bool_farray1D

          subroutine create_char_farray1D(size, pos) bind(C, name="ccf1")
               implicit none
               integer(C_int)::size, pos
               type(cnode1D)::node

               allocate(node%array(size))
               call add_node(gslla, node%asll_node)
               pos = node%rank

               return
          end subroutine create_char_farray1D
end module farrayimp1D
