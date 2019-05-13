

function out = QPSO(problem, params)

    %% Problem Definiton

    CostFunction = problem.CostFunction;  % Cost Function

    nVar = problem.nVar;        % Number of Unknown (Decision) Variables

    VarSize = [1 nVar];         % Matrix Size of Decision Variables

    VarMin = problem.VarMin;	% Lower Bound of Decision Variables
    VarMax = problem.VarMax;    % Upper Bound of Decision Variables


    %% Parameters of PSO

    MaxIt = params.MaxIt;   % Maximum Number of Iterations

    nPop = params.nPop;     % Population Size (Swarm Size)

    u = params.u;           % Intertia Coefficient
    beta = params.beta;     %Contraction expansion coeffecient
    chi = params.chi;       % random values between [0,1]

    % The Flag for Showing Iteration Information
    ShowIterInfo = params.ShowIterInfo;    

    
    %% Initialization

    % The Particle Template
    empty_particle.Position = [];
    empty_particle.PPattractor = [];
    empty_particle.Cost = [];
    empty_particle.Best.Position = [];
    empty_particle.Best.Cost = [];

    % Create Population Array
    particle = repmat(empty_particle, nPop, 1);

    % Initialize Global Best
    GlobalBest.Cost = inf;
    MBest=0;

    % Initialize Population Members
    for i=1:nPop

        % Generate Random Solution
        particle(i).Position = unifrnd(VarMin, VarMax, VarSize);

        % Initialize attractor
        particle(i).PPattractor = zeros(VarSize);

        % Evaluation
        particle(i).Cost = CostFunction(particle(i).Position);

        % Update the Personal Best
        particle(i).Best.Position = particle(i).Position;
        particle(i).Best.Cost = particle(i).Cost;

        % Update Global Best
        if particle(i).Best.Cost < GlobalBest.Cost
            GlobalBest = particle(i).Best;
        end

    end

    % Array to Hold Best Cost Value on Each Iteration
    BestCosts = zeros(MaxIt, 1);


    %% Main Loop of PSO

    for it=1:MaxIt
        adder=0;
        for i=1:nPop

            % Update attractor
            particle(i).PPattractor =particle(i).Best.Position+(1-chi).*GlobalBest.Position;
            % update adder and mean best
            adder=adder+particle(i).Best.Position;
            MBest=(adder+particle(i).Best.Position)./nPop;
            
            % Update Position
            if rand < 0.5
                particle(i).Position = particle(i).Best.Position +beta.*abs(MBest-particle(i).Position).*log(1./u);
            else
                particle(i).Position = particle(i).Best.Position -beta.*abs(MBest-particle(i).Position).*log(1./u);
            end
           
            % Evaluation
            particle(i).Cost = CostFunction(particle(i).Position);

            % Update Personal Best
            if particle(i).Cost < particle(i).Best.Cost

                particle(i).Best.Position = particle(i).Position;
                particle(i).Best.Cost = particle(i).Cost;

                % Update Global Best
                if particle(i).Best.Cost < GlobalBest.Cost
                    GlobalBest = particle(i).Best;
                end            

            end

        end

        % Store the Best Cost Value
        BestCosts(it) = GlobalBest.Cost;

        % Display Iteration Information
        if ShowIterInfo
            disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCosts(it))]);
        end

       
    end
    
    out.pop = particle;
    out.BestSol = GlobalBest;
    out.BestCosts = BestCosts;
    
end