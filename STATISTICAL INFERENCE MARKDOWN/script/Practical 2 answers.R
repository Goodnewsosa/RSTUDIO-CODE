### Introduction to R

### Practical 2. Vectors 

### Sample answers

# Question 1
length(state.name)
length(state.area)
length(state.region)

# Question 2a
state.name[state.region == "Northeast"]
# Question 2b
state.area[state.region == "Northeast"]
# Question 2c
state.name[state.area > 1e+5]

# Question 3a
length(state.name[state.region == "Northeast"])
# Question 3b
length(state.name[state.area > 1e+5])