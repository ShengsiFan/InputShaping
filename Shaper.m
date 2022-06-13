function [shaper] = Shaper(xi,omega,type)
    e =2.718281828;
    pi=3.141592654;
    V=0.1  % EIČÝ´í
    
    if type==1 % ZV
        t2=pi/(omega*sqrt(1-xi^2));
        A1=e^(xi*omega*t2)/(1+e^(xi*omega*t2));
        A2=1/(1+e^(xi*omega*t2));
        A3=0;    
       
    elseif type==2 % ZVD
        t2=pi/(omega*sqrt(1-xi^2));
        K=e^(-xi*pi/sqrt(1-xi^2));
        A1=1/(1+2*K+K^2);
        A2=2*K/(1+2*K+K^2);
        A3=K^2/(1+2*K+K^2);
        
    elseif type==3 % EI
        A1 = (1+V)/4;
        A2 = (1-V)/2;
        A3 = (1+V)/4;
        t2 = pi/omega;
    end
    t1=0;

    shaper = [A1 A2 A3 t1 t2 2*t2];
end
