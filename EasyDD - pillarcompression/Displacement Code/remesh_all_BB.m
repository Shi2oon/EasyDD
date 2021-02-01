% Remesh rule %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. This includes the original remesh rule.
% 2. Topological changes on free surface do not include force/velocity
% calculation. (Thus, just rearrangements of rn and links matrix)
%
% Francesco Ferroni
% Defects Group / Materials for Fusion and Fission Power Group
% Department of Materials, University of Oxford
% francesco.ferroni@materials.ox.ac.uk
% January 2014
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 	
function [rnnew,linksnew,connectivitynew,linksinconnectnew,fsegnew]=remesh_all_BB(rn,links,connectivity,linksinconnect,fseg,lmin,lmax,areamin,areamax,MU,NU,a,Ec,mobility,doremesh,dovirtmesh,vertices,...
    uhat,nc,xnodes,D,mx,mz,w,h,d,P,fn)

% Original remesh rule %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (doremesh)
[rnnew,linksnew,connectivitynew,linksinconnectnew,fsegnew]=remesh(rn,links,connectivity,linksinconnect,fseg,lmin,lmax,areamin,areamax,MU,NU,a,Ec,mobility,vertices,...
    uhat,nc,xnodes,D,mx,mz,w,h,d);
end

if doremesh == 0   %to enter in remesh_all doremesh has to be 1.. so is the loop useless? M
rnnew = rn;
linksnew = links;
fsegnew = fseg;
connectivitynew = connectivity;
linksinconnectnew = linksinconnect;
end

if (dovirtmesh)
% Beginning of surface remeshing for surface node. %%%%%%%%%%%%%%%%%%%%
[rnnew,linksnew,connectivitynew,linksinconnectnew]=remesh_surf_BB(rnnew,linksnew,connectivitynew,linksinconnectnew,vertices,P,fn);
end

end