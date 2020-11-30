orgin = [0,0,0];

A_1 = [0.20,0.70,0.10];
A_2 = [0.10,0.90,0.20];
P_1 = [4.6,6.4,5.5];
P_2 = P_1 + A_1

% Part A
dot_prod = dot(A_1, A_2);

% Part B
projection = (dot(A_1,A_2)/norm(A_2)^2)*A_2;

% Part C
angle = atan2d(norm(cross(A_1,A_2)),dot(A_1,A_2));

% Part D
cross_prod = cross(A_1, A_2);

% Part E
P_1 = repmat(P_1,size(orgin,1),1);
P_2 = repmat(P_2,size(orgin,1),1);
a = P_1 - P_2;
b = orgin - P_2;
d = sqrt(sum(cross(a,b,2).^2,2)) ./ sqrt(sum(a.^2,2));

% Part F
plane_a = cross_prod(1);
plane_b = cross_prod(2);
plane_c = cross_prod(3);
plane_d = sum(P_2 .* cross_prod);

plane_x = 0;
plane_y = 0;
plane_z = 0;

plane_dist = (plane_a*plane_x+plane_b*plane_y+plane_c*plane_z+plane_d)/ ... 
    sqrt(plane_a^2+plane_b^2+plane_c^2)