# Task 2
# exploratory data analysis on Global Terrorism dataset
terrorism = read.csv("globalterrorismdb_0718dist.csv")
# dropping irrelevant columns
#data = subset(terrorism, select = -c(eventid, approxdate, city, latitude, longitude, summary, crit1, crit2,
#                                     crit3, doubtterr, alternative, alternative_txt, attacktype2, attacktype2_txt, attacktype3, attacktype3_txt,
#                                     targsubtype1, targsubtype1_txt, corp1, targsubtype2, targsubtype2_txt, targsubtype3, targtype3_txt, targsubtype3_txt,
#                                     corp3, target3, gsubname, gsubname2, gsubname3, guncertain1, guncertain2, guncertain3, )
names(terrorism)
# including only relevant column for Analysis
data = terrorism %>% select(c(iyear, iday, imonth, extended, country_txt, region_txt,
                       provstate, specificity, vicinity, multiple, success, suicide, attacktype1_txt, targtype1_txt, natlty1_txt,
                       gname, nkill, weaptype1_txt, nkillus, nkillter, nwoundte, nwoundus, nwound, property, nhours, ndays)) 
names(data)
dim(data)
str(data)
glimpse(data)

max(iday)
min(iday)
which(data$iday == 0) ## reports the number of obs in iday colum
# that has 0 value and the row number.
# 891 rows have 0 value in that column.


data1 = filter(data, iday != 0) # removing days with 0 value
data1
which(data1$iday == 0)
# so we see that all days with 0 value are removed


# Finding number of missing values in each variable
sum(is.na(nkill)) # missing values in nkill
sum(is.na(suicide)) # missing values in suicide
sum(is.na(weaptype1_txt)) # missing values in weaptype1_txt

casualities = length(data1$nkill) + length(data1$nwound) - 
  sum(is.na(data1$nkill)) - sum(is.na(data1$nwound)) 
casualities # so we have 335321 casualities in total

hist(iyear, main = "Number of terrorist activities each year",
     xlab = "Year", ylab = "count", col = "orange")
cbind(table(iyear))
sort(table(iyear), decreasing = TRUE)
# highest number of terrorist activities took
# place in the year 2014

#sort(data.frame(country, country_txt))
Highest_terror_activities = cbind(table(country_txt))
Highest_terror_activities = sort(table(country_txt), decreasing = TRUE)
Highest_terror_activities
# country where highest number of terrorist activities occurred 
#is Iraq

#y = aggregate(data$weaptype1_txt, by = list(kills = nkill), funs(sum(na.rm = TRUE)))
highest_fatalities = data %>% group_by(country_txt) %>% summarise_at(vars(nkill), funs(sum(.,na.rm = TRUE)))
highest_fatalities

max(highest_fatalities$nkill)
which(highest_fatalities$nkill == 78589) 
# iraq has highest number of fatalities with 78589 fatalities

frequently_used_weapon = data %>% group_by(weaptype1_txt) %>% summarise_at(vars(nkill), funs(sum(.,na.rm = TRUE)))
frequently_used_weapon
max(frequently_used_weapon$nkill)
which(frequently_used_weapon$nkill == 174894)
## we can see that most frequently used type of weapon is Firearms

# missing value analysis
sum(is.na(iyear))
sum(is.na(iday))
sum(is.na(imonth))




