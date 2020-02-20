
clear all, clc

%{
a_val = input('Vem är det som kör? \n \n 1 - Anna \n\n 2 - Elsa \n\n');
clc

if a_val ==1
    route = ('speed_anna.mat');
    load speed_anna.mat
    C = input('Hur många Wh har batteriet? (0-11924 Wh) ');
    clc
else
    route = ('speed_elsa.mat');
    load speed_elsa.mat
    C = input('Hur många Wh har batteriet? (0-7985 Wh) ');
    clc
end

%}

load speed_anna.mat
%load speed_elsa.mat

route = 'speed_anna.mat';
%route = 'speed_elsa.mat';

C = 10000; % Ange hur många Wh batteriet har

r = reach(C, route);

fprintf('Med %i Wh kommer bilen %2.2f km.', C, r) 

%{
if a_val ==1
    fprintf('Med %i Wh kommer Anna %2.2f km.', C, r) 
else
    fprintf('Med %i Wh kommer Elsa %2.2f km.', C, r)
end
%}