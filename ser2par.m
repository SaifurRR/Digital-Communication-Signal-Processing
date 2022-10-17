
% *Code File*
input= ([1:50];8);
function [output]=ser2par(input,bits)
%bits is the No. of bits in Parallel for ex, a byte has 8 bits
l=length(input);
input(l+1:ceil(l/bits)*bits)=0;
for ii=1:ceil(l/bits)
    output(ii,:)=input(((ii-1)*bits)+1:((ii-1)*bits)+bits);
end
display(output)
% *Output Image*
% 
% <<ser2par.PNG>>
%
