#include <core.p4>
bit<3> max(in bit<3> val, in bit<3> bound) {
    return val < bound ? val : bound;
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
    VPgh = 4w14;
    bit<16> wUwiNa = (bit<16>)kemL.TeIY;
    const bit<128> KNGgzK = 128w28762127827317293815210935214086976182;
    VPgh = kemL.LfLO;
    VPgh = -1944439737 | -1728232021;
    wUwiNa = 16w10942;
    {
        const bit<16> xHhogc = 16w40777;
        const bool VPQDqJ = !!(51w286666952687673 != 51w904052214181343);
        VPgh = kemL.LfLO;
        bit<8> qiwFhS = (((bit<113>)(bit<113>)kemL.TeIY |+| (bit<113>)kemL.TeIY)[78:40] != 39w66030955075 << (bit<8>)39w285945435284 ? 8w204 : 8w206);
        VPgh = kemL.LfLO;
        VPgh = VPgh;
        bool HqqaFY = VPQDqJ;
        qiwFhS = 8w182;
        VPgh = 4w8;
        return 8w108;
    }
    wUwiNa = wUwiNa;
    wUwiNa = 16w43324;
    const int sBNVck = -113023712;
    wUwiNa = wUwiNa + 16w37833;
    return -kemL.TeIY;
}
bool AuSgrSB() {
    bool WEVbSq = 39w223346132989 != 39w358564517139;
    const bool lOSVgE = false;
    bool aBhMJQ = !(false || !(89w522409672184698976363488752 != (~(bit<181>)-1628063862)[117:29] + 89w106576923940049528766818675));
    bit<8> hVBtEn = 8w103;
    vNUuQP hBKPvL = { -hVBtEn - (hVBtEn & hVBtEn), 64w1076755964400003411, -(bit<64>)hVBtEn |+| 64w3997240606779127219, 4w2 };
    hVBtEn = (!(54w142997767790702 == 54w10185113265119935 << (bit<8>)170w168360158021225930079651510773354054366333247377950[66:13]) ? hVBtEn : hBKPvL.ETrI) & 8w144;
    hBKPvL.bUKc = (false ? hBKPvL.yxiq : 64w11756700130235069827 + hBKPvL.bUKc);
    return 1w1 == -(-227072883 + -655254119) & 1903115485;
}
bit<16> mMjjrfi(bit<32> XROz) {
    const bit<4> DTLpkP = 4w9;
    {
        bool uEPPnT = true || 123w4208044089618578884404780188512424930 != (bit<123>)XROz;
        bool CUFjMt = true;
        bit<8> UMRbqP = (bit<8>)8w89 |+| (bit<8>)XROz;
        UMRbqP = 8w58;
        ethernet_t gYDcCW = { (bit<48>)UMRbqP, (bit<48>)XROz, 16w44256 };
        gYDcCW.src_addr = gYDcCW.src_addr;
        gYDcCW.eth_type = (bit<16>)-485532619 |-| 16w26284 | 16w58436;
        gYDcCW.eth_type = 16w34193 |-| 16w12792;
        gYDcCW.eth_type = 16w8577 & gYDcCW.eth_type;
        return gYDcCW.eth_type;
    }
    {
        Mdpvgb uRSloa = { 8w144, 4w4 / 4w1 };
        TFhEvSU({ (false ? 8w197 : 8w123 >> (bit<8>)~uRSloa.TeIY) |-| (bit<8>)-1659276706, uRSloa.LfLO }, uRSloa.LfLO, { 8w85, 4w11 });
    }
    {
        Mdpvgb dIkWfE = { 8w169, 4w8 };
        TFhEvSU({ dIkWfE.TeIY - 837507409 % 1649512777, ((bit<122>)(bit<122>)XROz)[80:77] }, dIkWfE.LfLO, { 8w244, 4w14 });
    }
    bit<128> teLRBS = 128w279538546481246464944740951434909156558;
    teLRBS = teLRBS;
    bit<128> yBDuHS = 128w116515304280475261747860388584944381961;
    yBDuHS = 128w196120475191024206986174346780033791978 * (128w200991610777826574512209514735116554269 |-| 128w334702380336614699968833772871858510378 ^ yBDuHS);
    bit<128> FGZyBY = 128w245786565648066737297146533950573287086;
    return 16w26492;
}
parser p(packet_in pkt, out Headers hdr) {
    bit<128> qKeQXJ = (false ? 128w66166414318846882611797071673033384657 : (bit<128>)hdr.AMIB.TeIY) >> (bit<8>)(bit<128>)hdr.aTcs[8].src_addr;
    vNUuQP lBneZl = { 8w106 + 8w1 & 8w108, hdr.dSgK.bUKc, (bit<64>)1122392489 >> (bit<8>)~(64w7445381633413558022 % 64w718723761948396799), 4w6 };
    ethernet_t[2] HvKDSM;
    bool rCYfod = !true;
    bit<64> pMwnPg = 64w11591036449157216331;
    state start {
        transition parse_hdrs;
    }
    state parse_hdrs {
        pkt.extract(hdr.eth_hdr);
        pkt.extract(hdr.dSgK);
        pkt.extract(hdr.gUPl);
        pkt.extract(hdr.AMIB);
        pkt.extract(hdr.vTHH.next);
        pkt.extract(hdr.vTHH.next);
        pkt.extract(hdr.vTHH.next);
        pkt.extract(hdr.vTHH.next);
        pkt.extract(hdr.vTHH.next);
        pkt.extract(hdr.vTHH.next);
        pkt.extract(hdr.vTHH.next);
        pkt.extract(hdr.vTHH.next);
        pkt.extract(hdr.vTHH.next);
        pkt.extract(hdr.vTHH.next);
        pkt.extract(hdr.aTcs.next);
        pkt.extract(hdr.aTcs.next);
        pkt.extract(hdr.aTcs.next);
        pkt.extract(hdr.aTcs.next);
        pkt.extract(hdr.aTcs.next);
        pkt.extract(hdr.aTcs.next);
        pkt.extract(hdr.aTcs.next);
        pkt.extract(hdr.aTcs.next);
        pkt.extract(hdr.aTcs.next);
        transition accept;
    }
}

