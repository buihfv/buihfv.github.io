---
layout: page
title: Analysis for Aramid-Hybrid CFRP Fishing Rod
description: Swapping the outermost CFRP ply for aramid raises impact energy absorption by 130% and turns brittle fragmentation into ductile deformation.
img: assets/img/project_fishing_rod.jpg
importance: 4
category: work
related_publications: false
---

**September 2025 – December 2025** · Fundamentals of Engineering Materials · Team of 4

## Overview

Showed in LS-DYNA that replacing the outermost CFRP ply of a tapered rod tube with aramid (AFRP) increases steel-sphere impact energy absorption by 130% and shifts failure from brittle fragmentation to ductile deformation, and proposed the CFRP–AFRP hybrid layup with a TiO₂ UV-protective coating for the aramid, to keep fishing rods reliable under intense sunlight, salt exposure and temperature swings.

## Motivation

<div class="media-row media-wide">
<div class="media-col">
<figure>
  <img src="{{ '/assets/img/rod_advantages.jpg' | relative_url }}" alt="Claimed advantages of the hybrid layup">
  <figcaption>What the hybrid is meant to buy: impact resistance, and a failure mode that does not throw fragments.</figcaption>
</figure>
</div>
<div class="media-text" markdown="1">
A fishing rod asks more of CFRP than an aircraft part does. It needs high modulus so that casting energy transfers cleanly, and vibration damping so that a faint bite is still felt — which is why rod builders reach for higher-grade fibre than aerospace uses.

The trade-off is that carbon fibre fails the way strong covalent bonds fail: all at once. Dislocations cannot move through an sp² graphite network, so there is no plastic deformation to absorb an impact — the rod shatters and the fragments scatter. In the hand of the person holding it, that is not only a broken rod.
</div>
</div>

## Approach

<div class="media-row media-wide">
<div class="media-col">
<figure>
  <img src="{{ '/assets/img/rod_material_structure.jpg' | relative_url }}" alt="Cross-section of the hybrid layup, AFRP outside and CFRP inside">
  <figcaption>The hybrid differs from the baseline in one ply: the outermost becomes AFRP.</figcaption>
</figure>
<figure>
  <img src="{{ '/assets/img/rod_lsdyna_inputs.jpg' | relative_url }}" alt="LS-DYNA material property inputs for CFRP and AFRP">
  <figcaption>Material cards: CFRP from Toray T700S and prepreg data, AFRP from the DuPont Kevlar® 49 guide.</figcaption>
</figure>
</div>
<div class="media-text" markdown="1">
The proposal was a hybrid layup: keep CFRP for stiffness, replace the outermost ply with aramid for toughness, and coat the aramid against the UV it is vulnerable to.

- **Model.** Tapered hollow tube, `*PART_COMPOSITE` with six plies, Belytschko–Tsay shell elements for bending accuracy. The hybrid model differs from the baseline in one ply — the outermost one becomes AFRP.
- **Materials.** CFRP from the Toray T700S datasheet and Toray prepreg data; AFRP from DuPont's Kevlar® 49 technical guide. Failure modelled with the Chang–Chang criterion, which accounts for both fibre and matrix failure, and a 1.3× dynamic amplification factor on static strength after Jacob et al. (2004).
- **Impact.** A rigid spherical impactor striking a fixed–fixed tube, with `*CONTACT_ERODING_SURFACE_TO_SURFACE` so that fracture and element erosion are captured rather than smeared.
</div>
</div>

## Results & visualization

<div class="media-row media-wide">
<div class="media-col">
<figure>
  <img src="{{ '/assets/img/rod_absorbed_energy.jpg' | relative_url }}" alt="Absorbed energy, CFRP versus AFRP hybrid">
  <figcaption>Energy absorbed up to failure, integrated from the force–displacement curves: +130% for the hybrid.</figcaption>
</figure>
</div>
<div class="media-text" markdown="1">
**Impact.** The single-material CFRP rod fractured almost immediately and absorbed only a fraction of the input energy. The hybrid converted far more of that energy into plastic deformation of the aramid layer — **a 130% increase in absorbed impact energy**, taken as the area under the force–displacement curve up to failure.
</div>
</div>

<div class="media-row media-wide">
<div class="media-col">
<div class="media-pair">
<figure>
  <video controls playsinline preload="metadata" muted poster="{{ '/assets/img/rod_cfrp_fracture_poster.jpg' | relative_url }}">
    <source src="{{ '/assets/video/rod_cfrp_fracture.mp4' | relative_url }}" type="video/mp4">
    Your browser does not support embedded video.
  </video>
  <figcaption>CFRP baseline — brittle fragmentation.</figcaption>
</figure>
<figure>
  <video controls playsinline preload="metadata" muted poster="{{ '/assets/img/rod_afrp_fracture_poster.jpg' | relative_url }}">
    <source src="{{ '/assets/video/rod_afrp_fracture.mp4' | relative_url }}" type="video/mp4">
    Your browser does not support embedded video.
  </video>
  <figcaption>AFRP hybrid — ductile deformation, tube intact.</figcaption>
</figure>
</div>
<div class="media-pair" style="margin-top:0.6rem;">
<figure>
  <img src="{{ '/assets/img/rod_cfrp_fracture.jpg' | relative_url }}" alt="CFRP tube at the moment of fracture, fragments scattering">
  <figcaption>Moment of failure, CFRP.</figcaption>
</figure>
<figure>
  <img src="{{ '/assets/img/rod_afrp_fracture.jpg' | relative_url }}" alt="Hybrid tube deformed but unbroken at the same instant">
  <figcaption>Same instant, hybrid.</figcaption>
</figure>
</div>
</div>
<div class="media-text" markdown="1">
**Fracture mode.** In the CFRP model, elements at the contact point exceeded failure strain and eroded in bulk: a crack propagated instantly, the tube fragmented, and pieces scattered.

In the hybrid, elements did not erode on contact — the aramid indented and stretched, held the inner CFRP cracks from running, and kept the structure recognisably intact. The two clips are the same impact on the two layups, at the same scale and time step.

For a rod held in the hand, that is the difference between a failure and an injury.
</div>
</div>

## Impacts

- One ply changed, two failure modes improved: energy absorption and fracture safety.
- The aramid's UV weakness, the obvious objection to the design, is answered with a TiO₂-loaded transparent coating that scatters and absorbs UV before it reaches the fibre, and deflects microcracks in the coating itself.
- The same hybrid logic applies wherever a stiff composite has to survive impact in the field, not only to rods.

## Skills

LS-DYNA (explicit impact, `*PART_COMPOSITE`, Chang–Chang failure, element erosion) · composite laminate design · CFRP/AFRP material selection

## Resources

- Final report: TODO_LINK
- Presentation slides: TODO_LINK
