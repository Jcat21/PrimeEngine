//Maya ASCII 2008 scene
//Name: Arcane_Circle_Rigged - Copy.ma
//Last modified: Wed, Nov 25, 2009 03:01:58 PM
//Codeset: 1252
requires maya "2008";
currentUnit -l centimeter -a degree -t ntsc;
fileInfo "application" "maya";
fileInfo "product" "Maya Unlimited 2008";
fileInfo "version" "2008";
fileInfo "cutIdentifier" "200708022245-704165";
fileInfo "osv" "Microsoft Windows Vista Service Pack 1 (Build 6001)\n";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 15.562787284082798 5.6369102333030421 32.605724423350225 ;
	setAttr ".r" -type "double3" -11.400000000000341 22.800000000000058 -8.6253438918319215e-016 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 38.2190752804879;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -0.13605737686157227 100.11207018447305 -0.71303367614743873 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 29.87907305795547;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 100.1 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 31.036668766588932;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode joint -n "Arcane_Title_Skeleton";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 -max 1 
		-at "bool";
	setAttr ".uoc" yes;
	setAttr ".r" -type "double3" -90 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".radi" 0.5;
createNode joint -n "Main_Circle" -p "Arcane_Title_Skeleton";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 -max 1 
		-at "bool";
	addAttr -ci true -k true -sn "blendOrient1" -ln "blendOrient1" -bt "aDBL" -dv 1 
		-smn 0 -smx 1 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".radi" 0.5;
	setAttr -k on ".blendOrient1";
createNode orientConstraint -n "Main_Circle_orientConstraint1" -p "Main_Circle";
	addAttr -ci true -k true -sn "w0" -ln "main_controlW0" -bt "W000" -dv 1 -min 0 
		-at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 89.999999999999986 0 0 ;
	setAttr ".rsrr" -type "double3" 89.999999999999986 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "SC_1_Orbit" -p "Arcane_Title_Skeleton";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 -max 1 
		-at "bool";
	addAttr -ci true -k true -sn "blendUnitConversion8" -ln "blendUnitConversion8" -bt "aDBL" 
		-dv 1 -smn 0 -smx 1 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 180.00313025136722 0 ;
	setAttr ".bps" -type "matrix" -0.99999999850760712 0 5.4633192746022929e-005 0 0 1 0 0
		 -5.4633192746022929e-005 0 -0.99999999850760712 0 -0.047623146688412013 0 0.056884430329977448 1;
	setAttr ".radi" 0.82108246071519053;
	setAttr -k on ".blendUnitConversion8";
createNode joint -n "SC_1_Axis" -p "SC_1_Orbit";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 -max 1 
		-at "bool";
	addAttr -ci true -k true -sn "blendOrient1" -ln "blendOrient1" -bt "aDBL" -dv 1 
		-smn 0 -smx 1 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 179.99686974863278 0 ;
	setAttr ".bps" -type "matrix" 1 0 2.4492804702805349e-016 0 0 1 0 0 -2.4492804702805349e-016 0 1 0
		 -7.2552173764255352 0 0.05727820422150897 1;
	setAttr ".radi" 0.82108246071519053;
	setAttr -k on ".blendOrient1";
createNode orientConstraint -n "SC_1_Axis_orientConstraint1" -p "SC_1_Axis";
	addAttr -ci true -k true -sn "w0" -ln "circle_6W0" -bt "W000" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 89.999999999999986 -19.11719964798176 1.6830991801674535e-015 ;
	setAttr ".rsrr" -type "double3" 89.999999999999986 -2.5444739433849042e-014 2.7453512978701271e-019 ;
	setAttr -k on ".w0";
createNode joint -n "SC_2_Orbit" -p "Arcane_Title_Skeleton";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 -max 1 
		-at "bool";
	addAttr -ci true -k true -sn "blendUnitConversion4" -ln "blendUnitConversion4" -bt "aDBL" 
		-dv 1 -smn 0 -smx 1 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 49.569480639583361 0 ;
	setAttr ".bps" -type "matrix" 0.6485254526252614 0 -0.76119296981593298 0 0 1 0 0
		 0.76119296981593298 0 0.6485254526252614 0 0 0 0 1;
	setAttr ".radi" 0.80764856658279516;
	setAttr -k on ".blendUnitConversion4" 0;
createNode joint -n "SC_2_Axis" -p "SC_2_Orbit";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 -max 1 
		-at "bool";
	addAttr -ci true -k true -sn "blendOrient1" -ln "blendOrient1" -bt "aDBL" -dv 1 
		-smn 0 -smx 1 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 6.9478722872673728 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -49.569480639583361 0 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 4.5058720198825828 0 -5.2886715402468703 1;
	setAttr ".radi" 0.80764856658279516;
	setAttr -k on ".blendOrient1" 0;
createNode orientConstraint -n "SC_2_Axis_orientConstraint1" -p "SC_2_Axis";
	addAttr -ci true -k true -sn "w0" -ln "circle_1W0" -bt "W000" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 89.999999999999986 6.6688536419138726 -4.0027764343450864e-016 ;
	setAttr ".rsrr" -type "double3" 89.999999999999986 8.9959671327898885e-015 -7.0622500768802538e-031 ;
	setAttr -k on ".w0" 0;
createNode joint -n "SC_3_Orbit" -p "Arcane_Title_Skeleton";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 -max 1 
		-at "bool";
	addAttr -ci true -k true -sn "blendUnitConversion1" -ln "blendUnitConversion1" -bt "aDBL" 
		-dv 1 -smn 0 -smx 1 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -40.948316528220154 0 ;
	setAttr ".bps" -type "matrix" 0.7553010690091837 0 0.65537797884395244 0 0 1 0 0
		 -0.65537797884395244 0 0.7553010690091837 0 0 0 0 1;
	setAttr ".radi" 0.7843020553903941;
	setAttr -k on ".blendUnitConversion1" 0;
createNode joint -n "SC_3_Axis" -p "SC_3_Orbit";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 -max 1 
		-at "bool";
	addAttr -ci true -k true -sn "blendOrient1" -ln "blendOrient1" -bt "aDBL" -dv 1 
		-smn 0 -smx 1 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 40.948316528220154 0 ;
	setAttr ".bps" -type "matrix" 0.99999999999999978 0 0 0 0 1 0 0 0 0 0.99999999999999978 0
		 4.9068182319280584 0 4.2576672367407538 1;
	setAttr ".radi" 0.7843020553903941;
	setAttr -k on ".blendOrient1";
createNode orientConstraint -n "SC_3_Axis_orientConstraint1" -p "SC_3_Axis";
	addAttr -ci true -k true -sn "w0" -ln "circle_2W0" -bt "W000" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 90.000000000000014 154.05360330530971 0 ;
	setAttr ".rsrr" -type "double3" 90 -2.2489917831974725e-015 -2.2489917831974725e-015 ;
	setAttr -k on ".w0";
createNode joint -n "SC_4_Orbit" -p "Arcane_Title_Skeleton";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 -max 1 
		-at "bool";
	addAttr -ci true -k true -sn "blendUnitConversion9" -ln "blendUnitConversion9" -bt "aDBL" 
		-dv 1 -smn 0 -smx 1 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 235.20032779131867 0 ;
	setAttr ".bps" -type "matrix" -0.57070886984945179 0 0.82115247419414239 0 0 1 0 0
		 -0.82115247419414239 0 -0.57070886984945179 0 0 0 0 1;
	setAttr ".radi" 0.71885226567138361;
	setAttr -k on ".blendUnitConversion9";
createNode joint -n "SC_4_Axis" -p "SC_4_Orbit";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 -max 1 
		-at "bool";
	addAttr -ci true -k true -sn "blendOrient1" -ln "blendOrient1" -bt "aDBL" -dv 1 
		-smn 0 -smx 1 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 124.79967220868136 0 ;
	setAttr ".bps" -type "matrix" 1 0 -1.1102230246251565e-016 0 0 1 0 0 1.1102230246251565e-016 0 1 0
		 -2.9854601678187258 0 4.2955666766824523 1;
	setAttr ".radi" 0.71885226567138361;
	setAttr -k on ".blendOrient1";
createNode orientConstraint -n "SC_4_Axis_orientConstraint1" -p "SC_4_Axis";
	addAttr -ci true -k true -sn "w0" -ln "circle_5W0" -bt "W000" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 90 -0.20570212974512367 1.2424121794046706e-017 ;
	setAttr ".rsrr" -type "double3" 90 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "SC_5_Orbit" -p "Arcane_Title_Skeleton";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 -max 1 
		-at "bool";
	addAttr -ci true -k true -sn "blendUnitConversion6" -ln "blendUnitConversion6" -bt "aDBL" 
		-dv 1 -smn 0 -smx 1 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 124.7575498495559 0 ;
	setAttr ".bps" -type "matrix" -0.57010502584494072 0 -0.82157182248805216 0 0 1 0 0
		 0.82157182248805216 0 -0.57010502584494072 0 0 0 0 1;
	setAttr ".radi" 0.7962844388200796;
	setAttr -k on ".blendUnitConversion6" 0;
createNode joint -n "SC_5_Axis" -p "SC_5_Orbit";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 -max 1 
		-at "bool";
	addAttr -ci true -k true -sn "blendOrient1" -ln "blendOrient1" -bt "aDBL" -dv 1 
		-smn 0 -smx 1 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 235.24245015044409 0 ;
	setAttr ".bps" -type "matrix" 1.0000000000000002 0 3.8857805861880479e-016 0 0 1 0 0
		 -3.8857805861880479e-016 0 1.0000000000000002 0 -3.835761147097132 0 -5.5276714524291259 1;
	setAttr ".radi" 0.7962844388200796;
	setAttr -k on ".blendOrient1" 0;
createNode orientConstraint -n "SC_5_Axis_orientConstraint1" -p "SC_5_Axis";
	addAttr -ci true -k true -sn "w0" -ln "circle_7W0" -bt "W000" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 89.999999999999986 6.668853641913862 -4.0027764343450859e-016 ;
	setAttr ".rsrr" -type "double3" 89.999999999999986 8.9959671327898916e-015 8.9959671327898885e-015 ;
	setAttr -k on ".w0" 0;
createNode joint -n "SC_6_Orbit" -p "Arcane_Title_Skeleton";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 -max 1 
		-at "bool";
	addAttr -ci true -k true -sn "blendUnitConversion2" -ln "blendUnitConversion2" -bt "aDBL" 
		-dv 1 -smn 0 -smx 1 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 5.718005105505072 0 ;
	setAttr ".bps" -type "matrix" 0.99502430976006984 0 -0.099632439428614772 0 0 1 0 0
		 0.099632439428614772 0 0.99502430976006984 0 0 0 0 1;
	setAttr ".radi" 0.79902167482597042;
	setAttr -k on ".blendUnitConversion2" 0;
createNode joint -n "SC_6_Axis" -p "SC_6_Orbit";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 -max 1 
		-at "bool";
	addAttr -ci true -k true -sn "blendOrient1" -ln "blendOrient1" -bt "aDBL" -dv 1 
		-smn 0 -smx 1 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -5.718005105505072 0 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 6.7473451313022865 0 -0.67561611159082535 1;
	setAttr ".radi" 0.79902167482597042;
	setAttr -k on ".blendOrient1" 0;
createNode orientConstraint -n "SC_6_Axis_orientConstraint1" -p "SC_6_Axis";
	addAttr -ci true -k true -sn "w0" -ln "circle_3W0" -bt "W000" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 90 -87.126575064136645 0 ;
	setAttr ".rsrr" -type "double3" 89.999999999999986 0 0 ;
	setAttr -k on ".w0";
createNode joint -n "SC_7_Orbit" -p "Arcane_Title_Skeleton";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 -max 1 
		-at "bool";
	addAttr -ci true -k true -sn "blendUnitConversion3" -ln "blendUnitConversion3" -bt "aDBL" 
		-dv 1 -smn 0 -smx 1 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 31.463639829828971 0 ;
	setAttr ".bps" -type "matrix" 0.85297157268052737 0 -0.52195737009731735 0 0 1 0 0
		 0.52195737009731735 0 0.85297157268052737 0 0 0 0 1;
	setAttr ".radi" 0.8723590336260334;
	setAttr -k on ".blendUnitConversion3" 0;
createNode joint -n "SC_7_Axis" -p "SC_7_Orbit";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 -max 1 
		-at "bool";
	addAttr -ci true -k true -sn "blendOrient1" -ln "blendOrient1" -bt "aDBL" -dv 1 
		-smn 0 -smx 1 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -31.463639829828995 0 ;
	setAttr ".bps" -type "matrix" 1 0 3.8857805861880479e-016 0 0 1 0 0 -3.8857805861880479e-016 0 1 0
		 6.9934638692806468 0 -4.279497847283495 1;
	setAttr ".radi" 0.8723590336260334;
	setAttr -k on ".blendOrient1" 0;
createNode orientConstraint -n "SC_7_Axis_orientConstraint1" -p "SC_7_Axis";
	addAttr -ci true -k true -sn "w0" -ln "circle_9W0" -bt "W000" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 89.999999999999986 2.2489917831974725e-014 -1.4124500153760508e-030 ;
	setAttr ".rsrr" -type "double3" 89.999999999999986 2.2489917831974728e-014 -1.4124500153760508e-030 ;
	setAttr -k on ".w0";
createNode joint -n "SC_8_Orbit" -p "Arcane_Title_Skeleton";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 -max 1 
		-at "bool";
	addAttr -ci true -k true -sn "blendUnitConversion5" -ln "blendUnitConversion5" -bt "aDBL" 
		-dv 1 -smn 0 -smx 1 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 72.939145404303176 0 ;
	setAttr ".bps" -type "matrix" 0.29338724339237565 0 -0.95599368481942548 0 0 1 0 0
		 0.95599368481942548 0 0.29338724339237565 0 0 0 0 1;
	setAttr ".radi" 0.83200460567568424;
	setAttr -k on ".blendUnitConversion5" 0;
createNode joint -n "SC_8_Axis" -p "SC_8_Orbit";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 -max 1 
		-at "bool";
	addAttr -ci true -k true -sn "blendOrient1" -ln "blendOrient1" -bt "aDBL" -dv 1 
		-smn 0 -smx 1 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -72.939145404303176 0 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 2.1765682870791014 0 -7.0922836077198355 1;
	setAttr ".radi" 0.83200460567568424;
	setAttr -k on ".blendOrient1" 0;
createNode orientConstraint -n "SC_8_Axis_orientConstraint1" -p "SC_8_Axis";
	addAttr -ci true -k true -sn "w0" -ln "circle_8W0" -bt "W000" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 90 -13.599588128295952 -3.2723012018033882e-015 ;
	setAttr ".rsrr" -type "double3" 89.999999999999986 4.4979835663949442e-015 -4.4979835663949458e-015 ;
	setAttr -k on ".w0";
createNode joint -n "SC_9_Orbit" -p "Arcane_Title_Skeleton";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 -max 1 
		-at "bool";
	addAttr -ci true -k true -sn "blendUnitConversion7" -ln "blendUnitConversion7" -bt "aDBL" 
		-dv 1 -smn 0 -smx 1 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 1;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 156.9901286181159 0 ;
	setAttr ".bps" -type "matrix" -0.92043752146117752 0 -0.39088971473601658 0 0 1 0 0
		 0.39088971473601658 0 -0.92043752146117752 0 0 0 0 1;
	setAttr ".radi" 0.83078320512758286;
	setAttr -k on ".blendUnitConversion7" 0;
createNode joint -n "SC_9_Axis" -p "SC_9_Orbit";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -bt "lock" -min 0 -max 1 
		-at "bool";
	addAttr -ci true -k true -sn "blendOrient1" -ln "blendOrient1" -bt "aDBL" -dv 1 
		-smn 0 -smx 1 -at "double";
	setAttr ".uoc" yes;
	setAttr ".oc" 2;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 203.0098713818841 0 ;
	setAttr ".bps" -type "matrix" 1 0 2.2204460492503131e-016 0 0 1 0 0 -2.2204460492503131e-016 0 1 0
		 -6.8067661418544319 0 -2.890684933443882 1;
	setAttr ".radi" 0.83078320512758286;
	setAttr -k on ".blendOrient1" 0;
createNode orientConstraint -n "SC_9_Axis_orientConstraint1" -p "SC_9_Axis";
	addAttr -ci true -k true -sn "w0" -ln "circle_4W0" -bt "W000" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".lr" -type "double3" 90 6.6688536419138886 -7.6052752252556663e-015 ;
	setAttr ".rsrr" -type "double3" 89.999999999999986 -2.2489917831974725e-015 -2.2489917831974721e-015 ;
	setAttr -k on ".w0" 0;
createNode joint -n "camera_joint" -p "Arcane_Title_Skeleton";
	addAttr -ci true -k true -sn "blendPoint1" -ln "blendPoint1" -bt "aDBL" -dv 1 -smn 
		0 -smx 1 -at "double";
	addAttr -ci true -k true -sn "blendOrient1" -ln "blendOrient1" -bt "aDBL" -dv 1 
		-smn 0 -smx 1 -at "double";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 89.999999999999986 0 0 ;
	setAttr ".radi" 0.5;
	setAttr -k on ".blendPoint1" 0;
	setAttr -k on ".blendOrient1" 0;
createNode pointConstraint -n "camera_joint_pointConstraint1" -p "camera_joint";
	addAttr -ci true -k true -sn "w0" -ln "camera1W0" -bt "W000" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 5.6756809794334631 -1.6542185769202771 3.6731031037191044e-016 ;
	setAttr -k on ".w0";
createNode orientConstraint -n "camera_joint_orientConstraint1" -p "camera_joint";
	addAttr -ci true -k true -sn "w0" -ln "camera1W0" -bt "W000" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode transform -n "Arcane_Title";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
createNode mesh -n "Arcane_TitleShape" -p "Arcane_Title";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode mesh -n "Arcane_TitleShapeOrig" -p "Arcane_Title";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".uoc" yes;
	setAttr ".oc" 6;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 40 ".uvst[0].uvsp[0:39]" -type "float2" 0.50855786 0.97434068 
		0.26224172 1.0149618 0.47064421 0.74444568 0.22432852 0.78506684 0.51272017 0.84986001 
		0.64556938 0.84986001 0.64556938 0.97385257 0.51272017 0.97385257 0.19177605 0.71778834 
		0.28829968 0.94886196 0.066241108 1.0416191 -0.030282438 0.8105458 0.8067652 0.84713012 
		0.94016427 0.84713012 0.94016427 0.97163588 0.8067652 0.97163588 0.64388961 0.9688406 
		0.66922832 0.8114363 0.81613928 0.83508575 0.79080045 0.99249017 0.85822695 0.7004317 
		0.98268729 0.7004317 0.98268729 0.81659478 0.85822695 0.81659478 0.86736035 0.54126841 
		0.98839301 0.54126841 0.98839301 0.65423197 0.86736035 0.65423197 0.864887 0.38116506 
		1.0057063 0.38116506 1.0057063 0.51259583 0.864887 0.51259583 0.85328007 0.22127581 
		0.99752682 0.22127581 0.99752682 0.35590583 0.85328007 0.35590583 0.036592755 0.029850326 
		0.84882045 0.029850326 0.84882045 0.78792959 0.036592755 0.78792959;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 40 ".vt[0:39]"  -10.189586 -6.5338396e-016 2.3860712 -3.8840575 
		-6.5338396e-016 2.3860712 -10.189586 6.5338396e-016 -3.499088 -3.8840575 6.5338396e-016 
		-3.499088 1.5596255 -5.6283836e-016 -2.7978745 6.9913368 -5.6283836e-016 -2.7978745 
		1.5596255 5.6283836e-016 -7.8674717 6.9913368 5.6283836e-016 -7.8674717 1.3607106 
		-7.3680109e-016 7.4916372 8.471261 -7.3680109e-016 7.4916372 1.3607106 7.3680109e-016 
		0.85512328 8.471261 7.3680109e-016 0.85512328 -5.3356881 -4.5871101e-016 6.1410551 
		-0.90886539 -4.5871101e-016 6.1410551 -5.3356881 4.5871101e-016 2.0093536 -0.90886539 
		4.5871101e-016 2.0093536 -6.5896125 -5.7863002e-016 -2.7227383 -1.0055027 -5.7863002e-016 
		-2.7227383 -6.5896125 5.7863002e-016 -7.9345741 -1.0055027 5.7863002e-016 -7.9345741 
		4.6472573 -4.0777746e-016 1.2188014 8.5825424 -4.0777746e-016 1.2188014 4.6472573 
		4.0777746e-016 -2.4541316 8.5825424 4.0777746e-016 -2.4541316 5.3011823 -3.4100178e-016 
		-2.8170831 8.5920439 -3.4100178e-016 -2.8170831 5.3011823 3.4100178e-016 -5.8885541 
		8.5920439 3.4100178e-016 -5.8885541 0.61105555 -3.4100178e-016 -5.3083916 3.9019172 
		-3.4100178e-016 -5.3083916 0.61105555 3.4100178e-016 -8.3798628 3.9019172 3.4100178e-016 
		-8.3798628 -8.5627241 -3.4100178e-016 -1.2284254 -5.271862 -3.4100178e-016 -1.2284254 
		-8.5627241 3.4100178e-016 -4.2998962 -5.271862 3.4100178e-016 -4.2998962 -7.1260805 
		-1.5543122e-015 6.5429707 7.8739195 -1.5543122e-015 6.5429707 -7.1260805 1.5543122e-015 
		-7.4570293 7.8739195 1.5543122e-015 -7.4570293;
	setAttr -s 40 ".ed[0:39]"  0 1 0 0 2 0 
		1 3 0 2 3 0 4 5 0 4 6 0 
		5 7 0 6 7 0 8 9 0 8 10 0 
		9 11 0 10 11 0 12 13 0 12 14 0 
		13 15 0 14 15 0 16 17 0 16 18 0 
		17 19 0 18 19 0 20 21 0 20 22 0 
		21 23 0 22 23 0 24 25 0 24 26 0 
		25 27 0 26 27 0 28 29 0 28 30 0 
		29 31 0 30 31 0 32 33 0 32 34 0 
		33 35 0 34 35 0 36 37 0 36 38 0 
		37 39 0 38 39 0;
	setAttr -s 10 ".fc[0:9]" -type "polyFaces" 
		f 4 0 2 -4 -2 
		mu 0 4 0 1 3 2 
		f 4 4 6 -8 -6 
		mu 0 4 4 5 6 7 
		f 4 8 10 -12 -10 
		mu 0 4 8 9 10 11 
		f 4 12 14 -16 -14 
		mu 0 4 12 13 14 15 
		f 4 16 18 -20 -18 
		mu 0 4 16 17 18 19 
		f 4 20 22 -24 -22 
		mu 0 4 20 21 22 23 
		f 4 24 26 -28 -26 
		mu 0 4 24 25 26 27 
		f 4 28 30 -32 -30 
		mu 0 4 28 29 30 31 
		f 4 32 34 -36 -34 
		mu 0 4 32 33 34 35 
		f 4 36 38 -40 -38 
		mu 0 4 36 37 38 39 ;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
