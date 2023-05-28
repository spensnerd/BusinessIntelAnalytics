## Install the tictactoe package
install.packages("tictactoe")

## Load the tictactoe library
library(tictactoe)

## Simulation for training ai in the game.
sim_ttt <- ttt_simulate(ttt_ai(), ttt_ai(), N = 100L
                        , verbose = FALSE, showboard = FALSE
                        , pauseif = integer(0))

## This is tie games (0), player1 wins(1), and player2 wins(2).
prop.table(table(sim_ttt))

## This is q-learning in the tictactoe package. The normal
# ai plays just randomly. the q_ttt is trained 50 times.
# Arguments
# player AI player to train
# N - number of episode, i.e. training games
# epsilon - fraction of random exploration move
# alpha - learning rate
# gamma - discount factor
# simulate - if true, conduct simulation during training
# sim_every - conduct simulation after this many training games
# N_sim - number of simulation games
# verbose - if true, progress report is shown
plaiyer_ttt <- ttt_ai()
q_ttt <- ttt_qlearn(plaiyer_ttt, N = 500
                    , epsilon = 0.25
                    , alpha = 0.6
                    , gamma = 0.5
                    , simulate = TRUE
                    , sim_every = 10
                    , N_sim = 10
                    , verbose = FALSE)

install.packages("writexl")
library(writexl)
write_xlsx(x = q_ttt
           , path = "output/w14_qlearning01.xlsx"
           , col_names = TRUE
           , format_headers = TRUE)
## Play against your trained ai with the code below. You can
# set levels 0-5
ttt(ttt_human(), ttt_ai(level = 1))
ttt(ttt_human(), ttt_ai(level = 2))
ttt(ttt_human(), ttt_ai(level = 3))
ttt(ttt_human(), ttt_ai(level = 4))
ttt(ttt_human(), ttt_ai(level = 5))

## You can have the ai go first below.
ttt( ttt_ai(level = 1), ttt_human())
ttt( ttt_ai(level = 2), ttt_human())
ttt( ttt_ai(level = 3), ttt_human())
ttt( ttt_ai(level = 4), ttt_human())
ttt( ttt_ai(level = 5), ttt_human())