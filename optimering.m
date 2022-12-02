function outputBeta = optimering(history)
    %parameters
    nIterations = 1000;
    maxSteps = 100;
    stopCriteria = 1E-10;
    grad = 0;
    hess = 0;
    epsilon = 1E-10;
    U = 100;
    %TODO: Sätt denna
    Ee = 1;
    roh = history;
    
    %run the optimization nIterations times to find the best optima
    for i = 1:nIterations
        %Generate starting position
        iterativBeta = rand(1,4);
        
        %Take steps as long as the stepsize is bigger than the stop
        %criteria
        for j = 1:maxSteps
            
            %Calculate gradient and hessian. TODO
            hess = 1;
            grad = 1;
            
            %Set lambda. TODO
            lambda = 1; %???? Beräkna denna. Bör ligga mellan 0,1. Kan vi ha den som konstant?
            
            %Take a step in the size and direction of the hessian & gradient
            deltaIterativBeta = -(hess^(-1)*grad);
            iterativBeta = iterativBeta + lambda*deltaIterativBeta;
            
            %Hantera beta3 bivillkor (Oklart om detta är rätt sätt)
            if iterativBeta(4) < epsilon
                iterativBeta(4) = epsilon; 
            elseif iterativBeta(4) > U
                iterativBeta(4) = U;
            end
            
            f = nelsonsiegel(iterativBeta);
            
            % Kör tills norm(grad) är mindre än stopCriteria
            norm(grad);
            if (norm(grad) < stopCriteria)
                break
            end
        end
        
        %Save beta if the target function is smaller than the previous
        %local optima
        
        %Calculate the target function
        targetFuction = (1/2)*(roh-ge(f))*Ee*(ge(f));
        if targetFuction < prevTargetFunction 
            outputBeta = iterativBeta;
        end
    end
end