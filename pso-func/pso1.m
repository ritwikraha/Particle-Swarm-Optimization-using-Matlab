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
phi1=2.05;
phi2=2.05;
kappa=1;
phi=phi1+phi2;
chi=2*kappa/abs(2-phi-sqrt(phi^2-4*phi));
params.MaxIt = 1000;        % Maximum Number of Iterations
params.nPop = 50;           % Population Size (Swarm Size)
params.w = chi;               % Intertia Coefficient
params.wdamp = 1;        % Damping Ratio of Inertia Coefficient
params.c1 = chi*phi1;              % Personal Acceleration Coefficient
params.c2 = chi*phi2;              % Social Acceleration Coefficient
params.ShowIterInfo = true; % Flag for Showing Iteration Informatin

%% Calling PSO

out = PSO(problem, params);

BestSol = out.BestSol;
BestCosts = out.BestCosts;

%% Results

figure;
% plot(BestCosts, 'LineWidth', 4);
semilogy(BestCosts, 'LineWidth', 4);
xlabel('Iteration');
ylabel('Best Cost');
grid on;


