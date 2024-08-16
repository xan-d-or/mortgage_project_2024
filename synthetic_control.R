library(scpi)
#library(Synth)
library(SCtools)
library(data.table)

arctic <- read_csv("arctic1008_new.csv")
treatment = read_csv('treatment_cities1308.csv')

df <- arctic[,
                 c("City", "dummy_time", "dummy_space",
                   "city_id", "month_dt", "P_avg_per_m_sec",
                   "Population", 't')]
df$treatment <- df$dummy_time * df$dummy_space

df$P_avg_per_m_sec_scaled <-
  (df$P_avg_per_m_sec - mean(df$P_avg_per_m_sec)) / sd(df$P_avg_per_m_sec)
df$Population_scaled <-
  (df$Population - mean(df$Population)) / sd(df$Population)

df$month_dt <- as.Date(df$month_dt)

summary(df)
hist(df$P_avg_per_m_sec_scaled)

treatment

data <- scdataMulti(df, id.var = "city_id", time.var = "month_dt"
  , outcome.var =  "P_avg_per_m_sec_scaled"
  , features = list("P_avg_per_m_sec_scaled"
    #, 'Population_scaled'
  )
  , treatment.var =  "treatment"
  , units.est = treatment$city_id#c(481, 807)

)

model <- scest(data, solver = "ECOS_BB"
               , w.constr = list(name = "ols"))
#scplotMulti(model)

res1 =  model$est.results$Y.pre.fit
res2 =  model$est.results$Y.post.fit 

res1 = as.data.frame(res1)
res1$index = rownames(res1)
res2 = as.data.frame(res2)
res2$index = rownames(res2)
write_csv(rbind(res1, res2), 'est_results1308.csv')

res1 =  model$data$Y.pre
res2 =  model$data$Y.post 

res1 = as.data.frame(res1)
res1$index = rownames(res1)
res2 = as.data.frame(res2)
res2$index = rownames(res2)
write_csv(rbind(res1, res2), 'raw_data_results1308.csv')

