function y = isbw(x)

y = ndims(x)==2;
if isa(x, 'double') & y
   if islogical(x)
      [m,n] = size(x);
      chunk = x(1:min(m,10),1:min(n,10));         
      y = ~any(chunk(:)~=0 & chunk(:)~=1);
      % 如果块是二进制图像，则测试整个图像
      if y
         y = ~any(x(:)~=0 & x(:)~=1);
      end
   else
      y = 0;
   end
elseif isa(x, 'uint8') & y
   y = islogical(x);
end

y = logical(double(y));




