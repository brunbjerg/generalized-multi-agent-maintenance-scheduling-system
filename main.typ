#block[
2

= Introduction
<introduction>
Maintenance scheduling is in its nature a multi actor process. Many
stakeholders have to coordinate in both time and space to allow for an
efficient and effective execution. This thesis will propose a
generalized multi-agent scheduling system and it will argue that for the
field of maintenance scheduling to more forward similar approaches will
have to be adopted. Other approaches may be very different but they will
share many of the aspects.

This Ph.D. will present a generalized dynamic multi-model approach to
maintenance scheduling which will be model after a practical maintenace
handbook #cite(palmer_maintenance_2019). This book written by the
experienced practitioner Richard D. Palmer will be a guiding light
throughout the thesis, so it serves as the main source and validation,
or maybe invalidation is a better word, as we explore the academic
maintenance scheduling literture and also, and more importantly, it will
also be the source which above all else will us us through the perilous
process of create a generalize model setup for maintenance scheduling.

== The General Maintenance Scheduling Process
<the-general-maintenance-scheduling-process>
This section will provide an overview of the maintenance scheduling
process in the most abstracted way possible. It will be important to
understand this setup throughly as most industries that perform
maintanance of a considerable scale follow this process. Many industries
are of course unique and deviate from general framework in specific work
but the fundamentals are usually quite similar.

#figure([#image("figures/top-level-schedule-overview.png", width: 100%)
  <top-level-schedule-overview.png>

  ],
  caption: [
  ]
)
<top-level-schedule-overview.png>

This figure shows

= Modelling the Generalized Setup
<modelling-the-generalized-setup>
To model the maintenace process in its entirety we will need tool that
are powerful enough to describe the system. The system will be described
in accordance with the #link(<top-level-schedule-overview.png>)[1.1]
#cite("palmer_maintenance_2019").

The maintenance scheduling problem is NP-hard and real-time optimal
solutions will never be a feasible approach unless we use a multi-model
setup where each model enriches the overall solution in the way that it
is most capable of.

== The Strategic Model
<the-strategic-model>
The Strategic model is responsible for grouping work orders into weekly
or biweekly periods depending on which kind of maintenance setup that
one is running. This kind of model closely resembles a variant of the
multi-compartment multi-knapsack problem.

\$\$\\begin{aligned}
	& \\text{Min} \\quad \\sum\_{i \\in I} \\sum\_{k \\in K} v\_{ik}(t) \\cdot x\_{ik} + \\sum\_{k \\in K} \\sum\_{c \\in C} pen \\cdot p\_{kc}   \\label{eqn:objective\_function\_strategic} \\\\\[1em\]
    & \\text{subject to:} \\notag                                                                                                    \\\\\[1em\]
	& \\sum\_{i \\in I} w\_{ic} \\cdot x\_{ik} \\leq \\ cap\_{kc}(t) + p\_{kc}&& \\forall k \\in K, \\forall c \\in C   \\label{eqn:capacity\_constraint}          \\\\\[1em\]
	& \\sum\_{i \\in I} x\_{ik} \= 1                                 && \\forall k \\in K                    \\label{eqn:single\_workorder\_constraint}  \\\\\[1em\]
	& x\_{ik} \= 0                                                  && \\forall (i, k) \\in Q(t)            \\label{eqn:exclusion\_constraint}         \\\\\[1em\]
	& x\_{ik} \= 1                                                  && \\forall (i, k) \\in P(t)            \\label{eqn:inclusion\_constraint}         \\\\\[1em\]
	& x\_{ik} \\in \\{0, 1\\}                                         && \\forall i \\in I, \\forall k \\in K   \\label{eqn:x\_integrality\_constraint}     \\\\\[1em\] 
	& p\_{kc} \\in \\mathbb{R}^{+}                                   && \\forall k \\in K, \\forall c \\in C   \\label{eqn:p\_non\_negativity\_constraint}  \\\\\[1em\]
\\end{aligned}\$\$

Here the model is shown.

== The Tactical Model
<the-tactical-model>
After the strategic model has optimized its schedule the tactical agent
will continue scheduling the output at a more detailed level. This means
that now the tactical agent will schedule out on each of the days of the
work orders scheduled by the strategic agent.

The tactical model is responsible for providing an initial suggestion
for a weekly schedule, below we see the model for the tactical agent.

\$\$\\begin{aligned}
	& \\text{Min} \\quad \\sum\_{i \\in I} v\_{c}(t) \\cdot y\_{dj}(t) + \\sum\_{c \\in C} \\sum\_{d \\in D} pen \\cdot p\_{cd}\\\\  
	& \\text{subject to:} \\notag \\\\
	& \\sum\_{j \\in J} w\_{cj} \\cdot y\_{dj} \\leq R\_{dc} + p^y\_{dc} && \\forall \\\\ d \\in D, \\forall c \\in C \\\\ 
	& \\sum\_{d \\in D} d \\cdot y\_{di} + \\Delta\_i \\leq \\sum\_{d \\in D} d \\cdot y\_{dj} && \\forall (i, j) \\in Pred \\\\ 
	& \\sum\_{}
\\end{aligned}\$\$

== The Supervisor Model
<the-supervisor-model>
== The Operational Model
<the-operational-model>
possible sections \* All Stochasticity will be handled by user
interaction. \* In maintenance scheduling, data is assumed to be
correct. Yes that must be the prevailing idea here.

]
