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
S1_pick=jtraj(q1_origin,q2_pick,t)

q2_return=[0 0 0]
S2_return=jtraj(q2_pick,q2_return,t)

q3_rotate=[-pi/2 0 0]
S3_rotate=jtraj(q2_return,q3_rotate,t)

q4_place=[-pi/2 -pi/4 2]
S4_place=jtraj(q3_rotate,q4_place,t)

q5_return2=[-pi/2 0 0]
S5_return2=jtraj(q4_place,q5_return2,t)

q6_rotate2=[-pi 0 0]
S6_rotate2=jtraj(q5_return2,q6_rotate2,t)

q7_pick2=[-pi -pi/4 2]
S7_pick2=jtraj(q6_rotate2,q7_pick2,t)

q8_return3=[-pi 0 0]
S8_return3=jtraj(q7_pick2,q8_return3,t)

q9_rotate3=[pi/2 0 0]
S9_rotate3=jtraj(q8_return3,q9_rotate3,t)

q10_place2=[pi/2 -pi/4 2]
S10_place2=jtraj(q9_rotate3,q10_place2,t)

q11_return4=[pi/2 0 0]
S11_return4=jtraj(q10_place2,q11_return4,t)

q12_rotate4=[0 0 0]
S12_rotate4=jtraj(q11_return4,q12_rotate4,t)

q13_place3=[0 -pi/4 2]
S13_place3=jtraj(q12_rotate4,q13_place3,t)

q14_return5=[0 0 0]
S14_return5=jtraj(q13_place3,q14_return5,t)

figure(1)
plot(SMMV,S1_pick)
plot(SMMV,S2_return)
plot(SMMV,S3_rotate)
plot(SMMV,S4_place)
plot(SMMV,S5_return2)
plot(SMMV,S6_rotate2)
plot(SMMV,S7_pick2)
plot(SMMV,S8_return3)
plot(SMMV,S9_rotate3)
plot(SMMV,S10_place2)
plot(SMMV,S11_return4)
plot(SMMV,S12_rotate4)
plot(SMMV,S13_place3)
plot(SMMV,S14_return5)