function R = proximal_rotate(I, rotation_angle)
    % =========================================================================
    % Roteste imaginea alb-negru I de dimensiune m x n cu unghiul rotation_angle,
    % aplicând Interpolare Proximala.
    % rotation_angle este exprimat în radiani.
    % =========================================================================
    [m n nr_colors] = size(I);
    I = cast(I, "double");
    % Se converteste imaginea de intrare la alb-negru, daca este cazul.
    if nr_colors > 1
        R = -1;
        return
    endif

    % Obs:
    % Atunci când se aplica o scalare, punctul (0, 0) al imaginii nu se va deplasa.
    % În Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza în indici de la 1 la n si se inmultesc x si y cu s_x respectiv s_y,
    % atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici în intervalul [0, n - 1].

    % TODO: Calculeaza cosinus si sinus de rotation_angle.
    c = cos(rotation_angle);
    s = sin(rotation_angle);

    % TODO: Initializeaza matricea finala.
    R = zeros(m, n);

    % TODO: Calculeaza matricea de transformare.
    Givens = [c -s; s c];

    % TODO: Inverseaza matricea de transformare, FOLOSIND doar functii predefinite!
    Givens_inv = inv(Givens);

    % Se parcurge fiecare pixel din imagine.
    for y = 0 : m - 1
        for x = 0 : n - 1
            % TODO: Aplica transformarea inversa asupra (x, y) si calculeaza x_p si y_p
            % din spatiul imaginii initiale.
            coord_init = [x; y];
            coord_fin = Givens_inv * coord_init;
            xp = coord_fin(1);
            yp = coord_fin(2);

            % TODO: Trece (xp, yp) din sistemul de coordonate [0, n - 1] în
            % sistemul de coordonate [1, n] pentru a aplica interpolarea.
            xp++;
            yp++;

            % TODO: Daca xp sau yp se afla în exteriorul imaginii,
            % se pune un pixel negru si se trece mai departe.
            if xp > n || xp < 1 || yp < 1 || yp > m
              R(y + 1, x + 1) = 0;
            else
            % TODO: Afla punctele ce înconjoara(xp, yp).
            
            % Rotunjim inferior valorile, apoi adunam 1 pentru coordonata
            % consecutiva.
              x1 = floor(xp);
              x2 = x1 + 1;
              y1 = floor(yp);
              y2 = y1 + 1;
            
            % TODO: Calculeaza coeficientii de interpolare notati cu a
            a = proximal_coef(I, x1, y1, x2, y2);
            % Obs: Se poate folosi o functie auxiliara în care sau se calculeze coeficientii,
            % conform formulei.
            
            % TODO: Calculeaza valoarea interpolata a pixelului (x, y).
            R(y + 1, x + 1) = a(1) + a(2) * xp + a(3) * yp + a(4) * xp * yp;
            endif
        
        endfor
    endfor

    % TODO: Transforma matricea rezultata în uint8 pentru a fi o imagine valida.
    R = cast(R, "uint8");
    
endfunction
