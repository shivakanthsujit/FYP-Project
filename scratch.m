% v, epsilon, lamda, c = 0.5, 0.5, 2, 0;
v = 0.5;
epsilon = 0.5;
lamda = 2;
c = 0;
inp = [-10:0.01:10];
for i=1:length(inp)
out(i) = DF(inp(i), v, epsilon, lamda, c);
end
plot(inp, out)
hold on

v = 0.5;
epsilon = 3;
lamda = 2;
c = 0;
inp = [-10:0.01:10];
for i=1:length(inp)
out(i) = DF(inp(i), v, epsilon, lamda, c);
end
plot(inp, out)
hold on

v = 0.5;
epsilon = 5;
lamda = 2;
c = 0;
inp = [-10:0.01:10];
for i=1:length(inp)
out(i) = DF(inp(i), v, epsilon, lamda, c);
end
plot(inp, out)

function result = center_of_gravity(v, epi, lambda)
	term1 = epi*(v/(1-v))^(1/lambda);
  term2 = 2*cos(pi/lambda);
  result = term1/term2;
end

function result = final_wt_update(epi_t, epi_i, E, lambda, n_s, d_x, c, w, w_cap, k1, k2)
	num = 2*lambda*n_s*E*d_x*(1 - d_x)*(2*c*w_cap + c*k2 + k1);
  dtr = epi_i(w + k2)^2;
  result = epi_t - num/dtr;
end