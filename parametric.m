
function result=parametric(inp, alpha, gmma)
inner = 1.0;
for i=1:length(inp)
    inner = inner * (1 + gmma*(((1-inp(1))/inp(i))^alpha));
end
inner = inner - 1;
inner = inner / gmma;
inner = inner^(1/alpha);
inner = inner + 1;
result = 1/inner;  
end