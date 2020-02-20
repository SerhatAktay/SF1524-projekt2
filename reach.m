function x = reach(C, route)

load(route)

f = @(y) -C + total_consumption_trapets(y, route, 10000);
fprim = @(y) consumption(velocity(y, route));

y = max(distance_km);   % gissning sätts till max-distans
k = 0;                  % iterationsräknare
e_k = 0.1;              % felet sätts till 0.1 för att starta while-loop
tol = 0.5*10^(-3);      % toleransen sätts till 3 värdesiffor

while abs(e_k) > tol            % stoppvillkor
    y_2 = y - (f(y)/fprim(y));  % Newtons metod
    e_k = y_2 - y;              % beräkna felet
    y = y_2;                    % sätt nya y värdet till y_2
    k = k+1;                    % iterationsräknare
end

x = y;

end



