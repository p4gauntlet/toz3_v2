#include <core.p4>

bit<3> max(in bit<3> val, in bit<3> bound) {
    return 3w2;
}
header ethernet_t {
    bit<48> dst_addr;
    bit<48> src_addr;
    bit<16> eth_type;
}

struct NAZvKo {
    bool    PZbt;
    bool    vAYd;
    bit<16> HYBx;
    bit<32> XcOv;
}

header vNUuQP {
    bit<8>  ETrI;
    bit<64> bUKc;
    bit<64> yxiq;
    bit<4>  JyBT;
}

header Mdpvgb {
    bit<8> TeIY;
    bit<4> LfLO;
}

struct Headers {
    ethernet_t    eth_hdr;
    vNUuQP        dSgK;
    vNUuQP        gUPl;
    Mdpvgb        AMIB;
    Mdpvgb[10]    vTHH;
    ethernet_t[9] aTcs;
}

bit<8> TFhEvSU(in Mdpvgb Mkfw, out bit<4> VPgh, Mdpvgb kemL) {
    bit<16> wUwiNa = 16w10;
    const bit<128> KNGgzK = 128w10;
    {
        const bit<16> xHhogc = 16w10;
        const bool VPQDqJ = true;
        bit<8> qiwFhS = 8w206;
        bool HqqaFY = true;
        return 8w10;
    }
    const int sBNVck = 113023712;
    return 8w10;
}
bool AuSgrSB() {
    bool WEVbSq = true;
    const bool lOSVgE = false;
    bool aBhMJQ = false;
    bit<8> hVBtEn = 8w10;
    vNUuQP hBKPvL = (vNUuQP){ETrI = hVBtEn,bUKc = 64w10,yxiq = 64w10,JyBT = 4w2};
    return true;
}
bit<16> mMjjrfi(bit<32> XROz) {
    const bit<4> DTLpkP = 4w10;
    {
        bool uEPPnT = false;
        bool CUFjMt = true;
        bit<8> UMRbqP = 8w10;
        ethernet_t gYDcCW = (ethernet_t){dst_addr = 48w10,src_addr = 48w10,eth_type = 16w10};
        return gYDcCW.eth_type;
    }
    {
        Mdpvgb uRSloa = (Mdpvgb){TeIY = 8w10,LfLO = 4w10};
    }
    {
        Mdpvgb dIkWfE = (Mdpvgb){TeIY = 8w10,LfLO = 4w10};
    }
    bit<128> teLRBS = 128w10;
    bit<128> yBDuHS = 128w10;
    bit<128> FGZyBY = 128w10;
    return 16w10;
}
parser p(packet_in pkt, out Headers hdr) {
    bit<128> qKeQXJ = 128w10;
    vNUuQP lBneZl = (vNUuQP){ETrI = 8w108,bUKc = hdr.dSgK.bUKc,yxiq = 64w10,JyBT = 4w10};
    ethernet_t[2] HvKDSM;
    bool rCYfod = false;
    bit<64> pMwnPg = 64w10;
    state start {
        transition parse_hdrs;
    }
    state parse_hdrs {
        transition accept;
    }
}

control ingress(inout Headers h) {
    bit<32> fHLkJQ = 32w10;
    bit<4> VogrIJ = 4w3;
    bit<4> DglsCD = VogrIJ;
    vNUuQP JJtpaz = (vNUuQP){ETrI = 8w10,bUKc = h.dSgK.bUKc,yxiq = 64w10,JyBT = h.gUPl.JyBT};
    action lBJGe(bit<4> VqqH, bit<128> mlYh) {
        bit<128> dGmlno = 128w10;
    }
    action naNRp(inout bit<64> fyaf, out bit<32> OEEJ, bit<128> KZqQ) {
        bool oDBhFM = true;
        h.aTcs[max((bit<3>)TFhEvSU({ h.vTHH[9].TeIY, 4w10 }, h.AMIB.LfLO, { 8w10, 4w10 }), 3w2)].src_addr = h.eth_hdr.src_addr;
        const bool XneKsi = false;
    }
    action TtncC(inout bit<4> ClFo, bit<8> xLMh) {
        return;
        const int xWEAyC = 1563578230;
    }
    table LXUTiq {
        key = {
            48w10      : exact @name("knrnEO") ;
            h.gUPl.yxiq: exact @name("ZQHnkq") ;
            48w10      : exact @name("jbKdTS") ;
        }
        actions = {
            @defaultonly NoAction();
        }
        default_action = NoAction();
    }
    apply {
        bit<32> SYepnh = 32w10;
        bit<16> VFoVmL = 16w10;
        const bit<128> Puozzm = 128w10;
        bit<8> oHqKvN = h.vTHH[9].TeIY;
        bit<16> CcxgjE = 16w10;
    }
}

parser Parser(packet_in b, out Headers hdr);
control Ingress(inout Headers hdr);
package top(Parser p, Ingress ig);
top(p(), ingress()) main;

