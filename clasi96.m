% Ejercicio de Reconocimiento de Patrones
% Realizar un clasificador que separe los
% caracteres 9-6.
% Las imagenes de entrenamientos estan en
% seis.bmp y nueve.bmp
%


%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        %
% PARTE 1: ENTRENAMIENTO %
%                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('Parte 1: Entrenamiento (presione enter)');
pause


% Lectura de la imagenes de entrenamiento
I6 = not(imread('seis.bmp'));
I9 = not(imread('nueve.bmp'));
figure(1)
imshow([I6 I9],[]);
% Las imagenes tya se encuentran segmentadas

[L6,n6] = bwlabel(I6,4);
[L9,n9] = bwlabel(I9,4);
figure(2)
imshow([L6 L9],[]);

% Extraccion de Caracteristicas

for j = 1:2


    if (j==1)
        L = L6;
        n = n6;
        disp('procesando 6...')
    else
        L = L9;
        n = n9;
        disp('procesando 9...')
    end

    z = zeros(n,1);

    for i=1:n
        [i n]
        Y = zeros(size(L));
        ii = find(L==i);
        Y(ii) = 1;
        [ii,jj] = find(L==i);
        Y1 = imfill(Y,'holes');
        Y2 = xor(Y,Y1);
        [ii,jj] = find(L==i);
        h1 = max(ii);
        h2 = min(ii);
        [ii,jj] = find(Y2==1);
        h = mean(ii)-h2;
        z(i) = h/(h1-h2);
    end

    if (j==1)
        z6 = z;
    else
        z9 = z;
    end
end

% Histogramas

figure(3)
clf
hist(z6)
hold on
hist(z9)



% Clasificador por umbral
% punto medio de los centros de masa

th = (mean(z6)+mean(z9))/2;

plot([th th],[0 35],'g:')

%%%%%%%%%%%%%%%%%%%
%                 %
% PARTE 2: PRUEBA %
%                 %
%%%%%%%%%%%%%%%%%%%

disp('Parte 2: Prueba (presione enter)');
pause
close all

% Lectura de la imagen de test
J = not(imread('test96.bmp'));
J = imdilate(J,ones(3,3));
[N,M] = size(J);
figure(1)
imshow(J,[]);
hold on

[L,n] = bwlabel(J,4);
n6 = 0;
n9 = 0;
for i=1:n
    [i n]
    Y = zeros(size(L));
    ii = find(L==i);
    Y(ii) = 1;
    [ii,jj] = find(L==i);
    R = L(min(ii):max(ii),min(jj):max(jj));
    x = [min(jj) min(jj) max(jj) max(jj) min(jj)];
    y = [min(ii) max(ii) max(ii) min(ii) min(ii)];
    Y1 = imfill(Y,'holes');
    Y2 = xor(Y,Y1);
    [ii,jj] = find(L==i);
    h1 = max(ii);
    h2 = min(ii);
    [ii,jj] = find(Y2==1);
    h = mean(ii)-h2;
    z = h/(h1-h2);
    figure(2)
    imshow(R)
    if z>th
        title('seis')
        s = 'r';
        n6 = n6+1;
    else
        title('nueve');
        s = 'g';
        n9 = n9+1;
    end
    figure(1)
    plot(x,y,s)
    pause(0)
end

% Evaluacion de desempenho

True6 = input('Cuantos 6 fueron clasificados correctamente?');
True9 = input('Cuantas 9 fueron clasificados correctamente?');

False6 = n6-True6;
False9 = n9-True9;

P = [True6  False6
    False9 True9]

d = (True6+True9)/(n6+n9);
disp(sprintf('Desempe?o = %5.2f %%',d*100))