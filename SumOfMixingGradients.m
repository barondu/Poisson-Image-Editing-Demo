function [ output ] = SumOfMixingGradients( ...
    center_index_src    , src_img_1D   , height_src,...
    center_index_target , targetImg_1D , height_target)
%UNTITLED14 Summary of this function goes here
%   Detailed explanation goes here
output=0.0;
% output = ...
%     4*(double(src_img_1D(center_index_src)))-double(src_img_1D(center_index_src-1))- ...
%     double(src_img_1D(center_index_src+1))-double(src_img_1D(center_index_src-height_src))-...
%     double(src_img_1D(center_index_src+height_src));

%Center with top
if abs( double(src_img_1D(center_index_src))-...
        double(src_img_1D(center_index_src-1)) )>=...
   abs( double(targetImg_1D(center_index_target))-...
        double(targetImg_1D(center_index_target-1)) )
  
    output=output+ double(src_img_1D(center_index_src))-...
                   double(src_img_1D(center_index_src-1));
else
    output=output+ double(targetImg_1D(center_index_target))-...
                   double(targetImg_1D(center_index_target-1));
end
%Center with bottom
if abs( double(src_img_1D(center_index_src))- ...
        double(src_img_1D(center_index_src+1)) ) >= ...
   abs( double(targetImg_1D(center_index_target))-...
        double(targetImg_1D(center_index_target+1)) )
  
    output=output+ double(src_img_1D(center_index_src))-...
                   double(src_img_1D(center_index_src+1));
else
    output=output+ double(targetImg_1D(center_index_target))-...
                   double(targetImg_1D(center_index_target+1));
end

%Center with left
if abs( double(src_img_1D(center_index_src))-...
        double(src_img_1D(center_index_src-height_src))) >=  ...
   abs( double(targetImg_1D(center_index_target))-...
        double(targetImg_1D(center_index_target-height_target)) )
  
    output=output+double(src_img_1D(center_index_src))- ...
                  double(src_img_1D(center_index_src-height_src));
else
    output=output+double(targetImg_1D(center_index_target))-...
                  double(targetImg_1D(center_index_target-height_target));
end


%Center with right
if abs( double(src_img_1D(center_index_src))-...
        double(src_img_1D(center_index_src+height_src)) )>=...
   abs( double(targetImg_1D(center_index_target))-...
        double(targetImg_1D(center_index_target+height_target)) )
  
    output=output+double(src_img_1D(center_index_src))-...
                  double(src_img_1D(center_index_src+height_src));
else
    output=output+double(targetImg_1D(center_index_target))-...
                  double(targetImg_1D(center_index_target+height_target));
end


end