control ingress(inout Headers h) {
    bit<32> fHLkJQ = (bit<32>)h.eth_hdr.dst_addr;
    bit<4> VogrIJ = 131w277795812626034680923749324958079677268[57:54];
    bit<4> DglsCD = ~VogrIJ;
    vNUuQP JJtpaz = { (bit<8>)mMjjrfi(32w302790502) - (bit<8>)TFhEvSU(h.vTHH[9], h.gUPl.JyBT, { 8w159, 4w12 }), h.dSgK.bUKc, 64w11441414087804638179, -h.gUPl.JyBT * 4w11 };
    action lBJGe(bit<4> VqqH, bit<128> mlYh) {
        TFhEvSU(h.AMIB, JJtpaz.ETrI[7:4], { 8w209, 4w7 });
        h.aTcs[max((bit<3>)fHLkJQ, 3w0)].eth_type = 837753965 % 1594357592;
        bit<128> dGmlno = ~((bit<128>)128w35738087454176100445402961051922638197 |-| (bit<128>)mMjjrfi(32w1203117535));
        h.eth_hdr.eth_type = 16w34488;
    }
    action naNRp(inout bit<64> fyaf, out bit<32> OEEJ, bit<128> KZqQ) {
        bool oDBhFM = true;
        h.aTcs[max((bit<3>)h.dSgK.ETrI, 3w0)].eth_type = 1368727434;
        h.vTHH[max((bit<3>)h.gUPl.bUKc, 3w1)].TeIY = 8w156;
        h.dSgK.yxiq[39:32] = 1373468233;
        h.aTcs[max((bit<3>)TFhEvSU({ h.vTHH[9].TeIY, 4w15 }, h.AMIB.LfLO, { ((bit<10>)10w198)[9:2], ((51w473191897499691 >> (bit<8>)51w1774218512933294) - 51w2230058401855035 |-| (bit<51>)1173225359)[10:7] }), 3w0)].src_addr = h.eth_hdr.src_addr;
        const bool XneKsi = !!!(3w4 != (91w62733385915123134641826978 + 91w750855786411080800236553678 | 91w1692157122849344678287433369)[36:34]);
        h.aTcs[max(3w4, 3w0)].dst_addr = h.aTcs[8].src_addr & 48w223192399908098;
    }
    action TtncC(inout bit<4> ClFo, bit<8> xLMh) {
        h.gUPl.bUKc = 64w15962448445403123729;
        return;
        const int xWEAyC = -1563578230;
        AuSgrSB();
        AuSgrSB();
        h.AMIB.LfLO = (bit<4>)JJtpaz.JyBT;
    }
    table LXUTiq {
        key = {
            48w237754727661431                                                                                : exact @name("knrnEO") ;
            (!!!true ? h.dSgK.yxiq : h.gUPl.bUKc) & ~h.gUPl.yxiq                                              : exact @name("ZQHnkq") ;
            (false ? 48w11585645033576 |-| h.eth_hdr.src_addr : 112w1383849523201632077945660041541504[79:32]): exact @name("jbKdTS") ;
        }
        actions = {
        }
    }
    apply {
        h.gUPl.JyBT = h.vTHH[9].LfLO;
        bit<32> SYepnh = 86w10168090345593604533343240[50:19];
        bit<16> VFoVmL = 16w18177;
        h.eth_hdr.src_addr = -815520426 & 48w133639484870645;
        const bit<128> Puozzm = 128w192834410761076224328844976095370041044;
        bit<8> oHqKvN = h.vTHH[9].TeIY;
        bit<16> CcxgjE = (bit<16>)h.eth_hdr.eth_type >> (bit<8>)(3w7 ++ (bit<13>)(579254814 + 1808145250) |+| 16w30011);
        h.gUPl.bUKc = (!!LXUTiq.apply().hit ? 140w497896024474643790195215436945182053944457[88:25] : h.dSgK.bUKc);
    }
}

parser Parser(packet_in b, out Headers hdr);
control Ingress(inout Headers hdr);
package top(Parser p, Ingress ig);
top(p(), ingress()) main;

