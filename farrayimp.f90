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

          !element setters
          subroutine sdf1(rank, member, pos) bind(C)
               implicit none
               integer(c_int), intent(in)::rank
               real(c_double), intent(in)::member
               integer(c_int), intent(out)::pos
               type(rnode1D), pointer::node

               allocate(node)
               node => gtr1(ptr, pos)
               node%array(rank) = member
          end subroutine

          !element getters
end module farrayimp1D
