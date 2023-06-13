
program main

    use :: deal
    use :: ai
    use, intrinsic :: ISO_Fortran_env
    
    implicit none
    
    ! Variables
    integer :: i, x, y, z
    integer :: player_card, ai_card
    integer :: player_bet, ai_bet
    integer :: player_bank, ai_bank
    
    ! Deal the cards
    player_card = deal_c()
    ai_card = deal_c()

    ! Start amount of cash
    player_bank = 100
    ai_bank = 10

    ! Get the (AI) bet
    ai_bet = ai_gen_bet()

    ! Banner
    print *, "Fair (the card game) v1,00 | Ctrl-C to exit"
    do i = 1, 22
        write (*, fmt="(1x,a,i0)", advance="no") "-"
    end do
    print *, ""

    ! User input (bet)
    write (*, fmt="(1x,a,i0)", advance="yes") "Your bank: ", player_bank
    write (*, fmt="(1x,a,i0)", advance="yes") "Your card: ", player_card
    write (*, fmt="(1x,a,i0)", advance="no") "Your bet:  "
    read *, player_bet

    if ( player_card > ai_card ) then
        print *, "* * * YOU WON * * *"
        player_bank = player_bank + ai_bet
        write (*, fmt="(1x,a,i0)", advance="yes") "AI card: ", ai_card
        write (*, fmt="(1x,a,i0)", advance="yes") "Your bank: ", player_bank
    end if

    if ( player_card < ai_card ) then
        print *, "* * * YOU LOST * * *"
        ai_bank = ai_bank + player_bet
        player_bank = player_bank - player_bet
        write (*, fmt="(1x,a,i0)", advance="yes") "AI card: ", ai_card
        write (*, fmt="(1x,a,i0)", advance="yes") "Your bank: ", player_bank
    end if

    if ( player_card == ai_card ) then
        print *, "TIE"
        write (*, fmt="(1x,a,i0)", advance="yes") "AI card: ", ai_card
        write (*, fmt="(1x,a,i0)", advance="yes") "Your bank: ", player_bank
    end if

end program main
