function E = total_consumption_trapets(x, route, n)

load(route)

h = x/n; % steglängden
intervall = (0:h:x); % tar fram n lika stora intervall mellan 0 och x

a = consumption(velocity(intervall(1:end), route)); % alla element
b = consumption(velocity(intervall(1), route)); % första elementet
c = consumption(velocity(intervall(end), route)); % sista elementet

E = h * (sum(a)-0.5*(b+c)); % beräkna area enligt trapetsmetoden

end
