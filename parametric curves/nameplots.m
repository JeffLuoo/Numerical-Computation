load data.mat
x = x{1};
y = y{1};



figure(1);
plot(x,y,'o');
grid on
axis([0 1 0 1])
title('Raw Data Points')

figure(2);
plot(x,y,'-');
grid on
axis([0 1 0 1])
title('Piecewise Linear Points')


figure(3);
%length of array
N = length(x);

%index the points for t
t = 1:N;

%construct a cubic spline "object", y_cs
%via matlab's "csape" routine.
x_cs = csape(t,x, 'variational');

y_cs = csape(t,y, 'variational');

%subdivide the intervals by 3 
%similar to course notes 3.1/3.2
N = length(t);

tref = zeros(1,6*(N-1)+1);

for k = 1:N-1
    i = 6*(k-1)+1;
    dt = t(k+1) - t(k);
    tref(i) = t(k);
    tref(i+1) = t(k)+dt/6 ;
    tref(i+2) = t(k)+2*dt/6;
    tref(i+3) = t(k)+3*dt/6;
    tref(i+4) = t(k)+4*dt/6;
    tref(i+5) = t(k)+5*dt/6;
end
tref(6*(N-1)+1) = t(N);

xx = ppval(tref, x_cs);
yy = ppval(tref, y_cs);

%plot the results
plot(xx,yy); %plot piecewise cubic
title('Cubic Splines - Natural End Conditions')


figure(4);
%length of array
N = length(x);

%index the points for t
t = 1:N;

%construct a cubic spline "object", y_cs
%via matlab's "csape" routine.
x_cs = csape(t,x, 'not-a-knot');

y_cs = csape(t,y, 'not-a-knot');

%subdivide the intervals by 3 
%similar to course notes 3.1/3.2
N = length(t);

tref = zeros(1,6*(N-1)+1);

for k = 1:N-1
    i = 6*(k-1)+1;
    dt = t(k+1) - t(k);
    tref(i) = t(k);
    tref(i+1) = t(k)+dt/6 ;
    tref(i+2) = t(k)+2*dt/6;
    tref(i+3) = t(k)+3*dt/6;
    tref(i+4) = t(k)+4*dt/6;
    tref(i+5) = t(k)+5*dt/6;
end
tref(6*(N-1)+1) = t(N);

xx = ppval(tref, x_cs);
yy = ppval(tref, y_cs);

%plot the results
plot(xx,yy); %plot piecewise cubic
title('Cubic Splines - Not-A-Knot End Conditions')
