library(tidyverse)

set.seed(1234)
num_rep <- 10

sim_data <- function(num_rep){
	data.frame(prob_ind= 1:num_rep) %>% 
		mutate(x= 1+ rpois(n(), lambda=3) ) %>% 
		group_by(prob_ind, x) %>% 
		expand(choice_ind= 1:x) %>% 
		mutate(u= runif(1, min=0.03, max=3)) %>% 
		ungroup() %>% 
		group_by(prob_ind, x, choice_ind) %>% 
		mutate(v= rt(n=1, df=.$u)) %>% 
		ungroup() %>% 
		select(prob_ind, choice_ind, v)
}