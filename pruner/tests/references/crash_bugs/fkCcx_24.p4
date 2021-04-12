#include <core.p4>
bit<3> max(in bit<3> val, in bit<3> bound) {
    return val < bound ? val : bound;
}
header ethernet_t {
    bit<48> dst_addr;
    bit<48> src_addr;
    bit<16> eth_type;
}

struct zRDuhm {
    bit<128>   LEQY;
    bit<8>     KOcO;
    ethernet_t EWpj;
    bit<32>    BUWO;
    bit<32>    NnjD;
}

header PguzcJ {
    bit<4>  YRcl;
    bit<32> vGcj;
    bit<16> CazW;
}

header yLNoil {
    bit<128> ILBe;
    bit<64>  MXzB;
}

header vuOVMH {
    bit<8>   GPVl;
    bit<4>   hrds;
    bit<128> HoON;
    bit<32>  Wsxt;
}

struct avXIXF {
    bit<64> Vpbo;
    bit<32> CeRJ;
    zRDuhm  tkyq;
}

header gPTIia {
    bit<32> pvdW;
    bit<8>  HQZo;
}

struct OXxQuH {
    bit<8> xBZh;
}

header jUHTpn {
    bit<4>  yrVX;
    bit<32> bZKC;
}

struct Headers {
    ethernet_t    eth_hdr;
    ethernet_t[6] gvFM;
    gPTIia        uAdg;
    PguzcJ        IDZn;
    PguzcJ        zoNJ;
    gPTIia        oWtO;
}

bit<16> SaTkzAX(PguzcJ Oofi) {
    bool cmdluC = !false;
    bit<32> cqckxY = Oofi.vGcj << (bit<8>)(32w976986832 & 32w311465418 + 32w1971875545 & 32w1460926971);
    cqckxY = 53w4355893458421722[43:12];
    cqckxY = ~(bit<32>)(32w2990396617 |-| (Oofi.vGcj - Oofi.vGcj));
    cqckxY = Oofi.vGcj;
    bit<128> RfSkhs = 128w255046264356700042456407046157917616401;
    bit<64> nZqXev = (bit<64>)Oofi.vGcj;
    bit<128> xYhUqh = RfSkhs;
    xYhUqh = 225w3808095456021307375735969044668577570780306544738254861630845460956[188:61];
    xYhUqh[119:88] = 156w52382157091350021455032410882841854966214663683[127:96];
    cqckxY = -(-1692882503 + 1306595994 ^ -951988268);
    return 16w54365;
}
yLNoil wClaYko(jUHTpn DoHl) {
    bit<4> wgIKEQ = 4w14;
    const zRDuhm zTQmam = { 128w232569008864530135157127505601818385808, (bit<8>)(8w137 & 8w141) |-| 8w9, { 93w9750091226825708111347130396[88:41], 48w13821584846488, 16w5400 }, 32w467878380 << (bit<8>)32w1187445161, 32w2274055191 };
    SaTkzAX({ 4w9, ~32w4107567417, -1981422884 });
    SaTkzAX({ 4w10, (!(!false || false) ? (bit<32>)32w629051281 : 32w2377063623), 16w61179 |-| 16w29315 });
    return { 256w19522370067995668980382466687555798596205229009241957474696495547980267111633[236:109], 64w9293289569659825227 };
}
bit<4> rjsgGkN(bit<16> SOZw) {
    if (!false) {
        ;
    } else {
        ;
    }
    const bit<128> cMIrQM = 128w159430385411339469055938130538993747062;
    bit<16> YVHHin = (923067816 & -45212461 + 387831240 + 1479877904) - -1469958711;
    return ~~(bit<4>)(bit<4>)SOZw;
    YVHHin = 16w17060;
    YVHHin = SOZw;
    bit<8> XmGxDm = -406151311 - (bit<8>)cMIrQM;
    YVHHin[8:1] = 8w16;
    bit<16> aneguV = (bit<16>)((bit<22>)1761976363)[18:3];
    return (103w6099021888529345165436319823087 |-| 103w4797376423156861562882043119154)[89:86] |-| (4w13 - 4w3);
}
parser p(packet_in pkt, out Headers hdr) {
    bit<4> WCyPOo = ((bit<145>)hdr.gvFM[5].eth_type)[106:58][12:9];
    bit<4> OpKEBC = (true ? 4w14 |-| 4w14 : hdr.zoNJ.YRcl) << (bit<8>)(4w8 * 4w7);
    yLNoil LnJSsf = { ((bit<183>)rjsgGkN(16w56034))[129:2], 64w8739799105651448972 };
    bool MHFZYM = false;
    bit<8> AfRsJs = (bit<8>)((8w38 >> (bit<8>)455187081) * 8w179) |-| hdr.oWtO.HQZo;
    state start {
        transition parse_hdrs;
    }
    state parse_hdrs {
        pkt.extract(hdr.eth_hdr);
        pkt.extract(hdr.gvFM.next);
        pkt.extract(hdr.gvFM.next);
        pkt.extract(hdr.gvFM.next);
        pkt.extract(hdr.gvFM.next);
        pkt.extract(hdr.gvFM.next);
        pkt.extract(hdr.gvFM.next);
        pkt.extract(hdr.uAdg);
        pkt.extract(hdr.IDZn);
        pkt.extract(hdr.zoNJ);
        pkt.extract(hdr.oWtO);
        transition accept;
    }
}

