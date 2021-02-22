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

	float s = -0.10675473 * a.x + -0.0054621263 * b.x + 0.04762056 * c.x + -0.09147545 * d.x + -0.37308994 * e.x + 0.293996 * f.x + -0.089725204 * g.x + 0.33136362 * h.x + -0.052014586 * i.x;
	float t = 0.02504269 * a.y + -0.06090801 * b.y + -1.0442187e-05 * c.y + 0.06697992 * d.y + -0.029154606 * e.y + -0.0022566947 * f.y + -0.00791601 * g.y + 0.09337469 * h.y + -0.040103186 * i.y;
	float u = 0.21693788 * a.z + -0.055160753 * b.z + -0.009791719 * c.z + -0.333904 * d.z + 0.27527252 * e.z + -0.12840816 * f.z + -0.18639135 * g.z + -0.13602877 * h.z + 0.06346381 * i.z;
	float v = -0.03963725 * a.w + -0.26795068 * b.w + 0.012137692 * c.w + -0.17869234 * d.w + -0.06644175 * e.w + 0.010630859 * f.w + -0.07681673 * g.w + -0.0041983854 * h.w + -0.026523955 * i.w;
	float w = 0.13531718 * na.x + 0.12938923 * nb.x + -0.050681178 * nc.x + 0.062877566 * nd.x + -0.08772176 * ne.x + 0.006759793 * nf.x + 0.15809533 * ng.x + -0.08294619 * nh.x + 0.06690071 * ni.x;
	float x = 0.018558182 * na.y + -0.16493246 * nb.y + 0.02380415 * nc.y + 0.08744932 * nd.y + -0.021898141 * ne.y + 0.026684938 * nf.y + 0.032703754 * ng.y + 0.052364938 * nh.y + 0.056927126 * ni.y;
	float y = -0.0901643 * na.z + -0.09282382 * nb.z + 0.07358982 * nc.z + 0.3232882 * nd.z + -1.0591649 * ne.z + 0.17128727 * nf.z + 0.22159135 * ng.z + -0.3007047 * nh.z + -0.05238468 * ni.z;
	float z = -0.06714734 * na.w + 0.04850284 * nb.w + -0.011960667 * nc.w + -0.18101339 * nd.w + -0.34727672 * ne.w + 0.030268785 * nf.w + -0.09629506 * ng.w + -0.28136835 * nh.w + -0.13334738 * ni.w;
	float o = s + t + u + v + w + x + y + z + 0.006057905;
	s = 0.018881252 * a.x + 0.06384664 * b.x + -0.011764481 * c.x + 0.15501355 * d.x + -0.2185426 * e.x + -0.07557788 * f.x + 0.025938602 * g.x + -0.14496502 * h.x + 0.024891714 * i.x;
	t = -0.01996556 * a.y + -0.00053282635 * b.y + 0.00061660836 * c.y + 0.024429671 * d.y + 0.054617107 * e.y + -0.021867601 * f.y + 0.032060657 * g.y + 0.0031433336 * h.y + -0.012301998 * i.y;
	u = -0.070778325 * a.z + -0.19530736 * b.z + 0.011512594 * c.z + -0.27479392 * d.z + -0.013253852 * e.z + -0.022542335 * f.z + 0.05682861 * g.z + 0.0012437729 * h.z + -0.0150462305 * i.z;
	v = 0.066125244 * a.w + 0.020368045 * b.w + -0.03502752 * c.w + 0.1109599 * d.w + -0.060857326 * e.w + 0.06733562 * f.w + 0.012108426 * g.w + 0.0063430844 * h.w + -0.004283166 * i.w;
	w = -0.06497726 * na.x + -0.17359954 * nb.x + -0.011175394 * nc.x + -0.18982106 * nd.x + 0.5939919 * ne.x + -0.021145599 * nf.x + -0.064499505 * ng.x + -0.014329371 * nh.x + -0.015423945 * ni.x;
	x = -0.03674411 * na.y + -0.0043503637 * nb.y + 0.010304639 * nc.y + -0.0012494766 * nd.y + -0.13278799 * ne.y + 0.032555994 * nf.y + -0.052385017 * ng.y + 0.010176496 * nh.y + -0.0026763906 * ni.y;
	y = 0.06123568 * na.z + 0.14374596 * nb.z + 0.056109104 * nc.z + 0.019599102 * nd.z + 0.18616806 * ne.z + -0.03179762 * nf.z + 0.036342375 * ng.z + 0.029431945 * nh.z + 0.043751024 * ni.z;
	z = 0.12073644 * na.w + 0.0733359 * nb.w + 0.08390864 * nc.w + -0.11528834 * nd.w + 0.3467376 * ne.w + -0.033535313 * nf.w + 0.041739017 * ng.w + 0.058267288 * nh.w + 0.08858209 * ni.w;
	float p = s + t + u + v + w + x + y + z + -0.0028000006;
	s = -0.09027117 * a.x + -0.14622006 * b.x + -0.16810851 * c.x + -0.24796103 * d.x + 0.2572285 * e.x + 0.47094887 * f.x + 0.032027613 * g.x + 0.11410892 * h.x + 0.1613444 * i.x;
	t = -0.0012083473 * a.y + 0.17305928 * b.y + -0.05621104 * c.y + 0.036259834 * d.y + -0.03851184 * e.y + -0.0055326805 * f.y + -0.012463582 * g.y + 0.35876498 * h.y + 0.1724837 * i.y;
	u = 0.40897495 * a.z + 0.17421961 * b.z + 0.28644145 * c.z + -0.25477505 * d.z + -0.4277018 * e.z + -0.18726684 * f.z + 0.13615106 * g.z + 0.026969131 * h.z + -0.15176998 * i.z;
	v = 0.04463327 * a.w + -0.04876386 * b.w + -0.031818386 * c.w + 0.03954202 * d.w + 0.09516337 * e.w + 0.052471045 * f.w + -0.13383369 * g.w + -0.21776986 * h.w + 0.015097585 * i.w;
	w = 0.2092236 * na.x + 0.48777798 * nb.x + 0.2956695 * nc.x + 0.23978968 * nd.x + -0.59248745 * ne.x + -0.13063201 * nf.x + 0.061278455 * ng.x + -0.10234516 * nh.x + 0.002134229 * ni.x;
	x = 0.07130507 * na.y + 0.121942736 * nb.y + -0.01583503 * nc.y + 0.14037956 * nd.y + -0.37520966 * ne.y + -0.067429096 * nf.y + 0.05821935 * ng.y + -0.35461438 * nh.y + -0.07123769 * ni.y;
	y = -0.468684 * na.z + -0.30739802 * nb.z + -0.38813922 * nc.z + -0.33846653 * nd.z + -0.08206715 * ne.z + 0.15765728 * nf.z + -0.16559663 * ng.z + -0.055957757 * nh.z + -0.11368465 * ni.z;
	z = -0.4303523 * na.w + -0.84991306 * nb.w + -0.2505638 * nc.w + 0.35179257 * nd.w + 1.0163839 * ne.w + 0.23950848 * nf.w + 0.08583142 * ng.w + -0.2591442 * nh.w + -0.045323353 * ni.w;
	float q = s + t + u + v + w + x + y + z + 0.017286068;
	s = 0.101637 * a.x + -0.23477565 * b.x + -0.03157821 * c.x + -0.20734964 * d.x + -0.16431263 * e.x + 0.2424383 * f.x + -0.11075752 * g.x + 0.16768074 * h.x + -0.418383 * i.x;
	t = 0.006255804 * a.y + 0.042100485 * b.y + 0.0036014041 * c.y + -0.08597467 * d.y + 0.048351593 * e.y + -0.13372381 * f.y + -0.061134014 * g.y + -0.33137617 * h.y + 0.019631254 * i.y;
	u = 0.18377675 * a.z + 0.58994883 * b.z + 0.2991301 * c.z + 0.74260485 * d.z + -0.1369073 * e.z + 0.24632849 * f.z + -0.03240025 * g.z + 0.2981277 * h.z + 0.3513618 * i.z;
	v = -0.04465667 * a.w + -0.15135704 * b.w + 0.13290188 * c.w + -0.049763512 * d.w + -0.6689857 * e.w + -0.28756517 * f.w + 0.04422787 * g.w + 0.14173377 * h.w + -0.027095031 * i.w;
	w = 0.010524522 * na.x + 0.2286293 * nb.x + -0.15575987 * nc.x + 0.19659552 * nd.x + 0.2584596 * ne.x + 0.53996265 * nf.x + 0.1819511 * ng.x + 0.20248987 * nh.x + 0.08608274 * ni.x;
	x = 0.054287046 * na.y + 0.04735612 * nb.y + 0.0861212 * nc.y + -0.028863167 * nd.y + 0.20381325 * ne.y + -0.109093554 * nf.y + 0.010826272 * ng.y + 0.23420005 * nh.y + -0.022509871 * ni.y;
	y = 0.1786933 * na.z + 0.126716 * nb.z + 0.046265166 * nc.z + 0.071686745 * nd.z + 0.323193 * ne.z + 0.42820987 * nf.z + 0.062808044 * ng.z + 0.13638002 * nh.z + 0.29570308 * ni.z;
	z = -0.31819153 * na.w + -0.4878216 * nb.w + -0.33641538 * nc.w + -0.43968466 * nd.w + -0.588631 * ne.w + 0.06131746 * nf.w + -0.28163537 * ng.w + -0.49008766 * nh.w + -0.5446552 * ni.w;
	float r = s + t + u + v + w + x + y + z + 0.020686742;

	return Compress(float4(o, p, q, r));
}