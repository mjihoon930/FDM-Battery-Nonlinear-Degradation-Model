function out =state_eqns_fdm_50(in)

persistent n  c

t=in(1);

if t==0
    
    c = evalin('base','c');
    n = evalin('base','n');
end

I = in(2);


N = 50;
dr = n.R_n/N;

A = matrix_A_n(50);
%B = matrix_B_n(50);

C_n=in(3:end);

for i=N-1
    D(1,i)=0;
    if i==N-1
        D(1,i)=1;
    end
end

load('matlab.mat');
g = interp2(u,cN1,csn_out,I,C_n(end));

C = A*C_n;
C(end) = (n.D_n/(dr*(N-1)*dr^2))*((dr*(N-1)+dr)*g-2*(dr*(N-1))*C_n(end)+(dr*(N-1)-dr)*C_n(end-1));

out = C;

end


