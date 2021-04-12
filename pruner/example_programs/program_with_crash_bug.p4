/*In file: modules/p4c/frontends/p4/functionsInlining.cpp:41
[31mCompiler Bug[0m: modules/p4c/frontends/p4/functionsInlining.cpp:41: Null stat*/
#include <core.p4>
header ethernet_t {
    bit<48> dst_addr;
    bit<48> src_addr;
    bit<16> eth_type;
}

header TQTEFP {
    bit<8> vZLj;
}

struct heRCPE {
    bit<64> kvnn;
}

header IyUMff {
    bit<64> WpMa;
    bit<8>  ldBH;
    bit<64> FOtW;
    bit<8>  fmPS;
    bit<16> oeYt;
}

header KUsmkY {
    bit<8> xDll;
    bit<4> UGSv;
}

header TXTuTb {
    bit<8>  RfqA;
    bit<32> sVec;
}

header zmbESg {
    bit<4>   YvdW;
    bit<8>   ZCre;
    bit<128> zalH;
}

struct Headers {
    ethernet_t eth_hdr;
    TQTEFP     PDgT;
}

control uCvKhOG(bit<16> ZUvr, bit<32> IYTt) {
    bit<8> jzBHNx = 1040699008;
    bit<64> rZveRS = (bit<64>)jzBHNx;
    bit<64> PhOeBz = rZveRS;
    bool xzSLdz = false && (false || true);
    bit<128> bLOnet = (bit<128>)jzBHNx;
    bit<16> PWVYhI = 16w57828;
    action EhfPd(bit<64> WgaA) {
        bLOnet = ((bit<152>)(bit<152>)IYTt)[128:1];
        bit<8> PBsUls = jzBHNx << (bit<8>)111w420896023139788658949075859254956[77:70];
        jzBHNx = (53w4109838985351873 >> (bit<8>)(bit<53>)ZUvr)[19:12];
        PWVYhI = 16w13232;
        PWVYhI = 16w51416;
        return;
        bLOnet[89:26] = 64w17179589661376218634 * 64w6564743306873483317;
        const bit<32> QuTpRF = 32w1354564048;
        PWVYhI = PWVYhI;
    }
    action pUlnJ(out bit<4> DDbG, bit<32> gSzW) {
        DDbG = ((bit<62>)PWVYhI)[6:3];
        jzBHNx = (124w2039823832023441422548071825604831186 != 124w11840598612005879397085707546334385740 ^ (bit<124>)ZUvr ? 8w187 : jzBHNx >> (bit<8>)109w241085140210721891760862805387123[39:32]);
        ethernet_t yWAtdC = { (bit<48>)DDbG, ~48w260706387757884, ((bit<30>)IYTt)[25:10] & PWVYhI | 16w63230 };
        bLOnet = 128w264746475848133224461069475451310150166;
        const bit<128> YMcMgF = (715977200 & 902426062) - (-1592711695 ^ 1631296081);
        const int jmFuxD = -1354695764;
    }
    action Etdon(in zmbESg QEUD, bit<4> TKKV) {
        PWVYhI = 16w23478;
        jzBHNx = 8w122 / 8w83;
        const bit<16> mZCLRl = 16w56656;
        bLOnet = (bit<128>)128w148807677224248144532702897259982366779 |-| 128w197234406519979041517813747437517915003;
        bLOnet[116:53] = rZveRS;
    }
    table tFUmSn {
        key = {
            ZUvr + 16w13385 |+| 16w1895: exact @name("qWSzlT") ;
            16w65440                   : exact @name("rAAcxh") ;
            rZveRS                     : exact @name("GZmDdM") ;
        }
        actions = {
            EhfPd();
        }
    }
    apply {
        tFUmSn.apply();
        jzBHNx = jzBHNx;
        const bit<4> nQzzov = 4w1;
        bLOnet = bLOnet;
        {
            bit<4> wEJGXp = -((-478411504 + 803950701 & 1532635101) - 1406460888);
            pUlnJ(wEJGXp, ((bit<128>)128w238653826516684992477288704702948556906)[125:94]);
        }
        if (!true) {
            zmbESg LUjIvB = { nQzzov, 8w126, bLOnet - 128w65414145203699649326375437213324439593 };
            Etdon(LUjIvB, 4w3 - 4w13 |-| 4w14 ^ (66w14120671172526205717 != 66w4597814402483789722 ? 4w7 : 4w7));
        } else {
            rZveRS[15:8] = 8w56;
        }
        {
            zmbESg NwQqEz = { nQzzov, 8w54, bLOnet };
            Etdon(NwQqEz, 32092171);
        }
        bLOnet = 79512374;
        PWVYhI = 16w63324;
        jzBHNx = (bit<8>)8w112 << (bit<8>)jzBHNx << (bit<8>)jzBHNx;
        bLOnet = bLOnet;
    }
}

