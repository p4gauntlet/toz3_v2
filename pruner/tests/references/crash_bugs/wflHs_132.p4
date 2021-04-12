#include <core.p4>
bit<3> max(in bit<3> val, in bit<3> bound) {
    return val < bound ? val : bound;
}
header ethernet_t {
    bit<48> dst_addr;
    bit<48> src_addr;
    bit<16> eth_type;
}

header gshtZr {
    bit<32> RbAp;
    bit<64> nYRO;
    bit<32> paNB;
    bit<64> gpRw;
    bit<16> SwvD;
}

header xWYJTN {
    bit<8> astn;
    bit<8> kyes;
    bit<4> eyvp;
}

struct Headers {
    ethernet_t eth_hdr;
    gshtZr     JQlW;
    gshtZr     szOQ;
    ethernet_t YYSU;
    gshtZr[6]  XgXd;
}

bit<16> zvVNECN(inout bit<64> UgWi, gshtZr jFuj) {
    UgWi = 106w21210677851122442359690029334780[92:29];
    return jFuj.SwvD;
    UgWi = 1532747957;
    UgWi = 64w9364408696983777248 % 64w9632053368292835330;
    UgWi = 64w18166853282040433883;
    UgWi = (!((~(bit<196>)(bit<196>)jFuj.SwvD)[132:59] == 74w7275213887758268495563) ? 64w13332919379258648431 | jFuj.nYRO : 64w8627688701509045792);
    UgWi = jFuj.gpRw;
    UgWi = jFuj.gpRw;
    UgWi = 64w11545465833213441671 |+| (bit<64>)(-403678036 & -2048739740);
    UgWi = 64w5442823810191288423 % 64w17306915685127187622 | (116w2442416887456949380017769375305054 & 116w34020220224591453989584130038696291)[77:14];
    return 16w15386;
}
parser p(packet_in pkt, out Headers hdr) {
    bit<128> dXiaZd = (bit<128>)hdr.XgXd[5].nYRO;
    bit<16> nmvNXu = hdr.YYSU.eth_type;
    bit<128> myxqRj = 128w313728663306351415287659803878073802160 ^ 128w247088382900569506106107118240159107092;
    bool TzCKMV = false;
    bool bEVMPO = !!!!!false;
    state start {
        transition parse_hdrs;
    }
    state parse_hdrs {
        pkt.extract(hdr.eth_hdr);
        pkt.extract(hdr.JQlW);
        pkt.extract(hdr.szOQ);
        pkt.extract(hdr.YYSU);
        pkt.extract(hdr.XgXd.next);
        pkt.extract(hdr.XgXd.next);
        pkt.extract(hdr.XgXd.next);
        pkt.extract(hdr.XgXd.next);
        pkt.extract(hdr.XgXd.next);
        pkt.extract(hdr.XgXd.next);
        transition accept;
    }
}

control ingress(inout Headers h) {
    ethernet_t eFxdzn = h.eth_hdr;
    action dUbOl(bit<64> sLPS) {
        h.JQlW.paNB = 32w2300139310 / 32w2972338229;
        const bit<32> gZlvTF = (-55w29629525492944921)[46:15];
        h.XgXd[5].nYRO[43:28] = 16w58302;
        h.JQlW.nYRO = --137011434 - -2022642336 + 289335292 | 2017935573;
        h.YYSU.eth_type = 16w54103 + h.YYSU.eth_type & -(false ? (bit<16>)16w62364 : 16w45120);
        bit<32> nBmBDv = 32w1130166714;
        h.XgXd[max((bit<3>)zvVNECN(h.szOQ.nYRO, { -708346825, 64w13544346735733648404, 32w512714473, 64w18310164472621113371, 16w23806 }), 3w5)].RbAp = 32w864455019;
        h.eth_hdr.src_addr = (bit<48>)zvVNECN(h.szOQ.nYRO, { 32w40078126, 64w1359265666660628803, 32w115072457, ((bit<132>)132w1521168706950882015814269514883949093207)[116:2][64:1], 16w31595 |+| 16w24392 });
        nBmBDv = 32w2372377001 << (bit<8>)32w2748952592;
        eFxdzn.src_addr = -904101248;
    }
    table RGCyPy {
        key = {
            h.XgXd[5].SwvD                                                                                                                              : exact @name("YQNeBH") ;
            h.JQlW.gpRw                                                                                                                                 : exact @name("ifCVyt") ;
            (true ? h.YYSU.src_addr | ((bit<148>)(148w271459143469771596678284411681144375195756465 * (bit<148>)h.JQlW.paNB))[102:55] : h.YYSU.src_addr): exact @name("yaGJNK") ;
        }
        actions = {
            dUbOl();
        }
    }
    apply {
        bool Jvuqrm = true;
        bit<4> ZGknBz = (bit<4>)eFxdzn.eth_type << (bit<8>)4w2;
        bit<64> VytFjf = ((bit<95>)h.JQlW.paNB)[74:11];
        const int AXUyrM = ---238813955;
        const bit<128> IcoSKn = AXUyrM & (251w361831114366649411305602110303591930210781263813623393733434243773904441982 * ((bit<304>)304w1294671376010869970342688321832591554044082851448736046777858225891169485781288984592180399)[293:43])[177:50];
        ZGknBz = 4w0;
        bit<8> OCNltr = 8w28 + 8w194 / 8w128;
        h.JQlW.RbAp = 32w3184132697;
        {
            h.YYSU.eth_type = h.szOQ.SwvD;
            ZGknBz = (bit<4>)zvVNECN(h.szOQ.nYRO, { 32w3749389029, 64w3051290303244015581, 32w873947510, 64w7114723845491352957, 16w42810 });
            const bit<16> QMseko = 16w56407;
            h.XgXd[max(3w4 % 3w7, 3w5)].RbAp = 32w63001768;
            OCNltr = 8w64;
            h.JQlW.nYRO[15:8] = 8w147 |+| 8w98;
            const bit<32> mYhKao = ((bit<160>)1934028636)[108:77];
        }
        switch (RGCyPy.apply().action_run) {
            dUbOl: {
                ethernet_t[9] zrdXxE;
                eFxdzn.eth_type = 16w22479;
                const bool FQNjAJ = true;
                zvVNECN(h.JQlW.gpRw, { (true ? 32w1887030667 : 32w2737220853 + -(32w3430501615 & 32w504252173)), 64w2147781012025451184, 32w3310291676, 64w17323040253416638305, 16w5679 });
                h.XgXd[max((bit<3>)h.eth_hdr.eth_type, 3w5)].RbAp = ((bit<48>)zvVNECN(VytFjf, { 32w3839049458, 64w5094347083242761654, 32w486310960, 64w15053441678636493102, 16w13010 }))[35:4] + h.JQlW.RbAp;
            }
        }
    }
}

parser Parser(packet_in b, out Headers hdr);
control Ingress(inout Headers hdr);
package top(Parser p, Ingress ig);
top(p(), ingress()) main;

