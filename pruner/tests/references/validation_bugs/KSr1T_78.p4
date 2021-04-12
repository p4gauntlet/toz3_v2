#include <core.p4>
bit<3> max(in bit<3> val, in bit<3> bound) {
    return val < bound ? val : bound;
}
header ethernet_t {
    bit<48> dst_addr;
    bit<48> src_addr;
    bit<16> eth_type;
}

struct JozKKk {
    bit<64> fcfp;
    bit<32> mRAU;
}

header AlSZfJ {
    bit<4>   PrXR;
    bit<128> ffxT;
}

header KAJGns {
    bit<128> HVKB;
    bit<4>   gpiu;
    bit<4>   WTzn;
}

header WwUgLX {
    bit<32>  vAcw;
    bit<8>   fEQT;
    bit<128> UVYE;
}

header RTynIY {
    bit<64>  krNS;
    bit<128> DAiV;
    bit<8>   zLYh;
    bit<16>  PEbw;
    bit<64>  Duyw;
}

struct JTXeSM {
    bit<8> Rhbr;
}

struct SsOiZQ {
    bit<32> uDfW;
    bit<4>  DlZI;
}

struct ZmnAKS {
    bit<64>  iVXy;
    bit<64>  cSNz;
    bit<128> yfom;
}

struct Headers {
    ethernet_t eth_hdr;
    KAJGns     wbSp;
    RTynIY[5]  fYBu;
    KAJGns     baZN;
    ethernet_t kTDU;
}

bit<32> lGMFroS(bit<16> FPYu, AlSZfJ llZX, bit<4> BakX) {
    bit<64> lMpQZa = (!(!true && false) ? (bit<64>)FPYu : 64w10885059570562721941);
    lMpQZa = lMpQZa;
    lMpQZa = lMpQZa;
    lMpQZa = lMpQZa;
    lMpQZa = lMpQZa;
    return (!!!(96w8318466471386656416789922720 != 96w31103884438811998565982582787) ? (bit<32>)llZX.ffxT : 32w1190211247) |+| 32w1751541962 |-| 32w3209096206 ^ (bit<32>)llZX.ffxT;
}
action jnMmz() {
    bit<32> rfiuUS = 973408551;
    lGMFroS(16w21115, { 4w15, ((bit<168>)168w53418303114900329857770371696859472043478921839790)[140:13] }, 4w8 |+| 4w14);
    rfiuUS = -355103010;
    rfiuUS = 32w2012938623;
    rfiuUS = 32w1443805251;
    rfiuUS = 32w517602882;
    rfiuUS = 32w4118629984 & (bit<32>)32w89305098 |-| (!!false || 26w56667738 == 26w56151737 ? 32w2037768510 : rfiuUS);
    rfiuUS = 32w4233494640;
    rfiuUS = (98w117178812488398853184302148915 != (bit<98>)rfiuUS ? 32w2790307821 : 32w69661342);
    rfiuUS = ((bit<89>)rfiuUS + (bit<89>)rfiuUS)[75:44];
}
action iXTNV(out bit<64> TnLM, bit<16> YWwH) {
    jnMmz();
    TnLM = 64w14508601117420085142;
    TnLM = (bit<23>)TnLM ++ (bit<41>)(41w364013008974 / 41w926256406614 * 537514596);
    TnLM = (bit<64>)(64w13006172434549333882 | 64w17533096510914869329);
    lGMFroS(~16w56333, { 4w8 | 53w6459735789398[27:24], ((-596377756 ^ 128w10006837038476074477995958636400516489) & 128w85447240608251879610597741125930823145 * 128w108432387130674145044924135126695578838) + 128w168350665298082959180762067967927069005 }, 4w13);
    TnLM = 64w11220934559667598938;
    TnLM = ((bit<159>)(bit<159>)TnLM)[106:43];
    lGMFroS(16w9492, { 4w14, 128w180410681518429881196072218166669687849 / 128w93096250637123905939076918287806077702 }, 4w9 |-| (true ? 4w3 : 4w15));
    TnLM = 64w3987172189333529435 |+| 64w3062275679984087319 ^ 64w8604949340203277845 & 64w3748153913745597088;
}
bool gQYTcQO(bit<128> bEik) {
    bit<32> Sqroyq = 32w1842435672;
    Sqroyq = 631078308;
    bool LmjUKt = !true;
    Sqroyq = ~(bit<32>)Sqroyq | -~32w2949453960;
    Sqroyq = Sqroyq;
    Sqroyq = (bit<32>)(32w790370619 % 32w389107707);
    Sqroyq = -(Sqroyq + 32w2371302825 / 32w3827625683);
    return false;
}
parser p(packet_in pkt, out Headers hdr) {
    bit<16> AeUEZB = 16w49121;
    bit<16> TjCDeo = 16w32062;
    bool JsGWxn = !(true && (true && !!(64w9680336253376718268 == hdr.fYBu[4].Duyw)) || !(!!true && !!(true && !!((bit<24>)hdr.eth_hdr.src_addr != (true ? 24w5462844 : (bit<24>)hdr.wbSp.HVKB | (bit<24>)hdr.kTDU.dst_addr)))));
    RTynIY xhESil = hdr.fYBu[4];
    bit<16> pfFYrK = 16w65083;
    state start {
        transition parse_hdrs;
    }
    state parse_hdrs {
        pkt.extract(hdr.eth_hdr);
        pkt.extract(hdr.wbSp);
        pkt.extract(hdr.fYBu.next);
        pkt.extract(hdr.fYBu.next);
        pkt.extract(hdr.fYBu.next);
        pkt.extract(hdr.fYBu.next);
        pkt.extract(hdr.fYBu.next);
        pkt.extract(hdr.baZN);
        pkt.extract(hdr.kTDU);
        transition accept;
    }
}

