module farrayimp1D
     use iso_C_binding
     use dlla
     implicit none

     type(lnode1D)::head
     integer::totnod = 0
     contains
          !functions (create farray, access farray, delete farray)
          subroutine cdf1(size, pos) bind(C)
               integer(c_int), intent(in)::size
               integer(c_int), intent(out)::pos
               class(rnode1d), POINTER::nn

               call asc(head,nn)
               allocate(nn%array(size))
               totnod = totnod + 1
               pos = nn%pos

               return
          end subroutine
end module farrayimp1D
