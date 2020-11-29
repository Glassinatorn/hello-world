#! /bin/sh


#  @@@@@@@   @@@@@@@   @@@   @@@@@@@@  @@@  @@@  @@@@@@@  @@@  @@@  @@@@@@@@   @@@@@@    @@@@@@
#  @@@@@@@@  @@@@@@@@  @@@  @@@@@@@@@  @@@  @@@  @@@@@@@  @@@@ @@@  @@@@@@@@  @@@@@@@   @@@@@@@
#  @@!  @@@  @@!  @@@  @@!  !@@        @@!  @@@    @@!    @@!@!@@@  @@!       !@@       !@@
#  !@   @!@  !@!  @!@  !@!  !@!        !@!  @!@    !@!    !@!!@!@!  !@!       !@!       !@!
#  @!@!@!@   @!@!!@!   !!@  !@! @!@!@  @!@!@!@!    @!!    @!@ !!@!  @!!!:!    !!@@!!    !!@@!!
#  !!!@!!!!  !!@!@!    !!!  !!! !!@!!  !!!@!!!!    !!!    !@!  !!!  !!!!!:     !!@!!!    !!@!!!
#  !!:  !!!  !!: :!!   !!:  :!!   !!:  !!:  !!!    !!:    !!:  !!!  !!:            !:!       !:!
#  :!:  !:!  :!:  !:!  :!:  :!:   !::  :!:  !:!    :!:    :!:  !:!  :!:           !:!       !:!
#   :: ::::  ::   :::   ::   ::: ::::  ::   :::     ::     ::   ::   :: ::::  :::: ::   :::: ::
#  :: : ::    :   : :  :     :: :: :    :   : :     :     ::    :   : :: ::   :: : :    :: : :

# asking for desired brightness
BRIGHTNESS=$(printf "0.1\n0.2\n0.3\n0.4\n0.5\n0.6\n0.7\n0.8\n0.9\n1" \
    | fzf)

# setting desired brightness
xrandr --output DP-1 --brightness $BRIGHTNESS \
    --output DP-2 --brightness $BRIGHTNESS \
    --output DP-3 --brightness $BRIGHTNESS \
    --output HDMI-1 --brightness $BRIGHTNESS


