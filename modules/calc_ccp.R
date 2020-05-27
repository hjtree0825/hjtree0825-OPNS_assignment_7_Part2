calc_ccp <- function(df){
	df %>% 
		group_by(prob_ind) %>% 
		mutate(delta_v= v- max(v)) %>% 
		mutate(exp_v= exp(delta_v)) %>% 
		mutate(ccp= 1.*exp_v/sum(exp_v)) %>% 
		ungroup() %>% 
		select(prob_ind, choice_ind, ccp)
}

no_na_ccp <- function(df){
	df %>% 
		filter(., !is.na(ccp)) #choose non-NA CCPs?
}

sum_to_one <- function(df){
	df %>% 
		group_by(prob_ind) %>% 
		mutate(sum_prob= sum(ccp)) %>% 
		ungroup() %>% 
		select(prob_ind, sum_prob) %>% 
		unique() %>% 
		filter(., near(sum_prob, 1)==FALSE ) #choose prob_ind that doesn't sum to one
}