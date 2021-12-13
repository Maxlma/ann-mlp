----------------------------
--Alunos:
--Gabriel Ginja  #USP: 8954902
--Marcio Amorim  #USP: 13063610

--Atualizado 13/12/21
----------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.MATH_REAL.ALL;

PACKAGE fixed_package IS
	CONSTANT N_BIT: INTEGER := 10;
	CONSTANT max_ind: INTEGER := 15;
	CONSTANT min_ind: INTEGER := -15; 
	TYPE fixed IS ARRAY(INTEGER RANGE <>) OF BIT;
	TYPE matrix IS ARRAY (NATURAL RANGE <>, NATURAL RANGE <>) OF BIT;
	SUBTYPE fixed_range IS integer RANGE min_ind TO max_ind;
	FUNCTION MAX (arg_L, arg_R: INTEGER) RETURN INTEGER;
	FUNCTION MIN (arg_L, arg_R: INTEGER) RETURN INTEGER;
	FUNCTION COMP1_FIXED(arg_L: fixed) RETURN fixed;
	FUNCTION ADD_SUB_FIXED (arg_L, arg_R: fixed; c: BIT) RETURN fixed;
	FUNCTION MULT_FIXED (arg_L, arg_R: fixed) RETURN fixed;
	FUNCTION to_fixed (arg_L: INTEGER; max_range: fixed_range := max_ind;
						min_range: fixed_range := min_ind) RETURN fixed;
	FUNCTION to_integer (arg_L: fixed) RETURN integer;
	FUNCTION "+"(arg_L, arg_R: fixed) RETURN fixed;
	FUNCTION "+"(arg_L: fixed; arg_R: INTEGER) RETURN fixed;
	FUNCTION "+"(arg_L: INTEGER; arg_R: fixed) RETURN fixed;
	FUNCTION "+"(arg_L: fixed; arg_R: REAL) RETURN fixed;
	FUNCTION "+"(arg_L: REAL; arg_R: fixed) RETURN fixed;
	FUNCTION "-"(arg_L, arg_R: fixed) RETURN fixed;
	FUNCTION "-"(arg_L: fixed; arg_R: INTEGER) RETURN fixed;
	FUNCTION "-"(arg_L: INTEGER; arg_R: fixed) RETURN fixed;
	FUNCTION "-"(arg_L: fixed; arg_R: REAL) RETURN fixed;
	FUNCTION "-"(arg_L: REAL; arg_R: fixed) RETURN fixed;
	FUNCTION "*"(arg_L, arg_R: fixed) RETURN fixed;
	FUNCTION "*"(arg_L: fixed; arg_R: INTEGER) RETURN fixed;
	FUNCTION "*"(arg_L: INTEGER; arg_R: fixed) RETURN fixed;
	FUNCTION "*"(arg_L: fixed; arg_R: REAL) RETURN fixed;
	FUNCTION "*"(arg_L: REAL; arg_R: fixed) RETURN fixed;
	FUNCTION to_fixed (arg_L: REAL; max_range, min_range: fixed_range) RETURN fixed;
	FUNCTION to_real (arg_L: fixed) RETURN REAL;
	FUNCTION Activation (X : fixed) RETURN fixed;
END fixed_package;

