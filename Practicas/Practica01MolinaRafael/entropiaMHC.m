function y = entropiaMHC(histograma)
    if ~isvector(histograma)
        error("Error en fuc entropiaMHC: variable incompatible")
    end
    % distribucion de probabilidad
    prod = histograma./sum(histograma)
    % Calculo de la entropia
    k = find(prod)
    y = -sum(prod(k).*log2(prod(k)))
    
end