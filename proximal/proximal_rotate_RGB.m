function out = proximal_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Aplica Interpolarea Proximala pentru a roti o imagine RGB cu un unghi dat.
    % =========================================================================
    
    % TODO: Extrage canalul rosu al imaginii.
    rc = img(:,:,1); % Canal rosu
    
    % TODO: Extrage canalul verde al imaginii.
    gc = img(:,:,2); % Canal verde
    
    % TODO: Extrage canalul albastru al imaginii.
    bc = img(:,:,3); % Canal albastru
    
    % TODO: Aplica rotatia pe fiecare canal al imaginii.
    red = proximal_rotate(rc, rotation_angle);
    green = proximal_rotate(gc, rotation_angle);
    blue = proximal_rotate(bc, rotation_angle);
    
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
    out = cat(3, red, green, blue);
    
endfunction