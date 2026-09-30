---
layout: page
title: Origin of Negative Photoconductivity in Amorphous ZnON
description: Why does amorphous ZnON become less conductive under light?
img: assets/img/thumb_znon.jpg
importance: 3
category: work
---

**February 2026 – August 2026** · Materials Design and Process Engineering Laboratory

<div class="media-row media-wide">
<div class="media-col">
<figure>
  <img src="{{ '/assets/img/res_znon_structure.jpg' | relative_url }}" alt="Amorphous ZnON structure model">
  <figcaption>Amorphous ZnON model, built by reproducing the sputtering process computationally.</figcaption>
</figure>

<figure>
  <img src="{{ '/assets/img/res_znon_hole.jpg' | relative_url }}" alt="Hole localization">
  <figcaption>Hole localization (+1e).</figcaption>
</figure>
<figure>
  <img src="{{ '/assets/img/res_znon_electron.jpg' | relative_url }}" alt="Electron localization">
  <figcaption>Electron localization (−1e).</figcaption>
</figure>
</div>
<div class="media-text" markdown="1">
Amorphous zinc oxynitride (ZnON) is a high-mobility channel material for thin-film transistors, but under illumination of a particular wavelength and intensity it shows negative photoconductivity: the current goes _down_ rather than up. That inverts the intuition every photoconductor is built on, and without a mechanism there is no way to know whether it is a defect to engineer out or a property to exploit.

The structure came first. I reproduced the experimental sputtering process computationally through Gaussian, Packmol and AIMD, with the composition fixed to EDS measurements, so that the disorder in the model is the disorder in the film rather than a convenient approximation.

Hybrid DFT (PBE0) on that structure is what resolves the electronic structure finely enough to test candidate mechanisms against it.
</div>
</div>

<p class="research-keywords"><strong>Keywords</strong> &nbsp;amorphous ZnON · negative photoconductivity · thin-film transistors · AIMD · hybrid DFT</p>
