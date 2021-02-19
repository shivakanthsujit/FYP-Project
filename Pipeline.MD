# Paper Implementation

## Algo for System

1. Initialise states of system, i.e. input (u), state variables (s) and output (y).
2. Generate your setpoint vector r
3. Simulate ksp steps initially so that the system settles into a steady state. kfinal is the total number of steps of the simulation
4. for i in range(ksp, kfinal), do
5. Calculate error, E = r - y, and dy = y(k) - y(k-1). These are the inputs to the controller
6. Each input to the controller will have a set of DFs associated with it that divide its space. Call them DFi(j), for the ith input and the jth DF that describes it. From the paper, Error has three, i.e. High, OK and Low. dy has three too, Negative, Don’t Care and Positive.
7. Calculate Di(j) for E and dy.
8. Check what the truth value for each is. A DF is true if the value of the function is greater than its v.
9. Check the Rule base and find the antecedent value for each rule.
10. Each rule has a corresponding consequent, which tells which DF gets activated based on that rule.
11. Calculate the aggregated output DF from these using equation 23 & 24
12. Find the crisp (de-fuzzified) output of the controller using the COG. from equation 9 or 11.
13. Set the global input value to that of the controller and use the ODE Solver to find the output of the system.
14. Update arrays with new values of input, output and state.

## Synthesis Algo

1. Define the DFs for input and output linguistic variables
2. Fuzzify the crisp inputs using Eq 2 or 3
3. Construct the rule base from expert knowledge using Eq 16
4. Calculate the strength of each rule using Eq. 18 by choosing appropriate fuzzy conjunctive/disjunctive operators
5. Calculate the l firing strengths using Eq. 20
6. Calculate the params $c_a$ and $e_a$ of the aggregated output DF using equation 24.
7. Generate the aggregated output DF using Eq. 23
8. Get the crisp output control signal u by calculating the COG of the aggregated output DF using Eq 9 or Eq 11

## Things to do

* Define the DFs for Error and dy. Find suitable params from the paper graphs.
* Decide on the rule base for the process.
* Design a fuzzy_controller for the following
  * The input to the fuzzy_controller will be the current Error and dy
  * Fuzzify these inputs to each DF that is defined using it. So there will be 3 fuzzy values for Error and same for dy.
  * Use the parametric equation (the one in Eq. 18) to evaluate each rule.
    * For example. Assume the rule is "If (Error is _High_) and (dy is _Don't Care_) then output is _Close Fast_.
    * Now, _High_, _Don't Care_ and _Close Fast_ will all be represented by DFs.
    * Take the value that came from passing Error to the _High_ DF, and the one from passing dy to _Dont Care_ and combine them using Eq. 18 to find the strength of this rule (say the ith rule)
    * You have to repeat this for each rule that you have.
    * Now if you have l rules, you will have l strengths of these rules, denoted by w_hat_i.
    * Normalize these strengths by dividing each strength by the sum of l strengths. This normalised value is called the firing strength of the rule.
    * Now take the DFs that represent the consequents of the rules. In this case it is _Close Fast_. Each rule will have a corresponding DF, with its params $c_i$ and $epsilon_i$.
    * The output of the rule base is a DF which is the weighted sum of each DF. We can directly calculate the params of this new DF using the firing strengths $w_i$, $c_i$ and $epsilon_i$.
    * The new $c_{agg}$ is the weighted sum of $c_i$s and likewise for $epsilon_{agg}$. Find these.
    * With these values, we define the aggregated output DF $DF_{agg}$. To get the defuzzified output o the controller, we find the COG of $DF_{agg}$ using Eq. 9 and 11. Pro-tip, for a symmetric DF, the COG is $c$. So $c_{agg}$ is the output of the DF and can be obtained directly from above.
    * The final output of the fuzzy_controller will be the COG. Return this value.

## 16th Feb

* Define our DFs
  * Error
    * Divide from -1 to 1
      * High
      * OK
      * Low
  * Level Rate
    * -0.1 to 0.1
      * Negative
      * DC
      * Positive
  * Input Flow Rate
    * -60 to 60
      * Divide range into 5 DFs
* Rulebase