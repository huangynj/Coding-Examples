

PROGRAM test
IMPLICIT NONE

call parallel_work
contains
    subroutine long_running_task()
    end subroutine long_running_task

    subroutine loop_body(nx,ny)
    integer :: nx,ny
    end subroutine loop_body

    subroutine parallel_work
    integer:: i , j
!$omp taskgroup
!$omp task
        call long_running_task()
!$omp end task
!$omp taskloop private(j) grainsize(500) nogroup
        do i=1,10000
            do j=1,i
                call loop_body(i, j)
            end do
        end do
!$omp end taskloop
!$omp end taskgroup
    end subroutine

END PROGRAM