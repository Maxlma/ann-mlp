----------------------------
--Alunos:
--Gabriel Ginja  #USP: 8954902
--Marcio Amorim  #USP: 13063610


--Atualizado 13/12/21
--------------------------


USE work.neuron_package.all;
USE work.fixed_package.all;


ENTITY neuron IS
	GENERIC( INPUT: INTEGER := 2;
		Q_L : fixed_range := 3;
		Q_R : fixed_range := -12
	);
	PORT(
		X : IN fixed_vector(INPUT-1 downto 0, Q_L DOWNTO Q_R);
		W : IN fixed_vector(INPUT-1 downto 0, Q_L DOWNTO Q_R);
		B : IN fixed(Q_L DOWNTO Q_R);
		Y : OUT fixed(Q_L DOWNTO Q_R)
	);
END ENTITY;

ARCHITECTURE STRUTUCTAL OF neuron IS
BEGIN
	PROCESS(X,W,B)
		VARIABLE V : FIXED(Q_L DOWNTO Q_R);
		VARIABLE X_tmp, W_tmp : fixed(Q_L DOWNTO Q_R);
	BEGIN
		v := (OTHERS => '0');
		FOR i in INPUT-1 DOWNTO 0 LOOP
			FOR j in Q_L DOWNTO Q_R LOOP
				W_tmp(j) := W(i,j);
				X_tmp(j) := X(i,j);
			END LOOP;
			v := v + W_tmp * X_tmp;
		END LOOP;
		v := v-B;
		Y <= Activation1(v);
	END PROCESS;
END STRUTUCTAL;
			 