flights
nycflights13::flights
View(flights)
attach(flights)
jan1 = (filter(flights, month == 1, day == 1))

sqrt(2) ^ 2 == 2
near(sqrt(2) ^ 2, 2)
filter(flights, month == 11 | month == 12)
carrier
filter(flights, arr_delay >= 120)
filter(flights, dest == "IAH" | dest == "HOU")
filter(flights, carrier == "UA"| carrier == "AA", carrier == DL)
filter(flights, carrier %in% c("AA", "UA", "DL"))
filter(flights, month >= 7, month <= 9)
filter(flights, month %in% 7:9)
filter(flights, arr_delay > 120 & dep_delay <= 0)


names(flights)
nov_and_dec = filter(flights, month %in% c(11, 12))
View(nov_and_dec)

filter(flights, arr_delay <= 120 | dep_delay <= 120)

df = tibble(x = c(1, NA, 3))
df
filter(df, x > 1)
filter(df, is.na(x) | x > 1)
