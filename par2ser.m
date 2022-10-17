%%
%%
% *Code File*
function [output]=par2ser(input)
[m,n]=size(input);
for ii=1:m
   output((ii-1)*n+1:ii*n,1)=input(ii,:);
end
%%
% *Output Image*
% 
% <<par2ser.PNG>>
%
