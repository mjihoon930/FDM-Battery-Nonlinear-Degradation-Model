function Y = output_C_50(in)

%persistent n p c

t=in(1);


%if t==0
    
%    c = evalin('base','c');
%    p = evalin('base','p');
%    n = evalin('base','n');
%end

N=50;
%dr_p = p.R_p/N;

for i=N-1
    C(1,i)=0;
    if i==N-1
        C(1,i)=1;
    end
end

I=in(2);
c_n = in(3:51);
%c_p = in(52:end);

%D_1 = dr_n/(n.D_n*n.a_n*n.L_n*c.F*n.A_n);
%D_2 = dr_p/(p.D_p*p.a_p*p.L_p*c.F*p.A_p);

load('matlab.mat');

Y = interp2(u,cN1,csn_out,I,c_n(end));
%Y(2) = C*c_p + D_2*I;

end