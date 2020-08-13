#%% Steady state of a Markov chain using 4 techniques

using LinearAlgebra, StatsBase

# Transition Matrix
P = [0.5 0.4 0.1;0.3 0.2 0.5;0.5 0.3 0.2]
n = 100 # Number of iterations
#%% First technique
prob1 = (P^n)[1,:]

#%% Second technique
A = vcat((P-I)[1:2,:],ones(1,3))
b = [0 0 1]'
prob2 = A\b

#%% Third Way
eigVecs = eigvecs(copy(P'))
highestVec = eigVecs[:, findmax(abs.(eigvals(P)))[2]]
prob3 = (highestVec)/norm(highestVec,1)
