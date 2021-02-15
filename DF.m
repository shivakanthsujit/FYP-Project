function result=DF(x, v, epsilon, lamda, c)
    dem = 1 + ((1-v)/v)*abs((x-c)/epsilon)^lamda;
    result = 1/dem;
end