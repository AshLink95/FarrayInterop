module dlla
     use iso_C_binding
     implicit none
     type, abstract :: dlla_node
          class(dlla_node), pointer::nxt => null(), prv => null()
          integer::pos = 0
     contains
          procedure, pass::asc, gtpos
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
          subroutine asc(this, node)
               implicit none
               class(dlla_node), intent(inout), target::this
               class(dlla_node), pointer, intent(in)::node

               this%nxt => node
               node%prv => this
               node%pos = this%pos + 1
          end subroutine

          function gtpos(this, pos) result(node)
               class(dlla_node), intent(inout), target::this
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

          !finalizers
          subroutine dltr1(this)
               type(rnode1D), intent(inout)::this

               deallocate(this%array)
               this%prv%nxt => this%nxt
               this%nxt%prv => this%prv
               this%nxt => null()
               this%prv => null()
               nullify(this%nxt)
          end subroutine

          subroutine dlti1(this)
               type(inode1D), intent(inout)::this

               deallocate(this%array)
               this%prv%nxt => this%nxt
               this%nxt%prv => this%prv
               this%nxt => null()
               this%prv => null()
               nullify(this%nxt)
          end subroutine

          subroutine dltl1(this)
               type(lnode1D), intent(inout)::this

               deallocate(this%array)
               this%prv%nxt => this%nxt
               this%nxt%prv => this%prv
               this%nxt => null()
               this%prv => null()
               nullify(this%nxt)
          end subroutine

          subroutine dltc1(this)
               type(cnode1D), intent(inout)::this

               deallocate(this%array)
               this%prv%nxt => this%nxt
               this%nxt%prv => this%prv
               this%nxt => null()
               this%prv => null()
               nullify(this%nxt)
          end subroutine
end module
