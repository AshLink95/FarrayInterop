module singly_linked_list_of_arrays
     use iso_C_binding
     implicit none
     type asll
          class(asll_node), pointer::head => null()
          class(asll_node), pointer::tail => null()
          integer::size
     contains
          procedure, pass::add_node
          procedure, pass::remove_node
          procedure, pass::get_node
     end type

     type asll_node
          class(asll_node), pointer::next_node => null()
          integer::rank
     contains
          final::delete  !TODO: create cleanup for all children
     end type

     !1D nodes
     type, extends(asll_node) :: rnode1D
          real(C_double), allocatable::array(:)
     end type rnode1D

     type, extends(asll_node) :: inode1D
          integer(C_int), allocatable::array(:)
     end type inode1D

     type, extends(asll_node) :: lnode1D
          logical(C_bool), allocatable::array(:)
     end type lnode1D

     type, extends(asll_node) :: cnode1D
          character(C_char), allocatable::array(:)
     end type cnode1D

     contains
          subroutine add_node(this,node)
               implicit none

               class(asll)::this
               class(asll_node), target::node
               integer::temp

               if (.not. associated(this%head)) then
                    this%head => node
                    this%tail => node
                    this%size = 1
               else
                    this%tail%next_node => node
                    this%tail => node
                    this%size = this%size + 1
               endif
               node%rank = this%size

               return
          end subroutine add_node

          subroutine remove_node(this,rank)
               implicit none
               
               class(asll)::this
               integer, intent(in)::rank
               class(asll_node), pointer::node, temp
               
               if (rank==1) then
                    temp => this%head
                    this%head => this%head%next_node
                    call delete(temp)
               else
                    node => this%get_node(rank)
                    if (.not. associated(node)) then
                         return
                    else
                         node => this%get_node(rank-1)
                         temp => node%next_node
                         if (associated(node%next_node, this%tail)) then
                              node%next_node => null()
                              this%tail => node
                         else 
                              node%next_node => node%next_node%next_node
                         endif
                         call delete(temp)
                    endif
               endif

               temp => node%next_node
               if (associated(temp, this%tail)) then
                    return
               endif
               do while (.not. associated(temp, this%tail))
                    temp%rank = temp%rank - 1
                    temp => temp%next_node
               enddo
               this%size = this%size + 1

               return
          end subroutine remove_node

          function get_node(this,rank) result(node)
               implicit none

               class(asll)::this
               integer, intent(in)::rank
               class(asll_node), pointer::node
               class(asll_node), pointer::node_ptr => null()
               integer::temp, last

               last = 1+this%size
write(*,*) last
write(*,*) rank
               if ((.not. associated(this%tail)) .or. rank<1) then
                    node => null()
               else
                    node_ptr=>this%head
                    temp = 0
                    do while (temp /= rank)
write(*,*) "hedhi ka3ba"
write(*,*) temp
                         if (temp == last) then
                              node => null()
write(*,*) "hedhi e5ber ka3ba"
                              return
                         endif
                         node_ptr => node_ptr%next_node
                         temp = node_ptr%rank
                    enddo
               endif

               node => node_ptr

               return
          end function get_node

          subroutine delete(this)
               type(asll_node)::this
               nullify(this%next_node)
          end subroutine delete
end module singly_linked_list_of_arrays
