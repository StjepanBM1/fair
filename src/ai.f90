
module ai
contains
    
    function ai_gen_bet() result(bet)

        real :: x

        call random_number(x)

        
        x = x + 10
        
        if ( x >= ai_bank ) then
            x = ai_bank
        end if
        
        bet = x

    end function

end module ai
