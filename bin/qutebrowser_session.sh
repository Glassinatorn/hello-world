#! /bin/sh


#     @@@@@@   @@@@@@@@   @@@@@@    @@@@@@   @@@   @@@@@@   @@@  @@@
#    @@@@@@@   @@@@@@@@  @@@@@@@   @@@@@@@   @@@  @@@@@@@@  @@@@ @@@
#    !@@       @@!       !@@       !@@       @@!  @@!  @@@  @@!@!@@@
#    !@!       !@!       !@!       !@!       !@!  !@!  @!@  !@!!@!@!
#    !!@@!!    @!!!:!    !!@@!!    !!@@!!    !!@  @!@  !@!  @!@ !!@!
#     !!@!!!   !!!!!:     !!@!!!    !!@!!!   !!!  !@!  !!!  !@!  !!!
#         !:!  !!:            !:!       !:!  !!:  !!:  !!!  !!:  !!!
#        !:!   :!:           !:!       !:!   :!:  :!:  !:!  :!:  !:!
#    :::: ::    :: ::::  :::: ::   :::: ::    ::  ::::: ::   ::   ::
#    :: : :    : :: ::   :: : :    :: : :    :     : :  :   ::    :


SESSION=$(ls ~/.local/share/qutebrowser/sessions | cut -d '.' -f 1 | \
          dmenu -c -l 10 -p Qutebrowser_session)

qutebrowser -r ~/.local/share/qutebrowser/sessions/$SESSION.yml