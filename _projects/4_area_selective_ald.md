---
layout: page
title: Computational Pre-Screening for Area-Selective ALD
description: DFT adsorption energies that separate a working inhibitor–substrate pair from a failing one before anyone runs a deposition.
img: assets/img/project_asald.jpg
importance: 2
category: work
related_publications: false
---

**March 2026 – June 2026** · Manufacturing Process · Top 5 report, selected for class presentation

## Overview

Investigated area-selective ALD as a bottom-up alternative to top-down etching, where edge placement errors limit 3D transistor patterning, and proposed VASP-based pre-screening of substrate–inhibitor pairs to cut experimental time and cost. The approach is demonstrated with acetylacetone (Hacac), which adsorbs on Al₂O₃ but not on SiO₂ for hydroxylated slabs.

## Motivation

<div class="media-row">
<div class="media-col">
<figure>
  <img src="{{ '/assets/img/ald_nonuniform.jpg' | relative_url }}" alt="Poor step coverage and metal filling in a trench">
  <figcaption>Line-of-sight deposition leaves a trench sidewall thin and the fill voided.</figcaption>
</figure>
</div>
<div class="media-text" markdown="1">
As transistors moved from planar to FinFET to GAAFET, the dielectric has to coat every face of a narrow three-dimensional channel to a thickness of one to five nanometres. PVD cannot reach a sidewall. It deposits line-of-sight, so step coverage degrades exactly where the structure is tallest and the fill voids. CVD reaches further but needs temperatures above 700 °C and damages the device.
</div>
</div>

<div class="media-row media-wide">
<div class="media-col">
<figure>
  <img src="{{ '/assets/img/ald_process.jpg' | relative_url }}" alt="Four-step ALD cycle">
  <figcaption>One ALD cycle: precursor pulse, purge, co-reactant pulse, purge.</figcaption>
</figure>
<figure>
  <img src="{{ '/assets/img/ald_method_comparison.jpg' | relative_url }}" alt="Comparison of PVD, CVD, ALD and AS-ALD">
  <figcaption>PVD / CVD / ALD / AS-ALD against thickness control, conformality, defects, patterning and throughput.</figcaption>
</figure>
</div>
<div class="media-text" markdown="1">
ALD solves both. Each half-cycle is a self-limiting surface reaction: the precursor saturates the surface and then stops, so thickness is set by the number of cycles rather than by flux, and coverage is perfect on any geometry the gas can reach.

What ALD does not solve is patterning. It deposits everywhere, so anything unwanted has to be etched away afterwards, and on a complex 3D structure that etch is where edge placement error creeps in. In the comparison it is the one row where ALD is still top-down.
</div>
</div>

<div class="media-row media-wide">
<div class="media-col">
<figure>
  <img src="{{ '/assets/img/ald_inhibitor_blocking.jpg' | relative_url }}" alt="Inhibitor blocking by SAM, SMI and polymer">
  <figcaption>An inhibitor (SAM, small-molecule, or polymer) pre-coats the region that must stay bare.</figcaption>
</figure>
<figure>
  <img src="{{ '/assets/img/ald_selectivity_cube.jpg' | relative_url }}" alt="Selectivity cube of precursor, inhibitor and substrate combinations">
  <figcaption>The combinatorial space: precursor × inhibitor × substrate. Only a thin band is selective.</figcaption>
</figure>
</div>
<div class="media-text" markdown="1">
Area-selective ALD removes the etch step instead of improving it. An inhibitor is pre-coated on the regions that must stay bare, so the precursor can only adsorb where there is no inhibitor, and the pattern comes out of the deposition itself.



That moves the whole problem into chemistry. Selectivity depends on the particular combination of substrate, inhibitor and precursor, and there are dozens of plausible combinations. Some work; others fail through inhibitor penetration, decomposition, or overgrowth on the surface that was supposed to stay clean. Validating each one experimentally is exactly the time and cost that AS-ALD was meant to save.
</div>
</div>

## Approach

<div class="media-row">
<div class="media-col">
<figure>
  <img src="{{ '/assets/img/ald_theory_experiment.jpg' | relative_url }}" alt="Screening sequence from substrate-inhibitor test to experiment">
  <figcaption>The proposed order: four computational screens, then the chamber.</figcaption>
</figure>
</div>
<div class="media-text" markdown="1">
The proposal is to put DFT upstream of the chamber: compute the adsorption energy of an inhibitor on each candidate substrate first, and send only the pairs that already show a selectivity contrast to experiment.

Adsorption energy is the quantity that decides it:

$$E_{\text{ads}} = E_{\text{total}} - (E_{\text{surface}} + E_{\text{molecule}})$$

A large negative value means the molecule binds strongly and spontaneously;
a positive value means it does not stick at all.

I built hydroxylated Al₂O₃ and SiO₂ slabs, placed acetylacetone on each, and relaxed the structures in VASP.
</div>
</div>

## Results & visualization

<div class="media-row media-wide">
<div class="media-col">
<div class="media-pair">
<figure>
  <img src="{{ '/assets/img/ald_al2o3_hacac.jpg' | relative_url }}" alt="Hacac adsorbed on a hydroxylated Al2O3 slab">
  <figcaption>Al₂O₃ : E<sub>ads</sub> = −2.3 eV</figcaption>
</figure>
<figure>
  <img src="{{ '/assets/img/ald_sio2_hacac.jpg' | relative_url }}" alt="Hacac above a hydroxylated SiO2 slab">
  <figcaption>
  
  SiO₂ : E<sub>ads</sub> = +0.1 eV</figcaption>
</figure>
</div>
</div>
<div class="media-text" markdown="1">

| Surface              | E<sub>ads</sub> of Hacac | Meaning                                                  |
| -------------------- | ------------------------ | -------------------------------------------------------- |
| SiO₂ (hydroxylated)  | **+0.1 eV**              | inhibitor does not adsorb, precursor is free to deposit |
| Al₂O₃ (hydroxylated) | **−2.3 eV**              | inhibitor binds strongly, precursor is blocked          |

That is precisely the contrast area-selective ALD needs, and the mechanism behind it is acid–base. Hacac is acidic, carrying an –OH group. The SiO₂ surface is also acidic, dense with –OH: acid meeting acid gives electrostatic repulsion and a weak interaction, and the relaxed molecule stays clear of the slab. Al₂O₃ has fewer surface hydroxyls and behaves as a Lewis base, so the acidic proton of Hacac forms a strong hydrogen bond with it and the molecule locks onto the surface.
</div>
</div>

## Impacts

- Selectivity for this pair was established computationally, without any experiment.
- The same two-slab calculation generalises: any substrate–inhibitor pair can be ranked this way, which turns a combinatorial experimental search into a short list.
- Frames DFT as a process-engineering tool rather than an academic one. The screening pays for itself in chamber time.

## Skills

VASP · DFT · AVOGADRO · area-selective ALD process analysis


