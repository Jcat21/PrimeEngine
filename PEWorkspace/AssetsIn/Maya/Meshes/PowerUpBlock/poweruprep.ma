//Maya ASCII 2018 scene
//Name: poweruprep.ma
//Last modified: Sun, Feb 18, 2018 04:53:44 PM
//Codeset: 1252
requires maya "2018";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2018";
fileInfo "version" "2018";
fileInfo "cutIdentifier" "201706261615-f9658c4cfc";
fileInfo "osv" "Microsoft Windows 8 Home Premium Edition, 64-bit  (Build 9200)\n";
fileInfo "license" "student";
createNode transform -s -n "persp";
	rename -uid "0D90BA33-498D-7BDD-FC8D-05ABD27BD83B";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -35.436696556073464 490.36394661135881 777.48919047934783 ;
	setAttr ".r" -type "double3" -32.138352729650883 357.39999999980944 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "08FF9909-499C-6AF1-DDC1-C9805DC855F0";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 920.47203364069514;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -2.230740353182088 -0.5 0 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "5ED7564E-40D6-45AB-2ABD-10BC69959864";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "5E66ED87-434A-43D1-2BB0-87BF26E157C8";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "E98CAD6C-4DD1-8B61-1EA9-C09AFF7290E1";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "31246E54-471B-6FD9-8EBF-BE850D501328";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "BE09E816-4ECB-188D-5538-AA91FDC23D05";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "56AA3C0F-4E1C-9FDA-4205-679ECE6A0770";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "powerup";
	rename -uid "02523EF2-4E20-2D0F-C062-55824FB80260";
