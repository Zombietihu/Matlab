I=imread('abich.jpg');
%supervisado=ExtraeCorazon(I);
mhu=FinalCorazon(I);
j=1;
k=1;
for i=1:92
    if mhu(i,1)>0.7686 && mhu(i,1)<1.2472
        corazon(j)=mhu(i,1);
        j=j+1;
    else
        if mhu(i,1)>0.555 && mhu(i,1)<.8617
            tqm(k)=mhu(i,1);
            k=k+1;
        end
    end
end
