 


library(scpi)
library(Synth)
library(SCtools)

treatment_cities[1, "city_id"]

i = 13

df <- arctic1807[arctic1807$city_id == treatment_cities[i, "city_id"] 
                 | arctic1807$dummy_space == 0, ]

dataprep.out <- dataprep(df[df$t<=64, ] , c('Population')
         , dependent = "P_avg_per_m_sec"
         , unit.variable = 'city_id'
         , time.variable = 't'
         , treatment.identifier = treatment_cities[i, "city_id"]
         , controls.identifier = c(1,3,4,5,11,17, 51, 52)#control_cities$city_id
         , time.predictors.prior =c(1:59)
         , time.optimize.ssr =c(1:59)
         , unit.names.variable = 'City'
         , time.plot = 1:64)
synth.out <- synth(dataprep.out)

synth.tables <- synth.tab(
  dataprep.res = dataprep.out,
  synth.res = synth.out)
print(synth.tables)


path.plot(dataprep.res = dataprep.out,synth.res = synth.out)

gaps.plot(dataprep.res = dataprep.out,synth.res = synth.out)


summary(df)
df$treatment = df$dummy_time * df$dummy_space
data = scdataMulti(df[df$year >=2023 & (df$City == 'Абаза'| df$City == 'Абакан' | df$City == 'Апатиты'), ], id.var = 'City', time.var = 't'
                   , outcome.var =  "P_avg_per_m_new"
                   , treatment.var =  'treatment'
                   , post.est = 10
                   , units.est = c('Апатиты')
                   ) 
df[df$City == 'Апатиты', ]
scpi_germany

df[df$year >=2023 & (df$City == 'Абаза'| df$City == 'Абакан' | df$City == 'Апатиты'),]


datager <- scpi_germany

datager$tr_id <- 0
datager$tr_id[(datager$country == "West Germany" & datager$year > 1990)] <- 1
datager$tr_id[(datager$country == "Italy" & datager$year > 1992)] <- 0

outcome.var <- "gdp"
id.var <- "country"
treatment.var <- "tr_id"
time.var <- "year"


df.unit <- scdataMulti(datager, id.var = id.var, outcome.var = outcome.var,
                       treatment.var = treatment.var,
                       time.var = time.var, features = list(c("gdp", "trade")),
                       cointegrated.data = TRUE, constant = TRUE)

datager

#Строю синтетический контроль для каждого города по отдельности

dataprep(df, c('Population'), dependent = 'P_avg_per_m_new')


