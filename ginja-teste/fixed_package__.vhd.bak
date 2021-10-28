LIBRARY ieee ;
USE ieee.std_logic_1164.all ;


PACKAGE fixed_package IS

CONSTANT MAX_IND : INTEGER := 15;
CONSTANT MIN_IND : INTEGER := -15;
SUBTYPE fixed_range IS INTEGER RANGE MIN_IND TO MAX_IND;
TYPE fixed IS BIT_VECTOR(fixed_range RANGE MAX_IND DOWNTO MIN_IND  )
TYPE matrix is array (natural range<>, natural range<>) of bit;
END fixed_package


PACKAGE BODY fixed_package IS

FUNCTION MAXIMUM(arg_L, arg_R: INTEGER) RETURN INTEGER IS
VARIABLE maxarg : INTEGER;
maxarg:=arg_L;
IF arg_R > arg_L:
	maxarg:=arg_R;
END IF;
return maxarg; --se os dois forem iguais, nao importa qual argumento a funcao vai retornar
END MAXIMUM;

FUNCTION MINIMUM(arg_L, arg_R: INTEGER)RETURN INTEGER IS
VARIABLE minarg : INTEGER;
IF arg_R < arg_L:
	minarg:=argR;
END IF;
return minarg; --se os dois forem iguais, nao importa qual argumento a funcao vai retornar
END MINIMUM;

FUNCTION COMP1_FIXED(arg_L: fixed(n-1 DOWNTO 0) IS return fixed(n-1 DOWNTO 0)
VARIABLE comparg_L := fixed (n-1 DOWNTO 0)
FOR i in n-1 DOWNTO 0:
	comparg_L := not(arg_L(i));
END FOR;
return comparg_L;
END COMP1_FIXED;

FUNCTION ADD_SUBFIXED (x,y: BIT_VECTOR(n-1 DOWNTO 0),c: BIT) RETURN  BIT_VECTOR IS --c: carry
	VARIABLE v : BIT:=c;
        VARIABLE s : BIT_VECTOR(n-1 DOWNTO 0);
BEGIN 
 FOR i IN 0 TO n-1 LOOP 
    s(i) := x(i) XOR y(i) XOR v;
    v    := (x(i) AND y(i) ) OR (v AND (x(i) OR y(i))));
 END LOOP;
END ADD_SUBFIXED;


FUNCTION mult_fixed(A: fixed(m-1 DOWNTO 0),B: fixed(n-1 DOWNTO 0) IS return fixed(n-1 DOWNTO 0)
VARIABLE Mij: matrix(0 TO m-1, 0 TO m+n-1);
VARIABLE Cij: matrix(0 TO m-1, 0 TO m+n);
VARIABLE Pij: matrix(0 TO m, 0 TO m+n);
VARIABLE Blinha : fixed(m+n-1 DOWNTO 0);

Blinha <= (m+n-1 DOWNTO n => '0') & B;

initCij: for i in 0 to m-1 LOOP
	Cij(i,0) <='0';
END LOOP initCij;

initPijcol: for i in 0 to m LOOP
	Pij(i,0) <= '0';
end LOOP initPijcol;

initPijrow: for i in 0 to m+n-1 LOOP
	Pij(i,0) <= '0';
end LOOP initPijrow;

Mijcol: for i in m-1 DOWNTO 0 LOOP
      Mijrow: for j in m+n-1 DOWNTO 0 LOOP
              Mij(i,j) <= A(i) and Blinha(j);
      end LOOP Mijrow;
end LOOP Mijcol;

Pijcol: for i in m-1 DOWNTO 0 LOOP
      Pijrow: for j in m+n-1 DOWNTO 0 LOOP
         Pij(i,j+1)) <= Pij(i+1,j) xor Mij(i,j) xor Cij(i,j);
         Cij(i,j+1)  <= (Pij(i+1,j) and (Mij(i,j) or Cij(i,j))) or (M(i,j) and C(i,j));
end LOOP Pijrow;
end LOOP Pijcol;
gen_pi: for i in m+n-1 DOWNTO 0 LOOP
        P(i) <= Pij(0,i+1);
end LOOP gen_pi;

return P; 
END fixed_package;
