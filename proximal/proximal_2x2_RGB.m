function out = proximal_2x2_RGB(img, STEP = 0.1)
    % ==============================================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 definita img cu puncte intermediare echidistante.
    % img este o imagine colorata RGB -Red, Green, Blue.
    % =============================================================================================

    % TODO: Extrage canalul rosu al imaginii.
    rc = img(:,:,1); % Canal rosu
    
    % TODO: Extrage canalul verde al imaginii.
    gc = img(:,:,2); % Canal verde
    
    % TODO: Extrage canalul albastru al imaginii.
    bc = img(:,:,3); % Canal albastru
    
    % TODO: Aplic? functia proximal pe cele 3 canale ale imaginii.
    red = proximal_2x2(rc, STEP);
    green = proximal_2x2(gc, STEP);
    blue = proximal_2x2(bc, STEP);
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
    out = cat(3, red, green, blue);
    
endfunction
