#include <core.p4>

header ethernet_t {
    bit<48> dst_addr;
    bit<48> src_addr;
    bit<16> eth_type;
}

struct Headers {
    ethernet_t eth_hdr;
}

action dummy_action(inout bit<16> val1, in bit<16> val2) {}

parser p(packet_in pkt, out Headers hdr) {
    state start {
        transition parse_hdrs;
    }
    state parse_hdrs {
        transition accept;
    }
}

control ingress(inout Headers h) {
    action simple_action() {
        h.eth_hdr.eth_type = 16w1;
    }
    table simple_table {
        key = {
            16w1               : exact @name("key1") ;
        }
        actions = {
            simple_action();
            @defaultonly NoAction();
        }
        default_action = NoAction();
    }
    apply {
        dummy_action(h.eth_hdr.eth_type, simple_table.apply().hit ? 16w1 : 16w1);
    }
}

parser Parser(packet_in b, out Headers hdr);
control Ingress(inout Headers hdr);
package top(Parser p, Ingress ig);
top(p(), ingress()) main;