createNode mesh -n "powerupShape" -p "powerup";
	rename -uid "B4F3A2E0-4A21-BEC6-527A-ABB0E1A9B274";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:143]";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.50000005960464478 0.49999996274709702 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 176 ".uvst[0].uvsp[0:175]" -type "float2" 0.40625 0 0.4375
		 0.0625 0.375 0.0625 0.5 0 0.5 0.0625 0.59375 0 0.5625 0.0625 0.625 0.0625 0.4375
		 0.125 0.375 0.125 0.5 0.125 0.5625 0.125 0.625 0.125 0.4375 0.1875 0.375 0.1875 0.5
		 0.1875 0.5625 0.1875 0.625 0.1875 0.40625 0.25 0.5 0.25 0.59375 0.25 0.5 0.5 0.40625
		 0.5 0.59375 0.5 0.4375 0.5625 0.375 0.5625 0.5 0.5625 0.5625 0.5625 0.625 0.5625
		 0.4375 0.625 0.375 0.625 0.5 0.625 0.5625 0.625 0.625 0.625 0.4375 0.6875 0.375 0.6875
		 0.5 0.6875 0.5625 0.6875 0.625 0.6875 0.40625 0.75 0.5 0.75 0.59375 0.75 0.5 1 0.40625
		 1 0.59375 1 0.875 0 0.875 0.0625 0.875 0.125 0.875 0.1875 0.875 0.25 0.125 0 0.125
		 0.0625 0.125 0.125 0.125 0.1875 0.125 0.25 0.1 1 0 1 0 0.89999998 0.1 0.89999998
		 0.2 1 0.2 0.89999998 0.30000001 1 0.30000001 0.89999998 0.40000001 1 0.40000001 0.89999998
		 0.5 1 0.5 0.89999998 0.60000002 1 0.60000002 0.89999998 0.70000005 1 0.70000005 0.89999998
		 0.80000007 1 0.80000007 0.89999998 0.9000001 1 0.9000001 0.89999998 1.000000119209
		 1 1.000000119209 0.89999998 0 0.79999995 0.1 0.79999995 0.2 0.79999995 0.30000001
		 0.79999995 0.40000001 0.79999995 0.5 0.79999995 0.60000002 0.79999995 0.70000005
		 0.79999995 0.80000007 0.79999995 0.9000001 0.79999995 1.000000119209 0.79999995 0
		 0.69999993 0.1 0.69999993 0.2 0.69999993 0.30000001 0.69999993 0.40000001 0.69999993
		 0.5 0.69999993 0.60000002 0.69999993 0.70000005 0.69999993 0.80000007 0.69999993
		 0.9000001 0.69999993 1.000000119209 0.69999993 0 0.5999999 0.1 0.5999999 0.2 0.5999999
		 0.30000001 0.5999999 0.40000001 0.5999999 0.5 0.5999999 0.60000002 0.5999999 0.70000005
		 0.5999999 0.80000007 0.5999999 0.9000001 0.5999999 1.000000119209 0.5999999 0 0.49999991
		 0.1 0.49999991 0.2 0.49999991 0.30000001 0.49999991 0.40000001 0.49999991 0.5 0.49999991
		 0.60000002 0.49999991 0.70000005 0.49999991 0.80000007 0.49999991 0.9000001 0.49999991
		 1.000000119209 0.49999991 0 0.39999992 0.1 0.39999992 0.2 0.39999992 0.30000001 0.39999992
		 0.40000001 0.39999992 0.5 0.39999992 0.60000002 0.39999992 0.70000005 0.39999992
		 0.80000007 0.39999992 0.9000001 0.39999992 1.000000119209 0.39999992 0 0.29999992
		 0.1 0.29999992 0.2 0.29999992 0.30000001 0.29999992 0.40000001 0.29999992 0.5 0.29999992
		 0.60000002 0.29999992 0.70000005 0.29999992 0.80000007 0.29999992 0.9000001 0.29999992
		 1.000000119209 0.29999992 0 0.19999993 0.1 0.19999993 0.2 0.19999993 0.30000001 0.19999993
		 0.40000001 0.19999993 0.5 0.19999993 0.60000002 0.19999993 0.70000005 0.19999993
		 0.80000007 0.19999993 0.9000001 0.19999993 1.000000119209 0.19999993 0 0.099999927
		 0.1 0.099999927 0.2 0.099999927 0.30000001 0.099999927 0.40000001 0.099999927 0.5
		 0.099999927 0.60000002 0.099999927 0.70000005 0.099999927 0.80000007 0.099999927
		 0.9000001 0.099999927 1.000000119209 0.099999927 0 -7.4505806e-08 0.1 -7.4505806e-08
		 0.2 -7.4505806e-08 0.30000001 -7.4505806e-08 0.40000001 -7.4505806e-08 0.5 -7.4505806e-08
		 0.60000002 -7.4505806e-08 0.70000005 -7.4505806e-08 0.80000007 -7.4505806e-08 0.9000001
		 -7.4505806e-08 1.000000119209 -7.4505806e-08;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 142 ".pt[0:141]" -type "float3"  32.305904 -87.481239 -2.4995232 
		-0.012781143 -73.801323 -2.4995232 -32.332127 -87.481239 -2.4993563 15.486639 -91.102089 
		-2.4995232 12.485125 -88.504112 -2.4995232 -0.012781143 -88.504112 -2.4995232 -12.511544 
		-88.504112 -2.4995232 -15.515167 -91.102089 -2.4995232 28.52969 -101.00289 -2.4995232 
		12.485125 -101.00289 -2.4995232 -0.012781143 -101.00289 -2.4995232 -12.511544 -101.00289 
		-2.4995232 -28.57299 -101.00289 -2.4995232 15.486639 -110.90415 -2.4995232 12.485125 
		-113.49946 -2.4995232 -0.012781143 -113.49946 -2.4995232 -12.511544 -113.49946 -2.4995232 
		-15.515167 -110.90415 -2.4995232 32.318546 -114.51826 -2.4995232 -0.012781143 -128.20154 
		-2.4995232 -32.344048 -114.51826 -2.4995232 32.318546 -114.51826 2.5010967 -0.012781143 
		-128.20154 2.5010967 -32.344048 -114.51826 2.5010967 15.486639 -110.90415 2.5010967 
		12.485125 -113.49946 2.5010967 -0.012781143 -113.49946 2.5010967 -12.511544 -113.49946 
		2.5010967 -15.515167 -110.90415 2.5010967 28.52969 -101.00289 2.5010967 12.485125 
		-101.00289 2.5010967 -0.012781143 -101.00289 2.5010967 -12.511544 -101.00289 2.5010967 
		-28.57299 -101.00289 2.5010967 15.486639 -91.102089 2.5010967 12.485125 -88.504112 
		2.5010967 -0.012781143 -88.504112 2.5010967 -12.511544 -88.504112 2.5010967 -15.515167 
		-91.102089 2.5010967 32.305904 -87.481239 2.5011444 -0.012781143 -73.801323 2.5010967 
		-32.332127 -87.481239 2.5000267 -36.42313 -127.44844 0.00078678131 -13.921216 -143.80501 
		0.00078678131 13.893942 -143.80232 0.00078678131 36.398327 -127.45625 0.00078678131 
		44.987598 -101.00288 0.00078678131 36.392605 -74.562828 0.00078678131 13.893932 -58.217522 
		0.00078678131 -13.915589 -58.217522 0.00078678131 -36.418941 -74.547768 0.00078678131 
		-45.020794 -101.00289 0.00078678131 -37.192245 -128.0168 -2.9386644 -14.209629 -144.71773 
		-2.9386644 14.186361 -144.70171 -2.9386644 37.173161 -128.01431 -2.9386644 45.934895 
		-101.00288 -2.9386644 37.161335 -73.989525 -2.9386644 14.185871 -57.287979 -2.9386644 
		-14.210674 -57.27919 -2.9386644 -37.186893 -73.992577 -2.9386644 -45.975319 -101.00289 
		-2.9386644 -39.207523 -129.47708 -4.7542572 -14.985405 -147.082 -4.7542572 14.963005 
		-147.082 -4.7542572 39.193035 -129.48051 -4.7542572 48.439083 -101.00288 -4.7542572 
		39.181583 -72.515678 -4.7542572 14.961943 -54.921379 -4.7542572 -14.989132 -54.921379 
		-4.7542572 -39.206009 -72.515877 -4.7542572 -48.471127 -101.00289 -4.7542572 -41.720875 
		-131.29572 -4.7538776 -15.942997 -150.00684 -4.7538776 15.914963 -150.03085 -4.7538776 
		41.693798 -131.29973 -4.7538776 51.547192 -101.00288 -4.7538776 41.693787 -70.703514 
		-4.7538776 15.916481 -51.971016 -4.7538776 -15.939465 -51.993896 -4.7538776 -41.71859 
		-70.708488 -4.7538776 -51.553661 -101.00289 -4.7538776 -43.73159 -132.77911 -2.937211 
		-16.712109 -152.41158 -2.937211 16.689415 -152.41689 -2.937211 43.706043 -132.76404 
		-2.937211 54.037266 -101.00288 -2.937211 43.734638 -69.238625 -2.937211 16.690165 
		-49.588814 -2.937211 -16.716114 -49.588814 -2.937211 -43.728939 -69.236351 -2.937211 
		-54.041454 -101.00289 -2.937211 -44.50185 -133.32706 0.00078582764 -17.011578 -153.3163 
		0.00078582764 16.979542 -153.30331 0.00078582764 44.473629 -133.33086 0.00078582764 
		54.955551 -101.00288 0.00078582764 44.472477 -68.685371 0.00078582764 16.979916 -48.695137 
		0.00078582764 -17.009102 -48.695137 0.00078582764 -44.505291 -68.678871 0.00078582764 
		-55.006668 -101.00289 0.00078582764 -43.73159 -132.77911 2.9390221 -16.712109 -152.41158 
		2.9390221 16.689415 -152.41689 2.9390221 43.706043 -132.76404 2.9390221 54.037266 
		-101.00288 2.9390221 43.734638 -69.238625 2.9390221 16.690165 -49.588814 2.9390221 
		-16.716114 -49.588814 2.9390221 -43.728939 -69.236351 2.9390221 -54.041454 -101.00289 
		2.9390221 -41.720875 -131.29572 4.7574043 -15.942997 -150.00684 4.7574043 15.914963 
		-150.03085 4.7574043 41.693798 -131.29973 4.7574043 51.547192 -101.00288 4.7574043 
		41.693787 -70.703514 4.7574043 15.916481 -51.971016 4.7574043 -15.939465 -51.993896 
		4.7574043 -41.71859 -70.708488 4.7574043 -51.553661 -101.00289 4.7574043 -39.204105 
		-129.47708 4.7555923 -14.985214 -147.07896 4.7555923 14.959951 -147.082 4.7555923 
		39.192657 -129.48051 4.7555923 48.455116 -101.00288 4.7555923 39.193417 -72.515678 
		4.7555923 14.960232 -54.915657 4.7555923 -14.985695 -54.921379 4.7555923 -39.207523 
		-72.515877 4.7555923 -48.46809 -101.00289 4.7555923 -37.192245 -128.0168 2.9393559 
		-14.209629 -144.71773 2.9393559 14.186361 -144.70171 2.9393559 37.173161 -128.01431 
		2.9393559 45.934895 -101.00288 2.9393559 37.161335 -73.989525 2.9393559 14.185871 
		-57.287979 2.9393559 -14.210674 -57.27919 2.9393559 -37.186893 -73.992577 2.9393559 
		-45.975319 -101.00289 2.9393559;
	setAttr -s 142 ".vt[0:141]"  -64.63735199 173.95674133 5.00062036514 5.9001277e-06 146.59692383 5.00062036514
		 64.6386795 173.95674133 5.00028753281 -30.99884415 181.19841003 5.00062036514 -24.99579811 176.0024719238 5.00062036514
		 5.9001277e-06 176.0024719238 5.00062036514 24.99752617 176.0024719238 5.00062036514
		 31.0047683716 181.19841003 5.00062036514 -57.084941864 201 5.00062036514 -24.99579811 201 5.00062036514
		 5.9001277e-06 201 5.00062036514 24.99752617 201 5.00062036514 57.12043762 201 5.00062036514
		 -30.99884415 220.80253601 5.00062036514 -24.99579811 225.99313354 5.00062036514 5.9001277e-06 225.99313354 5.00062036514
		 24.99752617 225.99313354 5.00062036514 31.0047683716 220.80253601 5.00062036514 -64.66266632 228.030670166 5.00062036514
		 5.9001277e-06 255.39732361 5.00062036514 64.66255188 228.030670166 5.00062036514
		 -64.66266632 228.030670166 -5.00061988831 5.9001277e-06 255.39732361 -5.00061988831
		 64.66255188 228.030670166 -5.00061988831 -30.99884415 220.80253601 -5.00061988831
		 -24.99579811 225.99313354 -5.00061988831 5.9001277e-06 225.99313354 -5.00061988831
		 24.99752617 225.99313354 -5.00061988831 31.0047683716 220.80253601 -5.00061988831
		 -57.084941864 201 -5.00061988831 -24.99579811 201 -5.00061988831 5.9001277e-06 201 -5.00061988831
		 24.99752617 201 -5.00061988831 57.12043762 201 -5.00061988831 -30.99884415 181.19841003 -5.00061988831
		 -24.99579811 176.0024719238 -5.00061988831 5.9001277e-06 176.0024719238 -5.00061988831
		 24.99752617 176.0024719238 -5.00061988831 31.0047683716 181.19841003 -5.00061988831
		 -64.63735199 173.95674133 -5.0007147789 5.9001277e-06 146.59692383 -5.00061988831
		 64.6386795 173.95674133 -4.9984808 72.82069397 253.89112854 3.6878382e-07 27.81686974 286.60424805 3.6878379e-07
		 -27.81344414 286.59890747 3.6878379e-07 -72.82221985 253.90675354 3.6878382e-07 -90.00077056885 200.99998474 3.6875824e-07
		 -72.81076813 148.11990356 3.6871845e-07 -27.81342697 115.42932129 3.6871563e-07 27.80562782 115.42932129 3.6871563e-07
		 72.81230164 148.089782715 3.6871845e-07 90.016029358 201 3.6875824e-07 74.35891724 255.027816772 5.87890148
		 28.39369202 288.42974854 5.87890148 -28.39827538 288.39770508 5.87890148 -74.37188721 255.022842407 5.87890148
		 -91.89533997 200.99998474 5.87890148 -74.34822845 146.97329712 5.87890148 -28.39730453 113.57022095 5.87890148
		 28.39579582 113.55268097 5.87890148 74.34822845 146.97941589 5.87890148 91.9250946 201 5.87890148
		 78.38950348 257.94842529 9.51008987 29.94525719 293.15829468 9.51008987 -29.95155907 293.15829468 9.51008987
		 -78.41162872 257.95526123 9.51008987 -96.9037323 200.99998474 9.51008987 -78.38873291 144.025604248 9.51008987
		 -29.94944382 108.83705902 9.51008987 29.95270348 108.83705902 9.51008987 78.38644409 144.025985718 9.51008987
		 96.91670227 201 9.51008987 83.41620636 261.58572388 9.50932693 31.86042786 299.0079650879 9.50932693
		 -31.85547829 299.055999756 9.50932693 -83.4131546 261.59371948 9.50932693 -103.11992645 200.99998474 9.50932693
		 -83.41313934 140.40129089 9.50932693 -31.85851288 102.93630219 9.50932693 31.8533802 102.98209381 9.50932693
		 83.41162109 140.41122437 9.50932693 103.08177948 201 9.50932693 87.43764496 264.55252075 5.87599468
		 33.39865112 303.81741333 5.87599468 -33.40438461 303.82806396 5.87599468 -87.43764496 264.52233887 5.87599468
		 -108.10009766 200.99998474 5.87599468 -87.49485779 137.47149658 5.87599468 -33.40589142 98.171875 5.87599468
		 33.40666962 98.171875 5.87599468 87.43229675 137.46694946 5.87599468 108.057373047 201 5.87599468
		 88.97814941 265.64837646 9.647365e-07 33.99759293 305.62692261 9.6479334e-07 -33.9846344 305.60095215 9.6479334e-07
		 -88.97280884 265.65597534 9.647365e-07 -109.93668365 200.99998474 9.647365e-07 -88.97051239 136.36497498 9.647365e-07
		 -33.98537827 96.38451385 9.6461144e-07 33.99264526 96.38451385 9.6461144e-07 88.98500824 136.352005 9.647365e-07
		 109.9878006 201 9.647365e-07 87.43764496 264.55252075 -5.87646961 33.39865112 303.81741333 -5.87646961
		 -33.40438461 303.82806396 -5.87646961 -87.43764496 264.52233887 -5.87646961 -108.10009766 200.99998474 -5.87646961
		 -87.49485779 137.47149658 -5.87646961 -33.40589142 98.171875 -5.87646961 33.40666962 98.171875 -5.87646961
		 87.43229675 137.46694946 -5.87646961 108.057373047 201 -5.87646961 83.41620636 261.58572388 -9.513237
		 31.86042786 299.0079650879 -9.513237 -31.85547829 299.055999756 -9.513237 -83.4131546 261.59371948 -9.513237
		 -103.11992645 200.99998474 -9.513237 -83.41313934 140.40129089 -9.513237 -31.85851288 102.93630219 -9.513237
		 31.8533802 102.98209381 -9.513237 83.41162109 140.41122437 -9.513237 103.08177948 201 -9.513237
		 78.38264465 257.94842529 -9.50961304 29.94487762 293.15222168 -9.50961304 -29.94545937 293.15829468 -9.50961304
		 -78.41087341 257.95526123 -9.50961304 -96.93578339 200.99998474 -9.50961304 -78.41238403 144.025604248 -9.50961304
		 -29.9460144 108.82561493 -9.50961304 29.94584084 108.83705902 -9.50961304 78.38950348 144.025985718 -9.50961304
		 96.91060638 201 -9.50961304 74.35891724 255.027816772 -5.87713909 28.39369202 288.42974854 -5.87713909
		 -28.39827538 288.39770508 -5.87713909 -74.37188721 255.022842407 -5.87713909 -91.89533997 200.99998474 -5.87713909
		 -74.34822845 146.97329712 -5.87713909 -28.39730453 113.57022095 -5.87713909 28.39579582 113.55268097 -5.87713909
		 74.34822845 146.97941589 -5.87713909 91.9250946 201 -5.87713909;
	setAttr -s 284 ".ed";
	setAttr ".ed[0:165]"  0 1 0 1 2 0 3 4 1 4 5 1 5 6 1 6 7 1 8 9 1 9 10 1 10 11 1
		 11 12 1 13 14 1 14 15 1 15 16 1 16 17 1 18 19 0 19 20 0 21 22 0 22 23 0 24 25 1 25 26 1
		 26 27 1 27 28 1 29 30 1 30 31 1 31 32 1 32 33 1 34 35 1 35 36 1 36 37 1 37 38 1 39 40 0
		 40 41 0 0 3 0 0 4 1 1 5 1 2 6 1 2 7 0 3 8 0 4 9 1 5 10 1 6 11 1 7 12 0 8 13 0 9 14 1
		 10 15 1 11 16 1 12 17 0 13 18 0 14 18 1 15 19 1 16 20 1 17 20 0 18 21 0 19 22 1 20 23 1
		 21 24 0 21 25 1 22 26 1 23 27 1 23 28 0 24 29 0 25 30 1 26 31 1 27 32 1 28 33 0 29 34 0
		 30 35 1 31 36 1 32 37 1 33 38 0 34 39 0 35 39 1 36 40 1 37 41 1 38 41 0 39 0 0 40 1 1
		 41 2 1 38 7 1 33 12 1 28 17 1 34 3 1 29 8 1 24 13 1 42 43 0 43 44 0 44 45 0 45 46 0
		 46 47 0 47 48 0 48 49 0 49 50 0 50 51 0 51 42 0 52 53 0 53 54 0 54 55 0 55 56 0 56 57 0
		 57 58 0 58 59 0 59 60 0 60 61 0 61 52 0 62 63 0 63 64 0 64 65 0 65 66 0 66 67 0 67 68 0
		 68 69 0 69 70 0 70 71 0 71 62 0 72 73 0 73 74 0 74 75 0 75 76 0 76 77 0 77 78 0 78 79 0
		 79 80 0 80 81 0 81 72 0 82 83 0 83 84 0 84 85 0 85 86 0 86 87 0 87 88 0 88 89 0 89 90 0
		 90 91 0 91 82 0 92 93 0 93 94 0 94 95 0 95 96 0 96 97 0 97 98 0 98 99 0 99 100 0
		 100 101 0 101 92 0 102 103 0 103 104 0 104 105 0 105 106 0 106 107 0 107 108 0 108 109 0
		 109 110 0 110 111 0 111 102 0 112 113 0 113 114 0 114 115 0 115 116 0 116 117 0 117 118 0
		 118 119 0 119 120 0 120 121 0 121 112 0 122 123 0 123 124 0;
	setAttr ".ed[166:283]" 124 125 0 125 126 0 126 127 0 127 128 0 128 129 0 129 130 0
		 130 131 0 131 122 0 132 133 0 133 134 0 134 135 0 135 136 0 136 137 0 137 138 0 138 139 0
		 139 140 0 140 141 0 141 132 0 42 52 0 43 53 0 44 54 0 45 55 0 46 56 0 47 57 0 48 58 0
		 49 59 0 50 60 0 51 61 0 52 62 0 53 63 0 54 64 0 55 65 0 56 66 0 57 67 0 58 68 0 59 69 0
		 60 70 0 61 71 0 62 72 0 63 73 0 64 74 0 65 75 0 66 76 0 67 77 0 68 78 0 69 79 0 70 80 0
		 71 81 0 72 82 0 73 83 0 74 84 0 75 85 0 76 86 0 77 87 0 78 88 0 79 89 0 80 90 0 81 91 0
		 82 92 0 83 93 0 84 94 0 85 95 0 86 96 0 87 97 0 88 98 0 89 99 0 90 100 0 91 101 0
		 92 102 0 93 103 0 94 104 0 95 105 0 96 106 0 97 107 0 98 108 0 99 109 0 100 110 0
		 101 111 0 102 112 0 103 113 0 104 114 0 105 115 0 106 116 0 107 117 0 108 118 0 109 119 0
		 110 120 0 111 121 0 112 122 0 113 123 0 114 124 0 115 125 0 116 126 0 117 127 0 118 128 0
		 119 129 0 120 130 0 121 131 0 122 132 0 123 133 0 124 134 0 125 135 0 126 136 0 127 137 0
		 128 138 0 129 139 0 130 140 0 131 141 0 132 42 0 133 43 0 134 44 0 135 45 0 136 46 0
		 137 47 0 138 48 0 139 49 0 140 50 0 141 51 0;
	setAttr -s 144 -ch 568 ".fc[0:143]" -type "polyFaces" 
		f 3 33 -3 -33
		mu 0 3 0 1 2
		f 4 0 34 -4 -34
		mu 0 4 0 3 4 1
		f 4 1 35 -5 -35
		mu 0 4 3 5 6 4
		f 3 36 -6 -36
		mu 0 3 5 7 6
		f 4 2 38 -7 -38
		mu 0 4 2 1 8 9
		f 4 3 39 -8 -39
		mu 0 4 1 4 10 8
		f 4 4 40 -9 -40
		mu 0 4 4 6 11 10
		f 4 5 41 -10 -41
		mu 0 4 6 7 12 11
		f 4 6 43 -11 -43
		mu 0 4 9 8 13 14
		f 4 7 44 -12 -44
		mu 0 4 8 10 15 13
		f 4 8 45 -13 -45
		mu 0 4 10 11 16 15
		f 4 9 46 -14 -46
		mu 0 4 11 12 17 16
		f 3 10 48 -48
		mu 0 3 14 13 18
		f 4 11 49 -15 -49
		mu 0 4 13 15 19 18
		f 4 12 50 -16 -50
		mu 0 4 15 16 20 19
		f 3 13 51 -51
		mu 0 3 16 17 20
		f 4 14 53 -17 -53
		mu 0 4 18 19 21 22
		f 4 15 54 -18 -54
		mu 0 4 19 20 23 21
		f 3 56 -19 -56
		mu 0 3 22 24 25
		f 4 16 57 -20 -57
		mu 0 4 22 21 26 24
		f 4 17 58 -21 -58
		mu 0 4 21 23 27 26
		f 3 59 -22 -59
		mu 0 3 23 28 27
		f 4 18 61 -23 -61
		mu 0 4 25 24 29 30
		f 4 19 62 -24 -62
		mu 0 4 24 26 31 29
		f 4 20 63 -25 -63
		mu 0 4 26 27 32 31
		f 4 21 64 -26 -64
		mu 0 4 27 28 33 32
		f 4 22 66 -27 -66
		mu 0 4 30 29 34 35
		f 4 23 67 -28 -67
		mu 0 4 29 31 36 34
		f 4 24 68 -29 -68
		mu 0 4 31 32 37 36
		f 4 25 69 -30 -69
		mu 0 4 32 33 38 37
		f 3 26 71 -71
		mu 0 3 35 34 39
		f 4 27 72 -31 -72
		mu 0 4 34 36 40 39
		f 4 28 73 -32 -73
		mu 0 4 36 37 41 40
		f 3 29 74 -74
		mu 0 3 37 38 41
		f 4 30 76 -1 -76
		mu 0 4 39 40 42 43
		f 4 31 77 -2 -77
		mu 0 4 40 41 44 42
		f 4 -78 -75 78 -37
		mu 0 4 5 45 46 7
		f 4 -79 -70 79 -42
		mu 0 4 7 46 47 12
		f 4 -80 -65 80 -47
		mu 0 4 12 47 48 17
		f 4 -81 -60 -55 -52
		mu 0 4 17 48 49 20
		f 4 75 32 -82 70
		mu 0 4 50 0 2 51
		f 4 81 37 -83 65
		mu 0 4 51 2 9 52
		f 4 82 42 -84 60
		mu 0 4 52 9 14 53
		f 4 83 47 52 55
		mu 0 4 53 14 18 54
		f 4 -85 184 94 -186
		mu 0 4 55 56 57 58
		f 4 -86 185 95 -187
		mu 0 4 59 55 58 60
		f 4 -87 186 96 -188
		mu 0 4 61 59 60 62
		f 4 -88 187 97 -189
		mu 0 4 63 61 62 64
		f 4 -89 188 98 -190
		mu 0 4 65 63 64 66
		f 4 -90 189 99 -191
		mu 0 4 67 65 66 68
		f 4 -91 190 100 -192
		mu 0 4 69 67 68 70
		f 4 -92 191 101 -193
		mu 0 4 71 69 70 72
		f 4 -93 192 102 -194
		mu 0 4 73 71 72 74
		f 4 -94 193 103 -185
		mu 0 4 75 73 74 76
		f 4 -95 194 104 -196
		mu 0 4 58 57 77 78
		f 4 -96 195 105 -197
		mu 0 4 60 58 78 79
		f 4 -97 196 106 -198
		mu 0 4 62 60 79 80
		f 4 -98 197 107 -199
		mu 0 4 64 62 80 81
		f 4 -99 198 108 -200
		mu 0 4 66 64 81 82
		f 4 -100 199 109 -201
		mu 0 4 68 66 82 83
		f 4 -101 200 110 -202
		mu 0 4 70 68 83 84
		f 4 -102 201 111 -203
		mu 0 4 72 70 84 85
		f 4 -103 202 112 -204
		mu 0 4 74 72 85 86
		f 4 -104 203 113 -195
		mu 0 4 76 74 86 87
		f 4 -105 204 114 -206
		mu 0 4 78 77 88 89
		f 4 -106 205 115 -207
		mu 0 4 79 78 89 90
		f 4 -107 206 116 -208
		mu 0 4 80 79 90 91
		f 4 -108 207 117 -209
		mu 0 4 81 80 91 92
		f 4 -109 208 118 -210
		mu 0 4 82 81 92 93
		f 4 -110 209 119 -211
		mu 0 4 83 82 93 94
		f 4 -111 210 120 -212
		mu 0 4 84 83 94 95
		f 4 -112 211 121 -213
		mu 0 4 85 84 95 96
		f 4 -113 212 122 -214
		mu 0 4 86 85 96 97
		f 4 -114 213 123 -205
		mu 0 4 87 86 97 98
		f 4 -115 214 124 -216
		mu 0 4 89 88 99 100
		f 4 -116 215 125 -217
		mu 0 4 90 89 100 101
		f 4 -117 216 126 -218
		mu 0 4 91 90 101 102
		f 4 -118 217 127 -219
		mu 0 4 92 91 102 103
		f 4 -119 218 128 -220
		mu 0 4 93 92 103 104
		f 4 -120 219 129 -221
		mu 0 4 94 93 104 105
		f 4 -121 220 130 -222
		mu 0 4 95 94 105 106
		f 4 -122 221 131 -223
		mu 0 4 96 95 106 107
		f 4 -123 222 132 -224
		mu 0 4 97 96 107 108
		f 4 -124 223 133 -215
		mu 0 4 98 97 108 109
		f 4 -125 224 134 -226
		mu 0 4 100 99 110 111
		f 4 -126 225 135 -227
		mu 0 4 101 100 111 112
		f 4 -127 226 136 -228
		mu 0 4 102 101 112 113
		f 4 -128 227 137 -229
		mu 0 4 103 102 113 114
		f 4 -129 228 138 -230
		mu 0 4 104 103 114 115
		f 4 -130 229 139 -231
		mu 0 4 105 104 115 116
		f 4 -131 230 140 -232
		mu 0 4 106 105 116 117
		f 4 -132 231 141 -233
		mu 0 4 107 106 117 118
		f 4 -133 232 142 -234
		mu 0 4 108 107 118 119
		f 4 -134 233 143 -225
		mu 0 4 109 108 119 120
		f 4 -135 234 144 -236
		mu 0 4 111 110 121 122
		f 4 -136 235 145 -237
		mu 0 4 112 111 122 123
		f 4 -137 236 146 -238
		mu 0 4 113 112 123 124
		f 4 -138 237 147 -239
		mu 0 4 114 113 124 125
		f 4 -139 238 148 -240
		mu 0 4 115 114 125 126
		f 4 -140 239 149 -241
		mu 0 4 116 115 126 127
		f 4 -141 240 150 -242
		mu 0 4 117 116 127 128
		f 4 -142 241 151 -243
		mu 0 4 118 117 128 129
		f 4 -143 242 152 -244
		mu 0 4 119 118 129 130
		f 4 -144 243 153 -235
		mu 0 4 120 119 130 131
		f 4 -145 244 154 -246
		mu 0 4 122 121 132 133
		f 4 -146 245 155 -247
		mu 0 4 123 122 133 134
		f 4 -147 246 156 -248
		mu 0 4 124 123 134 135
		f 4 -148 247 157 -249
		mu 0 4 125 124 135 136
		f 4 -149 248 158 -250
		mu 0 4 126 125 136 137
		f 4 -150 249 159 -251
		mu 0 4 127 126 137 138
		f 4 -151 250 160 -252
		mu 0 4 128 127 138 139
		f 4 -152 251 161 -253
		mu 0 4 129 128 139 140
		f 4 -153 252 162 -254
		mu 0 4 130 129 140 141
		f 4 -154 253 163 -245
		mu 0 4 131 130 141 142
		f 4 -155 254 164 -256
		mu 0 4 133 132 143 144
		f 4 -156 255 165 -257
		mu 0 4 134 133 144 145
		f 4 -157 256 166 -258
		mu 0 4 135 134 145 146
		f 4 -158 257 167 -259
		mu 0 4 136 135 146 147
		f 4 -159 258 168 -260
		mu 0 4 137 136 147 148
		f 4 -160 259 169 -261
		mu 0 4 138 137 148 149
		f 4 -161 260 170 -262
		mu 0 4 139 138 149 150
		f 4 -162 261 171 -263
		mu 0 4 140 139 150 151
		f 4 -163 262 172 -264
		mu 0 4 141 140 151 152
		f 4 -164 263 173 -255
		mu 0 4 142 141 152 153
		f 4 -165 264 174 -266
		mu 0 4 144 143 154 155
		f 4 -166 265 175 -267
		mu 0 4 145 144 155 156
		f 4 -167 266 176 -268
		mu 0 4 146 145 156 157
		f 4 -168 267 177 -269
		mu 0 4 147 146 157 158
		f 4 -169 268 178 -270
		mu 0 4 148 147 158 159
		f 4 -170 269 179 -271
		mu 0 4 149 148 159 160
		f 4 -171 270 180 -272
		mu 0 4 150 149 160 161
		f 4 -172 271 181 -273
		mu 0 4 151 150 161 162
		f 4 -173 272 182 -274
		mu 0 4 152 151 162 163
		f 4 -174 273 183 -265
		mu 0 4 153 152 163 164
		f 4 -175 274 84 -276
		mu 0 4 155 154 165 166
		f 4 -176 275 85 -277
		mu 0 4 156 155 166 167
		f 4 -177 276 86 -278
		mu 0 4 157 156 167 168
		f 4 -178 277 87 -279
		mu 0 4 158 157 168 169
		f 4 -179 278 88 -280
		mu 0 4 159 158 169 170
		f 4 -180 279 89 -281
		mu 0 4 160 159 170 171
		f 4 -181 280 90 -282
		mu 0 4 161 160 171 172
		f 4 -182 281 91 -283
		mu 0 4 162 161 172 173
		f 4 -183 282 92 -284
		mu 0 4 163 162 173 174
		f 4 -184 283 93 -275
		mu 0 4 164 163 174 175;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "AD44F5F6-4B72-F77B-7459-2AB233B132B9";
	setAttr -s 2 ".lnk";
	setAttr -s 2 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "EB5DFBA2-40BB-8C63-1BAB-A9B4751BB15D";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "E62FE51F-46F6-3D6B-B0EC-D49AACA6BC4B";
