 


library(scpi)
library(Synth)
library(SCtools)


#treatment_cities[1, "city_id"]
# 
# i = 13
# 
# df <- arctic1807[arctic1807$city_id == treatment_cities[i, "city_id"] 
#                  | arctic1807$dummy_space == 0, ]
# 
# dataprep.out <- dataprep(df[df$t<=64, ] , c('Population')
#          , dependent = "P_avg_per_m_sec"
#          , unit.variable = 'city_id'
#          , time.variable = 't'
#          , treatment.identifier = treatment_cities[i, "city_id"]
#          , controls.identifier = c(1,3,4,5,11,17, 51, 52)#control_cities$city_id
#          , time.predictors.prior =c(1:59)
#          , time.optimize.ssr =c(1:59)
#          , unit.names.variable = 'City'
#          , time.plot = 1:64)
# synth.out <- synth(dataprep.out)
# 
# synth.tables <- synth.tab(
#   dataprep.res = dataprep.out,
#   synth.res = synth.out)
# print(synth.tables)
# 
# 
# path.plot(dataprep.res = dataprep.out,synth.res = synth.out)
# 
# gaps.plot(dataprep.res = dataprep.out,synth.res = synth.out)

df <- arctic1807[, c('City', 'dummy_time', 'dummy_space', 'city_id', 't',"P_avg_per_m_sec"  ) ]
df$treatment = df$dummy_time * df$dummy_space
df = df[df$t>=40 & df$city_id %in% 
          c(481, 482, 483, 484, 485, 487, 489, 490, 491, 493, 494, 495), ]

# df = df[df$t>=1 & (df$City == 'Абаза'| df$City == 'Абакан' | df$City == 'Апатиты'), ]

df$P_avg_per_m_sec_scaled = (df$P_avg_per_m_sec-mean(df$P_avg_per_m_sec))/sd(df$P_avg_per_m_sec) 

summary(df)
hist(df$P_avg_per_m_sec_scaled)


data = scdataMulti(df, id.var = 'city_id', time.var = 't'
                   , outcome.var =  "P_avg_per_m_sec_scaled"
                   , treatment.var =  'treatment'
                   , post.est = 10
                   , units.est = c(481)
                   
                   ) 

model = scest(data, solver = 'ECOS_BB'
              , w.constr = list(name = "ols"))

model
summary(model)
scplotMulti(model)

df[df$city_id==481,]


# datager <- scpi_germany
# 
# datager$tr_id <- 0
# datager$tr_id[(datager$country == "West Germany" & datager$year > 1990)] <- 1
# datager$tr_id[(datager$country == "Italy" & datager$year > 1992)] <- 0
# 
# outcome.var <- "gdp"
# id.var <- "country"
# treatment.var <- "tr_id"
# time.var <- "year"
# 
# 
# df.unit <- scdataMulti(datager, id.var = id.var, outcome.var = outcome.var,
#                        treatment.var = treatment.var,
#                        time.var = time.var, features = list(c("gdp", "trade")),
#                        cointegrated.data = TRUE, constant = TRUE)
# 
# datager

# #Строю синтетический контроль для каждого города по отдельности
# 
# dataprep(df, c('Population'), dependent = 'P_avg_per_m_new')


