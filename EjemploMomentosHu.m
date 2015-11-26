% Ejemplo de Momentos de Hu
%
% D.Mery, DCC-UC, Marzo 2008
I = imread('123.bmp');
J = imdilate(not(I),ones(3,3));
figure(1)
clf
imshow(J,[]);
[L,n] = bwlabel(J,4);
Z = zeros(n,8);
for i=1:n
    R = L==i;
    figure(2)
    imshow(R);
    k = input('que numero es este?');
    %i_m = mean(Ireg);
    %j_m = mean(Jreg);
    HM = HuMom(R);
    Z(i,:) = [HM k];
end
k1 = find(Z(:,8)==1);
k2 = find(Z(:,8)==2);
k3 = find(Z(:,8)==3);
figure(3)
%x=2;y=4 da buenos resultados
%while(1)
%    x = input('Momento de Hu eje x?')
 %   y = input('Momento de Hu eje y?')
  %  clf
%    plot(Z(k1,x),Z(k1,y),'r*')
%    hold on
%    plot(Z(k2,x),Z(k2,y),'g+')
%    plot(Z(k3,x),Z(k3,y),'bo')
% end