
program main
    use :: easy
    use :: hard
    use, intrinsic :: ISO_Fortran_env
    
    implicit none
    
    ! Variables
    integer :: diff, i, game

    ! Banner
    print *, "Fair (the card game) v2.00 | Ctrl-C to exit"
    do i = 1, 22
        write (*, fmt="(1x,a,i0)", advance="no") "-"
    end do
    print *, ""

    print *, "  Choose the difficulty  :"
    print *, " 1 - Easy"
    print *, " 2 - Hard (impossible)"

    write (*, fmt="(1x,a,i0)", advance="no") "?  "
    read *, diff

    if ( diff == 1 ) then
        game = easy_game()
    else if ( diff == 2 ) then
        game = hard_game()
    else
        write (*, fmt="(1x,a,i0)", advance="yes") "Enter 1 or 2"
    end if


    if ( game == 1 ) then
        print *, "* * * YOU WON * * *"
    else if ( game == 2 ) then
        print *, "* * * YOU LOST * * *"
    else if ( game == 0 ) then
        print *, "* * * TIE * * *"
    end if

end program main
