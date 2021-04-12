#include <core.p4>
bit<3> max(in bit<3> val, in bit<3> bound) {
    return val < bound ? val : bound;
}
header ethernet_t {
    bit<48> dst_addr;
    bit<48> src_addr;
    bit<16> eth_type;
}

header bnsYVz {
    bit<128> jrPy;
    bit<64>  udHf;
    bit<8>   aPsC;
    bit<32>  wzfl;
}

struct umHNtO {
    bit<8> jXYS;
    bnsYVz SDFX;
}

struct VWxZaz {
    bit<4>  yJxL;
    bit<64> FnFc;
}

struct Headers {
    ethernet_t eth_hdr;
    bnsYVz[7]  Qcqz;
    bnsYVz     UHmR;
    bnsYVz     JfMU;
    ethernet_t YskI;
}

bit<16> vSDNsyx(in bit<32> saFq, VWxZaz vqBE) {
    bit<16> LfCwyK = 16w63290;
    LfCwyK = 16w36171 - (16w35780 | (16w35234 | 16w4425)) | 16w40027;
    LfCwyK = 16w8558 / 16w27128;
    if (true) {
        bit<16> Kgfjeu = -16w7771;
        LfCwyK = Kgfjeu;
        bool FguEFg = false;
        Kgfjeu = 16w28563 / 16w55544;
        LfCwyK = 85w22312459161451355016753648[26:11];
        const bit<16> Mpuvfe = 16w22282;
        const ethernet_t wwFJrt = { (false ? 48w92806619070701 : 48w248110668298200 % 48w33628792784314), 48w275734269889313, ((bit<109>)(1139038023 / 821507996 | 590073651 | 109w64030816813754883065862743909861))[60:45] };
        const bit<32> qUbNwO = ~32w1610212708 & 32w1035737866 >> (bit<8>)580955618;
        LfCwyK = wwFJrt.eth_type;
        Kgfjeu = 16w52119;
        Kgfjeu = (bit<16>)16w45061 |-| 16w50028;
        return (-494856963 | (5737880 - -584871676) * -1609073689 != 78w39878804637532503966493 ? (bit<16>)-1800331592 : 16w52008);
    } else {
        LfCwyK = (bit<16>)16w16356;
    }
    return (false ? (bit<16>)((-1387559264 & 1240215165 / 1234297945) + 16w16219) : 16w27306);
}
control XjhdqPA() {
    bit<4> XAHFaZ = 4w2 & 4w8;
    bit<128> difcYb = 128w286488923881418342646904869346809782665 |+| 128w220713491716096636206371636579065165894;
    bit<32> NHAcsf = (bit<32>)difcYb;
    bit<32> NBhxOY = 32w2535783579;
    action ejnWB(bit<8> xpbU) {
        difcYb = difcYb;
        difcYb = (bit<128>)128w95068953460117517858764100151589921693;
        XAHFaZ = 4w8;
        vSDNsyx(NBhxOY, { 4w10, 64w729647273732318193 });
        const bool HaGozC = false;
    }
    table GhsaxE {
        key = {
            XAHFaZ       : exact @name("lpWdPY") ;
            32w2426521520: exact @name("srdvlo") ;
            32w3069949830: exact @name("xIxLbp") ;
        }
        actions = {
        }
    }
    table NZqfiU {
        key = {
            NBhxOY                                                : exact @name("PYKqvq") ;
            ((bit<16>)NHAcsf == 16w15843 ? NBhxOY : 32w3069792159): exact @name("esQVok") ;
        }
        actions = {
        }
    }
    table yvZmvC {
        key = {
            XAHFaZ                                    : exact @name("Ehmics") ;
            128w15531702789371422422369389068796239506: exact @name("ZonmhE") ;
        }
        actions = {
        }
    }
    apply {
        if (false && 103w8133681788298328207600220242266 == 103w7259512636499150136746384617843) {
            NHAcsf = 32w3364275006;
        } else {
            vSDNsyx(NHAcsf, { -4w9, 64w11240253083813619628 });
        }
        if (GhsaxE.apply().hit) {
            if (false) {
                vSDNsyx(32w3011247115, { 4w0, 64w11425435033288246494 |+| 64w16025321502362841879 });
            } else {
                difcYb = difcYb;
            }
        } else {
            XAHFaZ = XAHFaZ |+| 4w10;
        }
        vSDNsyx(32w3705773083, { 4w0, (312487778 + ((bit<248>)(248w423726937738399668984495231287734906361179082861596394065769838967127304898 - 357136973))[233:85])[135:72] });
        bit<8> JVUnlO = ~(bit<8>)XAHFaZ;
        JVUnlO = JVUnlO;
    }
}

