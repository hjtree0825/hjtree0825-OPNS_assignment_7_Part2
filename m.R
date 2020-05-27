source('header.R')

# parameters
num_rep <- 1000

# Generate 1000 discrete choice problems
sim_data(num_rep)

# Check they sum up to 1 (different dataset from above)
sim_data(num_rep) %>%
  calc_ccp() %>%
  no_na_ccp() %>%
  sum_to_one()

# No NA or Inf values for inclusive values (different dataset from above)
sim_data(num_rep) %>%
  incl_value() %>%
  no_na_inf_incl_val()

############################
# If we want to keep the same dataset, then:
df <- sim_data(num_rep)     # Generate 1000 discrete choice problems
df %>%                      # Check they sum up to 1
  calc_ccp() %>%
  no_na_ccp() %>%
  sum_to_one()

df %>%                      # No NA or Inf values for inclusive values
  sim_data(num_rep) %>%
  incl_value() %>%
  no_na_inf_incl_val()

