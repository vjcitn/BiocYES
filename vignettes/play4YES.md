# A deck of cards as an R vector

    library(play4YES)
    set.seed(1234)  # reproducible
    deck = build_deck()
    deck

# Is it a fair deck?

    table(suits(deck), faces(deck))

Make a biased deck:

    bdeck = deck
    bdeck[3] = bdeck[18]
    table(suits(bdeck), faces(bdeck))

# Fairness assessed by top card in a series of deals

We’ll use the built-in function `sample` to simulate shuffles of the
deck. `top_card` gives the card at top of deck.

    shuffle = sample
    top_card = function(x) x[1]
    t1 = top_card(shuffle(deck))
    t1
    suits(t1)

## Using the fair deck

We’ll take the top cards for each of 100 shuffles and examine the suit.

    table( replicate(100, suits(top_card(shuffle(deck)))) )

We should see about 25 for each suit. Are we close enough?

## Using the biased deck

    table( replicate(100, suits(top_card(shuffle(bdeck)))) )

## Increasing the “sample size”

Variability can mask structural bias. If we create statistics based on
more observations, we can start to unearth it.

    table( replicate(10000, suits(top_card(shuffle(deck)))) )
    table( replicate(10000, suits(top_card(shuffle(bdeck)))) )

# A finer-grained problem: the face, not the suit

There are 4 different suits, but 13 different faces. Is the bias
discernible with this procedure?

    table( replicate(100, faces(top_card(shuffle(deck)))) )
    table( replicate(100, faces(top_card(shuffle(bdeck)))) )

If we make 10000 shuffles, we expect each face to appear 10000/13 =
769.230…. times.

    tfair <- table( replicate(10000, faces(top_card(shuffle(deck)))) )
    tfair
    tbias <- table( replicate(10000, faces(top_card(shuffle(bdeck)))) )
    tbias

We can plot the observed frequencies of appearance of each face.

    library(beeswarm)
    beeswarm(list(fair=tfair,biased=tbias), ylab="Top card face frequencies")

With the biased deck, one face has depleted frequency, one enhanced.
