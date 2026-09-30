---
layout: page
title: Machine-Learned Potentials for Affordable Interface Screening
description: Can a trained potential make a months-long screening campaign a few days of MD?
img: assets/img/fig_mlip_1.jpg
importance: 4
published: false   # 비활성 — Research 목록에 안 나옴
category: work
---

**Ongoing** · Materials Design and Process Engineering Laboratory

<div class="media-row media-wide">
<div class="media-col">
<figure>
  <img src="{{ '/assets/img/fig_mlip_1.jpg' | relative_url }}" alt="MLIP vs AIMD trajectories">
  <figcaption>MLIP trajectories against AIMD reference.</figcaption>
</figure>
<figure>
  <img src="{{ '/assets/img/fig_mlip_2.jpg' | relative_url }}" alt="Mean squared displacement">
  <figcaption>Mean squared displacement, MLIP versus AIMD.</figcaption>
</figure>
</div>
<div class="media-text" markdown="1">
Interface studies stall on cost, not on ideas. A ~600-atom cell multiplied by ten dopant variants puts direct AIMD extrapolation to operating temperature out of reach on any budget I have — which is exactly the regime where machine-learned interatomic potentials should pay off, if they can be trusted.
</div>
</div>

<div class="media-row media-wide">
<div class="media-col">
<figure>
  <img src="{{ '/assets/img/fig_mlip_3.jpg' | relative_url }}" alt="Arrhenius comparison">
  <figcaption>Arrhenius comparison of diffusion coefficients.</figcaption>
</figure>
<figure>
  <img src="{{ '/assets/img/fig_mlip_4.jpg' | relative_url }}" alt="Force error against DFT">
  <figcaption>Force error against DFT reference data.</figcaption>
</figure>
</div>
<div class="media-text" markdown="1">
My approach is to validate before trusting: run MD with a universal MLIP (MACE), check the resulting transport trend against the AIMD results already in hand for pristine, Al-, Ga- and Ta-doped LLZO, and fine-tune on DFT reference data only where the trend breaks.

Alongside this I maintain the computational infrastructure the group's work runs on — job submission, monitoring and backup automation across a KISTI supercomputer and a shared GPU server.

The goal is a workflow where a screening campaign that would take months of AIMD becomes a few days of MD, with a quantified error bar against first-principles reference data rather than a leap of faith.
</div>
</div>

<p class="research-keywords"><strong>Keywords</strong> &nbsp;machine-learning interatomic potentials · MACE · AIMD validation · HPC workflow automation</p>
