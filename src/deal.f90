
!
!   Cards (min. val. -> max. val.)
!   --------------
!   0
!   1
!   2
!   3
!   4
!   5
!   6
!   7
!   8
!   9
!   10
!   11
!   12
!   13
!   14
!

module deal
contains

    function deal_c() result(card)
        real :: x

        call random_number(x)
        x = x * 10
        
        if ( x > 14 ) then
            x = x - 10
        end if

        card = x

    end function

    function deal_card_hard(in_c) result(card)
        real :: x
        integer :: in_c

        call random_number(x)
        x = x * 10
        x = x + 1

        if ( x > 14 ) then
            x = x - 10
        end if

        card = x

    end function

end module