bool YucYTUW(out bit<128> Cggr, bit<32> OvaY) {
    Cggr = Cggr;
    const bit<4> CouXLc = 2w2 ++ (2w2 |-| ((bit<1>)1715977135 ++ 1w1));
    Cggr = Cggr;
    Cggr = 128w235982078738999229885123421195391775102;
    heRCPE GYyXnI = { 64w17595815506529274034 };
    bool bdmvLe = !true;
    bit<16> uPHOdD = (bit<16>)Cggr;
    GYyXnI.kvnn = GYyXnI.kvnn;
    GYyXnI.kvnn = (false ? (35w31733012902 == (bit<35>)uPHOdD ? 64w15514952240552254445 : 64w12110729341508140957) : ~64w8426672739969306797);
    GYyXnI.kvnn = 64w11472311063305578799;
    uPHOdD = -1970135477;
    return (true || bdmvLe) && false;
}
bit<16> meduGUf() {
    const bit<4> qwiFlE = 4w1 + (4w1 + 4w13);
    bit<128> skHakE = 128w336912505785778291400987086639438142101;
    skHakE = 128w173081761666648422874784367102885248277;
    skHakE = 128w113095479057511127077713823638229507937;
    skHakE = 128w111150677354806146728746315527429458427;
    return ((bit<72>)72w3102931532685428541402)[37:22];
}
bit<8> EAYWUhe() {
    bit<128> XLKWFm = (bit<128>)meduGUf();
    XLKWFm = 128w151630996350861975604840755397778695756 |+| ((true ? XLKWFm : (bit<128>)-462561291) & 128w64390379847042167802348032641328204362 & 128w225416248689024205706325460120293928828);
    XLKWFm = 128w64459324094312818530959577284682692469;
    YucYTUW(XLKWFm, (!(true && !true) ? 32w1575277573 : 74w483780877380504273483[45:14] | 32w3142932180 | 32w112101978));
    XLKWFm = ((bit<189>)XLKWFm)[146:19];
    XLKWFm = 128w195723486736805152967797221856433119616 + ((bit<237>)XLKWFm)[150:23] | XLKWFm << (bit<8>)128w245530320509338792831454871222366520334;
    XLKWFm = ~(XLKWFm << (bit<8>)128w161957896949600995184956578615822677969) >> (bit<8>)~(bit<128>)406993746;
    const bit<64> azrMSD = --248128496 ^ 1617945899 ^ -619374530;
    return (false ? ((bit<86>)(86w54765937049246885808107575 | 86w47912366024742521810918289) |+| 86w22032545419659073231992291)[40:33] : 8w50);
}
parser p(packet_in pkt, out Headers hdr) {
    IyUMff lyGfSL = { 64w14646742205442390075, -((bit<1>)(1523439996 + 1706647847) >> (bit<8>)1w1) ++ 7w91, (bit<64>)EAYWUhe(), -289759400 + 8w251, (!!true ? (bit<16>)hdr.eth_hdr.eth_type << (bit<8>)hdr.eth_hdr.eth_type : 16w17107) };
    bit<8> gVwcQv = 8w102;
    bool NMgItq = (-1500525708 ^ 2095320574 + 701174985 | 128w166388468211950063342697037364624433834) - 128w92667847103704233341006025283633619 != 128w129924069652025881482255523549234865922;
    bit<16> Oyuntf = lyGfSL.oeYt;
    bit<4> sLDByw = (bit<4>)lyGfSL.FOtW;
    state start {
        transition parse_hdrs;
    }
    state parse_hdrs {
        pkt.extract(hdr.eth_hdr);
        pkt.extract(hdr.PDgT);
        transition accept;
    }
}

