#define D2D_INPUT_COUNT 1
#define D2D_INPUT0_COMPLEX
#include "Anime4K.hlsli"

/*
* Anime4K-v3.1-Upscale(x2)-CNN(M)-Conv-4x3x3x8
*/

cbuffer constants : register(b0) {
	int2 srcSize : packoffset(c0);
};


D2D_PS_ENTRY(main) {
	float4 coord = D2DGetInputCoordinate(0);

	float leftPos = max(0, coord.x - coord.z);
	float topPos = max(0, coord.y - coord.w);
	float rightPos = min((srcSize.x - 1) * coord.z, coord.x + coord.z);
	float bottomPos = min((srcSize.y - 1) * coord.w, coord.y + coord.w);

	float4 a = Uncompress(D2DSampleInput(0, float2(leftPos, topPos)));
	float4 b = Uncompress(D2DSampleInput(0, float2(leftPos, coord.y)));
	float4 c = Uncompress(D2DSampleInput(0, float2(leftPos, bottomPos)));
	float4 d = Uncompress(D2DSampleInput(0, float2(coord.x, topPos)));
	float4 e = Uncompress(D2DSampleInput(0, float2(coord.x, coord.y)));
	float4 f = Uncompress(D2DSampleInput(0, float2(coord.x, bottomPos)));
	float4 g = Uncompress(D2DSampleInput(0, float2(rightPos, topPos)));
	float4 h = Uncompress(D2DSampleInput(0, float2(rightPos, coord.y)));
	float4 i = Uncompress(D2DSampleInput(0, float2(rightPos, bottomPos)));

	float4 na = -min(a, ZEROS4);
	float4 nb = -min(b, ZEROS4);
	float4 nc = -min(c, ZEROS4);
	float4 nd = -min(d, ZEROS4);
	float4 ne = -min(e, ZEROS4);
	float4 nf = -min(f, ZEROS4);
	float4 ng = -min(g, ZEROS4);
	float4 nh = -min(h, ZEROS4);
	float4 ni = -min(i, ZEROS4);

	a = max(a, ZEROS4);
	b = max(b, ZEROS4);
	c = max(c, ZEROS4);
	d = max(d, ZEROS4);
	e = max(e, ZEROS4);
	f = max(f, ZEROS4);
	g = max(g, ZEROS4);
	h = max(h, ZEROS4);
	i = max(i, ZEROS4);

	float s = -0.05327107 * a.x - 0.07160779 * b.x - 0.053545203 * c.x + 0.30653647 * d.x - 0.623205 * e.x - 0.25135925 * f.x - 0.18046309 * g.x + 0.5326353 * h.x - 0.09099461 * i.x;
	float t = -0.16687301 * a.y + 0.29383695 * b.y - 0.15116534 * c.y + 0.013435781 * d.y - 0.3595954 * e.y + 0.3222953 * f.y + 0.20127103 * g.y + 1.1504021 * h.y + 0.6521217 * i.y;
	float u = -0.0015649797 * a.z - 0.18814865 * b.z + 0.061695296 * c.z + 0.013806492 * d.z + 0.12745698 * e.z - 0.30406427 * f.z - 0.05947408 * g.z + 0.33141926 * h.z - 0.20066342 * i.z;
	float v = 0.30095318 * a.w + 0.36586058 * b.w + 0.22645043 * c.w + 0.1612967 * d.w - 0.37834042 * e.w - 0.08229078 * f.w - 0.64827895 * g.w + 0.04798959 * h.w + 0.50426966 * i.w;
	float w = 0.126555 * na.x + 0.079004966 * nb.x - 0.06367056 * nc.x - 0.16546968 * nd.x + 0.50795466 * ne.x + 0.18011826 * nf.x + 0.16996312 * ng.x - 0.51605004 * nh.x + 0.10505295 * ni.x;
	float x = 0.1540833 * na.y - 0.26913214 * nb.y + 0.13605806 * nc.y - 0.12155722 * nd.y + 0.21405062 * ne.y - 0.27972937 * nf.y - 0.41382065 * ng.y - 1.7224138 * nh.y - 0.60294384 * ni.y;
	float y = 0.00970452 * na.z + 0.20325865 * nb.z + 0.0015745827 * nc.z - 0.107312985 * nd.z + 0.009980262 * ne.z + 0.2720558 * nf.z + 0.15321876 * ng.z - 0.036781967 * nh.z + 0.051229585 * ni.z;
	float z = -0.27454868 * na.w - 0.4432009 * nb.w - 0.003881375 * nc.w + 0.18336153 * nd.w + 0.19950926 * ne.w + 0.045014136 * nf.w + 0.6243142 * ng.w - 0.16252244 * nh.w - 0.42274413 * ni.w;
	float o = s + t + u + v + w + x + y + z + 0.039423503;
	s = -0.10775202 * a.x - 0.031339962 * b.x + 0.0060642078 * c.x - 0.10545187 * d.x + 0.12458454 * e.x + 0.0021231163 * f.x + 0.07905482 * g.x + 0.08223747 * h.x + 0.04828753 * i.x;
	t = 0.13271476 * a.y - 0.40485632 * b.y + 0.054641176 * c.y - 0.4327063 * d.y - 0.19545476 * e.y + 0.09262824 * f.y - 0.36247733 * g.y + 0.12627794 * h.y - 0.075792745 * i.y;
	u = -0.09226349 * a.z + 0.24326 * b.z - 0.021355193 * c.z + 0.1444612 * d.z - 0.102547936 * e.z + 0.05568293 * f.z + 0.013875915 * g.z + 0.19688046 * h.z + 0.0154764345 * i.z;
	v = -0.1431215 * a.w - 0.26233566 * b.w - 0.020626735 * c.w + 0.019540034 * d.w + 0.18164286 * e.w - 0.16356231 * f.w + 0.17014627 * g.w - 0.27788106 * h.w + 0.0718594 * i.w;
	w = 0.20348297 * na.x + 0.10994786 * nb.x + 0.014990544 * nc.x + 1.033602 * nd.x + 0.024537617 * ne.x + 0.009609228 * nf.x + 0.12779616 * ng.x + 0.06813842 * nh.x - 0.04269685 * ni.x;
	x = -0.2430749 * na.y + 0.37466663 * nb.y - 0.06150604 * nc.y + 0.28204092 * nd.y + 0.22226551 * ne.y - 0.19715464 * nf.y + 0.003657579 * ng.y - 0.30363604 * nh.y + 0.0542432 * ni.y;
	y = 0.1447509 * na.z - 0.28650913 * nb.z - 0.058723953 * nc.z - 0.092879236 * nd.z + 0.26428574 * ne.z - 0.104749136 * nf.z - 0.070094705 * ng.z + 0.047571726 * nh.z - 0.010061374 * ni.z;
	z = 0.0438258 * na.w + 0.34031448 * nb.w - 0.013600149 * nc.w + 0.28250962 * nd.w - 0.73591596 * ne.w + 0.21241076 * nf.w - 0.27542746 * ng.w + 0.14023423 * nh.w - 0.10678145 * ni.w;
	float p = s + t + u + v + w + x + y + z - 0.021502364;
	s = 0.032163877 * a.x - 0.66642886 * b.x + 0.044751197 * c.x + 0.05605561 * d.x + 0.6945027 * e.x - 0.07645503 * f.x - 0.04662916 * g.x - 0.2509118 * h.x + 0.098923184 * i.x;
	t = 0.03268785 * a.y + 0.2343848 * b.y - 0.058907576 * c.y - 0.6397386 * d.y - 0.15121439 * e.y + 0.15354797 * f.y - 0.3191564 * g.y - 0.24138322 * h.y - 0.71516746 * i.y;
	u = -0.069602974 * a.z - 0.4111596 * b.z + 0.021718252 * c.z + 0.2399502 * d.z + 0.64263207 * e.z + 0.3311527 * f.z - 0.2513218 * g.z - 0.48004037 * h.z + 0.78069997 * i.z;
	v = -0.6631432 * a.w + 0.15360248 * b.w + 0.012449814 * c.w - 0.9210798 * d.w + 0.77063346 * e.w + 0.10402895 * f.w + 0.26728597 * g.w - 0.3063174 * h.w + 0.07107563 * i.w;
	w = -0.22910015 * na.x + 0.60668314 * nb.x - 0.07472177 * nc.x - 0.2976557 * nd.x - 0.31179214 * ne.x + 0.17979208 * nf.x - 0.059973676 * ng.x + 0.48262063 * nh.x + 0.10012325 * ni.x;
	x = -0.008694405 * na.y - 0.19812866 * nb.y + 0.024916848 * nc.y + 0.57730144 * nd.y + 0.20505147 * ne.y - 0.22297408 * nf.y + 0.09352177 * ng.y - 0.548608 * nh.y + 0.56032515 * ni.y;
	y = 0.05522713 * na.z + 0.3843459 * nb.z - 0.017952677 * nc.z - 0.24958606 * nd.z - 0.641729 * ne.z - 0.13842992 * nf.z + 0.20486256 * ng.z + 0.24058507 * nh.z - 0.53553283 * ni.z;
	z = 0.7243502 * na.w - 0.16880396 * nb.w + 0.11347028 * nc.w + 0.98730826 * nd.w - 0.4131502 * ne.w - 0.605653 * nf.w - 0.20231946 * ng.w + 0.268739 * nh.w - 0.25494024 * ni.w;
	float q = s + t + u + v + w + x + y + z - 0.011375127;
	s = 0.004939782 * a.x + 0.04961287 * b.x - 0.022315059 * c.x - 0.36721465 * d.x + 0.02673542 * e.x - 0.055127766 * f.x - 0.3139398 * g.x + 0.011177372 * h.x - 0.002486109 * i.x;
	t = 0.0029139163 * a.y - 0.018279694 * b.y + 0.23850645 * c.y - 0.053427566 * d.y - 0.19388364 * e.y + 0.25149515 * f.y - 0.15969065 * g.y + 0.003607878 * h.y + 0.47864768 * i.y;
	u = 0.018587857 * a.z + 0.04256821 * b.z - 0.084889054 * c.z - 0.10649675 * d.z + 0.1413508 * e.z - 0.014863062 * f.z + 0.046072394 * g.z + 0.044705987 * h.z - 0.3495728 * i.z;
	v = -0.25952607 * a.w - 0.37138674 * b.w - 0.31769684 * c.w - 0.47086135 * d.w + 0.4518305 * e.w + 0.23906761 * f.w + 0.37785494 * g.w - 0.12342203 * h.w - 0.18958518 * i.w;
	w = -0.0987012 * na.x - 0.23680592 * nb.x - 0.038128883 * nc.x + 0.021003952 * nd.x - 0.21279961 * ne.x + 0.02450331 * nf.x + 0.22508678 * ng.x - 0.050619982 * nh.x - 0.12929344 * ni.x;
	x = 0.024458453 * na.y + 0.07273773 * nb.y - 0.26048952 * nc.y + 0.18460196 * nd.y + 0.4304707 * ne.y - 0.17272879 * nf.y + 0.28351468 * ng.y + 1.3116083 * nh.y - 0.29540524 * ni.y;
	y = -0.041094407 * na.z + 0.024719454 * nb.z + 0.19896787 * nc.z + 0.07664201 * nd.z - 0.25621203 * ne.z + 0.10749328 * nf.z - 0.067182586 * ng.z + 0.06065049 * nh.z + 0.47074008 * ni.z;
	z = 0.13518347 * na.w + 0.20488833 * nb.w + 0.24956091 * nc.w + 0.07386013 * nd.w - 0.9938687 * ne.w - 0.15375653 * nf.w - 0.55804706 * ng.w - 0.0036114866 * nh.w + 0.3378182 * ni.w;
	float r = s + t + u + v + w + x + y + z - 0.047199935;

	return Compress(float4(o, p, q, r));
}