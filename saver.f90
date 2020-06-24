! This is the saver module

subroutine data_saver

  use params
  use model_vars

  implicit none

  integer :: i,j,k

  open(unit=20,file='xx.csv', status='new', action='write')
  open(unit=21,file='yy.csv', status='new', action='write')
  open(unit=22,file='h.csv', status='new', action='write')
  open(unit=23,file='n.csv', status='new', action='write')

    write(23,'(I,A,I,A,I)') nx, ',', ny, ',', pnt


    do i=1,nx

      do j=1,(ny-1)
        write(20,'(F,A)', advance='no') x(i), ','
        write(21,'(F,A)', advance='no') y(j), ','
        write(22,'(F,A)', advance='no') h(i,j,1), ','
      end do

        write(20,'(F)', advance='yes') x(i)
        write(21,'(F)', advance='yes') y(ny)
        write(22,'(F,A)', advance='yes') h(i,j,1)

    end do

    do k=2,pnt
 
      write(*,'(A,I,A,I)') 'Saving data for timestep number ', k-1, ' of ', pnt-1

      do i=1,nx
        
        do j=1,(ny-1)
          write(22,'(F,A)', advance='no') h(i,j,(k-1)*dnt), ','
        end do
        
        write(22,'(F)', advance='yes') h(i,ny,(k-1)*dnt)
        
      end do
    end do

  close(unit=21)
  close(unit=22)
  close(unit=23)
  close(unit=24)

end subroutine data_saver
