%AARON JOSHUA M. APOLONIA
%Spherical Manipulator Modern Variant

%Joint Space Scheme - Cubic Polynomials - Analysis
disp('Trajectory One-point Command - Cubic Polynomials')
syms theta_final theta_initial t tf

%GIVEN: POS VECTOR [0 0 0] to POS VECTOR [-pi/2 -pi/4 5]
disp('For T1: pos vector [0 0 0] to pos vector [-pi/2 -pi/4 5]')


%General Equation of Displacement Function
disp('General Equation of Displacement Function:  ')
theta = theta_initial + (3*t^2*(theta_final - theta_initial))/tf^2 - (2*t^3*(theta_final - theta_initial))/tf^3

%For Joint Variable 1 (Revolute)
disp('For T1  (Revolute)')
disp('time = 0.10')
theta_1 = subs(theta,[theta_initial, theta_final, tf], [0, -pi/2, 10])

%For Joint Variable 2 (Revolute)
disp('For t2  (Revolute)')
disp('time = 0.10')
theta_1 = subs(theta,[theta_initial, theta_final, tf], [0, -pi/4, 10])

%For Joint Variable 3 (Prismatic)
disp('For d3 (Prismatic)')
disp('time = 0.10')
d_1 = subs(theta,[theta_initial, theta_final, tf], [0, 5, 10])



disp('General Equation of Velocity Function:  ')
theta_derivative = (6*t*(theta_final - theta_initial))/tf^2 - (6*t^2*(theta_final - theta_initial))/tf^3

%For Joint Variable 1 (Revolute)
disp('For t1 (Revolute)')
disp('time = 0.10')
theta_derivative_1 = subs(theta_derivative,[theta_initial, theta_final, tf], [0, -pi/2, 10])


%For Joint Variable 2 (Revolute)
disp('For t2 (Revolute)')
disp('time = 0.10')
theta_derivative_1 = subs(theta_derivative,[theta_initial, theta_final, tf], [0, -pi/4, 10])


%For Joint Variable 3 (Prismatic)
disp('For t3 (Prismatic)')
disp('time = 0.10')
d_derivative_1 = subs(theta_derivative,[theta_initial, theta_final, tf], [0, 5, 10])