#install.packages()
library(scpi)
library(Synth)
library(SCtools)

df <- arctic1807[, c('City', 'dummy_time', 'dummy_space', 'city_id', 't',"P_avg_per_m_sec", 'Population'  ) ]
df$treatment = df$dummy_time * df$dummy_space
df = df[df$t>=40 & df$city_id %in% 
          c(481, 482, 483, 484, 485, 487, 489, 490, 491, 493, 494, 495), ]

df$P_avg_per_m_sec_scaled = (df$P_avg_per_m_sec-mean(df$P_avg_per_m_sec))/sd(df$P_avg_per_m_sec) 
df$Population_scaled = (df$Population-mean(df$Population))/sd(df$Population) 

summary(df)
hist(df$P_avg_per_m_sec_scaled)


data = scdataMulti(df, id.var = 'city_id', time.var = 't'
                   , outcome.var =  "P_avg_per_m_sec_scaled"
                   , features = list("P_avg_per_m_sec_scaled"
                                     #, 'Population_scaled'
                                     )
                   , treatment.var =  'treatment'
                   , post.est = 10
                   , units.est = c(481)
                   
                   ) 
model = scest(data, solver = 'ECOS_BB'
              , w.constr = list(name = "ols"))
scplotMulti(model)