control ingress(inout Headers h) {
    bit<32> knmUZk = 32w500485676;
    bit<128> UMFwzW = 128w127476315507995985734642823713929758137;
    bit<8> RGxknB = -8w216 ^ 8w214;
    bit<8> LTaKPE = (bit<8>)meduGUf();
    bit<16> IgUrfR = (!false && (!!true && true) ? (bit<16>)16w49667 : (bit<16>)EAYWUhe());
    uCvKhOG() ihDZFr;
    uCvKhOG() KMPAdH;
    uCvKhOG() OJBTfb;
    action gUhUN(out bit<32> JCQk, bit<32> esDE) {
        TQTEFP CkZMZU = { RGxknB };
        LTaKPE = ~LTaKPE;
        CkZMZU.vZLj = h.PDgT.vZLj;
        JCQk = (bit<32>)JCQk;
        UMFwzW = (false ? UMFwzW : (bit<128>)EAYWUhe());
        EAYWUhe();
        h.PDgT.vZLj = (bit<8>)((false ? RGxknB : 8w109) & 8w140 - -1179293686);
        h.eth_hdr.eth_type = 16w37756;
        bit<16> FePDBr = (bit<16>)IgUrfR ^ h.eth_hdr.eth_type;
        YucYTUW(UMFwzW, 32w3481052331);
    }
    action MXxdX(out Headers vgcO, bit<32> KokM, bit<16> VgKs) {
        EAYWUhe();
        h.eth_hdr.dst_addr = 48w212321817309837;
        h.eth_hdr.eth_type = -1298663788 | -90061036 + -1227940517;
        UMFwzW[77:30] = 48w62956463321225;
        h.eth_hdr.eth_type = -(bit<16>)16w42530;
    }
    table ZjXxaz {
        key = {
            h.eth_hdr.dst_addr: exact @name("vgnihG") ;
        }
        actions = {
        }
    }
    table QuWMKH {
        key = {
            (bit<32>)EAYWUhe(): exact @name("zApiwM") ;
            48w246571842009697: exact @name("jTEtUE") ;
            32w3934660164     : exact @name("gPyPkH") ;
        }
        actions = {
            MXxdX(h);
        }
    }
    table getttc {
        key = {
            128w319016713157177349707501011233657808475: exact @name("jDiXrc") ;
        }
        actions = {
        }
    }
    table OQrZtE {
        key = {
            knmUZk                                                                                                                                                                : exact @name("Rydydy") ;
            (!false ? (bit<128>)128w286654766190982584181051055716011439465 : 128w108474286064519255973305751809460190849) << (bit<8>)~128w176496786663242300597724040751465932792: exact @name("HJWGwR") ;
        }
        actions = {
            MXxdX(h);
            gUhUN(knmUZk);
        }
    }
    apply {
        h.eth_hdr.eth_type = IgUrfR;
        meduGUf();
        knmUZk = 32w113487070 << (bit<8>)knmUZk;
        const bool UzOYhY = !(~10w253 == 10w562);
        YucYTUW(UMFwzW, 32w2633173272 & 32w2267803033 * 32w162713801);
        switch (QuWMKH.apply().action_run) {
            MXxdX: {
                meduGUf();
                const bit<32> cLOdpE = 32w443321359;
                const TQTEFP IurGRS = { 8w211 };
                const bit<16> BwRaou = 16w12126;
                knmUZk = 1296918780;
                UMFwzW = (UzOYhY ? (bit<128>)(-680583116 + -1495262140) >> (bit<8>)(bit<128>)meduGUf() : 128w14976564858660292608174553918912860770);
                switch (OQrZtE.apply().action_run) {
                    MXxdX: {
                        IgUrfR = 16w62961;
                        h.PDgT.vZLj = LTaKPE;
                        EAYWUhe();
                        EAYWUhe();
                        const bit<8> vYTxLg = 8w236 | 8w167;
                        RGxknB = -1258681629 | 8w171;
                        IgUrfR = -(UzOYhY ? (bit<88>)(bit<88>)BwRaou : 88w54306004192069558798670192)[72:57];
                        h.PDgT.vZLj = (8w12 ^ 8w49) |+| 8w122;
                    }
                    gUhUN: {
                        const bit<128> KwLYlX = 128w140828735813960019289335725283024242327;
                        knmUZk = (UzOYhY ? 32w2578971042 : 32w3936042026 >> (bit<8>)~(YucYTUW(UMFwzW, 32w3759144732) ? 32w1241474804 % 32w3929463841 : cLOdpE));
                        h.PDgT.vZLj = -h.PDgT.vZLj;
                        switch (ZjXxaz.apply().action_run) {
                        }
                        IgUrfR = 16w1044;
                        h.PDgT.vZLj = 978145479;
                    }
                }
                h.eth_hdr.src_addr = (bit<48>)EAYWUhe();
            }
        }
    }
}

parser Parser(packet_in b, out Headers hdr);
control Ingress(inout Headers hdr);
package top(Parser p, Ingress ig);
top(p(), ingress()) main;

