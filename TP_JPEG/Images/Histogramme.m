I = imread('lena512.bmp'); %On entre l'image dans Matlab

h=zeros(1,256); %On crée un vecteur pour une image image codée sur 8 bits qu'on remplit de 0

[m,n]=size(I); %On mesure la taille de l'image d'entrée pour la polyvalence du programme
for i = 1:n %On parcourt les lignes de l'image
    for j = 1:m %On parcourt les colonnes de l'image
        h(1,I(i,j)+1) = h(1,I(i,j)+1) + 1; %On incrémente la valeur dans le rang du vecteur 
                                           %correspondant à la valeur du pixel lu +1.
                                           % +1 pour les pixels égaux à 0 car notre vecteur ne
                                           % commence pas au rang 0.  
    end
end


std2(I) %Calcul de la variance
mean(mean(I)) %Calcul de la moyenne

stem(h)
title('Histogramme de Lena512');
xlabel('Valeur des pixels');
ylabel('Nombre de pixels');




