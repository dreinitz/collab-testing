## here's some random viz stuff to get us started.

# Need to install the waffle package
install.packages("waffle")

library(tidyverse)
library(haven)
library(waffle)

# EXAMPLE DATA ----
example <- c(30, 25, 20, 5, 1)
example
view(example)

# Super default version
waffle(example)

# Can customize number of rows
waffle(example, rows = 6)

# Let us make beautiful art
dumbtest <- c(16, 2, 2, 4, 3, 1, 9, 1, 9, 1, 9, 1, 2, 4, 3, 1, 8, 2, 12) 

waffle(dumbtest,
       rows = 10,
       colors = c("grey", "blue", "grey", "blue", "grey", "blue", "grey",
                        "blue", "grey", "blue", "grey", "blue", "grey", "blue",
                        "grey", "blue", "grey", "blue", "grey"),
                        legend_pos = "none")

# LS got errors here. R doesn't like

# It's upside down :(

waffle(dumbtest,
       rows = 10,
       colors = c("grey", "blue", "grey", "blue", "grey", "blue", "grey",
                        "blue", "grey", "blue", "grey", "blue", "grey", "blue",
                        "grey", "blue", "grey", "blue", "grey"),
                        legend_pos = "none",
       flip = TRUE)

# Now it's sideways :(

## dr adding this comments for testing

waffle(dumbtest,
       rows = 10,
       colors = c("grey", "blue", "grey", "blue", "grey", "blue", "grey",
                        "blue", "grey", "blue", "grey", "blue", "grey", "blue",
                        "grey", "blue", "grey", "blue", "grey"),
                        legend_pos = "none",
       reverse = TRUE)

# Hell yeah!!!!

waffle(dumbtest,
       rows = 10,
       colors = c("grey", "blue", "grey", "blue", "grey", "blue", "grey",
                        "blue", "grey", "blue", "grey", "blue", "grey", "blue",
                        "grey", "blue", "grey", "blue", "grey"),
                        legend_pos = "none",
       reverse = TRUE,
       title = "                Beautiful Art",
       xlab = "By David")

# The title wasn't centered for some reason so I added a bunch of spaces