! Module to initialize the variables for the model

subroutine init

!DIR$ freeform

  use params
  use model_vars

  implicit none

  !Iterating variables
  integer :: i1, i2

  ! creating dimensions
  do i1 = 1, nx
    x(i1) = xstart + dx*float(i1-1)
  end do

  do i1 = 1, ny
    y(i1) = ystart + dy*float(i1-1)
  end do

  ! Initializing 2D meshgrid
  call meshgrid2d(x, y, xx, yy, nx, ny)

  do i1 = 1, nt
    t(i1) = tstart + dt*float(i1-1)
  end do

  ! setting up the coriolis matrix
  do i1 = 1, nx
    do i2 = 1,ny
      f(i1, i2) = 2.0*omega*cos(pi*y(i1)/Lx)*sin(pi*y(i2)/Ly)
    end do
  end do

  print *, 'Initialized dimensions!'

  ! initializing variables
  u(:,:,1) = 0.0
  v(:,:,1) = 0.0
  h(:,:,1) = H0 - perturb*exp(-((xx)**2.0 + (yy)**2.0)/sigma2perturb)

end subroutine init

subroutine meshgrid2d(x, y, x2, y2, nx, ny)

  implicit none

  integer, intent(in) :: nx, ny
  real*8, intent(in) :: x(nx), y(ny)
  real*8, intent(out) :: x2(nx, ny), y2(nx, ny)
  integer :: i


  do i=1,nx
    x2(i,:)=x(i)
  end do

  do i=1,ny
    y2(:,i)=y(i)
  end do

!  x2 = spread(x, 1, size(y))
!  y2 = spread(y, 2, size(x))

end subroutine meshgrid2d
