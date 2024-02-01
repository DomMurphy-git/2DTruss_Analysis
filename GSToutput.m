function GSToutput(cost, T, Wcrit, L, critMem, R)
%This will output the relevant values according to the rubric instructions

reacts = 3;

fprintf('EK301, Section A6, Dominic M., Leonardo M., Michael R. 11/17/2023. \n');

loadindex = find(L);

fprintf('Load: %d oz \n', L(loadindex));

fprintf('Member forces in oz: \n');
temp = size(T);
members = (temp(1) - reacts);
for i = 1:members
    if T(i) < 0
        state = 'C';
    else
        state = 'T';
    end
    fprintf('m%d: %g (%s) \n',i,round((abs(T(i))), 3),state);
end


fprintf('Reaction forces in oz: \n');

fprintf('Sx1: %g \n',round(T(members + 1), 2));
fprintf('Sy1: %g \n',round(T(members + 2), 2));
fprintf('Sy2: %g \n',round(T(members + 3), 2));

fprintf('Cost of truss: $%g \n', round(cost, 0));

ratio = Wcrit/cost;
fprintf('Theoretical max load/cost ratio in oz/$: %g \n', round(ratio, 3));
fprintf('The critical failure weight is: %g oz \n', round(Wcrit, 3));
fprintf('The critical member is: %d \n', critMem);

for i = 1:members
    fprintf('m%d Length: %g \n', i, abs(R(i)));
end

end