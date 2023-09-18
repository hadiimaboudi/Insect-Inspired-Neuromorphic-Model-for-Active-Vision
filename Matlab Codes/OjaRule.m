function dQ=OjaRule(Q,X,Y)

for i=1:size(Q,1)
    for j=1:size(Q,2)
        dQ(i,j)=Y(i)*(X(j)-Y(i)*Q(i,j));
    end
end
