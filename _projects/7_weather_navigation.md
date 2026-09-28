---
layout: page
title: Predictive Weather Navigation System
description: A route planner in C that tells you what the weather will be at each waypoint, not just at the destination.
img: assets/img/project_weather_nav.jpg
importance: 5
category: work
related_publications: false
---

A dynamic route-planning application written in C that predicts the weather at each waypoint along a route, by joining a navigation API's coordinates to a meteorological API's forecasts.

**Duration** August 2025 – December 2025 · **Course** C Programming Basic · **Role** TODO_YOUR_ROLE · **Team** TODO_TEAM_SIZE

## Motivation

A forecast for your destination is the wrong forecast. What matters on a long drive is the weather you will meet at the point you reach at the time you reach it — which means the query has to be indexed by position _and_ arrival time, not by city.

## Approach

- **Spatial.** Pulled route coordinates and waypoint timing from a navigation API.
- **Temporal.** Queried a meteorological API for the forecast at each waypoint's predicted arrival time, so the two datasets are joined on both axes.
- **Pipeline.** Built the extraction, parsing and integration layer in C — the part of the work that turned two unrelated raw feeds into one queryable structure.

## Results

<div style="max-width:640px;">
  {% include figure.liquid loading="eager" path="assets/img/project_weather_nav.jpg" title="Route with per-waypoint forecast" class="img-fluid" %}
</div>
<div class="caption">
  TODO_CAPTION — a screenshot of the output, or the route visualization.
</div>

- Per-waypoint forecasts along a planned route, resolved by arrival time.
- TODO — what the program outputs and how far ahead it can plan.

## Stack

**Language** C  
**Data** REST APIs — navigation and weather

## Links

- Code: TODO_GITHUB_REPO_URL
