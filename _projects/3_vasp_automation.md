---
layout: page
title: Computational Workflow Automation for VASP
description: A GPU monitor and job-logging layer that tells the group what a shared compute server is actually doing.
img: assets/img/project_vasp_automation.jpg
importance: 1
category: work
related_publications: false
---

A monitoring and logging layer for the group's VASP calculations: per-GPU load and per-user occupancy on a shared external server, plus automatic records of what each job ran and how it ended.

**Duration** July 2026 – September 2026 · **Role** TODO_YOUR_ROLE · **Team** TODO_TEAM_SIZE

## Motivation

The group runs VASP across three compute servers, one of them a shared external machine with no scheduler of its own. That left a blind spot: before submitting a job there was no way to see whether the GPUs were already saturated, or by whom. People submitted into a full machine, jobs crawled, and nobody could tell why. The second blind spot came after the fact — a finished run left a directory of output files and no record of what had been asked of it.

## Approach

- **GPU monitor.** Polls the shared server and reports per-GPU utilization alongside per-user occupancy, so the answer to "can I submit now?" is one glance rather than a guess.
- **Parameter and output logging.** Captures the calculation parameters and outputs of each run automatically, so a result months later still carries the settings that produced it.
- **Completion and failure notifications.** Jobs report when they finish or die, across all three servers, instead of being discovered by chance on the next login.

## Results

<div style="max-width:640px;">
  {% include figure.liquid loading="eager" path="assets/img/project_vasp_automation.jpg" title="GPU monitor" class="img-fluid" %}
</div>
<div class="caption">
  TODO_CAPTION — a screenshot of the monitor output or the notification format works well here.
</div>

- Filled a monitoring gap the HPC scheduler did not cover, giving the group a way to check load before submitting.
- Logging and notifications running across three compute servers.
- TODO — a concrete number if you have one: jobs tracked, wasted submissions avoided, time saved.

## Stack

**Software** Python · Linux/Bash · REST APIs  
**Targets** VASP on a KISTI supercomputer, a shared GPU server, and a group workstation

## Links

- Code: TODO_GITHUB_REPO_URL
