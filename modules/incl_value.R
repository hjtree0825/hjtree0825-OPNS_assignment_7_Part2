incl_value <- function(df){
	df %>% 
		group_by(prob_ind) %>% 
		summarise(incl_val= log(sum(exp(v)))) %>% 
		ungroup()
}

no_na_inf_incl_val <- function(df){
	df %>% 
		filter(., !is.na(incl_val)) %>% 
		filter(., !is.finite(incl_val)) #choose non-NA incl_val
}