createNode transform -n "Arkane_camera";
	addAttr -ci true -sn "Orbit" -ln "Orbit" -at "double";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".Orbit";
createNode camera -n "Arkane_cameraShape" -p "Arkane_camera";
	setAttr -k off ".v";
	setAttr ".cap" -type "double2" 1.41732 0.94488 ;
	setAttr ".ff" 0;
	setAttr ".ncp" 0.01;
	setAttr ".coi" 16.223315025528407;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "camera1";
	setAttr ".den" -type "string" "camera1_depth";
	setAttr ".man" -type "string" "camera1_mask";
	setAttr ".ma" no;
createNode transform -n "Controls";
createNode transform -n "main_control" -p "Controls";
	addAttr -ci true -sn "Orbit" -ln "Orbit" -at "double";
	setAttr -l on -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".Orbit";
createNode nurbsCurve -n "main_controlShape" -p "main_control";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		5.124427436682371 -5.124427436682363 -1.4516321485349227e-015
		-8.2680001535722791e-016 -7.2470347803529966 -2.0529178720348843e-015
		-5.1244274366823657 -5.1244274366823657 -1.4516321485349235e-015
		-7.2470347803529966 -2.1000093728512799e-015 -5.9488423936571321e-031
		-5.1244274366823666 5.1244274366823639 1.4516321485349231e-015
		-2.1836730133087904e-015 7.2470347803529984 2.0529178720348847e-015
		5.124427436682363 5.1244274366823666 1.4516321485349239e-015
		7.2470347803529966 3.8923965175681175e-015 1.1026261937675853e-030
		5.124427436682371 -5.124427436682363 -1.4516321485349227e-015
		-8.2680001535722791e-016 -7.2470347803529966 -2.0529178720348843e-015
		-5.1244274366823657 -5.1244274366823657 -1.4516321485349235e-015
		;
createNode pointConstraint -n "main_control_pointConstraint1" -p "main_control";
	addAttr -ci true -k true -sn "w0" -ln "Main_CircleW0" -bt "W000" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode transform -n "circle_1" -p "Controls";
	addAttr -ci true -sn "Orbit" -ln "Orbit" -at "double";
	setAttr -l on -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" -7.2552173764255352 0.057278204221507222 1.2718316227179831e-017 ;
	setAttr ".sp" -type "double3" -7.2552173764255352 0.057278204221507208 1.2718316227179828e-017 ;
	setAttr -k on ".Orbit";
createNode nurbsCurve -n "circle_1Shape" -p "circle_1";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-5.1732430629094557 -2.024696109294569 -5.7705700662928413e-016
		-7.2552173764255352 -2.8870781064653435 -8.213499441094028e-016
		-9.3371916899416121 -2.0246961092945703 -5.7705700662928442e-016
		-10.199573687112387 0.057278204221506354 1.2718316227179586e-017
		-9.3371916899416121 2.1392525177375838 6.0249363908364398e-016
		-7.2552173764255361 3.0016345149083592 8.4678657656376284e-016
		-5.1732430629094583 2.1392525177375852 6.0249363908364427e-016
		-4.3108610657386839 0.05727820422150879 1.2718316227180277e-017
		-5.1732430629094557 -2.024696109294569 -5.7705700662928413e-016
		-7.2552173764255352 -2.8870781064653435 -8.213499441094028e-016
		-9.3371916899416121 -2.0246961092945703 -5.7705700662928442e-016
		;
createNode pointConstraint -n "circle_1_pointConstraint1" -p "circle_1";
	addAttr -ci true -k true -sn "w0" -ln "SC_1_AxisW0" -bt "W000" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 0 1.7486012637846216e-015 3.8826747678846675e-031 ;
	setAttr -k on ".w0";
createNode transform -n "circle_2" -p "Controls";
	addAttr -ci true -sn "Orbit" -ln "Orbit" -at "double";
	setAttr -l on -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 4.5058720198825837 -5.2886715402468703 -1.1743209827323731e-015 ;
	setAttr ".sp" -type "double3" 4.5058720198825837 -5.2886715402468703 -1.1743209827323731e-015 ;
	setAttr -k on ".Orbit";
createNode nurbsCurve -n "circle_2Shape" -p "circle_2";
	setAttr -k off ".v";
	setAttr ".tw" yes;
createNode pointConstraint -n "circle_2_pointConstraint1" -p "circle_2";
	addAttr -ci true -k true -sn "w0" -ln "SC_2_AxisW0" -bt "W000" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -8.8817841970012523e-016 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "circle_3" -p "Controls";
	addAttr -ci true -sn "Orbit" -ln "Orbit" -at "double";
	setAttr -l on -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr ".r" -type "double3" 0 0 442.00752159000746 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 6.2847717341652132 1.6450652599320195 3.652778657174992e-016 ;
	setAttr ".sp" -type "double3" 6.2847717341652158 1.6450652599320195 3.652778657174992e-016 ;
	setAttr -k on ".Orbit";
createNode nurbsCurve -n "circle_3Shape" -p "circle_3";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		8.3739801752667873 -0.44414318116955021 -2.2654671870027282e-016
		6.2847717341652158 -1.3095216520981738 -4.7168848811193514e-016
		4.1955632930636444 -0.44414318116955132 -2.2654671870027317e-016
		3.3301848221350223 1.6450652599320186 3.6527786571749895e-016
		4.1955632930636444 3.7342737010335898 9.5710245013527137e-016
		6.284771734165215 4.5996521719622132 1.2022442195469339e-015
		8.3739801752667855 3.7342737010335907 9.5710245013527157e-016
		9.2393586461954076 1.6450652599320212 3.6527786571749969e-016
		8.3739801752667873 -0.44414318116955021 -2.2654671870027282e-016
		6.2847717341652158 -1.3095216520981738 -4.7168848811193514e-016
		4.1955632930636444 -0.44414318116955132 -2.2654671870027317e-016
		;
createNode pointConstraint -n "circle_3_pointConstraint1" -p "circle_3";
	addAttr -ci true -k true -sn "w0" -ln "SC_3_AxisW0" -bt "W000" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -1.7763568394002505e-015 2.2204460492503131e-016 
		4.9303806576313238e-032 ;
	setAttr -k on ".w0";
createNode transform -n "circle_4" -p "Controls";
	addAttr -ci true -sn "Orbit" -ln "Orbit" -at "double";
	setAttr -l on -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" -2.9854601678187267 4.2955666766824532 9.5380740565308501e-016 ;
	setAttr ".sp" -type "double3" -2.9854601678187276 4.2955666766824523 9.5380740565308481e-016 ;
	setAttr -k on ".Orbit";
createNode nurbsCurve -n "circle_4Shape" -p "circle_4";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-1.2374246954621495 2.5475312043258769 4.5862925749785307e-016
		-2.9854601678187267 1.8234712041665229 2.5351975274116185e-016
		-4.7334956401753017 2.547531204325876 4.5862925749785268e-016
		-5.4575556403346548 4.2955666766824505 9.5380740565308442e-016
		-4.7334956401753026 6.0436021490390273 1.4489855538083161e-015
		-2.9854601678187276 6.7676621491983804 1.6540950585650075e-015
		-1.2374246954621522 6.0436021490390273 1.4489855538083167e-015
		-0.51336469530279771 4.2955666766824523 9.5380740565308481e-016
		-1.2374246954621495 2.5475312043258769 4.5862925749785307e-016
		-2.9854601678187267 1.8234712041665229 2.5351975274116185e-016
		-4.7334956401753017 2.547531204325876 4.5862925749785268e-016
		;
createNode pointConstraint -n "circle_4_pointConstraint1" -p "circle_4";
	addAttr -ci true -k true -sn "w0" -ln "SC_4_AxisW0" -bt "W000" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 8.8817841970012523e-016 -8.8817841970012523e-016 
		-1.9721522630525295e-031 ;
	setAttr -k on ".w0";
createNode transform -n "circle_5" -p "Controls";
	addAttr -ci true -sn "Orbit" -ln "Orbit" -at "double";
	setAttr -l on -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" -3.8357611470971298 -5.5276714524291259 -1.2273896238099993e-015 ;
	setAttr ".sp" -type "double3" -3.8357611470971302 -5.5276714524291268 -1.2273896238099995e-015 ;
	setAttr -k on ".Orbit";
createNode nurbsCurve -n "circle_5Shape" -p "circle_5";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-1.8912910622937891 -7.4721415372324662 -1.7782131688483084e-015
		-3.8357611470971316 -8.2775674179867735 -2.0063717516776042e-015
		-5.7802312319004709 -7.4721415372324689 -1.7782131688483092e-015
		-6.5856571126547756 -5.5276714524291295 -1.2273896238100001e-015
		-5.7802312319004709 -3.5832013676257883 -6.765660787716904e-016
		-3.835761147097132 -2.777775486871481 -4.4840749594239491e-016
		-1.891291062293792 -3.5832013676257874 -6.7656607877169011e-016
		-1.0858651815394851 -5.5276714524291259 -1.2273896238099993e-015
		-1.8912910622937891 -7.4721415372324662 -1.7782131688483084e-015
		-3.8357611470971316 -8.2775674179867735 -2.0063717516776042e-015
		-5.7802312319004709 -7.4721415372324689 -1.7782131688483092e-015
		;
createNode pointConstraint -n "circle_5_pointConstraint1" -p "circle_5";
	addAttr -ci true -k true -sn "w0" -ln "SC_5_AxisW0" -bt "W000" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -2.2204460492503131e-015 0 0 ;
	setAttr -k on ".w0";
createNode transform -n "circle_6" -p "Controls";
	addAttr -ci true -sn "Orbit" -ln "Orbit" -at "double";
	setAttr -l on -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr ".r" -type "double3" 0 0 167.0608587172498 ;
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 6.7473451313022874 -0.67561611159082524 -1.5001691257917066e-016 ;
	setAttr ".sp" -type "double3" 6.7473451313022856 -0.67561611159082435 -1.5001691257917046e-016 ;
	setAttr -k on ".Orbit" -71.600000000000009;
createNode nurbsCurve -n "circle_6Shape" -p "circle_6";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		8.4043974250209761 -2.3326684053095117 -6.1942162385417206e-016
		6.7473451313022865 -3.019041938929238 -8.1385542150610459e-016
		5.0902928375836005 -2.3326684053095121 -6.1942162385417206e-016
		4.4039193039638747 -0.67561611159082613 -1.5001691257917105e-016
		5.0902928375836005 0.98143618212786077 3.1938779869582976e-016
		6.7473451313022865 1.6678097157475866 5.1382159634776259e-016
		8.4043974250209725 0.98143618212786166 3.1938779869582976e-016
		9.0907709586407002 -0.67561611159082524 -1.5001691257917085e-016
		8.4043974250209761 -2.3326684053095117 -6.1942162385417206e-016
		6.7473451313022865 -3.019041938929238 -8.1385542150610459e-016
		5.0902928375836005 -2.3326684053095121 -6.1942162385417206e-016
		;
createNode pointConstraint -n "circle_6_pointConstraint1" -p "circle_6";
	addAttr -ci true -k true -sn "w0" -ln "SC_6_AxisW0" -bt "W000" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -8.8817841970012523e-016 -1.1102230246251565e-016 
		-2.4651903288156619e-032 ;
	setAttr -k on ".w0";
createNode transform -n "circle_7" -p "Controls";
	addAttr -ci true -sn "Orbit" -ln "Orbit" -at "double";
	setAttr -l on -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 6.9934638692806468 -4.279497847283495 -9.5023940877758562e-016 ;
	setAttr ".sp" -type "double3" 6.9934638692806468 -4.279497847283495 -9.5023940877758562e-016 ;
	setAttr -k on ".Orbit";
createNode nurbsCurve -n "circle_7Shape" -p "circle_7";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		8.4861343454564295 -5.772168323459276 -1.3730785409848164e-015
		6.9934638692806468 -6.3904526788451914 -1.548224244247122e-015
		5.5007933931048658 -5.772168323459276 -1.3730785409848166e-015
		4.8825090377189504 -4.2794978472834959 -9.5023940877758582e-016
		5.5007933931048649 -2.7868273711077141 -5.2740027657035474e-016
		6.9934638692806459 -2.1685430157217986 -3.5225457330804918e-016
		8.4861343454564278 -2.7868273711077132 -5.2740027657035444e-016
		9.1044187008423432 -4.2794978472834941 -9.5023940877758523e-016
		8.4861343454564295 -5.772168323459276 -1.3730785409848164e-015
		6.9934638692806468 -6.3904526788451914 -1.548224244247122e-015
		5.5007933931048658 -5.772168323459276 -1.3730785409848166e-015
		;
createNode pointConstraint -n "circle_7_pointConstraint1" -p "circle_7";
	addAttr -ci true -k true -sn "w0" -ln "SC_7_AxisW0" -bt "W000" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr -k on ".w0";
createNode transform -n "circle_9" -p "Controls";
	addAttr -ci true -sn "Orbit" -ln "Orbit" -at "double";
	setAttr -l on -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" -6.806766141854431 -2.8906849334438824 -6.418609940092873e-016 ;
	setAttr ".sp" -type "double3" -6.806766141854431 -2.8906849334438824 -6.418609940092873e-016 ;
	setAttr -k on ".Orbit";
createNode nurbsCurve -n "circle_9Shape" -p "circle_9";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		-5.5622265342739521 -4.1352245410243595 -9.9441037182982445e-016
		-6.806766141854431 -4.6507297253946831 -1.1404411055292877e-015
		-8.0513057494349081 -4.1352245410243604 -9.9441037182982465e-016
		-8.5668109338052325 -2.8906849334438833 -6.418609940092875e-016
		-8.0513057494349081 -1.6461453258634045 -2.8931161618874995e-016
		-6.8067661418544319 -1.1306401414930818 -1.4328088248928695e-016
		-5.5622265342739539 -1.6461453258634045 -2.8931161618874995e-016
		-5.0467213499036294 -2.8906849334438816 -6.418609940092871e-016
		-5.5622265342739521 -4.1352245410243595 -9.9441037182982445e-016
		-6.806766141854431 -4.6507297253946831 -1.1404411055292877e-015
		-8.0513057494349081 -4.1352245410243604 -9.9441037182982465e-016
		;
createNode pointConstraint -n "circle_9_pointConstraint1" -p "circle_9";
	addAttr -ci true -k true -sn "w0" -ln "SC_9_AxisW0" -bt "W000" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" -8.8817841970012523e-016 4.4408920985006262e-016 
		9.8607613152626476e-032 ;
	setAttr -k on ".w0";
createNode transform -n "circle_8" -p "Controls";
	addAttr -ci true -sn "Orbit" -ln "Orbit" -at "double";
	setAttr -l on -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 2.1765682870791014 -7.0922836077198363 -1.5748033116924268e-015 ;
	setAttr ".sp" -type "double3" 2.1765682870791014 -7.0922836077198363 -1.5748033116924268e-015 ;
	setAttr -k on ".Orbit";
createNode nurbsCurve -n "circle_8Shape" -p "circle_8";
	setAttr -k off ".v";
	setAttr ".cc" -type "nurbsCurve" 
		3 8 2 no 3
		13 -2 -1 0 1 2 3 4 5 6 7 8 9 10
		11
		3.3942303058294083 -8.3099456264701406 -1.9197388882633473e-015
		2.176568287079101 -8.8143177490231182 -2.0626158822240063e-015
		0.95890626832879511 -8.3099456264701406 -1.9197388882633477e-015
		0.45453414577581647 -7.0922836077198363 -1.5748033116924268e-015
		0.95890626832879489 -5.8746215889695295 -1.2298677351215055e-015
		2.1765682870791005 -5.3702494664165492 -1.0869907411608465e-015
		3.3942303058294065 -5.8746215889695286 -1.2298677351215053e-015
		3.8986024283823855 -7.0922836077198346 -1.5748033116924264e-015
		3.3942303058294083 -8.3099456264701406 -1.9197388882633473e-015
		2.176568287079101 -8.8143177490231182 -2.0626158822240063e-015
		0.95890626832879511 -8.3099456264701406 -1.9197388882633477e-015
		;
createNode pointConstraint -n "circle_8_pointConstraint1" -p "circle_8";
	addAttr -ci true -k true -sn "w0" -ln "SC_8_AxisW0" -bt "W000" -dv 1 -min 0 -at "double";
	setAttr -k on ".nds";
	setAttr -k off ".v";
	setAttr -k off ".tx";
	setAttr -k off ".ty";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".erp" yes;
	setAttr ".rst" -type "double3" 0 8.8817841970012523e-016 1.9721522630525295e-031 ;
	setAttr -k on ".w0";
createNode lightLinker -n "lightLinker1";
	setAttr -s 5 ".lnk";
	setAttr -s 5 ".slnk";
createNode displayLayerManager -n "layerManager";
	setAttr ".cdl" 1;
	setAttr -s 5 ".dli[1:4]"  1 2 3 4;
	setAttr -s 5 ".dli";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode lambert -n "arcane_sym_lam";
createNode shadingEngine -n "arcane_sym";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
createNode file -n "file1";
	setAttr ".ftn" -type "string" "D:/EasleyDunn/Arkane//Arcane_text_2.png";
