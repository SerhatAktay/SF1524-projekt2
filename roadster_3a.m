
clear all, clc

%{
a_val = input('Vem är det som kör? \n \n 1 - Anna \n\n 2 - Elsa \n\n');
clc

if a_val ==1
    route = ('speed_anna.mat');
    load speed_anna.mat
    T = input('Hur länge har Anna kört? (0-40 minuter) ');
    clc
else
    route = ('speed_elsa.mat');
    load speed_elsa.mat
    T = input('Hur länge har Elsa kört? (0-57 minuter) ');
    clc
end

%}


load speed_anna.mat
%load speed_elsa.mat

route = 'speed_anna.mat';
%route = 'speed_elsa.mat';

T = 30; % Ange hur lång tid du vill åka i minuter

dist = distance(T, route);

fprintf('På %i minuter kommer bilen %2.2f km.', T, dist)

%{
if a_val ==1
    fprintf('På %i minuter kommer Anna %2.2f km.', T, dist) 
else
    fprintf('På %i minuter kommer Elsa %2.2f km.', T, dist)
end
%}

