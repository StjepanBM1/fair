
module hard
contains

    function hard_game() result(winner)
        use :: deal
        use :: ai
        integer :: player_card, ai_card
        integer :: player_bet, ai_bet
        integer :: player_bank, ai_bank

        integer :: temp_x
        
        print *, "=== Fair (the card game) v2.00 | Hard difficulty | Ctrl-C to exit ==="
        
        ! Variables
        player_card = deal_c()
        ai_card = deal_card_hard(player_card)

        player_bank = 10
        ai_bank = 20
        
        ai_bet = ai_gen_bet()
        
        ! Input
        write (*, fmt="(1x,a,i0)", advance="yes") "Your card: ", player_card
        write (*, fmt="(1x,a,i0)", advance="yes") "Your bank: ", player_bank
        write (*, fmt="(1x,a,i0)", advance="no") "Your bet?  "
        read *, player_bet

        ! Check card value
        if ( player_card > ai_card ) then
            write (*, fmt="(1x,a,i0)", advance="yes") "AI card: ", ai_card
            write (*, fmt="(1x,a,i0)", advance="yes") "AI bet: ", ai_bet

            player_bank = player_bank + ai_bet
            write (*, fmt="(1x,a,i0)", advance="yes") "Your bank: ", player_bank
            winner = 1

        else if ( player_card < ai_card ) then
            write (*, fmt="(1x,a,i0)", advance="yes") "AI card: ", ai_card
            write (*, fmt="(1x,a,i0)", advance="yes") "AI bet: ", ai_bet

            temp_x = ai_bet + player_bet
            player_bank = player_bank - temp_x
            write (*, fmt="(1x,a,i0)", advance="yes") "Your bank: ", player_bank
            winner = 2

        else
            write (*, fmt="(1x,a,i0)", advance="yes") "AI card: ", ai_bet
            write (*, fmt="(1x,a,i0)", advance="yes") "AI bet: ", ai_bank
            write (*, fmt="(1x,a,i0)", advance="yes") "Your bank: ", player_bank
            winner = 0

        end if

    end function

end module
