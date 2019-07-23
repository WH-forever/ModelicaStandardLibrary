within Modelica.Electrical.PowerConverters.Examples.ACDC.RectifierCenterTap2mPulse;
model ThyristorCenterTap2mPulse_RLV_Characteristic
  "Characteristic of 2*m pulse center tap thyristor rectifier with R-L load and voltage"
  extends ExampleTemplates.ThyristorCenterTap2mPulse(pulse2m(
        useConstantFiringAngle=false));
  extends Modelica.Icons.Example;
  import Modelica.Constants.pi;
  parameter Modelica.SIunits.Resistance R=20 "Load resistance";
  parameter Modelica.SIunits.Inductance L=1 "Load resistance"
    annotation (Evaluate=true);
  parameter Modelica.SIunits.Voltage VDC=-260 "DC load offset voltage";
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=R) annotation (
      Placement(transformation(
        origin={30,30},
        extent={{10,-10},{-10,10}},
        rotation=90)));
  Modelica.Electrical.Analog.Basic.Inductor inductor(L=L, i(start=0,
        fixed=true)) annotation (Placement(transformation(
        origin={30,0},
        extent={{10,-10},{-10,10}},
        rotation=90)));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=
        VDC) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={30,-30})));
  Modelica.Blocks.Sources.Ramp ramp(height=pi, duration=10) annotation (
     Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-30,-70})));
equation
  connect(resistor.n, inductor.p) annotation (Line(
      points={{30,20},{30,10}}, color={0,0,255}));
  connect(inductor.n, constantVoltage.p) annotation (Line(
      points={{30,-10},{30,-20}}, color={0,0,255}));
  connect(currentSensor.p, constantVoltage.n) annotation (Line(
      points={{10,-50},{30,-50},{30,-40}}, color={0,0,255}));
  connect(ramp.y, pulse2m.firingAngle) annotation (Line(
      points={{-30,-59},{-30,-12}}, color={0,0,127}));
  connect(resistor.p, rectifier.dc_p) annotation (Line(
      points={{30,40},{-10,40},{-10,40},{-20,40}}, color={0,0,255}));
  annotation (
    experiment(
      StopTime=10,
      Tolerance=1e-06,
      Interval=0.0002),
    Documentation(info="<html>
<p>This example shows a controlled <code>2*m</code> pulse center tap rectifier with R-L load including DC voltage source, where <code>m</code> is the number of phases. The additional DC voltage source in this example enables negative average load voltages.</p>

<p>Plot average voltage <code>meanVoltage.v</code> versus firingAngle <code>pulsem.firingAngle</code> to see control characteristic of this type of rectifier with R-L load including active voltage.</p>
</html>"));
end ThyristorCenterTap2mPulse_RLV_Characteristic;
