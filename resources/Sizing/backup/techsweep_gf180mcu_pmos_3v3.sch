v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
N 470 -220 470 -170 {
lab=g}
N 470 -170 540 -170 {
lab=g}
N 470 -300 470 -280 {
lab=GND}
N 580 -300 580 -200 {
lab=GND}
N 580 -140 580 -100 {
lab=d}
N 580 -100 730 -100 {
lab=d}
N 730 -140 730 -100 {
lab=d}
N 730 -300 730 -200 {
lab=GND}
N 670 -220 670 -170 {
lab=b}
N 580 -170 670 -170 {
lab=b}
N 670 -300 670 -280 {
lab=GND}
N 830 -300 830 -270 {
lab=GND}
N 830 -210 830 -160 {
lab=n}
C {devices/launcher.sym} 480 -420 0 0 {name=h2
descr="simulate" 
tclcommand="xschem save; xschem netlist; xschem simulate"
}
C {devices/launcher.sym} 480 -380 0 0 {name=h3
descr="annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/gnd.sym} 580 -300 2 1 {name=l6 lab=GND}
C {devices/vsource.sym} 730 -170 0 0 {name=vd value=0.75}
C {devices/vsource.sym} 670 -250 2 1 {name=vsb value=\{vbx\}}
C {devices/vsource.sym} 470 -250 0 0 {name=vg value="0.65 AC 1"}
C {devices/gnd.sym} 470 -300 2 1 {name=l7 lab=GND}
C {devices/gnd.sym} 670 -300 2 1 {name=l8 lab=GND}
C {devices/gnd.sym} 730 -300 2 1 {name=l9 lab=GND}
C {devices/lab_wire.sym} 510 -170 0 0 {name=p4 sig_type=std_logic lab=g}
C {devices/lab_wire.sym} 650 -100 0 0 {name=p5 sig_type=std_logic lab=d}
C {devices/lab_wire.sym} 650 -170 0 1 {name=p6 sig_type=std_logic lab=b}
C {devices/ccvs.sym} 830 -240 0 0 {name=H1 vnam=vd value=1}
C {devices/gnd.sym} 830 -300 2 1 {name=l1 lab=GND}
C {devices/lab_pin.sym} 830 -170 0 0 {name=p1 sig_type=std_logic lab=n}
C {symbols/pfet_03v3.sym} 560 -170 0 0 {name=M1
L=\{lx\}
W=\{wx\}
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {devices/code_shown.sym} 0 -1010 0 0 {name=NGSPICE_CTRL only_toplevel=true 
value="
.option sparse
.temp 27
.param wx=5u lx=0.28u vbx=0
.noise v(n) vg lin 1 1 1 1
.control
option numdgt=3
set wr_singlescale
set wr_vecnames

compose l_vec  values 0.28u 0.4u 0.5u 1u 5u 10u
compose vg_vec start= 0 stop=3.31  step=0.05
compose vd_vec start= 0 stop=3.31  step=0.05
compose vb_vec values 0 0.4 0.8 1.2

foreach var1 $&l_vec
  alterparam lx=$var1
  reset
  foreach var2 $&vg_vec
    alter vg $var2
    foreach var3 $&vd_vec
      alter vd $var3
      foreach var4 $&vb_vec
        alter vsb $var4
	run 
	wrdata techsweep_gf180mcu_pmos_3v3.txt noise1.all
	destroy all
	set appendwrite
	unset set wr_vecnames
      end
    end
  end
end

set appendwrite=0

alterparam lx=0.28u
alterparam vbx=0
reset
op
*showmod
show
write techsweep_gf180mcu_pmos_3v3.raw
.endc
"}
C {devices/ngspice_get_value.sym} 1020 -300 0 1 {name=r1 node=@m.xm1.m0[gds]
descr="gds="}
C {devices/ngspice_get_value.sym} 1020 -330 0 1 {name=r3 node=@m.xm1.m0[gm]
descr="gm="}
C {devices/ngspice_get_value.sym} 1020 -270 0 1 {name=r12 node=v(@m.xm1.m0[vth])
descr="vth="}
C {devices/ngspice_get_value.sym} 1020 -210 0 1 {name=r13 node=@m.xm1.m0[cgg]
descr="cgs="}
C {devices/ngspice_get_value.sym} 1020 -240 0 1 {name=r14 node=v(@m.xm1.m0[vdsat])
descr="vdsat="}
C {devices/ngspice_get_value.sym} 1020 -180 0 1 {name=r15 node=@m.xm1.m0[cgd]
descr="cdg="}
C {devices/code_shown.sym} 620 -1010 0 0 {name=NGSPICE_SAVE only_toplevel=true 
value="
.save b d g n
.save @m.xm1.m0[cgso]
.save @m.xm1.m0[cgdo]
.save @m.xm1.m0[cdd]
.save @m.xm1.m0[cgb]
.save @m.xm1.m0[cgd]
.save @m.xm1.m0[cgg]
.save @m.xm1.m0[cgs]
.save @m.xm1.m0[css]
.save @m.xm1.m0[gds]
.save @m.xm1.m0[gm]
.save @m.xm1.m0[gmbs]
.save @m.xm1.m0[id]
.save @m.xm1.m0[l]
.save @m.xm1.m0[vgs]
.save @m.xm1.m0[vds]
.save @m.xm1.m0[vbs]
.save @m.xm1.m0[vth]
.save @m.xm1.m0[vdsat]
"}
C {devices/code_shown.sym} 0 -150 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="(c) 2025 H. Pretl, Apache-2.0 license"}
