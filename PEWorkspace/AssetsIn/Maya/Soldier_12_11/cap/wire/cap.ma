//Maya ASCII 2009 scene
//Name: cap.ma
//Last modified: Sun, Dec 13, 2009 06:05:30 AM
//Codeset: 1252
requires maya "2009";
currentUnit -l centimeter -a degree -t ntsc;
fileInfo "application" "maya";
fileInfo "product" "Maya Unlimited 2009";
fileInfo "version" "2009";
fileInfo "cutIdentifier" "200809110030-734661";
fileInfo "osv" "Microsoft Windows Vista  (Build 7600)\n";
createNode transform -n "pcap";
	setAttr ".rp" -type "double3" 0 0 -2.2204460492503131e-016 ;
	setAttr ".sp" -type "double3" 0 0 -2.2204460492503131e-016 ;
createNode mesh -n "cap" -p "pcap";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -max 12 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 159 ".uvst[0].uvsp[0:158]" -type "float2" 0.83792591 0.21702597 
		0.88081145 0.17816032 0.881598 0.09781912 0.83821261 0.11626013 0.9214595 0.14725877 
		0.92225033 0.08313185 0.96108496 0.073593482 -0.00081431866 0.12869398 -0.0009624362 
		0.078570202 0.037736982 0.13512751 0.036996216 0.081421807 0.077055156 0.15441208 
		0.075885296 0.090301692 0.11788362 0.18462338 0.11662224 0.10429953 0.16099674 0.2227605 
		0.16011432 0.12200455 0.20719385 0.26504928 0.20718732 0.14164045 0.25724992 0.30730623 
		0.25843477 0.16124021 0.31178308 0.34534663 0.31400701 0.17884286 0.37099117 0.37540057 
		0.37344337 0.19268309 0.43427917 0.39448291 0.43570423 0.20136417 0.49999541 0.40068626 
		0.49941406 0.20399766 0.56567204 0.39336979 0.56310546 0.20028491 0.6288442 0.37321621 
		0.62531197 0.19054939 0.68787169 0.34216058 0.68466365 0.17570291 0.74217737 0.30319822 
		0.74012917 0.15715957 0.79198116 0.26009533 0.7912581 0.13669254 0.82981801 0.51893103 
		0.87370521 0.4503583 0.91633117 0.39587229 -0.00013977289 0.35690624 0.041541666 
		0.36853161 0.083652556 0.40291479 0.12659842 0.45668569 0.17088893 0.52451146 0.21717504 
		0.59972435 0.2662586 0.67493153 0.26623821 0.67397273 0.26622882 0.67353046 0.2661919 
		0.67179322 0.26753816 0.67273831 0.31744564 0.64614999 0.3741855 0.62511802 0.43589646 
		0.6117239 0.50060463 0.60679305 0.56533921 0.61062652 0.62712646 0.62297535 0.6839869 
		0.64304405 0.7340498 0.66878718 0.7353909 0.66781843 0.7353642 0.66955698 0.73535746 
		0.66999865 0.73534274 0.67095941 0.7839793 0.59493172 0.88071477 0.056017265 0.83706558 
		0.074462906 0.92162931 0.041326895 0.96071625 0.03178969 -0.0010859966 0.036764354 
		0.037117809 0.039613083 0.076259166 0.048486769 0.11725816 0.062484801 0.16101411 
		0.080189228 0.20832381 0.099822298 0.25972462 0.11942233 0.31528571 0.13702433 0.35199445 
		0.11358629 0.4083645 0.074990854 0.16453362 0.82777905 0.29094255 0.74218762 0.31313628 
		0.78574514 0.25637507 0.70762014 0.21281755 0.68542641 0.16453362 0.67777902 0.11624968 
		0.68542647 0.072692156 0.70762014 0.038124681 0.74218762 0.01593098 0.78574514 0.0082835853 
		0.83402908 0.01593098 0.88231301 0.038124681 0.92587054 0.072692156 0.96043801 0.11624971 
		0.98263168 0.16453362 0.99027908 0.21281755 0.98263168 0.25637507 0.96043801 0.29094255 
		0.92587054 0.31313622 0.88231301 0.32078362 0.83402908 0.70221126 0.75190854 0.73677874 
		0.71734107 0.78033626 0.6951474 0.8286202 0.68749994 0.87690413 0.69514734 0.92046165 
		0.71734107 0.95502913 0.75190854 0.40890446 0.033177689 0.35292894 0.071770683 0.73677874 
		0.71734107 0.70221126 0.75190854 0.46022391 0.050843418 0.78033626 0.6951474 0.46035233 
		0.0090337694 0.8286202 0.68749994 0.49897295 0.054717466 0.87690413 0.69514734 0.49884939 
		0.012909949 0.92046165 0.71734107 0.53769732 0.050187111 0.95502913 0.75190854 0.53732175 
		0.0083800852 0.58969688 0.073454708 0.5889098 0.031652808 0.64629233 0.11109319 0.64511096 
		0.069294661 0.73859215 0.11536321 0.68313807 0.13390729 0.78987443 0.094894111 0.26903588 
		0.67378169 0.31785545 0.67077202 0.37745956 0.68068671 0.43791735 0.67883205 0.50081468 
		0.67784226 0.56371534 0.67776722 0.62418115 0.67859674 0.68372256 0.66767263 0.73255795 
		0.66985506 0.31841177 0.70488685 0.37538329 0.73063672 0.4368158 0.74680805 0.50103378 
		0.75198841 0.56521869 0.74571955 0.62655216 0.72850907 0.68336791 0.70179516 0.68298972 
		0.73960948 0.31901348 0.74270105 0.36311555 0.7727499 0.42955285 0.80693686 0.50119269 
		0.80575871 0.5728367 0.80572224 0.63906837 0.77041388 0.99917316 0.1202227 0.96066165 
		0.12730902 0.95823658 0.36076677 0.99984771 0.34843493 0.99902505 0.070098951 0.99890149 
		0.028293043;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".op" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 126 ".pt[0:125]" -type "float3"  -107.38287 -170.08577 -1.3071193 
		-107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 
		-1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 
		-170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 
		-107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 
		-1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 
		-170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 
		-107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 
		-1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 
		-170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 
		-107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 
		-1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 
		-170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 
		-107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 
		-1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 
		-170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 
		-107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 
		-1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 
		-170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 
		-107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 
		-1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 
		-170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 
		-107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 
		-1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 
		-170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 
		-107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 
		-1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 
		-170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 
		-107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 
		-1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 
		-170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 
		-107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 
		-1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 
		-170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 
		-107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 
		-1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 
		-170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 
		-107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 
		-1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 
		-170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 
		-107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 
		-1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 
		-170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 
		-107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 
		-1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 
		-170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 
		-107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 
		-1.3071193 -107.38287 -170.08577 -1.3071193 -107.38287 -170.08577 -1.3071193;
	setAttr -s 126 ".vt[0:125]"  115.89853 177.8252 -2.1703086 114.50591 
		177.56053 -5.7562389 112.33685 177.35048 -8.6020517 109.60369 177.21562 -10.429173 
		106.57394 177.16917 -11.058756 103.54422 177.21562 -10.429173 100.81104 177.35048 
		-8.6020489 98.642006 177.56052 -5.7562366 97.249397 177.8252 -2.1703084 96.769524 
		178.11856 1.8047253 97.249397 178.41194 5.7797604 98.642006 178.67659 9.3656893 100.81104 
		178.88663 12.2115 103.54422 179.02145 14.038618 106.57394 179.06796 14.668202 109.60369 
		179.02145 14.038618 112.33685 178.88663 12.211487 114.5059 178.67659 9.3656893 115.89853 
		178.41194 5.7797604 116.37839 178.11856 1.8047271 115.89853 175.11588 -2.3305721 
		114.50591 175.19835 -5.7794218 112.33685 175.26382 -8.5164452 109.60369 175.30588 
		-10.273722 106.57394 175.32034 -10.879237 103.54422 175.30586 -10.273719 100.81104 
		175.26382 -8.516449 98.642006 175.19835 -5.7794204 97.249397 175.11588 -2.3305714 
		96.769524 175.0244 1.492507 97.249397 174.93294 5.3155842 98.642006 174.85045 8.7644339 
		100.81104 174.78497 11.501457 103.54422 174.74294 13.258731 106.57394 174.72844 13.864246 
		109.60369 174.74294 13.258731 112.33685 174.78497 11.501457 114.5059 174.85045 8.7644339 
		115.89853 174.93294 5.3155832 116.37839 175.0244 1.4925071 117.06636 181.7993 -2.6210511 
		114.9838 181.28352 -6.3802085 106.68774 182.52121 2.9950025 112.08922 180.88884 -9.2216349 
		108.66586 180.65388 -10.867236 105.04885 180.60165 -11.155856 101.59231 180.73743 
		-10.059344 98.63456 181.04752 -7.6848898 96.465111 181.50218 -4.2651186 95.296265 
		182.05638 -0.13461582 95.242538 182.6561 4.3022637 96.309151 183.24294 8.6110716 
		97.713898 183.75902 12.370186 100.17176 184.0603 14.618857 103.1572 184.18631 15.587773 
		106.54612 184.20898 16.043165 110.95813 184.10277 15.023491 114.10725 184.03351 13.229433 
		116.91042 183.54018 10.255126 118.07925 182.98589 6.1246023 118.133 182.38597 1.6878541 
		115.89854 174.40421 -2.3475864 114.50593 174.48669 -5.7964487 112.33685 174.55215 
		-8.5334702 109.60369 174.59424 -10.290741 106.57394 174.60872 -10.896257 103.54422 
		174.59421 -10.290742 100.81104 174.55212 -8.5334692 98.642006 174.48669 -5.7964487 
		97.249374 174.40421 -2.3475921 96.769524 174.31274 1.4754806 97.249397 174.22131 
		5.2985654 98.642021 174.13882 8.7474184 100.81104 174.07332 11.484433 103.54422 174.03128 
		13.241709 106.57394 174.0168 13.847221 109.60369 174.03125 13.241709 112.33685 174.07332 
		11.48443 114.5059 174.13881 8.747407 115.89853 174.22127 5.2985563 116.37839 174.3127 
		1.4754825 98.642006 173.41815 11.622309 100.81104 172.37564 15.079659 100.81104 171.664 
		15.062637 98.642021 172.70651 11.605294 103.54422 171.54919 18.800457 103.54422 170.83754 
		18.783434 106.57394 171.40977 20.662992 106.57394 170.69815 20.645967 109.60369 171.54919 
		18.800457 109.60369 170.83749 18.783434 112.33685 172.37564 15.079659 112.33685 171.66397 
		15.062633 114.5059 173.41815 11.622309 114.5059 172.70651 11.605286 96.314171 183.22002 
		8.6027079 97.591057 181.24405 10.978603 100.21271 180.6158 13.574442 103.28006 180.22232 
		15.200267 106.57394 180.07578 15.871215 109.86785 180.22231 15.200272 112.93523 180.6158 
		13.57445 115.55685 181.24403 10.978663 118.07192 182.96312 6.1176453 96.312584 183.22729 
		8.6053486 97.505043 181.64931 11.11648 100.10958 181.50346 14.140658 103.21371 181.29669 
		15.859221 106.57394 181.2261 16.446129 109.9342 181.29672 15.859237 113.03835 181.50346 
		14.140666 115.64287 181.64931 11.116549 118.07423 182.97029 6.1198373 96.320412 183.19165 
		8.5923367 118.06284 182.93489 6.1090188 96.3815 183.19038 8.6929007 118.02598 182.9348 
		6.2208095 97.385857 182.21082 11.307508 99.959869 182.34515 14.233721 103.11583 182.43062 
		16.095501 106.57394 182.45995 16.734198 110.0321 182.43065 16.095512 113.18805 182.34515 
		14.233728 115.76206 182.2108 11.307585 96.449593 183.18898 8.8037634 117.98462 182.93465 
		6.3442039;
	setAttr -s 355 ".ed";
	setAttr ".ed[0:165]"  0 1 1 1 2 1 2 3 
		1 3 4 1 4 5 1 5 6 1 6 7 
		1 7 8 1 8 9 1 9 10 1 10 11 
		1 11 12 1 12 13 1 13 14 1 14 15 
		1 15 16 1 16 17 1 17 18 1 18 19 
		1 19 0 1 20 21 1 21 22 1 22 23 
		1 23 24 1 24 25 1 25 26 1 26 27 
		1 27 28 1 28 29 1 29 30 1 30 31 
		1 31 32 1 32 33 1 33 34 1 34 35 
		1 35 36 1 36 37 1 37 38 1 38 39 
		1 39 20 1 0 20 1 1 21 1 2 22 
		1 3 23 1 4 24 1 5 25 1 6 26 
		1 7 27 1 8 28 1 9 29 1 10 30 
		1 11 31 1 12 32 1 13 33 1 14 34 
		1 15 35 1 16 36 1 17 37 1 18 38 
		1 19 39 1 0 40 1 1 41 1 40 41 
		1 42 40 1 42 41 1 2 43 1 41 43 
		1 42 43 1 3 44 1 43 44 1 42 44 
		1 4 45 1 44 45 1 42 45 1 5 46 
		1 45 46 1 42 46 1 6 47 1 46 47 
		1 42 47 1 7 48 1 47 48 1 42 48 
		1 8 49 1 48 49 1 42 49 1 9 50 
		1 49 50 1 42 50 1 10 113 1 50 51 
		1 42 51 1 11 96 1 51 52 1 42 52 
		1 12 97 1 52 53 1 42 53 1 13 98 
		1 53 54 1 42 54 1 14 99 1 54 55 
		1 42 55 1 15 100 1 55 56 1 42 56 
		1 16 101 1 56 57 1 42 57 1 17 102 
		1 57 58 1 42 58 1 18 114 1 58 59 
		1 42 59 1 19 60 1 59 60 1 42 60 
		1 60 40 1 20 61 1 21 62 1 61 62 
		0 22 63 1 62 63 0 23 64 1 63 64 
		0 24 65 1 64 65 0 25 66 1 65 66 
		0 26 67 1 66 67 0 27 68 1 67 68 
		0 28 69 1 68 69 0 29 70 1 69 70 
		0 30 71 1 70 71 0 31 72 1 71 72 
		0 72 73 0 73 74 0 74 75 0 75 76 
		0 76 77 0 37 78 1 77 78 0 38 79 
		1 78 79 0 39 80 1 79 80 0 80 61 
		0 31 81 1 32 82 1 81 82 1 73 83 
		1 82 83 1 72 84 1 84 83 1 81 84 
		1 33 85 1 82 85 1 74 86 1;
	setAttr ".ed[166:331]" 85 86 1 83 86 1 34 87 
		1 85 87 1 75 88 1 87 88 1 86 88 
		1 35 89 1 87 89 1 76 90 1 89 90 
		1 88 90 1 36 91 1 89 91 1 77 92 
		1 91 92 1 90 92 1 37 93 1 91 93 
		1 78 94 1 93 94 1 92 94 1 95 104 
		1 96 105 1 97 106 1 98 107 1 99 108 
		1 100 109 1 101 110 1 102 111 1 103 112 
		1 95 115 1 96 97 1 97 98 1 98 99 
		1 99 100 1 100 101 1 101 102 1 102 116 
		1 104 51 1 105 117 1 106 118 1 107 119 
		1 108 120 1 109 121 1 110 122 1 111 123 
		1 112 59 1 104 124 1 105 106 1 106 107 
		1 107 108 1 108 109 1 109 110 1 110 111 
		1 111 125 1 113 95 1 114 103 1 115 96 
		1 116 103 1 117 52 1 118 53 1 119 54 
		1 120 55 1 121 56 1 122 57 1 123 58 
		1 124 105 1 125 112 1 113 115 1 116 114 
		1 115 124 1 116 125 1 124 117 1 117 118 
		1 118 119 1 119 120 1 120 121 1 121 122 
		1 122 123 1 125 123 1 1 20 1 2 21 
		1 23 2 1 24 3 1 5 24 1 6 25 
		1 27 6 1 28 7 1 29 8 1 30 9 
		1 31 10 1 32 11 1 33 12 1 34 13 
		1 15 34 1 16 35 1 17 36 1 18 37 
		1 19 38 1 0 39 1 0 41 1 41 2 
		1 43 3 1 44 4 1 45 5 1 46 6 
		1 47 7 1 48 8 1 49 9 1 50 10 
		1 104 50 1 95 50 1 113 50 1 113 11 
		1 115 11 1 96 12 1 97 13 1 98 14 
		1 14 100 1 15 101 1 16 102 1 18 116 
		1 116 17 1 114 19 1 19 59 1 19 112 
		1 19 103 1 19 40 1 21 61 1 22 62 
		1 23 63 1 24 64 1 25 65 1 26 66 
		1 27 67 1 28 68 1 29 69 1 30 70 
		1 31 71 1 82 84 1 85 83 1 87 86 
		1 90 87 1 92 89 1 94 91 1 38 78 
		1 39 79 1 20 80 1 32 81 1 84 73 
		1 81 72 1 33 82 1 83 74 1 34 85 
		1 86 75 1 89 34 1 75 90 1 91 35 
		1 76 92 1 93 36 1 78 93 1 77 94 
		1 115 105 1 105 97 1 106 98 1;
	setAttr ".ed[332:354]" 107 99 1 99 109 1 100 110 
		1 101 111 1 116 112 1 117 106 1 106 119 
		1 107 120 1 120 109 1 121 110 1 110 123 
		1 125 59 1 125 58 1 115 104 1 102 125 
		1 51 124 1 52 124 1 52 118 1 53 119 
		1 119 55 1 55 121 1 56 122 1 57 123 
		1;
	setAttr -s 230 ".fc[0:229]" -type "polyFaces" 
		f 3 0 247 -41 
		mu 0 3 0 1 3 
		f 3 -248 41 -21 
		mu 0 3 3 1 2 
		f 3 1 248 -42 
		mu 0 3 1 4 2 
		f 3 -249 42 -22 
		mu 0 3 2 4 5 
		f 3 43 249 2 
		mu 0 3 154 6 4 
		f 3 -250 -23 -43 
		mu 0 3 4 6 5 
		f 3 44 250 3 
		mu 0 3 153 157 154 
		f 3 -251 -24 -44 
		mu 0 3 154 157 6 
		f 3 4 251 -45 
		mu 0 3 7 9 8 
		f 3 -252 45 -25 
		mu 0 3 8 9 10 
		f 3 5 252 -46 
		mu 0 3 9 11 10 
		f 3 -253 46 -26 
		mu 0 3 10 11 12 
		f 3 47 253 6 
		mu 0 3 13 14 11 
		f 3 -254 -27 -47 
		mu 0 3 11 14 12 
		f 3 48 254 7 
		mu 0 3 15 16 13 
		f 3 -255 -28 -48 
		mu 0 3 13 16 14 
		f 3 49 255 8 
		mu 0 3 17 18 15 
		f 3 -256 -29 -49 
		mu 0 3 15 18 16 
		f 3 50 256 9 
		mu 0 3 19 20 17 
		f 3 -257 -30 -50 
		mu 0 3 17 20 18 
		f 3 51 257 10 
		mu 0 3 21 22 19 
		f 3 -258 -31 -51 
		mu 0 3 19 22 20 
		f 3 52 258 11 
		mu 0 3 23 24 21 
		f 3 -259 -32 -52 
		mu 0 3 21 24 22 
		f 3 53 259 12 
		mu 0 3 25 26 23 
		f 3 -260 -33 -53 
		mu 0 3 23 26 24 
		f 3 54 260 13 
		mu 0 3 27 28 25 
		f 3 -261 -34 -54 
		mu 0 3 25 28 26 
		f 3 14 261 -55 
		mu 0 3 27 29 28 
		f 3 -262 55 -35 
		mu 0 3 28 29 30 
		f 3 15 262 -56 
		mu 0 3 29 31 30 
		f 3 -263 56 -36 
		mu 0 3 30 31 32 
		f 3 16 263 -57 
		mu 0 3 31 33 32 
		f 3 -264 57 -37 
		mu 0 3 32 33 34 
		f 3 17 264 -58 
		mu 0 3 33 35 34 
		f 3 -265 58 -38 
		mu 0 3 34 35 36 
		f 3 18 265 -59 
		mu 0 3 35 37 36 
		f 3 -266 59 -39 
		mu 0 3 36 37 38 
		f 3 19 266 -60 
		mu 0 3 37 0 38 
		f 3 -267 40 -40 
		mu 0 3 38 0 3 
		f 3 -63 -64 64 
		mu 0 3 81 82 80 
		f 3 -67 -65 67 
		mu 0 3 83 81 80 
		f 3 -70 -68 70 
		mu 0 3 84 83 80 
		f 3 -73 -71 73 
		mu 0 3 85 84 80 
		f 3 -76 -74 76 
		mu 0 3 86 85 80 
		f 3 -79 -77 79 
		mu 0 3 87 86 80 
		f 3 -82 -80 82 
		mu 0 3 88 87 80 
		f 3 -85 -83 85 
		mu 0 3 89 88 80 
		f 3 -88 -86 88 
		mu 0 3 90 89 80 
		f 3 -91 -89 91 
		mu 0 3 91 90 80 
		f 3 -94 -92 94 
		mu 0 3 92 91 80 
		f 3 -97 -95 97 
		mu 0 3 93 92 80 
		f 3 -100 -98 100 
		mu 0 3 94 93 80 
		f 3 -103 -101 103 
		mu 0 3 95 94 80 
		f 3 -106 -104 106 
		mu 0 3 96 95 80 
		f 3 -109 -107 109 
		mu 0 3 97 96 80 
		f 3 -112 -110 112 
		mu 0 3 98 97 80 
		f 3 -115 -113 115 
		mu 0 3 99 98 80 
		f 3 -118 -116 118 
		mu 0 3 100 99 80 
		f 3 -120 -119 63 
		mu 0 3 82 100 80 
		f 3 -1 267 -62 
		mu 0 3 1 0 40 
		f 3 -268 60 62 
		mu 0 3 40 0 39 
		f 3 61 268 -2 
		mu 0 3 1 40 4 
		f 3 -269 66 -66 
		mu 0 3 4 40 41 
		f 3 65 269 -3 
		mu 0 3 4 41 154 
		f 3 -270 69 -69 
		mu 0 3 154 41 155 
		f 3 68 270 -4 
		mu 0 3 154 155 153 
		f 3 -271 72 -72 
		mu 0 3 153 155 156 
		f 3 71 271 -5 
		mu 0 3 7 42 9 
		f 3 -272 75 -75 
		mu 0 3 9 42 43 
		f 3 74 272 -6 
		mu 0 3 9 43 11 
		f 3 -273 78 -78 
		mu 0 3 11 43 44 
		f 3 77 273 -7 
		mu 0 3 11 44 13 
		f 3 -274 81 -81 
		mu 0 3 13 44 45 
		f 3 80 274 -8 
		mu 0 3 13 45 15 
		f 3 -275 84 -84 
		mu 0 3 15 45 46 
		f 3 83 275 -9 
		mu 0 3 15 46 17 
		f 3 -276 87 -87 
		mu 0 3 17 46 47 
		f 3 86 276 -10 
		mu 0 3 17 47 19 
		f 3 -206 277 90 
		mu 0 3 48 49 47 
		f 3 -189 278 -278 
		mu 0 3 49 50 47 
		f 3 -223 279 -279 
		mu 0 3 50 51 47 
		f 3 -277 -280 -90 
		mu 0 3 19 47 51 
		f 3 89 280 -11 
		mu 0 3 19 51 21 
		f 3 235 281 -281 
		mu 0 3 51 52 21 
		f 3 -282 224 -93 
		mu 0 3 21 52 53 
		f 3 92 282 -12 
		mu 0 3 21 53 23 
		f 3 -283 198 -96 
		mu 0 3 23 53 54 
		f 3 95 283 -13 
		mu 0 3 23 54 25 
		f 3 -284 199 -99 
		mu 0 3 25 54 55 
		f 3 98 284 -14 
		mu 0 3 25 55 27 
		f 3 -285 200 -102 
		mu 0 3 27 55 56 
		f 3 -15 285 -105 
		mu 0 3 29 27 57 
		f 3 -286 101 201 
		mu 0 3 57 27 56 
		f 3 -16 286 -108 
		mu 0 3 31 29 58 
		f 3 -287 104 202 
		mu 0 3 58 29 57 
		f 3 -17 287 -111 
		mu 0 3 33 31 59 
		f 3 -288 107 203 
		mu 0 3 59 31 58 
		f 3 -114 288 236 
		mu 0 3 61 35 60 
		f 3 204 289 110 
		mu 0 3 59 60 33 
		f 3 -18 -290 -289 
		mu 0 3 35 33 60 
		f 3 113 290 -19 
		mu 0 3 35 61 37 
		f 3 -117 291 117 
		mu 0 3 65 37 64 
		f 3 -292 292 213 
		mu 0 3 64 37 63 
		f 3 -293 293 196 
		mu 0 3 63 37 62 
		f 3 -291 223 -294 
		mu 0 3 37 61 62 
		f 3 -20 294 -61 
		mu 0 3 0 37 39 
		f 3 -295 116 119 
		mu 0 3 39 37 65 
		f 3 20 295 -121 
		mu 0 3 3 2 67 
		f 3 -296 121 -123 
		mu 0 3 67 2 66 
		f 3 21 296 -122 
		mu 0 3 2 5 66 
		f 3 -297 123 -125 
		mu 0 3 66 5 68 
		f 3 22 297 -124 
		mu 0 3 5 6 68 
		f 3 -298 125 -127 
		mu 0 3 68 6 69 
		f 3 23 298 -126 
		mu 0 3 6 157 69 
		f 3 -299 127 -129 
		mu 0 3 69 157 158 
		f 3 24 299 -128 
		mu 0 3 8 10 70 
		f 3 -300 129 -131 
		mu 0 3 70 10 71 
		f 3 25 300 -130 
		mu 0 3 10 12 71 
		f 3 -301 131 -133 
		mu 0 3 71 12 72 
		f 3 26 301 -132 
		mu 0 3 12 14 72 
		f 3 -302 133 -135 
		mu 0 3 72 14 73 
		f 3 27 302 -134 
		mu 0 3 14 16 73 
		f 3 -303 135 -137 
		mu 0 3 73 16 74 
		f 3 28 303 -136 
		mu 0 3 16 18 74 
		f 3 -304 137 -139 
		mu 0 3 74 18 75 
		f 3 29 304 -138 
		mu 0 3 18 20 75 
		f 3 -305 139 -141 
		mu 0 3 75 20 76 
		f 3 30 305 -140 
		mu 0 3 20 22 76 
		f 3 -306 141 -143 
		mu 0 3 76 22 77 
		f 3 157 306 -163 
		mu 0 3 78 79 109 
		f 3 -307 159 -162 
		mu 0 3 109 79 108 
		f 3 164 307 -160 
		mu 0 3 79 112 108 
		f 3 -308 166 -168 
		mu 0 3 108 112 114 
		f 3 169 308 -167 
		mu 0 3 112 116 114 
		f 3 -309 171 -173 
		mu 0 3 114 116 118 
		f 3 176 309 174 
		mu 0 3 120 122 116 
		f 3 -310 -178 -172 
		mu 0 3 116 122 118 
		f 3 181 310 179 
		mu 0 3 123 124 120 
		f 3 -311 -183 -177 
		mu 0 3 120 124 122 
		f 3 186 311 184 
		mu 0 3 125 126 123 
		f 3 -312 -188 -182 
		mu 0 3 123 126 124 
		f 3 37 312 -149 
		mu 0 3 34 36 128 
		f 3 -313 150 -152 
		mu 0 3 128 36 127 
		f 3 38 313 -151 
		mu 0 3 36 38 127 
		f 3 -314 152 -154 
		mu 0 3 127 38 129 
		f 3 39 314 -153 
		mu 0 3 38 3 129 
		f 3 -315 120 -155 
		mu 0 3 129 3 67 
		f 3 31 315 -156 
		mu 0 3 22 24 78 
		f 3 -316 156 -158 
		mu 0 3 78 24 79 
		f 3 160 316 -144 
		mu 0 3 101 111 102 
		f 3 -317 161 -159 
		mu 0 3 102 111 110 
		f 3 155 317 -142 
		mu 0 3 22 78 77 
		f 3 -318 162 -161 
		mu 0 3 77 78 109 
		f 3 32 318 -157 
		mu 0 3 24 26 79 
		f 3 -319 163 -165 
		mu 0 3 79 26 112 
		f 3 158 319 -145 
		mu 0 3 102 110 103 
		f 3 -320 167 -166 
		mu 0 3 103 110 113 
		f 3 33 320 -164 
		mu 0 3 26 28 112 
		f 3 -321 168 -170 
		mu 0 3 112 28 116 
		f 3 165 321 -146 
		mu 0 3 103 113 104 
		f 3 -322 172 -171 
		mu 0 3 104 113 115 
		f 3 173 322 34 
		mu 0 3 30 120 28 
		f 3 -323 -175 -169 
		mu 0 3 28 120 116 
		f 3 -147 323 -176 
		mu 0 3 105 104 117 
		f 3 -324 170 177 
		mu 0 3 117 104 115 
		f 3 178 324 35 
		mu 0 3 32 123 30 
		f 3 -325 -180 -174 
		mu 0 3 30 123 120 
		f 3 -148 325 -181 
		mu 0 3 106 105 119 
		f 3 -326 175 182 
		mu 0 3 119 105 117 
		f 3 183 326 36 
		mu 0 3 34 125 32 
		f 3 -327 -185 -179 
		mu 0 3 32 125 123 
		f 3 148 327 -184 
		mu 0 3 34 128 125 
		f 3 -328 185 -187 
		mu 0 3 125 128 126 
		f 3 -150 328 -186 
		mu 0 3 107 106 121 
		f 3 -329 180 187 
		mu 0 3 121 106 119 
		f 3 -225 329 -190 
		mu 0 3 53 52 131 
		f 3 -330 237 233 
		mu 0 3 131 52 130 
		f 3 189 330 -199 
		mu 0 3 53 131 54 
		f 3 -331 215 -191 
		mu 0 3 54 131 132 
		f 3 190 331 -200 
		mu 0 3 54 132 55 
		f 3 -332 216 -192 
		mu 0 3 55 132 133 
		f 3 191 332 -201 
		mu 0 3 55 133 56 
		f 3 -333 217 -193 
		mu 0 3 56 133 134 
		f 3 -202 333 -194 
		mu 0 3 57 56 135 
		f 3 -334 192 218 
		mu 0 3 135 56 134 
		f 3 -203 334 -195 
		mu 0 3 58 57 136 
		f 3 -335 193 219 
		mu 0 3 136 57 135 
		f 3 -204 335 -196 
		mu 0 3 59 58 137 
		f 3 -336 194 220 
		mu 0 3 137 58 136 
		f 3 -226 336 -197 
		mu 0 3 62 60 63 
		f 3 -337 238 234 
		mu 0 3 63 60 138 
		f 3 -234 239 -207 
		mu 0 3 131 130 139 
		f 3 206 337 -216 
		mu 0 3 131 139 132 
		f 3 -338 240 -208 
		mu 0 3 132 139 140 
		f 3 -217 338 -209 
		mu 0 3 133 132 141 
		f 3 -339 207 241 
		mu 0 3 141 132 140 
		f 3 -218 339 -210 
		mu 0 3 134 133 142 
		f 3 -340 208 242 
		mu 0 3 142 133 141 
		f 3 209 340 -219 
		mu 0 3 134 142 135 
		f 3 -341 243 -211 
		mu 0 3 135 142 143 
		f 3 210 341 -220 
		mu 0 3 135 143 136 
		f 3 -342 244 -212 
		mu 0 3 136 143 144 
		f 3 -221 342 -213 
		mu 0 3 137 136 145 
		f 3 -343 211 245 
		mu 0 3 145 136 144 
		f 3 -235 343 -214 
		mu 0 3 63 138 64 
		f 3 -344 344 114 
		mu 0 3 64 138 146 
		f 3 246 232 -345 
		mu 0 3 138 145 146 
		f 3 -236 222 197 
		mu 0 3 52 51 50 
		f 3 -237 225 -224 
		mu 0 3 61 60 62 
		f 3 -238 345 214 
		mu 0 3 130 52 49 
		f 3 -346 -198 188 
		mu 0 3 49 52 50 
		f 3 -205 346 -239 
		mu 0 3 60 59 138 
		f 3 -347 195 221 
		mu 0 3 138 59 137 
		f 3 205 347 -215 
		mu 0 3 49 48 130 
		f 3 93 348 -348 
		mu 0 3 48 147 130 
		f 3 -240 -349 -227 
		mu 0 3 139 130 147 
		f 3 226 349 -241 
		mu 0 3 139 147 140 
		f 3 -350 96 -228 
		mu 0 3 140 147 148 
		f 3 227 350 -242 
		mu 0 3 140 148 141 
		f 3 -351 99 -229 
		mu 0 3 141 148 149 
		f 3 -243 351 -230 
		mu 0 3 142 141 150 
		f 3 -352 228 102 
		mu 0 3 150 141 149 
		f 3 229 352 -244 
		mu 0 3 142 150 143 
		f 3 -353 105 -231 
		mu 0 3 143 150 151 
		f 3 230 353 -245 
		mu 0 3 143 151 144 
		f 3 -354 108 -232 
		mu 0 3 144 151 152 
		f 3 231 354 -246 
		mu 0 3 144 152 145 
		f 3 -355 111 -233 
		mu 0 3 145 152 146 
		f 3 -247 -222 212 
		mu 0 3 145 138 137 ;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".ndt" 0;
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 58.536066523334839 7.0945193742586321 11.98179075063198 ;
	setAttr ".r" -type "double3" 0.26164727039379548 81.799999999999926 0 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999986;
	setAttr ".fcp" 100000;
	setAttr ".coi" 59.843613670909036;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" -0.69510225414647664 7.3678006504597136 3.446448941990532 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 11148.4648 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".fcp" 100000;
	setAttr ".coi" 11148.4648;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 11148.4648 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".fcp" 100000;
	setAttr ".coi" 11148.4648;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 11148.4648 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".fcp" 100000;
	setAttr ".coi" 11148.4648;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode materialInfo -n "materialInfo2";
