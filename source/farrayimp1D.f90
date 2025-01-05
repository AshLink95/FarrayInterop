module farrayimp1D
     use iso_C_binding
     use dlla
     implicit none

     type(fnode1D), pointer::ptf
     type(rnode1D), pointer::ptr
     type(inode1D), pointer::pti
     type(lnode1D), pointer::ptl
     type(cnode1D), pointer::ptc
     contains
          ! farray creators
          subroutine cff1(size, pos) bind(C)
               implicit none
               integer(c_int), intent(in)::size
               integer(c_int), intent(out)::pos

               pos = fasc1(ptf, size)
          end subroutine

          subroutine cdf1(size, pos) bind(C)
               implicit none
               integer(c_int), intent(in)::size
               integer(c_int), intent(out)::pos

               pos = rasc1(ptr, size)
          end subroutine

          subroutine cif1(size, pos) bind(C)
               implicit none
               integer(c_int), intent(in)::size
               integer(c_int), intent(out)::pos

               pos = iasc1(pti, size)
          end subroutine

          subroutine cbf1(size, pos) bind(C)
               implicit none
               integer(c_int), intent(in)::size
               integer(c_int), intent(out)::pos

               pos = lasc1(ptl, size)
          end subroutine

          subroutine ccf1(size, pos) bind(C)
               implicit none
               integer(c_int), intent(in)::size
               integer(c_int), intent(out)::pos

               pos = casc1(ptc, size)
          end subroutine

          ! farray element setters
          subroutine sff1(rank, member, pos) bind(C)
               implicit none
               integer(c_int), intent(in)::rank, pos
               real(c_float), intent(in)::member
               type(fnode1D), pointer::node

               allocate(node)
               node => gtf1(ptf, pos)
               node%array(rank) = member
          end subroutine

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
          function gff1(rank, pos) result(member) bind(C)
               implicit none
               integer(C_int), intent(in)::rank, pos
               real(c_float)::member
               type(fnode1D), pointer::node

               allocate(node)
               node => gtf1(ptf, pos)
               member = node%array(rank)
          end function

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
