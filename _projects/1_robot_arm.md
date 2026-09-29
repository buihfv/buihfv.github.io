---
layout: page
title: Automated Robotic Arm Teleoperation System
description: A motion-driven robotic arm that takes over the repetitive parts of lab work through real-time teleoperation.
img: assets/img/project_robot_arm.jpg
importance: 3
category: work
related_publications: false
---

**March 2026 – June 2026**

## Overview

Developed a motion-driven robotic arm system capable of real-time teleoperation, aimed at automating repetitive lab experiments and manual labor tasks, and streamlined the motor control and teleoperation pipeline by integrating the LeRobot package, replacing traditional hard-coding methods.

## Motivation

A lot of experimental work is neither difficult nor interesting: the same pipetting, the same sample transfer, the same fixture adjustment, repeated until the run is done. Those steps are a poor use of a researcher's hours and a reliable source of human error, but they are also too varied to justify a purpose-built machine. A general-purpose arm a person can drive remotely — and that can later learn from those demonstrations — is the middle path.

## Approach

- **Mechanics.** Arm structure designed in Autodesk Inventor and 3D printed, so the geometry could be revised between iterations at essentially no cost.
- **Control.** Motor control and the teleoperation pipeline built on the LeRobot package rather than hand-written per-joint control code, which cut the amount of bespoke code substantially and made the remote-control path usable by someone who did not write it.
- **Perception.** Computer vision provides the visual feedback that makes remote operation practical, running on Linux alongside the control stack.

## Results & visualization

<div class="project-video">
  <video controls playsinline preload="metadata" poster="{{ '/assets/img/project_robot_arm_poster.jpg' | relative_url }}">
    <source src="{{ '/assets/video/robot_arm_teleop.mp4' | relative_url }}" type="video/mp4">
    Your browser does not support embedded video.
  </video>
</div>
<div class="caption">
  Teleoperating the arm: the leader arm on the right drives the follower on the left in real time.
</div>

- Real-time teleoperation working end to end.
- TODO — a concrete number: positioning accuracy, cycle time, or how much of a given experiment it now handles.

## Impacts

TODO — what it replaced, who uses it, what comes next (autonomous replay of demonstrations?).

## Skills

LeRobot · computer vision · Linux · Python · Autodesk Inventor · 3D printing
