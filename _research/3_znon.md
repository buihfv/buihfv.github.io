---
layout: page
title: Origin of Negative Photoconductivity in Amorphous ZnON
description: Why does an amorphous semiconductor get less conductive under light?
img: assets/img/fig_znon_1.jpg
importance: 3
category: work
---

**February 2026 – August 2026** · Materials Design and Process Engineering Laboratory · manuscript in preparation

<div class="media-row media-wide">
<div class="media-col">
<figure>
  <img src="{{ '/assets/img/fig_znon_1.jpg' | relative_url }}" alt="Amorphous ZnON model">
  <figcaption>a-ZnON model built by replicating the sputtering process with EDS-derived composition.</figcaption>
</figure>
<figure>
  <img src="{{ '/assets/img/fig_znon_2.jpg' | relative_url }}" alt="Density of states">
  <figcaption>Density of states from hybrid DFT (PBE0).</figcaption>
</figure>
</div>
<div class="media-text" markdown="1">
Amorphous zinc oxynitride (ZnON) is a high-mobility channel material for thin-film transistors, but it shows negative photoconductivity: illuminate it and the current goes _down_. That inverts the intuition every photoconductor is built on, and without a mechanism there is no way to know whether it is a defect to engineer out or a property to exploit.

The structure came first. I reproduced the experimental sputtering process computationally — Gaussian, Packmol and AIMD, with the composition fixed to EDS measurements — so that the disorder in the model is the disorder in the film rather than a convenient approximation.
</div>
</div>

<div class="media-row media-wide">
<div class="media-col">
<figure>
  <img src="{{ '/assets/img/fig_znon_3.jpg' | relative_url }}" alt="Charge localization at the VBM">
  <figcaption>N 2p-derived hole localization near the valence band maximum.</figcaption>
</figure>
<figure>
  <img src="{{ '/assets/img/fig_znon_4.jpg' | relative_url }}" alt="Charge localization at the CBM">
  <figcaption>Low-coordination Zn-derived electron localization near the conduction band minimum.</figcaption>
</figure>
</div>
<div class="media-text" markdown="1">
Hybrid DFT (PBE0) on that structure gives an electronic structure accurate enough to locate the trap states, and the answer is that there are two of them, acting together: photo-generated holes localize on N 2p states near the valence band edge, and photo-generated electrons localize on under-coordinated Zn near the conduction band edge. Both channels remove carriers from transport instead of adding them, and their trap energies quantify how deep each one sits.

The picture that emerges ties the anomaly to the disorder itself rather than to an extrinsic impurity. A manuscript is in preparation.
</div>
</div>

<p class="research-keywords"><strong>Keywords</strong> &nbsp;amorphous ZnON · negative photoconductivity · charge localization · defect physics · hybrid DFT</p>