createNode shadingEngine -n "lambert3SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode lambert -n "capmat";
createNode file -n "file2";
	setAttr ".ftn" -type "string" "C:/Users/Artem/Programming/SVNRoot/GameProject/AssetsIn/Maya/Soldier_12_11/cap/texture/captainhat_black.jpg";
createNode place2dTexture -n "place2dTexture2";
createNode lightLinker -n "lightLinker1";
	setAttr -s 3 ".lnk";
	setAttr -s 3 ".slnk";
createNode displayLayerManager -n "layerManager";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n"
		+ "                -activeOnly 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 8192\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n"
		+ "                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n"
		+ "                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n"
		+ "            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 8192\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -colorResolution 4 4 \n            -bumpResolution 4 4 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 0\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n"
		+ "            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 8192\n"
		+ "                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n"
		+ "                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n"
		+ "            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 8192\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -colorResolution 4 4 \n            -bumpResolution 4 4 \n            -textureCompression 0\n"
		+ "            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 0\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n"
		+ "            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"wireframe\" \n                -activeOnly 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n"
		+ "                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 8192\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n"
		+ "                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n"
		+ "                -pivots 1\n                -textures 1\n                -strokes 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"wireframe\" \n            -activeOnly 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 8192\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -colorResolution 4 4 \n            -bumpResolution 4 4 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 0\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n"
		+ "            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n"
		+ "            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 1\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 1\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 8192\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n"
		+ "                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"base_OpenGL_Renderer\" \n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n"
		+ "                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -shadows 0\n                $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n"
		+ "            -activeOnly 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 1\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 1\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 8192\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"base_OpenGL_Renderer\" \n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n"
		+ "            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n"
		+ "            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -shadows 0\n            $editorName;\nmodelEditor -e -viewSelected 0 $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -showShapes 0\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n"
		+ "                -showContainerContents 1\n                -ignoreDagHierarchy 0\n                -expandConnections 0\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n"
		+ "                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n"
		+ "            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n"
		+ "                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n"
		+ "                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -constrainDrag 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n"
		+ "                -expandConnections 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n"
		+ "                -niceNames 1\n                -showNamespace 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -constrainDrag 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n"
		+ "                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n"
		+ "                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n"
		+ "                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n"
		+ "                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n"
		+ "            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n"
		+ "                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n"
		+ "                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"multiListerPanel\" (localizedPanelLabel(\"Multilister\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"multiListerPanel\" -l (localizedPanelLabel(\"Multilister\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Multilister\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"devicePanel\" (localizedPanelLabel(\"Devices\")) `;\n\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n\t\t\tdevicePanel -unParent -l (localizedPanelLabel(\"Devices\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tdevicePanel -edit -l (localizedPanelLabel(\"Devices\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"webBrowserPanel\" (localizedPanelLabel(\"Web Browser\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"webBrowserPanel\" -l (localizedPanelLabel(\"Web Browser\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Web Browser\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"vacantCell.xpm\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"vertical2\\\" -ps 1 20 100 -ps 2 80 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Outliner\")) \n\t\t\t\t\t\"outlinerPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\\\"Outliner\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\noutlinerEditor -e \\n    -showShapes 0\\n    -showAttributes 0\\n    -showConnected 0\\n    -showAnimCurvesOnly 0\\n    -showMuteInfo 0\\n    -organizeByLayer 1\\n    -showAnimLayerWeight 1\\n    -autoExpandLayers 1\\n    -autoExpand 0\\n    -showDagOnly 1\\n    -showAssets 1\\n    -showContainedOnly 1\\n    -showPublishedAsConnected 0\\n    -showContainerContents 1\\n    -ignoreDagHierarchy 0\\n    -expandConnections 0\\n    -showUnitlessCurves 1\\n    -showCompounds 1\\n    -showLeafs 1\\n    -showNumericAttrsOnly 0\\n    -highlightActive 1\\n    -autoSelectNewObjects 0\\n    -doNotSelectNewObjects 0\\n    -dropIsParent 1\\n    -transmitFilters 0\\n    -setFilter \\\"defaultSetFilter\\\" \\n    -showSetMembers 1\\n    -allowMultiSelection 1\\n    -alwaysToggleSelect 0\\n    -directSelect 0\\n    -displayMode \\\"DAG\\\" \\n    -expandObjects 0\\n    -setsIgnoreFilters 1\\n    -containersIgnoreFilters 0\\n    -editAttrName 0\\n    -showAttrValues 0\\n    -highlightSecondary 0\\n    -showUVAttrsOnly 0\\n    -showTextureNodesOnly 0\\n    -attrAlphaOrder \\\"default\\\" \\n    -animLayerFilterOptions \\\"allAffecting\\\" \\n    -sortOrder \\\"none\\\" \\n    -longNames 0\\n    -niceNames 1\\n    -showNamespace 1\\n    $editorName\"\n"
		+ "\t\t\t\t\t\"outlinerPanel -edit -l (localizedPanelLabel(\\\"Outliner\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\noutlinerEditor -e \\n    -showShapes 0\\n    -showAttributes 0\\n    -showConnected 0\\n    -showAnimCurvesOnly 0\\n    -showMuteInfo 0\\n    -organizeByLayer 1\\n    -showAnimLayerWeight 1\\n    -autoExpandLayers 1\\n    -autoExpand 0\\n    -showDagOnly 1\\n    -showAssets 1\\n    -showContainedOnly 1\\n    -showPublishedAsConnected 0\\n    -showContainerContents 1\\n    -ignoreDagHierarchy 0\\n    -expandConnections 0\\n    -showUnitlessCurves 1\\n    -showCompounds 1\\n    -showLeafs 1\\n    -showNumericAttrsOnly 0\\n    -highlightActive 1\\n    -autoSelectNewObjects 0\\n    -doNotSelectNewObjects 0\\n    -dropIsParent 1\\n    -transmitFilters 0\\n    -setFilter \\\"defaultSetFilter\\\" \\n    -showSetMembers 1\\n    -allowMultiSelection 1\\n    -alwaysToggleSelect 0\\n    -directSelect 0\\n    -displayMode \\\"DAG\\\" \\n    -expandObjects 0\\n    -setsIgnoreFilters 1\\n    -containersIgnoreFilters 0\\n    -editAttrName 0\\n    -showAttrValues 0\\n    -highlightSecondary 0\\n    -showUVAttrsOnly 0\\n    -showTextureNodesOnly 0\\n    -attrAlphaOrder \\\"default\\\" \\n    -animLayerFilterOptions \\\"allAffecting\\\" \\n    -sortOrder \\\"none\\\" \\n    -longNames 0\\n    -niceNames 1\\n    -showNamespace 1\\n    $editorName\"\n"
		+ "\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 8192\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 1\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 1\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 8192\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"base_OpenGL_Renderer\\\" \\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 4645.152 -size 11148.364799999999 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels yes -displayOrthographicLabels yes -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 3100 -max 3186 -ast 1 -aet 6399 ";
	setAttr ".st" 6;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 1829;