PACKAGE BODY fixed_package IS
--Internas
	--Auxiliares aritmeticas
	--MAX
		FUNCTION MAX (arg_L, arg_R: INTEGER) RETURN INTEGER IS
		BEGIN
			IF arg_L > arg_R THEN
				return arg_L;
			ELSE
				return arg_R;
			END IF;
		END MAX;
	--MIN
		FUNCTION MIN (arg_L, arg_R: INTEGER) RETURN INTEGER IS
		BEGIN
			IF arg_L < arg_R THEN
				RETURN arg_L;
			ELSE
				RETURN arg_R;
			END IF;
		END MIN;
	--COMP1_FIXED
		FUNCTION COMP1_FIXED(arg_L: fixed) RETURN fixed IS
			VARIABLE arg_L_COMP1: fixed(arg_L'HIGH DOWNTO arg_L'LOW);
		BEGIN
			FOR k in arg_L'LOW TO arg_L'HIGH LOOP
				arg_L_COMP1(k) := NOT(arg_L(k)); 
			END LOOP;
			RETURN arg_L_COMP1;
		END COMP1_FIXED;
	--ADD_SUB_FIXED
		FUNCTION ADD_SUB_FIXED (arg_L, arg_R: fixed; c: BIT) RETURN fixed IS
			VARIABLE s: fixed(arg_L'HIGH DOWNTO arg_L'LOW);
			VARIABLE v: BIT;
		BEGIN
			v := c;
			FOR k in arg_L'LOW TO arg_L'HIGH LOOP
				s(k) := (arg_L(k) XOR arg_R(k)) XOR v;
				v := (arg_L(k) AND arg_R(k)) OR (v AND (arg_L(k) OR arg_R(k)));
			END LOOP;
			RETURN s;
		END ADD_SUB_FIXED;
		
	--MULT_FIXED
		FUNCTION MULT_FIXED (arg_L, arg_R: fixed) return fixed IS
			CONSTANT M: INTEGER := arg_L'LENGTH;
			CONSTANT N: INTEGER := arg_R'LENGTH;
			VARIABLE Mij: matrix(0 TO M-1, 0 TO M+N-1);
			VARIABLE Cij: matrix(0 TO M-1, 0 TO M+N);
			VARIABLE Pij: matrix(0 TO M, 0 TO M+N);
			VARIABLE blinha: fixed(M+N-1 DOWNTO 0);
			VARIABLE P: fixed(M+N-1 DOWNTO 0);
		BEGIN
			
			blinha := (M+N-1 downto N => '0') & arg_R;
			
			initCij: FOR i IN 0 TO M-1 LOOP
				Cij(i, 0) := '0';
			END LOOP initCij;
			
			initPij1: FOR i IN 0 to M LOOP
				Pij(i, 0) := '0';
			END LOOP initPij1;
			
			initPij2: FOR j IN 1 TO M+N-1 LOOP
				Pij(m, j) := '0';
			END LOOP initPij2;
			
			Mijcol: FOR i IN M-1 DOWNTO 0 LOOP
				Mijrow: FOR j IN M+N-1 DOWNTO 0 LOOP
					Mij(i,j) := arg_L(i) and blinha(j);
				END LOOP Mijrow;
			END LOOP Mijcol;
			
			Pijcol: FOR i IN M-1 DOWNTO 0 LOOP
				Pijrow: FOR j IN 0 TO M+N-1 LOOP
					Pij(i,j+1) := Pij(i+1,j) XOR Mij(i,j) XOR Cij(i,j);
					Cij(i,j+1) := (Pij(i+1,j) AND (Mij(i,j) OR Cij(i,j))) OR (Mij(i,j) AND Cij(i,j));
					--SOMA: som PORT MAP(Pij(i+1,j),Cij(i,j),Mij(i,j),Pij(i,j+1),Cij(i,j+1));
				END LOOP Pijrow;
			END LOOP Pijcol;
			
			initPi: FOR i IN M+N-1 DOWNTO 0 LOOP
				P(i) := Pij(0,i+1);
			END LOOP initPi;

			RETURN P;		
		END MULT_FIXED;
			
