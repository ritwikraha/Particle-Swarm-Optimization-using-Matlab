%
% Copyright (c) 2019, Ritwik Raha
% All rights reserved. Please read the "license.txt" for license terms.
%
% Project Title: Particle-Swarm-Optimization-using-Matlab
% 
%

clc;
clear;
close all;

%% Problem Definiton

problem.CostFunction = @(x) Sphere(x);  % Cost Function
problem.nVar = 5;       % Number of Unknown (Decision) Variables
problem.VarMin =  -10;  % Lower Bound of Decision Variables
problem.VarMax =  10;   % Upper Bound of Decision Variables

%% Parameters of PSO

params.MaxIt = 1000;        % Maximum Number of Iterations
params.nPop = 50;           % Population Size (Swarm Size)
params.u = rand(1,problem.nVar);               % Intertia Coefficient
params.beta = 0.5;             % Contraction expansion coefficient
params.chi = rand;             % a random value between 0 and 1
params.ShowIterInfo = true; % Flag for Showing Iteration Informatin

%% Calling PSO

out = QPSO(problem, params);

BestSol = out.BestSol;
BestCosts = out.BestCosts;

%% Results

figure;
%plot(BestCosts, 'LineWidth', 4);
semilogy(BestCosts, 'LineWidth', 4);
xlabel('Iteration');
ylabel('Best Cost');
grid on;


