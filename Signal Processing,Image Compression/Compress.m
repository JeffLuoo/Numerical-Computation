function [y, drop] = Compress(X, tol)
    block_size = 32;
    f = X;
    [row, col] = size(f);
   
 
 result = zeros(row, col);
 Num_drop = 0;
 Num_nonzero = 0;
 for i = 1:block_size:row
     for j = 1:block_size:col
         %for each block of 32
         f_32 = f(i:i+block_size-1, j:j+block_size-1);
         f_32 = fft2(f_32);
         temp = f_32(1, 1);
         f_32(1,1) = 0;
         maxf = max(max(abs(f_32)));
         
         %number of nonzero and number of dropped
         f_nonzero = f_32(f_32 ~=0);
         Num_nonzero = Num_nonzero + length(f_nonzero);
         Ele_dropped = f_nonzero(abs(f_nonzero) <= maxf*tol);
         Num_drop = Num_drop + length(Ele_dropped);
         
         %set to be 0
         f_32(abs(f_32) <= maxf*tol) = 0;
         
         f_32(1,1) = temp;
         %reconstruct the new/compressed 3232 image array by using the inverse 2D Fourier
         result(i:i+block_size-1, j:j+block_size-1) = real(ifft2(f_32));
     end
 end
 
 y = result;
 drop = Num_drop / Num_nonzero;
 
end

         