%Projekt 2 Uppgift 2b

clear all, clc

%{
a_val = input('Vem är det som kör? \n \n 1 - Anna \n\n 2 - Elsa \n\n');
clc
x = input('Hur långt har ni åkt? (0-65) ');
clc
n = input('Hur många intervall ska vi räkna med? ');
clc

if a_val ==1
    route = ('speed_anna.mat');
    load speed_anna.mat
else
    route = ('speed_elsa.mat');
    load speed_elsa.mat
end

%}

%load speed_anna.mat
load speed_elsa.mat

%route = 'speed_anna.mat';
route = 'speed_elsa.mat';

x = max(distance_km); % ange antal km du kört
n = 1000; % ange antal intervall

trap = total_consumption_trapets(x, route, n); % beräknar konsumption med trapetsmetoden
total_consumption_simpson(x, route, n); % beräknar konsumption med Simpsons regel

f = @(p) consumption(velocity(p, route)); % spara värde i funktion f
matlab = integral(f, 0, x); % använder matlabs inbyggda integral

fprintf('Den totala konsumptionen med trapetsmetoden är %5.4f Wh om vi räknar med %i intervall \n\n', trap,n)

fprintf('Den totala konsumptionen enligt matlab är %5.4f Wh om vi räknar med %i intervall \n\n', matlab, n)
