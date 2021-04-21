% Clears the Command Window of clutter
clc

% A creation of a FIS that determines capabilities of a goalie with respect
% to certain attributes by Joachim Chinonso Okpala 

% A declaration of a new FIS along with its default options for FIS as in
% the FLD
%                                           AND    OR    Impl    Agg  Defuzzification
a = newfis('Goalie Capability', 'mamdani', 'min', 'max', 'min', 'max', 'centroid');

% Declaring my first input variable 
a = addvar(a, 'input', 'Height (m)', [0.25 2.5]);

% Populating the 1st input variable with its membership functions
a = addmf(a, 'input', 1, 'Very Short', 'trimf', [0.25 0.55 0.85]);
a = addmf(a, 'input', 1, 'Short', 'trimf', [0.75 1.05 1.35]);
a = addmf(a, 'input', 1, 'Tall', 'trimf', [1.25 1.55 1.85]);
a = addmf(a, 'input', 1, 'Very Tall', 'trapmf', [1.75 2.05 2.35 2.5]);

% Declaring my second input variable 
a = addvar(a, 'input', 'Agility (%)', [0 100]);

% Populating the 2nd input variable with its membership functions
a = addmf(a, 'input', 2, 'Poorly Agile', 'trimf', [0 20 40]);
a = addmf(a, 'input', 2, 'Agile', 'trimf', [35 55 75]);
a = addmf(a, 'input', 2, 'Very Agile', 'trimf', [70 90 100]);

% Declaring my third input variable 
a = addvar(a, 'input', 'Diving Timing and Accuracy (%)', [0 100]);

% Populating the 3rd input variable with its membership functions
a = addmf(a, 'input', 3, 'Poor', 'trimf', [0 15 30]);
a = addmf(a, 'input', 3, 'Average', 'trimf', [25 40 55]);
a = addmf(a, 'input', 3, 'Good', 'trimf', [50 65 80]);
a = addmf(a, 'input', 3, 'Better', 'trapmf', [70 80 90 100]);

% Declaring my fourth input variable 
a = addvar(a, 'input', 'Body Weight (kg)', [50 115]);

% Populating the 4th input variable with its membership functions
a = addmf(a, 'input', 4, 'Most Suitable', 'trimf', [55 65 75]);
a = addmf(a, 'input', 4, 'Suitable', 'trimf', [65 75 85]);
a = addmf(a, 'input', 4, 'Less Suitable', 'trimf', [75 85 95]);
a = addmf(a, 'input', 4, 'Bad', 'trapmf', [85 95 105 115]);

% Declaring my only output variable 
a = addvar(a, 'output', 'Goalie Capability (%)', [0 100]);

% Populating the output variable with its membership functions
a = addmf(a, 'output', 1, 'Poor Goalie', 'trimf', [0 15 30]);
a = addmf(a, 'output', 1, 'Average Goalie', 'trimf', [25 40 55]);
a = addmf(a, 'output', 1, 'Good Goalie', 'trimf', [50 65 80]);
a = addmf(a, 'output', 1, 'Outstanding Goalie', 'trapmf', [70 80 90 100]);

% Declaring the rules between the four respective input variables and output, with
% respect to Connection between the inputs and Weight
rule1 = [4 3 4 1 4 1 1]; % For Outstanding G0alie
rule2 = [3 3 4 1 4 1 1];
rule3 = [4 2 4 1 4 1 1];
rule4 = [4 3 3 1 4 1 1];
rule5 = [4 3 4 2 4 1 1];

rule6 = [3 2 4 1 3 1 1]; % For Good Goalie
rule7 = [4 2 3 1 3 1 1];
rule8 = [4 3 3 2 3 1 1];
rule9 = [3 2 4 2 3 1 1];
rule10 = [3 2 3 1 3 1 1];
rule11 = [4 2 3 2 3 1 1];
rule12 = [3 3 3 2 3 1 1];
rule13 = [3 2 3 2 3 1 1];
rule14 = [4 2 3 3 3 1 1];
rule15 = [3 2 3 3 3 1 1];
rule16 = [2 3 3 2 3 1 1];

rule17 = [2 2 2 3 2 1 1]; % For Average Goalie
rule18 = [3 2 2 2 2 1 1];
rule19 = [4 2 2 2 2 1 1];
rule20 = [4 3 1 2 2 1 1];
rule21 = [3 1 2 2 2 1 1];

rule22 = [1 1 1 4 1 1 1]; % For Poor Goalie
rule23 = [2 1 1 4 1 1 1];
rule24 = [2 2 1 3 1 1 1];
rule25 = [3 2 1 3 1 1 1];
rule26 = [4 2 1 3 1 1 1];

% Declaring rule
ruleList = [rule1; rule2; rule3; rule4; rule5; rule6; rule7; rule8; rule9; rule10; rule11; rule12; rule13;
    rule14; rule15; rule16; rule17; rule18; rule19; rule20; rule21; rule22; rule23; rule24; rule25; rule26;];

a = addRule(a, ruleList);

showrule(a)

Input1 = 1.8;

Input2 = 80;

Input3 = 80;

Input4 = 73;

Output = evalfis(a, [Input1, Input2, Input3, Input4]);

ruleview(a);

% The subplots to visualise the system
figure(1)
subplot(4,1,1), plotmf(a,'input',1);
subplot(4,1,2), plotmf(a,'input',2);
subplot(4,1,3), plotmf(a,'input',3);
subplot(4,1,4), plotmf(a,'input',4);

subplot(4,1,4), plotmf(a,'output',1);

% Print all Goalie Capability FIS properties in the command window
getfis(a)