select -ne :renderPartition;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 3 ".st";
	setAttr -cb on ".an";
	setAttr -cb on ".pt";
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 3 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -k on ".cch";
	setAttr -k on ".nds";
select -ne :lightList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultTextureList1;
	setAttr -cb on ".cch";
	setAttr -cb on ".ihi";
	setAttr -cb on ".nds";
	setAttr -cb on ".bnm";
select -ne :initialShadingGroup;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr ".ro" yes;
	setAttr -cb on ".mimt";
	setAttr -cb on ".miop";
	setAttr -cb on ".mise";
	setAttr -cb on ".mism";
	setAttr -cb on ".mice";
	setAttr -av -cb on ".micc";
	setAttr -cb on ".mica";
	setAttr -cb on ".micw";
	setAttr -cb on ".mirw";
select -ne :initialParticleSE;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr ".ro" yes;
	setAttr -cb on ".mimt";
	setAttr -cb on ".miop";
	setAttr -cb on ".mise";
	setAttr -cb on ".mism";
	setAttr -cb on ".mice";
	setAttr -cb on ".micc";
	setAttr -cb on ".mica";
	setAttr -cb on ".micw";
	setAttr -cb on ".mirw";
select -ne :defaultRenderGlobals;
	setAttr -k on ".cch";
	setAttr -k on ".nds";
	setAttr ".mcfr" 30;
	setAttr -k on ".clip";
	setAttr -k on ".edm";
	setAttr -k on ".edl";
	setAttr -av -k on ".esr";
	setAttr -k on ".ors";
	setAttr -k on ".outf";
	setAttr -k on ".gama";
	setAttr -k on ".bfs";
	setAttr -k on ".be";
	setAttr -k on ".fec";
	setAttr -k on ".ofc";
	setAttr -k on ".comp";
	setAttr -k on ".cth";
	setAttr -k on ".soll";
	setAttr -k on ".rd";
	setAttr -k on ".lp";
	setAttr -k on ".sp";
	setAttr -k on ".shs";
	setAttr -k on ".lpr";
	setAttr -k on ".mm";
	setAttr -k on ".npu";
	setAttr -k on ".itf";
	setAttr -k on ".shp";
	setAttr -k on ".uf";
	setAttr -k on ".oi";
	setAttr -k on ".rut";
	setAttr -av -k on ".mbf";
	setAttr -k on ".afp";
	setAttr -k on ".pfb";
	setAttr -av -k on ".bll";
	setAttr -k on ".bls";
	setAttr -k on ".smv";
	setAttr -k on ".ubc";
	setAttr -k on ".mbc";
	setAttr -k on ".udbx";
	setAttr -k on ".smc";
	setAttr -k on ".kmv";
	setAttr -k on ".rlen";
	setAttr -av -k on ".frts";
	setAttr -k on ".tlwd";
	setAttr -k on ".tlht";
	setAttr -k on ".jfc";
