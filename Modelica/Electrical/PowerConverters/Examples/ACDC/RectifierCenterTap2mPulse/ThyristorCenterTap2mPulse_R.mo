within Modelica.Electrical.PowerConverters.Examples.ACDC.RectifierCenterTap2mPulse;
model ThyristorCenterTap2mPulse_R
  "2*m pulse thyristor center tap rectifier with resistive load"
  extends ExampleTemplates.ThyristorCenterTap2mPulse(pulse2m(
        constantFiringAngle=constantFiringAngle));
  extends Modelica.Icons.Example;
  import Modelica.Constants.pi;
  parameter Modelica.SIunits.Angle constantFiringAngle=30*pi/180
    "Firing angle";
  parameter Modelica.SIunits.Resistance R=20 "Load resistance";
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=R) annotation (
      Placement(transformation(
        origin={30,30},
        extent={{10,-10},{-10,10}},
        rotation=90)));
equation
  connect(resistor.n, currentSensor.p) annotation (Line(
      points={{30,20},{30,-50},{10,-50}}, color={0,0,255}));
  connect(resistor.p, rectifier.dc_p) annotation (Line(
      points={{30,40},{-10,40},{-10,40},{-20,40}}, color={0,0,255}));
  annotation (
    experiment(
      StopTime=0.1,
      Tolerance=1e-06,
      Interval=0.0002),
    Documentation(info="<html>
<p>This example shows a controlled <code>2*m</code> pulse center tap rectifier with resistive load, where <code>m</code> is the number of phases.</p>

<p>Plot current <code>currentSensor.i</code>, average current <code>meanCurrent.y</code>, voltage <code>voltageSensor.v</code> and average voltage <code>meanVoltage.v</code>.</p>
</html>"));
end ThyristorCenterTap2mPulse_R;