createNode place2dTexture -n "place2dTexture1";
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"Arkane_camera\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n"
		+ "                -activeOnly 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 1\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 4096\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -colorResolution 256 256 \n"
		+ "                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 0\n                -nurbsSurfaces 0\n                -polymeshes 1\n                -subdivSurfaces 0\n                -planes 0\n                -lights 0\n                -cameras 0\n                -controlVertices 1\n                -hulls 1\n                -grid 0\n                -joints 0\n                -ikHandles 0\n                -deformers 0\n                -dynamics 0\n"
		+ "                -fluids 0\n                -hairSystems 0\n                -follicles 0\n                -nCloths 0\n                -nRigids 0\n                -dynamicConstraints 0\n                -locators 0\n                -manipulators 1\n                -dimensions 0\n                -handles 0\n                -pivots 0\n                -textures 0\n                -strokes 0\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"Arkane_camera\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n"
		+ "            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 4096\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n"
		+ "            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 0\n            -nurbsSurfaces 0\n            -polymeshes 1\n            -subdivSurfaces 0\n            -planes 0\n            -lights 0\n            -cameras 0\n            -controlVertices 1\n            -hulls 1\n            -grid 0\n            -joints 0\n            -ikHandles 0\n            -deformers 0\n            -dynamics 0\n            -fluids 0\n            -hairSystems 0\n            -follicles 0\n            -nCloths 0\n            -nRigids 0\n            -dynamicConstraints 0\n            -locators 0\n            -manipulators 1\n            -dimensions 0\n            -handles 0\n            -pivots 0\n            -textures 0\n            -strokes 0\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 1\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n"
		+ "                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 4096\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n"
		+ "                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 0\n                -nurbsSurfaces 0\n                -polymeshes 1\n                -subdivSurfaces 0\n                -planes 0\n                -lights 0\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 0\n                -joints 0\n                -ikHandles 0\n                -deformers 0\n                -dynamics 0\n                -fluids 0\n                -hairSystems 0\n                -follicles 0\n                -nCloths 0\n                -nRigids 0\n                -dynamicConstraints 0\n                -locators 0\n                -manipulators 1\n                -dimensions 0\n                -handles 0\n                -pivots 0\n                -textures 0\n                -strokes 0\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 4096\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n"
		+ "            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 0\n            -nurbsSurfaces 0\n            -polymeshes 1\n            -subdivSurfaces 0\n            -planes 0\n            -lights 0\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 0\n            -joints 0\n            -ikHandles 0\n"
		+ "            -deformers 0\n            -dynamics 0\n            -fluids 0\n            -hairSystems 0\n            -follicles 0\n            -nCloths 0\n            -nRigids 0\n            -dynamicConstraints 0\n            -locators 0\n            -manipulators 1\n            -dimensions 0\n            -handles 0\n            -pivots 0\n            -textures 0\n            -strokes 0\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n"
		+ "                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 4096\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n"
		+ "                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n"
		+ "                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 4096\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n"
		+ "            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 1\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 4096\n"
		+ "                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 0\n"
		+ "                -nurbsSurfaces 0\n                -polymeshes 1\n                -subdivSurfaces 0\n                -planes 0\n                -lights 0\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 0\n                -joints 1\n                -ikHandles 0\n                -deformers 0\n                -dynamics 0\n                -fluids 0\n                -hairSystems 0\n                -follicles 0\n                -nCloths 0\n                -nRigids 0\n                -dynamicConstraints 0\n                -locators 0\n                -manipulators 1\n                -dimensions 0\n                -handles 0\n                -pivots 0\n                -textures 0\n                -strokes 0\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n"
		+ "        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 4096\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n"
		+ "            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 0\n            -nurbsSurfaces 0\n            -polymeshes 1\n            -subdivSurfaces 0\n            -planes 0\n            -lights 0\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 0\n            -joints 1\n            -ikHandles 0\n            -deformers 0\n            -dynamics 0\n            -fluids 0\n            -hairSystems 0\n            -follicles 0\n"
		+ "            -nCloths 0\n            -nRigids 0\n            -dynamicConstraints 0\n            -locators 0\n            -manipulators 1\n            -dimensions 0\n            -handles 0\n            -pivots 0\n            -textures 0\n            -strokes 0\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -showShapes 0\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -autoExpand 0\n                -showDagOnly 1\n                -ignoreDagHierarchy 0\n                -expandConnections 0\n"
		+ "                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n"
		+ "\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -autoExpand 0\n            -showDagOnly 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -editAttrName 0\n            -showAttrValues 0\n"
		+ "            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -autoExpand 1\n                -showDagOnly 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUnitlessCurves 1\n"
		+ "                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n"
		+ "                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1.25\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -clipTime \"on\" \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -autoExpand 1\n                -showDagOnly 0\n                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n"
		+ "            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1.25\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -clipTime \"on\" \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\tif ($useSceneConfig) {\n\t\tscriptedPanel -e -to $panelName;\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -autoExpand 0\n                -showDagOnly 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -editAttrName 0\n                -showAttrValues 0\n"
		+ "                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -autoExpand 0\n                -showDagOnly 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -editAttrName 0\n                -showAttrValues 0\n"
		+ "                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n"
		+ "                -snapValue \"none\" \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -zoom 1\n                -animateTransition 0\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n"
		+ "                -graphType \"DAG\" \n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -zoom 1\n                -animateTransition 0\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n"
		+ "                -graphType \"DAG\" \n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"multiListerPanel\" (localizedPanelLabel(\"Multilister\")) `;\n\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"multiListerPanel\" -l (localizedPanelLabel(\"Multilister\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Multilister\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"devicePanel\" (localizedPanelLabel(\"Devices\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n"
		+ "\t\t\tdevicePanel -unParent -l (localizedPanelLabel(\"Devices\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tdevicePanel -edit -l (localizedPanelLabel(\"Devices\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n"
		+ "\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"webBrowserPanel\" (localizedPanelLabel(\"Web Browser\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"webBrowserPanel\" -l (localizedPanelLabel(\"Web Browser\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Web Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"vacantCell.xpm\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Top View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Top View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -camera \\\"Arkane_camera\\\" \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 4096\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 0\\n    -nurbsSurfaces 0\\n    -polymeshes 1\\n    -subdivSurfaces 0\\n    -planes 0\\n    -lights 0\\n    -cameras 0\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 0\\n    -joints 0\\n    -ikHandles 0\\n    -deformers 0\\n    -dynamics 0\\n    -fluids 0\\n    -hairSystems 0\\n    -follicles 0\\n    -nCloths 0\\n    -nRigids 0\\n    -dynamicConstraints 0\\n    -locators 0\\n    -manipulators 1\\n    -dimensions 0\\n    -handles 0\\n    -pivots 0\\n    -textures 0\\n    -strokes 0\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Top View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -camera \\\"Arkane_camera\\\" \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 4096\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 0\\n    -nurbsSurfaces 0\\n    -polymeshes 1\\n    -subdivSurfaces 0\\n    -planes 0\\n    -lights 0\\n    -cameras 0\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 0\\n    -joints 0\\n    -ikHandles 0\\n    -deformers 0\\n    -dynamics 0\\n    -fluids 0\\n    -hairSystems 0\\n    -follicles 0\\n    -nCloths 0\\n    -nRigids 0\\n    -dynamicConstraints 0\\n    -locators 0\\n    -manipulators 1\\n    -dimensions 0\\n    -handles 0\\n    -pivots 0\\n    -textures 0\\n    -strokes 0\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels yes -displayOrthographicLabels yes -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 1351 -ast 1 -aet 1380 ";
	setAttr ".st" 6;
createNode materialInfo -n "pasted__materialInfo1";
createNode shadingEngine -n "pasted__fluidShape1SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "pasted__materialInfo2";
createNode shadingEngine -n "pasted__fluidShape1SG1";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode displayLayer -n "Main_Layer";
	setAttr ".do" 1;
createNode displayLayer -n "SC_1_to_3_Layer";
	setAttr ".dt" 1;
	setAttr ".do" 2;
createNode displayLayer -n "SC_4_to_6_Layer";
	setAttr ".dt" 1;
	setAttr ".do" 3;
createNode displayLayer -n "SC_7_to_9_Layer";
	setAttr ".dt" 1;
	setAttr ".do" 4;
createNode skinCluster -n "skinCluster1";
	setAttr -s 40 ".wl";
	setAttr ".wl[0].w[3]"  1;
	setAttr ".wl[1].w[3]"  1;
	setAttr ".wl[2].w[3]"  1;
	setAttr ".wl[3].w[3]"  1;
	setAttr ".wl[4].w[5]"  1;
	setAttr ".wl[5].w[5]"  1;
	setAttr ".wl[6].w[5]"  1;
	setAttr ".wl[7].w[5]"  1;
	setAttr ".wl[8].w[7]"  1;
	setAttr ".wl[9].w[7]"  1;
	setAttr ".wl[10].w[7]"  1;
	setAttr ".wl[11].w[7]"  1;
	setAttr ".wl[12].w[9]"  1;
	setAttr ".wl[13].w[9]"  1;
	setAttr ".wl[14].w[9]"  1;
	setAttr ".wl[15].w[9]"  1;
	setAttr ".wl[16].w[11]"  1;
	setAttr ".wl[17].w[11]"  1;
	setAttr ".wl[18].w[11]"  1;
	setAttr ".wl[19].w[11]"  1;
	setAttr ".wl[20].w[13]"  1;
	setAttr ".wl[21].w[13]"  1;
	setAttr ".wl[22].w[13]"  1;
	setAttr ".wl[23].w[13]"  1;
	setAttr ".wl[24].w[15]"  1;
	setAttr ".wl[25].w[15]"  1;
	setAttr ".wl[26].w[15]"  1;
	setAttr ".wl[27].w[15]"  1;
	setAttr ".wl[28].w[17]"  1;
	setAttr ".wl[29].w[17]"  1;
	setAttr ".wl[30].w[17]"  1;
	setAttr ".wl[31].w[17]"  1;
	setAttr ".wl[32].w[19]"  1;
	setAttr ".wl[33].w[19]"  1;
	setAttr ".wl[34].w[19]"  1;
	setAttr ".wl[35].w[19]"  1;
	setAttr ".wl[36].w[1]"  1;
	setAttr ".wl[37].w[1]"  1;
	setAttr ".wl[38].w[1]"  1;
	setAttr ".wl[39].w[1]"  1;
	setAttr -s 20 ".pm";
	setAttr ".pm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".pm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".pm[2]" -type "matrix" -0.99999999850760712 0 -5.4633192746022929e-005 0
		 0 1 0 0 5.4633192746022929e-005 0 -0.99999999850760712 0 -0.047626254395386029 0 0.056881828440531329 1;
	setAttr ".pm[3]" -type "matrix" 1 0 -2.4492804702805349e-016 0 0 1 0 0 2.4492804702805349e-016 0 1 0
		 7.2552173764255352 0 -0.057278204221510746 1;
	setAttr ".pm[4]" -type "matrix" 0.6485254526252614 0 0.76119296981593298 0 0 1 0 0
		 -0.76119296981593298 0 0.6485254526252614 0 0 0 0 1;
	setAttr ".pm[5]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -4.5058720198825828 0 5.2886715402468703 1;
	setAttr ".pm[6]" -type "matrix" 0.75530106900918392 0 -0.65537797884395255 0 0 1 0 0
		 0.65537797884395255 0 0.75530106900918392 0 0 0 0 1;
	setAttr ".pm[7]" -type "matrix" 1.0000000000000002 0 0 0 0 1 0 0 0 0 1.0000000000000002 0
		 -4.9068182319280593 0 -4.2576672367407546 1;
	setAttr ".pm[8]" -type "matrix" -0.57070886984945168 0 -0.82115247419414217 0 0 1 0 0
		 0.82115247419414217 0 -0.57070886984945168 0 0 0 0 1;
	setAttr ".pm[9]" -type "matrix" 1 0 1.1102230246251565e-016 0 0 1 0 0 -1.1102230246251565e-016 0 1 0
		 2.9854601678187263 0 -4.2955666766824523 1;
	setAttr ".pm[10]" -type "matrix" -0.57010502584494072 0 0.82157182248805216 0 0 1 0 0
		 -0.82157182248805216 0 -0.57010502584494072 0 0 0 0 1;
	setAttr ".pm[11]" -type "matrix" 0.99999999999999978 0 -3.8857805861880459e-016 0
		 0 1 0 0 3.8857805861880459e-016 0 0.99999999999999978 0 3.8357611470971333 0 5.5276714524291224 1;
	setAttr ".pm[12]" -type "matrix" 0.99502430976006984 0 0.099632439428614772 0 0 1 0 0
		 -0.099632439428614772 0 0.99502430976006984 0 0 0 0 1;
	setAttr ".pm[13]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -6.7473451313022865 0 0.67561611159082535 1;
	setAttr ".pm[14]" -type "matrix" 0.85297157268052737 0 0.52195737009731735 0 0 1 0 0
		 -0.52195737009731735 0 0.85297157268052737 0 0 0 0 1;
	setAttr ".pm[15]" -type "matrix" 1 0 -3.8857805861880479e-016 0 0 1 0 0 3.8857805861880479e-016 0 1 0
		 -6.993463869280645 0 4.2794978472834977 1;
	setAttr ".pm[16]" -type "matrix" 0.29338724339237565 0 0.95599368481942548 0 0 1 0 0
		 -0.95599368481942548 0 0.29338724339237565 0 0 0 0 1;
	setAttr ".pm[17]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -2.1765682870791014 0 7.0922836077198355 1;
	setAttr ".pm[18]" -type "matrix" -0.92043752146117752 0 0.39088971473601658 0 0 1 0 0
		 -0.39088971473601658 0 -0.92043752146117752 0 0 0 0 1;
	setAttr ".pm[19]" -type "matrix" 1 0 -2.2204460492503131e-016 0 0 1 0 0 2.2204460492503131e-016 0 1 0
		 6.8067661418544327 0 2.8906849334438807 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 20 ".ma";
	setAttr -s 20 ".dpf[0:19]"  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4;
	setAttr -s 20 ".lw";
	setAttr -s 20 ".lw";
	setAttr ".mmi" yes;
	setAttr ".mi" 4;
	setAttr ".ptw" -type "doubleArray" 40 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 0 1 1 1 1 0 0 0 0 ;
	setAttr ".ucm" yes;
createNode groupId -n "groupId1";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts1";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "f[0:9]";
createNode tweak -n "tweak1";
	setAttr -s 29 ".vl[0].vt";
	setAttr ".vl[0].vt[12:39]" -type "float3" 0 0.15527296 0  0 0.15527296 0  
		0 0.15527296 0  0 0.15527296 0  0 0 0  0 0 0  0 0 0  0 0 0  0 0 0  0 0 0  0 0 0  
		0 0 0  0 0 0  0 0 0  0 0 0  0 0 0  0 0 0  0 0 0  0 0 0  0 0 0  0 0 0  0 0 0  0 0 
		0  0 0 0  0 0 0  0 0 0  0 0 0  0 0 0 ;
createNode objectSet -n "skinCluster1Set";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster1GroupId";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster1GroupParts";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet1";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId3";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts3";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode dagPose -n "bindPose1";
	setAttr -s 20 ".wm";
	setAttr -s 20 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 -0.047623146688412013
		 0 0.056884430329977448 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0.99999999962690178 0 -2.7316596383203239e-005 1
		 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 0 0 0 0 7.2075942404936848 0 -6.1555066599439101e-012 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0.99999999962690178 0 2.7316596383325703e-005 1
		 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0.41921029768765139 0 0.90788915970653083 1 1 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 1 1 1 0 0 0 0 6.9478722872673728 0 4.4408920985006262e-016 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 -0.41921029768765139 0 0.90788915970653083 1
		 1 1 yes;
	setAttr ".xm[6]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 -0.34978488460110468 0 0.9368300456884332 1 1 1 yes;
	setAttr ".xm[7]" -type "matrix" "xform" 1 1 1 0 0 0 0 6.4965064042142879 0 8.8817841970012523e-016 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0.34978488460110468 0 0.9368300456884332 1
		 1 1 yes;
	setAttr ".xm[8]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0.88620225396053121 0 -0.46329857012004061 1 1 1 yes;
	setAttr ".xm[9]" -type "matrix" "xform" 1 1 1 0 0 0 0 5.2311438029800836 0 -1.3322676295501878e-015 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0.88620225396053121 0 0.46329857012004055 1
		 1 1 yes;
	setAttr ".xm[10]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0.8860318915944676 0 0.46362429517609366 1 1 1 yes;
	setAttr ".xm[11]" -type "matrix" "xform" 1 1 1 0 0 0 0 6.7281658171882057 0
		 -3.9968028886505635e-015 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0.8860318915944676 0 -0.46362429517609355 1
		 1 1 yes;
	setAttr ".xm[12]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0.049878303098291971 0 0.99875530280446312 1 1 1 yes;
	setAttr ".xm[13]" -type "matrix" "xform" 1 1 1 0 0 0 0 6.7810857133020948 0
		 -9.4368957093138306e-015 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 -0.049878303098291971 0 0.99875530280446312 1
		 1 1 yes;
	setAttr ".xm[14]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0.27113504690418816 0 0.96254131669256859 1 1 1 yes;
	setAttr ".xm[15]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.1989413167699823 0
		 1.3322676295501878e-015 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 -0.27113504690418838 0 0.96254131669256859 1
		 1 1 yes;
	setAttr ".xm[16]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0.59439580946017123 0 0.80417263177516052 1 1 1 yes;
	setAttr ".xm[17]" -type "matrix" "xform" 1 1 1 0 0 0 0 7.4187557097298962 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 -0.59439580946017123 0 0.80417263177516052 1
		 1 1 yes;
	setAttr ".xm[18]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0.97990752662207303 0 0.19945234836775236 1 1 1 yes;
	setAttr ".xm[19]" -type "matrix" "xform" 1 1 1 0 0 0 0 7.3951419657999349 0
		 4.4408920985006262e-016 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0.97990752662207303 0 -0.19945234836775225 1
		 1 1 yes;
	setAttr -s 20 ".m";
	setAttr -s 20 ".p";
	setAttr ".bp" yes;
createNode animCurveTL -n "Arkane_camera_translateX";
	setAttr ".tan" 16;
	setAttr ".wgt" no;
	setAttr -s 4 ".ktv[0:3]"  1 5.5138685559272389 1.36 5.5010817066465325 
		73 5.4298643845837873 1343 0;
createNode animCurveTL -n "Arkane_camera_translateY";
	setAttr ".tan" 16;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 -7.0122630571301254 73 -7.0409534685427984 
		1343 0;
createNode animCurveTL -n "Arkane_camera_translateZ";
	setAttr ".tan" 16;
	setAttr ".wgt" no;
	setAttr -s 3 ".ktv[0:2]"  1 5.1855950370227673 73 5.1276241961880942 
		1343 30;
createNode makeNurbCircle -n "makeNurbCircle1";
	setAttr ".nr" -type "double3" 0 1 0 ;
	setAttr ".r" 5.8309518948452999;
createNode transformGeometry -n "transformGeometry1";
	setAttr ".txf" -type "matrix" 0.43574157378061507 0 0 0 0 9.6754065599528053e-017 -0.43574157378061507 0
		 0 0.43574157378061507 9.6754065599528053e-017 0 5.0889416685555062 1.2114199030461839 2.6898925377020963e-016 1;
createNode transformGeometry -n "transformGeometry2";
	setAttr ".txf" -type "matrix" 1 0 0 0 0 1 2.659766265740885e-032 0 0 0 1 0 -0.37228293548612901 -0.088621758115055904 -1.9677983268419276e-017 1;
createNode transformGeometry -n "transformGeometry3";
	setAttr ".txf" -type "matrix" 1.0789293770346333 0 0 0 0 1.0789293770346333 0 0
		 0 0 1.0789293770346333 0 -0.58306964867292344 -6.5000914432930541 -1.4433102365025827e-015 1;
createNode expression -n "expression1";
	setAttr -k on ".nds";
	setAttr ".ixp" -type "string" ".O[0] = .I[0]";
createNode unitConversion -n "unitConversion1";
	setAttr ".cf" 0.017453292519943295;
createNode expression -n "expression2";
	setAttr -k on ".nds";
	setAttr ".ixp" -type "string" ".O[0] = .I[0]";
createNode unitConversion -n "unitConversion2";
	setAttr ".cf" 0.017453292519943295;
createNode expression -n "expression3";
	setAttr -k on ".nds";
	setAttr ".ixp" -type "string" ".O[0] = .I[0]";
createNode unitConversion -n "unitConversion3";
	setAttr ".cf" 0.017453292519943295;
createNode expression -n "expression4";
	setAttr -k on ".nds";
	setAttr ".ixp" -type "string" ".O[0] = .I[0]";
createNode unitConversion -n "unitConversion4";
	setAttr ".cf" 0.017453292519943295;
createNode expression -n "expression5";
	setAttr -k on ".nds";
	setAttr ".ixp" -type "string" ".O[0] = .I[0]";
createNode unitConversion -n "unitConversion5";
	setAttr ".cf" 0.017453292519943295;
createNode expression -n "expression6";
	setAttr -k on ".nds";
	setAttr ".ixp" -type "string" ".O[0] = .I[0]";
createNode unitConversion -n "unitConversion6";
	setAttr ".cf" 0.017453292519943295;
createNode expression -n "expression7";
	setAttr -k on ".nds";
	setAttr ".ixp" -type "string" ".O[0] = .I[0]";
createNode unitConversion -n "unitConversion7";
	setAttr ".cf" 0.017453292519943295;
createNode expression -n "expression8";
	setAttr -k on ".nds";
	setAttr ".ixp" -type "string" ".O[0] = .I[0]";
createNode unitConversion -n "unitConversion8";
	setAttr ".cf" 0.017453292519943295;
createNode expression -n "expression9";
	setAttr -k on ".nds";
	setAttr ".ixp" -type "string" ".O[0] = .I[0]";
createNode unitConversion -n "unitConversion9";
	setAttr ".cf" 0.017453292519943295;
createNode script -n "MoveLister";
	addAttr -ci true -sn "totalMoves" -ln "totalMoves" -at "long";
	addAttr -ci true -sn "move0Name" -ln "move0Name" -dt "string";
	addAttr -ci true -sn "move0Min" -ln "move0Min" -at "long";
	addAttr -ci true -sn "move0Max" -ln "move0Max" -at "long";
	addAttr -ci true -sn "move0Chk" -ln "move0Chk" -min 0 -max 1 -at "bool";
	setAttr ".totalMoves" 1;
	setAttr ".move0Name" -type "string" "Title";
	setAttr ".move0Min" 1;
	setAttr ".move0Max" 300;
	setAttr ".move0Chk" yes;
createNode animCurveTU -n "Arcane_Title_Skeleton_visibility";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1339 1;
createNode animCurveTL -n "Arcane_Title_Skeleton_translateX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1339 0;
createNode animCurveTL -n "Arcane_Title_Skeleton_translateY";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1339 0;
createNode animCurveTL -n "Arcane_Title_Skeleton_translateZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1339 0;
createNode animCurveTA -n "Arcane_Title_Skeleton_rotateY";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1339 0;
createNode animCurveTA -n "Arcane_Title_Skeleton_rotateZ";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  32 -141.94544622116362 1339 0;
	setAttr -s 2 ".kit[1]"  1;
	setAttr -s 2 ".kot[1]"  1;
	setAttr -s 2 ".kix[1]"  44.348358154296875;
	setAttr -s 2 ".kiy[1]"  -0.00062428746605291963;
	setAttr -s 2 ".kox[1]"  44.348358154296875;
	setAttr -s 2 ".koy[1]"  -0.00062437116866931319;
