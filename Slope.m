function S = Slope(Matrix,Resolution,Type)
[x,y]=size(Matrix);
switch Type
    case 'nested' %to use nested loops
        for i=2:x-1
            for j=2:y-1
                deltaZX=(Matrix(i+1,j)-Matrix(i-1,j))/(2*Resolution);
                deltaZY=(Matrix(i,j+1)-Matrix(i,j-1))/(2*Resolution);
                S(i,j) = sqrt((deltaZX^2)+(deltaZY^2));
            end
        end
    case 'indexed' %to use indexed calculations  
        deltaZX = (Matrix(3:end,2:end-1)-Matrix(1:end-2,2:end-1))./(2*Resolution);
        deltaZY = (Matrix(2:end-1,3:end)-Matrix(2:end-1,1:end-2))./(2*Resolution);
        S = sqrt((deltaZX.^2)+(deltaZY.^2));
end
end
