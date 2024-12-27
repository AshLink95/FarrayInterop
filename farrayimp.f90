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

          function set_double_farray1D(rank, member, pos) result(done) bind(C, name="sdf1")
               implicit none
               integer(C_int), intent(in)::rank, pos
               real(C_double), intent(in)::member
               logical::done
               type(rnode1D)::node

write(*,*) "fine till here"
               node%asll_node = gslla%get_node(pos) !ERROR here
write(*,*) "fine till here"
               node%array(rank) = member
               if (node%array(rank) == member) then
                    done = .true.
               else
                    done = .false.
               endif

               return
          end function set_double_farray1D

          function get_double_farray1D(rank, pos) result(member) bind(C, name="gdf1")
               implicit none
               integer(C_int), intent(in)::rank, pos
               real(C_double)::member
               type(rnode1D)::node

               node%asll_node = gslla%get_node(pos)
               member = node%array(rank)

               return
          end function get_double_farray1D
end module farrayimp1D
