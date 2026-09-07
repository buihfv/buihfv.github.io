---
layout: page
permalink: /research/
title: Research
description: First-principles answers to why materials fail — at interfaces, and in the dark.
nav: true
nav_order: 2
toc:
  sidebar: left
---

I work on problems where the behaviour of a device is decided by something too small and too buried to measure directly: a solid–solid interface a few atomic layers thick, or a localized electronic state in a disordered oxide. My tools are density functional theory, ab initio molecular dynamics, and hybrid functionals, run at a scale that keeps the model physically honest rather than merely tractable. What I care about is the last step — turning a converged calculation into a statement a process or device engineer can act on: use this dopant, expect this failure mode, avoid this operating window. The three threads below are what I am working on now, ordered by how much I can currently say about them.

---

## Which dopant lets a garnet electrolyte survive both electrodes at 500 °C?

<div style="display:flex;flex-wrap:wrap;gap:1.5rem;align-items:flex-start;margin:1rem 0 1.5rem;">
  <div style="flex:0 0 280px;max-width:100%;">
    {% include figure.liquid loading="eager" path="assets/img/research_llzo_interface.jpg" title="Doped LLZO interfaces with LiSi and FeF3" class="img-fluid rounded z-depth-1" %}
  </div>
  <div style="flex:1 1 340px;min-width:260px;" markdown="1">
A thermal battery asks its solid electrolyte to hold up against a lithium-silicon anode on one side and an FeF₃ conversion cathode on the other, at 500 °C. Doped Li₇La₃Zr₂O₁₂ (LLZO) is the standard answer, but the dopants that buy thermodynamic stability tend to cost ionic mobility — Ta is the textbook case — and the two electrodes do not necessarily want the same dopant.

I am evaluating Al-, Ga-, Ta-, and Sr+Ta-doped LLZO against pristine LLZO at both interfaces, using DFT for interfacial phase stability and NEB-derived migration barriers for Li-ion transport under realistic operating conditions. Building the FeF₃/LLZO side meant working through the practical failure modes of coherent interface construction — a ~350-atom cell at ~8.5% lattice mismatch, with unphysically short F–Fe contacts and vacuum-layer artifacts to diagnose before anything would relax.

The Sr+Ta co-doped composition is the case the work turns on: whether a second, larger dopant recovers the mobility that Ta alone gives up, which is what an experimental collaborator's results suggest.

  </div>
</div>

**Keywords:** LLZO · dopant engineering · interfacial phase stability · NEB · thermal batteries  
**Code & tools:** `VASP` · `pymatgen` (`InterfacialReactivity`) · `VASPKIT` · `VESTA` · `softBV`

---

## Why does an amorphous semiconductor get _less_ conductive under light?

<div style="display:flex;flex-wrap:wrap;gap:1.5rem;align-items:flex-start;margin:1rem 0 1.5rem;">
  <div style="flex:0 0 280px;max-width:100%;">
    {% include figure.liquid loading="eager" path="assets/img/research_znon.jpg" title="Charge localization in amorphous ZnON" class="img-fluid rounded z-depth-1" %}
  </div>
  <div style="flex:1 1 340px;min-width:260px;" markdown="1">
Amorphous zinc oxynitride (ZnON) is a high-mobility channel material for thin-film transistors, but it shows negative photoconductivity: illuminate it and the current goes *down*. That inverts the intuition every photoconductor is built on, and without a mechanism there is no way to know whether it is a defect to engineer out or a property to exploit.

I ran first-principles calculations on amorphous ZnON models to find where the photo-generated carriers go. Combining AIMD sampling of the disordered structure with hybrid DFT for the electronic structure, the work identifies charge-localization mechanisms at both band edges — states near the valence band maximum and the conduction band minimum that trap carriers instead of contributing to transport.

The picture that emerges ties the anomaly to the disorder itself rather than to an extrinsic impurity. A manuscript is in preparation; I am second author.

  </div>
</div>

**Keywords:** amorphous ZnON · negative photoconductivity · charge localization · defect physics · hybrid DFT  
**Code & tools:** `VASP` (AIMD, HSE) · `Python` post-processing · `VESTA`

---

## Can machine-learned potentials make interface screening affordable?

<div style="display:flex;flex-wrap:wrap;gap:1.5rem;align-items:flex-start;margin:1rem 0 1.5rem;">
  <div style="flex:0 0 280px;max-width:100%;">
    {% include figure.liquid loading="eager" path="assets/img/research_mlip.jpg" title="MLIP-accelerated molecular dynamics" class="img-fluid rounded z-depth-1" %}
  </div>
  <div style="flex:1 1 340px;min-width:260px;" markdown="1">
Interface studies stall on cost, not on ideas. A ~600-atom cell multiplied by ten dopant variants puts direct AIMD extrapolation to operating temperature out of reach on any budget I have — which is exactly the regime where machine-learned interatomic potentials should pay off, if they can be trusted.

My approach is to validate before trusting: run MD with a universal MLIP (MACE), check the resulting transport trend against the AIMD results already in hand for pristine, Al-, Ga-, and Ta-doped LLZO, and fine-tune on DFT reference data only where the trend breaks. Alongside this I maintain the computational infrastructure the group's work runs on — job submission, monitoring, and backup automation across a KISTI supercomputer and a shared GPU server.

The goal is a workflow where a screening campaign that would take months of AIMD becomes a few days of MD, with a quantified error bar against first-principles reference data rather than a leap of faith.

  </div>
</div>

**Keywords:** machine-learning interatomic potentials · MACE · AIMD validation · HPC workflow automation  
**Code & tools:** `MACE` · `ASE` · `VASP` · `Python` · SLURM/PBS job automation
