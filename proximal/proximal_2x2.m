function out = proximal_2x2(f, STEP = 0.1)
    % ===================================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 f cu puncte intermediare echidistante.
    % f are valori cunoscute în punctele (1, 1), (1, 2), (2, 1) ?i (2, 2).
    % Parametrii:
    % - f = imaginea ce se va interpola;
    % - STEP = distan?a dintre dou? puncte succesive.
    % ===================================================================================
    
    % TODO: Defineste coordonatele x si y ale punctelor intermediare.
    x_int = 1 : STEP : 2;
    y_int = 1 : STEP : 2;
    % Se afl? num?rul de puncte.
    n = length(x_int);

    % TODO: Cele 4 puncte încadratoare vor fi aceleasi pentru toate punctele din interior.
    % Cele 4 puncte sunt reprezentate de coordonatele (1, 1), (1, 2), (2, 1),
    % (2, 2) pe care le vom folosi pentru calcularea celui mai apropiat pixel.
    
    
    % TODO: Initializeaza rezultatul cu o matrice nula n x n.
    out = zeros(n);
  
    % Se parcurge fiecare pixel din imaginea finala.
    for i = 1 : n
        for j = 1 : n
            % TODO: Afla cel mai apropiat pixel din imaginea initiala.
            % Se parcurge fiecare punct calculat si se verifica de care pixel 
            % este mai apropiat din poza, luand valoarea sa.
           if i <= n / 2 && j <= n / 2
             out(i, j) = f(1, 1);
           elseif i <= n / 2 && j > n / 2
             out(i, j) = f(1, 2);
           elseif i > n / 2 && j <= n / 2
             out(i, j) = f(2, 1);
           else
             out(i, j) = f(2, 2);
           endif
            % TODO: Calculeaza pixelul din imaginea finala.
            % out contine pixelii din imaginea finala.
        endfor
    endfor

endfunction