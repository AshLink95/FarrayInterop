module dlla
     use iso_C_binding
     implicit none
     type, abstract :: dlla_node
          integer::pos = 0
     end type

     !1D nodes
     type, extends(dlla_node) :: fnode1D
          type(fnode1D), pointer::nxt => null(), prv => null()
          real(c_float), allocatable::array(:)
     end type

     type, extends(dlla_node) :: rnode1D
          type(rnode1D), pointer::nxt => null(), prv => null()
          real(C_double), allocatable::array(:)
     end type

     type, extends(dlla_node) :: inode1D
          type(inode1D), pointer::nxt => null(), prv => null()
          integer(c_int), allocatable::array(:)
     end type

     type, extends(dlla_node) :: lnode1D
          type(lnode1D), pointer::nxt => null(), prv => null()
          logical(c_bool), allocatable::array(:)
     end type

     type, extends(dlla_node) :: cnode1D
          type(cnode1D), pointer::nxt => null(), prv => null()
          character(c_char), allocatable::array(:)
     end type

     contains
          !associators
          function fasc1(pt, size) result(pos)
               implicit none
               type(fnode1D), pointer, intent(inout)::pt
               integer(c_int), intent(in)::size
               integer(c_int)::pos
               type(fnode1D), pointer::nn

               ALLOCATE(nn)
               ALLOCATE(nn%array(size))
               if (.not. ASSOCIATED(pt)) then
                    pt => nn
                    nn%pos = 1
               else
                    pt%nxt => nn
                    nn%prv => pt
                    nn%pos = pt%pos + 1
                    pt => nn
               endif
               pos = nn%pos
          end function

          function rasc1(pt, size) result(pos)
               implicit none
               type(rnode1D), pointer, intent(inout)::pt
               integer(c_int), intent(in)::size
               integer(c_int)::pos
               type(rnode1D), pointer::nn

               ALLOCATE(nn)
               ALLOCATE(nn%array(size))
               if (.not. ASSOCIATED(pt)) then
                    pt => nn
                    nn%pos = 1
               else
                    pt%nxt => nn
                    nn%prv => pt
                    nn%pos = pt%pos + 1
                    pt => nn
               endif
               pos = nn%pos
          end function

          function iasc1(pt, size) result(pos)
               implicit none
               type(inode1D), pointer, intent(inout)::pt
               integer(c_int), intent(in)::size
               integer(c_int)::pos
               type(inode1D), pointer::nn

               ALLOCATE(nn)
               ALLOCATE(nn%array(size))
               if (.not. ASSOCIATED(pt)) then
                    pt => nn
                    nn%pos = 1
               else
                    pt%nxt => nn
                    nn%prv => pt
                    nn%pos = pt%pos + 1
                    pt => nn
               endif
               pos = nn%pos
          end function

          function lasc1(pt, size) result(pos)
               implicit none
               type(lnode1D), pointer, intent(inout)::pt
               integer(c_int), intent(in)::size
               integer(c_int)::pos
               type(lnode1D), pointer::nn

               ALLOCATE(nn)
               ALLOCATE(nn%array(size))
               if (.not. ASSOCIATED(pt)) then
                    pt => nn
                    nn%pos = 1
               else
                    pt%nxt => nn
                    nn%prv => pt
                    nn%pos = pt%pos + 1
                    pt => nn
               endif
               pos = nn%pos
          end function

          function casc1(pt, size) result(pos)
               implicit none
               type(cnode1D), pointer, intent(inout)::pt
               integer(c_int), intent(in)::size
               integer(c_int)::pos
               type(cnode1D), pointer::nn

               ALLOCATE(nn)
               ALLOCATE(nn%array(size))
               if (.not. ASSOCIATED(pt)) then
                    pt => nn
                    nn%pos = 1
               else
                    pt%nxt => nn
                    nn%prv => pt
                    nn%pos = pt%pos + 1
                    pt => nn
               endif
               pos = nn%pos
          end function

          !getters
          function gtf1(pt, pos) result(node)
               implicit none
               type(fnode1d), pointer, intent(inout)::pt
               integer(c_int), intent(in)::pos
               type(fnode1d), pointer::node
               integer(c_int)::temp

               node => pt
               temp = node%pos
               do while (temp /= pos)
                    node => node%prv
                    if (.not. associated(node)) then
                         return
                    endif
                    temp = node%pos
               enddo
          end function

          function gtr1(pt, pos) result(node)
               implicit none
               type(rnode1d), pointer, intent(inout)::pt
               integer(c_int), intent(in)::pos
               type(rnode1d), pointer::node
               integer(c_int)::temp

               node => pt
               temp = node%pos
               do while (temp /= pos)
                    node => node%prv
                    if (.not. associated(node)) then
                         return
                    endif
                    temp = node%pos
               enddo
          end function

          function gti1(pt, pos) result(node)
               implicit none
               type(inode1d), pointer, intent(inout)::pt
               integer(c_int), intent(in)::pos
               type(inode1d), pointer::node
               integer(c_int)::temp

               node => pt
               temp = node%pos
               do while (temp /= pos)
                    node => node%prv
                    if (.not. associated(node)) then
                         return
                    endif
                    temp = node%pos
               enddo
          end function

          function gtl1(pt, pos) result(node)
               implicit none
               type(lnode1d), pointer, intent(inout)::pt
               integer(c_int), intent(in)::pos
               type(lnode1d), pointer::node
               integer(c_int)::temp

               node => pt
               temp = node%pos
               do while (temp /= pos)
                    node => node%prv
                    if (.not. associated(node)) then
                         return
                    endif
                    temp = node%pos
               enddo
          end function

          function gtc1(pt, pos) result(node)
               implicit none
               type(cnode1d), pointer, intent(inout)::pt
               integer(c_int), intent(in)::pos
               type(cnode1d), pointer::node
               integer(c_int)::temp

               node => pt
               temp = node%pos
               do while (temp /= pos)
                    node => node%prv
                    if (.not. associated(node)) then
                         return
                    endif
                    temp = node%pos
               enddo
          end function
end module
