clear all;

I = imread('lena512.bmp');

h=zeros(1,511); %On a agrandit la taille du vecteur pour qu'il puisse accueillir les valeurs négatives

I = double(I);%On met I en double pour avoir des valeurs négatives dans l'histogramme
[m,n]=size(I); 

for i = 1:m 
    for j = 1:n 
        if j == 1
            P(i,j) = 128; %Les pixels à chaque début de ligne n'ont pas de voisin à gauche
                          %on lui donne donc une valeur par défaut, 128, la
                          %valeur au milieu de la dynamique.
                          %Hors de question de lui donner la valeur du pixel précédent 
                          %qui aura de fortes chances de ne pas avoir la même valeur  
        else
        P(i,j)=I(i,j-1); %On crée le pixel prédit
        end;
        
        X(i,j) = I(i,j)-P(i,j); %On crée le pixel d'erreur
        h(1,X(i,j)+256) = h(1,X(i,j)+256) + 1; %On fait maintenant +256 car on attribut au rang 1 la valeur -255
        
    end
end


subplot(131)
imshow(uint8(I));
subplot(132)
imshow(uint8(128+X));
subplot(133)
bar(h);
std2(X)