# Quantum-Particle-Swarm-Optimization-using-Matlab

- - - -
## Introduction

Quantum behaved particle swarm algorithm is a new intelligent optimization algorithm; the algorithm has less parameters and is easily implemented. In view of the existing quantum behaved particle swarm optimization algorithm for the premature convergence problem, put forward a quantum particle swarm optimization algorithm based on artificial fish swarm. The new algorithm based on quantum behaved particle swarm algorithm, introducing the swarm and following activities, meanwhile using the adaptive parameters, to avoid it falling into local extremum of population. The experimental results show the improved algorithm to improve the optimization ability of the algorithm.

Quantum behaved particle swarm algorithm is first proposed by Sun et al. [1] in 2004. Quantum behaved particle swarm optimization algorithm introduces quantum computing into the particle swarm algorithm, starting from the mechanical point of view that the particle in the space has quantum behavior. The algorithm overcomes the disadvantages while preserving the advantages of particle swarm algorithm, which can effectively improve the performance of optimization algorithms.

- - - -
## Algorithm 

```
Initialize the controlling parameters (N,u,beta,chi,Wmin,Wmax,Vmax,MaxIter)
Initialize the population of N particles
do
	adder=0
	for each particle
		calculate the objective of the particle
		PP(i)=P(i)+(1-chi)Pg
		adder=adder+P(i)
		MBest(i)=(adder+P(i))/N
		if rand <0.5
			X(i)=PP(i)+beta*abs(MBest(i)-X(i))*log(1/u)
		else
			X(i)=PP(i)-beta*abs(MBest(i)-X(i))*log(1/u)
		update PBEST- P(i) if required
		update GBEST- Pg if required
	end for
	update the inertia weight
	for each particle
		update position (x)
	end for
while the end condition is not satisfied
return GBEST as the best estimation of global optimum
```

- - - -
