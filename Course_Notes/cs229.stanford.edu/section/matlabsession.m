% MATLAB is now on v7, but v5 and v6 are OK
% Available for Windows, Mac, Linux
% Octave is a free MATLAB-compatible alternative... www.octave.org
% Scilab is another free alternative... scilabsoft.inria.fr 

% Basic MATLAB Commands

% elementary operations
5+6
3-2
5*8
1/2
a=3
a=3;
b=2
a^b
c=a^b
c=a^b;

%matrices
m = [1 2; 3 4]
m'
n = 2*ones(2,2)
p = zeros(3,2)
m*n
m(1,:)
m(:,2)
m(:,1)*m(:,2)

%component wise operations
m(:,1).*m(:,2)
m.*n
m./n
m.^2   % compare to m^2

%plotting
x=0:.01:1;
y2=x.^2;
plot(x,y2)
y4=x.^4;
plot(x,y4)
hold on
plot(x,y2,'bx-')
grid
y8 = x.^8;
hold off
plot(x,y8);

print -depsc foo.eps
figure
plot(x,y2)
plot(x,y4)

help xlabel
xlabel('x axis');

% load save
save 'all.mat' 
save 'x.mat' x
who
whos
clear
load 'all.mat'
who
clear
load 'x.mat'
who
load 'all.mat'
% help lookfor
help  plot
plot(x,y2,'*');
hold on
plot(x,y4,'g');

% try out the 'subplot' function

% random numbers
rand
randn
randn(4,4);

% vectorize and matrix-ize to speed up code
X = randn(100,200);
Y = rand(100,200);

for k = (1:100)
	for m = (1:200)
		X(k,m) + Y(k,m); % C-style... slow!!
	end;
end;

abs(X); % fast!!

for k = (1:100)
	for m = (1:200)
		abs(X(k,m)); % C-style.. slow!!
	end;
end;

abs(X); % fast!!

% if you have the Statistics toolbox installed...
pdf(0.7, 'Normal', 2, 3);