select -ne :defaultLightSet;
	setAttr -k on ".cch";
	setAttr -k on ".nds";
	setAttr -k on ".mwc";
	setAttr ".ro" yes;
select -ne :hardwareRenderGlobals;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
	setAttr -k off -cb on ".ehql";
	setAttr -k off -cb on ".eams";
	setAttr -k off -cb on ".eeaa";
	setAttr -k off -cb on ".engm";
	setAttr -k off -cb on ".mes";
	setAttr -k off -cb on ".emb";
	setAttr -k off -cb on ".mbbf";
	setAttr -k off -cb on ".mbs";
	setAttr -k off -cb on ".trm";
	setAttr -k off -cb on ".tshc";
	setAttr -k off -cb on ".clmt";
	setAttr -k off -cb on ".tcov";
	setAttr -k off -cb on ".lith";
	setAttr -k off -cb on ".sobc";
	setAttr -k off -cb on ".cuth";
	setAttr -k off -cb on ".hgcd";
	setAttr -k off -cb on ".hgci";
	setAttr -k off -cb on ".mgcs";
	setAttr -k off -cb on ".twa";
	setAttr -k off -cb on ".twz";
	setAttr -k on ".hwcc";
	setAttr -k on ".hwdp";
	setAttr -k on ".hwql";
	setAttr ".hwfr" 30;