createNode animCurveTU -n "Arcane_Title_Skeleton_scaleX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1339 1;
createNode animCurveTU -n "Arcane_Title_Skeleton_scaleY";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1339 1;
createNode animCurveTU -n "Arcane_Title_Skeleton_scaleZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1339 1;
createNode animCurveTU -n "Main_Circle_visibility";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  576 1 601 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTL -n "Main_Circle_translateX";
	setAttr ".tan" 3;
	setAttr -s 2 ".ktv[0:1]"  576 0 601 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTL -n "Main_Circle_translateY";
	setAttr ".tan" 3;
	setAttr -s 2 ".ktv[0:1]"  576 0 601 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTL -n "Main_Circle_translateZ";
	setAttr ".tan" 3;
	setAttr -s 2 ".ktv[0:1]"  576 0 601 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTA -n "Main_Circle_rotateX";
	setAttr ".tan" 3;
	setAttr -s 2 ".ktv[0:1]"  576 0 601 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode pairBlend -n "pairBlend2";
	setAttr ".txm" 2;
	setAttr ".tym" 2;
	setAttr ".tzm" 2;
createNode animCurveTA -n "pairBlend2_inRotateY1";
	setAttr ".tan" 3;
	setAttr -s 2 ".ktv[0:1]"  576 0 601 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTA -n "Main_Circle_rotateZ";
	setAttr ".tan" 3;
	setAttr -s 2 ".ktv[0:1]"  576 0 601 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTU -n "Main_Circle_scaleX";
	setAttr ".tan" 3;
	setAttr -s 2 ".ktv[0:1]"  576 1 601 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTU -n "Main_Circle_scaleY";
	setAttr ".tan" 3;
	setAttr -s 2 ".ktv[0:1]"  576 1 601 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTU -n "Main_Circle_scaleZ";
	setAttr ".tan" 3;
	setAttr -s 2 ".ktv[0:1]"  576 1 601 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTU -n "Main_Circle_orientConstraint1_nodeState";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  576 0 601 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTA -n "Main_Circle_orientConstraint1_offsetX";
	setAttr ".tan" 3;
	setAttr -s 2 ".ktv[0:1]"  576 0 601 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTA -n "Main_Circle_orientConstraint1_offsetY";
	setAttr ".tan" 3;
	setAttr -s 2 ".ktv[0:1]"  576 0 601 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTA -n "Main_Circle_orientConstraint1_offsetZ";
	setAttr ".tan" 3;
	setAttr -s 2 ".ktv[0:1]"  576 0 601 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTU -n "Main_Circle_orientConstraint1_interpType";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  576 1 601 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTU -n "Main_Circle_orientConstraint1_main_controlW0";
	setAttr ".tan" 3;
	setAttr -s 2 ".ktv[0:1]"  576 1 601 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode pairBlend -n "pairBlend3";
	setAttr ".txm" 2;
	setAttr ".tym" 2;
	setAttr ".tzm" 2;
createNode animCurveTA -n "pairBlend3_inRotateY1";
	setAttr ".tan" 2;
	setAttr -s 3 ".ktv[0:2]"  67 -12.999912124375738 439 313.90461190369263 
		1343 379.11719964798175;
	setAttr -s 3 ".kit[2]"  1;
	setAttr -s 3 ".kot[2]"  1;
	setAttr -s 3 ".kix[2]"  20.415626525878906;
	setAttr -s 3 ".kiy[2]"  -0.12476971000432968;
	setAttr -s 3 ".kox[2]"  3.3557999134063721;
	setAttr -s 3 ".koy[2]"  -0.36772513389587402;
createNode animCurveTU -n "SC_1_Axis_visibility";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  466 1 1322 1;
	setAttr -s 2 ".kot[0:1]"  5 9;
createNode animCurveTL -n "SC_1_Axis_translateX";
	setAttr ".tan" 3;
	setAttr -s 3 ".ktv[0:2]"  159 8.9228790522270369 466 7.2075942404936848 
		1322 7.2075942404936848;
	setAttr -s 3 ".kit[2]"  9;
	setAttr -s 3 ".kot[0:2]"  5 5 9;
createNode animCurveTL -n "SC_1_Axis_translateY";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  466 0 1322 0;
	setAttr -s 2 ".kit[0:1]"  3 9;
	setAttr -s 2 ".kot[0:1]"  5 9;
createNode animCurveTL -n "SC_1_Axis_translateZ";
	setAttr ".tan" 3;
	setAttr -s 3 ".ktv[0:2]"  159 -0.020922148863749573 466 0 1322 0;
	setAttr -s 3 ".kit[2]"  9;
	setAttr -s 3 ".kot[0:2]"  5 5 9;
createNode animCurveTA -n "SC_1_Axis_rotateX";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  466 0 1322 0;
	setAttr -s 2 ".kit[0:1]"  3 9;
	setAttr -s 2 ".kot[0:1]"  5 9;
createNode pairBlend -n "pairBlend4";
	setAttr ".txm" 2;
	setAttr ".tym" 2;
	setAttr ".tzm" 2;
createNode animCurveTA -n "pairBlend4_inRotateY1";
	setAttr ".tan" 9;
	setAttr -s 3 ".ktv[0:2]"  5 529.12821974090832 522 962.86650504541251 
		1181 1199.8857497761969;
	setAttr -s 3 ".kit[2]"  1;
	setAttr -s 3 ".kot[2]"  1;
	setAttr -s 3 ".kix[2]"  48.376468658447266;
	setAttr -s 3 ".kiy[2]"  1.7570294141769409;
	setAttr -s 3 ".kox[2]"  48.376445770263672;
	setAttr -s 3 ".koy[2]"  1.7570279836654663;
createNode animCurveTA -n "SC_1_Axis_rotateZ";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  466 0 1322 0;
	setAttr -s 2 ".kit[0:1]"  3 9;
	setAttr -s 2 ".kot[0:1]"  5 9;
createNode animCurveTU -n "SC_1_Axis_scaleX";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  466 1 1322 1;
	setAttr -s 2 ".kit[0:1]"  3 9;
	setAttr -s 2 ".kot[0:1]"  5 9;
createNode animCurveTU -n "SC_1_Axis_scaleY";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  466 1 1322 1;
	setAttr -s 2 ".kit[0:1]"  3 9;
	setAttr -s 2 ".kot[0:1]"  5 9;
createNode animCurveTU -n "SC_1_Axis_scaleZ";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  466 1 1322 1;
	setAttr -s 2 ".kit[0:1]"  3 9;
	setAttr -s 2 ".kot[0:1]"  5 9;
createNode animCurveTU -n "SC_1_Axis_orientConstraint1_nodeState";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  313 0 601 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTA -n "SC_1_Axis_orientConstraint1_offsetX";
	setAttr ".tan" 3;
	setAttr -s 2 ".ktv[0:1]"  313 0 601 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTA -n "SC_1_Axis_orientConstraint1_offsetY";
	setAttr ".tan" 3;
	setAttr -s 2 ".ktv[0:1]"  313 0 601 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTA -n "SC_1_Axis_orientConstraint1_offsetZ";
	setAttr ".tan" 3;
	setAttr -s 2 ".ktv[0:1]"  313 0 601 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTU -n "SC_1_Axis_orientConstraint1_interpType";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  313 1 601 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTU -n "SC_1_Axis_orientConstraint1_circle_6W0";
	setAttr ".tan" 3;
	setAttr -s 2 ".ktv[0:1]"  313 1 601 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode pairBlend -n "pairBlend5";
	setAttr ".txm" 2;
	setAttr ".tym" 2;
	setAttr ".tzm" 2;
createNode animCurveTA -n "pairBlend5_inRotateY1";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  343 -208.52401322147568 1339 0;
	setAttr -s 2 ".kit[1]"  1;
	setAttr -s 2 ".kot[1]"  1;
	setAttr -s 2 ".kix[1]"  20.871189117431641;
	setAttr -s 2 ".kiy[1]"  -0.00061366899171844125;
	setAttr -s 2 ".kox[1]"  20.871194839477539;
	setAttr -s 2 ".koy[1]"  -0.00061443314189091325;
createNode animCurveTU -n "SC_2_Axis_visibility";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1338 1;
createNode animCurveTL -n "SC_2_Axis_translateY";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1338 0;
createNode animCurveTL -n "SC_2_Axis_translateZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1338 0;
createNode animCurveTA -n "SC_2_Axis_rotateX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1338 0;
createNode pairBlend -n "pairBlend6";
	setAttr ".txm" 2;
	setAttr ".tym" 2;
	setAttr ".tzm" 2;
createNode animCurveTA -n "pairBlend6_inRotateY1";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  440 197.43543624288415 1338 -454.72324244542722;
	setAttr -s 2 ".kit[1]"  1;
	setAttr -s 2 ".kot[1]"  1;
	setAttr -s 2 ".kix[1]"  51.123287200927734;
	setAttr -s 2 ".kiy[1]"  -1.9963480234146118;
	setAttr -s 2 ".kox[1]"  51.123291015625;
	setAttr -s 2 ".koy[1]"  -1.9963483810424805;
createNode animCurveTA -n "SC_2_Axis_rotateZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1338 0;
createNode animCurveTU -n "SC_2_Axis_scaleX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1338 1;
createNode animCurveTU -n "SC_2_Axis_scaleY";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1338 1;
createNode animCurveTU -n "SC_2_Axis_scaleZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1338 1;
createNode animCurveTU -n "SC_3_Orbit_visibility";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1336 1;
createNode animCurveTL -n "SC_3_Orbit_translateX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1336 0;
createNode animCurveTL -n "SC_3_Orbit_translateY";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1336 0;
createNode animCurveTL -n "SC_3_Orbit_translateZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1336 0;
createNode animCurveTA -n "SC_3_Orbit_rotateX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1336 0;
createNode pairBlend -n "pairBlend7";
	setAttr ".txm" 2;
	setAttr ".tym" 2;
	setAttr ".tzm" 2;
createNode animCurveTA -n "pairBlend7_inRotateY1";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  1 -246.48399633629796 1336 0;
	setAttr -s 2 ".kit[1]"  1;
	setAttr -s 2 ".kot[1]"  1;
	setAttr -s 2 ".kix[1]"  48.063766479492188;
	setAttr -s 2 ".kiy[1]"  0.093454368412494659;
	setAttr -s 2 ".kox[1]"  48.063758850097656;
	setAttr -s 2 ".koy[1]"  0.093453913927078247;
createNode animCurveTA -n "SC_3_Orbit_rotateZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1336 0;
createNode animCurveTU -n "SC_3_Orbit_scaleX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1336 1;
createNode animCurveTU -n "SC_3_Orbit_scaleY";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1336 1;
createNode animCurveTU -n "SC_3_Orbit_scaleZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1336 1;
createNode animCurveTU -n "SC_4_Orbit_visibility";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1336 1;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "SC_4_Orbit_translateX";
	setAttr ".tan" 2;
	setAttr -s 2 ".ktv[0:1]"  598 0 1336 0;
	setAttr -s 2 ".kit[1]"  3;
	setAttr -s 2 ".kot[1]"  5;
createNode animCurveTL -n "SC_4_Orbit_translateY";
	setAttr ".tan" 2;
	setAttr -s 2 ".ktv[0:1]"  598 0 1336 0;
	setAttr -s 2 ".kit[1]"  3;
	setAttr -s 2 ".kot[1]"  5;
createNode animCurveTL -n "SC_4_Orbit_translateZ";
	setAttr ".tan" 2;
	setAttr -s 2 ".ktv[0:1]"  598 0 1336 0;
	setAttr -s 2 ".kit[1]"  3;
	setAttr -s 2 ".kot[1]"  5;
createNode animCurveTA -n "SC_4_Orbit_rotateX";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  1336 0;
	setAttr ".kot[0]"  5;
createNode pairBlend -n "pairBlend8";
	setAttr ".txm" 2;
	setAttr ".tym" 2;
	setAttr ".tzm" 2;
createNode animCurveTA -n "pairBlend8_inRotateY1";
	setAttr ".tan" 2;
	setAttr -s 2 ".ktv[0:1]"  598 -165.67043574576772 1336 0.20570212974512422;
	setAttr -s 2 ".kit[1]"  3;
	setAttr -s 2 ".kot[1]"  5;
createNode animCurveTA -n "SC_4_Orbit_rotateZ";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  1336 0;
	setAttr ".kot[0]"  5;
createNode animCurveTU -n "SC_4_Orbit_scaleX";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  1336 1;
	setAttr ".kot[0]"  5;
createNode animCurveTU -n "SC_4_Orbit_scaleY";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  1336 1;
	setAttr ".kot[0]"  5;
createNode animCurveTU -n "SC_4_Orbit_scaleZ";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  1336 1;
	setAttr ".kot[0]"  5;
createNode pairBlend -n "pairBlend9";
	setAttr ".txm" 2;
	setAttr ".tym" 2;
	setAttr ".tzm" 2;
createNode animCurveTA -n "pairBlend9_inRotateY1";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  689 280.54317176533192 1327 51.881253228480539;
	setAttr -s 2 ".kit[1]"  1;
	setAttr -s 2 ".kot[1]"  1;
	setAttr -s 2 ".kix[1]"  23.001131057739258;
	setAttr -s 2 ".kiy[1]"  -0.84673351049423218;
	setAttr -s 2 ".kox[1]"  23.001138687133789;
	setAttr -s 2 ".koy[1]"  -0.84673446416854858;
createNode animCurveTU -n "SC_4_Axis_orientConstraint1_nodeState";
	setAttr ".tan" 9;
	setAttr -s 3 ".ktv[0:2]"  574 0 576 0 601 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTA -n "SC_4_Axis_orientConstraint1_offsetX";
	setAttr ".tan" 3;
	setAttr -s 3 ".ktv[0:2]"  574 0 576 0 601 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTA -n "SC_4_Axis_orientConstraint1_offsetY";
	setAttr ".tan" 3;
	setAttr -s 3 ".ktv[0:2]"  574 0 576 0 601 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTA -n "SC_4_Axis_orientConstraint1_offsetZ";
	setAttr ".tan" 3;
	setAttr -s 3 ".ktv[0:2]"  574 0 576 0 601 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTU -n "SC_4_Axis_orientConstraint1_interpType";
	setAttr ".tan" 9;
	setAttr -s 3 ".ktv[0:2]"  574 1 576 1 601 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTU -n "SC_4_Axis_orientConstraint1_circle_5W0";
	setAttr ".tan" 3;
	setAttr -s 3 ".ktv[0:2]"  574 1 576 1 601 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTU -n "SC_5_Orbit_visibility";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1317 1;
createNode animCurveTL -n "SC_5_Orbit_translateX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1317 0;
createNode animCurveTL -n "SC_5_Orbit_translateY";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1317 0;
createNode animCurveTL -n "SC_5_Orbit_translateZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1317 0;
createNode animCurveTA -n "SC_5_Orbit_rotateX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1317 0;
createNode pairBlend -n "pairBlend10";
	setAttr ".txm" 2;
	setAttr ".tym" 2;
	setAttr ".tzm" 2;
createNode animCurveTA -n "pairBlend10_inRotateY1";
	setAttr ".tan" 9;
	setAttr -s 5 ".ktv[0:4]"  16 -257.9499591426549 99 -181.04092038686306 
		100 -279.33177700631211 283 -297.02537392880993 1317 0;
	setAttr -s 5 ".kit[2:4]"  3 9 1;
	setAttr -s 5 ".kot[2:4]"  5 9 1;
	setAttr -s 5 ".ktl[4]" no;
	setAttr -s 5 ".kwl[4]" no;
	setAttr -s 5 ".kix[4]"  57.071563720703125;
	setAttr -s 5 ".kiy[4]"  0.60485982894897461;
	setAttr -s 5 ".kox[4]"  68.72064208984375;
	setAttr -s 5 ".koy[4]"  1.339260458946228;
createNode animCurveTA -n "SC_5_Orbit_rotateZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1317 0;
createNode animCurveTU -n "SC_5_Orbit_scaleX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1317 1;
createNode animCurveTU -n "SC_5_Orbit_scaleY";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1317 1;
createNode animCurveTU -n "SC_5_Orbit_scaleZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1317 1;
createNode animCurveTU -n "SC_5_Axis_visibility";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1351 1;
createNode animCurveTL -n "SC_5_Axis_translateX";
	setAttr ".tan" 2;
	setAttr -s 2 ".ktv[0:1]"  9 8.842309672192723 1351 6.7281658171882057;
	setAttr -s 2 ".kit[1]"  9;
	setAttr -s 2 ".kot[1]"  9;
createNode animCurveTL -n "SC_5_Axis_translateY";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1351 0;
createNode animCurveTL -n "SC_5_Axis_translateZ";
	setAttr ".tan" 2;
	setAttr -s 2 ".ktv[0:1]"  9 -1.4271272117392839 1351 0;
	setAttr -s 2 ".kit[1]"  9;
	setAttr -s 2 ".kot[1]"  9;
createNode animCurveTA -n "SC_5_Axis_rotateX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1351 0;
createNode pairBlend -n "pairBlend11";
	setAttr ".txm" 2;
	setAttr ".tym" 2;
	setAttr ".tzm" 2;
createNode animCurveTA -n "pairBlend11_inRotateY1";
	setAttr ".tan" 1;
	setAttr -s 2 ".ktv[0:1]"  8 -1230.4404138726143 1351 36.762391644010755;
	setAttr -s 2 ".kix[0:1]"  16.792423248291016 52.568916320800781;
	setAttr -s 2 ".kiy[0:1]"  52.669033050537109 -0.99079269170761108;
	setAttr -s 2 ".kox[0:1]"  16.792415618896484 52.568943023681641;
	setAttr -s 2 ".koy[0:1]"  52.668998718261719 -0.99079841375350952;
createNode animCurveTA -n "SC_5_Axis_rotateZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1351 0;
createNode animCurveTU -n "SC_5_Axis_scaleX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1351 1;
createNode animCurveTU -n "SC_5_Axis_scaleY";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1351 1;
createNode animCurveTU -n "SC_5_Axis_scaleZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1351 1;
createNode pairBlend -n "pairBlend12";
	setAttr ".txm" 2;
	setAttr ".tym" 2;
	setAttr ".tzm" 2;
createNode animCurveTA -n "pairBlend12_inRotateY1";
	setAttr ".tan" 9;
	setAttr -s 3 ".ktv[0:2]"  228 -493.0427076484342 524 -302.55139380883486 
		1336 -79.93428365311317;
	setAttr -s 3 ".kit[2]"  1;
	setAttr -s 3 ".kot[2]"  1;
	setAttr -s 3 ".kix[2]"  49.988208770751953;
	setAttr -s 3 ".kiy[2]"  0.56808364391326904;
	setAttr -s 3 ".kox[2]"  49.988204956054688;
	setAttr -s 3 ".koy[2]"  0.56808030605316162;
createNode animCurveTU -n "SC_6_Axis_visibility";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1313 1;
createNode animCurveTL -n "SC_6_Axis_translateX";
	setAttr ".tan" 2;
	setAttr -s 2 ".ktv[0:1]"  228 8.2739220918895935 1313 6.7810857133020948;
	setAttr -s 2 ".kit[1]"  9;
	setAttr -s 2 ".kot[1]"  9;
createNode animCurveTL -n "SC_6_Axis_translateY";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1313 0;
createNode animCurveTL -n "SC_6_Axis_translateZ";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  228 0.29949881703665382 1313 0;
createNode animCurveTA -n "SC_6_Axis_rotateX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1313 0;
createNode pairBlend -n "pairBlend13";
	setAttr ".txm" 2;
	setAttr ".tym" 2;
	setAttr ".tzm" 2;
createNode animCurveTA -n "pairBlend13_inRotateY1";
	setAttr ".tan" 9;
	setAttr -s 3 ".ktv[0:2]"  229 1317.9714767338462 705 728.30944590106901 
		1313 -123.76131678356461;
	setAttr -s 3 ".kit[2]"  1;
	setAttr -s 3 ".kot[2]"  1;
	setAttr -s 3 ".kix[2]"  54.659404754638672;
	setAttr -s 3 ".kiy[2]"  -2.3790018558502197;
	setAttr -s 3 ".kox[2]"  54.659397125244141;
	setAttr -s 3 ".koy[2]"  -2.3789973258972168;
createNode animCurveTA -n "SC_6_Axis_rotateZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1313 0;
createNode animCurveTU -n "SC_6_Axis_scaleX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1313 1;
createNode animCurveTU -n "SC_6_Axis_scaleY";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1313 1;
createNode animCurveTU -n "SC_6_Axis_scaleZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1313 1;
createNode animCurveTU -n "SC_6_Axis_orientConstraint1_nodeState";
	setAttr ".tan" 9;
	setAttr -s 3 ".ktv[0:2]"  567 0 576 0 601 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTA -n "SC_6_Axis_orientConstraint1_offsetX";
	setAttr ".tan" 3;
	setAttr -s 3 ".ktv[0:2]"  567 0 576 0 601 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTA -n "SC_6_Axis_orientConstraint1_offsetY";
	setAttr ".tan" 3;
	setAttr -s 3 ".ktv[0:2]"  567 0 576 0 601 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTA -n "SC_6_Axis_orientConstraint1_offsetZ";
	setAttr ".tan" 3;
	setAttr -s 3 ".ktv[0:2]"  567 0 576 0 601 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTU -n "SC_6_Axis_orientConstraint1_interpType";
	setAttr ".tan" 9;
	setAttr -s 3 ".ktv[0:2]"  567 1 576 1 601 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTU -n "SC_6_Axis_orientConstraint1_circle_3W0";
	setAttr ".tan" 3;
	setAttr -s 3 ".ktv[0:2]"  567 1 576 1 601 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTU -n "SC_7_Orbit_visibility";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1336 1;
