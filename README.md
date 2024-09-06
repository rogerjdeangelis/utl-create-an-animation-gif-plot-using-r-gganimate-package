# utl-create-an-animation-gif-plot-using-r-gganimate-package
Create an animation gif plot using r gganimate package 
    %let pgm=utl-create-an-animation-gif-plot-using-r-gganimate-package;

    Create an animation gif plot using r gganimate package

    animated graph
    https://tinyurl.com/f3n2hc7t
    https://github.com/rogerjdeangelis/utl-create-an-animation-gif-plot-using-r-gganimate-package/blob/main/drawline.gif

    stackoverflow r
    https://stackoverflow.com/questions/78953352/animate-a-mwe-gif-in-r

    by ahorn
    https://stackoverflow.com/users/4585384/ahorn

    Related repo
    https://github.com/rogerjdeangelis/utl_fun_with_python_and_the_game_of_life_intro_to_animation

    * CREATE THIS ANIMATION

    /**************************************************************************************************************************/
    /*                                                                                                                        */
    /*    FRAME 1 (slowly draws line 1)          FRAME 2 (slowly draws line 2)                                                */
    /*                                                                                                                        */
    /*   -+-------------+-------------+--       -+-------------+-------------+--                                              */
    /* 4 +           x                   +    4 +           x                   +                                             */
    /*   |          /                    |      |          / \                  |                                             */
    /* 0 |         /                     |    0 |         /   \                 |                                             */
    /*   |     1  /                      |      |        /     \                |                                             */
    /*   |       /                       |      |       /       \               |                                             */
    /* 3 +      /                        +    3 +      /         x              +                                             */
    /*   |     /                         |      |     /                         |                                             */
    /*   |    /                          |      |    /                          |                                             */
    /*   |   /                           |      |   /                           |                                             */
    /*   |  /                            |      |  /                            |                                             */
    /* 2 + /                             +    2 + /                             +                                             */
    /*   -+-------------+-------------+--       -+-------------+-------------+--                                              */
    /*    1             2             3          1             2             3                                                */
    /*                                                                                                                        */
    /*                  T                                      T                                                              */
    /*                                                                                                                        */
    /**************************************************************************************************************************/


    /*                   _      ___
    (_)_ __  _ __  _   _| |_   ( _ )    _ __  _ __ ___   ___ ___  ___ ___
    | | `_ \| `_ \| | | | __|  / _ \/\ | `_ \| `__/ _ \ / __/ _ \/ __/ __|
    | | | | | |_) | |_| | |_  | (_>  < | |_) | | | (_) | (_|  __/\__ \__ \
    |_|_| |_| .__/ \__,_|\__|  \___/\/ | .__/|_|  \___/ \___\___||___/___/
            |_|                        |_|
    */

    %utl_rbeginx;
    parmcards4;
    library("ggplot2")
    library("gifski")
    library("gganimate")
    library("dplyr")
    library("lubridate")
    animate(ggplot(tribble(
    ~time,          ~y,
    "2020-01-01",   2,
    "2020-02-01",   4,
    "2020-03-01",   3
    ) %>% mutate(time = as.numeric(ymd(time)))) +
        geom_line(aes(x=time, y=y)) +
        transition_reveal(time),
        renderer = gifski_renderer(file = "d:/gif/drawline.gif"))
    ;;;;
    %utl_rendx;


    /**************************************************************************************************************************/
    /*                                                                                                                        */
    /*    FRAME 1 (slowly draws line 1)          FRAME 2 (slowly draws line 2)                                                */
    /*                                                                                                                        */
    /*   -+-------------+-------------+--       -+-------------+-------------+--                                              */
    /* 4 +           x                   +    4 +           x                   +                                             */
    /*   |          /                    |      |          / \                  |                                             */
    /* 0 |         /                     |    0 |         /   \   2             |                                             */
    /*   |     1  /                      |      |        /     \                |                                             */
    /*   |       /                       |      |       /       \               |                                             */
    /* 3 +      /                        +    3 +      /         x              +                                             */
    /*   |     /                         |      |     /                         |                                             */
    /*   |    /                          |      |    /                          |                                             */
    /*   |   /                           |      |   /                           |                                             */
    /*   |  /                            |      |  /                            |                                             */
    /* 2 + /                             +    2 + /                             +                                             */
    /*   -+-------------+-------------+--       -+-------------+-------------+--                                              */
    /*    1             2             3          1             2             3                                                */
    /*                                                                                                                        */
    /*                  T                                      T                                                              */
    /*                                                                                                                        */
    /**************************************************************************************************************************/


     /*              _
      ___ _ __   __| |
     / _ \ `_ \ / _` |
    |  __/ | | | (_| |
     \___|_| |_|\__,_|

    */
