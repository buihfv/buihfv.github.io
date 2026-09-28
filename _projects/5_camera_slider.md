---
layout: page
title: Design and Fabrication of a Linear-Actuator Camera Tracking Slider
description: A machined aluminium camera slider with Arduino-controlled actuator motion for repeatable tracking shots.
img: assets/img/project_camera_slider.jpg
importance: 6
category: work
related_publications: false
---

**March 2025 – June 2025** · Machine Production Practice

## Overview

Designed a linear-rail camera slider frame using 3D CAD, built from an aluminium block and bolted joints; selected and mounted a linear actuator motor to drive the camera along the rail; and implemented Arduino-based motor control to regulate actuator speed, direction and reciprocating motion for smooth camera tracking shots.

## Motivation

A tracking shot needs motion that is slow, even and repeatable — which is what a hand cannot do and a motor can. The course constraint was that the frame had to be machined rather than bought, so every part had to be drawn to a tolerance the shop's tools could actually hold.

## Approach

<div class="media-row">
<div class="media-col">
<figure>
  <img src="{{ '/assets/img/slider_drawing.jpg' | relative_url }}" alt="Machining drawing of a bracket with its 3D model inset">
  <figcaption>One of the machined brackets: 3D model, then a dimensioned drawing for the mill.</figcaption>
</figure>
</div>
<div class="media-text" markdown="1">
**Frame.** The slider was modelled in 3D CAD and then broken down into parts that could be produced on the machines available — each one drawn with dimensions and tolerances before anything was cut. The rail, carriage and end blocks were machined from aluminium stock and joined with bolts, so a part could be remade and swapped without rebuilding the assembly.
</div>
</div>

<div class="media-row media-wide">
<div class="media-col">
<figure>
  <img src="{{ '/assets/img/slider_assembly.jpg' | relative_url }}" alt="Assembled slider on the bench next to the control laptop">
  <figcaption>Assembled: lead screw, carriage on linear rails, stepper at the far end.</figcaption>
</figure>
<figure>
  <img src="{{ '/assets/img/slider_arduino.jpg' | relative_url }}" alt="Arduino board wired to a stepper driver and power supply">
  <figcaption>Arduino Uno driving a stepper driver from a bench supply.</figcaption>
</figure>
</div>
<div class="media-text" markdown="1">
**Drive.** A lead screw driven by a stepper motor carries the camera stage along two linear rails. The screw was chosen over a belt because a tracking pass has to be repeatable: the stage returns to the same place for the same step count, and there is no belt stretch to drift over a long take.

**Control.** An Arduino drives the motor through a stepper driver, regulating speed, direction and reciprocating motion, so a pass can be repeated identically — the same traverse at the same rate, as many times as a shot needs.
</div>
</div>

## Results & visualization

<div class="media-row media-wide">
<div class="media-col">
<figure>
  <video controls playsinline preload="metadata" muted poster="{{ '/assets/img/slider_motion_1_poster.jpg' | relative_url }}">
    <source src="{{ '/assets/video/slider_motion_1.mp4' | relative_url }}" type="video/mp4">
    Your browser does not support embedded video.
  </video>
  <figcaption>Traverse under Arduino control.</figcaption>
</figure>
<figure>
  <video controls playsinline preload="metadata" muted poster="{{ '/assets/img/slider_motion_2_poster.jpg' | relative_url }}">
    <source src="{{ '/assets/video/slider_motion_2.mp4' | relative_url }}" type="video/mp4">
    Your browser does not support embedded video.
  </video>
  <figcaption>Reciprocating pass, camera mounted.</figcaption>
</figure>
</div>
<div class="media-text" markdown="1">
The finished slider runs a full traverse under Arduino control and reverses at the end of travel without intervention, carrying a phone-sized camera on the stage.

<div class="media-pair" style="margin-top:1rem;">
<figure>
  <img src="{{ '/assets/img/slider_camera_mount.jpg' | relative_url }}" alt="Camera mounted on the slider carriage">
  <figcaption>Camera on the carriage.</figcaption>
</figure>
<figure>
  <img src="{{ '/assets/img/slider_camera_mount2.jpg' | relative_url }}" alt="Slider with camera in front of the control laptop">
  <figcaption>Full setup, ready for a pass.</figcaption>
</figure>
</div>

TODO — travel length, payload capacity, traverse speed, or repeatability if any of these were measured.
</div>
</div>

## Impacts

- Took a part from 3D model to dimensioned drawing to a machined piece that fits the assembly, which is where CAD stops being drawing and starts being manufacturing.
- Mechanism, electronics and control had to agree: a screw pitch, a step angle and a delay in the sketch are one setting expressed three ways.

## Skills

3D CAD · technical drawing · aluminium machining · lead-screw and stepper drive selection · Arduino motor control

## Resources

- Photos / video: TODO_LINK