select -ne :defaultHardwareRenderGlobals;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".rp";
	setAttr -k on ".cai";
	setAttr -k on ".coi";
	setAttr -cb on ".bc";
	setAttr -av -k on ".bcb";
	setAttr -av -k on ".bcg";
	setAttr -av -k on ".bcr";
	setAttr -k on ".ei";
	setAttr -k on ".ex";
	setAttr -k on ".es";
	setAttr -av -k on ".ef";
	setAttr -cb on ".bf";
	setAttr -k on ".fii";
	setAttr -cb on ".sf";
	setAttr -k on ".gr";
	setAttr -k on ".li";
	setAttr -k on ".ls";
	setAttr -k on ".mb";
	setAttr -k on ".ti";
	setAttr -k on ".txt";
	setAttr -k on ".mpr";
	setAttr -k on ".wzd";
	setAttr ".fn" -type "string" "im";
	setAttr -k on ".if";
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
	setAttr -k on ".as";
	setAttr -k on ".ds";
	setAttr -k on ".lm";
	setAttr -k on ".fir";
	setAttr -k on ".aap";
	setAttr -k on ".gh";
	setAttr -cb on ".sd";
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "lambert3SG.msg" "materialInfo2.sg";
connectAttr "capmat.msg" "materialInfo2.m";
connectAttr "file2.msg" "materialInfo2.t" -na;
connectAttr "capmat.oc" "lambert3SG.ss";
connectAttr "cap.iog" "lambert3SG.dsm" -na;
connectAttr "file2.oc" "capmat.c";
connectAttr "place2dTexture2.c" "file2.c";
connectAttr "place2dTexture2.tf" "file2.tf";
connectAttr "place2dTexture2.rf" "file2.rf";
connectAttr "place2dTexture2.mu" "file2.mu";
connectAttr "place2dTexture2.mv" "file2.mv";
connectAttr "place2dTexture2.s" "file2.s";
connectAttr "place2dTexture2.wu" "file2.wu";
connectAttr "place2dTexture2.wv" "file2.wv";
connectAttr "place2dTexture2.re" "file2.re";
connectAttr "place2dTexture2.of" "file2.of";
connectAttr "place2dTexture2.r" "file2.ro";
connectAttr "place2dTexture2.n" "file2.n";
connectAttr "place2dTexture2.vt1" "file2.vt1";
connectAttr "place2dTexture2.vt2" "file2.vt2";
connectAttr "place2dTexture2.vt3" "file2.vt3";
connectAttr "place2dTexture2.vc1" "file2.vc1";
connectAttr "place2dTexture2.o" "file2.uv";
connectAttr "place2dTexture2.ofs" "file2.fs";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[0].llnk";
connectAttr ":initialShadingGroup.msg" "lightLinker1.lnk[0].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[1].llnk";
connectAttr ":initialParticleSE.msg" "lightLinker1.lnk[1].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.lnk[18].llnk";
connectAttr "lambert3SG.msg" "lightLinker1.lnk[18].olnk";
connectAttr ":defaultLightSet.msg" "lightLinker1.slnk[0].sllk";
connectAttr ":initialShadingGroup.msg" "lightLinker1.slnk[0].solk";
connectAttr ":defaultLightSet.msg" "lightLinker1.slnk[1].sllk";
connectAttr ":initialParticleSE.msg" "lightLinker1.slnk[1].solk";
connectAttr ":defaultLightSet.msg" "lightLinker1.slnk[6].sllk";
connectAttr "lambert3SG.msg" "lightLinker1.slnk[6].solk";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "lambert3SG.pa" ":renderPartition.st" -na;
connectAttr "capmat.msg" ":defaultShaderList1.s" -na;
connectAttr "place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "lightLinker1.msg" ":lightList1.ln" -na;
connectAttr "file2.msg" ":defaultTextureList1.tx" -na;
// End of cap.ma
