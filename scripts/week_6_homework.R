library(tidyverse)
gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")

head(gapminder)

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) + geom_point(aes(color = continent), size = .5) + 
  scale_x_log10() + geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') + theme_bw()

ggplot(gapminder, aes(x = year, y = lifeExp)) + geom_line(aes(color = continent), size = .25) + 
  scale_x_log10() + geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') + theme_bw()

ggplot(gapminder, aes(x = year, y = lifeExp)) + geom_violin(aes(color = continent), size = .25) + 
  scale_x_log10() + geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') + theme_bw()

ggplot(gapminder, aes(x = year, y = pop)) + geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() + geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') + theme_bw()

ggplot(gapminder, aes(x = gdpPercap, y = pop)) + geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() + geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') + theme_bw()

ggplot(gapminder, aes(x = pop, y = gdpPercap)) + geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() + geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') + theme_bw()

ggplot(gapminder, aes(x = year, y = gdpPercap)) + geom_violin(aes(color = continent), size = .25) + 
  scale_x_log10() + geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') + theme_bw()


gapminder %>%
  group_by(continent, year) %>% 
  summarize(mean_lifeExp = mean(lifeExp)) %>% 
  
ggplot()+ geom_point(aes(x = year, y = mean_lifeExp, color = continent))+ 
  geom_line(aes(x = year, y = mean_lifeExp, color = continent)) 


ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent, size = pop)) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()



countries <- c("Brazil", "China", "El Salvador", "Niger", "United States") #create a vector with just the countries we are interested in

gapminder %>% 
  filter(country %in% countries) %>% 
  ggplot(aes(x = country, y = lifeExp))+ xlab("Country") + ylab("Life Expectancy") +
  geom_boxplot() +
  geom_jitter(alpha = 0.5, color = "red")+
  theme_minimal() +
  ggtitle("Life Expectancy of Five Countries") 
 
  
gapminder %>% 
  filter(country %in% countries) %>% 
  ggplot(aes(x = country, y = lifeExp))+ xlab("Country") + ylab("Life Expectancy") +
  geom_violin() +
  geom_jitter(alpha = 0.5, color = "red")+
  theme_minimal() +
  ggtitle("Life Expectancy of Five Countries") + 
  theme(plot.title = element_text(hjust = 0.5))  


