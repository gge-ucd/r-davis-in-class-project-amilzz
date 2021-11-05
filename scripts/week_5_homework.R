gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")

summary(gapminder)
head(gapminder)

ggplot(gapminder, aes(x = gapminder$year, y = gapminder$lifeExp)) + geom_point(aes(color = gapminder$continent))
                                                                               
#life expectancy by GDP
ggplot(gapminder, aes(x = gapminder$gdpPercap, y = gapminder$lifeExp)) + geom_point(aes(color = gapminder$continent))

ggplot(gapminder, aes(x = gapminder$gdpPercap, y = gapminder$lifeExp)) + geom_point(aes(color = gapminder$continent), size = 0.5)+ scale_x_log10() +geom_line()

ggplot(gapminder, aes(x = gapminder$gdpPercap, y = gapminder$lifeExp)) + geom_point(aes(color = gapminder$continent), size = 0.5)+ scale_x_log10() +geom_smooth(method = 'lm', color = 'black')                                                                                   
                                                                      
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) + geom_point(aes(color = continent), size = 0.5)+ scale_x_log10() +geom_smooth(method = 'lm', color = 'black')                                                                             

LifeExp_byGDP <- ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) + geom_point(aes(color = continent), size = 0.5)+ scale_x_log10() +geom_smooth(method = 'lm', color = 'black')                                                                             

print(LifeExp_byGDP +ggtitle("Life Expectancy by GDP"))


#violin plot of life expenctancy by continent
ggplot(gapminder, aes(x = continent, y = lifeExp)) + geom_violin(aes(color = continent), size = 0.5)+ geom_smooth(method = 'lm', color = 'black')                                                                             

LifeExp_continent <- ggplot(gapminder, aes(x = continent, y = lifeExp)) + geom_violin(aes(color = continent), size = 0.5)+ geom_smooth(method = 'lm', color = 'black')                                                                             

print(LifeExp_continent +ggtitle("Life Expectancy by Continent"))


#mean life plots
gapminder %>%
  group_by(continent, year) %>% 
  summarize(mean_lifeExp = mean(lifeExp)) %>% 
ggplot()+
  geom_line(aes(x = year, y = mean_lifeExp, color = continent)) 

gapminder %>%
  group_by(continent, year) %>% 
  summarize(mean_lifeExp = mean(lifeExp))
ggplot()+
  geom_point(aes(x = year, y = mean_lifeExp, color = continent))


weighted <- ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
geom_point(aes(color = continent, size = pop)) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()

print(weighted + ggtitle("Weighted Life Expectancy by GDP"))




#5 countries
countries <- c("Brazil", "China", "El Salvador", "Niger", "United States")
gapminder %>% 
  filter(country %in% countries) %>% 
  ggplot(aes(x = country, y = lifeExp))+
  geom_boxplot() +
  geom_jitter(alpha = 0.5, color = "green")+
  theme_minimal() +
  ggtitle("Life Expectancy of Five Countries") + #title the figure
  theme(plot.title = element_text(hjust = 0.5)) + #centered the plot title
  xlab("Country") + ylab("Life Expectancy") #how to change axis names

Subset_countries <- gapminder %>% 
  filter(country %in% countries) %>% 
  ggplot(aes(x = country, y = lifeExp))+
  geom_boxplot() +
  geom_jitter(alpha = 0.5, color = "green")+
  theme_minimal()


print(Subset_countries +ggtitle("Life Expectancy of Five Countries")+ xlab("Country") + ylab("Life Expectancy"))