--Externas
	--Conversao de tipo
		--to_fixed
		FUNCTION to_fixed (arg_L: INTEGER; max_range: fixed_range := max_ind;
							min_range: fixed_range := min_ind) RETURN fixed IS
			VARIABLE int_res		: integer := arg_L;						
			VARIABLE res			: fixed (max_range DOWNTO min_range);
			VARIABLE res_0			: fixed (max_range DOWNTO min_range);   
	  
		BEGIN
			FOR k IN min_range TO max_range LOOP
				res(k) := '0';
				res_0(k) := '0';
			END LOOP;
			
			IF int_res<0 THEN
				int_res:=int_res*(-1);
			END IF;
			
			IF int_res = 1 THEN
				res(min_range) := '1';
			ELSE
				FOR k IN min_range TO max_range-1 LOOP
					IF int_res >= 1 AND int_res >= -1 THEN 
						IF (int_res MOD 2) = 0 THEN
							res(k) := '0';
						ELSE
							res(k) := '1';
						END IF;
						int_res := INTEGER(int_res / 2);
					ELSE
						res(k) := '0';
					END IF;
					
				END LOOP;
			END IF;
			
			IF arg_L < 0 THEN
				res := ADD_SUB_FIXED(COMP1_FIXED(res),res_0,'1');
			END IF;
			
			RETURN res;
		END	to_fixed;	
					
		--to_integer
		FUNCTION to_integer (arg_L: fixed) RETURN INTEGER IS
			VARIABLE v_arg_L: fixed(arg_L'RANGE);
			VARIABLE res: INTEGER := 0;	
		BEGIN
		
			v_arg_L := arg_L;
			
			IF arg_L(arg_L'LEFT) = '1' THEN
				v_arg_L := COMP1_FIXED(arg_L);
			END IF;
			
			FOR k IN v_arg_L'LEFT DOWNTO 0 LOOP
				IF v_arg_L(k) = '1' THEN
					res := (2**k) + res;
				END IF;
			END LOOP;
			
			IF arg_L(arg_L'LEFT) = '1' THEN
				res := -1*(res+1);
			END IF;
			
			RETURN res;
		END to_integer;		
		--Aritmeticas
		-- +
		FUNCTION "+" (arg_L, arg_R: fixed) RETURN fixed IS
			VARIABLE res: fixed(arg_L'HIGH DOWNTO arg_L'LOW);
		BEGIN	
			res := ADD_SUB_FIXED(arg_L, arg_R, '0');
			RETURN res;
		END "+";
		-- -	
		FUNCTION "-" (arg_L, arg_R: fixed) RETURN fixed IS
			VARIABLE NEG_arg_R:  fixed(arg_R'HIGH DOWNTO arg_R'LOW); 
			VARIABLE res: fixed(arg_L'HIGH DOWNTO arg_L'LOW);
		BEGIN
			NEG_arg_R := COMP1_FIXED(arg_R);
			res := ADD_SUB_FIXED(arg_L, NEG_arg_R, '1');
			RETURN res;
		END "-";
		
		--"+"
		FUNCTION "+"(arg_L: fixed; arg_R: INTEGER) RETURN fixed IS
			VARIABLE res: fixed(arg_L'HIGH DOWNTO arg_L'LOW);
			VARIABLE arg_F: fixed(arg_L'HIGH DOWNTO arg_L'LOW);
		BEGIN
			arg_F := to_fixed(arg_R);
			RETURN arg_L + arg_F;
		END "+";
		
		FUNCTION "+" (arg_L: INTEGER; arg_R: fixed) RETURN fixed IS
			VARIABLE res: fixed(arg_R'HIGH DOWNTO arg_R'LOW);
			VARIABLE arg_F: fixed(arg_R'HIGH DOWNTO arg_R'LOW);
		BEGIN
			arg_F := to_fixed(arg_L);
			RETURN arg_F + arg_R;
		END "+";
		
		FUNCTION "+" (arg_L: REAL; arg_R: fixed) RETURN fixed IS
			VARIABLE res: fixed(arg_R'HIGH DOWNTO arg_R'LOW);
			VARIABLE arg_F: fixed(arg_R'HIGH DOWNTO arg_R'LOW);
		BEGIN
			arg_F := to_fixed(arg_L,arg_R'HIGH,arg_R'LOW);
			RETURN arg_F + arg_R;
		END "+";
		
		FUNCTION "+" (arg_L: fixed; arg_R: REAL) RETURN fixed IS
			VARIABLE res: fixed(arg_L'HIGH DOWNTO arg_L'LOW);
			VARIABLE arg_F: fixed(arg_L'HIGH DOWNTO arg_L'LOW);
		BEGIN
			arg_F := to_fixed(arg_R,arg_L'HIGH,arg_L'LOW);
			RETURN arg_F + arg_R;
		END "+";		
	
		--"-"
		FUNCTION "-" (arg_L: fixed; arg_R: INTEGER) RETURN fixed IS
			VARIABLE res: fixed(arg_L'HIGH DOWNTO arg_L'LOW);
			VARIABLE arg_F: fixed(arg_L'HIGH DOWNTO arg_L'LOW);
		BEGIN
			arg_F := to_fixed(arg_R);
			RETURN arg_L - arg_F;
		END "-";
		
		FUNCTION "-" (arg_L: INTEGER; arg_R: fixed) RETURN fixed IS
			VARIABLE res: fixed(arg_R'HIGH DOWNTO arg_R'LOW);
			VARIABLE arg_F: fixed(arg_R'HIGH DOWNTO arg_R'LOW);
		BEGIN	
			arg_F := to_fixed(arg_L);
			RETURN arg_F - arg_R;
		END "-";
		
		FUNCTION "-" (arg_L: REAL; arg_R: fixed) RETURN fixed IS
			VARIABLE res: fixed(arg_R'HIGH DOWNTO arg_R'LOW);
			VARIABLE arg_F: fixed(arg_R'HIGH DOWNTO arg_R'LOW);
		BEGIN
			arg_F := to_fixed(arg_L,arg_R'HIGH,arg_R'LOW);
			RETURN arg_F - arg_R;
		END "-";
		
		FUNCTION "-" (arg_L: fixed; arg_R: REAL) RETURN fixed IS
			VARIABLE res: fixed(arg_L'HIGH DOWNTO arg_L'LOW);
			VARIABLE arg_F: fixed(arg_L'HIGH DOWNTO arg_L'LOW);
		BEGIN
			arg_F := to_fixed(arg_R,arg_L'HIGH,arg_L'LOW);
			RETURN arg_L - arg_F;
		END "-";		
		
		FUNCTION "*" (arg_L, arg_R: fixed) RETURN fixed IS
			VARIABLE res_ext: fixed((arg_R'LENGTH + arg_L'LENGTH - 1) DOWNTO 0);
			VARIABLE res_ext_2: fixed((arg_R'HIGH + arg_L'HIGH + 1) DOWNTO (arg_R'LOW + arg_L'LOW));
			VARIABLE res: fixed((arg_R'HIGH + arg_L'HIGH+1) DOWNTO (arg_R'LOW + arg_L'LOW));
			VARIABLE res_0: fixed((arg_R'LENGTH + arg_L'LENGTH)-1 DOWNTO 0);
			VARIABLE res_0_R: fixed ((arg_R'LENGTH - 1) DOWNTO 0); 
			VARIABLE res_0_L: fixed ((arg_L'LENGTH - 1) DOWNTO 0); 
			VARIABLE arg_L_shift: fixed ((arg_L'LENGTH - 1) DOWNTO 0);
			VARIABLE arg_R_shift: fixed ((arg_R'LENGTH - 1) DOWNTO 0); 
			VARIABLE res_comp: fixed (arg_L'RANGE);
		BEGIN
			arg_L_shift := arg_L;
			arg_R_shift := arg_R;
			
			FOR k IN (arg_R_shift'LENGTH-1) DOWNTO 0 LOOP
				res_0_R(k) := '0';
			END LOOP;
			
			FOR k IN (arg_L_shift'LENGTH-1) DOWNTO 0 LOOP
				res_0_L(k) := '0';
			END LOOP;
			
			FOR k IN (arg_R_shift'LENGTH + arg_L_shift'LENGTH - 1) DOWNTO 0 LOOP
				res_0(k) := '0';
			END LOOP;
			
			IF arg_L_shift(arg_L_shift'LENGTH - 1) = '1' AND arg_R_shift(arg_R_shift'LENGTH - 1) = '1'  THEN
				res_ext := MULT_FIXED(ADD_SUB_FIXED(COMP1_FIXED(arg_L_shift),res_0_L,'1'), ADD_SUB_FIXED(COMP1_FIXED(arg_R_shift),res_0_R,'1'));
			END IF;
			
			IF arg_L_shift(arg_L_shift'LENGTH - 1) = '1' AND arg_R_shift(arg_R_shift'LENGTH - 1) = '0'  THEN
				res_ext := MULT_FIXED(ADD_SUB_FIXED(COMP1_FIXED(arg_L_shift),res_0_L,'1'), arg_R_shift);
				res_ext := ADD_SUB_FIXED(COMP1_FIXED(res_ext),res_0,'1');
			END IF;
			
			IF arg_L_shift(arg_L_shift'LENGTH - 1) = '0' AND arg_R_shift(arg_R_shift'LENGTH - 1) = '1'  THEN
				res_ext := MULT_FIXED(arg_L_shift,ADD_SUB_FIXED(COMP1_FIXED(arg_R_shift),res_0_R,'1'));
				res_ext := ADD_SUB_FIXED(COMP1_FIXED(res_ext),res_0,'1');
			END IF;
			
			IF arg_L_shift(arg_L_shift'LENGTH - 1) = '0' AND arg_R_shift(arg_R_shift'LENGTH - 1) = '0'  THEN
				res_ext := MULT_FIXED(arg_L_shift,arg_R_shift);
			END IF;
			
--			FOR k IN res_comp'HIGH DOWNTO res_comp'LOW LOOP
--				res_comp(k) := res_ext(k + 1 + res_comp'LENGTH);
--			END LOOP;
			res_ext_2 := res_ext;
			res_comp := res_ext_2(res_comp'HIGH DOWNTO res_comp'LOW);
			RETURN res_comp;
			
		END "*";
		
		FUNCTION "*"(arg_L: fixed; arg_R: INTEGER) RETURN fixed IS
			CONSTANT M: INTEGER := arg_L'LENGTH;
			CONSTANT N: INTEGER := arg_L'LENGTH;
			CONSTANT arg_R_real: REAL := REAL(arg_R);
			VARIABLE res: fixed(arg_L'RANGE);
			VARIABLE arg_F: fixed(arg_L'RANGE);
		BEGIN
			arg_F := to_fixed(arg_R_real,arg_L'HIGH,arg_L'LOW);
			res := arg_L * arg_F;
			RETURN res;
		END "*";
		
		FUNCTION "*"(arg_L: INTEGER; arg_R: fixed) RETURN fixed IS
			CONSTANT M: INTEGER := arg_R'LENGTH;
			CONSTANT N: INTEGER := arg_R'LENGTH;
			CONSTANT arg_L_real: REAL := REAL(arg_L);
			VARIABLE res: fixed(arg_R'RANGE);
			VARIABLE arg_F: fixed(arg_R'RANGE);
		BEGIN
			arg_F := to_fixed(arg_L_real,arg_R'HIGH,arg_R'LOW);
			res := arg_F * arg_R;
			RETURN res;
		END "*";
		
		FUNCTION "*"(arg_L: fixed; arg_R: REAL) RETURN fixed IS
			CONSTANT M: INTEGER := arg_L'LENGTH;
			CONSTANT N: INTEGER := arg_L'LENGTH;
			VARIABLE arg_F: fixed(arg_L'RANGE);
			VARIABLE res: fixed(arg_L'RANGE);
		BEGIN
			arg_F := to_fixed(arg_R,arg_L'HIGH,arg_L'LOW);
			res := arg_L * arg_F;
			RETURN res;
		END "*";
			
		FUNCTION "*"(arg_L: REAL; arg_R: fixed) RETURN fixed IS
			CONSTANT M: INTEGER := arg_R'LENGTH;
			CONSTANT N: INTEGER := arg_R'LENGTH;
			VARIABLE res: fixed(arg_R'RANGE);
			VARIABLE arg_F: fixed(arg_R'RANGE);
		BEGIN
			arg_F := to_fixed(arg_L,arg_R'HIGH,arg_R'LOW);
			res := arg_F * arg_R;
			RETURN res;
		END "*";
			
		--to_real
		FUNCTION to_real (arg_L: fixed) RETURN REAL IS
			VARIABLE res: REAL := 0.0;
			VARIABLE arg_F: fixed(arg_L'RANGE);
			VARIABLE res_0_L: fixed(arg_L'RANGE);
		BEGIN
		
			FOR k IN arg_L'RANGE LOOP
				res_0_L(k) := '0';
			END LOOP;
			
			arg_F := arg_L;
			IF arg_L(arg_L'HIGH)='1' THEN
				arg_F := ADD_SUB_FIXED(COMP1_FIXED(arg_F),res_0_L,'1');
			END IF;
			
			FOR k IN arg_F'HIGH - 1 DOWNTO arg_F'LOW LOOP 
				IF arg_F(k) = '1' THEN
					res := res + (2.0**k);
				END IF;
			END LOOP;
			
			IF arg_L(arg_L'HIGH)='1' THEN
				res := res * (-1.0);
			END IF;
			
			RETURN res;
		END to_real;	
		
	--to_fixed
		FUNCTION to_fixed (arg_L: REAL; max_range, min_range: fixed_range) RETURN fixed IS
			CONSTANT abs_real : REAL := ABS(arg_L);
			CONSTANT min_range_real : REAL := 2.0**(min_range);
			CONSTANT max_range_real : REAL := 2.0**(max_range);
			VARIABLE int_part : REAL := 0.0;
			VARIABLE frac_part: REAL := 0.0;
			VARIABLE int_res: INTEGER := 0;
			VARIABLE res: fixed(max_range DOWNTO min_range);
			VARIABLE res_0: fixed(max_range DOWNTO min_range);
		BEGIN

			IF abs_real < min_range_real OR arg_L=0.0 THEN
				FOR k IN max_range DOWNTO min_range LOOP
					res(k) := '0';
				END LOOP;
			ELSIF arg_L >= max_range_real THEN
				FOR k IN max_range DOWNTO min_range LOOP
					res(k) := '1';
				END LOOP;
				res(max_range):='0';
			ELSIF arg_L <= -max_range_real THEN
				FOR k IN max_range DOWNTO min_range LOOP
					res(k) := '0';
				END LOOP;
				res(max_range):='1';
			ELSE
				int_part := floor(abs_real);
				frac_part := abs_real - int_part;
				int_res := INTEGER(int_part);
				
				FOR k IN res'RANGE LOOP
					res(k) := '0';
				END LOOP;
				
				FOR k IN 0 TO res'HIGH-1 LOOP
					IF int_res >= 1 AND int_res >= -1 THEN 
						IF (int_res MOD 2) = 0 THEN
							res(k) := '0';
						ELSE
							res(k) := '1';
						END IF;
						int_res := INTEGER(int_res / 2);
					ELSE
						res(k) := '0';
					END IF;
				END LOOP;
				
				FOR k IN -1 DOWNTO res'LOW LOOP	
					IF frac_part /= 1.0 THEN
						frac_part := frac_part * 2.0;
					END IF;
					
					IF frac_part > 1.0 THEN
						res(k) := '1';
						frac_part := frac_part - 1.0;
					ELSIF frac_part < 1.0 THEN 
						res(k) := '0';
					ELSIF frac_part = 1.0 THEN
						res(k) := '1';
						EXIT;
					END IF;	
					
				END LOOP;
					
			END IF;
			
			FOR k in res'RANGE LOOP
				res_0(k):='0';
			END LOOP;
			
			IF arg_L < 0.0 THEN
				res := ADD_SUB_FIXED(COMP1_FIXED(res),res_0,'1');
			END IF;
			
			RETURN res;
		END to_fixed;
		
		-- Parâmetro de entrada:
		-- 	X : fixed [0,1]
		-- Parâmetro de saída:
		-- 	SIG : fixed [0,1]
		-- Retorna:
		--  / Se      X < -4	SIG =  0.0
		--  | Se -4 < X < 0 	SIG = +0.03125*X**2+0.25*X+0.5
		-- <  Se      X = 0 	SIG = +0.5
		--  | Se  0 < X < 4 	SIG = -0.03125*X**2+0.25*X+0.5
		--  \ Se      X >= 4 	SIG = +1.0
			
		FUNCTION Activation (X : fixed) RETURN fixed IS
			CONSTANT X_LEFT: INTEGER := X'LEFT;
			CONSTANT X_RIGHT: INTEGER := X'RIGHT;
			CONSTANT a2p: fixed(X'RANGE) := to_fixed(0.03125, X_LEFT, X_RIGHT);
			CONSTANT a2n: fixed(X'RANGE) := to_fixed(-0.03125, X_LEFT, X_RIGHT);
			CONSTANT a1: fixed(X'RANGE) := to_fixed(0.25000, X_LEFT, X_RIGHT);
			CONSTANT a0: fixed(X'RANGE) := to_fixed(0.50000, X_LEFT, X_RIGHT);
			CONSTANT maxSIG: fixed(X'RANGE) := to_fixed(0.99999, X_LEFT, X_RIGHT);
			CONSTANT minSIG: fixed(X'RANGE) := to_fixed(0.00000, X_LEFT, X_RIGHT);
			VARIABLE SIG: fixed(X'RANGE);
		BEGIN
			IF to_real(X) >= 4.0 THEN		-- Se      X >= 4 SIG = +1.0
				SIG := maxSIG;
			ELSIF to_real(X) < -4.0 THEN		-- Se      X < -4 SIG =  0.0
				SIG := minSIG;
			ELSIF to_real(X) < 0.0 THEN		-- Se -4 < X < 0  SIG = (+0.03125*X+0.25)*X+0.5
				SIG := (((a2p * X) + a1) * X) + a0;
			ELSE				-- Se  0 < X < 4  SIG = (-0.03125*X+0.25)*X+0.5
				SIG := (((a2n * X )+ a1) * X) + a0;			
			END IF;
			RETURN SIG;
		END;
		
END fixed_package;
