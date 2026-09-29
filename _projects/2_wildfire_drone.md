---
layout: page
title: Wildfire Detection Drone with AI
description: A custom quadcopter that streams live video, detects fire with YOLO, and drops water on the spot.
img: assets/img/project_wildfire_drone.jpg
importance: 7
category: work
related_publications: false
---

**TODO_START – present**

## Overview

A hand-built quadcopter that streams live video from an onboard phone camera over Wi-Fi, detects fire with a YOLO model running on a ground laptop, and releases a water payload over the detected spot — built as three independent subsystems and then integrated.

## Motivation

Early wildfire response is a detection-latency problem: the sooner a hotspot is seen and suppressed, the smaller the fire that has to be fought. Commercial detection drones exist, but they are expensive and closed. The question here is how much of that capability can be reproduced on a sub-$500 airframe with off-the-shelf parts and an open flight stack.

## Approach

- **Video streaming.** A phone mounted under the airframe runs an IP-camera app and pushes a live stream over Wi-Fi to a ground laptop, which avoids the cost and weight of a dedicated FPV video chain.
- **Fire detection.** A YOLO detector runs on the ground laptop against the incoming stream and returns bounding boxes for candidate fire regions.
- **Payload release.** An MG996 180° servo pulls a retaining pin to release the water payload, driven from the flight controller.
- **Closing the loop.** Because the camera is rigidly mounted, alignment needs no learned policy — a proportional controller driving the offset between frame centre and detection-box centre toward zero is enough. A Seeed Studio XIAO ESP32C6 running DroneBridge sits between ground station and flight controller (ESP32 → FC → servo), so alignment and release can be commanded without touching the manual RC link.

## Results & visualization

TODO — a flight clip showing the detection overlay and then the release.

- Manual mode working end to end: stream → detect → pilot flies to the hotspot → manual servo release.
- Target operating altitude 50 m; indoor gymnasium testing first, then an outdoor site.
- Automatic alignment and release: in progress.

## Impacts

TODO — what this demonstrates, and where it goes next.

## Skills

Python · YOLO · INAV flight control (SpeedyBee F405 WING MINI) · ESP32 / DroneBridge · servo actuation · airframe build and tuning

**Airframe** frame kit, 4 × 1400 KV motors, 4 × 40 A ESCs, 8045 props, 3S ~5000 mAh LiPo · HGLRC M100 GPS · 2.4 GHz ELRS link