control ingress(inout Headers h) {
    bit<128> WbiJDx = 128w230764102599282411499082228184235706426 << (bit<8>)(bit<128>)h.uAdg.pvdW;
    action AWhhg(inout bit<16> HpDQ, OXxQuH GSUK) {
        h.oWtO.HQZo = 112w1096859651321952115076139556402707[108:101];
        WbiJDx = WbiJDx >> (bit<8>)((bit<153>)h.zoNJ.CazW)[145:18];
        WbiJDx = 186w8337374138042653642414630052276323364613217985533230846[152:25];
        h.eth_hdr.dst_addr = 48w135542476226114;
    }
    action TyIkj(bit<8> cFUf, bit<64> UYcs) {
        const bool naGUDB = (!true || !true) && true;
        h.oWtO.pvdW[6:3] = h.IDZn.YRcl;
        return;
        h.oWtO.HQZo = ((1732994577 % 1411449109 == 71w2017512095498193963010 ? (bit<8>)8w224 : cFUf) | 8w14) ^ 8w204;
        const bit<32> kFhgzn = 32w2515642767;
        return;
        WbiJDx[91:44] = 48w272531794620301;
        h.gvFM[max(3w0, 3w5)].src_addr = 48w203258900165776;
        h.oWtO.pvdW = (32w2608311328 & 32w2476398026 - 32w1441157033 |+| 32w2175454093) + 32w4028141367;
        h.zoNJ.CazW = h.zoNJ.CazW << (bit<8>)16w9798;
    }
    action isfLJ(inout bit<4> zayb, bit<32> ezim, bit<16> pxcw) {
        {
            h.IDZn.CazW = pxcw;
            h.eth_hdr.src_addr = 48w90496617933680;
            if (false) {
                SaTkzAX({ 4w15, (!!false ? 32w927456075 : (true ? 32w3555769023 : 32w1144099597 |+| 32w3774134734 |+| 32w636251679)), 16w21070 });
            } else {
                h.eth_hdr.dst_addr = h.eth_hdr.src_addr;
            }
            SaTkzAX({ 4w12 + 4w15 |+| (4w1 + 4w12 & 4w9), (false || false ? 32w2832525681 : 32w4190790495 + 32w2584435977), 61w796255908266772997[47:32] });
            h.gvFM[max(29419737 / 48837486 * (347620462 - 1556145486) | 389123350, 3w5)].eth_type = pxcw;
            h.eth_hdr.eth_type = ((bit<107>)107w113920622581836094351669620800934 << (bit<8>)(107w45649932867531667322354025133010 | 107w78553896838359838577808254500687))[69:54] |-| pxcw;
        }
        WbiJDx = 128w43698975437500595018063904588234248684;
        {
            WbiJDx = 128w275312314828204388940997015592181595566;
            zayb = (true ? h.zoNJ.YRcl : ~(bit<4>)rjsgGkN(16w16281));
            h.IDZn.vGcj[21:6] = 16w55071;
            h.eth_hdr.eth_type = ((bit<64>)(1603084503 ^ -2008998325) << (bit<8>)(bit<64>)h.zoNJ.CazW)[58:43] |+| (bit<16>)-339967439;
            WbiJDx = 128w306306912619061996580767406058122333890 ^ (212w2071495984701780429531773633938322099852030096121985617665120012 + 212w9678117117719072104526369878597648141300073536727571223257078)[175:48];
            h.oWtO.HQZo = 8w41;
            avXIXF paUCEG = { (!false ? ((bit<92>)(-1183399688 & (2023480760 | -779986141)))[79:16] : 64w10562330692707916270), 32w2544144530, { 228w275302760863012965278416883644179323487011640634936400282777414150685[223:96] ^ 128w182661299488361167691761128677924811809 - (128w78000804950940600464229284873229990171 ^ WbiJDx), (bit<8>)((true ? h.uAdg.HQZo : 79w549716962449153711019286[30:23]) * 8w191), { ((bit<48>)rjsgGkN(-237170753) | (bit<48>)48w255971256527943) ^ 48w278223898404724, 48w161226287611066, pxcw }, -502793114, 32w1755077701 | 754290833 - -1803580905 ^ 32w3900327516 | 32w810159841 } };
            rjsgGkN(16w7565);
            h.eth_hdr.dst_addr = 48w82028776177001;
        }
        h.IDZn.CazW = 16w21096;
        rjsgGkN(16w33361);
        const gPTIia khmurm = { 32w2320312892, 8w251 };
        h.gvFM[max((bit<3>)h.gvFM[5].dst_addr, 3w5)].eth_type = (!true ? (!false ? (bit<16>)16w60787 : 16w6723) : ~h.eth_hdr.eth_type);
    }
    table xLdpWu {
        key = {
            16w19744 - (bit<16>)rjsgGkN(16w53243) + h.zoNJ.CazW: exact @name("wvtOpl") ;
        }
        actions = {
            isfLJ(h.IDZn.YRcl);
        }
    }
    table uiTHkJ {
        key = {
        }
        actions = {
        }
    }
    table YfGdXm {
        key = {
        }
        actions = {
            isfLJ(h.uAdg.pvdW[20:17]);
        }
    }
    table ObUSpl {
        key = {
            4w9                                     : exact @name("LzviDL") ;
            16w19115                                : exact @name("SBnBQt") ;
            48w145114785635731 |-| 48w40357476413227: exact @name("JEgqHq") ;
        }
        actions = {
            isfLJ(h.IDZn.YRcl);
        }
    }
    apply {
        if (false) {
            SaTkzAX({ (true ? 4w4 : 4w0), 32w235818323, 16w26918 & 16w22893 });
        } else {
            h.oWtO.HQZo = h.oWtO.HQZo;
        }
        switch (uiTHkJ.apply().action_run) {
        }
        h.oWtO.pvdW = 32w1372758052;
        rjsgGkN(16w27495);
        h.IDZn.vGcj = 32w1848326472;
        const int XsZqcA = -181433741;
        bit<128> CYNOag = 128w334026077963046502987531789306364882607 % 128w265887469004083192120991749373446071196;
        const bit<4> lgWdgD = 90w636317275440791078717543657[31:28];
        h.gvFM[max((bit<3>)SaTkzAX({ 4w6, 32w3993360711, 1751218449 % 457032694 }), 3w5)].src_addr = ~(((bit<54>)54w9447944563093488 >> (bit<8>)54w3260456852295509 == 54w12008906328605216 ? (bit<48>)XsZqcA : h.gvFM[5].src_addr) |-| h.eth_hdr.dst_addr);
        bit<64> GTZTgt = 64w13008128410399567548 >> (bit<8>)(bit<64>)h.IDZn.vGcj;
    }
}

parser Parser(packet_in b, out Headers hdr);
control Ingress(inout Headers hdr);
package top(Parser p, Ingress ig);
top(p(), ingress()) main;

