function [rn,links] = bccloopgen(NUM_SOURCES,DIST_SOURCE,dx,dy,dz)

slipsys=[1, 1, 0, -1,  1,  1;
         1, 1, 0,  1, -1,  1;
        -1, 1, 0,  1,  1,  1;
        -1, 1, 0,  1,  1, -1;
         1, 0, 1,  1,  1, -1;
         1, 0, 1, -1,  1,  1;
        -1, 0, 1,  1,  1,  1;
        -1, 0, 1,  1,  1, -1;
         0, 1, 1,  1, -1,  1;
         0, 1, 1,  1,  1, -1;
         0,-1, 1,  1,  1,  1;
         0,-1, 1, -1,  1,  1];
     
bufferfactor = 0.6;
%NB Sources are idealised as squares...
Xmin = 0+bufferfactor*DIST_SOURCE;
Xmax = dx*0.75-bufferfactor*DIST_SOURCE;
Ymin = 0+bufferfactor*DIST_SOURCE;
Ymax = dy-bufferfactor*DIST_SOURCE;
Zmin = 0+bufferfactor*DIST_SOURCE;
Zmax = dz-bufferfactor*DIST_SOURCE;

rn = zeros(size(slipsys,1)*16*NUM_SOURCES,4);
links = zeros(size(slipsys,1)*16*NUM_SOURCES,8);

for i=1:size(slipsys,1)
    normal=slipsys(i,1:3);
    normal=normal/norm(normal);
    screw=slipsys(1,4:6);
    screw=screw/norm(screw);
    edge=cross(screw,normal);
    edge=edge/norm(edge);
    bvecsgn=1;
    for j=1:2
        if j==2
            bvecsgn=-1;
        end
        b_vec=bvecsgn*slipsys(1,4:6);
        %Generate midpoints of sources
        midX = Xmin + (Xmax - Xmin).*rand(NUM_SOURCES,1);
        midY = Ymin + (Ymax - Ymin).*rand(NUM_SOURCES,1);
        midZ = Zmin + (Zmax - Zmin).*rand(NUM_SOURCES,1);
        midPTS = horzcat(midX,midY,midZ);   
    end


end
 
end