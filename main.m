[ois, future] = getdata();

[nDates,nTerms] = size(future);
NSBeta = zeros(nDates,nTerms,4);

for i = 1:nDates
    for j = 1:nTerms
        NSBeta(i,j,:) = optimering(history);
    end
end