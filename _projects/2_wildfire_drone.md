---
layout: page
title: Wildfire Detection Drone with AI
description: A custom quadcopter that streams live video, detects fire with YOLO, and drops water on the spot.
img: assets/img/project_wildfire_drone.jpg
importance: 2
category: work
related_publications: false
---

A hand-built quadcopter that streams live video from an onboard phone camera, detects fire with a YOLO model on a ground laptop, and releases a water payload over the detected spot.

**Duration** TODO_START – present · **Role** TODO_YOUR_ROLE (e.g. lead / flight control & automation) · **Team** TODO_TEAM_SIZE

## Motivation

Early wildfire response is a detection-latency problem: the sooner a hotspot is seen and suppressed, the smaller the fire that has to be fought. Commercial detection drones exist, but they are expensive and closed. The question here is how much of that capability can be reproduced on a sub-$500 airframe with off-the-shelf parts and an open flight stack.

## Approach

The system was built as three independent subsystems and then integrated:

- **Video streaming.** A phone mounted under the airframe runs an IP-camera app and pushes a live stream over Wi-Fi to a ground laptop, which avoids the cost and weight of a dedicated FPV/analog video chain.
- **Fire detection.** A YOLO detector runs on the ground laptop against the incoming stream and returns bounding boxes for candidate fire regions.
- **Payload release.** An MG996 180° servo pulls a retaining pin to release the water payload, driven from the flight controller.

Current work is closing the loop between detection and release. Because the camera is rigidly mounted, alignment does not need a learned policy — a proportional controller that drives the offset between the frame center and the detection-box center toward zero is enough. A Seeed Studio XIAO ESP32C6 running DroneBridge for ESP32 sits between the ground station and the flight controller (ESP32 → FC → servo) so that the alignment command and the release trigger can be issued without touching the manual RC link.

## Results

TODO: drop a flight GIF or a short clip here — detection overlay first, then the release. Replace the placeholder below.

<div style="max-width:640px;">
  {% include figure.liquid loading="eager" path="assets/img/project_wildfire_drone.jpg" title="Flight test" class="img-fluid rounded z-depth-1" %}
</div>
<div class="caption">
  TODO_CAPTION — e.g. indoor gymnasium test, detection overlay and servo release.
</div>

- Manual mode working end to end: stream → detect → pilot flies to the hotspot → manual servo release.
- Target operating altitude 50 m; indoor gymnasium testing first, then an outdoor site.
- Automatic alignment and release: in progress.

## Stack

**Airframe** frame kit, 4 × 1400 KV motors, 4 × 40 A ESCs, 8045 props, 3S ~5000 mAh LiPo  
**Flight control** SpeedyBee F405 WING MINI running INAV · HGLRC M100 GPS · 2.4 GHz ELRS link (ELRS Cha M2 18650 controller)  
**Automation** Seeed Studio XIAO ESP32C6 + DroneBridge for ESP32 · MG996 servo release  
**Software** Python · YOLO · phone IP-camera streaming

## Links

- Code: TODO_GITHUB_REPO_URL
- Demo video: TODO_DEMO_URL