createNode animCurveTL -n "SC_7_Orbit_translateX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1336 0;
createNode animCurveTL -n "SC_7_Orbit_translateY";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1336 0;
createNode animCurveTL -n "SC_7_Orbit_translateZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1336 0;
createNode animCurveTA -n "SC_7_Orbit_rotateX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1336 0;
createNode pairBlend -n "pairBlend14";
	setAttr ".txm" 2;
	setAttr ".tym" 2;
	setAttr ".tzm" 2;
createNode animCurveTA -n "pairBlend14_inRotateY1";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  1 -268.12610303825079 1336 0;
	setAttr -s 2 ".kit[1]"  1;
	setAttr -s 2 ".kot[1]"  1;
	setAttr -s 2 ".kix[1]"  23.731315612792969;
	setAttr -s 2 ".kiy[1]"  -0.2840735912322998;
	setAttr -s 2 ".kox[1]"  23.731313705444336;
	setAttr -s 2 ".koy[1]"  -0.28406780958175659;
createNode animCurveTA -n "SC_7_Orbit_rotateZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1336 0;
createNode animCurveTU -n "SC_7_Orbit_scaleX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1336 1;
createNode animCurveTU -n "SC_7_Orbit_scaleY";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1336 1;
createNode animCurveTU -n "SC_7_Orbit_scaleZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1336 1;
createNode animCurveTU -n "SC_7_Axis_visibility";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1316 1;
createNode animCurveTL -n "SC_7_Axis_translateX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1316 8.1989413167699823;
createNode animCurveTL -n "SC_7_Axis_translateY";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1316 0;
createNode animCurveTL -n "SC_7_Axis_translateZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1316 0;
createNode animCurveTA -n "SC_7_Axis_rotateX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1316 0;
createNode pairBlend -n "pairBlend15";
	setAttr ".txm" 2;
	setAttr ".tym" 2;
	setAttr ".tzm" 2;
createNode animCurveTA -n "pairBlend15_inRotateY1";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  504 206.13084311945107 1316 -149.11597842460432;
	setAttr -s 2 ".kit[1]"  1;
	setAttr -s 2 ".kot[1]"  1;
	setAttr -s 2 ".kix[1]"  45.726909637451172;
	setAttr -s 2 ".kiy[1]"  -2.0749292373657227;
	setAttr -s 2 ".kox[1]"  45.726913452148438;
	setAttr -s 2 ".koy[1]"  -2.0749292373657227;
createNode animCurveTA -n "SC_7_Axis_rotateZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1316 0;
createNode animCurveTU -n "SC_7_Axis_scaleX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1316 1;
createNode animCurveTU -n "SC_7_Axis_scaleY";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1316 1;
createNode animCurveTU -n "SC_7_Axis_scaleZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1316 1;
createNode animCurveTU -n "SC_7_Axis_orientConstraint1_nodeState";
	setAttr ".tan" 9;
	setAttr -s 3 ".ktv[0:2]"  576 0 579 0 601 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTA -n "SC_7_Axis_orientConstraint1_offsetX";
	setAttr ".tan" 3;
	setAttr -s 3 ".ktv[0:2]"  576 0 579 0 601 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTA -n "SC_7_Axis_orientConstraint1_offsetY";
	setAttr ".tan" 3;
	setAttr -s 3 ".ktv[0:2]"  576 0 579 0 601 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTA -n "SC_7_Axis_orientConstraint1_offsetZ";
	setAttr ".tan" 3;
	setAttr -s 3 ".ktv[0:2]"  576 0 579 0 601 0;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTU -n "SC_7_Axis_orientConstraint1_interpType";
	setAttr ".tan" 9;
	setAttr -s 3 ".ktv[0:2]"  576 1 579 1 601 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode animCurveTU -n "SC_7_Axis_orientConstraint1_circle_9W0";
	setAttr ".tan" 3;
	setAttr -s 3 ".ktv[0:2]"  576 1 579 1 601 1;
	setAttr -s 3 ".kot[0:2]"  5 5 5;
createNode pairBlend -n "pairBlend16";
	setAttr ".txm" 2;
	setAttr ".tym" 2;
	setAttr ".tzm" 2;
createNode animCurveTA -n "pairBlend16_inRotateY1";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  1 -262.52934864887754 1339 13.599588128295952;
	setAttr -s 2 ".kit[1]"  1;
	setAttr -s 2 ".kot[1]"  1;
	setAttr -s 2 ".kix[1]"  30.292348861694336;
	setAttr -s 2 ".kiy[1]"  -0.11090227216482162;
	setAttr -s 2 ".kox[1]"  30.29234504699707;
	setAttr -s 2 ".koy[1]"  -0.11090267449617386;
createNode animCurveTU -n "SC_8_Axis_visibility";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1332 1;
createNode animCurveTL -n "SC_8_Axis_translateX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1332 7.4187557097298962;
createNode animCurveTL -n "SC_8_Axis_translateY";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1332 0;
createNode animCurveTL -n "SC_8_Axis_translateZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1332 0;
createNode animCurveTA -n "SC_8_Axis_rotateX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1332 0;
createNode pairBlend -n "pairBlend17";
	setAttr ".txm" 2;
	setAttr ".tym" 2;
	setAttr ".tzm" 2;
createNode animCurveTA -n "pairBlend17_inRotateY1";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  303 161.9129219207106 1332 -338.48115097317611;
	setAttr -s 2 ".kit[1]"  1;
	setAttr -s 2 ".kot[1]"  1;
	setAttr -s 2 ".kix[1]"  48.398937225341797;
	setAttr -s 2 ".kiy[1]"  -1.1593207120895386;
	setAttr -s 2 ".kox[1]"  48.398918151855469;
	setAttr -s 2 ".koy[1]"  -1.1593201160430908;
createNode animCurveTA -n "SC_8_Axis_rotateZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1332 0;
createNode animCurveTU -n "SC_8_Axis_scaleX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1332 1;
createNode animCurveTU -n "SC_8_Axis_scaleY";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1332 1;
createNode animCurveTU -n "SC_8_Axis_scaleZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1332 1;
createNode animCurveTU -n "SC_8_Axis_orientConstraint1_nodeState";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  507 0;
	setAttr ".kot[0]"  5;
createNode animCurveTA -n "SC_8_Axis_orientConstraint1_offsetX";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  507 0;
	setAttr ".kot[0]"  5;
createNode animCurveTA -n "SC_8_Axis_orientConstraint1_offsetY";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  507 0;
	setAttr ".kot[0]"  5;
createNode animCurveTA -n "SC_8_Axis_orientConstraint1_offsetZ";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  507 0;
	setAttr ".kot[0]"  5;
createNode animCurveTU -n "SC_8_Axis_orientConstraint1_interpType";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  507 1;
	setAttr ".kot[0]"  5;
createNode animCurveTU -n "SC_8_Axis_orientConstraint1_circle_8W0";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  507 1;
	setAttr ".kot[0]"  5;
createNode pairBlend -n "pairBlend18";
	setAttr ".txm" 2;
	setAttr ".tym" 2;
	setAttr ".tzm" 2;
createNode animCurveTA -n "pairBlend18_inRotateY1";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  28 -352.55273213059746 1335 0;
	setAttr -s 2 ".kit[1]"  1;
	setAttr -s 2 ".kot[1]"  1;
	setAttr -s 2 ".kix[1]"  82.62091064453125;
	setAttr -s 2 ".kiy[1]"  2.7946310043334961;
	setAttr -s 2 ".kox[1]"  82.620918273925781;
	setAttr -s 2 ".koy[1]"  2.7946510314941406;
createNode animCurveTU -n "SC_9_Axis_visibility";
	setAttr ".tan" 2;
	setAttr ".ktv[0]"  1331 1;
createNode animCurveTL -n "SC_9_Axis_translateX";
	setAttr ".tan" 2;
	setAttr ".ktv[0]"  1331 7.3951419657999349;
createNode animCurveTL -n "SC_9_Axis_translateY";
	setAttr ".tan" 2;
	setAttr ".ktv[0]"  1331 0;
createNode animCurveTL -n "SC_9_Axis_translateZ";
	setAttr ".tan" 2;
	setAttr ".ktv[0]"  1331 0;
createNode animCurveTA -n "SC_9_Axis_rotateX";
	setAttr ".tan" 2;
	setAttr ".ktv[0]"  1331 0;
createNode pairBlend -n "pairBlend19";
	setAttr ".txm" 2;
	setAttr ".tym" 2;
	setAttr ".tzm" 2;
createNode animCurveTA -n "pairBlend19_inRotateY1";
	setAttr ".tan" 1;
	setAttr -s 2 ".ktv[0:1]"  309 895.16564285762422 1331 250.11607693165223;
	setAttr -s 2 ".ktl[0:1]" no yes;
	setAttr -s 2 ".kwl[0:1]" no yes;
	setAttr -s 2 ".kix[0:1]"  0.0050007863901555538 50.332000732421875;
	setAttr -s 2 ".kiy[0:1]"  -0.0031128881964832544 -1.5612732172012329;
	setAttr -s 2 ".kox[0:1]"  23.431728363037109 8.0994424819946289;
	setAttr -s 2 ".koy[0:1]"  -26.775411605834961 1.8342964649200439;
createNode animCurveTA -n "SC_9_Axis_rotateZ";
	setAttr ".tan" 2;
	setAttr ".ktv[0]"  1331 0;
createNode animCurveTU -n "SC_9_Axis_scaleX";
	setAttr ".tan" 2;
	setAttr ".ktv[0]"  1331 1;
createNode animCurveTU -n "SC_9_Axis_scaleY";
	setAttr ".tan" 2;
	setAttr ".ktv[0]"  1331 1;
createNode animCurveTU -n "SC_9_Axis_scaleZ";
	setAttr ".tan" 2;
	setAttr ".ktv[0]"  1331 1;
createNode animCurveTU -n "camera_joint_visibility";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  601 1;
	setAttr ".kot[0]"  5;
createNode pairBlend -n "pairBlend20";
	setAttr ".rm" 2;
createNode animCurveTL -n "pairBlend20_inTranslateX1";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  601 0;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "pairBlend20_inTranslateY1";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  601 -30;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "pairBlend20_inTranslateZ1";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  601 6.6613381477509392e-015;
	setAttr ".kot[0]"  5;
createNode pairBlend -n "pairBlend21";
	setAttr ".txm" 2;
	setAttr ".tym" 2;
	setAttr ".tzm" 2;
createNode animCurveTA -n "pairBlend21_inRotateX1";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  601 0;
	setAttr ".kot[0]"  5;
createNode animCurveTA -n "camera_joint_rotateY";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  601 0;
	setAttr ".kot[0]"  5;
createNode animCurveTA -n "pairBlend21_inRotateZ1";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  601 0;
	setAttr ".kot[0]"  5;
createNode animCurveTU -n "camera_joint_scaleX";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  601 1;
	setAttr ".kot[0]"  5;
createNode animCurveTU -n "camera_joint_scaleY";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  601 1;
	setAttr ".kot[0]"  5;
createNode animCurveTU -n "camera_joint_scaleZ";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  601 1;
	setAttr ".kot[0]"  5;
createNode animCurveTU -n "camera_joint_pointConstraint1_nodeState";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  576 0 601 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTL -n "camera_joint_pointConstraint1_offsetX";
	setAttr ".tan" 3;
	setAttr -s 2 ".ktv[0:1]"  576 0 601 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTL -n "camera_joint_pointConstraint1_offsetY";
	setAttr ".tan" 3;
	setAttr -s 2 ".ktv[0:1]"  576 0 601 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTL -n "camera_joint_pointConstraint1_offsetZ";
	setAttr ".tan" 3;
	setAttr -s 2 ".ktv[0:1]"  576 0 601 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTU -n "camera_joint_pointConstraint1_camera1W0";
	setAttr ".tan" 3;
	setAttr -s 2 ".ktv[0:1]"  576 1 601 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTU -n "camera_joint_orientConstraint1_nodeState";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  576 0 601 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTA -n "camera_joint_orientConstraint1_offsetX";
	setAttr ".tan" 3;
	setAttr -s 2 ".ktv[0:1]"  576 0 601 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTA -n "camera_joint_orientConstraint1_offsetY";
	setAttr ".tan" 3;
	setAttr -s 2 ".ktv[0:1]"  576 0 601 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTA -n "camera_joint_orientConstraint1_offsetZ";
	setAttr ".tan" 3;
	setAttr -s 2 ".ktv[0:1]"  576 0 601 0;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTU -n "camera_joint_orientConstraint1_interpType";
	setAttr ".tan" 9;
	setAttr -s 2 ".ktv[0:1]"  576 1 601 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTU -n "camera_joint_orientConstraint1_camera1W0";
	setAttr ".tan" 3;
	setAttr -s 2 ".ktv[0:1]"  576 1 601 1;
	setAttr -s 2 ".kot[0:1]"  5 5;
createNode animCurveTA -n "Arkane_camera_rotateZ";
	setAttr ".tan" 16;
	setAttr ".ktv[0]"  73 0;
createNode animCurveTU -n "Arkane_camera_Orbit";
	setAttr ".tan" 16;
	setAttr ".ktv[0]"  73 0;
createNode animCurveTU -n "SC_4_Orbit_blendUnitConversion9";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  1336 0;
	setAttr ".kot[0]"  5;
createNode animCurveTU -n "Main_Circle_blendOrient1";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  576 0;
	setAttr ".kot[0]"  5;
createNode animCurveTU -n "SC_4_Axis_blendOrient1";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1327 0;
createNode animCurveTU -n "SC_4_Axis_scaleZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1327 1;
createNode animCurveTU -n "SC_4_Axis_scaleY";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1327 1;
createNode animCurveTU -n "SC_4_Axis_scaleX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1327 1;
createNode animCurveTU -n "SC_4_Axis_visibility";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1327 1;
createNode animCurveTL -n "SC_4_Axis_translateZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1327 0;
createNode animCurveTL -n "SC_4_Axis_translateY";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1327 0;
createNode animCurveTL -n "SC_4_Axis_translateX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1327 5.2311438029800836;
createNode animCurveTA -n "SC_4_Axis_rotateZ";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1327 0;
createNode animCurveTA -n "SC_4_Axis_rotateX";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1327 0;
createNode animCurveTU -n "SC_3_Axis_visibility";
	setAttr ".tan" 2;
	setAttr ".ktv[0]"  857 1;
createNode animCurveTL -n "SC_3_Axis_translateX";
	setAttr ".tan" 2;
	setAttr ".ktv[0]"  857 5.8250343544143348;
createNode animCurveTL -n "SC_3_Axis_translateY";
	setAttr ".tan" 2;
	setAttr ".ktv[0]"  857 0;
createNode animCurveTL -n "SC_3_Axis_translateZ";
	setAttr ".tan" 2;
	setAttr ".ktv[0]"  857 -2.8763814472162732;
createNode animCurveTA -n "SC_3_Axis_rotateX";
	setAttr ".tan" 2;
	setAttr ".ktv[0]"  857 0;
createNode pairBlend -n "pairBlend22";
	setAttr ".txm" 2;
	setAttr ".tym" 2;
	setAttr ".tzm" 2;
createNode animCurveTA -n "pairBlend22_inRotateY1";
	setAttr ".tan" 2;
	setAttr -s 2 ".ktv[0:1]"  857 0 1326 -290.08725019546989;
createNode animCurveTA -n "SC_3_Axis_rotateZ";
	setAttr ".tan" 2;
	setAttr ".ktv[0]"  857 0;
createNode animCurveTU -n "SC_3_Axis_scaleX";
	setAttr ".tan" 2;
	setAttr ".ktv[0]"  857 1;
createNode animCurveTU -n "SC_3_Axis_scaleY";
	setAttr ".tan" 2;
	setAttr ".ktv[0]"  857 1;
createNode animCurveTU -n "SC_3_Axis_scaleZ";
	setAttr ".tan" 2;
	setAttr ".ktv[0]"  857 1;
createNode animCurveTU -n "SC_3_Axis_blendOrient1";
	setAttr ".tan" 2;
	setAttr ".ktv[0]"  857 0;
createNode animCurveTU -n "SC_3_Axis_orientConstraint1_nodeState";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1 2;
	setAttr ".kot[0]"  5;
createNode animCurveTA -n "SC_3_Axis_orientConstraint1_offsetX";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  1 0;
	setAttr ".kot[0]"  5;
createNode animCurveTA -n "SC_3_Axis_orientConstraint1_offsetY";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  1 0;
	setAttr ".kot[0]"  5;
createNode animCurveTA -n "SC_3_Axis_orientConstraint1_offsetZ";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  1 0;
	setAttr ".kot[0]"  5;
createNode animCurveTU -n "SC_3_Axis_orientConstraint1_interpType";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  1 1;
	setAttr ".kot[0]"  5;
createNode animCurveTU -n "SC_3_Axis_orientConstraint1_circle_2W0";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  1 1;
	setAttr ".kot[0]"  5;
createNode animCurveTU -n "SC_1_Orbit_visibility";
	setAttr ".tan" 9;
	setAttr ".ktv[0]"  439 1;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "SC_1_Orbit_translateX";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  439 -0.047623146688412013;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "SC_1_Orbit_translateY";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  439 0;
	setAttr ".kot[0]"  5;
createNode animCurveTL -n "SC_1_Orbit_translateZ";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  439 0.056884430329977448;
	setAttr ".kot[0]"  5;
createNode animCurveTA -n "SC_1_Orbit_rotateX";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  439 0;
	setAttr ".kot[0]"  5;
createNode animCurveTA -n "SC_1_Orbit_rotateZ";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  439 0;
	setAttr ".kot[0]"  5;
createNode animCurveTU -n "SC_1_Orbit_scaleX";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  439 1;
	setAttr ".kot[0]"  5;
createNode animCurveTU -n "SC_1_Orbit_scaleY";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  439 1;
	setAttr ".kot[0]"  5;
createNode animCurveTU -n "SC_1_Orbit_scaleZ";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  439 1;
	setAttr ".kot[0]"  5;
createNode animCurveTU -n "SC_1_Orbit_blendUnitConversion8";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  439 0;
	setAttr ".kot[0]"  5;
createNode animCurveTU -n "SC_1_Axis_blendOrient1";
	setAttr ".tan" 3;
	setAttr ".ktv[0]"  466 0;
	setAttr ".kot[0]"  5;
select -ne :time1;
	setAttr ".o" 1351;
select -ne :renderPartition;
	setAttr -s 5 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 3 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
select -ne :lightList1;
select -ne :defaultTextureList1;
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	setAttr ".mcfr" 30;
	setAttr ".outf" 23;
	setAttr ".an" yes;
	setAttr ".fs" 1;
	setAttr ".ef" 600;
	setAttr ".ep" 4;
	setAttr ".pff" yes;
	setAttr ".ifp" -type "string" "Title_Sequence";
select -ne :defaultResolution;
	setAttr ".w" 646;
	setAttr ".h" 485;
	setAttr ".pa" 1.0010000467300415;
	setAttr ".dar" 1.3329999446868896;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
	setAttr ".hwfr" 30;
select -ne :defaultHardwareRenderGlobals;
	setAttr ".fn" -type "string" "im";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
connectAttr "Main_Layer.di" "Arcane_Title_Skeleton.do";
connectAttr "Arcane_Title_Skeleton_scaleX.o" "Arcane_Title_Skeleton.sx";
connectAttr "Arcane_Title_Skeleton_scaleY.o" "Arcane_Title_Skeleton.sy";
connectAttr "Arcane_Title_Skeleton_scaleZ.o" "Arcane_Title_Skeleton.sz";
connectAttr "Arcane_Title_Skeleton_visibility.o" "Arcane_Title_Skeleton.v";
connectAttr "Arcane_Title_Skeleton_translateX.o" "Arcane_Title_Skeleton.tx";
connectAttr "Arcane_Title_Skeleton_translateY.o" "Arcane_Title_Skeleton.ty";
connectAttr "Arcane_Title_Skeleton_translateZ.o" "Arcane_Title_Skeleton.tz";
connectAttr "Arcane_Title_Skeleton_rotateY.o" "Arcane_Title_Skeleton.ry";
connectAttr "Arcane_Title_Skeleton_rotateZ.o" "Arcane_Title_Skeleton.rz";
connectAttr "Arcane_Title_Skeleton.s" "Main_Circle.is";
connectAttr "pairBlend2.ory" "Main_Circle.ry";
connectAttr "Main_Circle_rotateX.o" "Main_Circle.rx";
connectAttr "Main_Circle_rotateZ.o" "Main_Circle.rz";
connectAttr "Main_Circle_translateX.o" "Main_Circle.tx";
connectAttr "Main_Circle_translateY.o" "Main_Circle.ty";
connectAttr "Main_Circle_translateZ.o" "Main_Circle.tz";
connectAttr "Main_Circle_visibility.o" "Main_Circle.v";
connectAttr "Main_Circle_scaleX.o" "Main_Circle.sx";
connectAttr "Main_Circle_scaleY.o" "Main_Circle.sy";
connectAttr "Main_Circle_scaleZ.o" "Main_Circle.sz";
connectAttr "Main_Circle_blendOrient1.o" "Main_Circle.blendOrient1";
connectAttr "Main_Circle_orientConstraint1_nodeState.o" "Main_Circle_orientConstraint1.nds"
		;
