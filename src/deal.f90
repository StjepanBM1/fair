
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
!   11  --> "Jack"
!   12  --> "Queen"
!   13  --> "King"
!   14  --> "Ace"
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

end module
