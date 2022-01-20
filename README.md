# ann-mlp
VHDL Class 2021
NUSP 13063610
NUSP 8954902

arquivos importantes:
na pasta VHDL, ha os arquivos .vhd utilizados para a simulação do neuronio

na pasta docs, ha os resultados de simulação: 
result_activ. csv-> valores da simulação, Waveform.png -> plot do wave em 1280ns
Plots_sigmoid-> plot de y1_real por x_real e de y2_real por x_real



Dados de simulação:

X;Activation1(X);Activation2(X)
-0.000000e+00;0.000000e+00;-1.000000e+00
-7.937500e+00;0.000000e+00;-1.000000e+00
-7.875000e+00;0.000000e+00;-1.000000e+00
-7.812500e+00;0.000000e+00;-1.000000e+00
-7.750000e+00;0.000000e+00;-1.000000e+00
-7.687500e+00;0.000000e+00;-1.000000e+00
-7.625000e+00;0.000000e+00;-1.000000e+00
-7.562500e+00;0.000000e+00;-1.000000e+00
-7.500000e+00;0.000000e+00;-1.000000e+00
-7.437500e+00;0.000000e+00;-1.000000e+00
-7.375000e+00;0.000000e+00;-1.000000e+00
-7.312500e+00;0.000000e+00;-1.000000e+00
-7.250000e+00;0.000000e+00;-1.000000e+00
-7.187500e+00;0.000000e+00;-1.000000e+00
-7.125000e+00;0.000000e+00;-1.000000e+00
-7.062500e+00;0.000000e+00;-1.000000e+00
-7.000000e+00;0.000000e+00;-1.000000e+00
-6.937500e+00;0.000000e+00;-1.000000e+00
-6.875000e+00;0.000000e+00;-1.000000e+00
-6.812500e+00;0.000000e+00;-1.000000e+00
-6.750000e+00;0.000000e+00;-1.000000e+00
-6.687500e+00;0.000000e+00;-1.000000e+00
-6.625000e+00;0.000000e+00;-1.000000e+00
-6.562500e+00;0.000000e+00;-1.000000e+00
-6.500000e+00;0.000000e+00;-1.000000e+00
-6.437500e+00;0.000000e+00;-1.000000e+00
-6.375000e+00;0.000000e+00;-1.000000e+00
-6.312500e+00;0.000000e+00;-1.000000e+00
-6.250000e+00;0.000000e+00;-1.000000e+00
-6.187500e+00;0.000000e+00;-1.000000e+00
-6.125000e+00;0.000000e+00;-1.000000e+00
-6.062500e+00;0.000000e+00;-1.000000e+00
-6.000000e+00;0.000000e+00;-1.000000e+00
-5.937500e+00;0.000000e+00;-1.000000e+00
-5.875000e+00;0.000000e+00;-1.000000e+00
-5.812500e+00;0.000000e+00;-1.000000e+00
-5.750000e+00;0.000000e+00;-1.000000e+00
-5.687500e+00;0.000000e+00;-1.000000e+00
-5.625000e+00;0.000000e+00;-1.000000e+00
-5.562500e+00;0.000000e+00;-1.000000e+00
-5.500000e+00;0.000000e+00;-1.000000e+00
-5.437500e+00;0.000000e+00;-1.000000e+00
-5.375000e+00;0.000000e+00;-1.000000e+00
-5.312500e+00;0.000000e+00;-1.000000e+00
-5.250000e+00;0.000000e+00;-1.000000e+00
-5.187500e+00;0.000000e+00;-1.000000e+00
-5.125000e+00;0.000000e+00;-1.000000e+00
-5.062500e+00;0.000000e+00;-1.000000e+00
-5.000000e+00;0.000000e+00;-1.000000e+00
-4.937500e+00;0.000000e+00;-1.000000e+00
-4.875000e+00;0.000000e+00;-1.000000e+00
-4.812500e+00;0.000000e+00;-1.000000e+00
-4.750000e+00;0.000000e+00;-1.000000e+00
-4.687500e+00;0.000000e+00;-1.000000e+00
-4.625000e+00;0.000000e+00;-1.000000e+00
-4.562500e+00;0.000000e+00;-1.000000e+00
-4.500000e+00;0.000000e+00;-1.000000e+00
-4.437500e+00;0.000000e+00;-1.000000e+00
-4.375000e+00;0.000000e+00;-1.000000e+00
-4.312500e+00;0.000000e+00;-1.000000e+00
-4.250000e+00;0.000000e+00;-1.000000e+00
-4.187500e+00;0.000000e+00;-1.000000e+00
-4.125000e+00;0.000000e+00;-1.000000e+00
-4.062500e+00;0.000000e+00;-1.000000e+00
-4.000000e+00;0.000000e+00;-1.000000e+00
-3.937500e+00;0.000000e+00;-9.997559e-01
-3.875000e+00;4.882813e-04;-9.990234e-01
-3.812500e+00;9.765625e-04;-9.978027e-01
-3.750000e+00;1.953125e-03;-9.960938e-01
-3.687500e+00;2.929688e-03;-9.938965e-01
-3.625000e+00;4.394531e-03;-9.912109e-01
-3.562500e+00;5.859375e-03;-9.880371e-01
-3.500000e+00;7.812500e-03;-9.843750e-01
-3.437500e+00;9.765625e-03;-9.802246e-01
-3.375000e+00;1.220703e-02;-9.755859e-01
-3.312500e+00;1.464844e-02;-9.704590e-01
-3.250000e+00;1.757813e-02;-9.648438e-01
-3.187500e+00;2.050781e-02;-9.587402e-01
-3.125000e+00;2.392578e-02;-9.521484e-01
-3.062500e+00;2.734375e-02;-9.450684e-01
-3.000000e+00;3.125000e-02;-9.375000e-01
-2.937500e+00;3.515625e-02;-9.294434e-01
-2.875000e+00;3.955078e-02;-9.208984e-01
-2.812500e+00;4.394531e-02;-9.118652e-01
-2.750000e+00;4.882813e-02;-9.023438e-01
-2.687500e+00;5.371094e-02;-8.923340e-01
-2.625000e+00;5.908203e-02;-8.818359e-01
-2.562500e+00;6.445313e-02;-8.708496e-01
-2.500000e+00;7.031250e-02;-8.593750e-01
-2.437500e+00;7.617188e-02;-8.474121e-01
-2.375000e+00;8.251953e-02;-8.349609e-01
-2.312500e+00;8.886719e-02;-8.220215e-01
-2.250000e+00;9.570313e-02;-8.085938e-01
-2.187500e+00;1.025391e-01;-7.946777e-01
-2.125000e+00;1.098633e-01;-7.802734e-01
-2.062500e+00;1.171875e-01;-7.653809e-01
-2.000000e+00;1.250000e-01;-7.500000e-01
-1.937500e+00;1.328125e-01;-7.341309e-01
-1.875000e+00;1.411133e-01;-7.177734e-01
-1.812500e+00;1.494141e-01;-7.009277e-01
-1.750000e+00;1.582031e-01;-6.835938e-01
-1.687500e+00;1.669922e-01;-6.657715e-01
-1.625000e+00;1.762695e-01;-6.474609e-01
-1.562500e+00;1.855469e-01;-6.286621e-01
-1.500000e+00;1.953125e-01;-6.093750e-01
-1.437500e+00;2.050781e-01;-5.895996e-01
-1.375000e+00;2.153320e-01;-5.693359e-01
-1.312500e+00;2.255859e-01;-5.485840e-01
-1.250000e+00;2.363281e-01;-5.273438e-01
-1.187500e+00;2.470703e-01;-5.056152e-01
-1.125000e+00;2.583008e-01;-4.833984e-01
-1.062500e+00;2.695313e-01;-4.606934e-01
-1.000000e+00;2.812500e-01;-4.375000e-01
-9.375000e-01;2.929688e-01;-4.138184e-01
-8.750000e-01;3.051758e-01;-3.896484e-01
-8.125000e-01;3.173828e-01;-3.649902e-01
-7.500000e-01;3.300781e-01;-3.398438e-01
-6.875000e-01;3.427734e-01;-3.142090e-01
-6.250000e-01;3.559570e-01;-2.880859e-01
-5.625000e-01;3.691406e-01;-2.614746e-01
-5.000000e-01;3.828125e-01;-2.343750e-01
-4.375000e-01;3.964844e-01;-2.067871e-01
-3.750000e-01;4.106445e-01;-1.787109e-01
-3.125000e-01;4.248047e-01;-1.501465e-01
-2.500000e-01;4.394531e-01;-1.210938e-01
-1.875000e-01;4.541016e-01;-9.155273e-02
-1.250000e-01;4.692383e-01;-6.152344e-02
-6.250000e-02;4.843750e-01;-3.100586e-02
0.000000e+00;5.000000e-01;0.000000e+00
6.250000e-02;5.153809e-01;3.100586e-02
1.250000e-01;5.307617e-01;6.152344e-02
1.875000e-01;5.456543e-01;9.155273e-02
2.500000e-01;5.605469e-01;1.210938e-01
3.125000e-01;5.749512e-01;1.501465e-01
3.750000e-01;5.893555e-01;1.787109e-01
4.375000e-01;6.032715e-01;2.067871e-01
5.000000e-01;6.171875e-01;2.343750e-01
5.625000e-01;6.306152e-01;2.614746e-01
6.250000e-01;6.440430e-01;2.880859e-01
6.875000e-01;6.569824e-01;3.142090e-01
7.500000e-01;6.699219e-01;3.398438e-01
8.125000e-01;6.823730e-01;3.649902e-01
8.750000e-01;6.948242e-01;3.896484e-01
9.375000e-01;7.067871e-01;4.138184e-01
1.000000e+00;7.187500e-01;4.375000e-01
1.062500e+00;7.302246e-01;4.606934e-01
1.125000e+00;7.416992e-01;4.833984e-01
1.187500e+00;7.526855e-01;5.056152e-01
1.250000e+00;7.636719e-01;5.273438e-01
1.312500e+00;7.741699e-01;5.485840e-01
1.375000e+00;7.846680e-01;5.693359e-01
1.437500e+00;7.946777e-01;5.895996e-01
1.500000e+00;8.046875e-01;6.093750e-01
1.562500e+00;8.142090e-01;6.286621e-01
1.625000e+00;8.237305e-01;6.474609e-01
1.687500e+00;8.327637e-01;6.657715e-01
1.750000e+00;8.417969e-01;6.835938e-01
1.812500e+00;8.503418e-01;7.009277e-01
1.875000e+00;8.588867e-01;7.177734e-01
1.937500e+00;8.669434e-01;7.341309e-01
2.000000e+00;8.750000e-01;7.500000e-01
2.062500e+00;8.825684e-01;7.653809e-01
2.125000e+00;8.901367e-01;7.802734e-01
2.187500e+00;8.972168e-01;7.946777e-01
2.250000e+00;9.042969e-01;8.085938e-01
2.312500e+00;9.108887e-01;8.220215e-01
2.375000e+00;9.174805e-01;8.349609e-01
2.437500e+00;9.235840e-01;8.474121e-01
2.500000e+00;9.296875e-01;8.593750e-01
2.562500e+00;9.353027e-01;8.708496e-01
2.625000e+00;9.409180e-01;8.818359e-01
2.687500e+00;9.460449e-01;8.923340e-01
2.750000e+00;9.511719e-01;9.023438e-01
2.812500e+00;9.558105e-01;9.118652e-01
2.875000e+00;9.604492e-01;9.208984e-01
2.937500e+00;9.645996e-01;9.294434e-01
3.000000e+00;9.687500e-01;9.375000e-01
3.062500e+00;9.724121e-01;9.450684e-01
3.125000e+00;9.760742e-01;9.521484e-01
3.187500e+00;9.792480e-01;9.587402e-01
3.250000e+00;9.824219e-01;9.648438e-01
3.312500e+00;9.851074e-01;9.704590e-01
3.375000e+00;9.877930e-01;9.755859e-01
3.437500e+00;9.899902e-01;9.802246e-01
3.500000e+00;9.921875e-01;9.843750e-01
3.562500e+00;9.938965e-01;9.880371e-01
3.625000e+00;9.956055e-01;9.912109e-01
3.687500e+00;9.968262e-01;9.938965e-01
3.750000e+00;9.980469e-01;9.960938e-01
3.812500e+00;9.987793e-01;9.978027e-01
3.875000e+00;9.995117e-01;9.990234e-01
3.937500e+00;9.997559e-01;9.997559e-01
4.000000e+00;9.997559e-01;1.000000e+00
4.062500e+00;9.997559e-01;1.000000e+00
4.125000e+00;9.997559e-01;1.000000e+00
4.187500e+00;9.997559e-01;1.000000e+00
4.250000e+00;9.997559e-01;1.000000e+00
4.312500e+00;9.997559e-01;1.000000e+00
4.375000e+00;9.997559e-01;1.000000e+00
4.437500e+00;9.997559e-01;1.000000e+00
4.500000e+00;9.997559e-01;1.000000e+00
4.562500e+00;9.997559e-01;1.000000e+00
4.625000e+00;9.997559e-01;1.000000e+00
4.687500e+00;9.997559e-01;1.000000e+00
4.750000e+00;9.997559e-01;1.000000e+00
4.812500e+00;9.997559e-01;1.000000e+00
4.875000e+00;9.997559e-01;1.000000e+00
4.937500e+00;9.997559e-01;1.000000e+00
5.000000e+00;9.997559e-01;1.000000e+00
5.062500e+00;9.997559e-01;1.000000e+00
5.125000e+00;9.997559e-01;1.000000e+00
5.187500e+00;9.997559e-01;1.000000e+00
5.250000e+00;9.997559e-01;1.000000e+00
5.312500e+00;9.997559e-01;1.000000e+00
5.375000e+00;9.997559e-01;1.000000e+00
5.437500e+00;9.997559e-01;1.000000e+00
5.500000e+00;9.997559e-01;1.000000e+00
5.562500e+00;9.997559e-01;1.000000e+00
5.625000e+00;9.997559e-01;1.000000e+00
5.687500e+00;9.997559e-01;1.000000e+00
5.750000e+00;9.997559e-01;1.000000e+00
5.812500e+00;9.997559e-01;1.000000e+00
5.875000e+00;9.997559e-01;1.000000e+00
5.937500e+00;9.997559e-01;1.000000e+00
6.000000e+00;9.997559e-01;1.000000e+00
6.062500e+00;9.997559e-01;1.000000e+00
6.125000e+00;9.997559e-01;1.000000e+00
6.187500e+00;9.997559e-01;1.000000e+00
6.250000e+00;9.997559e-01;1.000000e+00
6.312500e+00;9.997559e-01;1.000000e+00
6.375000e+00;9.997559e-01;1.000000e+00
6.437500e+00;9.997559e-01;1.000000e+00
6.500000e+00;9.997559e-01;1.000000e+00
6.562500e+00;9.997559e-01;1.000000e+00
6.625000e+00;9.997559e-01;1.000000e+00
6.687500e+00;9.997559e-01;1.000000e+00
6.750000e+00;9.997559e-01;1.000000e+00
6.812500e+00;9.997559e-01;1.000000e+00
6.875000e+00;9.997559e-01;1.000000e+00
6.937500e+00;9.997559e-01;1.000000e+00
7.000000e+00;9.997559e-01;1.000000e+00
7.062500e+00;9.997559e-01;1.000000e+00
7.125000e+00;9.997559e-01;1.000000e+00
7.187500e+00;9.997559e-01;1.000000e+00
7.250000e+00;9.997559e-01;1.000000e+00
7.312500e+00;9.997559e-01;1.000000e+00
7.375000e+00;9.997559e-01;1.000000e+00
7.437500e+00;9.997559e-01;1.000000e+00
7.500000e+00;9.997559e-01;1.000000e+00
7.562500e+00;9.997559e-01;1.000000e+00
7.625000e+00;9.997559e-01;1.000000e+00
7.687500e+00;9.997559e-01;1.000000e+00
7.750000e+00;9.997559e-01;1.000000e+00
7.812500e+00;9.997559e-01;1.000000e+00
7.875000e+00;9.997559e-01;1.000000e+00
7.937500e+00;9.997559e-01;1.000000e+00
