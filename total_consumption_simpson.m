function E = total_consumption_simpson(x, route, n)

load(route)

h = x/n; % steglängden
intervall = (0:h:x); % tar fram n lika stora intervall mellan 0 och x

a = consumption(velocity(intervall(1:end), route)); % alla element
b = consumption(velocity(intervall(1), route)); % första elementet
c = consumption(velocity(intervall(end), route)); % sista elementet
d = consumption(velocity(intervall(2:2:end-1), route)); % vartannat element från andra till näst sista

area = (h/3) * (2*sum(a) - b - c + 2*sum(d)); % beräkna area enligt Simpsons metod

fprintf('Den totala konsumptionen med Simpsons regel är %5.4f Wh om vi räknar med %i intervall \n\n', area,n)

end
