# Particle-Swarm-Optimization-using-Matlab

- - - -
## Introduction

Swarm Intelligence is a branch of Artificial Intelligence where we observe nature and try to learn how different biological phenomena can be imitated in a computer system to optimize the scheduling algorithms. In swarm intelligence, we focus on the collective behavior of simple organisms and their interaction with the environment.

Proposed in 1995 by J. Kennedy an R.Eberhart, the article “Particle Swarm Optimization” became very popular due to  this continue optimization process allowing variations to multi targets and more. Consisting in the constant search of best solution, the method moves the particles with a certain velocity calculated in every iteration. Each particle’s movement has the influence of his own the best known position and also the best known position in the space-search. The final result expected is that the particle swarm converge to the best solution. It’s important to mention that PSO doesn’t use Gradient Descent, so it can be used to non linear problems once it doesn’t require that the problem have to be differentiable.

- - - -
## Algorithm 

```
Initialize the controlling parameters (N,c1,c2,Wmin,Wmax,Vmax,MaxIter)
Initialize the population of N particles
do
	for each particle
		calculate the objective of the particle
		update PBEST if required
		update GBEST if required
	end for
	update the inertia weight
	for each particle
		update velocity (v)
		update position (x)
	end for
while the end condition is not satisfied
return GBEST as the best estimation of global optimum
```

