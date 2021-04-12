#include <core.p4>

bit<3> max(in bit<3> val, in bit<3> bound) {
    return 3w2;
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
    return 16w10;
}
control XjhdqPA() {
    bit<4> XAHFaZ = 4w10;
    bit<128> difcYb = 128w10;
    bit<32> NHAcsf = 32w10;
    bit<32> NBhxOY = 32w10;
    action ejnWB(bit<8> xpbU) {
        const bool HaGozC = false;
    }
    table GhsaxE {
        key = {
            XAHFaZ: exact @name("lpWdPY") ;
            32w10 : exact @name("srdvlo") ;
            32w10 : exact @name("xIxLbp") ;
        }
        actions = {
            @defaultonly NoAction();
        }
        default_action = NoAction();
    }
    table NZqfiU {
        key = {
            NBhxOY: exact @name("PYKqvq") ;
            NBhxOY: exact @name("esQVok") ;
        }
        actions = {
            @defaultonly NoAction();
        }
        default_action = NoAction();
    }
    table yvZmvC {
        key = {
            XAHFaZ: exact @name("Ehmics") ;
            128w10: exact @name("ZonmhE") ;
        }
        actions = {
            @defaultonly NoAction();
        }
        default_action = NoAction();
    }
    apply {
        bit<8> JVUnlO = 8w10;
    }
}

parser p(packet_in pkt, out Headers hdr) {
    bit<128> UhlOhS = 128w10;
    bit<8> LYaBct = hdr.Qcqz[6].aPsC;
    bit<16> sbygWO = 16w10;
    umHNtO pPtwdp = (umHNtO){jXYS = 8w10,SDFX = (bnsYVz){jrPy = 128w244975854704164349555203778812209679009,udHf = 64w10,aPsC = 8w52,wzfl = 32w10}};
    bool kYEOCD = false;
    state start {
        transition parse_hdrs;
    }
    state parse_hdrs {
        transition accept;
    }
}

control ingress(inout Headers h) {
    bit<64> wOFsfK = 64w10;
    bit<128> nLpKxc = 128w10;
    VWxZaz FhOckJ = (VWxZaz){yJxL = 4w12,FnFc = 64w10};
    bit<8> cSydCp = 8w209;
    bit<8> sdWZsc = 8w10;
    XjhdqPA() sSDiPy;
    action fjxzW(out bit<16> VQxM, bit<32> DQDm) {
        bit<128> eVpRxp = 128w10;
        bit<16> tpbMDX = h.YskI.eth_type;
    }
    action QyHme(out bit<16> ecWy, bit<16> bZof) {
        h.Qcqz[max((bit<3>)vSDNsyx(32w10, { 4w10, 64w10 }), 3w2)].udHf = FhOckJ.FnFc;
        const VWxZaz LSqkmT = (VWxZaz){yJxL = 4w10,FnFc = 64w1064867395};
        bit<16> YZnNif = 16w10;
        bit<8> rbgkDJ = sdWZsc;
    }
    table KWzGQN {
        key = {
            32w10: exact @name("MarebU") ;
        }
        actions = {
            fjxzW(h.eth_hdr.eth_type);
            @defaultonly NoAction();
        }
        default_action = NoAction();
    }
    table KWnxHC {
        key = {
            128w10: exact @name("rXqbdF") ;
        }
        actions = {
            QyHme(h.eth_hdr.eth_type);
            fjxzW(h.eth_hdr.eth_type);
            @defaultonly NoAction();
        }
        default_action = NoAction();
    }
    apply {
        bool rbaYHy = false;
        const bit<16> HTkrRS = 16w10;
    }
}

parser Parser(packet_in b, out Headers hdr);
control Ingress(inout Headers hdr);
package top(Parser p, Ingress ig);
top(p(), ingress()) main;

