#! /bin/sh


#   @@@@@@    @@@@@@@  @@@@@@@   @@@@@@@@  @@@@@@@@  @@@  @@@   @@@@@@  @@@  @@@   @@@@@@   @@@@@@@
#  @@@@@@@   @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@ @@@  @@@@@@@  @@@  @@@  @@@@@@@@  @@@@@@@
#  !@@       !@@       @@!  @@@  @@!       @@!       @@!@!@@@  !@@      @@!  @@@  @@!  @@@    @@!
#  !@!       !@!       !@!  @!@  !@!       !@!       !@!!@!@!  !@!      !@!  @!@  !@!  @!@    !@!
#  !!@@!!    !@!       @!@!!@!   @!!!:!    @!!!:!    @!@ !!@!  !!@@!!   @!@!@!@!  @!@  !@!    @!!
#   !!@!!!   !!!       !!@!@!    !!!!!:    !!!!!:    !@!  !!!   !!@!!!  !!!@!!!!  !@!  !!!    !!!
#       !:!  :!!       !!: :!!   !!:       !!:       !!:  !!!       !:! !!:  !!!  !!:  !!!    !!:
#      !:!   :!:       :!:  !:!  :!:       :!:       :!:  !:!      !:!  :!:  !:!  :!:  !:!    :!:
#  :::: ::    ::: :::  ::   :::   :: ::::   :: ::::   ::   ::  :::: ::  ::   :::  ::::: ::     ::
#  :: : :     :: :: :   :   : :  : :: ::   : :: ::   ::    :   :: : :    :   : :   : :  :      :


curr_time=$(date +%F_%H:%M:%S".png")

if [ -n $1 ]; then
    maim -s "pictures/screenshots/$1"
    echo "pictures/screenshots/$1" | xclip -selection c
else
    curr_time=$(date +%F_%H:%M:%S".png")
    maim -s ~/screenshots/$curr_time && \
    echo "$HOME/screenshots/$curr_time" | xclip -selection c
fi