connectAttr "Main_Circle.ro" "Main_Circle_orientConstraint1.cro";
connectAttr "Main_Circle.pim" "Main_Circle_orientConstraint1.cpim";
connectAttr "Main_Circle.jo" "Main_Circle_orientConstraint1.cjo";
connectAttr "main_control.r" "Main_Circle_orientConstraint1.tg[0].tr";
connectAttr "main_control.ro" "Main_Circle_orientConstraint1.tg[0].tro";
connectAttr "main_control.pm" "Main_Circle_orientConstraint1.tg[0].tpm";
connectAttr "Main_Circle_orientConstraint1.w0" "Main_Circle_orientConstraint1.tg[0].tw"
		;
connectAttr "Main_Circle_orientConstraint1_main_controlW0.o" "Main_Circle_orientConstraint1.w0"
		;
connectAttr "Main_Circle_orientConstraint1_offsetX.o" "Main_Circle_orientConstraint1.ox"
		;
connectAttr "Main_Circle_orientConstraint1_offsetY.o" "Main_Circle_orientConstraint1.oy"
		;
connectAttr "Main_Circle_orientConstraint1_offsetZ.o" "Main_Circle_orientConstraint1.oz"
		;
connectAttr "Main_Circle_orientConstraint1_interpType.o" "Main_Circle_orientConstraint1.int"
		;
connectAttr "Arcane_Title_Skeleton.s" "SC_1_Orbit.is";
connectAttr "pairBlend3.ory" "SC_1_Orbit.ry";
connectAttr "SC_1_Orbit_rotateX.o" "SC_1_Orbit.rx";
connectAttr "SC_1_Orbit_rotateZ.o" "SC_1_Orbit.rz";
connectAttr "SC_1_Orbit_scaleX.o" "SC_1_Orbit.sx";
connectAttr "SC_1_Orbit_scaleY.o" "SC_1_Orbit.sy";
connectAttr "SC_1_Orbit_scaleZ.o" "SC_1_Orbit.sz";
connectAttr "SC_1_Orbit_blendUnitConversion8.o" "SC_1_Orbit.blendUnitConversion8"
		;
connectAttr "SC_1_Orbit_visibility.o" "SC_1_Orbit.v";
connectAttr "SC_1_Orbit_translateX.o" "SC_1_Orbit.tx";
connectAttr "SC_1_Orbit_translateY.o" "SC_1_Orbit.ty";
connectAttr "SC_1_Orbit_translateZ.o" "SC_1_Orbit.tz";
connectAttr "SC_1_Orbit.s" "SC_1_Axis.is";
connectAttr "pairBlend4.ory" "SC_1_Axis.ry";
connectAttr "SC_1_Axis_rotateX.o" "SC_1_Axis.rx";
connectAttr "SC_1_Axis_rotateZ.o" "SC_1_Axis.rz";
connectAttr "SC_1_Axis_translateX.o" "SC_1_Axis.tx";
connectAttr "SC_1_Axis_translateY.o" "SC_1_Axis.ty";
connectAttr "SC_1_Axis_translateZ.o" "SC_1_Axis.tz";
connectAttr "SC_1_Axis_visibility.o" "SC_1_Axis.v";
connectAttr "SC_1_Axis_scaleX.o" "SC_1_Axis.sx";
connectAttr "SC_1_Axis_scaleY.o" "SC_1_Axis.sy";
connectAttr "SC_1_Axis_scaleZ.o" "SC_1_Axis.sz";
connectAttr "SC_1_Axis_blendOrient1.o" "SC_1_Axis.blendOrient1";
connectAttr "SC_1_Axis_orientConstraint1_nodeState.o" "SC_1_Axis_orientConstraint1.nds"
		;
connectAttr "SC_1_Axis.ro" "SC_1_Axis_orientConstraint1.cro";
connectAttr "SC_1_Axis.pim" "SC_1_Axis_orientConstraint1.cpim";
connectAttr "SC_1_Axis.jo" "SC_1_Axis_orientConstraint1.cjo";
connectAttr "circle_1.r" "SC_1_Axis_orientConstraint1.tg[0].tr";
connectAttr "circle_1.ro" "SC_1_Axis_orientConstraint1.tg[0].tro";
connectAttr "circle_1.pm" "SC_1_Axis_orientConstraint1.tg[0].tpm";
connectAttr "SC_1_Axis_orientConstraint1.w0" "SC_1_Axis_orientConstraint1.tg[0].tw"
		;
connectAttr "SC_1_Axis_orientConstraint1_circle_6W0.o" "SC_1_Axis_orientConstraint1.w0"
		;
connectAttr "SC_1_Axis_orientConstraint1_offsetX.o" "SC_1_Axis_orientConstraint1.ox"
		;
connectAttr "SC_1_Axis_orientConstraint1_offsetY.o" "SC_1_Axis_orientConstraint1.oy"
		;
connectAttr "SC_1_Axis_orientConstraint1_offsetZ.o" "SC_1_Axis_orientConstraint1.oz"
		;
connectAttr "SC_1_Axis_orientConstraint1_interpType.o" "SC_1_Axis_orientConstraint1.int"
		;
connectAttr "Arcane_Title_Skeleton.s" "SC_2_Orbit.is";
connectAttr "pairBlend5.ory" "SC_2_Orbit.ry";
connectAttr "SC_2_Orbit.s" "SC_2_Axis.is";
connectAttr "pairBlend6.ory" "SC_2_Axis.ry";
connectAttr "SC_2_Axis_rotateX.o" "SC_2_Axis.rx";
connectAttr "SC_2_Axis_rotateZ.o" "SC_2_Axis.rz";
connectAttr "SC_2_Axis_translateY.o" "SC_2_Axis.ty";
connectAttr "SC_2_Axis_translateZ.o" "SC_2_Axis.tz";
connectAttr "SC_2_Axis_visibility.o" "SC_2_Axis.v";
connectAttr "SC_2_Axis_scaleX.o" "SC_2_Axis.sx";
connectAttr "SC_2_Axis_scaleY.o" "SC_2_Axis.sy";
connectAttr "SC_2_Axis_scaleZ.o" "SC_2_Axis.sz";
connectAttr "SC_2_Axis.ro" "SC_2_Axis_orientConstraint1.cro";
connectAttr "SC_2_Axis.pim" "SC_2_Axis_orientConstraint1.cpim";
connectAttr "SC_2_Axis.jo" "SC_2_Axis_orientConstraint1.cjo";
connectAttr "circle_2.r" "SC_2_Axis_orientConstraint1.tg[0].tr";
connectAttr "circle_2.ro" "SC_2_Axis_orientConstraint1.tg[0].tro";
connectAttr "circle_2.pm" "SC_2_Axis_orientConstraint1.tg[0].tpm";
connectAttr "SC_2_Axis_orientConstraint1.w0" "SC_2_Axis_orientConstraint1.tg[0].tw"
		;
connectAttr "Arcane_Title_Skeleton.s" "SC_3_Orbit.is";
connectAttr "pairBlend7.ory" "SC_3_Orbit.ry";
connectAttr "SC_3_Orbit_rotateX.o" "SC_3_Orbit.rx";
connectAttr "SC_3_Orbit_rotateZ.o" "SC_3_Orbit.rz";
connectAttr "SC_3_Orbit_scaleX.o" "SC_3_Orbit.sx";
connectAttr "SC_3_Orbit_scaleY.o" "SC_3_Orbit.sy";
connectAttr "SC_3_Orbit_scaleZ.o" "SC_3_Orbit.sz";
connectAttr "SC_3_Orbit_visibility.o" "SC_3_Orbit.v";
connectAttr "SC_3_Orbit_translateX.o" "SC_3_Orbit.tx";
connectAttr "SC_3_Orbit_translateY.o" "SC_3_Orbit.ty";
connectAttr "SC_3_Orbit_translateZ.o" "SC_3_Orbit.tz";
connectAttr "SC_3_Orbit.s" "SC_3_Axis.is";
connectAttr "pairBlend22.ory" "SC_3_Axis.ry";
connectAttr "SC_3_Axis_rotateX.o" "SC_3_Axis.rx";
connectAttr "SC_3_Axis_rotateZ.o" "SC_3_Axis.rz";
connectAttr "SC_3_Axis_translateX.o" "SC_3_Axis.tx";
connectAttr "SC_3_Axis_translateY.o" "SC_3_Axis.ty";
connectAttr "SC_3_Axis_translateZ.o" "SC_3_Axis.tz";
connectAttr "SC_3_Axis_blendOrient1.o" "SC_3_Axis.blendOrient1";
connectAttr "SC_3_Axis_visibility.o" "SC_3_Axis.v";
connectAttr "SC_3_Axis_scaleX.o" "SC_3_Axis.sx";
connectAttr "SC_3_Axis_scaleY.o" "SC_3_Axis.sy";
connectAttr "SC_3_Axis_scaleZ.o" "SC_3_Axis.sz";
connectAttr "SC_3_Axis_orientConstraint1_nodeState.o" "SC_3_Axis_orientConstraint1.nds"
		;
connectAttr "SC_3_Axis.ro" "SC_3_Axis_orientConstraint1.cro";
connectAttr "SC_3_Axis.pim" "SC_3_Axis_orientConstraint1.cpim";
connectAttr "SC_3_Axis.jo" "SC_3_Axis_orientConstraint1.cjo";
connectAttr "circle_3.r" "SC_3_Axis_orientConstraint1.tg[0].tr";
connectAttr "circle_3.ro" "SC_3_Axis_orientConstraint1.tg[0].tro";
connectAttr "circle_3.pm" "SC_3_Axis_orientConstraint1.tg[0].tpm";
connectAttr "SC_3_Axis_orientConstraint1.w0" "SC_3_Axis_orientConstraint1.tg[0].tw"
		;
connectAttr "SC_3_Axis_orientConstraint1_circle_2W0.o" "SC_3_Axis_orientConstraint1.w0"
		;
connectAttr "SC_3_Axis_orientConstraint1_offsetX.o" "SC_3_Axis_orientConstraint1.ox"
		;
connectAttr "SC_3_Axis_orientConstraint1_offsetY.o" "SC_3_Axis_orientConstraint1.oy"
		;
connectAttr "SC_3_Axis_orientConstraint1_offsetZ.o" "SC_3_Axis_orientConstraint1.oz"
		;
connectAttr "SC_3_Axis_orientConstraint1_interpType.o" "SC_3_Axis_orientConstraint1.int"
		;
connectAttr "Arcane_Title_Skeleton.s" "SC_4_Orbit.is";
connectAttr "pairBlend8.ory" "SC_4_Orbit.ry";
connectAttr "SC_4_Orbit_rotateX.o" "SC_4_Orbit.rx";
connectAttr "SC_4_Orbit_rotateZ.o" "SC_4_Orbit.rz";
connectAttr "SC_4_Orbit_scaleX.o" "SC_4_Orbit.sx";
connectAttr "SC_4_Orbit_scaleY.o" "SC_4_Orbit.sy";
connectAttr "SC_4_Orbit_scaleZ.o" "SC_4_Orbit.sz";
connectAttr "SC_4_Orbit_visibility.o" "SC_4_Orbit.v";
connectAttr "SC_4_Orbit_translateX.o" "SC_4_Orbit.tx";
connectAttr "SC_4_Orbit_translateY.o" "SC_4_Orbit.ty";
connectAttr "SC_4_Orbit_translateZ.o" "SC_4_Orbit.tz";
connectAttr "SC_4_Orbit_blendUnitConversion9.o" "SC_4_Orbit.blendUnitConversion9"
		;
connectAttr "SC_4_Orbit.s" "SC_4_Axis.is";
connectAttr "pairBlend9.ory" "SC_4_Axis.ry";
connectAttr "SC_4_Axis_rotateX.o" "SC_4_Axis.rx";
connectAttr "SC_4_Axis_rotateZ.o" "SC_4_Axis.rz";
connectAttr "SC_4_Axis_translateX.o" "SC_4_Axis.tx";
connectAttr "SC_4_Axis_translateY.o" "SC_4_Axis.ty";
connectAttr "SC_4_Axis_translateZ.o" "SC_4_Axis.tz";
connectAttr "SC_4_Axis_visibility.o" "SC_4_Axis.v";
connectAttr "SC_4_Axis_scaleX.o" "SC_4_Axis.sx";
connectAttr "SC_4_Axis_scaleY.o" "SC_4_Axis.sy";
connectAttr "SC_4_Axis_scaleZ.o" "SC_4_Axis.sz";
connectAttr "SC_4_Axis_blendOrient1.o" "SC_4_Axis.blendOrient1";
connectAttr "SC_4_Axis_orientConstraint1_nodeState.o" "SC_4_Axis_orientConstraint1.nds"
		;
connectAttr "SC_4_Axis.ro" "SC_4_Axis_orientConstraint1.cro";
connectAttr "SC_4_Axis.pim" "SC_4_Axis_orientConstraint1.cpim";
connectAttr "SC_4_Axis.jo" "SC_4_Axis_orientConstraint1.cjo";
connectAttr "circle_4.r" "SC_4_Axis_orientConstraint1.tg[0].tr";
connectAttr "circle_4.ro" "SC_4_Axis_orientConstraint1.tg[0].tro";
connectAttr "circle_4.pm" "SC_4_Axis_orientConstraint1.tg[0].tpm";
connectAttr "SC_4_Axis_orientConstraint1.w0" "SC_4_Axis_orientConstraint1.tg[0].tw"
		;
connectAttr "SC_4_Axis_orientConstraint1_circle_5W0.o" "SC_4_Axis_orientConstraint1.w0"
		;
connectAttr "SC_4_Axis_orientConstraint1_offsetX.o" "SC_4_Axis_orientConstraint1.ox"
		;
connectAttr "SC_4_Axis_orientConstraint1_offsetY.o" "SC_4_Axis_orientConstraint1.oy"
		;
connectAttr "SC_4_Axis_orientConstraint1_offsetZ.o" "SC_4_Axis_orientConstraint1.oz"
		;
connectAttr "SC_4_Axis_orientConstraint1_interpType.o" "SC_4_Axis_orientConstraint1.int"
		;
connectAttr "Arcane_Title_Skeleton.s" "SC_5_Orbit.is";
connectAttr "pairBlend10.ory" "SC_5_Orbit.ry";
connectAttr "SC_5_Orbit_rotateX.o" "SC_5_Orbit.rx";
connectAttr "SC_5_Orbit_rotateZ.o" "SC_5_Orbit.rz";
connectAttr "SC_5_Orbit_scaleX.o" "SC_5_Orbit.sx";
connectAttr "SC_5_Orbit_scaleY.o" "SC_5_Orbit.sy";
connectAttr "SC_5_Orbit_scaleZ.o" "SC_5_Orbit.sz";
connectAttr "SC_5_Orbit_visibility.o" "SC_5_Orbit.v";
connectAttr "SC_5_Orbit_translateX.o" "SC_5_Orbit.tx";
connectAttr "SC_5_Orbit_translateY.o" "SC_5_Orbit.ty";
connectAttr "SC_5_Orbit_translateZ.o" "SC_5_Orbit.tz";
connectAttr "SC_5_Orbit.s" "SC_5_Axis.is";
connectAttr "pairBlend11.ory" "SC_5_Axis.ry";
connectAttr "SC_5_Axis_rotateX.o" "SC_5_Axis.rx";
connectAttr "SC_5_Axis_rotateZ.o" "SC_5_Axis.rz";
connectAttr "SC_5_Axis_translateX.o" "SC_5_Axis.tx";
connectAttr "SC_5_Axis_translateY.o" "SC_5_Axis.ty";
connectAttr "SC_5_Axis_translateZ.o" "SC_5_Axis.tz";
connectAttr "SC_5_Axis_visibility.o" "SC_5_Axis.v";
connectAttr "SC_5_Axis_scaleX.o" "SC_5_Axis.sx";
connectAttr "SC_5_Axis_scaleY.o" "SC_5_Axis.sy";
connectAttr "SC_5_Axis_scaleZ.o" "SC_5_Axis.sz";
connectAttr "SC_5_Axis.ro" "SC_5_Axis_orientConstraint1.cro";
connectAttr "SC_5_Axis.pim" "SC_5_Axis_orientConstraint1.cpim";
connectAttr "SC_5_Axis.jo" "SC_5_Axis_orientConstraint1.cjo";
connectAttr "circle_5.r" "SC_5_Axis_orientConstraint1.tg[0].tr";
connectAttr "circle_5.ro" "SC_5_Axis_orientConstraint1.tg[0].tro";
connectAttr "circle_5.pm" "SC_5_Axis_orientConstraint1.tg[0].tpm";
connectAttr "SC_5_Axis_orientConstraint1.w0" "SC_5_Axis_orientConstraint1.tg[0].tw"
		;
connectAttr "Arcane_Title_Skeleton.s" "SC_6_Orbit.is";
connectAttr "pairBlend12.ory" "SC_6_Orbit.ry";
connectAttr "SC_6_Orbit.s" "SC_6_Axis.is";
connectAttr "pairBlend13.ory" "SC_6_Axis.ry";
connectAttr "SC_6_Axis_rotateX.o" "SC_6_Axis.rx";
connectAttr "SC_6_Axis_rotateZ.o" "SC_6_Axis.rz";
connectAttr "SC_6_Axis_translateX.o" "SC_6_Axis.tx";
connectAttr "SC_6_Axis_translateY.o" "SC_6_Axis.ty";
connectAttr "SC_6_Axis_translateZ.o" "SC_6_Axis.tz";
connectAttr "SC_6_Axis_visibility.o" "SC_6_Axis.v";
connectAttr "SC_6_Axis_scaleX.o" "SC_6_Axis.sx";
connectAttr "SC_6_Axis_scaleY.o" "SC_6_Axis.sy";
connectAttr "SC_6_Axis_scaleZ.o" "SC_6_Axis.sz";
connectAttr "SC_6_Axis_orientConstraint1_nodeState.o" "SC_6_Axis_orientConstraint1.nds"
		;
connectAttr "SC_6_Axis.ro" "SC_6_Axis_orientConstraint1.cro";
connectAttr "SC_6_Axis.pim" "SC_6_Axis_orientConstraint1.cpim";
connectAttr "SC_6_Axis.jo" "SC_6_Axis_orientConstraint1.cjo";
connectAttr "circle_6.r" "SC_6_Axis_orientConstraint1.tg[0].tr";
connectAttr "circle_6.ro" "SC_6_Axis_orientConstraint1.tg[0].tro";
connectAttr "circle_6.pm" "SC_6_Axis_orientConstraint1.tg[0].tpm";
connectAttr "SC_6_Axis_orientConstraint1.w0" "SC_6_Axis_orientConstraint1.tg[0].tw"
		;
connectAttr "SC_6_Axis_orientConstraint1_circle_3W0.o" "SC_6_Axis_orientConstraint1.w0"
		;
connectAttr "SC_6_Axis_orientConstraint1_offsetX.o" "SC_6_Axis_orientConstraint1.ox"
		;
connectAttr "SC_6_Axis_orientConstraint1_offsetY.o" "SC_6_Axis_orientConstraint1.oy"
		;
connectAttr "SC_6_Axis_orientConstraint1_offsetZ.o" "SC_6_Axis_orientConstraint1.oz"
		;
connectAttr "SC_6_Axis_orientConstraint1_interpType.o" "SC_6_Axis_orientConstraint1.int"
		;
connectAttr "Arcane_Title_Skeleton.s" "SC_7_Orbit.is";
connectAttr "pairBlend14.ory" "SC_7_Orbit.ry";
connectAttr "SC_7_Orbit_rotateX.o" "SC_7_Orbit.rx";
connectAttr "SC_7_Orbit_rotateZ.o" "SC_7_Orbit.rz";
connectAttr "SC_7_Orbit_scaleX.o" "SC_7_Orbit.sx";
connectAttr "SC_7_Orbit_scaleY.o" "SC_7_Orbit.sy";
connectAttr "SC_7_Orbit_scaleZ.o" "SC_7_Orbit.sz";
connectAttr "SC_7_Orbit_visibility.o" "SC_7_Orbit.v";
connectAttr "SC_7_Orbit_translateX.o" "SC_7_Orbit.tx";
connectAttr "SC_7_Orbit_translateY.o" "SC_7_Orbit.ty";
connectAttr "SC_7_Orbit_translateZ.o" "SC_7_Orbit.tz";
connectAttr "SC_7_Orbit.s" "SC_7_Axis.is";
connectAttr "pairBlend15.ory" "SC_7_Axis.ry";
connectAttr "SC_7_Axis_rotateX.o" "SC_7_Axis.rx";
connectAttr "SC_7_Axis_rotateZ.o" "SC_7_Axis.rz";
connectAttr "SC_7_Axis_translateX.o" "SC_7_Axis.tx";
connectAttr "SC_7_Axis_translateY.o" "SC_7_Axis.ty";
connectAttr "SC_7_Axis_translateZ.o" "SC_7_Axis.tz";
connectAttr "SC_7_Axis_visibility.o" "SC_7_Axis.v";
connectAttr "SC_7_Axis_scaleX.o" "SC_7_Axis.sx";
connectAttr "SC_7_Axis_scaleY.o" "SC_7_Axis.sy";
connectAttr "SC_7_Axis_scaleZ.o" "SC_7_Axis.sz";
connectAttr "SC_7_Axis_orientConstraint1_nodeState.o" "SC_7_Axis_orientConstraint1.nds"
		;
