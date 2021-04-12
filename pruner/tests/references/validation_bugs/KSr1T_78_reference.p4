#include <core.p4>

bit<3> max(in bit<3> val, in bit<3> bound) {
    return (val < bound ? val : bound);
}
header ethernet_t {
    bit<48> dst_addr;
    bit<48> src_addr;
    bit<16> eth_type;
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

header RTynIY {
    bit<64>  krNS;
    bit<128> DAiV;
    bit<8>   zLYh;
    bit<16>  PEbw;
    bit<64>  Duyw;
}

struct Headers {
    ethernet_t eth_hdr;
    KAJGns     wbSp;
    RTynIY[5]  fYBu;
    KAJGns     baZN;
    ethernet_t kTDU;
}

bit<32> lGMFroS(bit<16> FPYu, AlSZfJ llZX, bit<4> BakX) {
    return (bit<32>)llZX.ffxT;
}
action jnMmz() {
}
action iXTNV(out bit<64> TnLM, bit<16> YWwH) {
}
bool gQYTcQO(bit<128> bEik) {
    return false;
}
parser p(packet_in pkt, out Headers hdr) {
    state start {
        transition parse_hdrs;
    }
    state parse_hdrs {
        transition accept;
    }
}

control ingress(inout Headers h) {
    bool qmzYfC = gQYTcQO(128w199598718444784908296413532893811945341);
    bit<32> bvlYVa = 32w2248833910;
    action gsbCn() {
        if (gQYTcQO(128w54072657560468442005888502744051793146)) {
        } else {
            h.fYBu[max(3w0, 3w4)].krNS = h.fYBu[4].krNS;
        }
    }
    table IUTyFm {
        key = {
        }
        actions = {
            @defaultonly NoAction();
        }
        default_action = NoAction();
    }
    table jiPqvW {
        key = {
            h.kTDU.dst_addr: exact @name("GlTKLd") ;
            h.fYBu[4].Duyw : exact @name("ZuGqQM") ;
        }
        actions = {
            gsbCn();
            jnMmz();
            @defaultonly NoAction();
        }
        default_action = NoAction();
    }
    table zYjbqx {
        key = {
        }
        actions = {
            gsbCn();
            @defaultonly NoAction();
        }
        default_action = NoAction();
    }
    apply {
        switch (jiPqvW.apply().action_run) {
            gsbCn: {
                h.wbSp.HVKB = (!IUTyFm.apply().hit ? 128w211827179621503608920366146701087714804 : 128w45876058285980019223767005923137213723);
                bvlYVa = 32w643309980;
                gQYTcQO(128w28499072391495367540287065859402676875);
                h.fYBu[max(3w3, 3w4)].Duyw = 64w9550098848346991727;
                h.fYBu[max((bit<3>)h.eth_hdr.eth_type, 3w4)].Duyw = 64w1041055284648021073;
            }
            jnMmz: {
                bvlYVa = (!zYjbqx.apply().hit ? bvlYVa : ((bit<37>)bvlYVa)[32:1]);
                iXTNV(h.fYBu[4].DAiV[63:0], 16w42623);
                bvlYVa = bvlYVa;
                h.baZN.gpiu = 4w0;
            }
        }
        h.wbSp.gpiu = 4w12;
        lGMFroS(16w6131, { 4w0, 128w304463212597028295517497661946494318313 }, 4w15);
        h.fYBu[max(3w7, 3w4)].DAiV = h.wbSp.HVKB;
        h.wbSp.HVKB = 128w13240102929820680615714094648727380627;
        h.fYBu[max((bit<3>)bvlYVa, 3w4)].DAiV = h.wbSp.HVKB;
        h.kTDU.eth_type = 16w27208;
    }
}

parser Parser(packet_in b, out Headers hdr);
control Ingress(inout Headers hdr);
package top(Parser p, Ingress ig);
top(p(), ingress()) main;

