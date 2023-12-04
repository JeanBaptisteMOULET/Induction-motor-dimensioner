function sauvegarderParametres(u)


%%! Les valeurs inférieures à 1e-6 ne peuvent pas être sauvegardées et
%%seront mises à zéros lors de la sauvegarde.
    % Ouvrir le fichier en lecture
    fid = fopen('create_u_test.m', 'r');
    
    if fid == -1
        error('Impossible d''ouvrir le fichier pour lecture.');
    end
    
    % Lire le contenu du fichier
    fileContents = fscanf(fid, '%c');
    
    % Fermer le fichier
    fclose(fid);
    
    % Trouver la position de la première occurrence de 'u = zeros(1, 30);'
    % startIdx = strfind(fileContents, 'function [u] =create_u_test()');
    % 
    % if isempty(startIdx)
    %     error('Entête de la fonction non trouvée dans le fichier.');
    % end
    
    % Extraire l'entête de la fonction
    %functionHeader = fileContents(1:startIdx+length('u = zeros(1, 30);')-1);
    
    % Ouvrir le fichier en écriture (en écrasant son contenu)
    fid = fopen('create_u_test.m', 'w');
    
    if fid == -1
        error('Impossible d''ouvrir le fichier pour écriture.');
    end
    
    % Réécrire l'entête de la fonction et les commentaires
    fprintf(fid, '%s\n', 'function [u] = create_u_test()');
    fprintf(fid, '%% Remplacez cela par vos valeurs actuelles\n');
    
    for i = 1:30
        fprintf(fid, 'u(%d) = %.6f;\n', i, u(i));
    end
    
    fprintf(fid, '\n');
    
    % Fermer le fichier
    fclose(fid);
    
    disp('Les paramètres ont été sauvegardés dans create_u_test.m.');
end

