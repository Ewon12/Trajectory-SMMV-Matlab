%AARON JOSHUA M. APOLONIA
%Spherical Manipulator Modern Variant
disp('Spherical Manipulator Modern Variant')


syms  a1 a2 a3 xx yy zz
a1=6;
a2=4;
a3=4;

H1 = Link([0,a1,0,pi/2,0]);
H1.qlim = pi/180*[-90 90];
H2 = Link([0,0,a2,pi/2,0,pi/2]);
H2.qlim=pi/180*[-90 0];
H3 = Link([0,0,0,0,1,a3]);
H3.qlim = [0 5];

SMMV = SerialLink([H1 H2 H3 ],'name','Spherical Variant')
SMMV.plot([0 0 0], 'workspace', [-15 15 -15 15 -15 15])

qf=[pi/2 -pi/4 5]
Tf=SMMV.fkine(qf)

qready=[0 0 0]
q=SMMV.ikine(Tf,qready,'mask', [1 1 1 0 0 0])

t=0:0.10:3
Traj=jtraj(qready,qf,t)
Tr=fkine(SMMV,Traj)

for i =1:1:length(t)
    T=Tr(i)
    trs=transl(T)
    xx(i)=trs(1)
    yy(i)=trs(2)
    zz(i)=trs(3)
end

figure(2)
plot(SMMV,Traj)
hold on
plot3(xx,yy,zz,"Color",[0 0 1],"LineWidth",2)