control ingress(inout Headers h) {
    bool qmzYfC = gQYTcQO((true ? 220w988364981411394343449436825217801708914254582818172634872825334950 : 220w865310384664064318399982503163222066028440951975452552636541966139)[219:92]);
    bool WwCwCM = !!true;
    bit<32> bvlYVa = -(32w2996349882 >> (bit<8>)((bit<32>)1695549003 |+| 32w3487873571)) |-| 32w2248833910;
    bool EwuGlP = true;
    action gsbCn() {
        lGMFroS((!!!!!true ? 16w25977 + 16w2115 |+| (bit<16>)-1904073922 : 16w16148) ^ 16w25828, { 4w0 << (bit<8>)4w2, 128w293916024674138680585094936758458611398 }, -(4w3 | 2w3 ++ 2w1));
        bvlYVa = -1835262786 + 1465349223 + 1937221748 ^ -1408312178;
        bit<32> kPomXW = 32w2739344496 | 32w789402455;
        bit<128> ypIEGv = h.wbSp.HVKB;
        gQYTcQO(128w312976006963322919712120807082904591155 | (bit<128>)128w6819154720721542391679994776544438647 << (bit<8>)128w124773636711820577368348704972810385030);
        const bit<64> yoKRTO = 64w376667403935578995;
        h.fYBu[max((bit<3>)bvlYVa, 3w4)].zLYh = h.fYBu[4].zLYh;
        if (gQYTcQO(128w54072657560468442005888502744051793146)) {
            h.wbSp.HVKB = (!false ? 128w326377102850792306130073254857057736996 : h.fYBu[4].DAiV);
        } else {
            h.fYBu[max(3w0 / 3w2, 3w4)].krNS = h.fYBu[4].krNS;
        }
        bvlYVa = kPomXW;
        h.baZN.HVKB = h.baZN.HVKB + 128w110958279592995607134915803733884340329 |+| h.baZN.HVKB;
    }
    table IUTyFm {
        key = {
        }
        actions = {
        }
    }
    table jiPqvW {
        key = {
            h.kTDU.dst_addr: exact @name("GlTKLd") ;
            h.fYBu[4].Duyw : exact @name("ZuGqQM") ;
        }
        actions = {
            gsbCn();
            jnMmz();
        }
    }
    table zYjbqx {
        key = {
        }
        actions = {
            gsbCn();
        }
    }
    apply {
        if (28w79663340 == 28w119205261) {
            h.fYBu[max(-305716420, 3w4)].PEbw = 16w63534 - 16w60030;
        } else {
            h.kTDU.dst_addr = -694087543;
        }
        switch (jiPqvW.apply().action_run) {
            gsbCn: {
                jnMmz();
                bvlYVa = ~(bit<32>)32w837316268;
                h.wbSp.HVKB = (!IUTyFm.apply().hit ? ~128w211827179621503608920366146701087714804 : 128w45876058285980019223767005923137213723) << (bit<8>)128w279114166186749892744310245066176928967 << (bit<8>)128w227028790213920568319983260936873320721;
                bvlYVa = 32w643309980;
                gQYTcQO(128w28499072391495367540287065859402676875);
                h.fYBu[max(-3w3, 3w4)].Duyw = 64w9550098848346991727;
                h.fYBu[max((bit<3>)h.eth_hdr.eth_type, 3w4)].Duyw = 64w1041055284648021073 |+| 64w11754962245357002651 ^ h.fYBu[4].Duyw;
                bit<32> vRJfHD = 32w1546230188;
                const int pQIuvZ = 779029033;
                bit<32> cRQgPE = ((bit<109>)1461329359)[105:74];
            }
            jnMmz: {
                bvlYVa = (!zYjbqx.apply().hit ? bvlYVa : -((bit<37>)bvlYVa |-| 37w103586657084)[32:1]);
                iXTNV(h.fYBu[4].DAiV[63:0], 16w42623);
                bvlYVa = bvlYVa;
                h.baZN.gpiu = 4w0;
            }
        }
        h.wbSp.gpiu = 37w51444990267[19:16];
        lGMFroS(16w6131 + 16w31160, { (39w146464430923 & 39w292085947079)[28:25], 128w304463212597028295517497661946494318313 }, 4w15);
        h.fYBu[max(3w7, 3w4)].DAiV = h.wbSp.HVKB;
        h.wbSp.HVKB = 128w13240102929820680615714094648727380627;
        h.fYBu[max((bit<3>)bvlYVa, 3w4)].DAiV = h.wbSp.HVKB;
        h.kTDU.eth_type = 16w27208;
        const bit<16> FLSZux = (16w22483 |+| 16w60328) * 16w7692;
    }
}

parser Parser(packet_in b, out Headers hdr);
control Ingress(inout Headers hdr);
package top(Parser p, Ingress ig);
top(p(), ingress()) main;