connectAttr "SC_7_Axis.ro" "SC_7_Axis_orientConstraint1.cro";
connectAttr "SC_7_Axis.pim" "SC_7_Axis_orientConstraint1.cpim";
connectAttr "SC_7_Axis.jo" "SC_7_Axis_orientConstraint1.cjo";
connectAttr "circle_7.r" "SC_7_Axis_orientConstraint1.tg[0].tr";
connectAttr "circle_7.ro" "SC_7_Axis_orientConstraint1.tg[0].tro";
connectAttr "circle_7.pm" "SC_7_Axis_orientConstraint1.tg[0].tpm";
connectAttr "SC_7_Axis_orientConstraint1.w0" "SC_7_Axis_orientConstraint1.tg[0].tw"
		;
connectAttr "SC_7_Axis_orientConstraint1_circle_9W0.o" "SC_7_Axis_orientConstraint1.w0"
		;
connectAttr "SC_7_Axis_orientConstraint1_offsetX.o" "SC_7_Axis_orientConstraint1.ox"
		;
connectAttr "SC_7_Axis_orientConstraint1_offsetY.o" "SC_7_Axis_orientConstraint1.oy"
		;
connectAttr "SC_7_Axis_orientConstraint1_offsetZ.o" "SC_7_Axis_orientConstraint1.oz"
		;
connectAttr "SC_7_Axis_orientConstraint1_interpType.o" "SC_7_Axis_orientConstraint1.int"
		;
connectAttr "Arcane_Title_Skeleton.s" "SC_8_Orbit.is";
connectAttr "pairBlend16.ory" "SC_8_Orbit.ry";
connectAttr "SC_8_Orbit.s" "SC_8_Axis.is";
connectAttr "pairBlend17.ory" "SC_8_Axis.ry";
connectAttr "SC_8_Axis_rotateX.o" "SC_8_Axis.rx";
connectAttr "SC_8_Axis_rotateZ.o" "SC_8_Axis.rz";
connectAttr "SC_8_Axis_translateX.o" "SC_8_Axis.tx";
connectAttr "SC_8_Axis_translateY.o" "SC_8_Axis.ty";
connectAttr "SC_8_Axis_translateZ.o" "SC_8_Axis.tz";
connectAttr "SC_8_Axis_visibility.o" "SC_8_Axis.v";
connectAttr "SC_8_Axis_scaleX.o" "SC_8_Axis.sx";
connectAttr "SC_8_Axis_scaleY.o" "SC_8_Axis.sy";
connectAttr "SC_8_Axis_scaleZ.o" "SC_8_Axis.sz";
connectAttr "SC_8_Axis_orientConstraint1_nodeState.o" "SC_8_Axis_orientConstraint1.nds"
		;
connectAttr "SC_8_Axis.ro" "SC_8_Axis_orientConstraint1.cro";
connectAttr "SC_8_Axis.pim" "SC_8_Axis_orientConstraint1.cpim";
connectAttr "SC_8_Axis.jo" "SC_8_Axis_orientConstraint1.cjo";
connectAttr "circle_8.r" "SC_8_Axis_orientConstraint1.tg[0].tr";
connectAttr "circle_8.ro" "SC_8_Axis_orientConstraint1.tg[0].tro";
connectAttr "circle_8.pm" "SC_8_Axis_orientConstraint1.tg[0].tpm";
connectAttr "SC_8_Axis_orientConstraint1.w0" "SC_8_Axis_orientConstraint1.tg[0].tw"
		;
connectAttr "SC_8_Axis_orientConstraint1_circle_8W0.o" "SC_8_Axis_orientConstraint1.w0"
		;
connectAttr "SC_8_Axis_orientConstraint1_offsetX.o" "SC_8_Axis_orientConstraint1.ox"
		;
connectAttr "SC_8_Axis_orientConstraint1_offsetY.o" "SC_8_Axis_orientConstraint1.oy"
		;
connectAttr "SC_8_Axis_orientConstraint1_offsetZ.o" "SC_8_Axis_orientConstraint1.oz"
		;
connectAttr "SC_8_Axis_orientConstraint1_interpType.o" "SC_8_Axis_orientConstraint1.int"
		;
connectAttr "Arcane_Title_Skeleton.s" "SC_9_Orbit.is";
connectAttr "pairBlend18.ory" "SC_9_Orbit.ry";
connectAttr "SC_9_Orbit.s" "SC_9_Axis.is";
connectAttr "pairBlend19.ory" "SC_9_Axis.ry";
connectAttr "SC_9_Axis_rotateX.o" "SC_9_Axis.rx";
connectAttr "SC_9_Axis_rotateZ.o" "SC_9_Axis.rz";
connectAttr "SC_9_Axis_translateX.o" "SC_9_Axis.tx";
connectAttr "SC_9_Axis_translateY.o" "SC_9_Axis.ty";
connectAttr "SC_9_Axis_translateZ.o" "SC_9_Axis.tz";
connectAttr "SC_9_Axis_visibility.o" "SC_9_Axis.v";
connectAttr "SC_9_Axis_scaleX.o" "SC_9_Axis.sx";
connectAttr "SC_9_Axis_scaleY.o" "SC_9_Axis.sy";
connectAttr "SC_9_Axis_scaleZ.o" "SC_9_Axis.sz";
connectAttr "SC_9_Axis.ro" "SC_9_Axis_orientConstraint1.cro";
connectAttr "SC_9_Axis.pim" "SC_9_Axis_orientConstraint1.cpim";
connectAttr "SC_9_Axis.jo" "SC_9_Axis_orientConstraint1.cjo";
connectAttr "circle_9.r" "SC_9_Axis_orientConstraint1.tg[0].tr";
connectAttr "circle_9.ro" "SC_9_Axis_orientConstraint1.tg[0].tro";
connectAttr "circle_9.pm" "SC_9_Axis_orientConstraint1.tg[0].tpm";
connectAttr "SC_9_Axis_orientConstraint1.w0" "SC_9_Axis_orientConstraint1.tg[0].tw"
		;
connectAttr "Arcane_Title_Skeleton.s" "camera_joint.is";
connectAttr "pairBlend20.otx" "camera_joint.tx";
connectAttr "pairBlend20.oty" "camera_joint.ty";
connectAttr "pairBlend20.otz" "camera_joint.tz";
connectAttr "pairBlend21.orx" "camera_joint.rx";
connectAttr "pairBlend21.orz" "camera_joint.rz";
connectAttr "camera_joint_rotateY.o" "camera_joint.ry";
connectAttr "camera_joint_visibility.o" "camera_joint.v";
connectAttr "camera_joint_scaleX.o" "camera_joint.sx";
connectAttr "camera_joint_scaleY.o" "camera_joint.sy";
connectAttr "camera_joint_scaleZ.o" "camera_joint.sz";
connectAttr "camera_joint_pointConstraint1_nodeState.o" "camera_joint_pointConstraint1.nds"
		;
connectAttr "camera_joint.pim" "camera_joint_pointConstraint1.cpim";
connectAttr "camera_joint.rp" "camera_joint_pointConstraint1.crp";
connectAttr "camera_joint.rpt" "camera_joint_pointConstraint1.crt";
connectAttr "Arkane_camera.t" "camera_joint_pointConstraint1.tg[0].tt";
connectAttr "Arkane_camera.rp" "camera_joint_pointConstraint1.tg[0].trp";
connectAttr "Arkane_camera.rpt" "camera_joint_pointConstraint1.tg[0].trt";
connectAttr "Arkane_camera.pm" "camera_joint_pointConstraint1.tg[0].tpm";
connectAttr "camera_joint_pointConstraint1.w0" "camera_joint_pointConstraint1.tg[0].tw"
		;
connectAttr "camera_joint_pointConstraint1_camera1W0.o" "camera_joint_pointConstraint1.w0"
		;
connectAttr "camera_joint_pointConstraint1_offsetX.o" "camera_joint_pointConstraint1.ox"
		;
connectAttr "camera_joint_pointConstraint1_offsetY.o" "camera_joint_pointConstraint1.oy"
		;
connectAttr "camera_joint_pointConstraint1_offsetZ.o" "camera_joint_pointConstraint1.oz"
		;
connectAttr "camera_joint_orientConstraint1_nodeState.o" "camera_joint_orientConstraint1.nds"
		;
connectAttr "camera_joint.ro" "camera_joint_orientConstraint1.cro";
connectAttr "camera_joint.pim" "camera_joint_orientConstraint1.cpim";
connectAttr "camera_joint.jo" "camera_joint_orientConstraint1.cjo";
connectAttr "Arkane_camera.r" "camera_joint_orientConstraint1.tg[0].tr";
connectAttr "Arkane_camera.ro" "camera_joint_orientConstraint1.tg[0].tro";
connectAttr "Arkane_camera.pm" "camera_joint_orientConstraint1.tg[0].tpm";
connectAttr "camera_joint_orientConstraint1.w0" "camera_joint_orientConstraint1.tg[0].tw"
		;
connectAttr "camera_joint_orientConstraint1_camera1W0.o" "camera_joint_orientConstraint1.w0"
		;
connectAttr "camera_joint_orientConstraint1_offsetX.o" "camera_joint_orientConstraint1.ox"
		;
connectAttr "camera_joint_orientConstraint1_offsetY.o" "camera_joint_orientConstraint1.oy"
		;
connectAttr "camera_joint_orientConstraint1_offsetZ.o" "camera_joint_orientConstraint1.oz"
		;
connectAttr "camera_joint_orientConstraint1_interpType.o" "camera_joint_orientConstraint1.int"
		;
connectAttr "Main_Layer.di" "Arcane_Title.do";
connectAttr "groupId1.id" "Arcane_TitleShape.iog.og[0].gid";
connectAttr "arcane_sym.mwc" "Arcane_TitleShape.iog.og[0].gco";
connectAttr "skinCluster1GroupId.id" "Arcane_TitleShape.iog.og[1].gid";
connectAttr "skinCluster1Set.mwc" "Arcane_TitleShape.iog.og[1].gco";
connectAttr "groupId3.id" "Arcane_TitleShape.iog.og[2].gid";
connectAttr "tweakSet1.mwc" "Arcane_TitleShape.iog.og[2].gco";
connectAttr "skinCluster1.og[0]" "Arcane_TitleShape.i";
connectAttr "tweak1.vl[0].vt[0]" "Arcane_TitleShape.twl";
connectAttr "Arkane_camera_rotateZ.o" "Arkane_camera.rz";
connectAttr "Arkane_camera_Orbit.o" "Arkane_camera.Orbit";
connectAttr "Arkane_camera_translateX.o" "Arkane_camera.tx";
connectAttr "Arkane_camera_translateY.o" "Arkane_camera.ty";
connectAttr "Arkane_camera_translateZ.o" "Arkane_camera.tz";
connectAttr "Main_Layer.di" "Arkane_camera.do";
connectAttr "main_control_pointConstraint1.ctx" "main_control.tx" -l on;
connectAttr "main_control_pointConstraint1.cty" "main_control.ty" -l on;
connectAttr "main_control_pointConstraint1.ctz" "main_control.tz" -l on;
connectAttr "main_control.pim" "main_control_pointConstraint1.cpim";
connectAttr "main_control.rp" "main_control_pointConstraint1.crp";
connectAttr "main_control.rpt" "main_control_pointConstraint1.crt";
connectAttr "Main_Circle.t" "main_control_pointConstraint1.tg[0].tt";
connectAttr "Main_Circle.rp" "main_control_pointConstraint1.tg[0].trp";
connectAttr "Main_Circle.rpt" "main_control_pointConstraint1.tg[0].trt";
connectAttr "Main_Circle.pm" "main_control_pointConstraint1.tg[0].tpm";
connectAttr "main_control_pointConstraint1.w0" "main_control_pointConstraint1.tg[0].tw"
		;
