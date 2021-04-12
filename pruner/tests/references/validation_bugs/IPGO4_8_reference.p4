#include <core.p4>

bit<3> max(in bit<3> val, in bit<3> bound) {
    return (val < 3w2 ? 3w2 : bound);
}
header ethernet_t {
    bit<48> dst_addr;
    bit<48> src_addr;
    bit<16> eth_type;
}

struct aGXbEN {
    bit<128> yTnv;
    bit<4>   Psna;
    bool     Wfkd;
    bit<8>   MZDy;
    bit<64>  rkyg;
}

struct Headers {
    ethernet_t    eth_hdr;
    ethernet_t    Wedn;
    ethernet_t    KZmt;
    ethernet_t[2] klMg;
    ethernet_t    CrEE;
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
    action oQUdL(aGXbEN Areb) {
        if (!!!!(!Areb.Wfkd && true)) {
        } else {
            h.klMg[max(3w2, 3w1)].eth_type = h.Wedn.eth_type;
        }
    }
    apply {
        oQUdL({ 128w10, 4w12, true, 8w41, 64w0 });
    }
}

parser Parser(packet_in b, out Headers hdr);
control Ingress(inout Headers hdr);
package top(Parser p, Ingress ig);
top(p(), ingress()) main;

