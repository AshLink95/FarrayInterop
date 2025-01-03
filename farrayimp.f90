module farrayimp1D
     use iso_C_binding
     use dlla
     implicit none

     type(rnode1D), pointer::ptr
     type(inode1D), pointer::pti
     type(lnode1D), pointer::ptl
     type(cnode1D), pointer::ptc
     integer::totnod = 0
     contains
          ! farray creators
          subroutine cdf1(size, pos) bind(C)
               implicit none
               integer(c_int), intent(in)::size
               integer(c_int), intent(out)::pos

               pos = rasc1(ptr, size)
               totnod = totnod + 1
          end subroutine

          subroutine cif1(size, pos) bind(C)
               implicit none
               integer(c_int), intent(in)::size
               integer(c_int), intent(out)::pos

               pos = iasc1(pti, size)
               totnod = totnod + 1
          end subroutine

          subroutine cbf1(size, pos) bind(C)
               implicit none
               integer(c_int), intent(in)::size
               integer(c_int), intent(out)::pos

               pos = lasc1(ptl, size)
               totnod = totnod + 1
          end subroutine

          subroutine ccf1(size, pos) bind(C)
               implicit none
               integer(c_int), intent(in)::size
               integer(c_int), intent(out)::pos

               pos = casc1(ptc, size)
               totnod = totnod + 1
          end subroutine

          ! farray element setters
          subroutine sdf1(rank, member, pos) bind(C)
               implicit none
               integer(c_int), intent(in)::rank, pos
               real(c_double), intent(in)::member
               type(rnode1D), pointer::node

               allocate(node)
               node => gtr1(ptr, pos)
               node%array(rank) = member
          end subroutine

          subroutine sif1(rank, member, pos) bind(C)
               implicit none
               integer(c_int), intent(in)::rank, member, pos
               type(inode1D), pointer::node

               allocate(node)
               node => gti1(pti, pos)
               node%array(rank) = member
          end subroutine

          subroutine sbf1(rank, member, pos) bind(C)
               implicit none
               integer(c_int), intent(in)::rank, pos
               logical(c_bool), intent(in)::member
               type(lnode1D), pointer::node

               allocate(node)
               node => gtl1(ptl, pos)
               node%array(rank) = member
          end subroutine

          subroutine scf1(rank, member, pos) bind(C)
               implicit none
               integer(c_int), intent(in)::rank, pos
               character(c_char), intent(in)::member
               type(cnode1D), pointer::node

               allocate(node)
               node => gtc1(ptc, pos)
               node%array(rank) = member
          end subroutine

          !farray element getters
          function gdf1(rank, pos) result(member) bind(C)
               implicit none
               integer(C_int), intent(in)::rank, pos
               real(c_double)::member
               type(rnode1D), pointer::node

               allocate(node)
               node => gtr1(ptr, pos)
               member = node%array(rank)
          end function

          function gif1(rank, pos) result(member) bind(C)
               implicit none
               integer(c_int), intent(in)::rank, pos
               integer(c_int)::member
               type(inode1D), pointer::node

               allocate(node)
               node => gti1(pti, pos)
               member = node%array(rank)
          end function

          function gbf1(rank, pos) result(member) bind(C)
               implicit none
               integer(c_int), intent(in)::rank, pos
               logical(c_bool)::member
               type(lnode1D), pointer::node

               allocate(node)
               node => gtl1(ptl, pos)
               member = node%array(rank)
          end function

          function gcf1(rank, pos) result(member) bind(C)
               implicit none
               integer(c_int), intent(in)::rank, pos
               character(c_char)::member
               type(cnode1D), pointer::node

               allocate(node)
               node => gtc1(ptc, pos)
               member = node%array(rank)
          end function
end module farrayimp1D