connectAttr "circle_1_pointConstraint1.ctx" "circle_1.tx" -l on;
connectAttr "circle_1_pointConstraint1.cty" "circle_1.ty" -l on;
connectAttr "circle_1_pointConstraint1.ctz" "circle_1.tz" -l on;
connectAttr "circle_1.pim" "circle_1_pointConstraint1.cpim";
connectAttr "circle_1.rp" "circle_1_pointConstraint1.crp";
connectAttr "circle_1.rpt" "circle_1_pointConstraint1.crt";
connectAttr "SC_1_Axis.t" "circle_1_pointConstraint1.tg[0].tt";
connectAttr "SC_1_Axis.rp" "circle_1_pointConstraint1.tg[0].trp";
connectAttr "SC_1_Axis.rpt" "circle_1_pointConstraint1.tg[0].trt";
connectAttr "SC_1_Axis.pm" "circle_1_pointConstraint1.tg[0].tpm";
connectAttr "circle_1_pointConstraint1.w0" "circle_1_pointConstraint1.tg[0].tw";
connectAttr "circle_2_pointConstraint1.ctx" "circle_2.tx" -l on;
connectAttr "circle_2_pointConstraint1.cty" "circle_2.ty" -l on;
connectAttr "circle_2_pointConstraint1.ctz" "circle_2.tz" -l on;
connectAttr "transformGeometry3.og" "circle_2Shape.cr";
connectAttr "circle_2.pim" "circle_2_pointConstraint1.cpim";
connectAttr "circle_2.rp" "circle_2_pointConstraint1.crp";
connectAttr "circle_2.rpt" "circle_2_pointConstraint1.crt";
connectAttr "SC_2_Axis.t" "circle_2_pointConstraint1.tg[0].tt";
connectAttr "SC_2_Axis.rp" "circle_2_pointConstraint1.tg[0].trp";
connectAttr "SC_2_Axis.rpt" "circle_2_pointConstraint1.tg[0].trt";
connectAttr "SC_2_Axis.pm" "circle_2_pointConstraint1.tg[0].tpm";
connectAttr "circle_2_pointConstraint1.w0" "circle_2_pointConstraint1.tg[0].tw";
connectAttr "circle_3_pointConstraint1.ctx" "circle_3.tx" -l on;
connectAttr "circle_3_pointConstraint1.cty" "circle_3.ty" -l on;
connectAttr "circle_3_pointConstraint1.ctz" "circle_3.tz" -l on;
connectAttr "circle_3.pim" "circle_3_pointConstraint1.cpim";
connectAttr "circle_3.rp" "circle_3_pointConstraint1.crp";
connectAttr "circle_3.rpt" "circle_3_pointConstraint1.crt";
connectAttr "SC_3_Axis.t" "circle_3_pointConstraint1.tg[0].tt";
connectAttr "SC_3_Axis.rp" "circle_3_pointConstraint1.tg[0].trp";
connectAttr "SC_3_Axis.rpt" "circle_3_pointConstraint1.tg[0].trt";
connectAttr "SC_3_Axis.pm" "circle_3_pointConstraint1.tg[0].tpm";
connectAttr "circle_3_pointConstraint1.w0" "circle_3_pointConstraint1.tg[0].tw";
connectAttr "circle_4_pointConstraint1.ctx" "circle_4.tx" -l on;
connectAttr "circle_4_pointConstraint1.cty" "circle_4.ty" -l on;
connectAttr "circle_4_pointConstraint1.ctz" "circle_4.tz" -l on;
connectAttr "circle_4.pim" "circle_4_pointConstraint1.cpim";
connectAttr "circle_4.rp" "circle_4_pointConstraint1.crp";
connectAttr "circle_4.rpt" "circle_4_pointConstraint1.crt";
connectAttr "SC_4_Axis.t" "circle_4_pointConstraint1.tg[0].tt";
connectAttr "SC_4_Axis.rp" "circle_4_pointConstraint1.tg[0].trp";
connectAttr "SC_4_Axis.rpt" "circle_4_pointConstraint1.tg[0].trt";
connectAttr "SC_4_Axis.pm" "circle_4_pointConstraint1.tg[0].tpm";
connectAttr "circle_4_pointConstraint1.w0" "circle_4_pointConstraint1.tg[0].tw";
connectAttr "circle_5_pointConstraint1.ctx" "circle_5.tx" -l on;
connectAttr "circle_5_pointConstraint1.cty" "circle_5.ty" -l on;
connectAttr "circle_5_pointConstraint1.ctz" "circle_5.tz" -l on;
connectAttr "circle_5.pim" "circle_5_pointConstraint1.cpim";
connectAttr "circle_5.rp" "circle_5_pointConstraint1.crp";
connectAttr "circle_5.rpt" "circle_5_pointConstraint1.crt";
connectAttr "SC_5_Axis.t" "circle_5_pointConstraint1.tg[0].tt";
connectAttr "SC_5_Axis.rp" "circle_5_pointConstraint1.tg[0].trp";
connectAttr "SC_5_Axis.rpt" "circle_5_pointConstraint1.tg[0].trt";
connectAttr "SC_5_Axis.pm" "circle_5_pointConstraint1.tg[0].tpm";
connectAttr "circle_5_pointConstraint1.w0" "circle_5_pointConstraint1.tg[0].tw";
connectAttr "circle_6_pointConstraint1.ctx" "circle_6.tx" -l on;
connectAttr "circle_6_pointConstraint1.cty" "circle_6.ty" -l on;
connectAttr "circle_6_pointConstraint1.ctz" "circle_6.tz" -l on;
connectAttr "circle_6.pim" "circle_6_pointConstraint1.cpim";
connectAttr "circle_6.rp" "circle_6_pointConstraint1.crp";
connectAttr "circle_6.rpt" "circle_6_pointConstraint1.crt";
connectAttr "SC_6_Axis.t" "circle_6_pointConstraint1.tg[0].tt";
connectAttr "SC_6_Axis.rp" "circle_6_pointConstraint1.tg[0].trp";
connectAttr "SC_6_Axis.rpt" "circle_6_pointConstraint1.tg[0].trt";
connectAttr "SC_6_Axis.pm" "circle_6_pointConstraint1.tg[0].tpm";
connectAttr "circle_6_pointConstraint1.w0" "circle_6_pointConstraint1.tg[0].tw";
connectAttr "circle_7_pointConstraint1.ctx" "circle_7.tx" -l on;
connectAttr "circle_7_pointConstraint1.cty" "circle_7.ty" -l on;
connectAttr "circle_7_pointConstraint1.ctz" "circle_7.tz" -l on;
connectAttr "circle_7.pim" "circle_7_pointConstraint1.cpim";
connectAttr "circle_7.rp" "circle_7_pointConstraint1.crp";
connectAttr "circle_7.rpt" "circle_7_pointConstraint1.crt";
connectAttr "SC_7_Axis.t" "circle_7_pointConstraint1.tg[0].tt";
connectAttr "SC_7_Axis.rp" "circle_7_pointConstraint1.tg[0].trp";
connectAttr "SC_7_Axis.rpt" "circle_7_pointConstraint1.tg[0].trt";
connectAttr "SC_7_Axis.pm" "circle_7_pointConstraint1.tg[0].tpm";
connectAttr "circle_7_pointConstraint1.w0" "circle_7_pointConstraint1.tg[0].tw";
connectAttr "circle_9_pointConstraint1.ctx" "circle_9.tx" -l on;
connectAttr "circle_9_pointConstraint1.cty" "circle_9.ty" -l on;
connectAttr "circle_9_pointConstraint1.ctz" "circle_9.tz" -l on;
connectAttr "circle_9.pim" "circle_9_pointConstraint1.cpim";
connectAttr "circle_9.rp" "circle_9_pointConstraint1.crp";
connectAttr "circle_9.rpt" "circle_9_pointConstraint1.crt";
connectAttr "SC_9_Axis.t" "circle_9_pointConstraint1.tg[0].tt";
connectAttr "SC_9_Axis.rp" "circle_9_pointConstraint1.tg[0].trp";
connectAttr "SC_9_Axis.rpt" "circle_9_pointConstraint1.tg[0].trt";
connectAttr "SC_9_Axis.pm" "circle_9_pointConstraint1.tg[0].tpm";
connectAttr "circle_9_pointConstraint1.w0" "circle_9_pointConstraint1.tg[0].tw";
connectAttr "circle_8_pointConstraint1.ctx" "circle_8.tx" -l on;
connectAttr "circle_8_pointConstraint1.cty" "circle_8.ty" -l on;
connectAttr "circle_8_pointConstraint1.ctz" "circle_8.tz" -l on;
connectAttr "circle_8.pim" "circle_8_pointConstraint1.cpim";
connectAttr "circle_8.rp" "circle_8_pointConstraint1.crp";
connectAttr "circle_8.rpt" "circle_8_pointConstraint1.crt";
connectAttr "SC_8_Axis.t" "circle_8_pointConstraint1.tg[0].tt";
connectAttr "SC_8_Axis.rp" "circle_8_pointConstraint1.tg[0].trp";
connectAttr "SC_8_Axis.rpt" "circle_8_pointConstraint1.tg[0].trt";
connectAttr "SC_8_Axis.pm" "circle_8_pointConstraint1.tg[0].tpm";
connectAttr "circle_8_pointConstraint1.w0" "circle_8_pointConstraint1.tg[0].tw";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[0].llnk";
connectAttr ":initialShadingGroup.msg" "lightLinker1.lnk[0].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[1].llnk";
connectAttr ":initialParticleSE.msg" "lightLinker1.lnk[1].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[2].llnk";
connectAttr "arcane_sym.msg" "lightLinker1.lnk[2].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[3].llnk";
connectAttr "pasted__fluidShape1SG.msg" "lightLinker1.lnk[3].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[4].llnk";
connectAttr "pasted__fluidShape1SG1.msg" "lightLinker1.lnk[4].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.slnk[0].sllk";
connectAttr ":initialShadingGroup.msg" "lightLinker1.slnk[0].solk";
connectAttr ":defaultLightSet.msg" "lightLinker1.slnk[1].sllk";
connectAttr ":initialParticleSE.msg" "lightLinker1.slnk[1].solk";
connectAttr ":defaultLightSet.msg" "lightLinker1.slnk[2].sllk";
connectAttr "arcane_sym.msg" "lightLinker1.slnk[2].solk";
connectAttr ":defaultLightSet.msg" "lightLinker1.slnk[5].sllk";
connectAttr "pasted__fluidShape1SG.msg" "lightLinker1.slnk[5].solk";
connectAttr ":defaultLightSet.msg" "lightLinker1.slnk[30].sllk";
connectAttr "pasted__fluidShape1SG1.msg" "lightLinker1.slnk[30].solk";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "file1.oc" "arcane_sym_lam.c";
connectAttr "file1.ot" "arcane_sym_lam.it";
connectAttr "arcane_sym_lam.oc" "arcane_sym.ss";
connectAttr "Arcane_TitleShape.iog.og[0]" "arcane_sym.dsm" -na;
connectAttr "groupId1.msg" "arcane_sym.gn" -na;
connectAttr "arcane_sym.msg" "materialInfo1.sg";
connectAttr "arcane_sym_lam.msg" "materialInfo1.m";
connectAttr "file1.msg" "materialInfo1.t" -na;
connectAttr "place2dTexture1.c" "file1.c";
connectAttr "place2dTexture1.tf" "file1.tf";
connectAttr "place2dTexture1.rf" "file1.rf";
connectAttr "place2dTexture1.mu" "file1.mu";
connectAttr "place2dTexture1.mv" "file1.mv";
connectAttr "place2dTexture1.s" "file1.s";
connectAttr "place2dTexture1.wu" "file1.wu";
connectAttr "place2dTexture1.wv" "file1.wv";
connectAttr "place2dTexture1.re" "file1.re";
connectAttr "place2dTexture1.of" "file1.of";
connectAttr "place2dTexture1.r" "file1.ro";
connectAttr "place2dTexture1.n" "file1.n";
connectAttr "place2dTexture1.vt1" "file1.vt1";
connectAttr "place2dTexture1.vt2" "file1.vt2";
connectAttr "place2dTexture1.vt3" "file1.vt3";
connectAttr "place2dTexture1.vc1" "file1.vc1";
connectAttr "place2dTexture1.o" "file1.uv";
connectAttr "place2dTexture1.ofs" "file1.fs";
connectAttr "pasted__fluidShape1SG.msg" "pasted__materialInfo1.sg";
connectAttr "pasted__fluidShape1SG1.msg" "pasted__materialInfo2.sg";
connectAttr "layerManager.dli[1]" "Main_Layer.id";
connectAttr "layerManager.dli[2]" "SC_1_to_3_Layer.id";
connectAttr "layerManager.dli[3]" "SC_4_to_6_Layer.id";
connectAttr "layerManager.dli[4]" "SC_7_to_9_Layer.id";
connectAttr "skinCluster1GroupParts.og" "skinCluster1.ip[0].ig";
connectAttr "skinCluster1GroupId.id" "skinCluster1.ip[0].gi";
connectAttr "bindPose1.msg" "skinCluster1.bp";
connectAttr "Arcane_Title_Skeleton.wm" "skinCluster1.ma[0]";
connectAttr "Main_Circle.wm" "skinCluster1.ma[1]";
connectAttr "SC_1_Orbit.wm" "skinCluster1.ma[2]";
connectAttr "SC_1_Axis.wm" "skinCluster1.ma[3]";
connectAttr "SC_2_Orbit.wm" "skinCluster1.ma[4]";
connectAttr "SC_2_Axis.wm" "skinCluster1.ma[5]";
connectAttr "SC_3_Orbit.wm" "skinCluster1.ma[6]";
connectAttr "SC_3_Axis.wm" "skinCluster1.ma[7]";
connectAttr "SC_4_Orbit.wm" "skinCluster1.ma[8]";
connectAttr "SC_4_Axis.wm" "skinCluster1.ma[9]";
connectAttr "SC_5_Orbit.wm" "skinCluster1.ma[10]";
connectAttr "SC_5_Axis.wm" "skinCluster1.ma[11]";
connectAttr "SC_6_Orbit.wm" "skinCluster1.ma[12]";
connectAttr "SC_6_Axis.wm" "skinCluster1.ma[13]";
connectAttr "SC_7_Orbit.wm" "skinCluster1.ma[14]";
connectAttr "SC_7_Axis.wm" "skinCluster1.ma[15]";
connectAttr "SC_8_Orbit.wm" "skinCluster1.ma[16]";
connectAttr "SC_8_Axis.wm" "skinCluster1.ma[17]";
connectAttr "SC_9_Orbit.wm" "skinCluster1.ma[18]";
connectAttr "SC_9_Axis.wm" "skinCluster1.ma[19]";
connectAttr "Arcane_Title_Skeleton.liw" "skinCluster1.lw[0]";
connectAttr "Main_Circle.liw" "skinCluster1.lw[1]";
connectAttr "SC_1_Orbit.liw" "skinCluster1.lw[2]";
connectAttr "SC_1_Axis.liw" "skinCluster1.lw[3]";
connectAttr "SC_2_Orbit.liw" "skinCluster1.lw[4]";
connectAttr "SC_2_Axis.liw" "skinCluster1.lw[5]";
connectAttr "SC_3_Orbit.liw" "skinCluster1.lw[6]";
connectAttr "SC_3_Axis.liw" "skinCluster1.lw[7]";
connectAttr "SC_4_Orbit.liw" "skinCluster1.lw[8]";
connectAttr "SC_4_Axis.liw" "skinCluster1.lw[9]";
connectAttr "SC_5_Orbit.liw" "skinCluster1.lw[10]";
connectAttr "SC_5_Axis.liw" "skinCluster1.lw[11]";
connectAttr "SC_6_Orbit.liw" "skinCluster1.lw[12]";
connectAttr "SC_6_Axis.liw" "skinCluster1.lw[13]";
connectAttr "SC_7_Orbit.liw" "skinCluster1.lw[14]";
connectAttr "SC_7_Axis.liw" "skinCluster1.lw[15]";
connectAttr "SC_8_Orbit.liw" "skinCluster1.lw[16]";
connectAttr "SC_8_Axis.liw" "skinCluster1.lw[17]";
connectAttr "SC_9_Orbit.liw" "skinCluster1.lw[18]";
connectAttr "SC_9_Axis.liw" "skinCluster1.lw[19]";
connectAttr "SC_9_Axis.msg" "skinCluster1.ptt";
connectAttr "Arcane_TitleShapeOrig.w" "groupParts1.ig";
connectAttr "groupId1.id" "groupParts1.gi";
connectAttr "groupParts3.og" "tweak1.ip[0].ig";
connectAttr "groupId3.id" "tweak1.ip[0].gi";
connectAttr "skinCluster1GroupId.msg" "skinCluster1Set.gn" -na;
connectAttr "Arcane_TitleShape.iog.og[1]" "skinCluster1Set.dsm" -na;
connectAttr "skinCluster1.msg" "skinCluster1Set.ub[0]";
connectAttr "tweak1.og[0]" "skinCluster1GroupParts.ig";
connectAttr "skinCluster1GroupId.id" "skinCluster1GroupParts.gi";
connectAttr "groupId3.msg" "tweakSet1.gn" -na;
connectAttr "Arcane_TitleShape.iog.og[2]" "tweakSet1.dsm" -na;
connectAttr "tweak1.msg" "tweakSet1.ub[0]";
connectAttr "groupParts1.og" "groupParts3.ig";
connectAttr "groupId3.id" "groupParts3.gi";
connectAttr "Arcane_Title_Skeleton.msg" "bindPose1.m[0]";
connectAttr "Main_Circle.msg" "bindPose1.m[1]";
connectAttr "SC_1_Orbit.msg" "bindPose1.m[2]";
connectAttr "SC_1_Axis.msg" "bindPose1.m[3]";
connectAttr "SC_2_Orbit.msg" "bindPose1.m[4]";
connectAttr "SC_2_Axis.msg" "bindPose1.m[5]";
connectAttr "SC_3_Orbit.msg" "bindPose1.m[6]";
connectAttr "SC_3_Axis.msg" "bindPose1.m[7]";
connectAttr "SC_4_Orbit.msg" "bindPose1.m[8]";
connectAttr "SC_4_Axis.msg" "bindPose1.m[9]";
connectAttr "SC_5_Orbit.msg" "bindPose1.m[10]";
connectAttr "SC_5_Axis.msg" "bindPose1.m[11]";
connectAttr "SC_6_Orbit.msg" "bindPose1.m[12]";
connectAttr "SC_6_Axis.msg" "bindPose1.m[13]";
connectAttr "SC_7_Orbit.msg" "bindPose1.m[14]";
connectAttr "SC_7_Axis.msg" "bindPose1.m[15]";
connectAttr "SC_8_Orbit.msg" "bindPose1.m[16]";
connectAttr "SC_8_Axis.msg" "bindPose1.m[17]";
connectAttr "SC_9_Orbit.msg" "bindPose1.m[18]";
connectAttr "SC_9_Axis.msg" "bindPose1.m[19]";
connectAttr "bindPose1.w" "bindPose1.p[0]";
connectAttr "bindPose1.m[0]" "bindPose1.p[1]";
connectAttr "bindPose1.m[0]" "bindPose1.p[2]";
connectAttr "bindPose1.m[2]" "bindPose1.p[3]";
connectAttr "bindPose1.m[0]" "bindPose1.p[4]";
connectAttr "bindPose1.m[4]" "bindPose1.p[5]";
connectAttr "bindPose1.m[0]" "bindPose1.p[6]";
connectAttr "bindPose1.m[6]" "bindPose1.p[7]";
connectAttr "bindPose1.m[0]" "bindPose1.p[8]";
connectAttr "bindPose1.m[8]" "bindPose1.p[9]";
connectAttr "bindPose1.m[0]" "bindPose1.p[10]";
connectAttr "bindPose1.m[10]" "bindPose1.p[11]";
connectAttr "bindPose1.m[0]" "bindPose1.p[12]";
connectAttr "bindPose1.m[12]" "bindPose1.p[13]";
connectAttr "bindPose1.m[0]" "bindPose1.p[14]";
connectAttr "bindPose1.m[14]" "bindPose1.p[15]";
connectAttr "bindPose1.m[0]" "bindPose1.p[16]";
connectAttr "bindPose1.m[16]" "bindPose1.p[17]";
connectAttr "bindPose1.m[0]" "bindPose1.p[18]";
connectAttr "bindPose1.m[18]" "bindPose1.p[19]";
connectAttr "Arcane_Title_Skeleton.bps" "bindPose1.wm[0]";
connectAttr "Main_Circle.bps" "bindPose1.wm[1]";
connectAttr "SC_1_Orbit.bps" "bindPose1.wm[2]";
connectAttr "SC_1_Axis.bps" "bindPose1.wm[3]";
connectAttr "SC_2_Orbit.bps" "bindPose1.wm[4]";
connectAttr "SC_2_Axis.bps" "bindPose1.wm[5]";
connectAttr "SC_3_Orbit.bps" "bindPose1.wm[6]";
connectAttr "SC_3_Axis.bps" "bindPose1.wm[7]";
connectAttr "SC_4_Orbit.bps" "bindPose1.wm[8]";
connectAttr "SC_4_Axis.bps" "bindPose1.wm[9]";
connectAttr "SC_5_Orbit.bps" "bindPose1.wm[10]";
connectAttr "SC_5_Axis.bps" "bindPose1.wm[11]";
connectAttr "SC_6_Orbit.bps" "bindPose1.wm[12]";
connectAttr "SC_6_Axis.bps" "bindPose1.wm[13]";
connectAttr "SC_7_Orbit.bps" "bindPose1.wm[14]";
connectAttr "SC_7_Axis.bps" "bindPose1.wm[15]";
connectAttr "SC_8_Orbit.bps" "bindPose1.wm[16]";
connectAttr "SC_8_Axis.bps" "bindPose1.wm[17]";
connectAttr "SC_9_Orbit.bps" "bindPose1.wm[18]";
connectAttr "SC_9_Axis.bps" "bindPose1.wm[19]";
connectAttr "makeNurbCircle1.oc" "transformGeometry1.ig";
connectAttr "transformGeometry1.og" "transformGeometry2.ig";
connectAttr "transformGeometry2.og" "transformGeometry3.ig";
connectAttr "circle_3.Orbit" "expression1.in[0]";
connectAttr ":time1.o" "expression1.tim";
connectAttr "SC_3_Orbit.msg" "expression1.obm";
connectAttr "expression1.out[0]" "unitConversion1.i";
connectAttr "circle_6.Orbit" "expression2.in[0]";
connectAttr ":time1.o" "expression2.tim";
connectAttr "SC_6_Orbit.msg" "expression2.obm";
connectAttr "expression2.out[0]" "unitConversion2.i";
connectAttr "circle_7.Orbit" "expression3.in[0]";
connectAttr ":time1.o" "expression3.tim";
connectAttr "SC_7_Orbit.msg" "expression3.obm";
connectAttr "expression3.out[0]" "unitConversion3.i";
connectAttr "circle_2.Orbit" "expression4.in[0]";
connectAttr ":time1.o" "expression4.tim";
connectAttr "SC_2_Orbit.msg" "expression4.obm";
connectAttr "expression4.out[0]" "unitConversion4.i";
connectAttr "circle_8.Orbit" "expression5.in[0]";
connectAttr ":time1.o" "expression5.tim";
connectAttr "SC_8_Orbit.msg" "expression5.obm";
connectAttr "expression5.out[0]" "unitConversion5.i";
connectAttr "circle_5.Orbit" "expression6.in[0]";
connectAttr ":time1.o" "expression6.tim";
connectAttr "SC_5_Orbit.msg" "expression6.obm";
connectAttr "expression6.out[0]" "unitConversion6.i";
connectAttr "circle_9.Orbit" "expression7.in[0]";
connectAttr ":time1.o" "expression7.tim";
connectAttr "SC_9_Orbit.msg" "expression7.obm";
connectAttr "expression7.out[0]" "unitConversion7.i";
connectAttr "circle_1.Orbit" "expression8.in[0]";
connectAttr ":time1.o" "expression8.tim";
connectAttr "circle_1.msg" "expression8.obm";
connectAttr "expression8.out[0]" "unitConversion8.i";
connectAttr "circle_4.Orbit" "expression9.in[0]";
connectAttr ":time1.o" "expression9.tim";
connectAttr "SC_4_Orbit.msg" "expression9.obm";
connectAttr "expression9.out[0]" "unitConversion9.i";
connectAttr "Main_Circle_orientConstraint1.cry" "pairBlend2.iry2";
connectAttr "Main_Circle.blendOrient1" "pairBlend2.w";
connectAttr "pairBlend2_inRotateY1.o" "pairBlend2.iry1";
connectAttr "unitConversion8.o" "pairBlend3.iry2";
connectAttr "SC_1_Orbit.blendUnitConversion8" "pairBlend3.w";
connectAttr "pairBlend3_inRotateY1.o" "pairBlend3.iry1";
connectAttr "SC_1_Axis_orientConstraint1.cry" "pairBlend4.iry2";
connectAttr "SC_1_Axis.blendOrient1" "pairBlend4.w";
connectAttr "pairBlend4_inRotateY1.o" "pairBlend4.iry1";
connectAttr "unitConversion4.o" "pairBlend5.iry2";
connectAttr "SC_2_Orbit.blendUnitConversion4" "pairBlend5.w";
connectAttr "pairBlend5_inRotateY1.o" "pairBlend5.iry1";
connectAttr "SC_2_Axis_orientConstraint1.cry" "pairBlend6.iry2";
connectAttr "SC_2_Axis.blendOrient1" "pairBlend6.w";
connectAttr "pairBlend6_inRotateY1.o" "pairBlend6.iry1";
connectAttr "unitConversion1.o" "pairBlend7.iry2";
connectAttr "SC_3_Orbit.blendUnitConversion1" "pairBlend7.w";
connectAttr "pairBlend7_inRotateY1.o" "pairBlend7.iry1";
connectAttr "unitConversion9.o" "pairBlend8.iry2";
connectAttr "SC_4_Orbit.blendUnitConversion9" "pairBlend8.w";
connectAttr "pairBlend8_inRotateY1.o" "pairBlend8.iry1";
connectAttr "SC_4_Axis_orientConstraint1.cry" "pairBlend9.iry2";
connectAttr "SC_4_Axis.blendOrient1" "pairBlend9.w";
connectAttr "pairBlend9_inRotateY1.o" "pairBlend9.iry1";
connectAttr "unitConversion6.o" "pairBlend10.iry2";
connectAttr "SC_5_Orbit.blendUnitConversion6" "pairBlend10.w";
connectAttr "pairBlend10_inRotateY1.o" "pairBlend10.iry1";
connectAttr "SC_5_Axis_orientConstraint1.cry" "pairBlend11.iry2";
connectAttr "SC_5_Axis.blendOrient1" "pairBlend11.w";
connectAttr "pairBlend11_inRotateY1.o" "pairBlend11.iry1";
connectAttr "unitConversion2.o" "pairBlend12.iry2";
connectAttr "SC_6_Orbit.blendUnitConversion2" "pairBlend12.w";
connectAttr "pairBlend12_inRotateY1.o" "pairBlend12.iry1";
connectAttr "SC_6_Axis_orientConstraint1.cry" "pairBlend13.iry2";
connectAttr "SC_6_Axis.blendOrient1" "pairBlend13.w";
connectAttr "pairBlend13_inRotateY1.o" "pairBlend13.iry1";
connectAttr "unitConversion3.o" "pairBlend14.iry2";
connectAttr "SC_7_Orbit.blendUnitConversion3" "pairBlend14.w";
connectAttr "pairBlend14_inRotateY1.o" "pairBlend14.iry1";
connectAttr "SC_7_Axis_orientConstraint1.cry" "pairBlend15.iry2";
connectAttr "SC_7_Axis.blendOrient1" "pairBlend15.w";
connectAttr "pairBlend15_inRotateY1.o" "pairBlend15.iry1";
connectAttr "unitConversion5.o" "pairBlend16.iry2";
connectAttr "SC_8_Orbit.blendUnitConversion5" "pairBlend16.w";
connectAttr "pairBlend16_inRotateY1.o" "pairBlend16.iry1";
connectAttr "SC_8_Axis_orientConstraint1.cry" "pairBlend17.iry2";
connectAttr "SC_8_Axis.blendOrient1" "pairBlend17.w";
connectAttr "pairBlend17_inRotateY1.o" "pairBlend17.iry1";
connectAttr "unitConversion7.o" "pairBlend18.iry2";
connectAttr "SC_9_Orbit.blendUnitConversion7" "pairBlend18.w";
connectAttr "pairBlend18_inRotateY1.o" "pairBlend18.iry1";
connectAttr "SC_9_Axis_orientConstraint1.cry" "pairBlend19.iry2";
connectAttr "SC_9_Axis.blendOrient1" "pairBlend19.w";
connectAttr "pairBlend19_inRotateY1.o" "pairBlend19.iry1";
connectAttr "camera_joint_pointConstraint1.ctx" "pairBlend20.itx2";
connectAttr "camera_joint_pointConstraint1.cty" "pairBlend20.ity2";
connectAttr "camera_joint_pointConstraint1.ctz" "pairBlend20.itz2";
connectAttr "camera_joint.blendPoint1" "pairBlend20.w";
connectAttr "pairBlend20_inTranslateX1.o" "pairBlend20.itx1";
connectAttr "pairBlend20_inTranslateY1.o" "pairBlend20.ity1";
connectAttr "pairBlend20_inTranslateZ1.o" "pairBlend20.itz1";
connectAttr "camera_joint_orientConstraint1.crx" "pairBlend21.irx2";
connectAttr "camera_joint_orientConstraint1.crz" "pairBlend21.irz2";
connectAttr "camera_joint.blendOrient1" "pairBlend21.w";
connectAttr "pairBlend21_inRotateX1.o" "pairBlend21.irx1";
connectAttr "pairBlend21_inRotateZ1.o" "pairBlend21.irz1";
connectAttr "SC_3_Axis_orientConstraint1.cry" "pairBlend22.iry2";
connectAttr "pairBlend22_inRotateY1.o" "pairBlend22.iry1";
connectAttr "arcane_sym.pa" ":renderPartition.st" -na;
connectAttr "pasted__fluidShape1SG.pa" ":renderPartition.st" -na;
connectAttr "pasted__fluidShape1SG1.pa" ":renderPartition.st" -na;
connectAttr "arcane_sym_lam.msg" ":defaultShaderList1.s" -na;
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "lightLinker1.msg" ":lightList1.ln" -na;
connectAttr "file1.msg" ":defaultTextureList1.tx" -na;
// End of Arcane_Circle_Rigged - Copy.ma
