%Projekt 2 Uppgift 2a

clear all, clc

%{

a_val = input('Vem är det som kör? \n \n 1 - Anna \n\n 2 - Elsa \n\n');
clc
x = input('Hur långt ska ni åka? (0-65) ');
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

load speed_anna.mat
%load speed_elsa.mat

route = 'speed_anna.mat';
%route = 'speed_elsa.mat';

x = max(distance_km); % ange antal km du kört
n = 100000; % ange antal intervall

trap = time_to_destination_trapets(x,route,n); % beräknar tid med trapetsmetoden

simp = time_to_destination_simpson(x,route,n); % beräknar tid med Simpsons regel

f = @(p) 1./spline(distance_km, speed_kmph, p); % spara värde i funktion f
matlab = 60 * integral(f, 0, x);    % använder matlabs inbyggda integral

fprintf('Det tar %1.4f minuter att åka %1.2f km enligt trapetsmetoden med %i intervall \n\n', trap, x, n)

fprintf('Det tar %1.4f minuter att åka %1.2f km enligt Simpsons regel med %i intervall \n\n', simp, x, n)

fprintf('Det tar %1.4f minuter att åka %1.2f km enligt Matlabs inbygda integralfunktion med %i intervall \n \n', matlab, x, n)