createNode displayLayerManager -n "layerManager";
	rename -uid "5377AC15-4B8E-38CF-02F6-5ABB2C06CF71";
createNode displayLayer -n "defaultLayer";
	rename -uid "5DB17DE5-496C-AC28-2644-97A794A5E6FA";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "EF064C7E-4E0D-08F2-2D67-E4A0BBC553DF";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "F26B0C4D-4DBE-627F-37F2-458DBEA3AF52";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "15B67BBC-4815-8752-DDA8-C89240D9DC0B";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n"
		+ "            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n"
		+ "            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n"
		+ "            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1\n            -height 1\n"
		+ "            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 32768\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n"
		+ "            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n"
		+ "            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 1394\n            -height 700\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n"
		+ "            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n"
		+ "            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n"
		+ "            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n"
		+ "            -selectionOrder \"chronological\" \n            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n"
		+ "                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 1\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n"
		+ "                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -showCurveNames 0\n                -showActiveCurveNames 0\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                -valueLinesToggle 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n"
		+ "                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n"
		+ "                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n"
		+ "                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n"
		+ "            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n"
		+ "                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n"
		+ "\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n"
		+ "\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -highlightConnections 0\n                -copyConnectionsOnPaste 0\n                -defaultPinnedState 0\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n"
		+ "                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -activeTab -1\n                -editorMode \"default\" \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"vertical2\\\" -ps 1 12 100 -ps 2 88 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Outliner\")) \n"
		+ "\t\t\t\t\t\"outlinerPanel\"\n\t\t\t\t\t\"$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\\\"Outliner\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\noutlinerEditor -e \\n    -showShapes 0\\n    -showAssignedMaterials 0\\n    -showTimeEditor 1\\n    -showReferenceNodes 0\\n    -showReferenceMembers 0\\n    -showAttributes 0\\n    -showConnected 0\\n    -showAnimCurvesOnly 0\\n    -showMuteInfo 0\\n    -organizeByLayer 1\\n    -organizeByClip 1\\n    -showAnimLayerWeight 1\\n    -autoExpandLayers 1\\n    -autoExpand 0\\n    -showDagOnly 1\\n    -showAssets 1\\n    -showContainedOnly 1\\n    -showPublishedAsConnected 0\\n    -showParentContainers 0\\n    -showContainerContents 1\\n    -ignoreDagHierarchy 0\\n    -expandConnections 0\\n    -showUpstreamCurves 1\\n    -showUnitlessCurves 1\\n    -showCompounds 1\\n    -showLeafs 1\\n    -showNumericAttrsOnly 0\\n    -highlightActive 1\\n    -autoSelectNewObjects 0\\n    -doNotSelectNewObjects 0\\n    -dropIsParent 1\\n    -transmitFilters 0\\n    -setFilter \\\"defaultSetFilter\\\" \\n    -showSetMembers 1\\n    -allowMultiSelection 1\\n    -alwaysToggleSelect 0\\n    -directSelect 0\\n    -isSet 0\\n    -isSetMember 0\\n    -displayMode \\\"DAG\\\" \\n    -expandObjects 0\\n    -setsIgnoreFilters 1\\n    -containersIgnoreFilters 0\\n    -editAttrName 0\\n    -showAttrValues 0\\n    -highlightSecondary 0\\n    -showUVAttrsOnly 0\\n    -showTextureNodesOnly 0\\n    -attrAlphaOrder \\\"default\\\" \\n    -animLayerFilterOptions \\\"allAffecting\\\" \\n    -sortOrder \\\"none\\\" \\n    -longNames 0\\n    -niceNames 1\\n    -showNamespace 1\\n    -showPinIcons 0\\n    -mapMotionTrails 0\\n    -ignoreHiddenAttribute 0\\n    -ignoreOutlinerColor 0\\n    -renderFilterVisible 0\\n    -renderFilterIndex 0\\n    -selectionOrder \\\"chronological\\\" \\n    -expandAttribute 0\\n    $editorName\"\n"
		+ "\t\t\t\t\t\"outlinerPanel -edit -l (localizedPanelLabel(\\\"Outliner\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\noutlinerEditor -e \\n    -showShapes 0\\n    -showAssignedMaterials 0\\n    -showTimeEditor 1\\n    -showReferenceNodes 0\\n    -showReferenceMembers 0\\n    -showAttributes 0\\n    -showConnected 0\\n    -showAnimCurvesOnly 0\\n    -showMuteInfo 0\\n    -organizeByLayer 1\\n    -organizeByClip 1\\n    -showAnimLayerWeight 1\\n    -autoExpandLayers 1\\n    -autoExpand 0\\n    -showDagOnly 1\\n    -showAssets 1\\n    -showContainedOnly 1\\n    -showPublishedAsConnected 0\\n    -showParentContainers 0\\n    -showContainerContents 1\\n    -ignoreDagHierarchy 0\\n    -expandConnections 0\\n    -showUpstreamCurves 1\\n    -showUnitlessCurves 1\\n    -showCompounds 1\\n    -showLeafs 1\\n    -showNumericAttrsOnly 0\\n    -highlightActive 1\\n    -autoSelectNewObjects 0\\n    -doNotSelectNewObjects 0\\n    -dropIsParent 1\\n    -transmitFilters 0\\n    -setFilter \\\"defaultSetFilter\\\" \\n    -showSetMembers 1\\n    -allowMultiSelection 1\\n    -alwaysToggleSelect 0\\n    -directSelect 0\\n    -isSet 0\\n    -isSetMember 0\\n    -displayMode \\\"DAG\\\" \\n    -expandObjects 0\\n    -setsIgnoreFilters 1\\n    -containersIgnoreFilters 0\\n    -editAttrName 0\\n    -showAttrValues 0\\n    -highlightSecondary 0\\n    -showUVAttrsOnly 0\\n    -showTextureNodesOnly 0\\n    -attrAlphaOrder \\\"default\\\" \\n    -animLayerFilterOptions \\\"allAffecting\\\" \\n    -sortOrder \\\"none\\\" \\n    -longNames 0\\n    -niceNames 1\\n    -showNamespace 1\\n    -showPinIcons 0\\n    -mapMotionTrails 0\\n    -ignoreHiddenAttribute 0\\n    -ignoreOutlinerColor 0\\n    -renderFilterVisible 0\\n    -renderFilterIndex 0\\n    -selectionOrder \\\"chronological\\\" \\n    -expandAttribute 0\\n    $editorName\"\n"
		+ "\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1394\\n    -height 700\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 32768\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 1394\\n    -height 700\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "11CF25B4-47BE-7D82-9AED-DBA46274151E";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
createNode groupId -n "groupId1";
	rename -uid "C8E77312-4D97-FA4F-8163-5ABC537C5074";
	setAttr ".ihi" 0;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -s 2 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 4 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "groupId1.id" "powerupShape.iog.og[0].gid";
connectAttr ":initialShadingGroup.mwc" "powerupShape.iog.og[0].gco";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "powerupShape.iog.og[0]" ":initialShadingGroup.dsm" -na;
connectAttr "groupId1.msg" ":initialShadingGroup.gn" -na;
// End of poweruprep.ma
