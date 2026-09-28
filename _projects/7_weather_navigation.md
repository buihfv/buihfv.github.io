---
layout: page
title: Weather-Aware Navigation Using Estimated Arrival Times
description: A C navigation tool that shows the forecast for each point on a route at the time you will actually be there.
img: assets/img/project_weather_nav.jpg
importance: 5
category: work
related_publications: false
---

**August 2025 – December 2025** · C Programming Basic

## Overview

Built a C navigation tool that estimates when a driver will reach each point on a route and shows the weather forecast for that point at that time, rather than a single snapshot at departure. It integrates navigation, map and Korea Meteorological Administration forecast APIs, matching estimated arrival times to hourly forecasts and sampling weather every 5 km along the route on an interactive map.

## Motivation

<div class="media-row">
<div class="media-col">
<figure>
  <img src="{{ '/assets/img/nav_motorcycle.jpg' | relative_url }}" alt="Motorcycle at night">
  <figcaption>On two wheels the question stops being academic.</figcaption>
</figure>
</div>
<div class="media-text" markdown="1">
Every navigation app answers the wrong question about weather. It shows the forecast where you are now, or where you are going — as a single snapshot taken at departure.

What actually matters on a long drive is different: the rain you will meet at the mountain pass two hours from now. That is a query indexed by _position and time together_, and no consumer app joins the two.

The gap is sharpest for anyone whose vehicle has no roof, which is where the idea came from.
</div>
</div>

## Approach

<div class="media-row media-wide">
<div class="media-col">
<figure>
  <img src="{{ '/assets/img/nav_architecture.jpg' | relative_url }}" alt="Three data sources combined by a C program into a browser map">
  <figcaption>Three public feeds — KMA forecasts, Kakao Navi, Kakao Maps — joined in C and emitted as a browser map.</figcaption>
</figure>
<figure>
  <img src="{{ '/assets/img/nav_dataflow.jpg' | relative_url }}" alt="Module-level data flow between main.c and the API headers">
  <figcaption>Module-level flow: <code>main.c</code> → geocoding → routing → forecast → HTML.</figcaption>
</figure>
</div>
<div class="media-text" markdown="1">
```
main.c            →  Kakao_local.h   →  Kakao_mobility.h  →  Kma_ultra.h   →  HTML map
origin / destination  address → coords    route geometry      per-point,      interactive
input                                     and travel time     per-time forecast   output
```

- **Geocoding.** `Kakao_local.h` turns the typed origin and destination into coordinates.
- **Route.** `Kakao_mobility.h` returns the route geometry and travel time.
- **Arrival-time estimation.** Travel time is distributed along the route by distance ratio and linearly interpolated, so any point on the path gets an estimated arrival time — if 10 km takes 100 minutes, the 3 km mark is reached at roughly 30 minutes.
- **Route compression and sampling.** The raw route carries far more vertices than the forecast grid can resolve, so the path is compressed and sampled every 5 km — enough to catch a weather front, few enough to stay inside API limits.
</div>
</div>

<div class="media-row">
<div class="media-col">
<figure>
  <img src="{{ '/assets/img/nav_grid_map.jpg' | relative_url }}" alt="KMA nationwide forecast grid">
  <figcaption>KMA publishes on its own Lambert conformal grid, not in latitude/longitude.</figcaption>
</figure>
</div>
<div class="media-text" markdown="1">
- **Coordinate conversion.** Each sample point is converted from WGS84 to the agency's grid before querying, since the forecast is indexed by grid cell rather than by coordinate.
- **Forecast matching.** `Kma_ultra.h` requests the hourly forecast for each grid cell and picks the hour matching that point's estimated arrival time — not the hour of departure.
- **Output.** The result is written as an interactive HTML map with the per-waypoint forecast attached.
</div>
</div>

## Results & visualization

<div class="media-row media-wide">
<div class="media-col">
<figure>
  <img src="{{ '/assets/img/nav_route_output.jpg' | relative_url }}" alt="Generated route map with per-waypoint forecast labels">
  <figcaption>Generated output: the route sampled every 5 km, each marker carrying the forecast for its own arrival time.</figcaption>
</figure>
<figure>
  <video controls playsinline preload="metadata" muted poster="{{ '/assets/img/nav_demo_poster.jpg' | relative_url }}">
    <source src="{{ '/assets/video/nav_demo.mp4' | relative_url }}" type="video/mp4">
    Your browser does not support embedded video.
  </video>
  <figcaption>End-to-end run: two place names typed in, map generated and opened in the browser.</figcaption>
</figure>
</div>
<div class="media-text" markdown="1">
- End-to-end working tool: type two place names, get a map whose every 5 km carries the forecast for the moment you arrive there.
- Two unrelated public APIs joined on both the spatial and the temporal axis, in C, with no libraries doing the joining.
- The output is a plain HTML file, so the result opens in any browser with no runtime beyond the program that wrote it.
</div>
</div>

## Impacts

- The whole project is a data-integration problem wearing a navigation costume — extracting, parsing and reconciling two raw external feeds with different coordinate systems and different time resolutions is the part that transfers to research work.
- Written in C without the convenience of a data-frame library, which forced the parsing and memory handling to be explicit.

## Skills

C · REST APIs (Kakao Local, Kakao Mobility, KMA forecast) · JSON parsing · WGS84 → KMA grid coordinate conversion · linear interpolation · HTML map generation

## Resources

- Code: TODO_GITHUB_REPO_URL
- Presentation slides: TODO_LINK
