module dlla
     use iso_C_binding
     implicit none
     type, abstract :: dlla_node
          class(dlla_node), pointer::nxt => null(), prv => null()
          integer::pos = 0
     contains
          procedure, pass::gtpos
     end type

     !1D nodes
     type, extends(dlla_node) :: rnode1D
          real(C_double), allocatable::array(:)
     contains
          final::dltr1
     end type

     type, extends(dlla_node) :: inode1D
          integer(c_int), allocatable::array(:)
     contains
          final::dlti1
     end type

     type, extends(dlla_node) :: lnode1D
          logical(c_bool), allocatable::array(:)
     contains
          final::dltl1
     end type

     type, extends(dlla_node) :: cnode1D
          character(c_char), allocatable::array(:)
     contains
          final::dltc1
     end type

     contains
          function gtpos(this, pos) result(node)
               implicit none
               class(dlla_node), target, intent(inout)::this
               integer, intent(in)::pos
               class(dlla_node), pointer::node
               integer::temp

               node => this
               temp = node%pos
               do while (temp /= pos)
                    node => node%nxt
                    if (.not. associated(node)) then
                         return
                    endif
                    temp = node%pos
               enddo
          end function

          !associators
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

          !finalizers
          subroutine dltr1(this)
               implicit none
               type(rnode1D), intent(inout)::this

               deallocate(this%array)
               this%prv%nxt => this%nxt
               this%nxt%prv => this%prv
               this%nxt => null()
               this%prv => null()
               nullify(this%nxt)
          end subroutine

          subroutine dlti1(this)
               implicit none
               type(inode1D), intent(inout)::this

               deallocate(this%array)
               this%prv%nxt => this%nxt
               this%nxt%prv => this%prv
               this%nxt => null()
               this%prv => null()
               nullify(this%nxt)
          end subroutine

          subroutine dltl1(this)
               implicit none
               type(lnode1D), intent(inout)::this

               deallocate(this%array)
               this%prv%nxt => this%nxt
               this%nxt%prv => this%prv
               this%nxt => null()
               this%prv => null()
               nullify(this%nxt)
          end subroutine

          subroutine dltc1(this)
               implicit none
               type(cnode1D), intent(inout)::this

               deallocate(this%array)
               this%prv%nxt => this%nxt
               this%nxt%prv => this%prv
               this%nxt => null()
               this%prv => null()
               nullify(this%nxt)
          end subroutine
end module
