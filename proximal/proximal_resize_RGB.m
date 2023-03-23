function out = proximal_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img astfel încât aceasta save fie de dimensiune p x q.
    % Imaginea img este colorata.
    % =========================================================================

    % TODO: Extrage canalul rosu al imaginii.
    rc = img(:,:,1); % Canal rosu
    
    % TODO: Extrage canalul verde al imaginii.
    gc = img(:,:,2); % Canal verde
    
    % TODO: Extrage canalul albastru al imaginii.
    bc = img(:,:,3); % Canal albastru
    
    % TODO: Aplica functia proximal pe cele 3 canale ale imaginii.
    red = proximal_resize(rc, p, q);
    green = proximal_resize(gc, p, q);
    blue = proximal_resize(bc, p, q);
    
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
    out = cat(3, red, green, blue);

endfunction
