! Copyright (c) 2011, Damian Rouson, Jim Xia, and Xiaofeng Xu.
! All rights reserved.
!
! Redistribution and use in source and binary forms, with or without
! modification, are permitted provided that the following conditions are met:
!     * Redistributions of source code must retain the above copyright
!       notice, this list of conditions and the following disclaimer.
!     * Redistributions in binary form must reproduce the above copyright
!       notice, this list of conditions and the following disclaimer in the
!       documentation and/or other materials provided with the distribution.
!     * Neither the names of Damian Rouson, Jim Xia, and Xiaofeng Xu nor the
!       names of any other contributors may be used to endorse or promote products
!       derived from this software without specific prior written permission.
!
! THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
! ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
! WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
! DISCLAIMED. IN NO EVENT SHALL DAMIAN ROUSON, JIM XIA, and XIAOFENG XU BE LIABLE 
! FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
! (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
! LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
! ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
! (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
! SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

module field_factory_module
  use FEpetra_Comm, only:Epetra_Comm
  use iso_c_binding ,only :c_int
  use field_module ,only : field,initial_field
  implicit none
  private
  public :: field_factory

  type, abstract :: field_factory 
  contains 
    procedure(create_interface), deferred :: create 
  end type 

  abstract interface 
    function create_interface(this,initial,grid_resolution,comm) 
      import :: field, field_factory ,initial_field,c_int,Epetra_Comm
      class(Epetra_Comm),intent(in) :: comm
      class(field_factory), intent(in) :: this 
      class(field) ,pointer :: create_interface
      procedure(initial_field) ,pointer :: initial
      integer(c_int) ,intent(in) :: grid_resolution
    end function
  end interface
end module
