---
layout: page
title: "Area-Selective ALD: A Computational Screening Approach"
description: Screening precursor–substrate pairs with DFT before anyone runs a deposition.
img: assets/img/project_asald.jpg
importance: 2
category: work
related_publications: false
---

A study of area-selective atomic layer deposition, and a case that first-principles screening of precursor–substrate interactions belongs upstream of the experiment rather than after it.

**Duration** March 2026 – June 2026 · **Course** Manufacturing Processes · **Role** TODO_YOUR_ROLE · **Team** TODO_TEAM_SIZE

## Motivation

Conventional deposition puts material everywhere and then removes what should not be there, which costs steps, masks and yield as feature sizes shrink. Area-selective ALD promises to place material only where the surface chemistry allows it — but whether a given precursor actually discriminates between two substrates is decided by energetics that are expensive to find by trial deposition.

## Approach

- Surveyed the limitations of conventional deposition and the mechanism by which area-selective ALD achieves its selectivity.
- Framed first-principles high-throughput screening (VASP) as the upstream filter: evaluate precursor–substrate interaction energies computationally, and send only the promising pairs to the chamber.
- Built a toy model comparing reaction energies for two precursor–substrate systems, separating an energetically unfavorable case from one where deposition stabilizes the system.

## Results

<div style="max-width:640px;">
  {% include figure.liquid loading="eager" path="assets/img/project_asald.jpg" title="Reaction energy comparison" class="img-fluid" %}
</div>
<div class="caption">
  TODO_CAPTION — the reaction-energy comparison figure from the report would fit here.
</div>

- The toy model reproduces the expected selectivity contrast: one pair unfavorable, the other stabilized by deposition.
- TODO — the actual energy values, if you want them on the page.

## Stack

**Computation** VASP · DFT · high-throughput screening  
**Domain** ALD process analysis

## Links

- Report: TODO_LINK
