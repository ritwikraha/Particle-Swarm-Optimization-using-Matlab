clc;
clear;
close all;
%% Problem definition
CostFunction= @(x) Sphere(x);
% cost function defined
nVar=5;     
%number of unknown variables
VarSize=[1,nVar]; 
%matrix size of decision variables
VarMin=-10;
%lower bound of decision variables
VarMax=10;
%upper bound of decision variables

%% Parameters of PSO
MaxIt=100;
%maximum number of iterations
nPop=50;
%population size (swarm size)
w=1;
%Inertia coefficient
wdamp=0.80;
%damping factor
c1=1.775;
%personal acceleration coefficient
c2=2.8;
%social acceleration coefficient

%% Initialization
%creating a template for the particles

empty_particle.Position=[];
empty_particle.Velocity=[];
empty_particle.Cost=[];
empty_particle.Best.Position=[];
empty_particle.Best.Cost=[];
%creating a population array
particle=repmat(empty_particle,nPop,1)
%creating a global best for refernce
GlobalBest.Cost=inf;
%initialize population members

for i=1:nPop
    %Generate random solution
    particle(i).Position=unifrnd(VarMin,VarMax,VarSize);
    %initialize velocity
    particle(i).Velocity=zeros(VarSize);
    %Evaluation
    particle(i).Cost=CostFunction(particle(i).Position);
    %update the personal cost
    particle(i).Best.Position=particle(i).Position;
    particle(i).Best.Cost=particle(i).Cost;
    %update the global best
    if particle(i).Best.Cost<GlobalBest.Cost
        GlobalBest=particle(i).Best;
    end
end
%array to hold best costs at each step
BestCosts=zeros(MaxIt,1);
%% Main Loop of PSO
for it=1:MaxIt
    for i=1:nPop
        %update velocity
        particle(i).Velocity=w*particle(i).Velocity+c1*rand(VarSize).*(particle(i).Best.Position-particle(i).Position)+c2*rand(VarSize).*(GlobalBest.Position-particle(i).Position);
        %update position
        particle(i).Position=particle(i).Position+particle(i).Velocity;
        %evaluation
        particle(i).Cost=CostFunction(particle(i).Position);
        %update personal best
        if particle(i).Cost<particle(i).Best.Cost
            particle(i).Best.Position=particle(i).Position;
            particle(i).Best.Cost=particle(i).Cost;
            %update global best
            if particle(i).Best.Cost<GlobalBest.Cost
                GlobalBest=particle(i).Best;
            end
        end
    end
    %store the best cost value
    BestCosts(it)=GlobalBest.Cost;
    disp(['Iterations' num2str(it) 'BestCost--' num2str(BestCosts(it))])
    w=w*wdamp;
end

%% Results

figure;
plot(BestCosts,'LineWidth',2)
xlabel('Iterations');
ylabel('Best Cost');
grid on;

    
        