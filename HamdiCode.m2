needsPackage "Matroids"
needsPackage "Polyhedra"

valuatedMatroid = (d,I) -> (
    Rng=ring I;
    Monsd=flatten entries basis(d,Rng);
    Id = super basis(d,I);
    columnsM=apply(flatten entries Id,f->((coefficients(f,Monomials=>Monsd))_1));
    M=columnsM_0;
    scan(#columnsM-1,i->(M=M|columnsM_(i+1)));
    Ad=transpose(M);
    -- the Macaulay Matrix of I in degree d 
    Bd=transpose(gens(ker(Ad)));
    A=subsets(#Monsd,rank(Bd));
    pd=for i from 0 to #A-1 list determinant(submatrix(Bd,A#i));
    return pd;
); 
