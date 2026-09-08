---
layout: page
title: Automated Robotic Arm Teleoperation
description: A motion-driven robotic arm that takes over the repetitive parts of lab work through real-time teleoperation.
img: assets/img/project_robot_arm.jpg
importance: 1
category: work
related_publications: false
---

A motion-driven robotic arm that can be teleoperated in real time, built to take over the repetitive manual steps of laboratory experiments.

**Duration** March 2026 – present · **Role** TODO_YOUR_ROLE · **Team** TODO_TEAM_SIZE

## Motivation

A lot of experimental work is neither difficult nor interesting: the same pipetting, the same sample transfer, the same fixture adjustment, repeated until the run is done. Those steps are a poor use of a researcher's hours and a reliable source of human error, but they are also too varied to justify a purpose-built machine. A general-purpose arm that a person can drive remotely — and that can later learn from those demonstrations — is the middle path.

## Approach

- **Mechanics.** Arm structure designed in Autodesk Inventor and 3D printed, so the geometry could be revised between iterations at essentially no cost.
- **Control.** Motor control and the teleoperation pipeline are built on the LeRobot package rather than hand-written per-joint control code. Replacing the hard-coded approach cut the amount of bespoke code substantially and made the remote-control path usable by someone who did not write it.
- **Perception.** Computer vision provides the visual feedback that makes remote operation practical, running on Linux alongside the control stack.

## Results

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
- TODO — a concrete number if you have one: positioning accuracy, cycle time, or how much of a given experiment it now handles.
- TODO — what it cannot do yet, and what is next (autonomous replay of demonstrations?).

## Stack

**Hardware** 3D-printed arm structure · TODO_ACTUATORS · TODO_CAMERA  
**Software** LeRobot · Python · Linux  
**Design** Autodesk Inventor · 3D printing  
**Perception** Computer vision (TODO — OpenCV? a learned detector?)

## Links

- Code: TODO_GITHUB_REPO_URL
- Demo video: TODO_DEMO_URL