parser p(packet_in pkt, out Headers hdr) {
    bit<128> UhlOhS = 128w85714345476499980398768174508989346780;
    bit<8> LYaBct = hdr.Qcqz[6].aPsC;
    bit<16> sbygWO = ~16w59797;
    umHNtO pPtwdp = { 8w104 % 8w226, { -128w244975854704164349555203778812209679009, 64w8476104286824138589, 549322804, 32w3970429637 } };
    bool kYEOCD = !true;
    state start {
        transition parse_hdrs;
    }
    state parse_hdrs {
        pkt.extract(hdr.eth_hdr);
        pkt.extract(hdr.Qcqz.next);
        pkt.extract(hdr.Qcqz.next);
        pkt.extract(hdr.Qcqz.next);
        pkt.extract(hdr.Qcqz.next);
        pkt.extract(hdr.Qcqz.next);
        pkt.extract(hdr.Qcqz.next);
        pkt.extract(hdr.Qcqz.next);
        pkt.extract(hdr.UHmR);
        pkt.extract(hdr.JfMU);
        pkt.extract(hdr.YskI);
        transition accept;
    }
}

control ingress(inout Headers h) {
    bit<64> wOFsfK = 64w13111653587692407561;
    bit<128> nLpKxc = (bit<128>)128w325269345603739741069037101822668606713 |-| 128w84584860334433164308529097265885118788;
    VWxZaz FhOckJ = { 4w12, (!false ? 64w17866028313424583548 |+| h.JfMU.udHf : wOFsfK) + (h.UHmR.udHf | 64w9665874079017227803) };
    bit<8> cSydCp = 8w209;
    bit<8> sdWZsc = -8w197;
    XjhdqPA() sSDiPy;
    action fjxzW(out bit<16> VQxM, bit<32> DQDm) {
        bit<128> eVpRxp = ~128w292123922927563514000175356147749153358;
        h.UHmR.wzfl = h.UHmR.wzfl;
        h.JfMU.udHf = 64w12005394151604349483;
        cSydCp = cSydCp;
        bit<16> tpbMDX = h.YskI.eth_type;
    }
    action QyHme(out bit<16> ecWy, bit<16> bZof) {
        sdWZsc = 8w129;
        h.Qcqz[max((bit<3>)vSDNsyx(32w2430609032 & h.Qcqz[6].wzfl, { 4w10, ~64w3827014771312526956 }), 3w6)].udHf = FhOckJ.FnFc;
        h.YskI.eth_type = 16w21221;
        const VWxZaz LSqkmT = { 3w4 ++ 1w1, (4w10 != 4w9 ? (1006122196 ^ (76w68331248103753846149283 == 76w66517112870809957786761 ? (bit<64>)64w12122900012083924878 : 64w3136497845279426671)) |-| 64w8303194803467577792 : (bit<64>)-1064867395) };
        FhOckJ.yJxL = 4w12;
        if (false) {
            h.YskI.eth_type = bZof - 16w12441;
        } else {
            sdWZsc = (bit<8>)vSDNsyx(((bit<118>)h.eth_hdr.dst_addr)[33:2], { 4w0 | 61w2301853489967531862[59:56] + 4w12, -64w14485753867703456625 });
        }
        bit<16> YZnNif = 16w17416;
        h.eth_hdr.dst_addr = (bit<48>)h.eth_hdr.src_addr;
        bit<8> rbgkDJ = sdWZsc;
        h.YskI.eth_type = 16w63833;
    }
    table KWzGQN {
        key = {
            32w3360203518: exact @name("MarebU") ;
        }
        actions = {
            fjxzW(h.eth_hdr.eth_type);
        }
    }
    table KWnxHC {
        key = {
            (bit<128>)(h.Qcqz[6].jrPy + h.UHmR.jrPy): exact @name("rXqbdF") ;
        }
        actions = {
            QyHme(h.eth_hdr.eth_type);
            fjxzW(h.eth_hdr.eth_type);
        }
    }
    apply {
        FhOckJ.yJxL = FhOckJ.yJxL;
        h.JfMU.wzfl = h.Qcqz[6].wzfl;
        bool rbaYHy = !!false;
        switch (KWnxHC.apply().action_run) {
            QyHme: {
                FhOckJ.yJxL = -1959956983;
                switch (KWzGQN.apply().action_run) {
                    fjxzW: {
                        fjxzW(h.YskI.eth_type, 32w105667670);
                        h.YskI.eth_type = 16w24159;
                        bool kScRwf = false || !true;
                        vSDNsyx(h.UHmR.wzfl, { (bit<4>)4w5 |+| 4w1 |+| 4w4, 123w7930521256234737305015719049003866857[67:4] });
                    }
                }
                if ((bit<111>)h.JfMU.udHf |+| (!true ? 111w1236401057756353670966141155429790 : 111w2526304119234787890214156591217201) == -1668468000 | 111w211409768366131328176728869590001) {
                    vSDNsyx(32w210336152, { 4w11 * -4w5, 64w14701306254517455677 });
                } else if (rbaYHy) {
                    wOFsfK = h.JfMU.udHf;
                } else {
                    FhOckJ.FnFc = (bit<64>)(64w10338405748581495007 & 64w1093134919371892837) << (bit<8>)wOFsfK;
                }
                vSDNsyx(h.Qcqz[6].wzfl, { 4w13, 64w17061712064065181728 });
                h.UHmR.udHf = -(1230516331 - 1708912840 + 881413714 & 2129671709);
                FhOckJ.yJxL = (bit<4>)4w5 |-| (bit<4>)(368307818 % 1344771376);
                QyHme(h.YskI.eth_type, 38w160731817231[19:4]);
            }
            fjxzW: {
                h.JfMU.jrPy = ((bit<54>)h.UHmR.udHf == ~(bit<54>)sdWZsc ? (bit<192>)h.YskI.eth_type : 192w1192956424164381399590339090467922880015907154392632530384 << (bit<8>)192w3737757578338074019258850381766363773371897204759398486061)[134:7];
                h.JfMU.jrPy = 128w193052503085831149826422786703707247673;
                return;
                QyHme(h.YskI.eth_type, 16w45423 |-| 16w14019 + 16w62333 ^ 106w37418041092062994007365992982779[55:40]);
                sdWZsc = sdWZsc;
                vSDNsyx((false ? 32w2176280151 | 32w2840466493 : 32w1676694749), { -1221151596 & (((bit<40>)40w743696331619 << (bit<8>)40w193889165000) + 40w936953160342)[25:22], ~64w16744263779937016702 & ((bit<189>)(189w199568684695633241252944742728179702775940136142003774642 + 1006110638))[107:44] });
                const bit<8> ywEePa = 8w89;
                vSDNsyx(32w1955375293, { (4w5 | 4w8) + 4w3 - 4w10 |-| 4w0, 64w9598593307938980886 });
                fjxzW(h.YskI.eth_type, 32w1394983559);
            }
        }
        h.UHmR.wzfl = h.JfMU.wzfl;
        QyHme(h.eth_hdr.eth_type, 16w44230);
        h.UHmR.jrPy = h.UHmR.jrPy |+| h.JfMU.jrPy;
        const bit<16> HTkrRS = 16w27027;
        h.eth_hdr.dst_addr[46:39] = 8w149;
    }
}

parser Parser(packet_in b, out Headers hdr);
control Ingress(inout Headers hdr);
package top(Parser p, Ingress ig);
top(p(), ingress()) main;

