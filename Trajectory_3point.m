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

t=0:0.10:2
q1_origin=[0 0 0]
q2_pick=[0 -pi/4 2]
S1_pick=jtraj(q1_origin,q2_pick,t) % step1

q2_return=[0 0 0]
S2_return=jtraj(q2_pick,q2_return,t) % step2

q3_rotation=[-pi/2 0 0]
S3_rotation=jtraj(q2_return,q3_rotation,t) % step3

q4_place=[-pi/2 -pi/4 2]
S4_place=jtraj(q3_rotation,q4_place,t) % step4


S5_return2=jtraj(q4_place,q3_rotation,t) % step5

q6_rotation2=[-pi 0 0]
S6_rotation2=jtraj(q3_rotation,q6_rotation2,t) % step6

q7_pick2=[-pi -pi/4 2]
S7_pick2=jtraj(q6_rotation2,q7_pick2,t)  % step7


S8_return3=jtraj(q7_pick2,q6_rotation2,t) % step8

q9_rotation3=[0 0 0]
S9_rotation3=jtraj(q6_rotation2,q9_rotation3,t) % step9

S10_place2=jtraj(q9_rotation3,q2_pick,t) % step10

S11_origin=jtraj(q2_pick,q1_origin,t) % step11

figure(1)
plot(SMMV,S1_pick)
plot(SMMV,S2_return)
plot(SMMV,S3_rotation)
plot(SMMV,S4_place)
plot(SMMV,S5_return2)
plot(SMMV,S6_rotation2)
plot(SMMV,S7_pick2)
plot(SMMV,S8_return3)
plot(SMMV,S9_rotation3)
plot(SMMV,S10_place2)
plot(SMMV,S11_origin)