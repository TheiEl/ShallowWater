! THis is the saver module

subroutine data_saver

  use params
  use model_vars

  implicit none

  integer :: io_error
  integer :: i,j,k

  open(unit=20,file='ShallowWater.py', status='new', action='write', iostat=io_error)
  
    write(20,'(A,I)') 'nt = ', nt

    write(20,'(A)', advance='no') 'data_array = ['

    if ( io_error == 0) then

      do k=1,nt

        write(20,'(A)', advance='no') '['

        do j=1,ny
      
          write(20,'(A)', advance='no') '['
      
          do i=1,nx
          
            write(20,'(A,F,A,F,A,F,A,F,A)', advance='no') '[', x(i), ',', y(j), ',', h(i,j,k), ',', t(k), ']'

            if (i < nx) write(20,'(A)', advance='no') ',' 
         
          end do

          write(20,'(A)', advance='no') ']'

          if (j < ny) write(20,'(A)', advance='no') ','
       
        end do

        write(20,'(A)', advance='no') ']'
       
        if (k < nt) write(20,'(A)', advance='no') ','

        print *, 'Writing done for timestep n = ', k,' of ', nt
     
      end do
      
      write(20,'(A)', advance='no') ']'

    else

      write(*,*) 'Beim Öffnen der Datei ist ein Fehler Nr.', io_error,' aufgetreten' 
    
    end if

  close(unit=20)

end subroutine data_saver
